; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120092 () Bool)

(assert start!120092)

(declare-fun b!1398177 () Bool)

(declare-fun e!791550 () Bool)

(declare-fun e!791548 () Bool)

(assert (=> b!1398177 (= e!791550 (not e!791548))))

(declare-fun res!937149 () Bool)

(assert (=> b!1398177 (=> res!937149 e!791548)))

(declare-datatypes ((SeekEntryResult!10484 0))(
  ( (MissingZero!10484 (index!44307 (_ BitVec 32))) (Found!10484 (index!44308 (_ BitVec 32))) (Intermediate!10484 (undefined!11296 Bool) (index!44309 (_ BitVec 32)) (x!125951 (_ BitVec 32))) (Undefined!10484) (MissingVacant!10484 (index!44310 (_ BitVec 32))) )
))
(declare-fun lt!614624 () SeekEntryResult!10484)

(get-info :version)

(assert (=> b!1398177 (= res!937149 (or (not ((_ is Intermediate!10484) lt!614624)) (undefined!11296 lt!614624)))))

(declare-fun e!791551 () Bool)

(assert (=> b!1398177 e!791551))

(declare-fun res!937144 () Bool)

(assert (=> b!1398177 (=> (not res!937144) (not e!791551))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95574 0))(
  ( (array!95575 (arr!46141 (Array (_ BitVec 32) (_ BitVec 64))) (size!46693 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95574)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95574 (_ BitVec 32)) Bool)

(assert (=> b!1398177 (= res!937144 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46815 0))(
  ( (Unit!46816) )
))
(declare-fun lt!614621 () Unit!46815)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46815)

