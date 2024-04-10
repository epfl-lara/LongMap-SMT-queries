; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46700 () Bool)

(assert start!46700)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!300935 () Bool)

(declare-fun b!515413 () Bool)

(declare-datatypes ((array!33012 0))(
  ( (array!33013 (arr!15874 (Array (_ BitVec 32) (_ BitVec 64))) (size!16238 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33012)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4341 0))(
  ( (MissingZero!4341 (index!19552 (_ BitVec 32))) (Found!4341 (index!19553 (_ BitVec 32))) (Intermediate!4341 (undefined!5153 Bool) (index!19554 (_ BitVec 32)) (x!48520 (_ BitVec 32))) (Undefined!4341) (MissingVacant!4341 (index!19555 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33012 (_ BitVec 32)) SeekEntryResult!4341)

(assert (=> b!515413 (= e!300935 (= (seekEntryOrOpen!0 (select (arr!15874 a!3235) j!176) a!3235 mask!3524) (Found!4341 j!176)))))

(declare-fun b!515414 () Bool)

(declare-fun res!314977 () Bool)

(declare-fun e!300936 () Bool)

(assert (=> b!515414 (=> (not res!314977) (not e!300936))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515414 (= res!314977 (validKeyInArray!0 k0!2280))))

(declare-fun b!515415 () Bool)

(declare-fun e!300939 () Bool)

(assert (=> b!515415 (= e!300936 e!300939)))

(declare-fun res!314985 () Bool)

(assert (=> b!515415 (=> (not res!314985) (not e!300939))))

(declare-fun lt!235950 () SeekEntryResult!4341)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515415 (= res!314985 (or (= lt!235950 (MissingZero!4341 i!1204)) (= lt!235950 (MissingVacant!4341 i!1204))))))

(assert (=> b!515415 (= lt!235950 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515417 () Bool)

(declare-fun res!314981 () Bool)

(assert (=> b!515417 (=> (not res!314981) (not e!300939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33012 (_ BitVec 32)) Bool)

(assert (=> b!515417 (= res!314981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515418 () Bool)

(declare-fun res!314982 () Bool)

(assert (=> b!515418 (=> (not res!314982) (not e!300936))))

(declare-fun arrayContainsKey!0 (array!33012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515418 (= res!314982 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515419 () Bool)

(declare-fun res!314983 () Bool)

(assert (=> b!515419 (=> (not res!314983) (not e!300939))))

(declare-datatypes ((List!10032 0))(
  ( (Nil!10029) (Cons!10028 (h!10926 (_ BitVec 64)) (t!16260 List!10032)) )
))
(declare-fun arrayNoDuplicates!0 (array!33012 (_ BitVec 32) List!10032) Bool)

(assert (=> b!515419 (= res!314983 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10029))))

(declare-fun b!515420 () Bool)

(declare-fun e!300937 () Bool)

(assert (=> b!515420 (= e!300937 true)))

(declare-fun lt!235951 () SeekEntryResult!4341)

(assert (=> b!515420 (and (bvslt (x!48520 lt!235951) #b01111111111111111111111111111110) (or (= (select (arr!15874 a!3235) (index!19554 lt!235951)) (select (arr!15874 a!3235) j!176)) (= (select (arr!15874 a!3235) (index!19554 lt!235951)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15874 a!3235) (index!19554 lt!235951)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515421 () Bool)

(assert (=> b!515421 (= e!300939 (not e!300937))))

(declare-fun res!314986 () Bool)

(assert (=> b!515421 (=> res!314986 e!300937)))

(declare-fun lt!235953 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33012 (_ BitVec 32)) SeekEntryResult!4341)

(assert (=> b!515421 (= res!314986 (= lt!235951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235953 (select (store (arr!15874 a!3235) i!1204 k0!2280) j!176) (array!33013 (store (arr!15874 a!3235) i!1204 k0!2280) (size!16238 a!3235)) mask!3524)))))

(declare-fun lt!235954 () (_ BitVec 32))

(assert (=> b!515421 (= lt!235951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235954 (select (arr!15874 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515421 (= lt!235953 (toIndex!0 (select (store (arr!15874 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515421 (= lt!235954 (toIndex!0 (select (arr!15874 a!3235) j!176) mask!3524))))

(assert (=> b!515421 e!300935))

(declare-fun res!314984 () Bool)

(assert (=> b!515421 (=> (not res!314984) (not e!300935))))

(assert (=> b!515421 (= res!314984 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15940 0))(
  ( (Unit!15941) )
))
(declare-fun lt!235952 () Unit!15940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33012 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15940)

(assert (=> b!515421 (= lt!235952 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515422 () Bool)

(declare-fun res!314978 () Bool)

(assert (=> b!515422 (=> (not res!314978) (not e!300936))))

(assert (=> b!515422 (= res!314978 (validKeyInArray!0 (select (arr!15874 a!3235) j!176)))))

(declare-fun b!515423 () Bool)

(declare-fun res!314980 () Bool)

(assert (=> b!515423 (=> res!314980 e!300937)))

(get-info :version)

(assert (=> b!515423 (= res!314980 (or (undefined!5153 lt!235951) (not ((_ is Intermediate!4341) lt!235951))))))

(declare-fun b!515416 () Bool)

(declare-fun res!314979 () Bool)

(assert (=> b!515416 (=> (not res!314979) (not e!300936))))

(assert (=> b!515416 (= res!314979 (and (= (size!16238 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16238 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16238 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!314987 () Bool)

(assert (=> start!46700 (=> (not res!314987) (not e!300936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46700 (= res!314987 (validMask!0 mask!3524))))

(assert (=> start!46700 e!300936))

(assert (=> start!46700 true))

(declare-fun array_inv!11670 (array!33012) Bool)

(assert (=> start!46700 (array_inv!11670 a!3235)))

(assert (= (and start!46700 res!314987) b!515416))

(assert (= (and b!515416 res!314979) b!515422))

(assert (= (and b!515422 res!314978) b!515414))

(assert (= (and b!515414 res!314977) b!515418))

(assert (= (and b!515418 res!314982) b!515415))

(assert (= (and b!515415 res!314985) b!515417))

(assert (= (and b!515417 res!314981) b!515419))

(assert (= (and b!515419 res!314983) b!515421))

(assert (= (and b!515421 res!314984) b!515413))

(assert (= (and b!515421 (not res!314986)) b!515423))

(assert (= (and b!515423 (not res!314980)) b!515420))

(declare-fun m!496745 () Bool)

(assert (=> b!515413 m!496745))

(assert (=> b!515413 m!496745))

(declare-fun m!496747 () Bool)

(assert (=> b!515413 m!496747))

(declare-fun m!496749 () Bool)

(assert (=> b!515419 m!496749))

(declare-fun m!496751 () Bool)

(assert (=> b!515415 m!496751))

(declare-fun m!496753 () Bool)

(assert (=> b!515418 m!496753))

(declare-fun m!496755 () Bool)

(assert (=> b!515420 m!496755))

(assert (=> b!515420 m!496745))

(declare-fun m!496757 () Bool)

(assert (=> b!515414 m!496757))

(declare-fun m!496759 () Bool)

(assert (=> b!515421 m!496759))

(declare-fun m!496761 () Bool)

(assert (=> b!515421 m!496761))

(assert (=> b!515421 m!496745))

(declare-fun m!496763 () Bool)

(assert (=> b!515421 m!496763))

(assert (=> b!515421 m!496745))

(declare-fun m!496765 () Bool)

(assert (=> b!515421 m!496765))

(assert (=> b!515421 m!496745))

(declare-fun m!496767 () Bool)

(assert (=> b!515421 m!496767))

(assert (=> b!515421 m!496761))

(declare-fun m!496769 () Bool)

(assert (=> b!515421 m!496769))

(assert (=> b!515421 m!496761))

(declare-fun m!496771 () Bool)

(assert (=> b!515421 m!496771))

(declare-fun m!496773 () Bool)

(assert (=> b!515421 m!496773))

(assert (=> b!515422 m!496745))

(assert (=> b!515422 m!496745))

(declare-fun m!496775 () Bool)

(assert (=> b!515422 m!496775))

(declare-fun m!496777 () Bool)

(assert (=> b!515417 m!496777))

(declare-fun m!496779 () Bool)

(assert (=> start!46700 m!496779))

(declare-fun m!496781 () Bool)

(assert (=> start!46700 m!496781))

(check-sat (not b!515419) (not b!515421) (not b!515413) (not b!515415) (not b!515422) (not b!515414) (not b!515417) (not b!515418) (not start!46700))
(check-sat)
