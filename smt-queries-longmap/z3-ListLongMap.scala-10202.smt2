; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120386 () Bool)

(assert start!120386)

(declare-fun b!1400227 () Bool)

(declare-fun e!792806 () Bool)

(assert (=> b!1400227 (= e!792806 true)))

(declare-datatypes ((array!95780 0))(
  ( (array!95781 (arr!46240 (Array (_ BitVec 32) (_ BitVec 64))) (size!46791 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95780)

(declare-datatypes ((SeekEntryResult!10460 0))(
  ( (MissingZero!10460 (index!44214 (_ BitVec 32))) (Found!10460 (index!44215 (_ BitVec 32))) (Intermediate!10460 (undefined!11272 Bool) (index!44216 (_ BitVec 32)) (x!126014 (_ BitVec 32))) (Undefined!10460) (MissingVacant!10460 (index!44217 (_ BitVec 32))) )
))
(declare-fun lt!615715 () SeekEntryResult!10460)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!615719 () SeekEntryResult!10460)

(assert (=> b!1400227 (and (not (undefined!11272 lt!615719)) (= (index!44216 lt!615719) i!1037) (bvslt (x!126014 lt!615719) (x!126014 lt!615715)) (= (select (store (arr!46240 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44216 lt!615719)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615716 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!46951 0))(
  ( (Unit!46952) )
))
(declare-fun lt!615718 () Unit!46951)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46951)

(assert (=> b!1400227 (= lt!615718 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615716 (x!126014 lt!615715) (index!44216 lt!615715) (x!126014 lt!615719) (index!44216 lt!615719) (undefined!11272 lt!615719) mask!2840))))

(declare-fun b!1400228 () Bool)

(declare-fun res!938299 () Bool)

(declare-fun e!792807 () Bool)

(assert (=> b!1400228 (=> (not res!938299) (not e!792807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400228 (= res!938299 (validKeyInArray!0 (select (arr!46240 a!2901) j!112)))))

(declare-fun e!792809 () Bool)

(declare-fun b!1400230 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95780 (_ BitVec 32)) SeekEntryResult!10460)

(assert (=> b!1400230 (= e!792809 (= (seekEntryOrOpen!0 (select (arr!46240 a!2901) j!112) a!2901 mask!2840) (Found!10460 j!112)))))

(declare-fun b!1400231 () Bool)

(declare-fun res!938295 () Bool)

(assert (=> b!1400231 (=> (not res!938295) (not e!792807))))

(assert (=> b!1400231 (= res!938295 (validKeyInArray!0 (select (arr!46240 a!2901) i!1037)))))

(declare-fun b!1400232 () Bool)

(declare-fun res!938292 () Bool)

(assert (=> b!1400232 (=> (not res!938292) (not e!792807))))

(assert (=> b!1400232 (= res!938292 (and (= (size!46791 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46791 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46791 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400233 () Bool)

(declare-fun e!792805 () Bool)

(assert (=> b!1400233 (= e!792807 (not e!792805))))

(declare-fun res!938293 () Bool)

(assert (=> b!1400233 (=> res!938293 e!792805)))

(get-info :version)

(assert (=> b!1400233 (= res!938293 (or (not ((_ is Intermediate!10460) lt!615715)) (undefined!11272 lt!615715)))))

(assert (=> b!1400233 e!792809))

(declare-fun res!938296 () Bool)

(assert (=> b!1400233 (=> (not res!938296) (not e!792809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95780 (_ BitVec 32)) Bool)

(assert (=> b!1400233 (= res!938296 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615714 () Unit!46951)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46951)

(assert (=> b!1400233 (= lt!615714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95780 (_ BitVec 32)) SeekEntryResult!10460)

(assert (=> b!1400233 (= lt!615715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615716 (select (arr!46240 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400233 (= lt!615716 (toIndex!0 (select (arr!46240 a!2901) j!112) mask!2840))))

(declare-fun b!1400234 () Bool)

(declare-fun res!938297 () Bool)

(assert (=> b!1400234 (=> (not res!938297) (not e!792807))))

(declare-datatypes ((List!32746 0))(
  ( (Nil!32743) (Cons!32742 (h!33995 (_ BitVec 64)) (t!47432 List!32746)) )
))
(declare-fun arrayNoDuplicates!0 (array!95780 (_ BitVec 32) List!32746) Bool)

(assert (=> b!1400234 (= res!938297 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32743))))

(declare-fun b!1400235 () Bool)

(declare-fun res!938294 () Bool)

(assert (=> b!1400235 (=> (not res!938294) (not e!792807))))

(assert (=> b!1400235 (= res!938294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!938298 () Bool)

(assert (=> start!120386 (=> (not res!938298) (not e!792807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120386 (= res!938298 (validMask!0 mask!2840))))

(assert (=> start!120386 e!792807))

(assert (=> start!120386 true))

(declare-fun array_inv!35521 (array!95780) Bool)

(assert (=> start!120386 (array_inv!35521 a!2901)))

(declare-fun b!1400229 () Bool)

(assert (=> b!1400229 (= e!792805 e!792806)))

(declare-fun res!938291 () Bool)

(assert (=> b!1400229 (=> res!938291 e!792806)))

(assert (=> b!1400229 (= res!938291 (or (= lt!615715 lt!615719) (not ((_ is Intermediate!10460) lt!615719))))))

(declare-fun lt!615717 () (_ BitVec 64))

(assert (=> b!1400229 (= lt!615719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615717 mask!2840) lt!615717 (array!95781 (store (arr!46240 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46791 a!2901)) mask!2840))))

(assert (=> b!1400229 (= lt!615717 (select (store (arr!46240 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!120386 res!938298) b!1400232))

(assert (= (and b!1400232 res!938292) b!1400231))

(assert (= (and b!1400231 res!938295) b!1400228))

(assert (= (and b!1400228 res!938299) b!1400235))

(assert (= (and b!1400235 res!938294) b!1400234))

(assert (= (and b!1400234 res!938297) b!1400233))

(assert (= (and b!1400233 res!938296) b!1400230))

(assert (= (and b!1400233 (not res!938293)) b!1400229))

(assert (= (and b!1400229 (not res!938291)) b!1400227))

(declare-fun m!1287655 () Bool)

(assert (=> b!1400230 m!1287655))

(assert (=> b!1400230 m!1287655))

(declare-fun m!1287657 () Bool)

(assert (=> b!1400230 m!1287657))

(declare-fun m!1287659 () Bool)

(assert (=> start!120386 m!1287659))

(declare-fun m!1287661 () Bool)

(assert (=> start!120386 m!1287661))

(declare-fun m!1287663 () Bool)

(assert (=> b!1400231 m!1287663))

(assert (=> b!1400231 m!1287663))

(declare-fun m!1287665 () Bool)

(assert (=> b!1400231 m!1287665))

(declare-fun m!1287667 () Bool)

(assert (=> b!1400234 m!1287667))

(declare-fun m!1287669 () Bool)

(assert (=> b!1400235 m!1287669))

(declare-fun m!1287671 () Bool)

(assert (=> b!1400229 m!1287671))

(declare-fun m!1287673 () Bool)

(assert (=> b!1400229 m!1287673))

(assert (=> b!1400229 m!1287671))

(declare-fun m!1287675 () Bool)

(assert (=> b!1400229 m!1287675))

(declare-fun m!1287677 () Bool)

(assert (=> b!1400229 m!1287677))

(assert (=> b!1400228 m!1287655))

(assert (=> b!1400228 m!1287655))

(declare-fun m!1287679 () Bool)

(assert (=> b!1400228 m!1287679))

(assert (=> b!1400233 m!1287655))

(declare-fun m!1287681 () Bool)

(assert (=> b!1400233 m!1287681))

(assert (=> b!1400233 m!1287655))

(assert (=> b!1400233 m!1287655))

(declare-fun m!1287683 () Bool)

(assert (=> b!1400233 m!1287683))

(declare-fun m!1287685 () Bool)

(assert (=> b!1400233 m!1287685))

(declare-fun m!1287687 () Bool)

(assert (=> b!1400233 m!1287687))

(assert (=> b!1400227 m!1287673))

(declare-fun m!1287689 () Bool)

(assert (=> b!1400227 m!1287689))

(declare-fun m!1287691 () Bool)

(assert (=> b!1400227 m!1287691))

(check-sat (not b!1400231) (not b!1400235) (not b!1400234) (not b!1400227) (not b!1400229) (not b!1400230) (not start!120386) (not b!1400233) (not b!1400228))
(check-sat)
