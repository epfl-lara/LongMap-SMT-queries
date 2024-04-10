; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120306 () Bool)

(assert start!120306)

(declare-fun b!1400057 () Bool)

(declare-fun e!792659 () Bool)

(declare-fun e!792654 () Bool)

(assert (=> b!1400057 (= e!792659 e!792654)))

(declare-fun res!938577 () Bool)

(assert (=> b!1400057 (=> res!938577 e!792654)))

(declare-datatypes ((SeekEntryResult!10525 0))(
  ( (MissingZero!10525 (index!44477 (_ BitVec 32))) (Found!10525 (index!44478 (_ BitVec 32))) (Intermediate!10525 (undefined!11337 Bool) (index!44479 (_ BitVec 32)) (x!126128 (_ BitVec 32))) (Undefined!10525) (MissingVacant!10525 (index!44480 (_ BitVec 32))) )
))
(declare-fun lt!615926 () SeekEntryResult!10525)

(declare-fun lt!615933 () SeekEntryResult!10525)

(assert (=> b!1400057 (= res!938577 (or (= lt!615926 lt!615933) (not (is-Intermediate!10525 lt!615933))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!615932 () (_ BitVec 64))

(declare-datatypes ((array!95715 0))(
  ( (array!95716 (arr!46208 (Array (_ BitVec 32) (_ BitVec 64))) (size!46758 (_ BitVec 32))) )
))
(declare-fun lt!615929 () array!95715)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95715 (_ BitVec 32)) SeekEntryResult!10525)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400057 (= lt!615933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615932 mask!2840) lt!615932 lt!615929 mask!2840))))

