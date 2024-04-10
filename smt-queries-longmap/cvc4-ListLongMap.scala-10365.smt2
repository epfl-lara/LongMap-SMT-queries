; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122008 () Bool)

(assert start!122008)

(declare-fun b!1416111 () Bool)

(declare-fun res!952157 () Bool)

(declare-fun e!801495 () Bool)

(assert (=> b!1416111 (=> (not res!952157) (not e!801495))))

(declare-datatypes ((array!96694 0))(
  ( (array!96695 (arr!46678 (Array (_ BitVec 32) (_ BitVec 64))) (size!47228 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96694)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416111 (= res!952157 (validKeyInArray!0 (select (arr!46678 a!2901) i!1037)))))

(declare-fun b!1416112 () Bool)

(declare-fun res!952161 () Bool)

(declare-fun e!801497 () Bool)

(assert (=> b!1416112 (=> res!952161 e!801497)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624668 () (_ BitVec 32))

(declare-fun lt!624672 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10989 0))(
  ( (MissingZero!10989 (index!46348 (_ BitVec 32))) (Found!10989 (index!46349 (_ BitVec 32))) (Intermediate!10989 (undefined!11801 Bool) (index!46350 (_ BitVec 32)) (x!127948 (_ BitVec 32))) (Undefined!10989) (MissingVacant!10989 (index!46351 (_ BitVec 32))) )
))
(declare-fun lt!624663 () SeekEntryResult!10989)

(declare-fun lt!624669 () array!96694)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96694 (_ BitVec 32)) SeekEntryResult!10989)

(assert (=> b!1416112 (= res!952161 (not (= lt!624663 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624668 lt!624672 lt!624669 mask!2840))))))

(declare-fun b!1416113 () Bool)

(declare-fun res!952153 () Bool)

(assert (=> b!1416113 (=> (not res!952153) (not e!801495))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416113 (= res!952153 (validKeyInArray!0 (select (arr!46678 a!2901) j!112)))))

(declare-fun res!952155 () Bool)

