; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122834 () Bool)

(assert start!122834)

(declare-fun b!1424670 () Bool)

(declare-fun e!805114 () Bool)

(declare-fun e!805112 () Bool)

(assert (=> b!1424670 (= e!805114 (not e!805112))))

(declare-fun res!960165 () Bool)

(assert (=> b!1424670 (=> res!960165 e!805112)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97152 0))(
  ( (array!97153 (arr!46894 (Array (_ BitVec 32) (_ BitVec 64))) (size!47446 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97152)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424670 (= res!960165 (or (= (select (arr!46894 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46894 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46894 a!2831) index!585) (select (arr!46894 a!2831) j!81)) (= (select (store (arr!46894 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805116 () Bool)

(assert (=> b!1424670 e!805116))

(declare-fun res!960169 () Bool)

(assert (=> b!1424670 (=> (not res!960169) (not e!805116))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97152 (_ BitVec 32)) Bool)

(assert (=> b!1424670 (= res!960169 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48087 0))(
  ( (Unit!48088) )
))
(declare-fun lt!627497 () Unit!48087)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48087)

(assert (=> b!1424670 (= lt!627497 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424671 () Bool)

(declare-fun res!960158 () Bool)

(assert (=> b!1424671 (=> (not res!960158) (not e!805114))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424671 (= res!960158 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424672 () Bool)

(declare-fun e!805118 () Bool)

(declare-fun e!805113 () Bool)

(assert (=> b!1424672 (= e!805118 e!805113)))

(declare-fun res!960166 () Bool)

(assert (=> b!1424672 (=> (not res!960166) (not e!805113))))

(declare-datatypes ((SeekEntryResult!11206 0))(
  ( (MissingZero!11206 (index!47216 (_ BitVec 32))) (Found!11206 (index!47217 (_ BitVec 32))) (Intermediate!11206 (undefined!12018 Bool) (index!47218 (_ BitVec 32)) (x!128837 (_ BitVec 32))) (Undefined!11206) (MissingVacant!11206 (index!47219 (_ BitVec 32))) )
))
(declare-fun lt!627500 () SeekEntryResult!11206)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97152 (_ BitVec 32)) SeekEntryResult!11206)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424672 (= res!960166 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46894 a!2831) j!81) mask!2608) (select (arr!46894 a!2831) j!81) a!2831 mask!2608) lt!627500))))

(assert (=> b!1424672 (= lt!627500 (Intermediate!11206 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424673 () Bool)

(declare-fun e!805115 () Bool)

(assert (=> b!1424673 (= e!805115 true)))

(declare-fun lt!627502 () array!97152)

(declare-fun lt!627501 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627498 () (_ BitVec 32))

(declare-fun lt!627503 () SeekEntryResult!11206)

(assert (=> b!1424673 (= lt!627503 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627498 lt!627501 lt!627502 mask!2608))))

(declare-fun b!1424674 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97152 (_ BitVec 32)) SeekEntryResult!11206)

(assert (=> b!1424674 (= e!805116 (= (seekEntryOrOpen!0 (select (arr!46894 a!2831) j!81) a!2831 mask!2608) (Found!11206 j!81)))))

(declare-fun b!1424675 () Bool)

(declare-fun res!960161 () Bool)

(assert (=> b!1424675 (=> (not res!960161) (not e!805118))))

(assert (=> b!1424675 (= res!960161 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47446 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47446 a!2831))))))

(declare-fun b!1424676 () Bool)

(declare-fun res!960157 () Bool)

(assert (=> b!1424676 (=> (not res!960157) (not e!805118))))

