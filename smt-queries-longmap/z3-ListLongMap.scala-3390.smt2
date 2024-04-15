; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46740 () Bool)

(assert start!46740)

(declare-fun b!516000 () Bool)

(declare-fun res!315710 () Bool)

(declare-fun e!301151 () Bool)

(assert (=> b!516000 (=> res!315710 e!301151)))

(declare-datatypes ((SeekEntryResult!4363 0))(
  ( (MissingZero!4363 (index!19640 (_ BitVec 32))) (Found!4363 (index!19641 (_ BitVec 32))) (Intermediate!4363 (undefined!5175 Bool) (index!19642 (_ BitVec 32)) (x!48609 (_ BitVec 32))) (Undefined!4363) (MissingVacant!4363 (index!19643 (_ BitVec 32))) )
))
(declare-fun lt!236106 () SeekEntryResult!4363)

(get-info :version)

(assert (=> b!516000 (= res!315710 (or (undefined!5175 lt!236106) (not ((_ is Intermediate!4363) lt!236106))))))

(declare-fun b!516001 () Bool)

(assert (=> b!516001 (= e!301151 true)))

(declare-datatypes ((array!33062 0))(
  ( (array!33063 (arr!15899 (Array (_ BitVec 32) (_ BitVec 64))) (size!16264 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33062)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516001 (and (bvslt (x!48609 lt!236106) #b01111111111111111111111111111110) (or (= (select (arr!15899 a!3235) (index!19642 lt!236106)) (select (arr!15899 a!3235) j!176)) (= (select (arr!15899 a!3235) (index!19642 lt!236106)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15899 a!3235) (index!19642 lt!236106)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516002 () Bool)

(declare-fun res!315713 () Bool)

(declare-fun e!301153 () Bool)

(assert (=> b!516002 (=> (not res!315713) (not e!301153))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516002 (= res!315713 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516003 () Bool)

(declare-fun res!315711 () Bool)

(assert (=> b!516003 (=> (not res!315711) (not e!301153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516003 (= res!315711 (validKeyInArray!0 (select (arr!15899 a!3235) j!176)))))

(declare-fun b!516004 () Bool)

(declare-fun res!315707 () Bool)

(assert (=> b!516004 (=> (not res!315707) (not e!301153))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516004 (= res!315707 (and (= (size!16264 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16264 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16264 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516005 () Bool)

(declare-fun res!315706 () Bool)

(declare-fun e!301155 () Bool)

(assert (=> b!516005 (=> (not res!315706) (not e!301155))))

(declare-datatypes ((List!10096 0))(
  ( (Nil!10093) (Cons!10092 (h!10990 (_ BitVec 64)) (t!16315 List!10096)) )
))
(declare-fun arrayNoDuplicates!0 (array!33062 (_ BitVec 32) List!10096) Bool)

(assert (=> b!516005 (= res!315706 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10093))))

(declare-fun b!516006 () Bool)

(assert (=> b!516006 (= e!301153 e!301155)))

(declare-fun res!315716 () Bool)

(assert (=> b!516006 (=> (not res!315716) (not e!301155))))

(declare-fun lt!236109 () SeekEntryResult!4363)

(assert (=> b!516006 (= res!315716 (or (= lt!236109 (MissingZero!4363 i!1204)) (= lt!236109 (MissingVacant!4363 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33062 (_ BitVec 32)) SeekEntryResult!4363)

(assert (=> b!516006 (= lt!236109 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516007 () Bool)

(declare-fun e!301154 () Bool)

(assert (=> b!516007 (= e!301154 (= (seekEntryOrOpen!0 (select (arr!15899 a!3235) j!176) a!3235 mask!3524) (Found!4363 j!176)))))

(declare-fun res!315712 () Bool)

(assert (=> start!46740 (=> (not res!315712) (not e!301153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46740 (= res!315712 (validMask!0 mask!3524))))

(assert (=> start!46740 e!301153))

(assert (=> start!46740 true))

(declare-fun array_inv!11782 (array!33062) Bool)

(assert (=> start!46740 (array_inv!11782 a!3235)))

(declare-fun b!516008 () Bool)

(assert (=> b!516008 (= e!301155 (not e!301151))))

(declare-fun res!315708 () Bool)

(assert (=> b!516008 (=> res!315708 e!301151)))

(declare-fun lt!236107 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33062 (_ BitVec 32)) SeekEntryResult!4363)

(assert (=> b!516008 (= res!315708 (= lt!236106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236107 (select (store (arr!15899 a!3235) i!1204 k0!2280) j!176) (array!33063 (store (arr!15899 a!3235) i!1204 k0!2280) (size!16264 a!3235)) mask!3524)))))

(declare-fun lt!236108 () (_ BitVec 32))

(assert (=> b!516008 (= lt!236106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236108 (select (arr!15899 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516008 (= lt!236107 (toIndex!0 (select (store (arr!15899 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516008 (= lt!236108 (toIndex!0 (select (arr!15899 a!3235) j!176) mask!3524))))

(assert (=> b!516008 e!301154))

(declare-fun res!315714 () Bool)

(assert (=> b!516008 (=> (not res!315714) (not e!301154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33062 (_ BitVec 32)) Bool)

(assert (=> b!516008 (= res!315714 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15970 0))(
  ( (Unit!15971) )
))
(declare-fun lt!236110 () Unit!15970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15970)

(assert (=> b!516008 (= lt!236110 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516009 () Bool)

(declare-fun res!315715 () Bool)

(assert (=> b!516009 (=> (not res!315715) (not e!301155))))

(assert (=> b!516009 (= res!315715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516010 () Bool)

(declare-fun res!315709 () Bool)

(assert (=> b!516010 (=> (not res!315709) (not e!301153))))

(assert (=> b!516010 (= res!315709 (validKeyInArray!0 k0!2280))))

(assert (= (and start!46740 res!315712) b!516004))

(assert (= (and b!516004 res!315707) b!516003))

(assert (= (and b!516003 res!315711) b!516010))

(assert (= (and b!516010 res!315709) b!516002))

(assert (= (and b!516002 res!315713) b!516006))

(assert (= (and b!516006 res!315716) b!516009))

(assert (= (and b!516009 res!315715) b!516005))

(assert (= (and b!516005 res!315706) b!516008))

(assert (= (and b!516008 res!315714) b!516007))

(assert (= (and b!516008 (not res!315708)) b!516000))

(assert (= (and b!516000 (not res!315710)) b!516001))

(declare-fun m!496981 () Bool)

(assert (=> start!46740 m!496981))

(declare-fun m!496983 () Bool)

(assert (=> start!46740 m!496983))

(declare-fun m!496985 () Bool)

(assert (=> b!516005 m!496985))

(declare-fun m!496987 () Bool)

(assert (=> b!516008 m!496987))

(declare-fun m!496989 () Bool)

(assert (=> b!516008 m!496989))

(declare-fun m!496991 () Bool)

(assert (=> b!516008 m!496991))

(assert (=> b!516008 m!496991))

(declare-fun m!496993 () Bool)

(assert (=> b!516008 m!496993))

(declare-fun m!496995 () Bool)

(assert (=> b!516008 m!496995))

(declare-fun m!496997 () Bool)

(assert (=> b!516008 m!496997))

(assert (=> b!516008 m!496995))

(assert (=> b!516008 m!496995))

(declare-fun m!496999 () Bool)

(assert (=> b!516008 m!496999))

(declare-fun m!497001 () Bool)

(assert (=> b!516008 m!497001))

(assert (=> b!516008 m!496991))

(declare-fun m!497003 () Bool)

(assert (=> b!516008 m!497003))

(declare-fun m!497005 () Bool)

(assert (=> b!516010 m!497005))

(declare-fun m!497007 () Bool)

(assert (=> b!516002 m!497007))

(declare-fun m!497009 () Bool)

(assert (=> b!516009 m!497009))

(assert (=> b!516003 m!496995))

(assert (=> b!516003 m!496995))

(declare-fun m!497011 () Bool)

(assert (=> b!516003 m!497011))

(declare-fun m!497013 () Bool)

(assert (=> b!516001 m!497013))

(assert (=> b!516001 m!496995))

(assert (=> b!516007 m!496995))

(assert (=> b!516007 m!496995))

(declare-fun m!497015 () Bool)

(assert (=> b!516007 m!497015))

(declare-fun m!497017 () Bool)

(assert (=> b!516006 m!497017))

(check-sat (not b!516007) (not b!516008) (not b!516009) (not b!516003) (not b!516005) (not start!46740) (not b!516002) (not b!516006) (not b!516010))
(check-sat)
