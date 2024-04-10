; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119440 () Bool)

(assert start!119440)

(declare-fun b!1392005 () Bool)

(declare-fun res!931725 () Bool)

(declare-fun e!788243 () Bool)

(assert (=> b!1392005 (=> (not res!931725) (not e!788243))))

(declare-datatypes ((array!95224 0))(
  ( (array!95225 (arr!45973 (Array (_ BitVec 32) (_ BitVec 64))) (size!46523 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95224)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392005 (= res!931725 (validKeyInArray!0 (select (arr!45973 a!2901) i!1037)))))

(declare-fun b!1392006 () Bool)

(declare-fun res!931732 () Bool)

(assert (=> b!1392006 (=> (not res!931732) (not e!788243))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1392006 (= res!931732 (validKeyInArray!0 (select (arr!45973 a!2901) j!112)))))

(declare-fun e!788244 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1392007 () Bool)

(declare-datatypes ((SeekEntryResult!10290 0))(
  ( (MissingZero!10290 (index!43531 (_ BitVec 32))) (Found!10290 (index!43532 (_ BitVec 32))) (Intermediate!10290 (undefined!11102 Bool) (index!43533 (_ BitVec 32)) (x!125210 (_ BitVec 32))) (Undefined!10290) (MissingVacant!10290 (index!43534 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95224 (_ BitVec 32)) SeekEntryResult!10290)

(assert (=> b!1392007 (= e!788244 (= (seekEntryOrOpen!0 (select (arr!45973 a!2901) j!112) a!2901 mask!2840) (Found!10290 j!112)))))

(declare-fun b!1392008 () Bool)

(declare-fun e!788245 () Bool)

(assert (=> b!1392008 (= e!788243 (not e!788245))))

(declare-fun res!931729 () Bool)

(assert (=> b!1392008 (=> res!931729 e!788245)))

(declare-fun lt!611429 () SeekEntryResult!10290)

(assert (=> b!1392008 (= res!931729 (or (not (is-Intermediate!10290 lt!611429)) (undefined!11102 lt!611429)))))

(assert (=> b!1392008 e!788244))

(declare-fun res!931731 () Bool)

(assert (=> b!1392008 (=> (not res!931731) (not e!788244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95224 (_ BitVec 32)) Bool)

(assert (=> b!1392008 (= res!931731 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46584 0))(
  ( (Unit!46585) )
))
(declare-fun lt!611430 () Unit!46584)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46584)

(assert (=> b!1392008 (= lt!611430 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95224 (_ BitVec 32)) SeekEntryResult!10290)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392008 (= lt!611429 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45973 a!2901) j!112) mask!2840) (select (arr!45973 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392009 () Bool)

(declare-fun res!931728 () Bool)

(assert (=> b!1392009 (=> (not res!931728) (not e!788243))))

(assert (=> b!1392009 (= res!931728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!931726 () Bool)

(assert (=> start!119440 (=> (not res!931726) (not e!788243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119440 (= res!931726 (validMask!0 mask!2840))))

(assert (=> start!119440 e!788243))

(assert (=> start!119440 true))

(declare-fun array_inv!35001 (array!95224) Bool)

(assert (=> start!119440 (array_inv!35001 a!2901)))

(declare-fun b!1392010 () Bool)

(declare-fun res!931727 () Bool)

(assert (=> b!1392010 (=> (not res!931727) (not e!788243))))

(declare-datatypes ((List!32492 0))(
  ( (Nil!32489) (Cons!32488 (h!33715 (_ BitVec 64)) (t!47186 List!32492)) )
))
(declare-fun arrayNoDuplicates!0 (array!95224 (_ BitVec 32) List!32492) Bool)

(assert (=> b!1392010 (= res!931727 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32489))))

(declare-fun b!1392011 () Bool)

(assert (=> b!1392011 (= e!788245 true)))

(declare-fun lt!611428 () (_ BitVec 32))

(assert (=> b!1392011 (= lt!611428 (toIndex!0 (select (store (arr!45973 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1392012 () Bool)

(declare-fun res!931730 () Bool)

(assert (=> b!1392012 (=> (not res!931730) (not e!788243))))

(assert (=> b!1392012 (= res!931730 (and (= (size!46523 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46523 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46523 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119440 res!931726) b!1392012))

(assert (= (and b!1392012 res!931730) b!1392005))

(assert (= (and b!1392005 res!931725) b!1392006))

(assert (= (and b!1392006 res!931732) b!1392009))

(assert (= (and b!1392009 res!931728) b!1392010))

(assert (= (and b!1392010 res!931727) b!1392008))

(assert (= (and b!1392008 res!931731) b!1392007))

(assert (= (and b!1392008 (not res!931729)) b!1392011))

(declare-fun m!1277779 () Bool)

(assert (=> b!1392010 m!1277779))

(declare-fun m!1277781 () Bool)

(assert (=> b!1392006 m!1277781))

(assert (=> b!1392006 m!1277781))

(declare-fun m!1277783 () Bool)

(assert (=> b!1392006 m!1277783))

(declare-fun m!1277785 () Bool)

(assert (=> b!1392011 m!1277785))

(declare-fun m!1277787 () Bool)

(assert (=> b!1392011 m!1277787))

(assert (=> b!1392011 m!1277787))

(declare-fun m!1277789 () Bool)

(assert (=> b!1392011 m!1277789))

(declare-fun m!1277791 () Bool)

(assert (=> b!1392005 m!1277791))

(assert (=> b!1392005 m!1277791))

(declare-fun m!1277793 () Bool)

(assert (=> b!1392005 m!1277793))

(declare-fun m!1277795 () Bool)

(assert (=> b!1392009 m!1277795))

(assert (=> b!1392008 m!1277781))

(declare-fun m!1277797 () Bool)

(assert (=> b!1392008 m!1277797))

(assert (=> b!1392008 m!1277781))

(declare-fun m!1277799 () Bool)

(assert (=> b!1392008 m!1277799))

(assert (=> b!1392008 m!1277797))

(assert (=> b!1392008 m!1277781))

(declare-fun m!1277801 () Bool)

(assert (=> b!1392008 m!1277801))

(declare-fun m!1277803 () Bool)

(assert (=> b!1392008 m!1277803))

(declare-fun m!1277805 () Bool)

(assert (=> start!119440 m!1277805))

(declare-fun m!1277807 () Bool)

(assert (=> start!119440 m!1277807))

(assert (=> b!1392007 m!1277781))

(assert (=> b!1392007 m!1277781))

(declare-fun m!1277809 () Bool)

(assert (=> b!1392007 m!1277809))

(push 1)

(assert (not start!119440))

(assert (not b!1392009))

(assert (not b!1392008))

(assert (not b!1392010))

(assert (not b!1392011))

(assert (not b!1392006))

(assert (not b!1392007))

(assert (not b!1392005))

(check-sat)

(pop 1)

(push 1)

