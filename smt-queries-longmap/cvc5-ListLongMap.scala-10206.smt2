; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120288 () Bool)

(assert start!120288)

(declare-fun b!1399760 () Bool)

(declare-fun res!938280 () Bool)

(declare-fun e!792469 () Bool)

(assert (=> b!1399760 (=> (not res!938280) (not e!792469))))

(declare-datatypes ((array!95697 0))(
  ( (array!95698 (arr!46199 (Array (_ BitVec 32) (_ BitVec 64))) (size!46749 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95697)

(declare-datatypes ((List!32718 0))(
  ( (Nil!32715) (Cons!32714 (h!33962 (_ BitVec 64)) (t!47412 List!32718)) )
))
(declare-fun arrayNoDuplicates!0 (array!95697 (_ BitVec 32) List!32718) Bool)

(assert (=> b!1399760 (= res!938280 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32715))))

(declare-fun res!938277 () Bool)

(assert (=> start!120288 (=> (not res!938277) (not e!792469))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120288 (= res!938277 (validMask!0 mask!2840))))

(assert (=> start!120288 e!792469))

(assert (=> start!120288 true))

(declare-fun array_inv!35227 (array!95697) Bool)

(assert (=> start!120288 (array_inv!35227 a!2901)))

(declare-fun b!1399761 () Bool)

(declare-fun res!938271 () Bool)

(assert (=> b!1399761 (=> (not res!938271) (not e!792469))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399761 (= res!938271 (and (= (size!46749 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46749 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46749 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399762 () Bool)

(declare-fun e!792464 () Bool)

(declare-fun e!792468 () Bool)

(assert (=> b!1399762 (= e!792464 e!792468)))

(declare-fun res!938279 () Bool)

(assert (=> b!1399762 (=> res!938279 e!792468)))

(declare-datatypes ((SeekEntryResult!10516 0))(
  ( (MissingZero!10516 (index!44441 (_ BitVec 32))) (Found!10516 (index!44442 (_ BitVec 32))) (Intermediate!10516 (undefined!11328 Bool) (index!44443 (_ BitVec 32)) (x!126095 (_ BitVec 32))) (Undefined!10516) (MissingVacant!10516 (index!44444 (_ BitVec 32))) )
))
(declare-fun lt!615712 () SeekEntryResult!10516)

(declare-fun lt!615710 () SeekEntryResult!10516)

(assert (=> b!1399762 (= res!938279 (or (= lt!615712 lt!615710) (not (is-Intermediate!10516 lt!615710))))))

(declare-fun lt!615711 () (_ BitVec 64))

(declare-fun lt!615715 () array!95697)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95697 (_ BitVec 32)) SeekEntryResult!10516)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399762 (= lt!615710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615711 mask!2840) lt!615711 lt!615715 mask!2840))))

(assert (=> b!1399762 (= lt!615711 (select (store (arr!46199 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399762 (= lt!615715 (array!95698 (store (arr!46199 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46749 a!2901)))))

(declare-fun b!1399763 () Bool)

(declare-fun e!792467 () Bool)

(assert (=> b!1399763 (= e!792468 e!792467)))

(declare-fun res!938274 () Bool)

(assert (=> b!1399763 (=> res!938274 e!792467)))

(declare-fun lt!615713 () (_ BitVec 32))

(assert (=> b!1399763 (= res!938274 (or (bvslt (x!126095 lt!615712) #b00000000000000000000000000000000) (bvsgt (x!126095 lt!615712) #b01111111111111111111111111111110) (bvslt (x!126095 lt!615710) #b00000000000000000000000000000000) (bvsgt (x!126095 lt!615710) #b01111111111111111111111111111110) (bvslt lt!615713 #b00000000000000000000000000000000) (bvsge lt!615713 (size!46749 a!2901)) (bvslt (index!44443 lt!615712) #b00000000000000000000000000000000) (bvsge (index!44443 lt!615712) (size!46749 a!2901)) (bvslt (index!44443 lt!615710) #b00000000000000000000000000000000) (bvsge (index!44443 lt!615710) (size!46749 a!2901)) (not (= lt!615712 (Intermediate!10516 false (index!44443 lt!615712) (x!126095 lt!615712)))) (not (= lt!615710 (Intermediate!10516 false (index!44443 lt!615710) (x!126095 lt!615710))))))))

(declare-fun e!792470 () Bool)

(assert (=> b!1399763 e!792470))

(declare-fun res!938281 () Bool)

(assert (=> b!1399763 (=> (not res!938281) (not e!792470))))

(assert (=> b!1399763 (= res!938281 (and (not (undefined!11328 lt!615710)) (= (index!44443 lt!615710) i!1037) (bvslt (x!126095 lt!615710) (x!126095 lt!615712)) (= (select (store (arr!46199 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44443 lt!615710)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47036 0))(
  ( (Unit!47037) )
))
(declare-fun lt!615717 () Unit!47036)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47036)

(assert (=> b!1399763 (= lt!615717 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615713 (x!126095 lt!615712) (index!44443 lt!615712) (x!126095 lt!615710) (index!44443 lt!615710) (undefined!11328 lt!615710) mask!2840))))

(declare-fun b!1399764 () Bool)

(assert (=> b!1399764 (= e!792467 true)))

(declare-fun lt!615716 () SeekEntryResult!10516)

(assert (=> b!1399764 (= lt!615716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615713 lt!615711 lt!615715 mask!2840))))

(declare-fun b!1399765 () Bool)

(declare-fun e!792466 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95697 (_ BitVec 32)) SeekEntryResult!10516)

(assert (=> b!1399765 (= e!792466 (= (seekEntryOrOpen!0 (select (arr!46199 a!2901) j!112) a!2901 mask!2840) (Found!10516 j!112)))))

(declare-fun b!1399766 () Bool)

(declare-fun res!938275 () Bool)

(assert (=> b!1399766 (=> (not res!938275) (not e!792469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399766 (= res!938275 (validKeyInArray!0 (select (arr!46199 a!2901) i!1037)))))

(declare-fun b!1399767 () Bool)

(declare-fun res!938278 () Bool)

(assert (=> b!1399767 (=> (not res!938278) (not e!792469))))

(assert (=> b!1399767 (= res!938278 (validKeyInArray!0 (select (arr!46199 a!2901) j!112)))))

(declare-fun b!1399768 () Bool)

(assert (=> b!1399768 (= e!792469 (not e!792464))))

(declare-fun res!938273 () Bool)

(assert (=> b!1399768 (=> res!938273 e!792464)))

(assert (=> b!1399768 (= res!938273 (or (not (is-Intermediate!10516 lt!615712)) (undefined!11328 lt!615712)))))

(assert (=> b!1399768 e!792466))

(declare-fun res!938276 () Bool)

(assert (=> b!1399768 (=> (not res!938276) (not e!792466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95697 (_ BitVec 32)) Bool)

(assert (=> b!1399768 (= res!938276 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615714 () Unit!47036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47036)

(assert (=> b!1399768 (= lt!615714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399768 (= lt!615712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615713 (select (arr!46199 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399768 (= lt!615713 (toIndex!0 (select (arr!46199 a!2901) j!112) mask!2840))))

(declare-fun b!1399769 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95697 (_ BitVec 32)) SeekEntryResult!10516)

(assert (=> b!1399769 (= e!792470 (= (seekEntryOrOpen!0 lt!615711 lt!615715 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126095 lt!615710) (index!44443 lt!615710) (index!44443 lt!615710) (select (arr!46199 a!2901) j!112) lt!615715 mask!2840)))))

(declare-fun b!1399770 () Bool)

(declare-fun res!938272 () Bool)

(assert (=> b!1399770 (=> (not res!938272) (not e!792469))))

(assert (=> b!1399770 (= res!938272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120288 res!938277) b!1399761))

(assert (= (and b!1399761 res!938271) b!1399766))

(assert (= (and b!1399766 res!938275) b!1399767))

(assert (= (and b!1399767 res!938278) b!1399770))

(assert (= (and b!1399770 res!938272) b!1399760))

(assert (= (and b!1399760 res!938280) b!1399768))

(assert (= (and b!1399768 res!938276) b!1399765))

(assert (= (and b!1399768 (not res!938273)) b!1399762))

(assert (= (and b!1399762 (not res!938279)) b!1399763))

(assert (= (and b!1399763 res!938281) b!1399769))

(assert (= (and b!1399763 (not res!938274)) b!1399764))

(declare-fun m!1286985 () Bool)

(assert (=> b!1399770 m!1286985))

(declare-fun m!1286987 () Bool)

(assert (=> b!1399763 m!1286987))

(declare-fun m!1286989 () Bool)

(assert (=> b!1399763 m!1286989))

(declare-fun m!1286991 () Bool)

(assert (=> b!1399763 m!1286991))

(declare-fun m!1286993 () Bool)

(assert (=> start!120288 m!1286993))

(declare-fun m!1286995 () Bool)

(assert (=> start!120288 m!1286995))

(declare-fun m!1286997 () Bool)

(assert (=> b!1399762 m!1286997))

(assert (=> b!1399762 m!1286997))

(declare-fun m!1286999 () Bool)

(assert (=> b!1399762 m!1286999))

(assert (=> b!1399762 m!1286987))

(declare-fun m!1287001 () Bool)

(assert (=> b!1399762 m!1287001))

(declare-fun m!1287003 () Bool)

(assert (=> b!1399767 m!1287003))

(assert (=> b!1399767 m!1287003))

(declare-fun m!1287005 () Bool)

(assert (=> b!1399767 m!1287005))

(assert (=> b!1399765 m!1287003))

(assert (=> b!1399765 m!1287003))

(declare-fun m!1287007 () Bool)

(assert (=> b!1399765 m!1287007))

(declare-fun m!1287009 () Bool)

(assert (=> b!1399769 m!1287009))

(assert (=> b!1399769 m!1287003))

(assert (=> b!1399769 m!1287003))

(declare-fun m!1287011 () Bool)

(assert (=> b!1399769 m!1287011))

(declare-fun m!1287013 () Bool)

(assert (=> b!1399760 m!1287013))

(declare-fun m!1287015 () Bool)

(assert (=> b!1399766 m!1287015))

(assert (=> b!1399766 m!1287015))

(declare-fun m!1287017 () Bool)

(assert (=> b!1399766 m!1287017))

(assert (=> b!1399768 m!1287003))

(declare-fun m!1287019 () Bool)

(assert (=> b!1399768 m!1287019))

(assert (=> b!1399768 m!1287003))

(declare-fun m!1287021 () Bool)

(assert (=> b!1399768 m!1287021))

(assert (=> b!1399768 m!1287003))

(declare-fun m!1287023 () Bool)

(assert (=> b!1399768 m!1287023))

(declare-fun m!1287025 () Bool)

(assert (=> b!1399768 m!1287025))

(declare-fun m!1287027 () Bool)

(assert (=> b!1399764 m!1287027))

(push 1)

