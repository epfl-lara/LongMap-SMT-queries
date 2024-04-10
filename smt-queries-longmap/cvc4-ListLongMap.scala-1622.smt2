; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30462 () Bool)

(assert start!30462)

(declare-fun b!305052 () Bool)

(declare-fun res!162399 () Bool)

(declare-fun e!191611 () Bool)

(assert (=> b!305052 (=> (not res!162399) (not e!191611))))

(declare-datatypes ((array!15517 0))(
  ( (array!15518 (arr!7345 (Array (_ BitVec 32) (_ BitVec 64))) (size!7697 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15517)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2485 0))(
  ( (MissingZero!2485 (index!12116 (_ BitVec 32))) (Found!2485 (index!12117 (_ BitVec 32))) (Intermediate!2485 (undefined!3297 Bool) (index!12118 (_ BitVec 32)) (x!30367 (_ BitVec 32))) (Undefined!2485) (MissingVacant!2485 (index!12119 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15517 (_ BitVec 32)) SeekEntryResult!2485)

(assert (=> b!305052 (= res!162399 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2485 i!1240)))))

(declare-fun res!162397 () Bool)

(assert (=> start!30462 (=> (not res!162397) (not e!191611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30462 (= res!162397 (validMask!0 mask!3709))))

(assert (=> start!30462 e!191611))

(declare-fun array_inv!5308 (array!15517) Bool)

(assert (=> start!30462 (array_inv!5308 a!3293)))

(assert (=> start!30462 true))

(declare-fun b!305053 () Bool)

(declare-fun e!191609 () Bool)

(assert (=> b!305053 (= e!191611 e!191609)))

(declare-fun res!162403 () Bool)

(assert (=> b!305053 (=> (not res!162403) (not e!191609))))

(declare-fun lt!150596 () SeekEntryResult!2485)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15517 (_ BitVec 32)) SeekEntryResult!2485)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305053 (= res!162403 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150596))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305053 (= lt!150596 (Intermediate!2485 false resIndex!52 resX!52))))

(declare-fun b!305054 () Bool)

(declare-fun res!162400 () Bool)

(assert (=> b!305054 (=> (not res!162400) (not e!191611))))

