; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45818 () Bool)

(assert start!45818)

(declare-fun b!507280 () Bool)

(declare-fun e!296875 () Bool)

(declare-fun e!296876 () Bool)

(assert (=> b!507280 (= e!296875 e!296876)))

(declare-fun res!308246 () Bool)

(assert (=> b!507280 (=> res!308246 e!296876)))

(declare-fun lt!231601 () Bool)

(declare-datatypes ((SeekEntryResult!4134 0))(
  ( (MissingZero!4134 (index!18724 (_ BitVec 32))) (Found!4134 (index!18725 (_ BitVec 32))) (Intermediate!4134 (undefined!4946 Bool) (index!18726 (_ BitVec 32)) (x!47719 (_ BitVec 32))) (Undefined!4134) (MissingVacant!4134 (index!18727 (_ BitVec 32))) )
))
(declare-fun lt!231596 () SeekEntryResult!4134)

(assert (=> b!507280 (= res!308246 (or (and (not lt!231601) (undefined!4946 lt!231596)) (and (not lt!231601) (not (undefined!4946 lt!231596)))))))

(get-info :version)

(assert (=> b!507280 (= lt!231601 (not ((_ is Intermediate!4134) lt!231596)))))

(declare-fun b!507281 () Bool)

(declare-fun res!308242 () Bool)

(declare-fun e!296880 () Bool)

(assert (=> b!507281 (=> (not res!308242) (not e!296880))))