(declare-fun a!2901 () array!95715)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400057 (= lt!615932 (select (store (arr!46208 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400057 (= lt!615929 (array!95716 (store (arr!46208 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46758 a!2901)))))

(declare-fun b!1400058 () Bool)

(declare-fun res!938569 () Bool)

(declare-fun e!792657 () Bool)

(assert (=> b!1400058 (=> (not res!938569) (not e!792657))))

(assert (=> b!1400058 (= res!938569 (and (= (size!46758 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46758 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46758 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400059 () Bool)

(declare-fun e!792655 () Bool)

(assert (=> b!1400059 (= e!792655 true)))

(declare-fun lt!615931 () (_ BitVec 32))

(declare-fun lt!615927 () SeekEntryResult!10525)

(assert (=> b!1400059 (= lt!615927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615931 lt!615932 lt!615929 mask!2840))))

(declare-fun b!1400060 () Bool)

(assert (=> b!1400060 (= e!792657 (not e!792659))))

(declare-fun res!938572 () Bool)

(assert (=> b!1400060 (=> res!938572 e!792659)))

(assert (=> b!1400060 (= res!938572 (or (not (is-Intermediate!10525 lt!615926)) (undefined!11337 lt!615926)))))

(declare-fun e!792656 () Bool)

(assert (=> b!1400060 e!792656))

(declare-fun res!938576 () Bool)

(assert (=> b!1400060 (=> (not res!938576) (not e!792656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95715 (_ BitVec 32)) Bool)

(assert (=> b!1400060 (= res!938576 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47054 0))(
  ( (Unit!47055) )
))
(declare-fun lt!615930 () Unit!47054)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47054)

(assert (=> b!1400060 (= lt!615930 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400060 (= lt!615926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615931 (select (arr!46208 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400060 (= lt!615931 (toIndex!0 (select (arr!46208 a!2901) j!112) mask!2840))))

(declare-fun e!792658 () Bool)

(declare-fun b!1400061 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95715 (_ BitVec 32)) SeekEntryResult!10525)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95715 (_ BitVec 32)) SeekEntryResult!10525)

(assert (=> b!1400061 (= e!792658 (= (seekEntryOrOpen!0 lt!615932 lt!615929 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126128 lt!615933) (index!44479 lt!615933) (index!44479 lt!615933) (select (arr!46208 a!2901) j!112) lt!615929 mask!2840)))))

(declare-fun b!1400062 () Bool)

(declare-fun res!938571 () Bool)

(assert (=> b!1400062 (=> (not res!938571) (not e!792657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400062 (= res!938571 (validKeyInArray!0 (select (arr!46208 a!2901) i!1037)))))

(declare-fun b!1400063 () Bool)

(declare-fun res!938573 () Bool)

(assert (=> b!1400063 (=> (not res!938573) (not e!792657))))

(assert (=> b!1400063 (= res!938573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400065 () Bool)

(assert (=> b!1400065 (= e!792654 e!792655)))

(declare-fun res!938570 () Bool)

(assert (=> b!1400065 (=> res!938570 e!792655)))

(assert (=> b!1400065 (= res!938570 (or (bvslt (x!126128 lt!615926) #b00000000000000000000000000000000) (bvsgt (x!126128 lt!615926) #b01111111111111111111111111111110) (bvslt (x!126128 lt!615933) #b00000000000000000000000000000000) (bvsgt (x!126128 lt!615933) #b01111111111111111111111111111110) (bvslt lt!615931 #b00000000000000000000000000000000) (bvsge lt!615931 (size!46758 a!2901)) (bvslt (index!44479 lt!615926) #b00000000000000000000000000000000) (bvsge (index!44479 lt!615926) (size!46758 a!2901)) (bvslt (index!44479 lt!615933) #b00000000000000000000000000000000) (bvsge (index!44479 lt!615933) (size!46758 a!2901)) (not (= lt!615926 (Intermediate!10525 false (index!44479 lt!615926) (x!126128 lt!615926)))) (not (= lt!615933 (Intermediate!10525 false (index!44479 lt!615933) (x!126128 lt!615933))))))))

(assert (=> b!1400065 e!792658))

(declare-fun res!938568 () Bool)

(assert (=> b!1400065 (=> (not res!938568) (not e!792658))))

(assert (=> b!1400065 (= res!938568 (and (not (undefined!11337 lt!615933)) (= (index!44479 lt!615933) i!1037) (bvslt (x!126128 lt!615933) (x!126128 lt!615926)) (= (select (store (arr!46208 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44479 lt!615933)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615928 () Unit!47054)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47054)

(assert (=> b!1400065 (= lt!615928 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615931 (x!126128 lt!615926) (index!44479 lt!615926) (x!126128 lt!615933) (index!44479 lt!615933) (undefined!11337 lt!615933) mask!2840))))

(declare-fun b!1400066 () Bool)

(declare-fun res!938578 () Bool)

(assert (=> b!1400066 (=> (not res!938578) (not e!792657))))

(declare-datatypes ((List!32727 0))(
  ( (Nil!32724) (Cons!32723 (h!33971 (_ BitVec 64)) (t!47421 List!32727)) )
))
(declare-fun arrayNoDuplicates!0 (array!95715 (_ BitVec 32) List!32727) Bool)

(assert (=> b!1400066 (= res!938578 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32724))))

(declare-fun b!1400067 () Bool)

(assert (=> b!1400067 (= e!792656 (= (seekEntryOrOpen!0 (select (arr!46208 a!2901) j!112) a!2901 mask!2840) (Found!10525 j!112)))))

(declare-fun res!938574 () Bool)

(assert (=> start!120306 (=> (not res!938574) (not e!792657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120306 (= res!938574 (validMask!0 mask!2840))))

(assert (=> start!120306 e!792657))

(assert (=> start!120306 true))

(declare-fun array_inv!35236 (array!95715) Bool)

(assert (=> start!120306 (array_inv!35236 a!2901)))

(declare-fun b!1400064 () Bool)

(declare-fun res!938575 () Bool)

(assert (=> b!1400064 (=> (not res!938575) (not e!792657))))

(assert (=> b!1400064 (= res!938575 (validKeyInArray!0 (select (arr!46208 a!2901) j!112)))))

(assert (= (and start!120306 res!938574) b!1400058))

(assert (= (and b!1400058 res!938569) b!1400062))

(assert (= (and b!1400062 res!938571) b!1400064))

(assert (= (and b!1400064 res!938575) b!1400063))

(assert (= (and b!1400063 res!938573) b!1400066))

(assert (= (and b!1400066 res!938578) b!1400060))

(assert (= (and b!1400060 res!938576) b!1400067))

(assert (= (and b!1400060 (not res!938572)) b!1400057))

(assert (= (and b!1400057 (not res!938577)) b!1400065))

(assert (= (and b!1400065 res!938568) b!1400061))

(assert (= (and b!1400065 (not res!938570)) b!1400059))

(declare-fun m!1287381 () Bool)

(assert (=> b!1400057 m!1287381))

(assert (=> b!1400057 m!1287381))

(declare-fun m!1287383 () Bool)

(assert (=> b!1400057 m!1287383))

(declare-fun m!1287385 () Bool)

(assert (=> b!1400057 m!1287385))

(declare-fun m!1287387 () Bool)

(assert (=> b!1400057 m!1287387))

(declare-fun m!1287389 () Bool)

(assert (=> b!1400060 m!1287389))

(declare-fun m!1287391 () Bool)

(assert (=> b!1400060 m!1287391))

(assert (=> b!1400060 m!1287389))

(declare-fun m!1287393 () Bool)

(assert (=> b!1400060 m!1287393))

(assert (=> b!1400060 m!1287389))

(declare-fun m!1287395 () Bool)

(assert (=> b!1400060 m!1287395))

(declare-fun m!1287397 () Bool)

(assert (=> b!1400060 m!1287397))

(declare-fun m!1287399 () Bool)

(assert (=> b!1400066 m!1287399))

(declare-fun m!1287401 () Bool)

(assert (=> b!1400061 m!1287401))

(assert (=> b!1400061 m!1287389))

(assert (=> b!1400061 m!1287389))

(declare-fun m!1287403 () Bool)

(assert (=> b!1400061 m!1287403))

(declare-fun m!1287405 () Bool)

(assert (=> b!1400059 m!1287405))

(declare-fun m!1287407 () Bool)

(assert (=> start!120306 m!1287407))

(declare-fun m!1287409 () Bool)

(assert (=> start!120306 m!1287409))

(assert (=> b!1400064 m!1287389))

(assert (=> b!1400064 m!1287389))

(declare-fun m!1287411 () Bool)

(assert (=> b!1400064 m!1287411))

(assert (=> b!1400065 m!1287385))

(declare-fun m!1287413 () Bool)

(assert (=> b!1400065 m!1287413))

(declare-fun m!1287415 () Bool)

(assert (=> b!1400065 m!1287415))

(declare-fun m!1287417 () Bool)

(assert (=> b!1400062 m!1287417))

(assert (=> b!1400062 m!1287417))

(declare-fun m!1287419 () Bool)

(assert (=> b!1400062 m!1287419))

(assert (=> b!1400067 m!1287389))

(assert (=> b!1400067 m!1287389))

(declare-fun m!1287421 () Bool)

(assert (=> b!1400067 m!1287421))

(declare-fun m!1287423 () Bool)

(assert (=> b!1400063 m!1287423))

(push 1)