(declare-fun arrayContainsKey!0 (array!15517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305054 (= res!162400 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305055 () Bool)

(declare-fun res!162402 () Bool)

(assert (=> b!305055 (=> (not res!162402) (not e!191611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15517 (_ BitVec 32)) Bool)

(assert (=> b!305055 (= res!162402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305056 () Bool)

(declare-fun res!162398 () Bool)

(assert (=> b!305056 (=> (not res!162398) (not e!191611))))

(assert (=> b!305056 (= res!162398 (and (= (size!7697 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7697 a!3293))))))

(declare-fun b!305057 () Bool)

(declare-fun res!162405 () Bool)

(assert (=> b!305057 (=> (not res!162405) (not e!191611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305057 (= res!162405 (validKeyInArray!0 k!2441))))

(declare-fun b!305058 () Bool)

(declare-fun e!191608 () Bool)

(declare-fun lt!150597 () (_ BitVec 32))

(assert (=> b!305058 (= e!191608 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (and (bvsge lt!150597 #b00000000000000000000000000000000) (bvslt lt!150597 (bvadd #b00000000000000000000000000000001 mask!3709))))))))

(declare-fun lt!150595 () SeekEntryResult!2485)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!305058 (= lt!150595 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150597 k!2441 a!3293 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305058 (= lt!150597 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!305059 () Bool)

(assert (=> b!305059 (= e!191609 e!191608)))

(declare-fun res!162404 () Bool)

(assert (=> b!305059 (=> (not res!162404) (not e!191608))))

(assert (=> b!305059 (= res!162404 (and (= lt!150595 lt!150596) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7345 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7345 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7345 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305059 (= lt!150595 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!305060 () Bool)

(declare-fun res!162401 () Bool)

(assert (=> b!305060 (=> (not res!162401) (not e!191609))))

(assert (=> b!305060 (= res!162401 (and (= (select (arr!7345 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7697 a!3293))))))

(assert (= (and start!30462 res!162397) b!305056))

(assert (= (and b!305056 res!162398) b!305057))

(assert (= (and b!305057 res!162405) b!305054))

(assert (= (and b!305054 res!162400) b!305052))

(assert (= (and b!305052 res!162399) b!305055))

(assert (= (and b!305055 res!162402) b!305053))

(assert (= (and b!305053 res!162403) b!305060))

(assert (= (and b!305060 res!162401) b!305059))

(assert (= (and b!305059 res!162404) b!305058))

(declare-fun m!316125 () Bool)

(assert (=> b!305059 m!316125))

(declare-fun m!316127 () Bool)

(assert (=> b!305059 m!316127))

(declare-fun m!316129 () Bool)

(assert (=> b!305054 m!316129))

(declare-fun m!316131 () Bool)

(assert (=> b!305057 m!316131))

(declare-fun m!316133 () Bool)

(assert (=> b!305060 m!316133))

(declare-fun m!316135 () Bool)

(assert (=> start!30462 m!316135))

(declare-fun m!316137 () Bool)

(assert (=> start!30462 m!316137))

(declare-fun m!316139 () Bool)

(assert (=> b!305053 m!316139))

(assert (=> b!305053 m!316139))

(declare-fun m!316141 () Bool)

(assert (=> b!305053 m!316141))

(declare-fun m!316143 () Bool)

(assert (=> b!305052 m!316143))

(declare-fun m!316145 () Bool)

(assert (=> b!305055 m!316145))

(declare-fun m!316147 () Bool)

(assert (=> b!305058 m!316147))

(declare-fun m!316149 () Bool)

(assert (=> b!305058 m!316149))

(push 1)

(assert (not b!305058))

(assert (not b!305053))

(assert (not b!305052))

(assert (not start!30462))

(assert (not b!305055))

(assert (not b!305059))

(assert (not b!305057))

(assert (not b!305054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!305151 () Bool)

(declare-fun e!191662 () SeekEntryResult!2485)

(assert (=> b!305151 (= e!191662 (Intermediate!2485 true index!1781 x!1427))))

(declare-fun b!305152 () Bool)

(declare-fun e!191665 () SeekEntryResult!2485)

(assert (=> b!305152 (= e!191665 (Intermediate!2485 false index!1781 x!1427))))

(declare-fun b!305153 () Bool)

(declare-fun e!191664 () Bool)

(declare-fun e!191663 () Bool)

(assert (=> b!305153 (= e!191664 e!191663)))

(declare-fun res!162433 () Bool)

(declare-fun lt!150629 () SeekEntryResult!2485)

(assert (=> b!305153 (= res!162433 (and (is-Intermediate!2485 lt!150629) (not (undefined!3297 lt!150629)) (bvslt (x!30367 lt!150629) #b01111111111111111111111111111110) (bvsge (x!30367 lt!150629) #b00000000000000000000000000000000) (bvsge (x!30367 lt!150629) x!1427)))))

(assert (=> b!305153 (=> (not res!162433) (not e!191663))))

(declare-fun b!305154 () Bool)

(assert (=> b!305154 (and (bvsge (index!12118 lt!150629) #b00000000000000000000000000000000) (bvslt (index!12118 lt!150629) (size!7697 a!3293)))))

(declare-fun e!191661 () Bool)

(assert (=> b!305154 (= e!191661 (= (select (arr!7345 a!3293) (index!12118 lt!150629)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68137 () Bool)

(assert (=> d!68137 e!191664))

(declare-fun c!48961 () Bool)

(assert (=> d!68137 (= c!48961 (and (is-Intermediate!2485 lt!150629) (undefined!3297 lt!150629)))))

(assert (=> d!68137 (= lt!150629 e!191662)))

(declare-fun c!48962 () Bool)

(assert (=> d!68137 (= c!48962 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!150630 () (_ BitVec 64))

(assert (=> d!68137 (= lt!150630 (select (arr!7345 a!3293) index!1781))))

(assert (=> d!68137 (validMask!0 mask!3709)))

(assert (=> d!68137 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150629)))

(declare-fun b!305155 () Bool)

(assert (=> b!305155 (= e!191665 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!305156 () Bool)

(assert (=> b!305156 (= e!191662 e!191665)))

(declare-fun c!48963 () Bool)

(assert (=> b!305156 (= c!48963 (or (= lt!150630 k!2441) (= (bvadd lt!150630 lt!150630) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305157 () Bool)

(assert (=> b!305157 (and (bvsge (index!12118 lt!150629) #b00000000000000000000000000000000) (bvslt (index!12118 lt!150629) (size!7697 a!3293)))))

(declare-fun res!162432 () Bool)

(assert (=> b!305157 (= res!162432 (= (select (arr!7345 a!3293) (index!12118 lt!150629)) k!2441))))

(assert (=> b!305157 (=> res!162432 e!191661)))

(assert (=> b!305157 (= e!191663 e!191661)))

(declare-fun b!305158 () Bool)

(assert (=> b!305158 (and (bvsge (index!12118 lt!150629) #b00000000000000000000000000000000) (bvslt (index!12118 lt!150629) (size!7697 a!3293)))))

(declare-fun res!162431 () Bool)

(assert (=> b!305158 (= res!162431 (= (select (arr!7345 a!3293) (index!12118 lt!150629)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!305158 (=> res!162431 e!191661)))

(declare-fun b!305159 () Bool)

(assert (=> b!305159 (= e!191664 (bvsge (x!30367 lt!150629) #b01111111111111111111111111111110))))

(assert (= (and d!68137 c!48962) b!305151))

(assert (= (and d!68137 (not c!48962)) b!305156))

(assert (= (and b!305156 c!48963) b!305152))

(assert (= (and b!305156 (not c!48963)) b!305155))

(assert (= (and d!68137 c!48961) b!305159))

(assert (= (and d!68137 (not c!48961)) b!305153))

(assert (= (and b!305153 res!162433) b!305157))

(assert (= (and b!305157 (not res!162432)) b!305158))

(assert (= (and b!305158 (not res!162431)) b!305154))

(declare-fun m!316173 () Bool)

(assert (=> b!305158 m!316173))

(assert (=> b!305155 m!316149))

(assert (=> b!305155 m!316149))

(declare-fun m!316175 () Bool)

(assert (=> b!305155 m!316175))

(assert (=> b!305157 m!316173))

(assert (=> b!305154 m!316173))

(assert (=> d!68137 m!316125))

(assert (=> d!68137 m!316135))

(assert (=> b!305059 d!68137))

(declare-fun b!305164 () Bool)

(declare-fun e!191671 () SeekEntryResult!2485)

(assert (=> b!305164 (= e!191671 (Intermediate!2485 true lt!150597 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!305165 () Bool)

(declare-fun e!191674 () SeekEntryResult!2485)

(assert (=> b!305165 (= e!191674 (Intermediate!2485 false lt!150597 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!305166 () Bool)

(declare-fun e!191673 () Bool)

(declare-fun e!191672 () Bool)

(assert (=> b!305166 (= e!191673 e!191672)))

(declare-fun res!162440 () Bool)

(declare-fun lt!150631 () SeekEntryResult!2485)

(assert (=> b!305166 (= res!162440 (and (is-Intermediate!2485 lt!150631) (not (undefined!3297 lt!150631)) (bvslt (x!30367 lt!150631) #b01111111111111111111111111111110) (bvsge (x!30367 lt!150631) #b00000000000000000000000000000000) (bvsge (x!30367 lt!150631) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!305166 (=> (not res!162440) (not e!191672))))

(declare-fun b!305167 () Bool)

(assert (=> b!305167 (and (bvsge (index!12118 lt!150631) #b00000000000000000000000000000000) (bvslt (index!12118 lt!150631) (size!7697 a!3293)))))

(declare-fun e!191670 () Bool)

(assert (=> b!305167 (= e!191670 (= (select (arr!7345 a!3293) (index!12118 lt!150631)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68145 () Bool)

(assert (=> d!68145 e!191673))

(declare-fun c!48964 () Bool)

(assert (=> d!68145 (= c!48964 (and (is-Intermediate!2485 lt!150631) (undefined!3297 lt!150631)))))

(assert (=> d!68145 (= lt!150631 e!191671)))

(declare-fun c!48965 () Bool)

(assert (=> d!68145 (= c!48965 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!150632 () (_ BitVec 64))

(assert (=> d!68145 (= lt!150632 (select (arr!7345 a!3293) lt!150597))))

(assert (=> d!68145 (validMask!0 mask!3709)))

(assert (=> d!68145 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150597 k!2441 a!3293 mask!3709) lt!150631)))

(declare-fun b!305168 () Bool)

(assert (=> b!305168 (= e!191674 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!150597 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!305169 () Bool)

(assert (=> b!305169 (= e!191671 e!191674)))

(declare-fun c!48966 () Bool)

(assert (=> b!305169 (= c!48966 (or (= lt!150632 k!2441) (= (bvadd lt!150632 lt!150632) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305170 () Bool)

(assert (=> b!305170 (and (bvsge (index!12118 lt!150631) #b00000000000000000000000000000000) (bvslt (index!12118 lt!150631) (size!7697 a!3293)))))

(declare-fun res!162439 () Bool)

(assert (=> b!305170 (= res!162439 (= (select (arr!7345 a!3293) (index!12118 lt!150631)) k!2441))))

(assert (=> b!305170 (=> res!162439 e!191670)))

(assert (=> b!305170 (= e!191672 e!191670)))

(declare-fun b!305171 () Bool)

(assert (=> b!305171 (and (bvsge (index!12118 lt!150631) #b00000000000000000000000000000000) (bvslt (index!12118 lt!150631) (size!7697 a!3293)))))

(declare-fun res!162438 () Bool)

(assert (=> b!305171 (= res!162438 (= (select (arr!7345 a!3293) (index!12118 lt!150631)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!305171 (=> res!162438 e!191670)))

(declare-fun b!305172 () Bool)

(assert (=> b!305172 (= e!191673 (bvsge (x!30367 lt!150631) #b01111111111111111111111111111110))))

(assert (= (and d!68145 c!48965) b!305164))

(assert (= (and d!68145 (not c!48965)) b!305169))

(assert (= (and b!305169 c!48966) b!305165))

(assert (= (and b!305169 (not c!48966)) b!305168))

(assert (= (and d!68145 c!48964) b!305172))

(assert (= (and d!68145 (not c!48964)) b!305166))

(assert (= (and b!305166 res!162440) b!305170))

(assert (= (and b!305170 (not res!162439)) b!305171))

(assert (= (and b!305171 (not res!162438)) b!305167))

(declare-fun m!316177 () Bool)

(assert (=> b!305171 m!316177))

(declare-fun m!316179 () Bool)

(assert (=> b!305168 m!316179))

(assert (=> b!305168 m!316179))

(declare-fun m!316183 () Bool)

(assert (=> b!305168 m!316183))

(assert (=> b!305170 m!316177))

(assert (=> b!305167 m!316177))

(declare-fun m!316187 () Bool)

(assert (=> d!68145 m!316187))

(assert (=> d!68145 m!316135))

(assert (=> b!305058 d!68145))

(declare-fun d!68149 () Bool)

(declare-fun lt!150635 () (_ BitVec 32))

(assert (=> d!68149 (and (bvsge lt!150635 #b00000000000000000000000000000000) (bvslt lt!150635 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68149 (= lt!150635 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68149 (validMask!0 mask!3709)))

(assert (=> d!68149 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!150635)))

(declare-fun bs!10742 () Bool)

(assert (= bs!10742 d!68149))

(declare-fun m!316189 () Bool)

(assert (=> bs!10742 m!316189))

(assert (=> bs!10742 m!316135))

(assert (=> b!305058 d!68149))

(declare-fun b!305175 () Bool)

(declare-fun e!191678 () SeekEntryResult!2485)

(assert (=> b!305175 (= e!191678 (Intermediate!2485 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!305176 () Bool)

(declare-fun e!191681 () SeekEntryResult!2485)

(assert (=> b!305176 (= e!191681 (Intermediate!2485 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!305177 () Bool)

(declare-fun e!191680 () Bool)

(declare-fun e!191679 () Bool)

(assert (=> b!305177 (= e!191680 e!191679)))

(declare-fun res!162445 () Bool)

(declare-fun lt!150636 () SeekEntryResult!2485)

(assert (=> b!305177 (= res!162445 (and (is-Intermediate!2485 lt!150636) (not (undefined!3297 lt!150636)) (bvslt (x!30367 lt!150636) #b01111111111111111111111111111110) (bvsge (x!30367 lt!150636) #b00000000000000000000000000000000) (bvsge (x!30367 lt!150636) #b00000000000000000000000000000000)))))

(assert (=> b!305177 (=> (not res!162445) (not e!191679))))

(declare-fun b!305178 () Bool)

(assert (=> b!305178 (and (bvsge (index!12118 lt!150636) #b00000000000000000000000000000000) (bvslt (index!12118 lt!150636) (size!7697 a!3293)))))

(declare-fun e!191677 () Bool)

(assert (=> b!305178 (= e!191677 (= (select (arr!7345 a!3293) (index!12118 lt!150636)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68151 () Bool)

(assert (=> d!68151 e!191680))

(declare-fun c!48967 () Bool)

(assert (=> d!68151 (= c!48967 (and (is-Intermediate!2485 lt!150636) (undefined!3297 lt!150636)))))

(assert (=> d!68151 (= lt!150636 e!191678)))

(declare-fun c!48968 () Bool)

(assert (=> d!68151 (= c!48968 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!150637 () (_ BitVec 64))

(assert (=> d!68151 (= lt!150637 (select (arr!7345 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68151 (validMask!0 mask!3709)))

(assert (=> d!68151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150636)))

(declare-fun b!305179 () Bool)

(assert (=> b!305179 (= e!191681 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!305180 () Bool)

(assert (=> b!305180 (= e!191678 e!191681)))

(declare-fun c!48969 () Bool)

(assert (=> b!305180 (= c!48969 (or (= lt!150637 k!2441) (= (bvadd lt!150637 lt!150637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305181 () Bool)

(assert (=> b!305181 (and (bvsge (index!12118 lt!150636) #b00000000000000000000000000000000) (bvslt (index!12118 lt!150636) (size!7697 a!3293)))))

(declare-fun res!162444 () Bool)

(assert (=> b!305181 (= res!162444 (= (select (arr!7345 a!3293) (index!12118 lt!150636)) k!2441))))

(assert (=> b!305181 (=> res!162444 e!191677)))

(assert (=> b!305181 (= e!191679 e!191677)))

(declare-fun b!305182 () Bool)

(assert (=> b!305182 (and (bvsge (index!12118 lt!150636) #b00000000000000000000000000000000) (bvslt (index!12118 lt!150636) (size!7697 a!3293)))))

(declare-fun res!162443 () Bool)

(assert (=> b!305182 (= res!162443 (= (select (arr!7345 a!3293) (index!12118 lt!150636)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!305182 (=> res!162443 e!191677)))

(declare-fun b!305183 () Bool)

(assert (=> b!305183 (= e!191680 (bvsge (x!30367 lt!150636) #b01111111111111111111111111111110))))

(assert (= (and d!68151 c!48968) b!305175))

(assert (= (and d!68151 (not c!48968)) b!305180))

(assert (= (and b!305180 c!48969) b!305176))

(assert (= (and b!305180 (not c!48969)) b!305179))

(assert (= (and d!68151 c!48967) b!305183))

(assert (= (and d!68151 (not c!48967)) b!305177))

(assert (= (and b!305177 res!162445) b!305181))

(assert (= (and b!305181 (not res!162444)) b!305182))

(assert (= (and b!305182 (not res!162443)) b!305178))

(declare-fun m!316191 () Bool)

(assert (=> b!305182 m!316191))

(assert (=> b!305179 m!316139))

(declare-fun m!316193 () Bool)

(assert (=> b!305179 m!316193))

(assert (=> b!305179 m!316193))

(declare-fun m!316195 () Bool)

(assert (=> b!305179 m!316195))

(assert (=> b!305181 m!316191))

(assert (=> b!305178 m!316191))

(assert (=> d!68151 m!316139))

(declare-fun m!316197 () Bool)

(assert (=> d!68151 m!316197))

(assert (=> d!68151 m!316135))

(assert (=> b!305053 d!68151))

(declare-fun d!68153 () Bool)

(declare-fun lt!150643 () (_ BitVec 32))

(declare-fun lt!150642 () (_ BitVec 32))

(assert (=> d!68153 (= lt!150643 (bvmul (bvxor lt!150642 (bvlshr lt!150642 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68153 (= lt!150642 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68153 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!162446 (let ((h!5338 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30373 (bvmul (bvxor h!5338 (bvlshr h!5338 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30373 (bvlshr x!30373 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!162446 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!162446 #b00000000000000000000000000000000))))))

(assert (=> d!68153 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!150643 (bvlshr lt!150643 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!305053 d!68153))

(declare-fun b!305270 () Bool)

(declare-fun e!191734 () SeekEntryResult!2485)

(declare-fun lt!150688 () SeekEntryResult!2485)

(assert (=> b!305270 (= e!191734 (MissingZero!2485 (index!12118 lt!150688)))))

(declare-fun b!305271 () Bool)

(declare-fun c!49003 () Bool)

(declare-fun lt!150689 () (_ BitVec 64))

(assert (=> b!305271 (= c!49003 (= lt!150689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!191732 () SeekEntryResult!2485)

(assert (=> b!305271 (= e!191732 e!191734)))

(declare-fun b!305272 () Bool)

(assert (=> b!305272 (= e!191732 (Found!2485 (index!12118 lt!150688)))))

(declare-fun b!305273 () Bool)

(declare-fun e!191733 () SeekEntryResult!2485)

(assert (=> b!305273 (= e!191733 Undefined!2485)))

(declare-fun b!305274 () Bool)

(assert (=> b!305274 (= e!191733 e!191732)))

(assert (=> b!305274 (= lt!150689 (select (arr!7345 a!3293) (index!12118 lt!150688)))))

(declare-fun c!49002 () Bool)

(assert (=> b!305274 (= c!49002 (= lt!150689 k!2441))))

(declare-fun d!68155 () Bool)

(declare-fun lt!150690 () SeekEntryResult!2485)

(assert (=> d!68155 (and (or (is-Undefined!2485 lt!150690) (not (is-Found!2485 lt!150690)) (and (bvsge (index!12117 lt!150690) #b00000000000000000000000000000000) (bvslt (index!12117 lt!150690) (size!7697 a!3293)))) (or (is-Undefined!2485 lt!150690) (is-Found!2485 lt!150690) (not (is-MissingZero!2485 lt!150690)) (and (bvsge (index!12116 lt!150690) #b00000000000000000000000000000000) (bvslt (index!12116 lt!150690) (size!7697 a!3293)))) (or (is-Undefined!2485 lt!150690) (is-Found!2485 lt!150690) (is-MissingZero!2485 lt!150690) (not (is-MissingVacant!2485 lt!150690)) (and (bvsge (index!12119 lt!150690) #b00000000000000000000000000000000) (bvslt (index!12119 lt!150690) (size!7697 a!3293)))) (or (is-Undefined!2485 lt!150690) (ite (is-Found!2485 lt!150690) (= (select (arr!7345 a!3293) (index!12117 lt!150690)) k!2441) (ite (is-MissingZero!2485 lt!150690) (= (select (arr!7345 a!3293) (index!12116 lt!150690)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2485 lt!150690) (= (select (arr!7345 a!3293) (index!12119 lt!150690)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68155 (= lt!150690 e!191733)))

(declare-fun c!49004 () Bool)

(assert (=> d!68155 (= c!49004 (and (is-Intermediate!2485 lt!150688) (undefined!3297 lt!150688)))))

(assert (=> d!68155 (= lt!150688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68155 (validMask!0 mask!3709)))

(assert (=> d!68155 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!150690)))

(declare-fun b!305275 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15517 (_ BitVec 32)) SeekEntryResult!2485)

(assert (=> b!305275 (= e!191734 (seekKeyOrZeroReturnVacant!0 (x!30367 lt!150688) (index!12118 lt!150688) (index!12118 lt!150688) k!2441 a!3293 mask!3709))))

(assert (= (and d!68155 c!49004) b!305273))

(assert (= (and d!68155 (not c!49004)) b!305274))

(assert (= (and b!305274 c!49002) b!305272))

(assert (= (and b!305274 (not c!49002)) b!305271))

(assert (= (and b!305271 c!49003) b!305270))

(assert (= (and b!305271 (not c!49003)) b!305275))

(declare-fun m!316251 () Bool)

(assert (=> b!305274 m!316251))

(declare-fun m!316253 () Bool)

(assert (=> d!68155 m!316253))

(declare-fun m!316255 () Bool)

(assert (=> d!68155 m!316255))

(declare-fun m!316257 () Bool)

(assert (=> d!68155 m!316257))

(assert (=> d!68155 m!316135))

(assert (=> d!68155 m!316139))

(assert (=> d!68155 m!316141))

(assert (=> d!68155 m!316139))

(declare-fun m!316259 () Bool)

(assert (=> b!305275 m!316259))

(assert (=> b!305052 d!68155))

(declare-fun d!68179 () Bool)

(assert (=> d!68179 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305057 d!68179))

(declare-fun b!305295 () Bool)

(declare-fun e!191752 () Bool)

(declare-fun call!25909 () Bool)

(assert (=> b!305295 (= e!191752 call!25909)))

(declare-fun bm!25906 () Bool)

(assert (=> bm!25906 (= call!25909 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!305296 () Bool)

(declare-fun e!191751 () Bool)

(declare-fun e!191750 () Bool)

(assert (=> b!305296 (= e!191751 e!191750)))

(declare-fun c!49008 () Bool)

(assert (=> b!305296 (= c!49008 (validKeyInArray!0 (select (arr!7345 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!305297 () Bool)

(assert (=> b!305297 (= e!191750 e!191752)))

(declare-fun lt!150707 () (_ BitVec 64))

(assert (=> b!305297 (= lt!150707 (select (arr!7345 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9399 0))(
  ( (Unit!9400) )
))
(declare-fun lt!150706 () Unit!9399)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15517 (_ BitVec 64) (_ BitVec 32)) Unit!9399)

(assert (=> b!305297 (= lt!150706 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!150707 #b00000000000000000000000000000000))))

(assert (=> b!305297 (arrayContainsKey!0 a!3293 lt!150707 #b00000000000000000000000000000000)))

(declare-fun lt!150708 () Unit!9399)

(assert (=> b!305297 (= lt!150708 lt!150706)))

(declare-fun res!162483 () Bool)

(assert (=> b!305297 (= res!162483 (= (seekEntryOrOpen!0 (select (arr!7345 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2485 #b00000000000000000000000000000000)))))

(assert (=> b!305297 (=> (not res!162483) (not e!191752))))

(declare-fun b!305294 () Bool)

(assert (=> b!305294 (= e!191750 call!25909)))

(declare-fun d!68181 () Bool)

(declare-fun res!162482 () Bool)

(assert (=> d!68181 (=> res!162482 e!191751)))

(assert (=> d!68181 (= res!162482 (bvsge #b00000000000000000000000000000000 (size!7697 a!3293)))))

(assert (=> d!68181 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!191751)))

(assert (= (and d!68181 (not res!162482)) b!305296))

(assert (= (and b!305296 c!49008) b!305297))

(assert (= (and b!305296 (not c!49008)) b!305294))

(assert (= (and b!305297 res!162483) b!305295))

(assert (= (or b!305295 b!305294) bm!25906))

(declare-fun m!316275 () Bool)

(assert (=> bm!25906 m!316275))

(declare-fun m!316277 () Bool)

(assert (=> b!305296 m!316277))

(assert (=> b!305296 m!316277))

(declare-fun m!316279 () Bool)

(assert (=> b!305296 m!316279))

(assert (=> b!305297 m!316277))

(declare-fun m!316281 () Bool)

(assert (=> b!305297 m!316281))

(declare-fun m!316283 () Bool)

(assert (=> b!305297 m!316283))

(assert (=> b!305297 m!316277))

(declare-fun m!316285 () Bool)

(assert (=> b!305297 m!316285))

(assert (=> b!305055 d!68181))

(declare-fun d!68189 () Bool)

(declare-fun res!162488 () Bool)

(declare-fun e!191757 () Bool)

(assert (=> d!68189 (=> res!162488 e!191757)))

(assert (=> d!68189 (= res!162488 (= (select (arr!7345 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68189 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!191757)))

(declare-fun b!305302 () Bool)

(declare-fun e!191758 () Bool)

(assert (=> b!305302 (= e!191757 e!191758)))

(declare-fun res!162489 () Bool)

(assert (=> b!305302 (=> (not res!162489) (not e!191758))))

(assert (=> b!305302 (= res!162489 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7697 a!3293)))))

(declare-fun b!305303 () Bool)

(assert (=> b!305303 (= e!191758 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68189 (not res!162488)) b!305302))

(assert (= (and b!305302 res!162489) b!305303))

(assert (=> d!68189 m!316277))

(declare-fun m!316287 () Bool)

(assert (=> b!305303 m!316287))

(assert (=> b!305054 d!68189))

(declare-fun d!68193 () Bool)

(assert (=> d!68193 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30462 d!68193))

(declare-fun d!68195 () Bool)

(assert (=> d!68195 (= (array_inv!5308 a!3293) (bvsge (size!7697 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30462 d!68195))

(push 1)

