; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120194 () Bool)

(assert start!120194)

(declare-fun b!1399006 () Bool)

(declare-fun res!937813 () Bool)

(declare-fun e!792031 () Bool)

(assert (=> b!1399006 (=> (not res!937813) (not e!792031))))

(declare-datatypes ((array!95619 0))(
  ( (array!95620 (arr!46162 (Array (_ BitVec 32) (_ BitVec 64))) (size!46714 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95619)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399006 (= res!937813 (validKeyInArray!0 (select (arr!46162 a!2901) j!112)))))

(declare-fun b!1399007 () Bool)

(declare-fun res!937812 () Bool)

(assert (=> b!1399007 (=> (not res!937812) (not e!792031))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95619 (_ BitVec 32)) Bool)

(assert (=> b!1399007 (= res!937812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399008 () Bool)

(declare-fun e!792030 () Bool)

(declare-fun e!792032 () Bool)

(assert (=> b!1399008 (= e!792030 e!792032)))

(declare-fun res!937806 () Bool)

(assert (=> b!1399008 (=> res!937806 e!792032)))

(declare-datatypes ((SeekEntryResult!10505 0))(
  ( (MissingZero!10505 (index!44394 (_ BitVec 32))) (Found!10505 (index!44395 (_ BitVec 32))) (Intermediate!10505 (undefined!11317 Bool) (index!44396 (_ BitVec 32)) (x!126037 (_ BitVec 32))) (Undefined!10505) (MissingVacant!10505 (index!44397 (_ BitVec 32))) )
))
(declare-fun lt!615128 () SeekEntryResult!10505)

(declare-fun lt!615126 () SeekEntryResult!10505)

(get-info :version)

(assert (=> b!1399008 (= res!937806 (or (= lt!615128 lt!615126) (not ((_ is Intermediate!10505) lt!615126))))))

(declare-fun lt!615131 () (_ BitVec 64))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95619 (_ BitVec 32)) SeekEntryResult!10505)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399008 (= lt!615126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615131 mask!2840) lt!615131 (array!95620 (store (arr!46162 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46714 a!2901)) mask!2840))))

