; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45764 () Bool)

(assert start!45764)

(declare-fun b!506389 () Bool)

(declare-fun res!307357 () Bool)

(declare-fun e!296392 () Bool)

(assert (=> b!506389 (=> (not res!307357) (not e!296392))))

(declare-datatypes ((array!32520 0))(
  ( (array!32521 (arr!15640 (Array (_ BitVec 32) (_ BitVec 64))) (size!16004 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32520)

(declare-datatypes ((List!9798 0))(
  ( (Nil!9795) (Cons!9794 (h!10671 (_ BitVec 64)) (t!16026 List!9798)) )
))
(declare-fun arrayNoDuplicates!0 (array!32520 (_ BitVec 32) List!9798) Bool)

(assert (=> b!506389 (= res!307357 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9795))))

(declare-fun b!506390 () Bool)

(declare-fun res!307350 () Bool)

(declare-fun e!296390 () Bool)

(assert (=> b!506390 (=> (not res!307350) (not e!296390))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!506390 (= res!307350 (and (= (size!16004 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16004 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16004 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506391 () Bool)

(declare-fun res!307358 () Bool)

(assert (=> b!506391 (=> (not res!307358) (not e!296392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32520 (_ BitVec 32)) Bool)

(assert (=> b!506391 (= res!307358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!307356 () Bool)

(assert (=> start!45764 (=> (not res!307356) (not e!296390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45764 (= res!307356 (validMask!0 mask!3524))))

(assert (=> start!45764 e!296390))

(assert (=> start!45764 true))

(declare-fun array_inv!11436 (array!32520) Bool)

(assert (=> start!45764 (array_inv!11436 a!3235)))

(declare-fun b!506392 () Bool)

(assert (=> b!506392 (= e!296390 e!296392)))

(declare-fun res!307348 () Bool)

(assert (=> b!506392 (=> (not res!307348) (not e!296392))))

(declare-datatypes ((SeekEntryResult!4107 0))(
  ( (MissingZero!4107 (index!18616 (_ BitVec 32))) (Found!4107 (index!18617 (_ BitVec 32))) (Intermediate!4107 (undefined!4919 Bool) (index!18618 (_ BitVec 32)) (x!47620 (_ BitVec 32))) (Undefined!4107) (MissingVacant!4107 (index!18619 (_ BitVec 32))) )
))
(declare-fun lt!231069 () SeekEntryResult!4107)

(assert (=> b!506392 (= res!307348 (or (= lt!231069 (MissingZero!4107 i!1204)) (= lt!231069 (MissingVacant!4107 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32520 (_ BitVec 32)) SeekEntryResult!4107)

(assert (=> b!506392 (= lt!231069 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506393 () Bool)

(declare-fun res!307351 () Bool)

(assert (=> b!506393 (=> (not res!307351) (not e!296390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506393 (= res!307351 (validKeyInArray!0 k0!2280))))

(declare-fun b!506394 () Bool)

(declare-fun e!296391 () Bool)

(assert (=> b!506394 (= e!296391 true)))

(assert (=> b!506394 false))

(declare-fun b!506395 () Bool)

(declare-fun res!307352 () Bool)

(assert (=> b!506395 (=> (not res!307352) (not e!296390))))

(assert (=> b!506395 (= res!307352 (validKeyInArray!0 (select (arr!15640 a!3235) j!176)))))

(declare-fun e!296389 () Bool)

(declare-fun b!506396 () Bool)

(assert (=> b!506396 (= e!296389 (= (seekEntryOrOpen!0 (select (arr!15640 a!3235) j!176) a!3235 mask!3524) (Found!4107 j!176)))))

(declare-fun b!506397 () Bool)

(declare-fun e!296393 () Bool)

(assert (=> b!506397 (= e!296393 e!296391)))

(declare-fun res!307349 () Bool)

(assert (=> b!506397 (=> res!307349 e!296391)))

(declare-fun lt!231070 () Bool)

(declare-fun lt!231065 () SeekEntryResult!4107)

(assert (=> b!506397 (= res!307349 (or (and (not lt!231070) (undefined!4919 lt!231065)) (and (not lt!231070) (not (undefined!4919 lt!231065)))))))

(get-info :version)

(assert (=> b!506397 (= lt!231070 (not ((_ is Intermediate!4107) lt!231065)))))

(declare-fun b!506398 () Bool)

(declare-fun res!307354 () Bool)

(assert (=> b!506398 (=> (not res!307354) (not e!296390))))

(declare-fun arrayContainsKey!0 (array!32520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506398 (= res!307354 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506399 () Bool)

(assert (=> b!506399 (= e!296392 (not e!296393))))

(declare-fun res!307355 () Bool)

(assert (=> b!506399 (=> res!307355 e!296393)))

(declare-fun lt!231068 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32520 (_ BitVec 32)) SeekEntryResult!4107)

(assert (=> b!506399 (= res!307355 (= lt!231065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231068 (select (store (arr!15640 a!3235) i!1204 k0!2280) j!176) (array!32521 (store (arr!15640 a!3235) i!1204 k0!2280) (size!16004 a!3235)) mask!3524)))))

(declare-fun lt!231067 () (_ BitVec 32))

(assert (=> b!506399 (= lt!231065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231067 (select (arr!15640 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506399 (= lt!231068 (toIndex!0 (select (store (arr!15640 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506399 (= lt!231067 (toIndex!0 (select (arr!15640 a!3235) j!176) mask!3524))))

(assert (=> b!506399 e!296389))

(declare-fun res!307353 () Bool)

(assert (=> b!506399 (=> (not res!307353) (not e!296389))))

(assert (=> b!506399 (= res!307353 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15502 0))(
  ( (Unit!15503) )
))
(declare-fun lt!231066 () Unit!15502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15502)

(assert (=> b!506399 (= lt!231066 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45764 res!307356) b!506390))

(assert (= (and b!506390 res!307350) b!506395))

(assert (= (and b!506395 res!307352) b!506393))

(assert (= (and b!506393 res!307351) b!506398))

(assert (= (and b!506398 res!307354) b!506392))

(assert (= (and b!506392 res!307348) b!506391))

(assert (= (and b!506391 res!307358) b!506389))

(assert (= (and b!506389 res!307357) b!506399))

(assert (= (and b!506399 res!307353) b!506396))

(assert (= (and b!506399 (not res!307355)) b!506397))

(assert (= (and b!506397 (not res!307349)) b!506394))

(declare-fun m!487047 () Bool)

(assert (=> b!506395 m!487047))

(assert (=> b!506395 m!487047))

(declare-fun m!487049 () Bool)

(assert (=> b!506395 m!487049))

(declare-fun m!487051 () Bool)

(assert (=> b!506393 m!487051))

(declare-fun m!487053 () Bool)

(assert (=> b!506389 m!487053))

(assert (=> b!506399 m!487047))

(declare-fun m!487055 () Bool)

(assert (=> b!506399 m!487055))

(declare-fun m!487057 () Bool)

(assert (=> b!506399 m!487057))

(declare-fun m!487059 () Bool)

(assert (=> b!506399 m!487059))

(declare-fun m!487061 () Bool)

(assert (=> b!506399 m!487061))

(assert (=> b!506399 m!487047))

(declare-fun m!487063 () Bool)

(assert (=> b!506399 m!487063))

(assert (=> b!506399 m!487047))

(declare-fun m!487065 () Bool)

(assert (=> b!506399 m!487065))

(assert (=> b!506399 m!487061))

(declare-fun m!487067 () Bool)

(assert (=> b!506399 m!487067))

(assert (=> b!506399 m!487061))

(declare-fun m!487069 () Bool)

(assert (=> b!506399 m!487069))

(declare-fun m!487071 () Bool)

(assert (=> b!506391 m!487071))

(assert (=> b!506396 m!487047))

(assert (=> b!506396 m!487047))

(declare-fun m!487073 () Bool)

(assert (=> b!506396 m!487073))

(declare-fun m!487075 () Bool)

(assert (=> b!506392 m!487075))

(declare-fun m!487077 () Bool)

(assert (=> start!45764 m!487077))

(declare-fun m!487079 () Bool)

(assert (=> start!45764 m!487079))

(declare-fun m!487081 () Bool)

(assert (=> b!506398 m!487081))

(check-sat (not start!45764) (not b!506389) (not b!506398) (not b!506393) (not b!506395) (not b!506396) (not b!506392) (not b!506391) (not b!506399))
(check-sat)
