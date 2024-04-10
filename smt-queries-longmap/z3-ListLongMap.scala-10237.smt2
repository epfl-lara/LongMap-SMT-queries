; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120476 () Bool)

(assert start!120476)

(declare-fun b!1402803 () Bool)

(declare-fun e!794324 () Bool)

(declare-fun e!794323 () Bool)

(assert (=> b!1402803 (= e!794324 (not e!794323))))

(declare-fun res!941322 () Bool)

(assert (=> b!1402803 (=> res!941322 e!794323)))

(declare-datatypes ((SeekEntryResult!10610 0))(
  ( (MissingZero!10610 (index!44817 (_ BitVec 32))) (Found!10610 (index!44818 (_ BitVec 32))) (Intermediate!10610 (undefined!11422 Bool) (index!44819 (_ BitVec 32)) (x!126437 (_ BitVec 32))) (Undefined!10610) (MissingVacant!10610 (index!44820 (_ BitVec 32))) )
))
(declare-fun lt!618087 () SeekEntryResult!10610)

(get-info :version)

(assert (=> b!1402803 (= res!941322 (or (not ((_ is Intermediate!10610) lt!618087)) (undefined!11422 lt!618087)))))

(declare-fun lt!618084 () SeekEntryResult!10610)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402803 (= lt!618084 (Found!10610 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95885 0))(
  ( (array!95886 (arr!46293 (Array (_ BitVec 32) (_ BitVec 64))) (size!46843 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95885)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95885 (_ BitVec 32)) SeekEntryResult!10610)

(assert (=> b!1402803 (= lt!618084 (seekEntryOrOpen!0 (select (arr!46293 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95885 (_ BitVec 32)) Bool)

(assert (=> b!1402803 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47224 0))(
  ( (Unit!47225) )
))
(declare-fun lt!618085 () Unit!47224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95885 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47224)

(assert (=> b!1402803 (= lt!618085 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618091 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95885 (_ BitVec 32)) SeekEntryResult!10610)

(assert (=> b!1402803 (= lt!618087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618091 (select (arr!46293 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402803 (= lt!618091 (toIndex!0 (select (arr!46293 a!2901) j!112) mask!2840))))

(declare-fun res!941318 () Bool)

(assert (=> start!120476 (=> (not res!941318) (not e!794324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120476 (= res!941318 (validMask!0 mask!2840))))

(assert (=> start!120476 e!794324))

(assert (=> start!120476 true))

(declare-fun array_inv!35321 (array!95885) Bool)

(assert (=> start!120476 (array_inv!35321 a!2901)))

(declare-fun b!1402804 () Bool)

(declare-fun res!941316 () Bool)

(assert (=> b!1402804 (=> (not res!941316) (not e!794324))))

(declare-datatypes ((List!32812 0))(
  ( (Nil!32809) (Cons!32808 (h!34056 (_ BitVec 64)) (t!47506 List!32812)) )
))
(declare-fun arrayNoDuplicates!0 (array!95885 (_ BitVec 32) List!32812) Bool)

(assert (=> b!1402804 (= res!941316 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32809))))

(declare-fun b!1402805 () Bool)

(declare-fun e!794321 () Bool)

(assert (=> b!1402805 (= e!794321 true)))

(declare-fun lt!618089 () SeekEntryResult!10610)

(assert (=> b!1402805 (= lt!618084 lt!618089)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!618088 () Unit!47224)

(declare-fun lt!618093 () SeekEntryResult!10610)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95885 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47224)

(assert (=> b!1402805 (= lt!618088 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618091 (x!126437 lt!618087) (index!44819 lt!618087) (x!126437 lt!618093) (index!44819 lt!618093) mask!2840))))

(declare-fun b!1402806 () Bool)

(declare-fun res!941319 () Bool)

(assert (=> b!1402806 (=> (not res!941319) (not e!794324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402806 (= res!941319 (validKeyInArray!0 (select (arr!46293 a!2901) j!112)))))

(declare-fun b!1402807 () Bool)

(declare-fun e!794322 () Bool)

(assert (=> b!1402807 (= e!794323 e!794322)))

(declare-fun res!941315 () Bool)

(assert (=> b!1402807 (=> res!941315 e!794322)))

(assert (=> b!1402807 (= res!941315 (or (= lt!618087 lt!618093) (not ((_ is Intermediate!10610) lt!618093))))))

(declare-fun lt!618092 () (_ BitVec 64))

(declare-fun lt!618086 () array!95885)

(assert (=> b!1402807 (= lt!618093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618092 mask!2840) lt!618092 lt!618086 mask!2840))))

(assert (=> b!1402807 (= lt!618092 (select (store (arr!46293 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402807 (= lt!618086 (array!95886 (store (arr!46293 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46843 a!2901)))))

(declare-fun b!1402808 () Bool)

(assert (=> b!1402808 (= e!794322 e!794321)))

(declare-fun res!941317 () Bool)

(assert (=> b!1402808 (=> res!941317 e!794321)))

(assert (=> b!1402808 (= res!941317 (or (bvslt (x!126437 lt!618087) #b00000000000000000000000000000000) (bvsgt (x!126437 lt!618087) #b01111111111111111111111111111110) (bvslt (x!126437 lt!618093) #b00000000000000000000000000000000) (bvsgt (x!126437 lt!618093) #b01111111111111111111111111111110) (bvslt lt!618091 #b00000000000000000000000000000000) (bvsge lt!618091 (size!46843 a!2901)) (bvslt (index!44819 lt!618087) #b00000000000000000000000000000000) (bvsge (index!44819 lt!618087) (size!46843 a!2901)) (bvslt (index!44819 lt!618093) #b00000000000000000000000000000000) (bvsge (index!44819 lt!618093) (size!46843 a!2901)) (not (= lt!618087 (Intermediate!10610 false (index!44819 lt!618087) (x!126437 lt!618087)))) (not (= lt!618093 (Intermediate!10610 false (index!44819 lt!618093) (x!126437 lt!618093))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95885 (_ BitVec 32)) SeekEntryResult!10610)

(assert (=> b!1402808 (= lt!618089 (seekKeyOrZeroReturnVacant!0 (x!126437 lt!618093) (index!44819 lt!618093) (index!44819 lt!618093) (select (arr!46293 a!2901) j!112) lt!618086 mask!2840))))

(assert (=> b!1402808 (= lt!618089 (seekEntryOrOpen!0 lt!618092 lt!618086 mask!2840))))

(assert (=> b!1402808 (and (not (undefined!11422 lt!618093)) (= (index!44819 lt!618093) i!1037) (bvslt (x!126437 lt!618093) (x!126437 lt!618087)) (= (select (store (arr!46293 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44819 lt!618093)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!618090 () Unit!47224)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95885 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47224)

(assert (=> b!1402808 (= lt!618090 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618091 (x!126437 lt!618087) (index!44819 lt!618087) (x!126437 lt!618093) (index!44819 lt!618093) (undefined!11422 lt!618093) mask!2840))))

(declare-fun b!1402809 () Bool)

(declare-fun res!941314 () Bool)

(assert (=> b!1402809 (=> (not res!941314) (not e!794324))))

(assert (=> b!1402809 (= res!941314 (and (= (size!46843 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46843 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46843 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402810 () Bool)

(declare-fun res!941323 () Bool)

(assert (=> b!1402810 (=> (not res!941323) (not e!794324))))

(assert (=> b!1402810 (= res!941323 (validKeyInArray!0 (select (arr!46293 a!2901) i!1037)))))

(declare-fun b!1402811 () Bool)

(declare-fun res!941321 () Bool)

(assert (=> b!1402811 (=> (not res!941321) (not e!794324))))

(assert (=> b!1402811 (= res!941321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402812 () Bool)

(declare-fun res!941320 () Bool)

(assert (=> b!1402812 (=> res!941320 e!794321)))

(assert (=> b!1402812 (= res!941320 (not (= lt!618093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618091 lt!618092 lt!618086 mask!2840))))))

(assert (= (and start!120476 res!941318) b!1402809))

(assert (= (and b!1402809 res!941314) b!1402810))

(assert (= (and b!1402810 res!941323) b!1402806))

(assert (= (and b!1402806 res!941319) b!1402811))

(assert (= (and b!1402811 res!941321) b!1402804))

(assert (= (and b!1402804 res!941316) b!1402803))

(assert (= (and b!1402803 (not res!941322)) b!1402807))

(assert (= (and b!1402807 (not res!941315)) b!1402808))

(assert (= (and b!1402808 (not res!941317)) b!1402812))

(assert (= (and b!1402812 (not res!941320)) b!1402805))

(declare-fun m!1291159 () Bool)

(assert (=> b!1402810 m!1291159))

(assert (=> b!1402810 m!1291159))

(declare-fun m!1291161 () Bool)

(assert (=> b!1402810 m!1291161))

(declare-fun m!1291163 () Bool)

(assert (=> b!1402807 m!1291163))

(assert (=> b!1402807 m!1291163))

(declare-fun m!1291165 () Bool)

(assert (=> b!1402807 m!1291165))

(declare-fun m!1291167 () Bool)

(assert (=> b!1402807 m!1291167))

(declare-fun m!1291169 () Bool)

(assert (=> b!1402807 m!1291169))

(declare-fun m!1291171 () Bool)

(assert (=> b!1402806 m!1291171))

(assert (=> b!1402806 m!1291171))

(declare-fun m!1291173 () Bool)

(assert (=> b!1402806 m!1291173))

(declare-fun m!1291175 () Bool)

(assert (=> b!1402812 m!1291175))

(declare-fun m!1291177 () Bool)

(assert (=> start!120476 m!1291177))

(declare-fun m!1291179 () Bool)

(assert (=> start!120476 m!1291179))

(declare-fun m!1291181 () Bool)

(assert (=> b!1402804 m!1291181))

(assert (=> b!1402803 m!1291171))

(declare-fun m!1291183 () Bool)

(assert (=> b!1402803 m!1291183))

(assert (=> b!1402803 m!1291171))

(assert (=> b!1402803 m!1291171))

(declare-fun m!1291185 () Bool)

(assert (=> b!1402803 m!1291185))

(declare-fun m!1291187 () Bool)

(assert (=> b!1402803 m!1291187))

(assert (=> b!1402803 m!1291171))

(declare-fun m!1291189 () Bool)

(assert (=> b!1402803 m!1291189))

(declare-fun m!1291191 () Bool)

(assert (=> b!1402803 m!1291191))

(declare-fun m!1291193 () Bool)

(assert (=> b!1402811 m!1291193))

(declare-fun m!1291195 () Bool)

(assert (=> b!1402805 m!1291195))

(assert (=> b!1402808 m!1291171))

(declare-fun m!1291197 () Bool)

(assert (=> b!1402808 m!1291197))

(declare-fun m!1291199 () Bool)

(assert (=> b!1402808 m!1291199))

(assert (=> b!1402808 m!1291167))

(assert (=> b!1402808 m!1291171))

(declare-fun m!1291201 () Bool)

(assert (=> b!1402808 m!1291201))

(declare-fun m!1291203 () Bool)

(assert (=> b!1402808 m!1291203))

(check-sat (not start!120476) (not b!1402811) (not b!1402810) (not b!1402804) (not b!1402806) (not b!1402805) (not b!1402807) (not b!1402812) (not b!1402803) (not b!1402808))
(check-sat)
