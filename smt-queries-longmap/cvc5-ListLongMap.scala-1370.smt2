; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26916 () Bool)

(assert start!26916)

(declare-fun b!278981 () Bool)

(declare-fun res!142324 () Bool)

(declare-fun e!177885 () Bool)

(assert (=> b!278981 (=> (not res!142324) (not e!177885))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278981 (= res!142324 (not (= startIndex!26 i!1267)))))

(declare-fun b!278982 () Bool)

(declare-fun res!142322 () Bool)

(declare-fun e!177887 () Bool)

(assert (=> b!278982 (=> (not res!142322) (not e!177887))))

(declare-datatypes ((array!13881 0))(
  ( (array!13882 (arr!6587 (Array (_ BitVec 32) (_ BitVec 64))) (size!6939 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13881)

(declare-datatypes ((List!4395 0))(
  ( (Nil!4392) (Cons!4391 (h!5061 (_ BitVec 64)) (t!9477 List!4395)) )
))
(declare-fun arrayNoDuplicates!0 (array!13881 (_ BitVec 32) List!4395) Bool)

(assert (=> b!278982 (= res!142322 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4392))))

(declare-fun b!278983 () Bool)

(declare-fun noDuplicate!149 (List!4395) Bool)

(assert (=> b!278983 (= e!177885 (not (noDuplicate!149 Nil!4392)))))

(declare-fun b!278984 () Bool)

(declare-fun res!142320 () Bool)

(assert (=> b!278984 (=> (not res!142320) (not e!177887))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278984 (= res!142320 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278985 () Bool)

(declare-fun res!142321 () Bool)

(assert (=> b!278985 (=> (not res!142321) (not e!177887))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!278985 (= res!142321 (and (= (size!6939 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6939 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6939 a!3325))))))

(declare-fun b!278986 () Bool)

(declare-fun res!142328 () Bool)

(assert (=> b!278986 (=> (not res!142328) (not e!177885))))

(assert (=> b!278986 (= res!142328 (and (bvslt (size!6939 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6939 a!3325))))))

(declare-fun b!278987 () Bool)

(declare-fun res!142327 () Bool)

(assert (=> b!278987 (=> (not res!142327) (not e!177887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278987 (= res!142327 (validKeyInArray!0 k!2581))))

(declare-fun b!278988 () Bool)

(declare-fun res!142323 () Bool)

(assert (=> b!278988 (=> (not res!142323) (not e!177885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13881 (_ BitVec 32)) Bool)

(assert (=> b!278988 (= res!142323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!142325 () Bool)

(assert (=> start!26916 (=> (not res!142325) (not e!177887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26916 (= res!142325 (validMask!0 mask!3868))))

(assert (=> start!26916 e!177887))

(declare-fun array_inv!4550 (array!13881) Bool)

(assert (=> start!26916 (array_inv!4550 a!3325)))

(assert (=> start!26916 true))

(declare-fun b!278989 () Bool)

(declare-fun res!142326 () Bool)

(assert (=> b!278989 (=> (not res!142326) (not e!177885))))

(assert (=> b!278989 (= res!142326 (validKeyInArray!0 (select (arr!6587 a!3325) startIndex!26)))))

(declare-fun b!278990 () Bool)

(assert (=> b!278990 (= e!177887 e!177885)))

(declare-fun res!142329 () Bool)

(assert (=> b!278990 (=> (not res!142329) (not e!177885))))

(declare-datatypes ((SeekEntryResult!1745 0))(
  ( (MissingZero!1745 (index!9150 (_ BitVec 32))) (Found!1745 (index!9151 (_ BitVec 32))) (Intermediate!1745 (undefined!2557 Bool) (index!9152 (_ BitVec 32)) (x!27399 (_ BitVec 32))) (Undefined!1745) (MissingVacant!1745 (index!9153 (_ BitVec 32))) )
))
(declare-fun lt!138520 () SeekEntryResult!1745)

(assert (=> b!278990 (= res!142329 (or (= lt!138520 (MissingZero!1745 i!1267)) (= lt!138520 (MissingVacant!1745 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13881 (_ BitVec 32)) SeekEntryResult!1745)

(assert (=> b!278990 (= lt!138520 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26916 res!142325) b!278985))

(assert (= (and b!278985 res!142321) b!278987))

(assert (= (and b!278987 res!142327) b!278982))

(assert (= (and b!278982 res!142322) b!278984))

(assert (= (and b!278984 res!142320) b!278990))

(assert (= (and b!278990 res!142329) b!278988))

(assert (= (and b!278988 res!142323) b!278981))

(assert (= (and b!278981 res!142324) b!278989))

(assert (= (and b!278989 res!142326) b!278986))

(assert (= (and b!278986 res!142328) b!278983))

(declare-fun m!293883 () Bool)

(assert (=> start!26916 m!293883))

(declare-fun m!293885 () Bool)

(assert (=> start!26916 m!293885))

(declare-fun m!293887 () Bool)

(assert (=> b!278989 m!293887))

(assert (=> b!278989 m!293887))

(declare-fun m!293889 () Bool)

(assert (=> b!278989 m!293889))

(declare-fun m!293891 () Bool)

(assert (=> b!278990 m!293891))

(declare-fun m!293893 () Bool)

(assert (=> b!278982 m!293893))

(declare-fun m!293895 () Bool)

(assert (=> b!278988 m!293895))

(declare-fun m!293897 () Bool)

(assert (=> b!278984 m!293897))

(declare-fun m!293899 () Bool)

(assert (=> b!278987 m!293899))

(declare-fun m!293901 () Bool)

(assert (=> b!278983 m!293901))

(push 1)

(assert (not b!278988))

(assert (not b!278984))

(assert (not b!278987))

(assert (not start!26916))

(assert (not b!278983))

(assert (not b!278989))

(assert (not b!278990))

(assert (not b!278982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64989 () Bool)

(assert (=> d!64989 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278987 d!64989))

(declare-fun d!64993 () Bool)

(assert (=> d!64993 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26916 d!64993))

(declare-fun d!65001 () Bool)

(assert (=> d!65001 (= (array_inv!4550 a!3325) (bvsge (size!6939 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26916 d!65001))

(declare-fun d!65003 () Bool)

(declare-fun res!142411 () Bool)

(declare-fun e!177933 () Bool)

(assert (=> d!65003 (=> res!142411 e!177933)))

(assert (=> d!65003 (= res!142411 (bvsge #b00000000000000000000000000000000 (size!6939 a!3325)))))

(assert (=> d!65003 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4392) e!177933)))

(declare-fun b!279082 () Bool)

(declare-fun e!177932 () Bool)

(declare-fun e!177935 () Bool)

(assert (=> b!279082 (= e!177932 e!177935)))

(declare-fun c!45888 () Bool)

(assert (=> b!279082 (= c!45888 (validKeyInArray!0 (select (arr!6587 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279083 () Bool)

(declare-fun call!25411 () Bool)

(assert (=> b!279083 (= e!177935 call!25411)))

(declare-fun bm!25408 () Bool)

(assert (=> bm!25408 (= call!25411 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45888 (Cons!4391 (select (arr!6587 a!3325) #b00000000000000000000000000000000) Nil!4392) Nil!4392)))))

(declare-fun b!279084 () Bool)

(assert (=> b!279084 (= e!177935 call!25411)))

(declare-fun b!279085 () Bool)

(assert (=> b!279085 (= e!177933 e!177932)))

(declare-fun res!142413 () Bool)

(assert (=> b!279085 (=> (not res!142413) (not e!177932))))

(declare-fun e!177934 () Bool)

(assert (=> b!279085 (= res!142413 (not e!177934))))

(declare-fun res!142412 () Bool)

(assert (=> b!279085 (=> (not res!142412) (not e!177934))))

(assert (=> b!279085 (= res!142412 (validKeyInArray!0 (select (arr!6587 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279086 () Bool)

(declare-fun contains!1968 (List!4395 (_ BitVec 64)) Bool)

(assert (=> b!279086 (= e!177934 (contains!1968 Nil!4392 (select (arr!6587 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65003 (not res!142411)) b!279085))

(assert (= (and b!279085 res!142412) b!279086))

(assert (= (and b!279085 res!142413) b!279082))

(assert (= (and b!279082 c!45888) b!279083))

(assert (= (and b!279082 (not c!45888)) b!279084))

(assert (= (or b!279083 b!279084) bm!25408))

(declare-fun m!293955 () Bool)

(assert (=> b!279082 m!293955))

(assert (=> b!279082 m!293955))

(declare-fun m!293957 () Bool)

(assert (=> b!279082 m!293957))

(assert (=> bm!25408 m!293955))

(declare-fun m!293959 () Bool)

(assert (=> bm!25408 m!293959))

(assert (=> b!279085 m!293955))

(assert (=> b!279085 m!293955))

(assert (=> b!279085 m!293957))

(assert (=> b!279086 m!293955))

(assert (=> b!279086 m!293955))

(declare-fun m!293961 () Bool)

(assert (=> b!279086 m!293961))

(assert (=> b!278982 d!65003))

(declare-fun d!65009 () Bool)

(declare-fun res!142418 () Bool)

(declare-fun e!177946 () Bool)

(assert (=> d!65009 (=> res!142418 e!177946)))

(assert (=> d!65009 (= res!142418 (is-Nil!4392 Nil!4392))))

(assert (=> d!65009 (= (noDuplicate!149 Nil!4392) e!177946)))

(declare-fun b!279103 () Bool)

(declare-fun e!177947 () Bool)

(assert (=> b!279103 (= e!177946 e!177947)))

(declare-fun res!142419 () Bool)

(assert (=> b!279103 (=> (not res!142419) (not e!177947))))

(assert (=> b!279103 (= res!142419 (not (contains!1968 (t!9477 Nil!4392) (h!5061 Nil!4392))))))

(declare-fun b!279104 () Bool)

(assert (=> b!279104 (= e!177947 (noDuplicate!149 (t!9477 Nil!4392)))))

(assert (= (and d!65009 (not res!142418)) b!279103))

(assert (= (and b!279103 res!142419) b!279104))

(declare-fun m!293963 () Bool)

(assert (=> b!279103 m!293963))

(declare-fun m!293965 () Bool)

(assert (=> b!279104 m!293965))

(assert (=> b!278983 d!65009))

(declare-fun b!279131 () Bool)

(declare-fun e!177969 () Bool)

(declare-fun call!25417 () Bool)

(assert (=> b!279131 (= e!177969 call!25417)))

(declare-fun bm!25414 () Bool)

(assert (=> bm!25414 (= call!25417 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!279132 () Bool)

(declare-fun e!177970 () Bool)

(assert (=> b!279132 (= e!177969 e!177970)))

(declare-fun lt!138551 () (_ BitVec 64))

(assert (=> b!279132 (= lt!138551 (select (arr!6587 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8808 0))(
  ( (Unit!8809) )
))
(declare-fun lt!138552 () Unit!8808)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13881 (_ BitVec 64) (_ BitVec 32)) Unit!8808)

(assert (=> b!279132 (= lt!138552 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138551 #b00000000000000000000000000000000))))

(assert (=> b!279132 (arrayContainsKey!0 a!3325 lt!138551 #b00000000000000000000000000000000)))

(declare-fun lt!138553 () Unit!8808)

(assert (=> b!279132 (= lt!138553 lt!138552)))

(declare-fun res!142431 () Bool)

(assert (=> b!279132 (= res!142431 (= (seekEntryOrOpen!0 (select (arr!6587 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1745 #b00000000000000000000000000000000)))))

(assert (=> b!279132 (=> (not res!142431) (not e!177970))))

(declare-fun b!279133 () Bool)

(declare-fun e!177966 () Bool)

(assert (=> b!279133 (= e!177966 e!177969)))

(declare-fun c!45903 () Bool)

(assert (=> b!279133 (= c!45903 (validKeyInArray!0 (select (arr!6587 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279134 () Bool)

(assert (=> b!279134 (= e!177970 call!25417)))

(declare-fun d!65011 () Bool)

(declare-fun res!142430 () Bool)

(assert (=> d!65011 (=> res!142430 e!177966)))

(assert (=> d!65011 (= res!142430 (bvsge #b00000000000000000000000000000000 (size!6939 a!3325)))))

(assert (=> d!65011 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177966)))

(assert (= (and d!65011 (not res!142430)) b!279133))

(assert (= (and b!279133 c!45903) b!279132))

(assert (= (and b!279133 (not c!45903)) b!279131))

(assert (= (and b!279132 res!142431) b!279134))

(assert (= (or b!279134 b!279131) bm!25414))

(declare-fun m!293989 () Bool)

(assert (=> bm!25414 m!293989))

(assert (=> b!279132 m!293955))

(declare-fun m!293991 () Bool)

(assert (=> b!279132 m!293991))

(declare-fun m!293993 () Bool)

(assert (=> b!279132 m!293993))

(assert (=> b!279132 m!293955))

(declare-fun m!293995 () Bool)

(assert (=> b!279132 m!293995))

(assert (=> b!279133 m!293955))

(assert (=> b!279133 m!293955))

(assert (=> b!279133 m!293957))

(assert (=> b!278988 d!65011))

(declare-fun d!65017 () Bool)

(assert (=> d!65017 (= (validKeyInArray!0 (select (arr!6587 a!3325) startIndex!26)) (and (not (= (select (arr!6587 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6587 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278989 d!65017))

(declare-fun d!65019 () Bool)

(declare-fun res!142440 () Bool)

(declare-fun e!177979 () Bool)

(assert (=> d!65019 (=> res!142440 e!177979)))

(assert (=> d!65019 (= res!142440 (= (select (arr!6587 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!65019 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!177979)))

(declare-fun b!279147 () Bool)

(declare-fun e!177981 () Bool)

(assert (=> b!279147 (= e!177979 e!177981)))

(declare-fun res!142441 () Bool)

(assert (=> b!279147 (=> (not res!142441) (not e!177981))))

(assert (=> b!279147 (= res!142441 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6939 a!3325)))))

(declare-fun b!279148 () Bool)

(assert (=> b!279148 (= e!177981 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65019 (not res!142440)) b!279147))

(assert (= (and b!279147 res!142441) b!279148))

(assert (=> d!65019 m!293955))

(declare-fun m!293997 () Bool)

(assert (=> b!279148 m!293997))

(assert (=> b!278984 d!65019))

(declare-fun b!279214 () Bool)

(declare-fun e!178027 () SeekEntryResult!1745)

(assert (=> b!279214 (= e!178027 Undefined!1745)))

(declare-fun b!279215 () Bool)

(declare-fun e!178029 () SeekEntryResult!1745)

(declare-fun lt!138578 () SeekEntryResult!1745)

(assert (=> b!279215 (= e!178029 (Found!1745 (index!9152 lt!138578)))))

(declare-fun b!279216 () Bool)

(declare-fun e!178028 () SeekEntryResult!1745)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13881 (_ BitVec 32)) SeekEntryResult!1745)

(assert (=> b!279216 (= e!178028 (seekKeyOrZeroReturnVacant!0 (x!27399 lt!138578) (index!9152 lt!138578) (index!9152 lt!138578) k!2581 a!3325 mask!3868))))

(declare-fun d!65021 () Bool)

(declare-fun lt!138580 () SeekEntryResult!1745)

(assert (=> d!65021 (and (or (is-Undefined!1745 lt!138580) (not (is-Found!1745 lt!138580)) (and (bvsge (index!9151 lt!138580) #b00000000000000000000000000000000) (bvslt (index!9151 lt!138580) (size!6939 a!3325)))) (or (is-Undefined!1745 lt!138580) (is-Found!1745 lt!138580) (not (is-MissingZero!1745 lt!138580)) (and (bvsge (index!9150 lt!138580) #b00000000000000000000000000000000) (bvslt (index!9150 lt!138580) (size!6939 a!3325)))) (or (is-Undefined!1745 lt!138580) (is-Found!1745 lt!138580) (is-MissingZero!1745 lt!138580) (not (is-MissingVacant!1745 lt!138580)) (and (bvsge (index!9153 lt!138580) #b00000000000000000000000000000000) (bvslt (index!9153 lt!138580) (size!6939 a!3325)))) (or (is-Undefined!1745 lt!138580) (ite (is-Found!1745 lt!138580) (= (select (arr!6587 a!3325) (index!9151 lt!138580)) k!2581) (ite (is-MissingZero!1745 lt!138580) (= (select (arr!6587 a!3325) (index!9150 lt!138580)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1745 lt!138580) (= (select (arr!6587 a!3325) (index!9153 lt!138580)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65021 (= lt!138580 e!178027)))

(declare-fun c!45926 () Bool)

(assert (=> d!65021 (= c!45926 (and (is-Intermediate!1745 lt!138578) (undefined!2557 lt!138578)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13881 (_ BitVec 32)) SeekEntryResult!1745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65021 (= lt!138578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!65021 (validMask!0 mask!3868)))

(assert (=> d!65021 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!138580)))

(declare-fun b!279217 () Bool)

(declare-fun c!45927 () Bool)

(declare-fun lt!138579 () (_ BitVec 64))

(assert (=> b!279217 (= c!45927 (= lt!138579 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!279217 (= e!178029 e!178028)))

(declare-fun b!279218 () Bool)

(assert (=> b!279218 (= e!178028 (MissingZero!1745 (index!9152 lt!138578)))))

(declare-fun b!279219 () Bool)

(assert (=> b!279219 (= e!178027 e!178029)))

(assert (=> b!279219 (= lt!138579 (select (arr!6587 a!3325) (index!9152 lt!138578)))))

(declare-fun c!45925 () Bool)

(assert (=> b!279219 (= c!45925 (= lt!138579 k!2581))))

(assert (= (and d!65021 c!45926) b!279214))

