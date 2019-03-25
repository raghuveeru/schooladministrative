const db = {
    students: [
        {
            id: 1,
            student: 'studentone@gmail.com',
            teachers: [1],
            suspend: 1,
            notifications: []
        },
        {
            id: 2,
            student: 'studenttwo@gmail.com',
            teachers: [1],
            suspend: 1,
            notifications: []
        },
        {
            id: 3,
            student: 'studentthree@gmail.com',
            teachers: [1],
            suspend: 1,
            notifications: []
        },
        {
            id: 4,
            student: 'studentfour@gmail.com',
            teachers: [1],
            suspend: 1,
            notifications: []
        }
    ],

    teachers: [
        {
            id: 1,
            is_suspended: false
        },
        {
            id: 2,
            is_suspended: false
        }
    ],
    notifications: [
        {
            id: 1,
            teacher_id: 1,
            student_id: 1,
            notifications: 'Notification Message'
        }
    ]
}

module.exports = db;