; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44742 () Bool)

(assert start!44742)

(declare-fun b!491009 () Bool)

(declare-fun res!294093 () Bool)

(declare-fun e!288512 () Bool)

(assert (=> b!491009 (=> (not res!294093) (not e!288512))))

(declare-datatypes ((array!31811 0))(
  ( (array!31812 (arr!15293 (Array (_ BitVec 32) (_ BitVec 64))) (size!15658 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31811)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491009 (= res!294093 (validKeyInArray!0 (select (arr!15293 a!3235) j!176)))))

(declare-fun b!491010 () Bool)

(declare-fun res!294095 () Bool)

(assert (=> b!491010 (=> (not res!294095) (not e!288512))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491010 (= res!294095 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491011 () Bool)

(declare-fun res!294087 () Bool)

(assert (=> b!491011 (=> (not res!294087) (not e!288512))))

(assert (=> b!491011 (= res!294087 (validKeyInArray!0 k0!2280))))

(declare-fun b!491012 () Bool)

(declare-fun e!288513 () Bool)

(declare-fun e!288511 () Bool)

(assert (=> b!491012 (= e!288513 (not e!288511))))

(declare-fun res!294091 () Bool)

(assert (=> b!491012 (=> res!294091 e!288511)))

(declare-fun lt!221817 () array!31811)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!221815 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3757 0))(
  ( (MissingZero!3757 (index!17207 (_ BitVec 32))) (Found!3757 (index!17208 (_ BitVec 32))) (Intermediate!3757 (undefined!4569 Bool) (index!17209 (_ BitVec 32)) (x!46306 (_ BitVec 32))) (Undefined!3757) (MissingVacant!3757 (index!17210 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31811 (_ BitVec 32)) SeekEntryResult!3757)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491012 (= res!294091 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15293 a!3235) j!176) mask!3524) (select (arr!15293 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221815 mask!3524) lt!221815 lt!221817 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491012 (= lt!221815 (select (store (arr!15293 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491012 (= lt!221817 (array!31812 (store (arr!15293 a!3235) i!1204 k0!2280) (size!15658 a!3235)))))

(declare-fun lt!221816 () SeekEntryResult!3757)

(assert (=> b!491012 (= lt!221816 (Found!3757 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31811 (_ BitVec 32)) SeekEntryResult!3757)

(assert (=> b!491012 (= lt!221816 (seekEntryOrOpen!0 (select (arr!15293 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31811 (_ BitVec 32)) Bool)

(assert (=> b!491012 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14446 0))(
  ( (Unit!14447) )
))
(declare-fun lt!221818 () Unit!14446)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14446)

(assert (=> b!491012 (= lt!221818 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!294088 () Bool)

(assert (=> start!44742 (=> (not res!294088) (not e!288512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44742 (= res!294088 (validMask!0 mask!3524))))

(assert (=> start!44742 e!288512))

(assert (=> start!44742 true))

(declare-fun array_inv!11176 (array!31811) Bool)

(assert (=> start!44742 (array_inv!11176 a!3235)))

(declare-fun b!491013 () Bool)

(declare-fun res!294094 () Bool)

(assert (=> b!491013 (=> (not res!294094) (not e!288513))))

(assert (=> b!491013 (= res!294094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491014 () Bool)

(assert (=> b!491014 (= e!288512 e!288513)))

(declare-fun res!294090 () Bool)

(assert (=> b!491014 (=> (not res!294090) (not e!288513))))

(declare-fun lt!221813 () SeekEntryResult!3757)

(assert (=> b!491014 (= res!294090 (or (= lt!221813 (MissingZero!3757 i!1204)) (= lt!221813 (MissingVacant!3757 i!1204))))))

(assert (=> b!491014 (= lt!221813 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491015 () Bool)

(declare-fun res!294092 () Bool)

(assert (=> b!491015 (=> (not res!294092) (not e!288513))))

(declare-datatypes ((List!9490 0))(
  ( (Nil!9487) (Cons!9486 (h!10348 (_ BitVec 64)) (t!15709 List!9490)) )
))
(declare-fun arrayNoDuplicates!0 (array!31811 (_ BitVec 32) List!9490) Bool)

(assert (=> b!491015 (= res!294092 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9487))))

(declare-fun b!491016 () Bool)

(declare-fun res!294089 () Bool)

(assert (=> b!491016 (=> (not res!294089) (not e!288512))))

(assert (=> b!491016 (= res!294089 (and (= (size!15658 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15658 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15658 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491017 () Bool)

(assert (=> b!491017 (= e!288511 true)))

(assert (=> b!491017 (= lt!221816 (seekEntryOrOpen!0 lt!221815 lt!221817 mask!3524))))

(declare-fun lt!221814 () Unit!14446)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31811 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14446)

(assert (=> b!491017 (= lt!221814 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(assert (= (and start!44742 res!294088) b!491016))

(assert (= (and b!491016 res!294089) b!491009))

(assert (= (and b!491009 res!294093) b!491011))

(assert (= (and b!491011 res!294087) b!491010))

(assert (= (and b!491010 res!294095) b!491014))

(assert (= (and b!491014 res!294090) b!491013))

(assert (= (and b!491013 res!294094) b!491015))

(assert (= (and b!491015 res!294092) b!491012))

(assert (= (and b!491012 (not res!294091)) b!491017))

(declare-fun m!471031 () Bool)

(assert (=> b!491012 m!471031))

(declare-fun m!471033 () Bool)

(assert (=> b!491012 m!471033))

(declare-fun m!471035 () Bool)

(assert (=> b!491012 m!471035))

(declare-fun m!471037 () Bool)

(assert (=> b!491012 m!471037))

(declare-fun m!471039 () Bool)

(assert (=> b!491012 m!471039))

(declare-fun m!471041 () Bool)

(assert (=> b!491012 m!471041))

(declare-fun m!471043 () Bool)

(assert (=> b!491012 m!471043))

(assert (=> b!491012 m!471039))

(assert (=> b!491012 m!471037))

(assert (=> b!491012 m!471043))

(declare-fun m!471045 () Bool)

(assert (=> b!491012 m!471045))

(assert (=> b!491012 m!471039))

(declare-fun m!471047 () Bool)

(assert (=> b!491012 m!471047))

(assert (=> b!491012 m!471039))

(declare-fun m!471049 () Bool)

(assert (=> b!491012 m!471049))

(declare-fun m!471051 () Bool)

(assert (=> b!491015 m!471051))

(declare-fun m!471053 () Bool)

(assert (=> b!491017 m!471053))

(declare-fun m!471055 () Bool)

(assert (=> b!491017 m!471055))

(declare-fun m!471057 () Bool)

(assert (=> b!491011 m!471057))

(assert (=> b!491009 m!471039))

(assert (=> b!491009 m!471039))

(declare-fun m!471059 () Bool)

(assert (=> b!491009 m!471059))

(declare-fun m!471061 () Bool)

(assert (=> b!491010 m!471061))

(declare-fun m!471063 () Bool)

(assert (=> b!491013 m!471063))

(declare-fun m!471065 () Bool)

(assert (=> b!491014 m!471065))

(declare-fun m!471067 () Bool)

(assert (=> start!44742 m!471067))

(declare-fun m!471069 () Bool)

(assert (=> start!44742 m!471069))

(check-sat (not b!491017) (not b!491014) (not b!491009) (not b!491012) (not start!44742) (not b!491010) (not b!491015) (not b!491011) (not b!491013))
(check-sat)
