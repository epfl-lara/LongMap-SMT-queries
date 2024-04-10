; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46052 () Bool)

(assert start!46052)

(declare-fun b!510000 () Bool)

(declare-fun res!310845 () Bool)

(declare-fun e!298172 () Bool)

(assert (=> b!510000 (=> (not res!310845) (not e!298172))))

(declare-datatypes ((array!32763 0))(
  ( (array!32764 (arr!15760 (Array (_ BitVec 32) (_ BitVec 64))) (size!16124 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32763)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32763 (_ BitVec 32)) Bool)

(assert (=> b!510000 (= res!310845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510001 () Bool)

(declare-fun e!298171 () Bool)

(assert (=> b!510001 (= e!298171 e!298172)))

(declare-fun res!310848 () Bool)

(assert (=> b!510001 (=> (not res!310848) (not e!298172))))

(declare-datatypes ((SeekEntryResult!4227 0))(
  ( (MissingZero!4227 (index!19096 (_ BitVec 32))) (Found!4227 (index!19097 (_ BitVec 32))) (Intermediate!4227 (undefined!5039 Bool) (index!19098 (_ BitVec 32)) (x!48060 (_ BitVec 32))) (Undefined!4227) (MissingVacant!4227 (index!19099 (_ BitVec 32))) )
))
(declare-fun lt!233092 () SeekEntryResult!4227)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510001 (= res!310848 (or (= lt!233092 (MissingZero!4227 i!1204)) (= lt!233092 (MissingVacant!4227 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32763 (_ BitVec 32)) SeekEntryResult!4227)

(assert (=> b!510001 (= lt!233092 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510002 () Bool)

(declare-fun res!310846 () Bool)

(assert (=> b!510002 (=> (not res!310846) (not e!298171))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510002 (= res!310846 (validKeyInArray!0 (select (arr!15760 a!3235) j!176)))))

(declare-fun b!510003 () Bool)

(assert (=> b!510003 (= e!298172 (not true))))

(declare-fun lt!233093 () (_ BitVec 32))

(declare-fun lt!233095 () SeekEntryResult!4227)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32763 (_ BitVec 32)) SeekEntryResult!4227)

(assert (=> b!510003 (= lt!233095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233093 (select (store (arr!15760 a!3235) i!1204 k0!2280) j!176) (array!32764 (store (arr!15760 a!3235) i!1204 k0!2280) (size!16124 a!3235)) mask!3524))))

(declare-fun lt!233091 () (_ BitVec 32))

(declare-fun lt!233094 () SeekEntryResult!4227)

(assert (=> b!510003 (= lt!233094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233091 (select (arr!15760 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510003 (= lt!233093 (toIndex!0 (select (store (arr!15760 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510003 (= lt!233091 (toIndex!0 (select (arr!15760 a!3235) j!176) mask!3524))))

(declare-fun e!298170 () Bool)

(assert (=> b!510003 e!298170))

(declare-fun res!310852 () Bool)

(assert (=> b!510003 (=> (not res!310852) (not e!298170))))

(assert (=> b!510003 (= res!310852 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15712 0))(
  ( (Unit!15713) )
))
(declare-fun lt!233090 () Unit!15712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15712)

(assert (=> b!510003 (= lt!233090 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510004 () Bool)

(declare-fun res!310850 () Bool)

(assert (=> b!510004 (=> (not res!310850) (not e!298171))))

(declare-fun arrayContainsKey!0 (array!32763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510004 (= res!310850 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510005 () Bool)

(assert (=> b!510005 (= e!298170 (= (seekEntryOrOpen!0 (select (arr!15760 a!3235) j!176) a!3235 mask!3524) (Found!4227 j!176)))))

(declare-fun res!310847 () Bool)

(assert (=> start!46052 (=> (not res!310847) (not e!298171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46052 (= res!310847 (validMask!0 mask!3524))))

(assert (=> start!46052 e!298171))

(assert (=> start!46052 true))

(declare-fun array_inv!11556 (array!32763) Bool)

(assert (=> start!46052 (array_inv!11556 a!3235)))

(declare-fun b!510006 () Bool)

(declare-fun res!310849 () Bool)

(assert (=> b!510006 (=> (not res!310849) (not e!298171))))

(assert (=> b!510006 (= res!310849 (validKeyInArray!0 k0!2280))))

(declare-fun b!510007 () Bool)

(declare-fun res!310853 () Bool)

(assert (=> b!510007 (=> (not res!310853) (not e!298172))))

(declare-datatypes ((List!9918 0))(
  ( (Nil!9915) (Cons!9914 (h!10791 (_ BitVec 64)) (t!16146 List!9918)) )
))
(declare-fun arrayNoDuplicates!0 (array!32763 (_ BitVec 32) List!9918) Bool)

(assert (=> b!510007 (= res!310853 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9915))))

(declare-fun b!510008 () Bool)

(declare-fun res!310851 () Bool)

(assert (=> b!510008 (=> (not res!310851) (not e!298171))))

(assert (=> b!510008 (= res!310851 (and (= (size!16124 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16124 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16124 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46052 res!310847) b!510008))

(assert (= (and b!510008 res!310851) b!510002))

(assert (= (and b!510002 res!310846) b!510006))

(assert (= (and b!510006 res!310849) b!510004))

(assert (= (and b!510004 res!310850) b!510001))

(assert (= (and b!510001 res!310848) b!510000))

(assert (= (and b!510000 res!310845) b!510007))

(assert (= (and b!510007 res!310853) b!510003))

(assert (= (and b!510003 res!310852) b!510005))

(declare-fun m!491073 () Bool)

(assert (=> start!46052 m!491073))

(declare-fun m!491075 () Bool)

(assert (=> start!46052 m!491075))

(declare-fun m!491077 () Bool)

(assert (=> b!510003 m!491077))

(declare-fun m!491079 () Bool)

(assert (=> b!510003 m!491079))

(declare-fun m!491081 () Bool)

(assert (=> b!510003 m!491081))

(assert (=> b!510003 m!491081))

(declare-fun m!491083 () Bool)

(assert (=> b!510003 m!491083))

(declare-fun m!491085 () Bool)

(assert (=> b!510003 m!491085))

(declare-fun m!491087 () Bool)

(assert (=> b!510003 m!491087))

(declare-fun m!491089 () Bool)

(assert (=> b!510003 m!491089))

(assert (=> b!510003 m!491081))

(declare-fun m!491091 () Bool)

(assert (=> b!510003 m!491091))

(assert (=> b!510003 m!491085))

(declare-fun m!491093 () Bool)

(assert (=> b!510003 m!491093))

(assert (=> b!510003 m!491085))

(declare-fun m!491095 () Bool)

(assert (=> b!510001 m!491095))

(declare-fun m!491097 () Bool)

(assert (=> b!510000 m!491097))

(assert (=> b!510002 m!491085))

(assert (=> b!510002 m!491085))

(declare-fun m!491099 () Bool)

(assert (=> b!510002 m!491099))

(declare-fun m!491101 () Bool)

(assert (=> b!510004 m!491101))

(declare-fun m!491103 () Bool)

(assert (=> b!510007 m!491103))

(declare-fun m!491105 () Bool)

(assert (=> b!510006 m!491105))

(assert (=> b!510005 m!491085))

(assert (=> b!510005 m!491085))

(declare-fun m!491107 () Bool)

(assert (=> b!510005 m!491107))

(check-sat (not start!46052) (not b!510006) (not b!510003) (not b!510002) (not b!510004) (not b!510005) (not b!510000) (not b!510007) (not b!510001))
(check-sat)
