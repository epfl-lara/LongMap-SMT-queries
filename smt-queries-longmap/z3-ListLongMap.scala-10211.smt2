; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120320 () Bool)

(assert start!120320)

(declare-fun b!1400289 () Bool)

(declare-fun res!938803 () Bool)

(declare-fun e!792800 () Bool)

(assert (=> b!1400289 (=> (not res!938803) (not e!792800))))

(declare-datatypes ((array!95729 0))(
  ( (array!95730 (arr!46215 (Array (_ BitVec 32) (_ BitVec 64))) (size!46765 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95729)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400289 (= res!938803 (validKeyInArray!0 (select (arr!46215 a!2901) i!1037)))))

(declare-fun b!1400290 () Bool)

(declare-fun res!938802 () Bool)

(assert (=> b!1400290 (=> (not res!938802) (not e!792800))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400290 (= res!938802 (and (= (size!46765 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46765 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46765 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400291 () Bool)

(declare-fun e!792805 () Bool)

(assert (=> b!1400291 (= e!792800 (not e!792805))))

(declare-fun res!938799 () Bool)

(assert (=> b!1400291 (=> res!938799 e!792805)))

(declare-datatypes ((SeekEntryResult!10532 0))(
  ( (MissingZero!10532 (index!44505 (_ BitVec 32))) (Found!10532 (index!44506 (_ BitVec 32))) (Intermediate!10532 (undefined!11344 Bool) (index!44507 (_ BitVec 32)) (x!126151 (_ BitVec 32))) (Undefined!10532) (MissingVacant!10532 (index!44508 (_ BitVec 32))) )
))
(declare-fun lt!616097 () SeekEntryResult!10532)

(get-info :version)

(assert (=> b!1400291 (= res!938799 (or (not ((_ is Intermediate!10532) lt!616097)) (undefined!11344 lt!616097)))))

(declare-fun e!792803 () Bool)

(assert (=> b!1400291 e!792803))

(declare-fun res!938807 () Bool)

(assert (=> b!1400291 (=> (not res!938807) (not e!792803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95729 (_ BitVec 32)) Bool)

(assert (=> b!1400291 (= res!938807 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47068 0))(
  ( (Unit!47069) )
))
(declare-fun lt!616096 () Unit!47068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47068)

(assert (=> b!1400291 (= lt!616096 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616095 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95729 (_ BitVec 32)) SeekEntryResult!10532)

(assert (=> b!1400291 (= lt!616097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616095 (select (arr!46215 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400291 (= lt!616095 (toIndex!0 (select (arr!46215 a!2901) j!112) mask!2840))))

(declare-fun b!1400292 () Bool)

(declare-fun e!792801 () Bool)

(declare-fun e!792802 () Bool)

(assert (=> b!1400292 (= e!792801 e!792802)))

(declare-fun res!938800 () Bool)

(assert (=> b!1400292 (=> res!938800 e!792802)))

(declare-fun lt!616101 () SeekEntryResult!10532)

(assert (=> b!1400292 (= res!938800 (or (bvslt (x!126151 lt!616097) #b00000000000000000000000000000000) (bvsgt (x!126151 lt!616097) #b01111111111111111111111111111110) (bvslt (x!126151 lt!616101) #b00000000000000000000000000000000) (bvsgt (x!126151 lt!616101) #b01111111111111111111111111111110) (bvslt lt!616095 #b00000000000000000000000000000000) (bvsge lt!616095 (size!46765 a!2901)) (bvslt (index!44507 lt!616097) #b00000000000000000000000000000000) (bvsge (index!44507 lt!616097) (size!46765 a!2901)) (bvslt (index!44507 lt!616101) #b00000000000000000000000000000000) (bvsge (index!44507 lt!616101) (size!46765 a!2901)) (not (= lt!616097 (Intermediate!10532 false (index!44507 lt!616097) (x!126151 lt!616097)))) (not (= lt!616101 (Intermediate!10532 false (index!44507 lt!616101) (x!126151 lt!616101))))))))

(declare-fun e!792804 () Bool)

(assert (=> b!1400292 e!792804))

(declare-fun res!938805 () Bool)

(assert (=> b!1400292 (=> (not res!938805) (not e!792804))))

(assert (=> b!1400292 (= res!938805 (and (not (undefined!11344 lt!616101)) (= (index!44507 lt!616101) i!1037) (bvslt (x!126151 lt!616101) (x!126151 lt!616097)) (= (select (store (arr!46215 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44507 lt!616101)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616099 () Unit!47068)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47068)

(assert (=> b!1400292 (= lt!616099 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616095 (x!126151 lt!616097) (index!44507 lt!616097) (x!126151 lt!616101) (index!44507 lt!616101) (undefined!11344 lt!616101) mask!2840))))

(declare-fun b!1400293 () Bool)

(assert (=> b!1400293 (= e!792805 e!792801)))

(declare-fun res!938801 () Bool)

(assert (=> b!1400293 (=> res!938801 e!792801)))

(assert (=> b!1400293 (= res!938801 (or (= lt!616097 lt!616101) (not ((_ is Intermediate!10532) lt!616101))))))

(declare-fun lt!616094 () (_ BitVec 64))

(declare-fun lt!616098 () array!95729)

(assert (=> b!1400293 (= lt!616101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616094 mask!2840) lt!616094 lt!616098 mask!2840))))

(assert (=> b!1400293 (= lt!616094 (select (store (arr!46215 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400293 (= lt!616098 (array!95730 (store (arr!46215 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46765 a!2901)))))

(declare-fun b!1400294 () Bool)

(declare-fun res!938809 () Bool)

(assert (=> b!1400294 (=> (not res!938809) (not e!792800))))

(assert (=> b!1400294 (= res!938809 (validKeyInArray!0 (select (arr!46215 a!2901) j!112)))))

(declare-fun res!938808 () Bool)

(assert (=> start!120320 (=> (not res!938808) (not e!792800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120320 (= res!938808 (validMask!0 mask!2840))))

(assert (=> start!120320 e!792800))

(assert (=> start!120320 true))

(declare-fun array_inv!35243 (array!95729) Bool)

(assert (=> start!120320 (array_inv!35243 a!2901)))

(declare-fun b!1400288 () Bool)

(declare-fun res!938804 () Bool)

(assert (=> b!1400288 (=> (not res!938804) (not e!792800))))

(assert (=> b!1400288 (= res!938804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400295 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95729 (_ BitVec 32)) SeekEntryResult!10532)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95729 (_ BitVec 32)) SeekEntryResult!10532)

(assert (=> b!1400295 (= e!792804 (= (seekEntryOrOpen!0 lt!616094 lt!616098 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126151 lt!616101) (index!44507 lt!616101) (index!44507 lt!616101) (select (arr!46215 a!2901) j!112) lt!616098 mask!2840)))))

(declare-fun b!1400296 () Bool)

(assert (=> b!1400296 (= e!792803 (= (seekEntryOrOpen!0 (select (arr!46215 a!2901) j!112) a!2901 mask!2840) (Found!10532 j!112)))))

(declare-fun b!1400297 () Bool)

(declare-fun res!938806 () Bool)

(assert (=> b!1400297 (=> (not res!938806) (not e!792800))))

(declare-datatypes ((List!32734 0))(
  ( (Nil!32731) (Cons!32730 (h!33978 (_ BitVec 64)) (t!47428 List!32734)) )
))
(declare-fun arrayNoDuplicates!0 (array!95729 (_ BitVec 32) List!32734) Bool)

(assert (=> b!1400297 (= res!938806 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32731))))

(declare-fun b!1400298 () Bool)

(assert (=> b!1400298 (= e!792802 true)))

(declare-fun lt!616100 () SeekEntryResult!10532)

(assert (=> b!1400298 (= lt!616100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616095 lt!616094 lt!616098 mask!2840))))

(assert (= (and start!120320 res!938808) b!1400290))

(assert (= (and b!1400290 res!938802) b!1400289))

(assert (= (and b!1400289 res!938803) b!1400294))

(assert (= (and b!1400294 res!938809) b!1400288))

(assert (= (and b!1400288 res!938804) b!1400297))

(assert (= (and b!1400297 res!938806) b!1400291))

(assert (= (and b!1400291 res!938807) b!1400296))

(assert (= (and b!1400291 (not res!938799)) b!1400293))

(assert (= (and b!1400293 (not res!938801)) b!1400292))

(assert (= (and b!1400292 res!938805) b!1400295))

(assert (= (and b!1400292 (not res!938800)) b!1400298))

(declare-fun m!1287689 () Bool)

(assert (=> b!1400297 m!1287689))

(declare-fun m!1287691 () Bool)

(assert (=> b!1400293 m!1287691))

(assert (=> b!1400293 m!1287691))

(declare-fun m!1287693 () Bool)

(assert (=> b!1400293 m!1287693))

(declare-fun m!1287695 () Bool)

(assert (=> b!1400293 m!1287695))

(declare-fun m!1287697 () Bool)

(assert (=> b!1400293 m!1287697))

(declare-fun m!1287699 () Bool)

(assert (=> b!1400288 m!1287699))

(assert (=> b!1400292 m!1287695))

(declare-fun m!1287701 () Bool)

(assert (=> b!1400292 m!1287701))

(declare-fun m!1287703 () Bool)

(assert (=> b!1400292 m!1287703))

(declare-fun m!1287705 () Bool)

(assert (=> b!1400291 m!1287705))

(declare-fun m!1287707 () Bool)

(assert (=> b!1400291 m!1287707))

(assert (=> b!1400291 m!1287705))

(declare-fun m!1287709 () Bool)

(assert (=> b!1400291 m!1287709))

(assert (=> b!1400291 m!1287705))

(declare-fun m!1287711 () Bool)

(assert (=> b!1400291 m!1287711))

(declare-fun m!1287713 () Bool)

(assert (=> b!1400291 m!1287713))

(declare-fun m!1287715 () Bool)

(assert (=> b!1400289 m!1287715))

(assert (=> b!1400289 m!1287715))

(declare-fun m!1287717 () Bool)

(assert (=> b!1400289 m!1287717))

(declare-fun m!1287719 () Bool)

(assert (=> b!1400298 m!1287719))

(assert (=> b!1400294 m!1287705))

(assert (=> b!1400294 m!1287705))

(declare-fun m!1287721 () Bool)

(assert (=> b!1400294 m!1287721))

(declare-fun m!1287723 () Bool)

(assert (=> start!120320 m!1287723))

(declare-fun m!1287725 () Bool)

(assert (=> start!120320 m!1287725))

(declare-fun m!1287727 () Bool)

(assert (=> b!1400295 m!1287727))

(assert (=> b!1400295 m!1287705))

(assert (=> b!1400295 m!1287705))

(declare-fun m!1287729 () Bool)

(assert (=> b!1400295 m!1287729))

(assert (=> b!1400296 m!1287705))

(assert (=> b!1400296 m!1287705))

(declare-fun m!1287731 () Bool)

(assert (=> b!1400296 m!1287731))

(check-sat (not b!1400294) (not b!1400295) (not b!1400291) (not b!1400293) (not b!1400288) (not b!1400292) (not b!1400296) (not start!120320) (not b!1400297) (not b!1400298) (not b!1400289))
(check-sat)
