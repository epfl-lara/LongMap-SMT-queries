; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120304 () Bool)

(assert start!120304)

(declare-fun b!1400024 () Bool)

(declare-fun e!792638 () Bool)

(declare-fun e!792637 () Bool)

(assert (=> b!1400024 (= e!792638 (not e!792637))))

(declare-fun res!938543 () Bool)

(assert (=> b!1400024 (=> res!938543 e!792637)))

(declare-datatypes ((SeekEntryResult!10524 0))(
  ( (MissingZero!10524 (index!44473 (_ BitVec 32))) (Found!10524 (index!44474 (_ BitVec 32))) (Intermediate!10524 (undefined!11336 Bool) (index!44475 (_ BitVec 32)) (x!126119 (_ BitVec 32))) (Undefined!10524) (MissingVacant!10524 (index!44476 (_ BitVec 32))) )
))
(declare-fun lt!615903 () SeekEntryResult!10524)

(assert (=> b!1400024 (= res!938543 (or (not (is-Intermediate!10524 lt!615903)) (undefined!11336 lt!615903)))))

(declare-fun e!792636 () Bool)

(assert (=> b!1400024 e!792636))

(declare-fun res!938538 () Bool)

(assert (=> b!1400024 (=> (not res!938538) (not e!792636))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95713 0))(
  ( (array!95714 (arr!46207 (Array (_ BitVec 32) (_ BitVec 64))) (size!46757 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95713)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95713 (_ BitVec 32)) Bool)

(assert (=> b!1400024 (= res!938538 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47052 0))(
  ( (Unit!47053) )
))
(declare-fun lt!615905 () Unit!47052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47052)

(assert (=> b!1400024 (= lt!615905 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615904 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95713 (_ BitVec 32)) SeekEntryResult!10524)

(assert (=> b!1400024 (= lt!615903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615904 (select (arr!46207 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400024 (= lt!615904 (toIndex!0 (select (arr!46207 a!2901) j!112) mask!2840))))

(declare-fun b!1400025 () Bool)

(declare-fun res!938541 () Bool)

(assert (=> b!1400025 (=> (not res!938541) (not e!792638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400025 (= res!938541 (validKeyInArray!0 (select (arr!46207 a!2901) j!112)))))

(declare-fun b!1400026 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95713 (_ BitVec 32)) SeekEntryResult!10524)

(assert (=> b!1400026 (= e!792636 (= (seekEntryOrOpen!0 (select (arr!46207 a!2901) j!112) a!2901 mask!2840) (Found!10524 j!112)))))

(declare-fun res!938536 () Bool)

(assert (=> start!120304 (=> (not res!938536) (not e!792638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120304 (= res!938536 (validMask!0 mask!2840))))

(assert (=> start!120304 e!792638))

(assert (=> start!120304 true))

(declare-fun array_inv!35235 (array!95713) Bool)

(assert (=> start!120304 (array_inv!35235 a!2901)))

(declare-fun b!1400027 () Bool)

(declare-fun res!938537 () Bool)

(assert (=> b!1400027 (=> (not res!938537) (not e!792638))))

(assert (=> b!1400027 (= res!938537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400028 () Bool)

(declare-fun res!938540 () Bool)

(assert (=> b!1400028 (=> (not res!938540) (not e!792638))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400028 (= res!938540 (and (= (size!46757 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46757 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46757 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400029 () Bool)

(declare-fun res!938539 () Bool)

(assert (=> b!1400029 (=> (not res!938539) (not e!792638))))

(assert (=> b!1400029 (= res!938539 (validKeyInArray!0 (select (arr!46207 a!2901) i!1037)))))

(declare-fun b!1400030 () Bool)

(declare-fun res!938542 () Bool)

(assert (=> b!1400030 (=> (not res!938542) (not e!792638))))

(declare-datatypes ((List!32726 0))(
  ( (Nil!32723) (Cons!32722 (h!33970 (_ BitVec 64)) (t!47420 List!32726)) )
))
(declare-fun arrayNoDuplicates!0 (array!95713 (_ BitVec 32) List!32726) Bool)

(assert (=> b!1400030 (= res!938542 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32723))))

(declare-fun b!1400031 () Bool)

(declare-fun e!792634 () Bool)

(declare-fun e!792632 () Bool)

(assert (=> b!1400031 (= e!792634 e!792632)))

(declare-fun res!938545 () Bool)

(assert (=> b!1400031 (=> res!938545 e!792632)))

(declare-fun lt!615907 () SeekEntryResult!10524)

(assert (=> b!1400031 (= res!938545 (or (bvslt (x!126119 lt!615903) #b00000000000000000000000000000000) (bvsgt (x!126119 lt!615903) #b01111111111111111111111111111110) (bvslt (x!126119 lt!615907) #b00000000000000000000000000000000) (bvsgt (x!126119 lt!615907) #b01111111111111111111111111111110) (bvslt lt!615904 #b00000000000000000000000000000000) (bvsge lt!615904 (size!46757 a!2901)) (bvslt (index!44475 lt!615903) #b00000000000000000000000000000000) (bvsge (index!44475 lt!615903) (size!46757 a!2901)) (bvslt (index!44475 lt!615907) #b00000000000000000000000000000000) (bvsge (index!44475 lt!615907) (size!46757 a!2901)) (not (= lt!615903 (Intermediate!10524 false (index!44475 lt!615903) (x!126119 lt!615903)))) (not (= lt!615907 (Intermediate!10524 false (index!44475 lt!615907) (x!126119 lt!615907))))))))

(declare-fun e!792633 () Bool)

(assert (=> b!1400031 e!792633))

(declare-fun res!938544 () Bool)

(assert (=> b!1400031 (=> (not res!938544) (not e!792633))))

(assert (=> b!1400031 (= res!938544 (and (not (undefined!11336 lt!615907)) (= (index!44475 lt!615907) i!1037) (bvslt (x!126119 lt!615907) (x!126119 lt!615903)) (= (select (store (arr!46207 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44475 lt!615907)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615909 () Unit!47052)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47052)

(assert (=> b!1400031 (= lt!615909 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615904 (x!126119 lt!615903) (index!44475 lt!615903) (x!126119 lt!615907) (index!44475 lt!615907) (undefined!11336 lt!615907) mask!2840))))

(declare-fun b!1400032 () Bool)

(assert (=> b!1400032 (= e!792637 e!792634)))

(declare-fun res!938535 () Bool)

(assert (=> b!1400032 (=> res!938535 e!792634)))

(assert (=> b!1400032 (= res!938535 (or (= lt!615903 lt!615907) (not (is-Intermediate!10524 lt!615907))))))

(declare-fun lt!615906 () (_ BitVec 64))

(declare-fun lt!615902 () array!95713)

(assert (=> b!1400032 (= lt!615907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615906 mask!2840) lt!615906 lt!615902 mask!2840))))

(assert (=> b!1400032 (= lt!615906 (select (store (arr!46207 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400032 (= lt!615902 (array!95714 (store (arr!46207 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46757 a!2901)))))

(declare-fun b!1400033 () Bool)

(assert (=> b!1400033 (= e!792632 true)))

(declare-fun lt!615908 () SeekEntryResult!10524)

(assert (=> b!1400033 (= lt!615908 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615904 lt!615906 lt!615902 mask!2840))))

(declare-fun b!1400034 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95713 (_ BitVec 32)) SeekEntryResult!10524)

(assert (=> b!1400034 (= e!792633 (= (seekEntryOrOpen!0 lt!615906 lt!615902 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126119 lt!615907) (index!44475 lt!615907) (index!44475 lt!615907) (select (arr!46207 a!2901) j!112) lt!615902 mask!2840)))))

(assert (= (and start!120304 res!938536) b!1400028))

(assert (= (and b!1400028 res!938540) b!1400029))

(assert (= (and b!1400029 res!938539) b!1400025))

(assert (= (and b!1400025 res!938541) b!1400027))

(assert (= (and b!1400027 res!938537) b!1400030))

(assert (= (and b!1400030 res!938542) b!1400024))

(assert (= (and b!1400024 res!938538) b!1400026))

(assert (= (and b!1400024 (not res!938543)) b!1400032))

(assert (= (and b!1400032 (not res!938535)) b!1400031))

(assert (= (and b!1400031 res!938544) b!1400034))

(assert (= (and b!1400031 (not res!938545)) b!1400033))

(declare-fun m!1287337 () Bool)

(assert (=> b!1400033 m!1287337))

(declare-fun m!1287339 () Bool)

(assert (=> b!1400032 m!1287339))

(assert (=> b!1400032 m!1287339))

(declare-fun m!1287341 () Bool)

(assert (=> b!1400032 m!1287341))

(declare-fun m!1287343 () Bool)

(assert (=> b!1400032 m!1287343))

(declare-fun m!1287345 () Bool)

(assert (=> b!1400032 m!1287345))

(declare-fun m!1287347 () Bool)

(assert (=> start!120304 m!1287347))

(declare-fun m!1287349 () Bool)

(assert (=> start!120304 m!1287349))

(declare-fun m!1287351 () Bool)

(assert (=> b!1400025 m!1287351))

(assert (=> b!1400025 m!1287351))

(declare-fun m!1287353 () Bool)

(assert (=> b!1400025 m!1287353))

(assert (=> b!1400031 m!1287343))

(declare-fun m!1287355 () Bool)

(assert (=> b!1400031 m!1287355))

(declare-fun m!1287357 () Bool)

(assert (=> b!1400031 m!1287357))

(declare-fun m!1287359 () Bool)

(assert (=> b!1400030 m!1287359))

(assert (=> b!1400026 m!1287351))

(assert (=> b!1400026 m!1287351))

(declare-fun m!1287361 () Bool)

(assert (=> b!1400026 m!1287361))

(declare-fun m!1287363 () Bool)

(assert (=> b!1400027 m!1287363))

(declare-fun m!1287365 () Bool)

(assert (=> b!1400029 m!1287365))

(assert (=> b!1400029 m!1287365))

(declare-fun m!1287367 () Bool)

(assert (=> b!1400029 m!1287367))

(declare-fun m!1287369 () Bool)

(assert (=> b!1400034 m!1287369))

(assert (=> b!1400034 m!1287351))

(assert (=> b!1400034 m!1287351))

(declare-fun m!1287371 () Bool)

(assert (=> b!1400034 m!1287371))

(assert (=> b!1400024 m!1287351))

(declare-fun m!1287373 () Bool)

(assert (=> b!1400024 m!1287373))

(assert (=> b!1400024 m!1287351))

(declare-fun m!1287375 () Bool)

(assert (=> b!1400024 m!1287375))

(assert (=> b!1400024 m!1287351))

(declare-fun m!1287377 () Bool)

(assert (=> b!1400024 m!1287377))

(declare-fun m!1287379 () Bool)

(assert (=> b!1400024 m!1287379))

(push 1)

