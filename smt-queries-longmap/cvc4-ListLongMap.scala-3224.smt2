; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45094 () Bool)

(assert start!45094)

(declare-fun b!495073 () Bool)

(declare-fun res!297643 () Bool)

(declare-fun e!290449 () Bool)

(assert (=> b!495073 (=> (not res!297643) (not e!290449))))

(declare-datatypes ((array!32039 0))(
  ( (array!32040 (arr!15404 (Array (_ BitVec 32) (_ BitVec 64))) (size!15768 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32039)

(declare-datatypes ((List!9562 0))(
  ( (Nil!9559) (Cons!9558 (h!10426 (_ BitVec 64)) (t!15790 List!9562)) )
))
(declare-fun arrayNoDuplicates!0 (array!32039 (_ BitVec 32) List!9562) Bool)

(assert (=> b!495073 (= res!297643 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9559))))

(declare-fun b!495074 () Bool)

(declare-fun res!297653 () Bool)

(assert (=> b!495074 (=> (not res!297653) (not e!290449))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32039 (_ BitVec 32)) Bool)

(assert (=> b!495074 (= res!297653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495076 () Bool)

(declare-fun e!290450 () Bool)

(assert (=> b!495076 (= e!290450 e!290449)))

(declare-fun res!297652 () Bool)

(assert (=> b!495076 (=> (not res!297652) (not e!290449))))

(declare-datatypes ((SeekEntryResult!3871 0))(
  ( (MissingZero!3871 (index!17663 (_ BitVec 32))) (Found!3871 (index!17664 (_ BitVec 32))) (Intermediate!3871 (undefined!4683 Bool) (index!17665 (_ BitVec 32)) (x!46725 (_ BitVec 32))) (Undefined!3871) (MissingVacant!3871 (index!17666 (_ BitVec 32))) )
))
(declare-fun lt!224128 () SeekEntryResult!3871)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495076 (= res!297652 (or (= lt!224128 (MissingZero!3871 i!1204)) (= lt!224128 (MissingVacant!3871 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32039 (_ BitVec 32)) SeekEntryResult!3871)

(assert (=> b!495076 (= lt!224128 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495077 () Bool)

(declare-fun res!297645 () Bool)

(assert (=> b!495077 (=> (not res!297645) (not e!290450))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495077 (= res!297645 (and (= (size!15768 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15768 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15768 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495078 () Bool)

(declare-fun res!297647 () Bool)

(assert (=> b!495078 (=> (not res!297647) (not e!290450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495078 (= res!297647 (validKeyInArray!0 k!2280))))

(declare-fun lt!224127 () SeekEntryResult!3871)

(declare-fun e!290447 () Bool)

(declare-fun b!495079 () Bool)

(assert (=> b!495079 (= e!290447 (or (not (= (select (arr!15404 a!3235) (index!17665 lt!224127)) (select (arr!15404 a!3235) j!176))) (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!495079 (and (bvslt (x!46725 lt!224127) #b01111111111111111111111111111110) (or (= (select (arr!15404 a!3235) (index!17665 lt!224127)) (select (arr!15404 a!3235) j!176)) (= (select (arr!15404 a!3235) (index!17665 lt!224127)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15404 a!3235) (index!17665 lt!224127)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495080 () Bool)

(declare-fun res!297650 () Bool)

(assert (=> b!495080 (=> res!297650 e!290447)))

(assert (=> b!495080 (= res!297650 (or (undefined!4683 lt!224127) (not (is-Intermediate!3871 lt!224127))))))

(declare-fun b!495081 () Bool)

(declare-fun e!290448 () Bool)

(assert (=> b!495081 (= e!290448 (= (seekEntryOrOpen!0 (select (arr!15404 a!3235) j!176) a!3235 mask!3524) (Found!3871 j!176)))))

(declare-fun b!495082 () Bool)

(declare-fun res!297646 () Bool)

(assert (=> b!495082 (=> (not res!297646) (not e!290450))))

(assert (=> b!495082 (= res!297646 (validKeyInArray!0 (select (arr!15404 a!3235) j!176)))))

(declare-fun b!495083 () Bool)

(declare-fun res!297651 () Bool)

(assert (=> b!495083 (=> (not res!297651) (not e!290450))))

(declare-fun arrayContainsKey!0 (array!32039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495083 (= res!297651 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!297644 () Bool)

(assert (=> start!45094 (=> (not res!297644) (not e!290450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45094 (= res!297644 (validMask!0 mask!3524))))

(assert (=> start!45094 e!290450))

(assert (=> start!45094 true))

(declare-fun array_inv!11200 (array!32039) Bool)

(assert (=> start!45094 (array_inv!11200 a!3235)))

(declare-fun b!495075 () Bool)

(assert (=> b!495075 (= e!290449 (not e!290447))))

(declare-fun res!297649 () Bool)

(assert (=> b!495075 (=> res!297649 e!290447)))

(declare-fun lt!224124 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32039 (_ BitVec 32)) SeekEntryResult!3871)

(assert (=> b!495075 (= res!297649 (= lt!224127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224124 (select (store (arr!15404 a!3235) i!1204 k!2280) j!176) (array!32040 (store (arr!15404 a!3235) i!1204 k!2280) (size!15768 a!3235)) mask!3524)))))

(declare-fun lt!224126 () (_ BitVec 32))

(assert (=> b!495075 (= lt!224127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224126 (select (arr!15404 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495075 (= lt!224124 (toIndex!0 (select (store (arr!15404 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495075 (= lt!224126 (toIndex!0 (select (arr!15404 a!3235) j!176) mask!3524))))

(assert (=> b!495075 e!290448))

(declare-fun res!297648 () Bool)

(assert (=> b!495075 (=> (not res!297648) (not e!290448))))

(assert (=> b!495075 (= res!297648 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14688 0))(
  ( (Unit!14689) )
))
(declare-fun lt!224125 () Unit!14688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14688)

(assert (=> b!495075 (= lt!224125 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45094 res!297644) b!495077))

(assert (= (and b!495077 res!297645) b!495082))

(assert (= (and b!495082 res!297646) b!495078))

(assert (= (and b!495078 res!297647) b!495083))

(assert (= (and b!495083 res!297651) b!495076))

(assert (= (and b!495076 res!297652) b!495074))

(assert (= (and b!495074 res!297653) b!495073))

(assert (= (and b!495073 res!297643) b!495075))

(assert (= (and b!495075 res!297648) b!495081))

(assert (= (and b!495075 (not res!297649)) b!495080))

(assert (= (and b!495080 (not res!297650)) b!495079))

(declare-fun m!476233 () Bool)

(assert (=> b!495079 m!476233))

(declare-fun m!476235 () Bool)

(assert (=> b!495079 m!476235))

(declare-fun m!476237 () Bool)

(assert (=> b!495076 m!476237))

(assert (=> b!495082 m!476235))

(assert (=> b!495082 m!476235))

(declare-fun m!476239 () Bool)

(assert (=> b!495082 m!476239))

(declare-fun m!476241 () Bool)

(assert (=> start!45094 m!476241))

(declare-fun m!476243 () Bool)

(assert (=> start!45094 m!476243))

(assert (=> b!495081 m!476235))

(assert (=> b!495081 m!476235))

(declare-fun m!476245 () Bool)

(assert (=> b!495081 m!476245))

(declare-fun m!476247 () Bool)

(assert (=> b!495075 m!476247))

(declare-fun m!476249 () Bool)

(assert (=> b!495075 m!476249))

(declare-fun m!476251 () Bool)

(assert (=> b!495075 m!476251))

(assert (=> b!495075 m!476235))

(declare-fun m!476253 () Bool)

(assert (=> b!495075 m!476253))

(assert (=> b!495075 m!476251))

(declare-fun m!476255 () Bool)

(assert (=> b!495075 m!476255))

(assert (=> b!495075 m!476251))

(declare-fun m!476257 () Bool)

(assert (=> b!495075 m!476257))

(assert (=> b!495075 m!476235))

(declare-fun m!476259 () Bool)

(assert (=> b!495075 m!476259))

(assert (=> b!495075 m!476235))

(declare-fun m!476261 () Bool)

(assert (=> b!495075 m!476261))

(declare-fun m!476263 () Bool)

(assert (=> b!495074 m!476263))

(declare-fun m!476265 () Bool)

(assert (=> b!495073 m!476265))

(declare-fun m!476267 () Bool)

(assert (=> b!495078 m!476267))

(declare-fun m!476269 () Bool)

(assert (=> b!495083 m!476269))

(push 1)

(assert (not start!45094))

(assert (not b!495078))

(assert (not b!495073))

(assert (not b!495076))

(assert (not b!495075))

(assert (not b!495081))

(assert (not b!495083))

(assert (not b!495082))

(assert (not b!495074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78251 () Bool)

(declare-fun res!297671 () Bool)

(declare-fun e!290468 () Bool)

(assert (=> d!78251 (=> res!297671 e!290468)))

(assert (=> d!78251 (= res!297671 (= (select (arr!15404 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!78251 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!290468)))

(declare-fun b!495100 () Bool)

(declare-fun e!290469 () Bool)

(assert (=> b!495100 (= e!290468 e!290469)))

(declare-fun res!297672 () Bool)

(assert (=> b!495100 (=> (not res!297672) (not e!290469))))

(assert (=> b!495100 (= res!297672 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15768 a!3235)))))

(declare-fun b!495101 () Bool)

(assert (=> b!495101 (= e!290469 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78251 (not res!297671)) b!495100))

(assert (= (and b!495100 res!297672) b!495101))

(declare-fun m!476279 () Bool)

(assert (=> d!78251 m!476279))

(declare-fun m!476281 () Bool)

(assert (=> b!495101 m!476281))

(assert (=> b!495083 d!78251))

(declare-fun d!78257 () Bool)

(assert (=> d!78257 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45094 d!78257))

(declare-fun d!78265 () Bool)

(assert (=> d!78265 (= (array_inv!11200 a!3235) (bvsge (size!15768 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45094 d!78265))

(declare-fun d!78267 () Bool)

(assert (=> d!78267 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!495078 d!78267))

(declare-fun b!495171 () Bool)

(declare-fun e!290510 () SeekEntryResult!3871)

(declare-fun lt!224167 () SeekEntryResult!3871)

(assert (=> b!495171 (= e!290510 (Found!3871 (index!17665 lt!224167)))))

(declare-fun e!290511 () SeekEntryResult!3871)

(declare-fun b!495172 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32039 (_ BitVec 32)) SeekEntryResult!3871)

(assert (=> b!495172 (= e!290511 (seekKeyOrZeroReturnVacant!0 (x!46725 lt!224167) (index!17665 lt!224167) (index!17665 lt!224167) (select (arr!15404 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!78269 () Bool)

(declare-fun lt!224169 () SeekEntryResult!3871)

(assert (=> d!78269 (and (or (is-Undefined!3871 lt!224169) (not (is-Found!3871 lt!224169)) (and (bvsge (index!17664 lt!224169) #b00000000000000000000000000000000) (bvslt (index!17664 lt!224169) (size!15768 a!3235)))) (or (is-Undefined!3871 lt!224169) (is-Found!3871 lt!224169) (not (is-MissingZero!3871 lt!224169)) (and (bvsge (index!17663 lt!224169) #b00000000000000000000000000000000) (bvslt (index!17663 lt!224169) (size!15768 a!3235)))) (or (is-Undefined!3871 lt!224169) (is-Found!3871 lt!224169) (is-MissingZero!3871 lt!224169) (not (is-MissingVacant!3871 lt!224169)) (and (bvsge (index!17666 lt!224169) #b00000000000000000000000000000000) (bvslt (index!17666 lt!224169) (size!15768 a!3235)))) (or (is-Undefined!3871 lt!224169) (ite (is-Found!3871 lt!224169) (= (select (arr!15404 a!3235) (index!17664 lt!224169)) (select (arr!15404 a!3235) j!176)) (ite (is-MissingZero!3871 lt!224169) (= (select (arr!15404 a!3235) (index!17663 lt!224169)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3871 lt!224169) (= (select (arr!15404 a!3235) (index!17666 lt!224169)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!290509 () SeekEntryResult!3871)

(assert (=> d!78269 (= lt!224169 e!290509)))

(declare-fun c!59018 () Bool)

(assert (=> d!78269 (= c!59018 (and (is-Intermediate!3871 lt!224167) (undefined!4683 lt!224167)))))

(assert (=> d!78269 (= lt!224167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15404 a!3235) j!176) mask!3524) (select (arr!15404 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78269 (validMask!0 mask!3524)))

(assert (=> d!78269 (= (seekEntryOrOpen!0 (select (arr!15404 a!3235) j!176) a!3235 mask!3524) lt!224169)))

(declare-fun b!495173 () Bool)

(assert (=> b!495173 (= e!290511 (MissingZero!3871 (index!17665 lt!224167)))))

(declare-fun b!495174 () Bool)

(declare-fun c!59017 () Bool)

(declare-fun lt!224168 () (_ BitVec 64))

(assert (=> b!495174 (= c!59017 (= lt!224168 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495174 (= e!290510 e!290511)))

(declare-fun b!495175 () Bool)

(assert (=> b!495175 (= e!290509 e!290510)))

(assert (=> b!495175 (= lt!224168 (select (arr!15404 a!3235) (index!17665 lt!224167)))))

(declare-fun c!59016 () Bool)

(assert (=> b!495175 (= c!59016 (= lt!224168 (select (arr!15404 a!3235) j!176)))))

(declare-fun b!495176 () Bool)

(assert (=> b!495176 (= e!290509 Undefined!3871)))

(assert (= (and d!78269 c!59018) b!495176))

(assert (= (and d!78269 (not c!59018)) b!495175))

(assert (= (and b!495175 c!59016) b!495171))

(assert (= (and b!495175 (not c!59016)) b!495174))

(assert (= (and b!495174 c!59017) b!495173))

(assert (= (and b!495174 (not c!59017)) b!495172))

(assert (=> b!495172 m!476235))

(declare-fun m!476311 () Bool)

(assert (=> b!495172 m!476311))

(assert (=> d!78269 m!476241))

(assert (=> d!78269 m!476235))

(assert (=> d!78269 m!476259))

(assert (=> d!78269 m!476259))

(assert (=> d!78269 m!476235))

(declare-fun m!476313 () Bool)

(assert (=> d!78269 m!476313))

(declare-fun m!476315 () Bool)

(assert (=> d!78269 m!476315))

(declare-fun m!476317 () Bool)

(assert (=> d!78269 m!476317))

(declare-fun m!476319 () Bool)

(assert (=> d!78269 m!476319))

(declare-fun m!476321 () Bool)

(assert (=> b!495175 m!476321))

(assert (=> b!495081 d!78269))

(declare-fun b!495185 () Bool)

(declare-fun e!290519 () SeekEntryResult!3871)

(declare-fun lt!224179 () SeekEntryResult!3871)

(assert (=> b!495185 (= e!290519 (Found!3871 (index!17665 lt!224179)))))

(declare-fun b!495186 () Bool)

(declare-fun e!290520 () SeekEntryResult!3871)

(assert (=> b!495186 (= e!290520 (seekKeyOrZeroReturnVacant!0 (x!46725 lt!224179) (index!17665 lt!224179) (index!17665 lt!224179) k!2280 a!3235 mask!3524))))

(declare-fun d!78279 () Bool)

(declare-fun lt!224182 () SeekEntryResult!3871)

(assert (=> d!78279 (and (or (is-Undefined!3871 lt!224182) (not (is-Found!3871 lt!224182)) (and (bvsge (index!17664 lt!224182) #b00000000000000000000000000000000) (bvslt (index!17664 lt!224182) (size!15768 a!3235)))) (or (is-Undefined!3871 lt!224182) (is-Found!3871 lt!224182) (not (is-MissingZero!3871 lt!224182)) (and (bvsge (index!17663 lt!224182) #b00000000000000000000000000000000) (bvslt (index!17663 lt!224182) (size!15768 a!3235)))) (or (is-Undefined!3871 lt!224182) (is-Found!3871 lt!224182) (is-MissingZero!3871 lt!224182) (not (is-MissingVacant!3871 lt!224182)) (and (bvsge (index!17666 lt!224182) #b00000000000000000000000000000000) (bvslt (index!17666 lt!224182) (size!15768 a!3235)))) (or (is-Undefined!3871 lt!224182) (ite (is-Found!3871 lt!224182) (= (select (arr!15404 a!3235) (index!17664 lt!224182)) k!2280) (ite (is-MissingZero!3871 lt!224182) (= (select (arr!15404 a!3235) (index!17663 lt!224182)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3871 lt!224182) (= (select (arr!15404 a!3235) (index!17666 lt!224182)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!290518 () SeekEntryResult!3871)

(assert (=> d!78279 (= lt!224182 e!290518)))

(declare-fun c!59024 () Bool)

(assert (=> d!78279 (= c!59024 (and (is-Intermediate!3871 lt!224179) (undefined!4683 lt!224179)))))

(assert (=> d!78279 (= lt!224179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78279 (validMask!0 mask!3524)))

(assert (=> d!78279 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!224182)))

(declare-fun b!495187 () Bool)

(assert (=> b!495187 (= e!290520 (MissingZero!3871 (index!17665 lt!224179)))))

(declare-fun b!495188 () Bool)

(declare-fun c!59022 () Bool)

(declare-fun lt!224180 () (_ BitVec 64))

(assert (=> b!495188 (= c!59022 (= lt!224180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495188 (= e!290519 e!290520)))

(declare-fun b!495189 () Bool)

(assert (=> b!495189 (= e!290518 e!290519)))

(assert (=> b!495189 (= lt!224180 (select (arr!15404 a!3235) (index!17665 lt!224179)))))

(declare-fun c!59021 () Bool)

(assert (=> b!495189 (= c!59021 (= lt!224180 k!2280))))

(declare-fun b!495190 () Bool)

(assert (=> b!495190 (= e!290518 Undefined!3871)))

(assert (= (and d!78279 c!59024) b!495190))

(assert (= (and d!78279 (not c!59024)) b!495189))

(assert (= (and b!495189 c!59021) b!495185))

(assert (= (and b!495189 (not c!59021)) b!495188))

(assert (= (and b!495188 c!59022) b!495187))

(assert (= (and b!495188 (not c!59022)) b!495186))

(declare-fun m!476323 () Bool)

(assert (=> b!495186 m!476323))

(assert (=> d!78279 m!476241))

(declare-fun m!476325 () Bool)

(assert (=> d!78279 m!476325))

(assert (=> d!78279 m!476325))

(declare-fun m!476327 () Bool)

(assert (=> d!78279 m!476327))

(declare-fun m!476331 () Bool)

(assert (=> d!78279 m!476331))

(declare-fun m!476333 () Bool)

(assert (=> d!78279 m!476333))

(declare-fun m!476335 () Bool)

(assert (=> d!78279 m!476335))

(declare-fun m!476339 () Bool)

(assert (=> b!495189 m!476339))

(assert (=> b!495076 d!78279))

(declare-fun d!78281 () Bool)

(assert (=> d!78281 (= (validKeyInArray!0 (select (arr!15404 a!3235) j!176)) (and (not (= (select (arr!15404 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15404 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!495082 d!78281))

(declare-fun d!78283 () Bool)

(declare-fun lt!224192 () (_ BitVec 32))

(declare-fun lt!224191 () (_ BitVec 32))

(assert (=> d!78283 (= lt!224192 (bvmul (bvxor lt!224191 (bvlshr lt!224191 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78283 (= lt!224191 ((_ extract 31 0) (bvand (bvxor (select (arr!15404 a!3235) j!176) (bvlshr (select (arr!15404 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78283 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!297695 (let ((h!10428 ((_ extract 31 0) (bvand (bvxor (select (arr!15404 a!3235) j!176) (bvlshr (select (arr!15404 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46728 (bvmul (bvxor h!10428 (bvlshr h!10428 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46728 (bvlshr x!46728 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!297695 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!297695 #b00000000000000000000000000000000))))))

(assert (=> d!78283 (= (toIndex!0 (select (arr!15404 a!3235) j!176) mask!3524) (bvand (bvxor lt!224192 (bvlshr lt!224192 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!495075 d!78283))

(declare-fun b!495279 () Bool)

(declare-fun lt!224214 () SeekEntryResult!3871)

(assert (=> b!495279 (and (bvsge (index!17665 lt!224214) #b00000000000000000000000000000000) (bvslt (index!17665 lt!224214) (size!15768 a!3235)))))

(declare-fun res!297720 () Bool)

(assert (=> b!495279 (= res!297720 (= (select (arr!15404 a!3235) (index!17665 lt!224214)) (select (arr!15404 a!3235) j!176)))))

(declare-fun e!290577 () Bool)

(assert (=> b!495279 (=> res!297720 e!290577)))

(declare-fun e!290576 () Bool)

(assert (=> b!495279 (= e!290576 e!290577)))

(declare-fun b!495280 () Bool)

(declare-fun e!290575 () Bool)

(assert (=> b!495280 (= e!290575 e!290576)))

(declare-fun res!297721 () Bool)

(assert (=> b!495280 (= res!297721 (and (is-Intermediate!3871 lt!224214) (not (undefined!4683 lt!224214)) (bvslt (x!46725 lt!224214) #b01111111111111111111111111111110) (bvsge (x!46725 lt!224214) #b00000000000000000000000000000000) (bvsge (x!46725 lt!224214) #b00000000000000000000000000000000)))))

(assert (=> b!495280 (=> (not res!297721) (not e!290576))))

(declare-fun b!495281 () Bool)

(declare-fun e!290579 () SeekEntryResult!3871)

(declare-fun e!290578 () SeekEntryResult!3871)

(assert (=> b!495281 (= e!290579 e!290578)))

(declare-fun c!59055 () Bool)

(declare-fun lt!224213 () (_ BitVec 64))

(assert (=> b!495281 (= c!59055 (or (= lt!224213 (select (arr!15404 a!3235) j!176)) (= (bvadd lt!224213 lt!224213) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495283 () Bool)

(assert (=> b!495283 (= e!290575 (bvsge (x!46725 lt!224214) #b01111111111111111111111111111110))))

(declare-fun b!495284 () Bool)

(assert (=> b!495284 (and (bvsge (index!17665 lt!224214) #b00000000000000000000000000000000) (bvslt (index!17665 lt!224214) (size!15768 a!3235)))))

(assert (=> b!495284 (= e!290577 (= (select (arr!15404 a!3235) (index!17665 lt!224214)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!495285 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495285 (= e!290578 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!224126 #b00000000000000000000000000000000 mask!3524) (select (arr!15404 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!495286 () Bool)

(assert (=> b!495286 (and (bvsge (index!17665 lt!224214) #b00000000000000000000000000000000) (bvslt (index!17665 lt!224214) (size!15768 a!3235)))))

(declare-fun res!297719 () Bool)

(assert (=> b!495286 (= res!297719 (= (select (arr!15404 a!3235) (index!17665 lt!224214)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495286 (=> res!297719 e!290577)))

(declare-fun b!495287 () Bool)

(assert (=> b!495287 (= e!290578 (Intermediate!3871 false lt!224126 #b00000000000000000000000000000000))))

(declare-fun b!495282 () Bool)

(assert (=> b!495282 (= e!290579 (Intermediate!3871 true lt!224126 #b00000000000000000000000000000000))))

(declare-fun d!78291 () Bool)

(assert (=> d!78291 e!290575))

(declare-fun c!59057 () Bool)

(assert (=> d!78291 (= c!59057 (and (is-Intermediate!3871 lt!224214) (undefined!4683 lt!224214)))))

(assert (=> d!78291 (= lt!224214 e!290579)))

(declare-fun c!59056 () Bool)

(assert (=> d!78291 (= c!59056 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78291 (= lt!224213 (select (arr!15404 a!3235) lt!224126))))

(assert (=> d!78291 (validMask!0 mask!3524)))

(assert (=> d!78291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224126 (select (arr!15404 a!3235) j!176) a!3235 mask!3524) lt!224214)))

(assert (= (and d!78291 c!59056) b!495282))

(assert (= (and d!78291 (not c!59056)) b!495281))

(assert (= (and b!495281 c!59055) b!495287))

(assert (= (and b!495281 (not c!59055)) b!495285))

(assert (= (and d!78291 c!59057) b!495283))

(assert (= (and d!78291 (not c!59057)) b!495280))

(assert (= (and b!495280 res!297721) b!495279))

(assert (= (and b!495279 (not res!297720)) b!495286))

(assert (= (and b!495286 (not res!297719)) b!495284))

(declare-fun m!476387 () Bool)

(assert (=> d!78291 m!476387))

(assert (=> d!78291 m!476241))

(declare-fun m!476389 () Bool)

(assert (=> b!495279 m!476389))

(assert (=> b!495284 m!476389))

(declare-fun m!476391 () Bool)

(assert (=> b!495285 m!476391))

(assert (=> b!495285 m!476391))

(assert (=> b!495285 m!476235))

(declare-fun m!476393 () Bool)

(assert (=> b!495285 m!476393))

(assert (=> b!495286 m!476389))

(assert (=> b!495075 d!78291))

(declare-fun b!495330 () Bool)

(declare-fun e!290607 () Bool)

(declare-fun e!290609 () Bool)

(assert (=> b!495330 (= e!290607 e!290609)))

(declare-fun lt!224229 () (_ BitVec 64))

(assert (=> b!495330 (= lt!224229 (select (arr!15404 a!3235) j!176))))

(declare-fun lt!224231 () Unit!14688)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32039 (_ BitVec 64) (_ BitVec 32)) Unit!14688)

(assert (=> b!495330 (= lt!224231 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!224229 j!176))))

(assert (=> b!495330 (arrayContainsKey!0 a!3235 lt!224229 #b00000000000000000000000000000000)))

(declare-fun lt!224230 () Unit!14688)

(assert (=> b!495330 (= lt!224230 lt!224231)))

(declare-fun res!297741 () Bool)

(assert (=> b!495330 (= res!297741 (= (seekEntryOrOpen!0 (select (arr!15404 a!3235) j!176) a!3235 mask!3524) (Found!3871 j!176)))))

(assert (=> b!495330 (=> (not res!297741) (not e!290609))))

(declare-fun b!495331 () Bool)

(declare-fun e!290608 () Bool)

(assert (=> b!495331 (= e!290608 e!290607)))

(declare-fun c!59070 () Bool)

(assert (=> b!495331 (= c!59070 (validKeyInArray!0 (select (arr!15404 a!3235) j!176)))))

(declare-fun d!78299 () Bool)

(declare-fun res!297742 () Bool)

(assert (=> d!78299 (=> res!297742 e!290608)))

(assert (=> d!78299 (= res!297742 (bvsge j!176 (size!15768 a!3235)))))

(assert (=> d!78299 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!290608)))

(declare-fun bm!31422 () Bool)

(declare-fun call!31425 () Bool)

(assert (=> bm!31422 (= call!31425 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!495332 () Bool)

(assert (=> b!495332 (= e!290609 call!31425)))

(declare-fun b!495333 () Bool)

(assert (=> b!495333 (= e!290607 call!31425)))

(assert (= (and d!78299 (not res!297742)) b!495331))

(assert (= (and b!495331 c!59070) b!495330))

(assert (= (and b!495331 (not c!59070)) b!495333))

(assert (= (and b!495330 res!297741) b!495332))

(assert (= (or b!495332 b!495333) bm!31422))

(assert (=> b!495330 m!476235))

(declare-fun m!476429 () Bool)

(assert (=> b!495330 m!476429))

(declare-fun m!476431 () Bool)

(assert (=> b!495330 m!476431))

(assert (=> b!495330 m!476235))

(assert (=> b!495330 m!476245))

(assert (=> b!495331 m!476235))

(assert (=> b!495331 m!476235))

(assert (=> b!495331 m!476239))

(declare-fun m!476433 () Bool)

(assert (=> bm!31422 m!476433))

(assert (=> b!495075 d!78299))

(declare-fun b!495334 () Bool)

(declare-fun lt!224233 () SeekEntryResult!3871)

(assert (=> b!495334 (and (bvsge (index!17665 lt!224233) #b00000000000000000000000000000000) (bvslt (index!17665 lt!224233) (size!15768 (array!32040 (store (arr!15404 a!3235) i!1204 k!2280) (size!15768 a!3235)))))))

(declare-fun res!297744 () Bool)

(assert (=> b!495334 (= res!297744 (= (select (arr!15404 (array!32040 (store (arr!15404 a!3235) i!1204 k!2280) (size!15768 a!3235))) (index!17665 lt!224233)) (select (store (arr!15404 a!3235) i!1204 k!2280) j!176)))))

(declare-fun e!290612 () Bool)

(assert (=> b!495334 (=> res!297744 e!290612)))

(declare-fun e!290611 () Bool)

(assert (=> b!495334 (= e!290611 e!290612)))

(declare-fun b!495335 () Bool)

(declare-fun e!290610 () Bool)

(assert (=> b!495335 (= e!290610 e!290611)))

(declare-fun res!297745 () Bool)

(assert (=> b!495335 (= res!297745 (and (is-Intermediate!3871 lt!224233) (not (undefined!4683 lt!224233)) (bvslt (x!46725 lt!224233) #b01111111111111111111111111111110) (bvsge (x!46725 lt!224233) #b00000000000000000000000000000000) (bvsge (x!46725 lt!224233) #b00000000000000000000000000000000)))))

(assert (=> b!495335 (=> (not res!297745) (not e!290611))))

(declare-fun b!495336 () Bool)

(declare-fun e!290614 () SeekEntryResult!3871)

(declare-fun e!290613 () SeekEntryResult!3871)

(assert (=> b!495336 (= e!290614 e!290613)))

(declare-fun lt!224232 () (_ BitVec 64))

(declare-fun c!59071 () Bool)

(assert (=> b!495336 (= c!59071 (or (= lt!224232 (select (store (arr!15404 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!224232 lt!224232) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495338 () Bool)

(assert (=> b!495338 (= e!290610 (bvsge (x!46725 lt!224233) #b01111111111111111111111111111110))))

(declare-fun b!495339 () Bool)

(assert (=> b!495339 (and (bvsge (index!17665 lt!224233) #b00000000000000000000000000000000) (bvslt (index!17665 lt!224233) (size!15768 (array!32040 (store (arr!15404 a!3235) i!1204 k!2280) (size!15768 a!3235)))))))

(assert (=> b!495339 (= e!290612 (= (select (arr!15404 (array!32040 (store (arr!15404 a!3235) i!1204 k!2280) (size!15768 a!3235))) (index!17665 lt!224233)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!495340 () Bool)

(assert (=> b!495340 (= e!290613 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!224124 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15404 a!3235) i!1204 k!2280) j!176) (array!32040 (store (arr!15404 a!3235) i!1204 k!2280) (size!15768 a!3235)) mask!3524))))

(declare-fun b!495341 () Bool)

(assert (=> b!495341 (and (bvsge (index!17665 lt!224233) #b00000000000000000000000000000000) (bvslt (index!17665 lt!224233) (size!15768 (array!32040 (store (arr!15404 a!3235) i!1204 k!2280) (size!15768 a!3235)))))))

(declare-fun res!297743 () Bool)

(assert (=> b!495341 (= res!297743 (= (select (arr!15404 (array!32040 (store (arr!15404 a!3235) i!1204 k!2280) (size!15768 a!3235))) (index!17665 lt!224233)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!495341 (=> res!297743 e!290612)))

(declare-fun b!495342 () Bool)

(assert (=> b!495342 (= e!290613 (Intermediate!3871 false lt!224124 #b00000000000000000000000000000000))))

(declare-fun b!495337 () Bool)

(assert (=> b!495337 (= e!290614 (Intermediate!3871 true lt!224124 #b00000000000000000000000000000000))))

(declare-fun d!78309 () Bool)

(assert (=> d!78309 e!290610))

(declare-fun c!59073 () Bool)

(assert (=> d!78309 (= c!59073 (and (is-Intermediate!3871 lt!224233) (undefined!4683 lt!224233)))))

(assert (=> d!78309 (= lt!224233 e!290614)))

(declare-fun c!59072 () Bool)

(assert (=> d!78309 (= c!59072 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78309 (= lt!224232 (select (arr!15404 (array!32040 (store (arr!15404 a!3235) i!1204 k!2280) (size!15768 a!3235))) lt!224124))))

(assert (=> d!78309 (validMask!0 mask!3524)))

(assert (=> d!78309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224124 (select (store (arr!15404 a!3235) i!1204 k!2280) j!176) (array!32040 (store (arr!15404 a!3235) i!1204 k!2280) (size!15768 a!3235)) mask!3524) lt!224233)))

(assert (= (and d!78309 c!59072) b!495337))

(assert (= (and d!78309 (not c!59072)) b!495336))

(assert (= (and b!495336 c!59071) b!495342))

(assert (= (and b!495336 (not c!59071)) b!495340))

(assert (= (and d!78309 c!59073) b!495338))

(assert (= (and d!78309 (not c!59073)) b!495335))

(assert (= (and b!495335 res!297745) b!495334))

(assert (= (and b!495334 (not res!297744)) b!495341))

(assert (= (and b!495341 (not res!297743)) b!495339))

(declare-fun m!476435 () Bool)

(assert (=> d!78309 m!476435))

(assert (=> d!78309 m!476241))

(declare-fun m!476437 () Bool)

(assert (=> b!495334 m!476437))

(assert (=> b!495339 m!476437))

(declare-fun m!476439 () Bool)

(assert (=> b!495340 m!476439))

(assert (=> b!495340 m!476439))

(assert (=> b!495340 m!476251))

(declare-fun m!476441 () Bool)

(assert (=> b!495340 m!476441))

(assert (=> b!495341 m!476437))

(assert (=> b!495075 d!78309))

(declare-fun d!78311 () Bool)

(assert (=> d!78311 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!224245 () Unit!14688)

(declare-fun choose!38 (array!32039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14688)

(assert (=> d!78311 (= lt!224245 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78311 (validMask!0 mask!3524)))

(assert (=> d!78311 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!224245)))

(declare-fun bs!15782 () Bool)

(assert (= bs!15782 d!78311))

(assert (=> bs!15782 m!476253))

(declare-fun m!476449 () Bool)

(assert (=> bs!15782 m!476449))

(assert (=> bs!15782 m!476241))

(assert (=> b!495075 d!78311))

(declare-fun d!78317 () Bool)

(declare-fun lt!224247 () (_ BitVec 32))

(declare-fun lt!224246 () (_ BitVec 32))

(assert (=> d!78317 (= lt!224247 (bvmul (bvxor lt!224246 (bvlshr lt!224246 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78317 (= lt!224246 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15404 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15404 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