(assert (=> b!1398177 (= lt!614621 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614623 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95574 (_ BitVec 32)) SeekEntryResult!10484)

(assert (=> b!1398177 (= lt!614624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614623 (select (arr!46141 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398177 (= lt!614623 (toIndex!0 (select (arr!46141 a!2901) j!112) mask!2840))))

(declare-fun b!1398178 () Bool)

(declare-fun e!791552 () Bool)

(declare-fun e!791549 () Bool)

(assert (=> b!1398178 (= e!791552 e!791549)))

(declare-fun res!937143 () Bool)

(assert (=> b!1398178 (=> res!937143 e!791549)))

(assert (=> b!1398178 (= res!937143 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614620 () SeekEntryResult!10484)

(assert (=> b!1398178 (and (not (undefined!11296 lt!614620)) (= (index!44309 lt!614620) i!1037) (bvslt (x!125951 lt!614620) (x!125951 lt!614624)) (= (select (store (arr!46141 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44309 lt!614620)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614619 () Unit!46815)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46815)

(assert (=> b!1398178 (= lt!614619 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614623 (x!125951 lt!614624) (index!44309 lt!614624) (x!125951 lt!614620) (index!44309 lt!614620) (undefined!11296 lt!614620) mask!2840))))

(declare-fun b!1398179 () Bool)

(declare-fun res!937145 () Bool)

(assert (=> b!1398179 (=> (not res!937145) (not e!791550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398179 (= res!937145 (validKeyInArray!0 (select (arr!46141 a!2901) i!1037)))))

(declare-fun b!1398180 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95574 (_ BitVec 32)) SeekEntryResult!10484)

(assert (=> b!1398180 (= e!791551 (= (seekEntryOrOpen!0 (select (arr!46141 a!2901) j!112) a!2901 mask!2840) (Found!10484 j!112)))))

(declare-fun b!1398181 () Bool)

(declare-fun res!937150 () Bool)

(assert (=> b!1398181 (=> (not res!937150) (not e!791550))))

(declare-datatypes ((List!32738 0))(
  ( (Nil!32735) (Cons!32734 (h!33976 (_ BitVec 64)) (t!47424 List!32738)) )
))
(declare-fun arrayNoDuplicates!0 (array!95574 (_ BitVec 32) List!32738) Bool)

(assert (=> b!1398181 (= res!937150 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32735))))

(declare-fun b!1398182 () Bool)

(declare-fun res!937146 () Bool)

(assert (=> b!1398182 (=> (not res!937146) (not e!791550))))

(assert (=> b!1398182 (= res!937146 (and (= (size!46693 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46693 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46693 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!937141 () Bool)

(assert (=> start!120092 (=> (not res!937141) (not e!791550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120092 (= res!937141 (validMask!0 mask!2840))))

(assert (=> start!120092 e!791550))

(assert (=> start!120092 true))

(declare-fun array_inv!35374 (array!95574) Bool)

(assert (=> start!120092 (array_inv!35374 a!2901)))

(declare-fun b!1398183 () Bool)

(declare-fun res!937147 () Bool)

(assert (=> b!1398183 (=> (not res!937147) (not e!791550))))

(assert (=> b!1398183 (= res!937147 (validKeyInArray!0 (select (arr!46141 a!2901) j!112)))))

(declare-fun b!1398184 () Bool)

(declare-fun res!937148 () Bool)

(assert (=> b!1398184 (=> (not res!937148) (not e!791550))))

(assert (=> b!1398184 (= res!937148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398185 () Bool)

(declare-fun lt!614622 () (_ BitVec 64))

(assert (=> b!1398185 (= e!791549 (validKeyInArray!0 lt!614622))))

(declare-fun b!1398186 () Bool)

(assert (=> b!1398186 (= e!791548 e!791552)))

(declare-fun res!937142 () Bool)

(assert (=> b!1398186 (=> res!937142 e!791552)))

(assert (=> b!1398186 (= res!937142 (or (= lt!614624 lt!614620) (not ((_ is Intermediate!10484) lt!614620))))))

(assert (=> b!1398186 (= lt!614620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614622 mask!2840) lt!614622 (array!95575 (store (arr!46141 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46693 a!2901)) mask!2840))))

(assert (=> b!1398186 (= lt!614622 (select (store (arr!46141 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!120092 res!937141) b!1398182))

(assert (= (and b!1398182 res!937146) b!1398179))

(assert (= (and b!1398179 res!937145) b!1398183))

(assert (= (and b!1398183 res!937147) b!1398184))

(assert (= (and b!1398184 res!937148) b!1398181))

(assert (= (and b!1398181 res!937150) b!1398177))

(assert (= (and b!1398177 res!937144) b!1398180))

(assert (= (and b!1398177 (not res!937149)) b!1398186))

(assert (= (and b!1398186 (not res!937142)) b!1398178))

(assert (= (and b!1398178 (not res!937143)) b!1398185))

(declare-fun m!1284781 () Bool)

(assert (=> start!120092 m!1284781))

(declare-fun m!1284783 () Bool)

(assert (=> start!120092 m!1284783))

(declare-fun m!1284785 () Bool)

(assert (=> b!1398179 m!1284785))

(assert (=> b!1398179 m!1284785))

(declare-fun m!1284787 () Bool)

(assert (=> b!1398179 m!1284787))

(declare-fun m!1284789 () Bool)

(assert (=> b!1398177 m!1284789))

(declare-fun m!1284791 () Bool)

(assert (=> b!1398177 m!1284791))

(assert (=> b!1398177 m!1284789))

(declare-fun m!1284793 () Bool)

(assert (=> b!1398177 m!1284793))

(assert (=> b!1398177 m!1284789))

(declare-fun m!1284795 () Bool)

(assert (=> b!1398177 m!1284795))

(declare-fun m!1284797 () Bool)

(assert (=> b!1398177 m!1284797))

(declare-fun m!1284799 () Bool)

(assert (=> b!1398185 m!1284799))

(declare-fun m!1284801 () Bool)

(assert (=> b!1398184 m!1284801))

(declare-fun m!1284803 () Bool)

(assert (=> b!1398178 m!1284803))

(declare-fun m!1284805 () Bool)

(assert (=> b!1398178 m!1284805))

(declare-fun m!1284807 () Bool)

(assert (=> b!1398178 m!1284807))

(assert (=> b!1398183 m!1284789))

(assert (=> b!1398183 m!1284789))

(declare-fun m!1284809 () Bool)

(assert (=> b!1398183 m!1284809))

(declare-fun m!1284811 () Bool)

(assert (=> b!1398186 m!1284811))

(assert (=> b!1398186 m!1284803))

(assert (=> b!1398186 m!1284811))

(declare-fun m!1284813 () Bool)

(assert (=> b!1398186 m!1284813))

(declare-fun m!1284815 () Bool)

(assert (=> b!1398186 m!1284815))

(assert (=> b!1398180 m!1284789))

(assert (=> b!1398180 m!1284789))

(declare-fun m!1284817 () Bool)

(assert (=> b!1398180 m!1284817))

(declare-fun m!1284819 () Bool)

(assert (=> b!1398181 m!1284819))

(check-sat (not b!1398177) (not b!1398178) (not b!1398185) (not b!1398181) (not b!1398186) (not b!1398179) (not b!1398184) (not b!1398183) (not b!1398180) (not start!120092))
(check-sat)
