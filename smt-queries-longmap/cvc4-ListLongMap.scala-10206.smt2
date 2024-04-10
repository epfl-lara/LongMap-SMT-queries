; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120292 () Bool)

(assert start!120292)

(declare-fun b!1399826 () Bool)

(declare-fun res!938344 () Bool)

(declare-fun e!792507 () Bool)

(assert (=> b!1399826 (=> (not res!938344) (not e!792507))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95701 0))(
  ( (array!95702 (arr!46201 (Array (_ BitVec 32) (_ BitVec 64))) (size!46751 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95701)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399826 (= res!938344 (and (= (size!46751 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46751 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46751 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399827 () Bool)

(declare-fun e!792509 () Bool)

(declare-fun e!792506 () Bool)

(assert (=> b!1399827 (= e!792509 e!792506)))

(declare-fun res!938339 () Bool)

(assert (=> b!1399827 (=> res!938339 e!792506)))

(declare-fun lt!615765 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10518 0))(
  ( (MissingZero!10518 (index!44449 (_ BitVec 32))) (Found!10518 (index!44450 (_ BitVec 32))) (Intermediate!10518 (undefined!11330 Bool) (index!44451 (_ BitVec 32)) (x!126097 (_ BitVec 32))) (Undefined!10518) (MissingVacant!10518 (index!44452 (_ BitVec 32))) )
))
(declare-fun lt!615759 () SeekEntryResult!10518)

(declare-fun lt!615762 () SeekEntryResult!10518)

(assert (=> b!1399827 (= res!938339 (or (bvslt (x!126097 lt!615762) #b00000000000000000000000000000000) (bvsgt (x!126097 lt!615762) #b01111111111111111111111111111110) (bvslt (x!126097 lt!615759) #b00000000000000000000000000000000) (bvsgt (x!126097 lt!615759) #b01111111111111111111111111111110) (bvslt lt!615765 #b00000000000000000000000000000000) (bvsge lt!615765 (size!46751 a!2901)) (bvslt (index!44451 lt!615762) #b00000000000000000000000000000000) (bvsge (index!44451 lt!615762) (size!46751 a!2901)) (bvslt (index!44451 lt!615759) #b00000000000000000000000000000000) (bvsge (index!44451 lt!615759) (size!46751 a!2901)) (not (= lt!615762 (Intermediate!10518 false (index!44451 lt!615762) (x!126097 lt!615762)))) (not (= lt!615759 (Intermediate!10518 false (index!44451 lt!615759) (x!126097 lt!615759))))))))

(declare-fun e!792508 () Bool)

(assert (=> b!1399827 e!792508))

(declare-fun res!938347 () Bool)

(assert (=> b!1399827 (=> (not res!938347) (not e!792508))))

(assert (=> b!1399827 (= res!938347 (and (not (undefined!11330 lt!615759)) (= (index!44451 lt!615759) i!1037) (bvslt (x!126097 lt!615759) (x!126097 lt!615762)) (= (select (store (arr!46201 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44451 lt!615759)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47040 0))(
  ( (Unit!47041) )
))
(declare-fun lt!615763 () Unit!47040)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47040)

(assert (=> b!1399827 (= lt!615763 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615765 (x!126097 lt!615762) (index!44451 lt!615762) (x!126097 lt!615759) (index!44451 lt!615759) (undefined!11330 lt!615759) mask!2840))))

(declare-fun b!1399828 () Bool)

(declare-fun res!938337 () Bool)

(assert (=> b!1399828 (=> (not res!938337) (not e!792507))))

(declare-datatypes ((List!32720 0))(
  ( (Nil!32717) (Cons!32716 (h!33964 (_ BitVec 64)) (t!47414 List!32720)) )
))
(declare-fun arrayNoDuplicates!0 (array!95701 (_ BitVec 32) List!32720) Bool)

(assert (=> b!1399828 (= res!938337 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32717))))

(declare-fun b!1399829 () Bool)

(declare-fun e!792511 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95701 (_ BitVec 32)) SeekEntryResult!10518)

(assert (=> b!1399829 (= e!792511 (= (seekEntryOrOpen!0 (select (arr!46201 a!2901) j!112) a!2901 mask!2840) (Found!10518 j!112)))))

(declare-fun b!1399830 () Bool)

(declare-fun res!938343 () Bool)

(assert (=> b!1399830 (=> (not res!938343) (not e!792507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399830 (= res!938343 (validKeyInArray!0 (select (arr!46201 a!2901) j!112)))))

(declare-fun b!1399831 () Bool)

(assert (=> b!1399831 (= e!792506 true)))

(declare-fun lt!615758 () (_ BitVec 64))

(declare-fun lt!615761 () SeekEntryResult!10518)

(declare-fun lt!615764 () array!95701)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95701 (_ BitVec 32)) SeekEntryResult!10518)

(assert (=> b!1399831 (= lt!615761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615765 lt!615758 lt!615764 mask!2840))))

(declare-fun b!1399832 () Bool)

(declare-fun e!792510 () Bool)

(assert (=> b!1399832 (= e!792510 e!792509)))

(declare-fun res!938342 () Bool)

(assert (=> b!1399832 (=> res!938342 e!792509)))

(assert (=> b!1399832 (= res!938342 (or (= lt!615762 lt!615759) (not (is-Intermediate!10518 lt!615759))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399832 (= lt!615759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615758 mask!2840) lt!615758 lt!615764 mask!2840))))

(assert (=> b!1399832 (= lt!615758 (select (store (arr!46201 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399832 (= lt!615764 (array!95702 (store (arr!46201 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46751 a!2901)))))

(declare-fun b!1399833 () Bool)

(declare-fun res!938346 () Bool)

(assert (=> b!1399833 (=> (not res!938346) (not e!792507))))

(assert (=> b!1399833 (= res!938346 (validKeyInArray!0 (select (arr!46201 a!2901) i!1037)))))

(declare-fun res!938345 () Bool)

(assert (=> start!120292 (=> (not res!938345) (not e!792507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120292 (= res!938345 (validMask!0 mask!2840))))

(assert (=> start!120292 e!792507))

(assert (=> start!120292 true))

(declare-fun array_inv!35229 (array!95701) Bool)

(assert (=> start!120292 (array_inv!35229 a!2901)))

(declare-fun b!1399834 () Bool)

(declare-fun res!938341 () Bool)

(assert (=> b!1399834 (=> (not res!938341) (not e!792507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95701 (_ BitVec 32)) Bool)

(assert (=> b!1399834 (= res!938341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399835 () Bool)

(assert (=> b!1399835 (= e!792507 (not e!792510))))

(declare-fun res!938338 () Bool)

(assert (=> b!1399835 (=> res!938338 e!792510)))

(assert (=> b!1399835 (= res!938338 (or (not (is-Intermediate!10518 lt!615762)) (undefined!11330 lt!615762)))))

(assert (=> b!1399835 e!792511))

(declare-fun res!938340 () Bool)

(assert (=> b!1399835 (=> (not res!938340) (not e!792511))))

(assert (=> b!1399835 (= res!938340 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615760 () Unit!47040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47040)

(assert (=> b!1399835 (= lt!615760 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399835 (= lt!615762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615765 (select (arr!46201 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399835 (= lt!615765 (toIndex!0 (select (arr!46201 a!2901) j!112) mask!2840))))

(declare-fun b!1399836 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95701 (_ BitVec 32)) SeekEntryResult!10518)

(assert (=> b!1399836 (= e!792508 (= (seekEntryOrOpen!0 lt!615758 lt!615764 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126097 lt!615759) (index!44451 lt!615759) (index!44451 lt!615759) (select (arr!46201 a!2901) j!112) lt!615764 mask!2840)))))

(assert (= (and start!120292 res!938345) b!1399826))

(assert (= (and b!1399826 res!938344) b!1399833))

(assert (= (and b!1399833 res!938346) b!1399830))

(assert (= (and b!1399830 res!938343) b!1399834))

(assert (= (and b!1399834 res!938341) b!1399828))

(assert (= (and b!1399828 res!938337) b!1399835))

(assert (= (and b!1399835 res!938340) b!1399829))

(assert (= (and b!1399835 (not res!938338)) b!1399832))

(assert (= (and b!1399832 (not res!938342)) b!1399827))

(assert (= (and b!1399827 res!938347) b!1399836))

(assert (= (and b!1399827 (not res!938339)) b!1399831))

(declare-fun m!1287073 () Bool)

(assert (=> b!1399831 m!1287073))

(declare-fun m!1287075 () Bool)

(assert (=> b!1399833 m!1287075))

(assert (=> b!1399833 m!1287075))

(declare-fun m!1287077 () Bool)

(assert (=> b!1399833 m!1287077))

(declare-fun m!1287079 () Bool)

(assert (=> b!1399829 m!1287079))

(assert (=> b!1399829 m!1287079))

(declare-fun m!1287081 () Bool)

(assert (=> b!1399829 m!1287081))

(assert (=> b!1399830 m!1287079))

(assert (=> b!1399830 m!1287079))

(declare-fun m!1287083 () Bool)

(assert (=> b!1399830 m!1287083))

(assert (=> b!1399835 m!1287079))

(declare-fun m!1287085 () Bool)

(assert (=> b!1399835 m!1287085))

(assert (=> b!1399835 m!1287079))

(declare-fun m!1287087 () Bool)

(assert (=> b!1399835 m!1287087))

(declare-fun m!1287089 () Bool)

(assert (=> b!1399835 m!1287089))

(assert (=> b!1399835 m!1287079))

(declare-fun m!1287091 () Bool)

(assert (=> b!1399835 m!1287091))

(declare-fun m!1287093 () Bool)

(assert (=> b!1399827 m!1287093))

(declare-fun m!1287095 () Bool)

(assert (=> b!1399827 m!1287095))

(declare-fun m!1287097 () Bool)

(assert (=> b!1399827 m!1287097))

(declare-fun m!1287099 () Bool)

(assert (=> b!1399828 m!1287099))

(declare-fun m!1287101 () Bool)

(assert (=> b!1399836 m!1287101))

(assert (=> b!1399836 m!1287079))

(assert (=> b!1399836 m!1287079))

(declare-fun m!1287103 () Bool)

(assert (=> b!1399836 m!1287103))

(declare-fun m!1287105 () Bool)

(assert (=> start!120292 m!1287105))

(declare-fun m!1287107 () Bool)

(assert (=> start!120292 m!1287107))

(declare-fun m!1287109 () Bool)

(assert (=> b!1399834 m!1287109))

(declare-fun m!1287111 () Bool)

(assert (=> b!1399832 m!1287111))

(assert (=> b!1399832 m!1287111))

(declare-fun m!1287113 () Bool)

(assert (=> b!1399832 m!1287113))

(assert (=> b!1399832 m!1287093))

(declare-fun m!1287115 () Bool)

(assert (=> b!1399832 m!1287115))

(push 1)

