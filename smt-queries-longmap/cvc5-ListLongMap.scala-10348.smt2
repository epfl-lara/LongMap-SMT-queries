; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121638 () Bool)

(assert start!121638)

(declare-fun b!1413186 () Bool)

(declare-fun e!799751 () Bool)

(declare-fun e!799752 () Bool)

(assert (=> b!1413186 (= e!799751 (not e!799752))))

(declare-fun res!950183 () Bool)

(assert (=> b!1413186 (=> res!950183 e!799752)))

(declare-datatypes ((SeekEntryResult!10936 0))(
  ( (MissingZero!10936 (index!46124 (_ BitVec 32))) (Found!10936 (index!46125 (_ BitVec 32))) (Intermediate!10936 (undefined!11748 Bool) (index!46126 (_ BitVec 32)) (x!127711 (_ BitVec 32))) (Undefined!10936) (MissingVacant!10936 (index!46127 (_ BitVec 32))) )
))
(declare-fun lt!622863 () SeekEntryResult!10936)

(assert (=> b!1413186 (= res!950183 (or (not (is-Intermediate!10936 lt!622863)) (undefined!11748 lt!622863)))))

(declare-fun e!799750 () Bool)

(assert (=> b!1413186 e!799750))

(declare-fun res!950182 () Bool)

(assert (=> b!1413186 (=> (not res!950182) (not e!799750))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96576 0))(
  ( (array!96577 (arr!46625 (Array (_ BitVec 32) (_ BitVec 64))) (size!47175 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96576)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96576 (_ BitVec 32)) Bool)

(assert (=> b!1413186 (= res!950182 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47846 0))(
  ( (Unit!47847) )
))
(declare-fun lt!622859 () Unit!47846)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47846)