(assert (=> b!1399008 (= lt!615131 (select (store (arr!46162 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399009 () Bool)

(assert (=> b!1399009 (= e!792032 true)))

(assert (=> b!1399009 (and (not (undefined!11317 lt!615126)) (= (index!44396 lt!615126) i!1037) (bvslt (x!126037 lt!615126) (x!126037 lt!615128)) (= (select (store (arr!46162 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44396 lt!615126)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615129 () (_ BitVec 32))

(declare-datatypes ((Unit!46857 0))(
  ( (Unit!46858) )
))
(declare-fun lt!615127 () Unit!46857)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46857)

(assert (=> b!1399009 (= lt!615127 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615129 (x!126037 lt!615128) (index!44396 lt!615128) (x!126037 lt!615126) (index!44396 lt!615126) (undefined!11317 lt!615126) mask!2840))))

(declare-fun b!1399010 () Bool)

(declare-fun res!937810 () Bool)

(assert (=> b!1399010 (=> (not res!937810) (not e!792031))))

(assert (=> b!1399010 (= res!937810 (validKeyInArray!0 (select (arr!46162 a!2901) i!1037)))))

(declare-fun b!1399012 () Bool)

(declare-fun e!792028 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95619 (_ BitVec 32)) SeekEntryResult!10505)

(assert (=> b!1399012 (= e!792028 (= (seekEntryOrOpen!0 (select (arr!46162 a!2901) j!112) a!2901 mask!2840) (Found!10505 j!112)))))

(declare-fun b!1399013 () Bool)

(assert (=> b!1399013 (= e!792031 (not e!792030))))

(declare-fun res!937811 () Bool)

(assert (=> b!1399013 (=> res!937811 e!792030)))

(assert (=> b!1399013 (= res!937811 (or (not ((_ is Intermediate!10505) lt!615128)) (undefined!11317 lt!615128)))))

(assert (=> b!1399013 e!792028))

(declare-fun res!937805 () Bool)

(assert (=> b!1399013 (=> (not res!937805) (not e!792028))))

(assert (=> b!1399013 (= res!937805 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615130 () Unit!46857)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46857)

(assert (=> b!1399013 (= lt!615130 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399013 (= lt!615128 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615129 (select (arr!46162 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399013 (= lt!615129 (toIndex!0 (select (arr!46162 a!2901) j!112) mask!2840))))

(declare-fun b!1399014 () Bool)

(declare-fun res!937807 () Bool)

(assert (=> b!1399014 (=> (not res!937807) (not e!792031))))

(declare-datatypes ((List!32759 0))(
  ( (Nil!32756) (Cons!32755 (h!34000 (_ BitVec 64)) (t!47445 List!32759)) )
))
(declare-fun arrayNoDuplicates!0 (array!95619 (_ BitVec 32) List!32759) Bool)

(assert (=> b!1399014 (= res!937807 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32756))))

(declare-fun res!937808 () Bool)

(assert (=> start!120194 (=> (not res!937808) (not e!792031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120194 (= res!937808 (validMask!0 mask!2840))))

(assert (=> start!120194 e!792031))

(assert (=> start!120194 true))

(declare-fun array_inv!35395 (array!95619) Bool)

(assert (=> start!120194 (array_inv!35395 a!2901)))

(declare-fun b!1399011 () Bool)

(declare-fun res!937809 () Bool)

(assert (=> b!1399011 (=> (not res!937809) (not e!792031))))

(assert (=> b!1399011 (= res!937809 (and (= (size!46714 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46714 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46714 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120194 res!937808) b!1399011))

(assert (= (and b!1399011 res!937809) b!1399010))

(assert (= (and b!1399010 res!937810) b!1399006))

(assert (= (and b!1399006 res!937813) b!1399007))

(assert (= (and b!1399007 res!937812) b!1399014))

(assert (= (and b!1399014 res!937807) b!1399013))

(assert (= (and b!1399013 res!937805) b!1399012))

(assert (= (and b!1399013 (not res!937811)) b!1399008))

(assert (= (and b!1399008 (not res!937806)) b!1399009))

(declare-fun m!1285747 () Bool)

(assert (=> b!1399013 m!1285747))

(declare-fun m!1285749 () Bool)

(assert (=> b!1399013 m!1285749))

(assert (=> b!1399013 m!1285747))

(declare-fun m!1285751 () Bool)

(assert (=> b!1399013 m!1285751))

(assert (=> b!1399013 m!1285747))

(declare-fun m!1285753 () Bool)

(assert (=> b!1399013 m!1285753))

(declare-fun m!1285755 () Bool)

(assert (=> b!1399013 m!1285755))

(assert (=> b!1399012 m!1285747))

(assert (=> b!1399012 m!1285747))

(declare-fun m!1285757 () Bool)

(assert (=> b!1399012 m!1285757))

(declare-fun m!1285759 () Bool)

(assert (=> b!1399009 m!1285759))

(declare-fun m!1285761 () Bool)

(assert (=> b!1399009 m!1285761))

(declare-fun m!1285763 () Bool)

(assert (=> b!1399009 m!1285763))

(declare-fun m!1285765 () Bool)

(assert (=> b!1399008 m!1285765))

(assert (=> b!1399008 m!1285759))

(assert (=> b!1399008 m!1285765))

(declare-fun m!1285767 () Bool)

(assert (=> b!1399008 m!1285767))

(declare-fun m!1285769 () Bool)

(assert (=> b!1399008 m!1285769))

(declare-fun m!1285771 () Bool)

(assert (=> b!1399014 m!1285771))

(declare-fun m!1285773 () Bool)

(assert (=> start!120194 m!1285773))

(declare-fun m!1285775 () Bool)

(assert (=> start!120194 m!1285775))

(declare-fun m!1285777 () Bool)

(assert (=> b!1399007 m!1285777))

(declare-fun m!1285779 () Bool)

(assert (=> b!1399010 m!1285779))

(assert (=> b!1399010 m!1285779))

(declare-fun m!1285781 () Bool)

(assert (=> b!1399010 m!1285781))

(assert (=> b!1399006 m!1285747))

(assert (=> b!1399006 m!1285747))

(declare-fun m!1285783 () Bool)

(assert (=> b!1399006 m!1285783))

(check-sat (not b!1399008) (not b!1399007) (not start!120194) (not b!1399014) (not b!1399006) (not b!1399010) (not b!1399013) (not b!1399009) (not b!1399012))
(check-sat)
