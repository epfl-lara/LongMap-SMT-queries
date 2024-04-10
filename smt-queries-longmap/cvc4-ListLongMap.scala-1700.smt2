; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31092 () Bool)

(assert start!31092)

(declare-fun b!312909 () Bool)

(declare-fun res!169371 () Bool)

(declare-fun e!195041 () Bool)

(assert (=> b!312909 (=> (not res!169371) (not e!195041))))

(declare-datatypes ((array!15994 0))(
  ( (array!15995 (arr!7579 (Array (_ BitVec 32) (_ BitVec 64))) (size!7931 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15994)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312909 (= res!169371 (and (= (select (arr!7579 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7931 a!3293))))))

(declare-fun b!312910 () Bool)

(declare-fun res!169365 () Bool)

(declare-fun e!195043 () Bool)

(assert (=> b!312910 (=> (not res!169365) (not e!195043))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312910 (= res!169365 (validKeyInArray!0 k!2441))))

(declare-fun b!312911 () Bool)

(assert (=> b!312911 (= e!195041 (bvsge resX!52 #b01111111111111111111111111111110))))

(declare-fun b!312912 () Bool)

(declare-fun res!169364 () Bool)

(assert (=> b!312912 (=> (not res!169364) (not e!195041))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2719 0))(
  ( (MissingZero!2719 (index!13052 (_ BitVec 32))) (Found!2719 (index!13053 (_ BitVec 32))) (Intermediate!2719 (undefined!3531 Bool) (index!13054 (_ BitVec 32)) (x!31252 (_ BitVec 32))) (Undefined!2719) (MissingVacant!2719 (index!13055 (_ BitVec 32))) )
))
(declare-fun lt!153354 () SeekEntryResult!2719)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15994 (_ BitVec 32)) SeekEntryResult!2719)

(assert (=> b!312912 (= res!169364 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153354))))

(declare-fun b!312913 () Bool)

(declare-fun res!169367 () Bool)

(assert (=> b!312913 (=> (not res!169367) (not e!195043))))

(assert (=> b!312913 (= res!169367 (and (= (size!7931 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7931 a!3293))))))

(declare-fun res!169370 () Bool)

(assert (=> start!31092 (=> (not res!169370) (not e!195043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31092 (= res!169370 (validMask!0 mask!3709))))

(assert (=> start!31092 e!195043))

(declare-fun array_inv!5542 (array!15994) Bool)

(assert (=> start!31092 (array_inv!5542 a!3293)))

(assert (=> start!31092 true))

(declare-fun b!312914 () Bool)

(assert (=> b!312914 (= e!195043 e!195041)))

(declare-fun res!169368 () Bool)

(assert (=> b!312914 (=> (not res!169368) (not e!195041))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312914 (= res!169368 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153354))))

(assert (=> b!312914 (= lt!153354 (Intermediate!2719 false resIndex!52 resX!52))))

(declare-fun b!312915 () Bool)

(declare-fun res!169363 () Bool)

(assert (=> b!312915 (=> (not res!169363) (not e!195043))))

(declare-fun arrayContainsKey!0 (array!15994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312915 (= res!169363 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312916 () Bool)

(declare-fun res!169369 () Bool)

(assert (=> b!312916 (=> (not res!169369) (not e!195043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15994 (_ BitVec 32)) Bool)

(assert (=> b!312916 (= res!169369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312917 () Bool)

(declare-fun res!169366 () Bool)

(assert (=> b!312917 (=> (not res!169366) (not e!195043))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15994 (_ BitVec 32)) SeekEntryResult!2719)

(assert (=> b!312917 (= res!169366 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2719 i!1240)))))

(assert (= (and start!31092 res!169370) b!312913))

(assert (= (and b!312913 res!169367) b!312910))

(assert (= (and b!312910 res!169365) b!312915))

(assert (= (and b!312915 res!169363) b!312917))

(assert (= (and b!312917 res!169366) b!312916))

(assert (= (and b!312916 res!169369) b!312914))

(assert (= (and b!312914 res!169368) b!312909))

(assert (= (and b!312909 res!169371) b!312912))

(assert (= (and b!312912 res!169364) b!312911))

(declare-fun m!323037 () Bool)

(assert (=> b!312915 m!323037))

(declare-fun m!323039 () Bool)

(assert (=> b!312916 m!323039))

(declare-fun m!323041 () Bool)

(assert (=> b!312910 m!323041))

(declare-fun m!323043 () Bool)

(assert (=> b!312914 m!323043))

(assert (=> b!312914 m!323043))

(declare-fun m!323045 () Bool)

(assert (=> b!312914 m!323045))

(declare-fun m!323047 () Bool)

(assert (=> start!31092 m!323047))

(declare-fun m!323049 () Bool)

(assert (=> start!31092 m!323049))

(declare-fun m!323051 () Bool)

(assert (=> b!312917 m!323051))

(declare-fun m!323053 () Bool)

(assert (=> b!312912 m!323053))

(declare-fun m!323055 () Bool)

(assert (=> b!312909 m!323055))

(push 1)

(assert (not start!31092))

(assert (not b!312915))

(assert (not b!312917))

(assert (not b!312914))

(assert (not b!312912))

(assert (not b!312910))

(assert (not b!312916))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!195091 () SeekEntryResult!2719)

(declare-fun b!312987 () Bool)

(declare-fun lt!153387 () SeekEntryResult!2719)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15994 (_ BitVec 32)) SeekEntryResult!2719)

(assert (=> b!312987 (= e!195091 (seekKeyOrZeroReturnVacant!0 (x!31252 lt!153387) (index!13054 lt!153387) (index!13054 lt!153387) k!2441 a!3293 mask!3709))))

(declare-fun b!312988 () Bool)

(assert (=> b!312988 (= e!195091 (MissingZero!2719 (index!13054 lt!153387)))))

(declare-fun b!312989 () Bool)

(declare-fun e!195090 () SeekEntryResult!2719)

(assert (=> b!312989 (= e!195090 (Found!2719 (index!13054 lt!153387)))))

(declare-fun b!312990 () Bool)

(declare-fun e!195089 () SeekEntryResult!2719)

(assert (=> b!312990 (= e!195089 e!195090)))

(declare-fun lt!153386 () (_ BitVec 64))

(assert (=> b!312990 (= lt!153386 (select (arr!7579 a!3293) (index!13054 lt!153387)))))

(declare-fun c!49399 () Bool)

(assert (=> b!312990 (= c!49399 (= lt!153386 k!2441))))

(declare-fun d!68491 () Bool)

(declare-fun lt!153385 () SeekEntryResult!2719)

(assert (=> d!68491 (and (or (is-Undefined!2719 lt!153385) (not (is-Found!2719 lt!153385)) (and (bvsge (index!13053 lt!153385) #b00000000000000000000000000000000) (bvslt (index!13053 lt!153385) (size!7931 a!3293)))) (or (is-Undefined!2719 lt!153385) (is-Found!2719 lt!153385) (not (is-MissingZero!2719 lt!153385)) (and (bvsge (index!13052 lt!153385) #b00000000000000000000000000000000) (bvslt (index!13052 lt!153385) (size!7931 a!3293)))) (or (is-Undefined!2719 lt!153385) (is-Found!2719 lt!153385) (is-MissingZero!2719 lt!153385) (not (is-MissingVacant!2719 lt!153385)) (and (bvsge (index!13055 lt!153385) #b00000000000000000000000000000000) (bvslt (index!13055 lt!153385) (size!7931 a!3293)))) (or (is-Undefined!2719 lt!153385) (ite (is-Found!2719 lt!153385) (= (select (arr!7579 a!3293) (index!13053 lt!153385)) k!2441) (ite (is-MissingZero!2719 lt!153385) (= (select (arr!7579 a!3293) (index!13052 lt!153385)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2719 lt!153385) (= (select (arr!7579 a!3293) (index!13055 lt!153385)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68491 (= lt!153385 e!195089)))

(declare-fun c!49400 () Bool)

(assert (=> d!68491 (= c!49400 (and (is-Intermediate!2719 lt!153387) (undefined!3531 lt!153387)))))

(assert (=> d!68491 (= lt!153387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68491 (validMask!0 mask!3709)))

(assert (=> d!68491 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!153385)))

(declare-fun b!312991 () Bool)

(assert (=> b!312991 (= e!195089 Undefined!2719)))

(declare-fun b!312992 () Bool)

(declare-fun c!49401 () Bool)

(assert (=> b!312992 (= c!49401 (= lt!153386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!312992 (= e!195090 e!195091)))

(assert (= (and d!68491 c!49400) b!312991))

(assert (= (and d!68491 (not c!49400)) b!312990))

(assert (= (and b!312990 c!49399) b!312989))

(assert (= (and b!312990 (not c!49399)) b!312992))

(assert (= (and b!312992 c!49401) b!312988))

(assert (= (and b!312992 (not c!49401)) b!312987))

(declare-fun m!323091 () Bool)

(assert (=> b!312987 m!323091))

(declare-fun m!323093 () Bool)

(assert (=> b!312990 m!323093))

(assert (=> d!68491 m!323043))

(assert (=> d!68491 m!323047))

(declare-fun m!323095 () Bool)

(assert (=> d!68491 m!323095))

(declare-fun m!323097 () Bool)

(assert (=> d!68491 m!323097))

(assert (=> d!68491 m!323043))

(assert (=> d!68491 m!323045))

(declare-fun m!323099 () Bool)

(assert (=> d!68491 m!323099))

(assert (=> b!312917 d!68491))

(declare-fun b!313035 () Bool)

(declare-fun e!195119 () Bool)

(declare-fun e!195118 () Bool)

(assert (=> b!313035 (= e!195119 e!195118)))

(declare-fun res!169413 () Bool)

(declare-fun lt!153407 () SeekEntryResult!2719)

(assert (=> b!313035 (= res!169413 (and (is-Intermediate!2719 lt!153407) (not (undefined!3531 lt!153407)) (bvslt (x!31252 lt!153407) #b01111111111111111111111111111110) (bvsge (x!31252 lt!153407) #b00000000000000000000000000000000) (bvsge (x!31252 lt!153407) x!1427)))))

(assert (=> b!313035 (=> (not res!169413) (not e!195118))))

(declare-fun b!313036 () Bool)

(declare-fun e!195117 () SeekEntryResult!2719)

(assert (=> b!313036 (= e!195117 (Intermediate!2719 true index!1781 x!1427))))

(declare-fun b!313037 () Bool)

(declare-fun e!195120 () SeekEntryResult!2719)

(assert (=> b!313037 (= e!195120 (Intermediate!2719 false index!1781 x!1427))))

(declare-fun b!313038 () Bool)

(assert (=> b!313038 (and (bvsge (index!13054 lt!153407) #b00000000000000000000000000000000) (bvslt (index!13054 lt!153407) (size!7931 a!3293)))))

(declare-fun res!169414 () Bool)

(assert (=> b!313038 (= res!169414 (= (select (arr!7579 a!3293) (index!13054 lt!153407)) k!2441))))

(declare-fun e!195121 () Bool)

(assert (=> b!313038 (=> res!169414 e!195121)))

(assert (=> b!313038 (= e!195118 e!195121)))

(declare-fun d!68501 () Bool)

(assert (=> d!68501 e!195119))

(declare-fun c!49417 () Bool)

(assert (=> d!68501 (= c!49417 (and (is-Intermediate!2719 lt!153407) (undefined!3531 lt!153407)))))

(assert (=> d!68501 (= lt!153407 e!195117)))

(declare-fun c!49419 () Bool)

(assert (=> d!68501 (= c!49419 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153408 () (_ BitVec 64))

(assert (=> d!68501 (= lt!153408 (select (arr!7579 a!3293) index!1781))))

(assert (=> d!68501 (validMask!0 mask!3709)))

(assert (=> d!68501 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153407)))

(declare-fun b!313039 () Bool)

(assert (=> b!313039 (and (bvsge (index!13054 lt!153407) #b00000000000000000000000000000000) (bvslt (index!13054 lt!153407) (size!7931 a!3293)))))

(declare-fun res!169412 () Bool)

(assert (=> b!313039 (= res!169412 (= (select (arr!7579 a!3293) (index!13054 lt!153407)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313039 (=> res!169412 e!195121)))

(declare-fun b!313040 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313040 (= e!195120 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!313041 () Bool)

(assert (=> b!313041 (= e!195117 e!195120)))

(declare-fun c!49418 () Bool)

(assert (=> b!313041 (= c!49418 (or (= lt!153408 k!2441) (= (bvadd lt!153408 lt!153408) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313042 () Bool)

(assert (=> b!313042 (= e!195119 (bvsge (x!31252 lt!153407) #b01111111111111111111111111111110))))

(declare-fun b!313043 () Bool)

(assert (=> b!313043 (and (bvsge (index!13054 lt!153407) #b00000000000000000000000000000000) (bvslt (index!13054 lt!153407) (size!7931 a!3293)))))

(assert (=> b!313043 (= e!195121 (= (select (arr!7579 a!3293) (index!13054 lt!153407)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68501 c!49419) b!313036))

(assert (= (and d!68501 (not c!49419)) b!313041))

(assert (= (and b!313041 c!49418) b!313037))

(assert (= (and b!313041 (not c!49418)) b!313040))

(assert (= (and d!68501 c!49417) b!313042))

(assert (= (and d!68501 (not c!49417)) b!313035))

(assert (= (and b!313035 res!169413) b!313038))

(assert (= (and b!313038 (not res!169414)) b!313039))

(assert (= (and b!313039 (not res!169412)) b!313043))

(declare-fun m!323113 () Bool)

(assert (=> b!313038 m!323113))

(assert (=> b!313043 m!323113))

(declare-fun m!323115 () Bool)

(assert (=> d!68501 m!323115))

(assert (=> d!68501 m!323047))

(assert (=> b!313039 m!323113))

(declare-fun m!323117 () Bool)

(assert (=> b!313040 m!323117))

(assert (=> b!313040 m!323117))

(declare-fun m!323119 () Bool)

(assert (=> b!313040 m!323119))

(assert (=> b!312912 d!68501))

(declare-fun d!68513 () Bool)

(assert (=> d!68513 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!312910 d!68513))

(declare-fun b!313070 () Bool)

(declare-fun e!195138 () Bool)

(declare-fun e!195140 () Bool)

(assert (=> b!313070 (= e!195138 e!195140)))

(declare-fun lt!153421 () (_ BitVec 64))

(assert (=> b!313070 (= lt!153421 (select (arr!7579 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9669 0))(
  ( (Unit!9670) )
))
(declare-fun lt!153419 () Unit!9669)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15994 (_ BitVec 64) (_ BitVec 32)) Unit!9669)

(assert (=> b!313070 (= lt!153419 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153421 #b00000000000000000000000000000000))))

(assert (=> b!313070 (arrayContainsKey!0 a!3293 lt!153421 #b00000000000000000000000000000000)))

(declare-fun lt!153420 () Unit!9669)

(assert (=> b!313070 (= lt!153420 lt!153419)))

(declare-fun res!169426 () Bool)

(assert (=> b!313070 (= res!169426 (= (seekEntryOrOpen!0 (select (arr!7579 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2719 #b00000000000000000000000000000000)))))

(assert (=> b!313070 (=> (not res!169426) (not e!195140))))

(declare-fun b!313071 () Bool)

(declare-fun call!25936 () Bool)

(assert (=> b!313071 (= e!195140 call!25936)))

(declare-fun b!313072 () Bool)

(assert (=> b!313072 (= e!195138 call!25936)))

(declare-fun d!68515 () Bool)

(declare-fun res!169425 () Bool)

(declare-fun e!195139 () Bool)

(assert (=> d!68515 (=> res!169425 e!195139)))

(assert (=> d!68515 (= res!169425 (bvsge #b00000000000000000000000000000000 (size!7931 a!3293)))))

(assert (=> d!68515 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195139)))

(declare-fun b!313073 () Bool)

(assert (=> b!313073 (= e!195139 e!195138)))

(declare-fun c!49428 () Bool)

(assert (=> b!313073 (= c!49428 (validKeyInArray!0 (select (arr!7579 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25933 () Bool)

(assert (=> bm!25933 (= call!25936 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!68515 (not res!169425)) b!313073))

(assert (= (and b!313073 c!49428) b!313070))

(assert (= (and b!313073 (not c!49428)) b!313072))

(assert (= (and b!313070 res!169426) b!313071))

(assert (= (or b!313071 b!313072) bm!25933))

(declare-fun m!323121 () Bool)

(assert (=> b!313070 m!323121))

(declare-fun m!323123 () Bool)

(assert (=> b!313070 m!323123))

(declare-fun m!323125 () Bool)

(assert (=> b!313070 m!323125))

(assert (=> b!313070 m!323121))

(declare-fun m!323127 () Bool)

(assert (=> b!313070 m!323127))

(assert (=> b!313073 m!323121))

(assert (=> b!313073 m!323121))

(declare-fun m!323129 () Bool)

(assert (=> b!313073 m!323129))

(declare-fun m!323131 () Bool)

(assert (=> bm!25933 m!323131))

(assert (=> b!312916 d!68515))

(declare-fun b!313083 () Bool)

(declare-fun e!195148 () Bool)

(declare-fun e!195147 () Bool)

(assert (=> b!313083 (= e!195148 e!195147)))

(declare-fun res!169431 () Bool)

(declare-fun lt!153424 () SeekEntryResult!2719)

(assert (=> b!313083 (= res!169431 (and (is-Intermediate!2719 lt!153424) (not (undefined!3531 lt!153424)) (bvslt (x!31252 lt!153424) #b01111111111111111111111111111110) (bvsge (x!31252 lt!153424) #b00000000000000000000000000000000) (bvsge (x!31252 lt!153424) #b00000000000000000000000000000000)))))

(assert (=> b!313083 (=> (not res!169431) (not e!195147))))

(declare-fun b!313084 () Bool)

(declare-fun e!195146 () SeekEntryResult!2719)

(assert (=> b!313084 (= e!195146 (Intermediate!2719 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313085 () Bool)

(declare-fun e!195149 () SeekEntryResult!2719)

(assert (=> b!313085 (= e!195149 (Intermediate!2719 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313086 () Bool)

(assert (=> b!313086 (and (bvsge (index!13054 lt!153424) #b00000000000000000000000000000000) (bvslt (index!13054 lt!153424) (size!7931 a!3293)))))

(declare-fun res!169432 () Bool)

(assert (=> b!313086 (= res!169432 (= (select (arr!7579 a!3293) (index!13054 lt!153424)) k!2441))))

(declare-fun e!195150 () Bool)

(assert (=> b!313086 (=> res!169432 e!195150)))

(assert (=> b!313086 (= e!195147 e!195150)))

(declare-fun d!68517 () Bool)

(assert (=> d!68517 e!195148))

(declare-fun c!49432 () Bool)

(assert (=> d!68517 (= c!49432 (and (is-Intermediate!2719 lt!153424) (undefined!3531 lt!153424)))))

(assert (=> d!68517 (= lt!153424 e!195146)))

(declare-fun c!49434 () Bool)

(assert (=> d!68517 (= c!49434 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