(assert (=> start!122008 (=> (not res!952155) (not e!801495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122008 (= res!952155 (validMask!0 mask!2840))))

(assert (=> start!122008 e!801495))

(assert (=> start!122008 true))

(declare-fun array_inv!35706 (array!96694) Bool)

(assert (=> start!122008 (array_inv!35706 a!2901)))

(declare-fun b!1416114 () Bool)

(declare-fun e!801496 () Bool)

(assert (=> b!1416114 (= e!801496 e!801497)))

(declare-fun res!952158 () Bool)

(assert (=> b!1416114 (=> res!952158 e!801497)))

(declare-fun lt!624670 () SeekEntryResult!10989)

(assert (=> b!1416114 (= res!952158 (or (bvslt (x!127948 lt!624670) #b00000000000000000000000000000000) (bvsgt (x!127948 lt!624670) #b01111111111111111111111111111110) (bvslt (x!127948 lt!624663) #b00000000000000000000000000000000) (bvsgt (x!127948 lt!624663) #b01111111111111111111111111111110) (bvslt lt!624668 #b00000000000000000000000000000000) (bvsge lt!624668 (size!47228 a!2901)) (bvslt (index!46350 lt!624670) #b00000000000000000000000000000000) (bvsge (index!46350 lt!624670) (size!47228 a!2901)) (bvslt (index!46350 lt!624663) #b00000000000000000000000000000000) (bvsge (index!46350 lt!624663) (size!47228 a!2901)) (not (= lt!624670 (Intermediate!10989 false (index!46350 lt!624670) (x!127948 lt!624670)))) (not (= lt!624663 (Intermediate!10989 false (index!46350 lt!624663) (x!127948 lt!624663))))))))

(declare-fun lt!624671 () SeekEntryResult!10989)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96694 (_ BitVec 32)) SeekEntryResult!10989)

(assert (=> b!1416114 (= lt!624671 (seekKeyOrZeroReturnVacant!0 (x!127948 lt!624663) (index!46350 lt!624663) (index!46350 lt!624663) (select (arr!46678 a!2901) j!112) lt!624669 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96694 (_ BitVec 32)) SeekEntryResult!10989)

(assert (=> b!1416114 (= lt!624671 (seekEntryOrOpen!0 lt!624672 lt!624669 mask!2840))))

(assert (=> b!1416114 (and (not (undefined!11801 lt!624663)) (= (index!46350 lt!624663) i!1037) (bvslt (x!127948 lt!624663) (x!127948 lt!624670)) (= (select (store (arr!46678 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46350 lt!624663)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47952 0))(
  ( (Unit!47953) )
))
(declare-fun lt!624664 () Unit!47952)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47952)

(assert (=> b!1416114 (= lt!624664 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624668 (x!127948 lt!624670) (index!46350 lt!624670) (x!127948 lt!624663) (index!46350 lt!624663) (undefined!11801 lt!624663) mask!2840))))

(declare-fun b!1416115 () Bool)

(declare-fun res!952160 () Bool)

(assert (=> b!1416115 (=> (not res!952160) (not e!801495))))

(declare-datatypes ((List!33197 0))(
  ( (Nil!33194) (Cons!33193 (h!34480 (_ BitVec 64)) (t!47891 List!33197)) )
))
(declare-fun arrayNoDuplicates!0 (array!96694 (_ BitVec 32) List!33197) Bool)

(assert (=> b!1416115 (= res!952160 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33194))))

(declare-fun b!1416116 () Bool)

(declare-fun e!801493 () Bool)

(assert (=> b!1416116 (= e!801493 e!801496)))

(declare-fun res!952159 () Bool)

(assert (=> b!1416116 (=> res!952159 e!801496)))

(assert (=> b!1416116 (= res!952159 (or (= lt!624670 lt!624663) (not (is-Intermediate!10989 lt!624663))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416116 (= lt!624663 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624672 mask!2840) lt!624672 lt!624669 mask!2840))))

(assert (=> b!1416116 (= lt!624672 (select (store (arr!46678 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416116 (= lt!624669 (array!96695 (store (arr!46678 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47228 a!2901)))))

(declare-fun b!1416117 () Bool)

(assert (=> b!1416117 (= e!801497 true)))

(declare-fun lt!624665 () SeekEntryResult!10989)

(assert (=> b!1416117 (= lt!624665 lt!624671)))

(declare-fun lt!624667 () Unit!47952)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47952)

(assert (=> b!1416117 (= lt!624667 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624668 (x!127948 lt!624670) (index!46350 lt!624670) (x!127948 lt!624663) (index!46350 lt!624663) mask!2840))))

(declare-fun b!1416118 () Bool)

(declare-fun res!952154 () Bool)

(assert (=> b!1416118 (=> (not res!952154) (not e!801495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96694 (_ BitVec 32)) Bool)

(assert (=> b!1416118 (= res!952154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416119 () Bool)

(assert (=> b!1416119 (= e!801495 (not e!801493))))

(declare-fun res!952162 () Bool)

(assert (=> b!1416119 (=> res!952162 e!801493)))

(assert (=> b!1416119 (= res!952162 (or (not (is-Intermediate!10989 lt!624670)) (undefined!11801 lt!624670)))))

(assert (=> b!1416119 (= lt!624665 (Found!10989 j!112))))

(assert (=> b!1416119 (= lt!624665 (seekEntryOrOpen!0 (select (arr!46678 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416119 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624666 () Unit!47952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47952)

(assert (=> b!1416119 (= lt!624666 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416119 (= lt!624670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624668 (select (arr!46678 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416119 (= lt!624668 (toIndex!0 (select (arr!46678 a!2901) j!112) mask!2840))))

(declare-fun b!1416120 () Bool)

(declare-fun res!952156 () Bool)

(assert (=> b!1416120 (=> (not res!952156) (not e!801495))))

(assert (=> b!1416120 (= res!952156 (and (= (size!47228 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47228 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47228 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122008 res!952155) b!1416120))

(assert (= (and b!1416120 res!952156) b!1416111))

(assert (= (and b!1416111 res!952157) b!1416113))

(assert (= (and b!1416113 res!952153) b!1416118))

(assert (= (and b!1416118 res!952154) b!1416115))

(assert (= (and b!1416115 res!952160) b!1416119))

(assert (= (and b!1416119 (not res!952162)) b!1416116))

(assert (= (and b!1416116 (not res!952159)) b!1416114))

(assert (= (and b!1416114 (not res!952158)) b!1416112))

(assert (= (and b!1416112 (not res!952161)) b!1416117))

(declare-fun m!1306661 () Bool)

(assert (=> b!1416112 m!1306661))

(declare-fun m!1306663 () Bool)

(assert (=> b!1416114 m!1306663))

(declare-fun m!1306665 () Bool)

(assert (=> b!1416114 m!1306665))

(assert (=> b!1416114 m!1306663))

(declare-fun m!1306667 () Bool)

(assert (=> b!1416114 m!1306667))

(declare-fun m!1306669 () Bool)

(assert (=> b!1416114 m!1306669))

(declare-fun m!1306671 () Bool)

(assert (=> b!1416114 m!1306671))

(declare-fun m!1306673 () Bool)

(assert (=> b!1416114 m!1306673))

(assert (=> b!1416119 m!1306663))

(declare-fun m!1306675 () Bool)

(assert (=> b!1416119 m!1306675))

(assert (=> b!1416119 m!1306663))

(declare-fun m!1306677 () Bool)

(assert (=> b!1416119 m!1306677))

(assert (=> b!1416119 m!1306663))

(declare-fun m!1306679 () Bool)

(assert (=> b!1416119 m!1306679))

(assert (=> b!1416119 m!1306663))

(declare-fun m!1306681 () Bool)

(assert (=> b!1416119 m!1306681))

(declare-fun m!1306683 () Bool)

(assert (=> b!1416119 m!1306683))

(declare-fun m!1306685 () Bool)

(assert (=> b!1416117 m!1306685))

(declare-fun m!1306687 () Bool)

(assert (=> start!122008 m!1306687))

(declare-fun m!1306689 () Bool)

(assert (=> start!122008 m!1306689))

(declare-fun m!1306691 () Bool)

(assert (=> b!1416116 m!1306691))

(assert (=> b!1416116 m!1306691))

(declare-fun m!1306693 () Bool)

(assert (=> b!1416116 m!1306693))

(assert (=> b!1416116 m!1306669))

(declare-fun m!1306695 () Bool)

(assert (=> b!1416116 m!1306695))

(declare-fun m!1306697 () Bool)

(assert (=> b!1416118 m!1306697))

(declare-fun m!1306699 () Bool)

(assert (=> b!1416111 m!1306699))

(assert (=> b!1416111 m!1306699))

(declare-fun m!1306701 () Bool)

(assert (=> b!1416111 m!1306701))

(assert (=> b!1416113 m!1306663))

(assert (=> b!1416113 m!1306663))

(declare-fun m!1306703 () Bool)

(assert (=> b!1416113 m!1306703))

(declare-fun m!1306705 () Bool)

(assert (=> b!1416115 m!1306705))

(push 1)

