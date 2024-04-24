; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120308 () Bool)

(assert start!120308)

(declare-fun b!1399729 () Bool)

(declare-fun res!937963 () Bool)

(declare-fun e!792514 () Bool)

(assert (=> b!1399729 (=> (not res!937963) (not e!792514))))

(declare-datatypes ((array!95759 0))(
  ( (array!95760 (arr!46231 (Array (_ BitVec 32) (_ BitVec 64))) (size!46782 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95759)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95759 (_ BitVec 32)) Bool)

(assert (=> b!1399729 (= res!937963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399730 () Bool)

(declare-fun res!937958 () Bool)

(assert (=> b!1399730 (=> (not res!937958) (not e!792514))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399730 (= res!937958 (and (= (size!46782 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46782 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46782 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399731 () Bool)

(declare-fun e!792512 () Bool)

(declare-fun e!792511 () Bool)

(assert (=> b!1399731 (= e!792512 e!792511)))

(declare-fun res!937966 () Bool)

(assert (=> b!1399731 (=> res!937966 e!792511)))

(declare-datatypes ((SeekEntryResult!10451 0))(
  ( (MissingZero!10451 (index!44175 (_ BitVec 32))) (Found!10451 (index!44176 (_ BitVec 32))) (Intermediate!10451 (undefined!11263 Bool) (index!44177 (_ BitVec 32)) (x!125972 (_ BitVec 32))) (Undefined!10451) (MissingVacant!10451 (index!44178 (_ BitVec 32))) )
))
(declare-fun lt!615426 () SeekEntryResult!10451)

(declare-fun lt!615428 () SeekEntryResult!10451)

(get-info :version)

(assert (=> b!1399731 (= res!937966 (or (= lt!615426 lt!615428) (not ((_ is Intermediate!10451) lt!615428))))))

(declare-fun lt!615425 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95759 (_ BitVec 32)) SeekEntryResult!10451)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399731 (= lt!615428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615425 mask!2840) lt!615425 (array!95760 (store (arr!46231 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46782 a!2901)) mask!2840))))

(assert (=> b!1399731 (= lt!615425 (select (store (arr!46231 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399733 () Bool)

(declare-fun res!937961 () Bool)

(assert (=> b!1399733 (=> (not res!937961) (not e!792514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399733 (= res!937961 (validKeyInArray!0 (select (arr!46231 a!2901) j!112)))))

(declare-fun res!937965 () Bool)

(assert (=> start!120308 (=> (not res!937965) (not e!792514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120308 (= res!937965 (validMask!0 mask!2840))))

(assert (=> start!120308 e!792514))

(assert (=> start!120308 true))

(declare-fun array_inv!35512 (array!95759) Bool)

(assert (=> start!120308 (array_inv!35512 a!2901)))

(declare-fun b!1399732 () Bool)

(assert (=> b!1399732 (= e!792514 (not e!792512))))

(declare-fun res!937962 () Bool)

(assert (=> b!1399732 (=> res!937962 e!792512)))

(assert (=> b!1399732 (= res!937962 (or (not ((_ is Intermediate!10451) lt!615426)) (undefined!11263 lt!615426)))))

(declare-fun e!792515 () Bool)

(assert (=> b!1399732 e!792515))

(declare-fun res!937960 () Bool)

(assert (=> b!1399732 (=> (not res!937960) (not e!792515))))

(assert (=> b!1399732 (= res!937960 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46933 0))(
  ( (Unit!46934) )
))
(declare-fun lt!615424 () Unit!46933)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46933)

(assert (=> b!1399732 (= lt!615424 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615427 () (_ BitVec 32))

(assert (=> b!1399732 (= lt!615426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615427 (select (arr!46231 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399732 (= lt!615427 (toIndex!0 (select (arr!46231 a!2901) j!112) mask!2840))))

(declare-fun b!1399734 () Bool)

(declare-fun res!937959 () Bool)

(assert (=> b!1399734 (=> (not res!937959) (not e!792514))))

(assert (=> b!1399734 (= res!937959 (validKeyInArray!0 (select (arr!46231 a!2901) i!1037)))))

(declare-fun b!1399735 () Bool)

(assert (=> b!1399735 (= e!792511 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge (index!44177 lt!615428) #b00000000000000000000000000000000) (bvslt (index!44177 lt!615428) (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(assert (=> b!1399735 (and (not (undefined!11263 lt!615428)) (= (index!44177 lt!615428) i!1037) (bvslt (x!125972 lt!615428) (x!125972 lt!615426)) (= (select (store (arr!46231 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44177 lt!615428)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615423 () Unit!46933)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46933)

(assert (=> b!1399735 (= lt!615423 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615427 (x!125972 lt!615426) (index!44177 lt!615426) (x!125972 lt!615428) (index!44177 lt!615428) (undefined!11263 lt!615428) mask!2840))))

(declare-fun b!1399736 () Bool)

(declare-fun res!937964 () Bool)

(assert (=> b!1399736 (=> (not res!937964) (not e!792514))))

(declare-datatypes ((List!32737 0))(
  ( (Nil!32734) (Cons!32733 (h!33983 (_ BitVec 64)) (t!47423 List!32737)) )
))
(declare-fun arrayNoDuplicates!0 (array!95759 (_ BitVec 32) List!32737) Bool)

(assert (=> b!1399736 (= res!937964 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32734))))

(declare-fun b!1399737 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95759 (_ BitVec 32)) SeekEntryResult!10451)

(assert (=> b!1399737 (= e!792515 (= (seekEntryOrOpen!0 (select (arr!46231 a!2901) j!112) a!2901 mask!2840) (Found!10451 j!112)))))

(assert (= (and start!120308 res!937965) b!1399730))

(assert (= (and b!1399730 res!937958) b!1399734))

(assert (= (and b!1399734 res!937959) b!1399733))

(assert (= (and b!1399733 res!937961) b!1399729))

(assert (= (and b!1399729 res!937963) b!1399736))

(assert (= (and b!1399736 res!937964) b!1399732))

(assert (= (and b!1399732 res!937960) b!1399737))

(assert (= (and b!1399732 (not res!937962)) b!1399731))

(assert (= (and b!1399731 (not res!937966)) b!1399735))

(declare-fun m!1287151 () Bool)

(assert (=> start!120308 m!1287151))

(declare-fun m!1287153 () Bool)

(assert (=> start!120308 m!1287153))

(declare-fun m!1287155 () Bool)

(assert (=> b!1399737 m!1287155))

(assert (=> b!1399737 m!1287155))

(declare-fun m!1287157 () Bool)

(assert (=> b!1399737 m!1287157))

(assert (=> b!1399733 m!1287155))

(assert (=> b!1399733 m!1287155))

(declare-fun m!1287159 () Bool)

(assert (=> b!1399733 m!1287159))

(declare-fun m!1287161 () Bool)

(assert (=> b!1399731 m!1287161))

(declare-fun m!1287163 () Bool)

(assert (=> b!1399731 m!1287163))

(assert (=> b!1399731 m!1287161))

(declare-fun m!1287165 () Bool)

(assert (=> b!1399731 m!1287165))

(declare-fun m!1287167 () Bool)

(assert (=> b!1399731 m!1287167))

(assert (=> b!1399732 m!1287155))

(declare-fun m!1287169 () Bool)

(assert (=> b!1399732 m!1287169))

(assert (=> b!1399732 m!1287155))

(declare-fun m!1287171 () Bool)

(assert (=> b!1399732 m!1287171))

(assert (=> b!1399732 m!1287155))

(declare-fun m!1287173 () Bool)

(assert (=> b!1399732 m!1287173))

(declare-fun m!1287175 () Bool)

(assert (=> b!1399732 m!1287175))

(declare-fun m!1287177 () Bool)

(assert (=> b!1399736 m!1287177))

(assert (=> b!1399735 m!1287163))

(declare-fun m!1287179 () Bool)

(assert (=> b!1399735 m!1287179))

(declare-fun m!1287181 () Bool)

(assert (=> b!1399735 m!1287181))

(declare-fun m!1287183 () Bool)

(assert (=> b!1399734 m!1287183))

(assert (=> b!1399734 m!1287183))

(declare-fun m!1287185 () Bool)

(assert (=> b!1399734 m!1287185))

(declare-fun m!1287187 () Bool)

(assert (=> b!1399729 m!1287187))

(check-sat (not start!120308) (not b!1399737) (not b!1399729) (not b!1399736) (not b!1399733) (not b!1399735) (not b!1399732) (not b!1399734) (not b!1399731))
(check-sat)
