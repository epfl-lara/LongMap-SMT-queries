; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46754 () Bool)

(assert start!46754)

(declare-fun b!516304 () Bool)

(declare-fun e!301343 () Bool)

(declare-fun e!301340 () Bool)

(assert (=> b!516304 (= e!301343 (not e!301340))))

(declare-fun res!315876 () Bool)

(assert (=> b!516304 (=> res!315876 e!301340)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4368 0))(
  ( (MissingZero!4368 (index!19660 (_ BitVec 32))) (Found!4368 (index!19661 (_ BitVec 32))) (Intermediate!4368 (undefined!5180 Bool) (index!19662 (_ BitVec 32)) (x!48619 (_ BitVec 32))) (Undefined!4368) (MissingVacant!4368 (index!19663 (_ BitVec 32))) )
))
(declare-fun lt!236357 () SeekEntryResult!4368)

(declare-datatypes ((array!33066 0))(
  ( (array!33067 (arr!15901 (Array (_ BitVec 32) (_ BitVec 64))) (size!16265 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33066)

(declare-fun lt!236355 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33066 (_ BitVec 32)) SeekEntryResult!4368)

(assert (=> b!516304 (= res!315876 (= lt!236357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236355 (select (store (arr!15901 a!3235) i!1204 k0!2280) j!176) (array!33067 (store (arr!15901 a!3235) i!1204 k0!2280) (size!16265 a!3235)) mask!3524)))))

(declare-fun lt!236358 () (_ BitVec 32))

(assert (=> b!516304 (= lt!236357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236358 (select (arr!15901 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516304 (= lt!236355 (toIndex!0 (select (store (arr!15901 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516304 (= lt!236358 (toIndex!0 (select (arr!15901 a!3235) j!176) mask!3524))))

(declare-fun e!301342 () Bool)

(assert (=> b!516304 e!301342))

(declare-fun res!315869 () Bool)

(assert (=> b!516304 (=> (not res!315869) (not e!301342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33066 (_ BitVec 32)) Bool)

(assert (=> b!516304 (= res!315869 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15994 0))(
  ( (Unit!15995) )
))
(declare-fun lt!236356 () Unit!15994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15994)

(assert (=> b!516304 (= lt!236356 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516305 () Bool)

(declare-fun res!315868 () Bool)

(declare-fun e!301341 () Bool)

(assert (=> b!516305 (=> (not res!315868) (not e!301341))))

(assert (=> b!516305 (= res!315868 (and (= (size!16265 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16265 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16265 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516306 () Bool)

(declare-fun res!315877 () Bool)

(assert (=> b!516306 (=> (not res!315877) (not e!301343))))

(assert (=> b!516306 (= res!315877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516307 () Bool)

(assert (=> b!516307 (= e!301341 e!301343)))

(declare-fun res!315870 () Bool)

(assert (=> b!516307 (=> (not res!315870) (not e!301343))))

(declare-fun lt!236359 () SeekEntryResult!4368)

(assert (=> b!516307 (= res!315870 (or (= lt!236359 (MissingZero!4368 i!1204)) (= lt!236359 (MissingVacant!4368 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33066 (_ BitVec 32)) SeekEntryResult!4368)

(assert (=> b!516307 (= lt!236359 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516308 () Bool)

(declare-fun res!315871 () Bool)

(assert (=> b!516308 (=> (not res!315871) (not e!301343))))

(declare-datatypes ((List!10059 0))(
  ( (Nil!10056) (Cons!10055 (h!10953 (_ BitVec 64)) (t!16287 List!10059)) )
))
(declare-fun arrayNoDuplicates!0 (array!33066 (_ BitVec 32) List!10059) Bool)

(assert (=> b!516308 (= res!315871 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10056))))

(declare-fun res!315872 () Bool)

(assert (=> start!46754 (=> (not res!315872) (not e!301341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46754 (= res!315872 (validMask!0 mask!3524))))

(assert (=> start!46754 e!301341))

(assert (=> start!46754 true))

(declare-fun array_inv!11697 (array!33066) Bool)

(assert (=> start!46754 (array_inv!11697 a!3235)))

(declare-fun b!516309 () Bool)

(declare-fun res!315874 () Bool)

(assert (=> b!516309 (=> (not res!315874) (not e!301341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516309 (= res!315874 (validKeyInArray!0 k0!2280))))

(declare-fun b!516310 () Bool)

(declare-fun res!315875 () Bool)

(assert (=> b!516310 (=> res!315875 e!301340)))

(get-info :version)

(assert (=> b!516310 (= res!315875 (or (undefined!5180 lt!236357) (not ((_ is Intermediate!4368) lt!236357))))))

(declare-fun b!516311 () Bool)

(declare-fun res!315873 () Bool)

(assert (=> b!516311 (=> (not res!315873) (not e!301341))))

(assert (=> b!516311 (= res!315873 (validKeyInArray!0 (select (arr!15901 a!3235) j!176)))))

(declare-fun b!516312 () Bool)

(assert (=> b!516312 (= e!301340 true)))

(assert (=> b!516312 (and (bvslt (x!48619 lt!236357) #b01111111111111111111111111111110) (or (= (select (arr!15901 a!3235) (index!19662 lt!236357)) (select (arr!15901 a!3235) j!176)) (= (select (arr!15901 a!3235) (index!19662 lt!236357)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15901 a!3235) (index!19662 lt!236357)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516313 () Bool)

(declare-fun res!315878 () Bool)

(assert (=> b!516313 (=> (not res!315878) (not e!301341))))

(declare-fun arrayContainsKey!0 (array!33066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516313 (= res!315878 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516314 () Bool)

(assert (=> b!516314 (= e!301342 (= (seekEntryOrOpen!0 (select (arr!15901 a!3235) j!176) a!3235 mask!3524) (Found!4368 j!176)))))

(assert (= (and start!46754 res!315872) b!516305))

(assert (= (and b!516305 res!315868) b!516311))

(assert (= (and b!516311 res!315873) b!516309))

(assert (= (and b!516309 res!315874) b!516313))

(assert (= (and b!516313 res!315878) b!516307))

(assert (= (and b!516307 res!315870) b!516306))

(assert (= (and b!516306 res!315877) b!516308))

(assert (= (and b!516308 res!315871) b!516304))

(assert (= (and b!516304 res!315869) b!516314))

(assert (= (and b!516304 (not res!315876)) b!516310))

(assert (= (and b!516310 (not res!315875)) b!516312))

(declare-fun m!497771 () Bool)

(assert (=> b!516306 m!497771))

(declare-fun m!497773 () Bool)

(assert (=> b!516311 m!497773))

(assert (=> b!516311 m!497773))

(declare-fun m!497775 () Bool)

(assert (=> b!516311 m!497775))

(declare-fun m!497777 () Bool)

(assert (=> start!46754 m!497777))

(declare-fun m!497779 () Bool)

(assert (=> start!46754 m!497779))

(assert (=> b!516304 m!497773))

(declare-fun m!497781 () Bool)

(assert (=> b!516304 m!497781))

(declare-fun m!497783 () Bool)

(assert (=> b!516304 m!497783))

(declare-fun m!497785 () Bool)

(assert (=> b!516304 m!497785))

(declare-fun m!497787 () Bool)

(assert (=> b!516304 m!497787))

(declare-fun m!497789 () Bool)

(assert (=> b!516304 m!497789))

(assert (=> b!516304 m!497785))

(assert (=> b!516304 m!497773))

(declare-fun m!497791 () Bool)

(assert (=> b!516304 m!497791))

(assert (=> b!516304 m!497773))

(declare-fun m!497793 () Bool)

(assert (=> b!516304 m!497793))

(assert (=> b!516304 m!497785))

(declare-fun m!497795 () Bool)

(assert (=> b!516304 m!497795))

(declare-fun m!497797 () Bool)

(assert (=> b!516313 m!497797))

(declare-fun m!497799 () Bool)

(assert (=> b!516307 m!497799))

(declare-fun m!497801 () Bool)

(assert (=> b!516312 m!497801))

(assert (=> b!516312 m!497773))

(declare-fun m!497803 () Bool)

(assert (=> b!516309 m!497803))

(declare-fun m!497805 () Bool)

(assert (=> b!516308 m!497805))

(assert (=> b!516314 m!497773))

(assert (=> b!516314 m!497773))

(declare-fun m!497807 () Bool)

(assert (=> b!516314 m!497807))

(check-sat (not b!516307) (not b!516304) (not b!516309) (not b!516311) (not b!516306) (not b!516308) (not b!516314) (not start!46754) (not b!516313))
(check-sat)
