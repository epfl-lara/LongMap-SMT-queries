; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47892 () Bool)

(assert start!47892)

(declare-fun b!527347 () Bool)

(declare-fun res!323696 () Bool)

(declare-fun e!307360 () Bool)

(assert (=> b!527347 (=> (not res!323696) (not e!307360))))

(declare-datatypes ((array!33460 0))(
  ( (array!33461 (arr!16080 (Array (_ BitVec 32) (_ BitVec 64))) (size!16444 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33460)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527347 (= res!323696 (validKeyInArray!0 (select (arr!16080 a!3235) j!176)))))

(declare-fun b!527348 () Bool)

(declare-datatypes ((Unit!16640 0))(
  ( (Unit!16641) )
))
(declare-fun e!307364 () Unit!16640)

(declare-fun Unit!16642 () Unit!16640)

(assert (=> b!527348 (= e!307364 Unit!16642)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4547 0))(
  ( (MissingZero!4547 (index!20406 (_ BitVec 32))) (Found!4547 (index!20407 (_ BitVec 32))) (Intermediate!4547 (undefined!5359 Bool) (index!20408 (_ BitVec 32)) (x!49380 (_ BitVec 32))) (Undefined!4547) (MissingVacant!4547 (index!20409 (_ BitVec 32))) )
))
(declare-fun lt!242683 () SeekEntryResult!4547)

(declare-fun lt!242681 () Unit!16640)

(declare-fun lt!242685 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33460 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16640)

(assert (=> b!527348 (= lt!242681 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242685 #b00000000000000000000000000000000 (index!20408 lt!242683) (x!49380 lt!242683) mask!3524))))

(declare-fun res!323686 () Bool)

(declare-fun lt!242684 () (_ BitVec 64))

(declare-fun lt!242679 () array!33460)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33460 (_ BitVec 32)) SeekEntryResult!4547)

(assert (=> b!527348 (= res!323686 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242685 lt!242684 lt!242679 mask!3524) (Intermediate!4547 false (index!20408 lt!242683) (x!49380 lt!242683))))))

(declare-fun e!307365 () Bool)

(assert (=> b!527348 (=> (not res!323686) (not e!307365))))

(assert (=> b!527348 e!307365))

(declare-fun b!527349 () Bool)

(declare-fun res!323685 () Bool)

(declare-fun e!307359 () Bool)

(assert (=> b!527349 (=> (not res!323685) (not e!307359))))

(declare-datatypes ((List!10238 0))(
  ( (Nil!10235) (Cons!10234 (h!11168 (_ BitVec 64)) (t!16466 List!10238)) )
))
(declare-fun arrayNoDuplicates!0 (array!33460 (_ BitVec 32) List!10238) Bool)

(assert (=> b!527349 (= res!323685 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10235))))

(declare-fun b!527350 () Bool)

(declare-fun res!323693 () Bool)

(assert (=> b!527350 (=> (not res!323693) (not e!307360))))