(assert (=> b!1424676 (= res!960157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424677 () Bool)

(declare-fun res!960159 () Bool)

(assert (=> b!1424677 (=> (not res!960159) (not e!805118))))

(assert (=> b!1424677 (= res!960159 (and (= (size!47446 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47446 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47446 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!960167 () Bool)

(assert (=> start!122834 (=> (not res!960167) (not e!805118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122834 (= res!960167 (validMask!0 mask!2608))))

(assert (=> start!122834 e!805118))

(assert (=> start!122834 true))

(declare-fun array_inv!36127 (array!97152) Bool)

(assert (=> start!122834 (array_inv!36127 a!2831)))

(declare-fun b!1424678 () Bool)

(declare-fun res!960163 () Bool)

(assert (=> b!1424678 (=> (not res!960163) (not e!805118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424678 (= res!960163 (validKeyInArray!0 (select (arr!46894 a!2831) i!982)))))

(declare-fun b!1424679 () Bool)

(declare-fun res!960155 () Bool)

(assert (=> b!1424679 (=> (not res!960155) (not e!805118))))

(declare-datatypes ((List!33482 0))(
  ( (Nil!33479) (Cons!33478 (h!34780 (_ BitVec 64)) (t!48168 List!33482)) )
))
(declare-fun arrayNoDuplicates!0 (array!97152 (_ BitVec 32) List!33482) Bool)

(assert (=> b!1424679 (= res!960155 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33479))))

(declare-fun b!1424680 () Bool)

(declare-fun res!960156 () Bool)

(assert (=> b!1424680 (=> (not res!960156) (not e!805114))))

(assert (=> b!1424680 (= res!960156 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46894 a!2831) j!81) a!2831 mask!2608) lt!627500))))

(declare-fun b!1424681 () Bool)

(declare-fun res!960162 () Bool)

(assert (=> b!1424681 (=> (not res!960162) (not e!805114))))

(declare-fun lt!627499 () SeekEntryResult!11206)

(assert (=> b!1424681 (= res!960162 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627501 lt!627502 mask!2608) lt!627499))))

(declare-fun b!1424682 () Bool)

(declare-fun res!960164 () Bool)

(assert (=> b!1424682 (=> res!960164 e!805115)))

(assert (=> b!1424682 (= res!960164 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627498 (select (arr!46894 a!2831) j!81) a!2831 mask!2608) lt!627500)))))

(declare-fun b!1424683 () Bool)

(assert (=> b!1424683 (= e!805112 e!805115)))

(declare-fun res!960160 () Bool)

(assert (=> b!1424683 (=> res!960160 e!805115)))

(assert (=> b!1424683 (= res!960160 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627498 #b00000000000000000000000000000000) (bvsge lt!627498 (size!47446 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424683 (= lt!627498 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424684 () Bool)

(assert (=> b!1424684 (= e!805113 e!805114)))

(declare-fun res!960154 () Bool)

(assert (=> b!1424684 (=> (not res!960154) (not e!805114))))

(assert (=> b!1424684 (= res!960154 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627501 mask!2608) lt!627501 lt!627502 mask!2608) lt!627499))))

(assert (=> b!1424684 (= lt!627499 (Intermediate!11206 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424684 (= lt!627501 (select (store (arr!46894 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424684 (= lt!627502 (array!97153 (store (arr!46894 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47446 a!2831)))))

(declare-fun b!1424685 () Bool)

(declare-fun res!960168 () Bool)

(assert (=> b!1424685 (=> (not res!960168) (not e!805118))))

(assert (=> b!1424685 (= res!960168 (validKeyInArray!0 (select (arr!46894 a!2831) j!81)))))

(assert (= (and start!122834 res!960167) b!1424677))

(assert (= (and b!1424677 res!960159) b!1424678))

(assert (= (and b!1424678 res!960163) b!1424685))

(assert (= (and b!1424685 res!960168) b!1424676))

(assert (= (and b!1424676 res!960157) b!1424679))

(assert (= (and b!1424679 res!960155) b!1424675))

(assert (= (and b!1424675 res!960161) b!1424672))

(assert (= (and b!1424672 res!960166) b!1424684))

(assert (= (and b!1424684 res!960154) b!1424680))

(assert (= (and b!1424680 res!960156) b!1424681))

(assert (= (and b!1424681 res!960162) b!1424671))

(assert (= (and b!1424671 res!960158) b!1424670))

(assert (= (and b!1424670 res!960169) b!1424674))

(assert (= (and b!1424670 (not res!960165)) b!1424683))

(assert (= (and b!1424683 (not res!960160)) b!1424682))

(assert (= (and b!1424682 (not res!960164)) b!1424673))

(declare-fun m!1314747 () Bool)

(assert (=> b!1424679 m!1314747))

(declare-fun m!1314749 () Bool)

(assert (=> b!1424673 m!1314749))

(declare-fun m!1314751 () Bool)

(assert (=> b!1424681 m!1314751))

(declare-fun m!1314753 () Bool)

(assert (=> start!122834 m!1314753))

(declare-fun m!1314755 () Bool)

(assert (=> start!122834 m!1314755))

(declare-fun m!1314757 () Bool)

(assert (=> b!1424678 m!1314757))

(assert (=> b!1424678 m!1314757))

(declare-fun m!1314759 () Bool)

(assert (=> b!1424678 m!1314759))

(declare-fun m!1314761 () Bool)

(assert (=> b!1424682 m!1314761))

(assert (=> b!1424682 m!1314761))

(declare-fun m!1314763 () Bool)

(assert (=> b!1424682 m!1314763))

(declare-fun m!1314765 () Bool)

(assert (=> b!1424676 m!1314765))

(declare-fun m!1314767 () Bool)

(assert (=> b!1424670 m!1314767))

(declare-fun m!1314769 () Bool)

(assert (=> b!1424670 m!1314769))

(declare-fun m!1314771 () Bool)

(assert (=> b!1424670 m!1314771))

(declare-fun m!1314773 () Bool)

(assert (=> b!1424670 m!1314773))

(assert (=> b!1424670 m!1314761))

(declare-fun m!1314775 () Bool)

(assert (=> b!1424670 m!1314775))

(assert (=> b!1424680 m!1314761))

(assert (=> b!1424680 m!1314761))

(declare-fun m!1314777 () Bool)

(assert (=> b!1424680 m!1314777))

(assert (=> b!1424685 m!1314761))

(assert (=> b!1424685 m!1314761))

(declare-fun m!1314779 () Bool)

(assert (=> b!1424685 m!1314779))

(assert (=> b!1424672 m!1314761))

(assert (=> b!1424672 m!1314761))

(declare-fun m!1314781 () Bool)

(assert (=> b!1424672 m!1314781))

(assert (=> b!1424672 m!1314781))

(assert (=> b!1424672 m!1314761))

(declare-fun m!1314783 () Bool)

(assert (=> b!1424672 m!1314783))

(declare-fun m!1314785 () Bool)

(assert (=> b!1424683 m!1314785))

(assert (=> b!1424674 m!1314761))

(assert (=> b!1424674 m!1314761))

(declare-fun m!1314787 () Bool)

(assert (=> b!1424674 m!1314787))

(declare-fun m!1314789 () Bool)

(assert (=> b!1424684 m!1314789))

(assert (=> b!1424684 m!1314789))

(declare-fun m!1314791 () Bool)

(assert (=> b!1424684 m!1314791))

(assert (=> b!1424684 m!1314767))

(declare-fun m!1314793 () Bool)

(assert (=> b!1424684 m!1314793))

(check-sat (not start!122834) (not b!1424676) (not b!1424674) (not b!1424684) (not b!1424672) (not b!1424679) (not b!1424685) (not b!1424681) (not b!1424682) (not b!1424670) (not b!1424683) (not b!1424680) (not b!1424678) (not b!1424673))
(check-sat)
