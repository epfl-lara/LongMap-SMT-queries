; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120474 () Bool)

(assert start!120474)

(declare-fun b!1402773 () Bool)

(declare-fun res!941285 () Bool)

(declare-fun e!794307 () Bool)

(assert (=> b!1402773 (=> (not res!941285) (not e!794307))))

(declare-datatypes ((array!95883 0))(
  ( (array!95884 (arr!46292 (Array (_ BitVec 32) (_ BitVec 64))) (size!46842 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95883)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95883 (_ BitVec 32)) Bool)

(assert (=> b!1402773 (= res!941285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402774 () Bool)

(declare-fun e!794305 () Bool)

(declare-fun e!794306 () Bool)

(assert (=> b!1402774 (= e!794305 e!794306)))

(declare-fun res!941291 () Bool)

(assert (=> b!1402774 (=> res!941291 e!794306)))

(declare-datatypes ((SeekEntryResult!10609 0))(
  ( (MissingZero!10609 (index!44813 (_ BitVec 32))) (Found!10609 (index!44814 (_ BitVec 32))) (Intermediate!10609 (undefined!11421 Bool) (index!44815 (_ BitVec 32)) (x!126436 (_ BitVec 32))) (Undefined!10609) (MissingVacant!10609 (index!44816 (_ BitVec 32))) )
))
(declare-fun lt!618063 () SeekEntryResult!10609)

(declare-fun lt!618056 () (_ BitVec 32))

(declare-fun lt!618054 () SeekEntryResult!10609)

(assert (=> b!1402774 (= res!941291 (or (bvslt (x!126436 lt!618063) #b00000000000000000000000000000000) (bvsgt (x!126436 lt!618063) #b01111111111111111111111111111110) (bvslt (x!126436 lt!618054) #b00000000000000000000000000000000) (bvsgt (x!126436 lt!618054) #b01111111111111111111111111111110) (bvslt lt!618056 #b00000000000000000000000000000000) (bvsge lt!618056 (size!46842 a!2901)) (bvslt (index!44815 lt!618063) #b00000000000000000000000000000000) (bvsge (index!44815 lt!618063) (size!46842 a!2901)) (bvslt (index!44815 lt!618054) #b00000000000000000000000000000000) (bvsge (index!44815 lt!618054) (size!46842 a!2901)) (not (= lt!618063 (Intermediate!10609 false (index!44815 lt!618063) (x!126436 lt!618063)))) (not (= lt!618054 (Intermediate!10609 false (index!44815 lt!618054) (x!126436 lt!618054))))))))

(declare-fun lt!618060 () SeekEntryResult!10609)

(declare-fun lt!618062 () array!95883)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95883 (_ BitVec 32)) SeekEntryResult!10609)

(assert (=> b!1402774 (= lt!618060 (seekKeyOrZeroReturnVacant!0 (x!126436 lt!618054) (index!44815 lt!618054) (index!44815 lt!618054) (select (arr!46292 a!2901) j!112) lt!618062 mask!2840))))

(declare-fun lt!618059 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95883 (_ BitVec 32)) SeekEntryResult!10609)

(assert (=> b!1402774 (= lt!618060 (seekEntryOrOpen!0 lt!618059 lt!618062 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402774 (and (not (undefined!11421 lt!618054)) (= (index!44815 lt!618054) i!1037) (bvslt (x!126436 lt!618054) (x!126436 lt!618063)) (= (select (store (arr!46292 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44815 lt!618054)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47222 0))(
  ( (Unit!47223) )
))
(declare-fun lt!618061 () Unit!47222)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47222)

(assert (=> b!1402774 (= lt!618061 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618056 (x!126436 lt!618063) (index!44815 lt!618063) (x!126436 lt!618054) (index!44815 lt!618054) (undefined!11421 lt!618054) mask!2840))))

(declare-fun b!1402775 () Bool)

(declare-fun res!941287 () Bool)

(assert (=> b!1402775 (=> (not res!941287) (not e!794307))))

(declare-datatypes ((List!32811 0))(
  ( (Nil!32808) (Cons!32807 (h!34055 (_ BitVec 64)) (t!47505 List!32811)) )
))
(declare-fun arrayNoDuplicates!0 (array!95883 (_ BitVec 32) List!32811) Bool)

(assert (=> b!1402775 (= res!941287 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32808))))

(declare-fun b!1402776 () Bool)

(assert (=> b!1402776 (= e!794306 true)))

(declare-fun lt!618055 () SeekEntryResult!10609)

(assert (=> b!1402776 (= lt!618055 lt!618060)))

(declare-fun lt!618057 () Unit!47222)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47222)

(assert (=> b!1402776 (= lt!618057 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618056 (x!126436 lt!618063) (index!44815 lt!618063) (x!126436 lt!618054) (index!44815 lt!618054) mask!2840))))

(declare-fun b!1402777 () Bool)

(declare-fun e!794308 () Bool)

(assert (=> b!1402777 (= e!794307 (not e!794308))))

(declare-fun res!941293 () Bool)

(assert (=> b!1402777 (=> res!941293 e!794308)))

(assert (=> b!1402777 (= res!941293 (or (not (is-Intermediate!10609 lt!618063)) (undefined!11421 lt!618063)))))

(assert (=> b!1402777 (= lt!618055 (Found!10609 j!112))))

(assert (=> b!1402777 (= lt!618055 (seekEntryOrOpen!0 (select (arr!46292 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402777 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618058 () Unit!47222)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47222)

(assert (=> b!1402777 (= lt!618058 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95883 (_ BitVec 32)) SeekEntryResult!10609)

(assert (=> b!1402777 (= lt!618063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618056 (select (arr!46292 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402777 (= lt!618056 (toIndex!0 (select (arr!46292 a!2901) j!112) mask!2840))))

(declare-fun b!1402778 () Bool)

(declare-fun res!941284 () Bool)

(assert (=> b!1402778 (=> (not res!941284) (not e!794307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402778 (= res!941284 (validKeyInArray!0 (select (arr!46292 a!2901) j!112)))))

(declare-fun res!941286 () Bool)

(assert (=> start!120474 (=> (not res!941286) (not e!794307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120474 (= res!941286 (validMask!0 mask!2840))))

(assert (=> start!120474 e!794307))

(assert (=> start!120474 true))

(declare-fun array_inv!35320 (array!95883) Bool)

(assert (=> start!120474 (array_inv!35320 a!2901)))

(declare-fun b!1402779 () Bool)

(declare-fun res!941289 () Bool)

(assert (=> b!1402779 (=> (not res!941289) (not e!794307))))

(assert (=> b!1402779 (= res!941289 (validKeyInArray!0 (select (arr!46292 a!2901) i!1037)))))

(declare-fun b!1402780 () Bool)

(assert (=> b!1402780 (= e!794308 e!794305)))

(declare-fun res!941290 () Bool)

(assert (=> b!1402780 (=> res!941290 e!794305)))

(assert (=> b!1402780 (= res!941290 (or (= lt!618063 lt!618054) (not (is-Intermediate!10609 lt!618054))))))

(assert (=> b!1402780 (= lt!618054 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618059 mask!2840) lt!618059 lt!618062 mask!2840))))

(assert (=> b!1402780 (= lt!618059 (select (store (arr!46292 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402780 (= lt!618062 (array!95884 (store (arr!46292 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46842 a!2901)))))

(declare-fun b!1402781 () Bool)

(declare-fun res!941288 () Bool)

(assert (=> b!1402781 (=> res!941288 e!794306)))

(assert (=> b!1402781 (= res!941288 (not (= lt!618054 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618056 lt!618059 lt!618062 mask!2840))))))

(declare-fun b!1402782 () Bool)

(declare-fun res!941292 () Bool)

(assert (=> b!1402782 (=> (not res!941292) (not e!794307))))

(assert (=> b!1402782 (= res!941292 (and (= (size!46842 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46842 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46842 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120474 res!941286) b!1402782))

(assert (= (and b!1402782 res!941292) b!1402779))

(assert (= (and b!1402779 res!941289) b!1402778))

(assert (= (and b!1402778 res!941284) b!1402773))

(assert (= (and b!1402773 res!941285) b!1402775))

(assert (= (and b!1402775 res!941287) b!1402777))

(assert (= (and b!1402777 (not res!941293)) b!1402780))

(assert (= (and b!1402780 (not res!941290)) b!1402774))

(assert (= (and b!1402774 (not res!941291)) b!1402781))

(assert (= (and b!1402781 (not res!941288)) b!1402776))

(declare-fun m!1291113 () Bool)

(assert (=> b!1402774 m!1291113))

(declare-fun m!1291115 () Bool)

(assert (=> b!1402774 m!1291115))

(declare-fun m!1291117 () Bool)

(assert (=> b!1402774 m!1291117))

(declare-fun m!1291119 () Bool)

(assert (=> b!1402774 m!1291119))

(declare-fun m!1291121 () Bool)

(assert (=> b!1402774 m!1291121))

(declare-fun m!1291123 () Bool)

(assert (=> b!1402774 m!1291123))

(assert (=> b!1402774 m!1291117))

(declare-fun m!1291125 () Bool)

(assert (=> b!1402779 m!1291125))

(assert (=> b!1402779 m!1291125))

(declare-fun m!1291127 () Bool)

(assert (=> b!1402779 m!1291127))

(declare-fun m!1291129 () Bool)

(assert (=> start!120474 m!1291129))

(declare-fun m!1291131 () Bool)

(assert (=> start!120474 m!1291131))

(declare-fun m!1291133 () Bool)

(assert (=> b!1402775 m!1291133))

(assert (=> b!1402778 m!1291117))

(assert (=> b!1402778 m!1291117))

(declare-fun m!1291135 () Bool)

(assert (=> b!1402778 m!1291135))

(declare-fun m!1291137 () Bool)

(assert (=> b!1402781 m!1291137))

(declare-fun m!1291139 () Bool)

(assert (=> b!1402780 m!1291139))

(assert (=> b!1402780 m!1291139))

(declare-fun m!1291141 () Bool)

(assert (=> b!1402780 m!1291141))

(assert (=> b!1402780 m!1291121))

(declare-fun m!1291143 () Bool)

(assert (=> b!1402780 m!1291143))

(assert (=> b!1402777 m!1291117))

(declare-fun m!1291145 () Bool)

(assert (=> b!1402777 m!1291145))

(assert (=> b!1402777 m!1291117))

(declare-fun m!1291147 () Bool)

(assert (=> b!1402777 m!1291147))

(assert (=> b!1402777 m!1291117))

(declare-fun m!1291149 () Bool)

(assert (=> b!1402777 m!1291149))

(assert (=> b!1402777 m!1291117))

(declare-fun m!1291151 () Bool)

(assert (=> b!1402777 m!1291151))

(declare-fun m!1291153 () Bool)

(assert (=> b!1402777 m!1291153))

(declare-fun m!1291155 () Bool)

(assert (=> b!1402773 m!1291155))

(declare-fun m!1291157 () Bool)

(assert (=> b!1402776 m!1291157))

(push 1)