(assert (=> b!527350 (= res!323693 (and (= (size!16444 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16444 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16444 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527351 () Bool)

(declare-fun e!307363 () Bool)

(assert (=> b!527351 (= e!307359 (not e!307363))))

(declare-fun res!323695 () Bool)

(assert (=> b!527351 (=> res!323695 e!307363)))

(declare-fun lt!242677 () (_ BitVec 32))

(assert (=> b!527351 (= res!323695 (= lt!242683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242677 lt!242684 lt!242679 mask!3524)))))

(assert (=> b!527351 (= lt!242683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242685 (select (arr!16080 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527351 (= lt!242677 (toIndex!0 lt!242684 mask!3524))))

(assert (=> b!527351 (= lt!242684 (select (store (arr!16080 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!527351 (= lt!242685 (toIndex!0 (select (arr!16080 a!3235) j!176) mask!3524))))

(assert (=> b!527351 (= lt!242679 (array!33461 (store (arr!16080 a!3235) i!1204 k!2280) (size!16444 a!3235)))))

(declare-fun e!307361 () Bool)

(assert (=> b!527351 e!307361))

(declare-fun res!323689 () Bool)

(assert (=> b!527351 (=> (not res!323689) (not e!307361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33460 (_ BitVec 32)) Bool)

(assert (=> b!527351 (= res!323689 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242686 () Unit!16640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16640)

(assert (=> b!527351 (= lt!242686 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527353 () Bool)

(assert (=> b!527353 (= e!307363 (or (bvsgt (x!49380 lt!242683) #b01111111111111111111111111111110) (bvslt lt!242685 #b00000000000000000000000000000000) (bvsge lt!242685 (size!16444 a!3235)) (and (bvsge (index!20408 lt!242683) #b00000000000000000000000000000000) (bvslt (index!20408 lt!242683) (size!16444 a!3235)))))))

(assert (=> b!527353 (= (index!20408 lt!242683) i!1204)))

(declare-fun lt!242680 () Unit!16640)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33460 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16640)

(assert (=> b!527353 (= lt!242680 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242685 #b00000000000000000000000000000000 (index!20408 lt!242683) (x!49380 lt!242683) mask!3524))))

(assert (=> b!527353 (and (or (= (select (arr!16080 a!3235) (index!20408 lt!242683)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16080 a!3235) (index!20408 lt!242683)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16080 a!3235) (index!20408 lt!242683)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16080 a!3235) (index!20408 lt!242683)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242682 () Unit!16640)

(assert (=> b!527353 (= lt!242682 e!307364)))

(declare-fun c!62138 () Bool)

(assert (=> b!527353 (= c!62138 (= (select (arr!16080 a!3235) (index!20408 lt!242683)) (select (arr!16080 a!3235) j!176)))))

(assert (=> b!527353 (and (bvslt (x!49380 lt!242683) #b01111111111111111111111111111110) (or (= (select (arr!16080 a!3235) (index!20408 lt!242683)) (select (arr!16080 a!3235) j!176)) (= (select (arr!16080 a!3235) (index!20408 lt!242683)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16080 a!3235) (index!20408 lt!242683)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527354 () Bool)

(assert (=> b!527354 (= e!307360 e!307359)))

(declare-fun res!323694 () Bool)

(assert (=> b!527354 (=> (not res!323694) (not e!307359))))

(declare-fun lt!242678 () SeekEntryResult!4547)

(assert (=> b!527354 (= res!323694 (or (= lt!242678 (MissingZero!4547 i!1204)) (= lt!242678 (MissingVacant!4547 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33460 (_ BitVec 32)) SeekEntryResult!4547)

(assert (=> b!527354 (= lt!242678 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!527355 () Bool)

(declare-fun res!323692 () Bool)

(assert (=> b!527355 (=> res!323692 e!307363)))

(assert (=> b!527355 (= res!323692 (or (undefined!5359 lt!242683) (not (is-Intermediate!4547 lt!242683))))))

(declare-fun b!527356 () Bool)

(declare-fun Unit!16643 () Unit!16640)

(assert (=> b!527356 (= e!307364 Unit!16643)))

(declare-fun b!527352 () Bool)

(assert (=> b!527352 (= e!307361 (= (seekEntryOrOpen!0 (select (arr!16080 a!3235) j!176) a!3235 mask!3524) (Found!4547 j!176)))))

(declare-fun res!323690 () Bool)

(assert (=> start!47892 (=> (not res!323690) (not e!307360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47892 (= res!323690 (validMask!0 mask!3524))))

(assert (=> start!47892 e!307360))

(assert (=> start!47892 true))

(declare-fun array_inv!11876 (array!33460) Bool)

(assert (=> start!47892 (array_inv!11876 a!3235)))

(declare-fun b!527357 () Bool)

(declare-fun res!323687 () Bool)

(assert (=> b!527357 (=> (not res!323687) (not e!307360))))

(declare-fun arrayContainsKey!0 (array!33460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527357 (= res!323687 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527358 () Bool)

(declare-fun res!323688 () Bool)

(assert (=> b!527358 (=> (not res!323688) (not e!307359))))

(assert (=> b!527358 (= res!323688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527359 () Bool)

(declare-fun res!323691 () Bool)

(assert (=> b!527359 (=> (not res!323691) (not e!307360))))

(assert (=> b!527359 (= res!323691 (validKeyInArray!0 k!2280))))

(declare-fun b!527360 () Bool)

(assert (=> b!527360 (= e!307365 false)))

(assert (= (and start!47892 res!323690) b!527350))

(assert (= (and b!527350 res!323693) b!527347))

(assert (= (and b!527347 res!323696) b!527359))

(assert (= (and b!527359 res!323691) b!527357))

(assert (= (and b!527357 res!323687) b!527354))

(assert (= (and b!527354 res!323694) b!527358))

(assert (= (and b!527358 res!323688) b!527349))

(assert (= (and b!527349 res!323685) b!527351))

(assert (= (and b!527351 res!323689) b!527352))

(assert (= (and b!527351 (not res!323695)) b!527355))

(assert (= (and b!527355 (not res!323692)) b!527353))

(assert (= (and b!527353 c!62138) b!527348))

(assert (= (and b!527353 (not c!62138)) b!527356))

(assert (= (and b!527348 res!323686) b!527360))

(declare-fun m!507993 () Bool)

(assert (=> b!527348 m!507993))

(declare-fun m!507995 () Bool)

(assert (=> b!527348 m!507995))

(declare-fun m!507997 () Bool)

(assert (=> b!527352 m!507997))

(assert (=> b!527352 m!507997))

(declare-fun m!507999 () Bool)

(assert (=> b!527352 m!507999))

(declare-fun m!508001 () Bool)

(assert (=> b!527358 m!508001))

(declare-fun m!508003 () Bool)

(assert (=> start!47892 m!508003))

(declare-fun m!508005 () Bool)

(assert (=> start!47892 m!508005))

(declare-fun m!508007 () Bool)

(assert (=> b!527349 m!508007))

(assert (=> b!527347 m!507997))

(assert (=> b!527347 m!507997))

(declare-fun m!508009 () Bool)

(assert (=> b!527347 m!508009))

(declare-fun m!508011 () Bool)

(assert (=> b!527354 m!508011))

(declare-fun m!508013 () Bool)

(assert (=> b!527351 m!508013))

(assert (=> b!527351 m!507997))

(declare-fun m!508015 () Bool)

(assert (=> b!527351 m!508015))

(assert (=> b!527351 m!507997))

(declare-fun m!508017 () Bool)

(assert (=> b!527351 m!508017))

(assert (=> b!527351 m!507997))

(declare-fun m!508019 () Bool)

(assert (=> b!527351 m!508019))

(declare-fun m!508021 () Bool)

(assert (=> b!527351 m!508021))

(declare-fun m!508023 () Bool)

(assert (=> b!527351 m!508023))

(declare-fun m!508025 () Bool)

(assert (=> b!527351 m!508025))

(declare-fun m!508027 () Bool)

(assert (=> b!527351 m!508027))

(declare-fun m!508029 () Bool)

(assert (=> b!527357 m!508029))

(declare-fun m!508031 () Bool)

(assert (=> b!527353 m!508031))

(declare-fun m!508033 () Bool)

(assert (=> b!527353 m!508033))

(assert (=> b!527353 m!507997))

(declare-fun m!508035 () Bool)

(assert (=> b!527359 m!508035))

(push 1)

(assert (not b!527349))

(assert (not b!527353))

(assert (not b!527352))

(assert (not b!527358))

(assert (not b!527359))

(assert (not b!527354))

(assert (not b!527347))

(assert (not b!527348))

(assert (not b!527351))

(assert (not start!47892))

(assert (not b!527357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