(declare-datatypes ((array!32574 0))(
  ( (array!32575 (arr!15667 (Array (_ BitVec 32) (_ BitVec 64))) (size!16031 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32574)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32574 (_ BitVec 32)) Bool)

(assert (=> b!507281 (= res!308242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507282 () Bool)

(declare-fun res!308249 () Bool)

(assert (=> b!507282 (=> (not res!308249) (not e!296880))))

(declare-datatypes ((List!9825 0))(
  ( (Nil!9822) (Cons!9821 (h!10698 (_ BitVec 64)) (t!16053 List!9825)) )
))
(declare-fun arrayNoDuplicates!0 (array!32574 (_ BitVec 32) List!9825) Bool)

(assert (=> b!507282 (= res!308249 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9822))))

(declare-fun e!296877 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!507283 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32574 (_ BitVec 32)) SeekEntryResult!4134)

(assert (=> b!507283 (= e!296877 (= (seekEntryOrOpen!0 (select (arr!15667 a!3235) j!176) a!3235 mask!3524) (Found!4134 j!176)))))

(declare-fun b!507284 () Bool)

(declare-fun res!308243 () Bool)

(declare-fun e!296879 () Bool)

(assert (=> b!507284 (=> (not res!308243) (not e!296879))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507284 (= res!308243 (validKeyInArray!0 k0!2280))))

(declare-fun res!308240 () Bool)

(assert (=> start!45818 (=> (not res!308240) (not e!296879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45818 (= res!308240 (validMask!0 mask!3524))))

(assert (=> start!45818 e!296879))

(assert (=> start!45818 true))

(declare-fun array_inv!11463 (array!32574) Bool)

(assert (=> start!45818 (array_inv!11463 a!3235)))

(declare-fun b!507285 () Bool)

(assert (=> b!507285 (= e!296879 e!296880)))

(declare-fun res!308247 () Bool)

(assert (=> b!507285 (=> (not res!308247) (not e!296880))))

(declare-fun lt!231594 () SeekEntryResult!4134)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507285 (= res!308247 (or (= lt!231594 (MissingZero!4134 i!1204)) (= lt!231594 (MissingVacant!4134 i!1204))))))

(assert (=> b!507285 (= lt!231594 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507286 () Bool)

(assert (=> b!507286 (= e!296880 (not e!296875))))

(declare-fun res!308245 () Bool)

(assert (=> b!507286 (=> res!308245 e!296875)))

(declare-fun lt!231597 () array!32574)

(declare-fun lt!231600 () (_ BitVec 32))

(declare-fun lt!231595 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32574 (_ BitVec 32)) SeekEntryResult!4134)

(assert (=> b!507286 (= res!308245 (= lt!231596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231600 lt!231595 lt!231597 mask!3524)))))

(declare-fun lt!231599 () (_ BitVec 32))

(assert (=> b!507286 (= lt!231596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231599 (select (arr!15667 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507286 (= lt!231600 (toIndex!0 lt!231595 mask!3524))))

(assert (=> b!507286 (= lt!231595 (select (store (arr!15667 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507286 (= lt!231599 (toIndex!0 (select (arr!15667 a!3235) j!176) mask!3524))))

(assert (=> b!507286 (= lt!231597 (array!32575 (store (arr!15667 a!3235) i!1204 k0!2280) (size!16031 a!3235)))))

(assert (=> b!507286 e!296877))

(declare-fun res!308244 () Bool)

(assert (=> b!507286 (=> (not res!308244) (not e!296877))))

(assert (=> b!507286 (= res!308244 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15556 0))(
  ( (Unit!15557) )
))
(declare-fun lt!231593 () Unit!15556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15556)

(assert (=> b!507286 (= lt!231593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507287 () Bool)

(declare-fun res!308239 () Bool)

(assert (=> b!507287 (=> (not res!308239) (not e!296879))))

(assert (=> b!507287 (= res!308239 (validKeyInArray!0 (select (arr!15667 a!3235) j!176)))))

(declare-fun b!507288 () Bool)

(assert (=> b!507288 (= e!296876 true)))

(declare-fun lt!231598 () SeekEntryResult!4134)

(assert (=> b!507288 (= lt!231598 (seekEntryOrOpen!0 lt!231595 lt!231597 mask!3524))))

(assert (=> b!507288 false))

(declare-fun b!507289 () Bool)

(declare-fun res!308241 () Bool)

(assert (=> b!507289 (=> (not res!308241) (not e!296879))))

(declare-fun arrayContainsKey!0 (array!32574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507289 (= res!308241 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507290 () Bool)

(declare-fun res!308248 () Bool)

(assert (=> b!507290 (=> (not res!308248) (not e!296879))))

(assert (=> b!507290 (= res!308248 (and (= (size!16031 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16031 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16031 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45818 res!308240) b!507290))

(assert (= (and b!507290 res!308248) b!507287))

(assert (= (and b!507287 res!308239) b!507284))

(assert (= (and b!507284 res!308243) b!507289))

(assert (= (and b!507289 res!308241) b!507285))

(assert (= (and b!507285 res!308247) b!507281))

(assert (= (and b!507281 res!308242) b!507282))

(assert (= (and b!507282 res!308249) b!507286))

(assert (= (and b!507286 res!308244) b!507283))

(assert (= (and b!507286 (not res!308245)) b!507280))

(assert (= (and b!507280 (not res!308246)) b!507288))

(declare-fun m!488027 () Bool)

(assert (=> b!507281 m!488027))

(declare-fun m!488029 () Bool)

(assert (=> b!507283 m!488029))

(assert (=> b!507283 m!488029))

(declare-fun m!488031 () Bool)

(assert (=> b!507283 m!488031))

(declare-fun m!488033 () Bool)

(assert (=> b!507288 m!488033))

(assert (=> b!507286 m!488029))

(declare-fun m!488035 () Bool)

(assert (=> b!507286 m!488035))

(declare-fun m!488037 () Bool)

(assert (=> b!507286 m!488037))

(declare-fun m!488039 () Bool)

(assert (=> b!507286 m!488039))

(declare-fun m!488041 () Bool)

(assert (=> b!507286 m!488041))

(assert (=> b!507286 m!488029))

(declare-fun m!488043 () Bool)

(assert (=> b!507286 m!488043))

(assert (=> b!507286 m!488029))

(declare-fun m!488045 () Bool)

(assert (=> b!507286 m!488045))

(declare-fun m!488047 () Bool)

(assert (=> b!507286 m!488047))

(declare-fun m!488049 () Bool)

(assert (=> b!507286 m!488049))

(declare-fun m!488051 () Bool)

(assert (=> b!507289 m!488051))

(declare-fun m!488053 () Bool)

(assert (=> b!507284 m!488053))

(declare-fun m!488055 () Bool)

(assert (=> start!45818 m!488055))

(declare-fun m!488057 () Bool)

(assert (=> start!45818 m!488057))

(assert (=> b!507287 m!488029))

(assert (=> b!507287 m!488029))

(declare-fun m!488059 () Bool)

(assert (=> b!507287 m!488059))

(declare-fun m!488061 () Bool)

(assert (=> b!507282 m!488061))

(declare-fun m!488063 () Bool)

(assert (=> b!507285 m!488063))

(check-sat (not b!507286) (not b!507287) (not b!507289) (not b!507283) (not b!507288) (not b!507281) (not b!507282) (not b!507284) (not start!45818) (not b!507285))
(check-sat)