(assert (=> b!1413186 (= lt!622859 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622862 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96576 (_ BitVec 32)) SeekEntryResult!10936)

(assert (=> b!1413186 (= lt!622863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622862 (select (arr!46625 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413186 (= lt!622862 (toIndex!0 (select (arr!46625 a!2901) j!112) mask!2840))))

(declare-fun res!950179 () Bool)

(assert (=> start!121638 (=> (not res!950179) (not e!799751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121638 (= res!950179 (validMask!0 mask!2840))))

(assert (=> start!121638 e!799751))

(assert (=> start!121638 true))

(declare-fun array_inv!35653 (array!96576) Bool)

(assert (=> start!121638 (array_inv!35653 a!2901)))

(declare-fun b!1413187 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96576 (_ BitVec 32)) SeekEntryResult!10936)

(assert (=> b!1413187 (= e!799750 (= (seekEntryOrOpen!0 (select (arr!46625 a!2901) j!112) a!2901 mask!2840) (Found!10936 j!112)))))

(declare-fun b!1413188 () Bool)

(declare-fun res!950177 () Bool)

(assert (=> b!1413188 (=> (not res!950177) (not e!799751))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413188 (= res!950177 (validKeyInArray!0 (select (arr!46625 a!2901) i!1037)))))

(declare-fun b!1413189 () Bool)

(declare-fun res!950176 () Bool)

(assert (=> b!1413189 (=> (not res!950176) (not e!799751))))

(assert (=> b!1413189 (= res!950176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413190 () Bool)

(declare-fun e!799754 () Bool)

(assert (=> b!1413190 (= e!799752 e!799754)))

(declare-fun res!950184 () Bool)

(assert (=> b!1413190 (=> res!950184 e!799754)))

(declare-fun lt!622861 () SeekEntryResult!10936)

(assert (=> b!1413190 (= res!950184 (or (= lt!622863 lt!622861) (not (is-Intermediate!10936 lt!622861))))))

(declare-fun lt!622858 () (_ BitVec 64))

(declare-fun lt!622857 () array!96576)

(assert (=> b!1413190 (= lt!622861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622858 mask!2840) lt!622858 lt!622857 mask!2840))))

(assert (=> b!1413190 (= lt!622858 (select (store (arr!46625 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413190 (= lt!622857 (array!96577 (store (arr!46625 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47175 a!2901)))))

(declare-fun b!1413191 () Bool)

(declare-fun res!950181 () Bool)

(assert (=> b!1413191 (=> (not res!950181) (not e!799751))))

(assert (=> b!1413191 (= res!950181 (and (= (size!47175 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47175 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47175 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413192 () Bool)

(assert (=> b!1413192 (= e!799754 true)))

(declare-fun e!799749 () Bool)

(assert (=> b!1413192 e!799749))

(declare-fun res!950185 () Bool)

(assert (=> b!1413192 (=> (not res!950185) (not e!799749))))

(assert (=> b!1413192 (= res!950185 (and (not (undefined!11748 lt!622861)) (= (index!46126 lt!622861) i!1037) (bvslt (x!127711 lt!622861) (x!127711 lt!622863)) (= (select (store (arr!46625 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46126 lt!622861)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622860 () Unit!47846)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47846)

(assert (=> b!1413192 (= lt!622860 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622862 (x!127711 lt!622863) (index!46126 lt!622863) (x!127711 lt!622861) (index!46126 lt!622861) (undefined!11748 lt!622861) mask!2840))))

(declare-fun b!1413193 () Bool)

(declare-fun res!950180 () Bool)

(assert (=> b!1413193 (=> (not res!950180) (not e!799751))))

(declare-datatypes ((List!33144 0))(
  ( (Nil!33141) (Cons!33140 (h!34415 (_ BitVec 64)) (t!47838 List!33144)) )
))
(declare-fun arrayNoDuplicates!0 (array!96576 (_ BitVec 32) List!33144) Bool)

(assert (=> b!1413193 (= res!950180 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33141))))

(declare-fun b!1413194 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96576 (_ BitVec 32)) SeekEntryResult!10936)

(assert (=> b!1413194 (= e!799749 (= (seekEntryOrOpen!0 lt!622858 lt!622857 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127711 lt!622861) (index!46126 lt!622861) (index!46126 lt!622861) (select (arr!46625 a!2901) j!112) lt!622857 mask!2840)))))

(declare-fun b!1413195 () Bool)

(declare-fun res!950178 () Bool)

(assert (=> b!1413195 (=> (not res!950178) (not e!799751))))

(assert (=> b!1413195 (= res!950178 (validKeyInArray!0 (select (arr!46625 a!2901) j!112)))))

(assert (= (and start!121638 res!950179) b!1413191))

(assert (= (and b!1413191 res!950181) b!1413188))

(assert (= (and b!1413188 res!950177) b!1413195))

(assert (= (and b!1413195 res!950178) b!1413189))

(assert (= (and b!1413189 res!950176) b!1413193))

(assert (= (and b!1413193 res!950180) b!1413186))

(assert (= (and b!1413186 res!950182) b!1413187))

(assert (= (and b!1413186 (not res!950183)) b!1413190))

(assert (= (and b!1413190 (not res!950184)) b!1413192))

(assert (= (and b!1413192 res!950185) b!1413194))

(declare-fun m!1303509 () Bool)

(assert (=> b!1413195 m!1303509))

(assert (=> b!1413195 m!1303509))

(declare-fun m!1303511 () Bool)

(assert (=> b!1413195 m!1303511))

(declare-fun m!1303513 () Bool)

(assert (=> start!121638 m!1303513))

(declare-fun m!1303515 () Bool)

(assert (=> start!121638 m!1303515))

(declare-fun m!1303517 () Bool)

(assert (=> b!1413188 m!1303517))

(assert (=> b!1413188 m!1303517))

(declare-fun m!1303519 () Bool)

(assert (=> b!1413188 m!1303519))

(declare-fun m!1303521 () Bool)

(assert (=> b!1413194 m!1303521))

(assert (=> b!1413194 m!1303509))

(assert (=> b!1413194 m!1303509))

(declare-fun m!1303523 () Bool)

(assert (=> b!1413194 m!1303523))

(declare-fun m!1303525 () Bool)

(assert (=> b!1413190 m!1303525))

(assert (=> b!1413190 m!1303525))

(declare-fun m!1303527 () Bool)

(assert (=> b!1413190 m!1303527))

(declare-fun m!1303529 () Bool)

(assert (=> b!1413190 m!1303529))

(declare-fun m!1303531 () Bool)

(assert (=> b!1413190 m!1303531))

(assert (=> b!1413192 m!1303529))

(declare-fun m!1303533 () Bool)

(assert (=> b!1413192 m!1303533))

(declare-fun m!1303535 () Bool)

(assert (=> b!1413192 m!1303535))

(declare-fun m!1303537 () Bool)

(assert (=> b!1413193 m!1303537))

(assert (=> b!1413187 m!1303509))

(assert (=> b!1413187 m!1303509))

(declare-fun m!1303539 () Bool)

(assert (=> b!1413187 m!1303539))

(declare-fun m!1303541 () Bool)

(assert (=> b!1413189 m!1303541))

(assert (=> b!1413186 m!1303509))

(declare-fun m!1303543 () Bool)

(assert (=> b!1413186 m!1303543))

(assert (=> b!1413186 m!1303509))

(declare-fun m!1303545 () Bool)

(assert (=> b!1413186 m!1303545))

(assert (=> b!1413186 m!1303509))

(declare-fun m!1303547 () Bool)

(assert (=> b!1413186 m!1303547))

(declare-fun m!1303549 () Bool)

(assert (=> b!1413186 m!1303549))

(push 1)

