; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122732 () Bool)

(assert start!122732)

(declare-fun b!1422207 () Bool)

(declare-fun res!957655 () Bool)

(declare-fun e!804040 () Bool)

(assert (=> b!1422207 (=> res!957655 e!804040)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97097 0))(
  ( (array!97098 (arr!46866 (Array (_ BitVec 32) (_ BitVec 64))) (size!47416 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97097)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!626574 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11151 0))(
  ( (MissingZero!11151 (index!46996 (_ BitVec 32))) (Found!11151 (index!46997 (_ BitVec 32))) (Intermediate!11151 (undefined!11963 Bool) (index!46998 (_ BitVec 32)) (x!128641 (_ BitVec 32))) (Undefined!11151) (MissingVacant!11151 (index!46999 (_ BitVec 32))) )
))
(declare-fun lt!626577 () SeekEntryResult!11151)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97097 (_ BitVec 32)) SeekEntryResult!11151)

(assert (=> b!1422207 (= res!957655 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626574 (select (arr!46866 a!2831) j!81) a!2831 mask!2608) lt!626577)))))

(declare-fun res!957651 () Bool)

(declare-fun e!804044 () Bool)

(assert (=> start!122732 (=> (not res!957651) (not e!804044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122732 (= res!957651 (validMask!0 mask!2608))))

(assert (=> start!122732 e!804044))

(assert (=> start!122732 true))

(declare-fun array_inv!35894 (array!97097) Bool)

(assert (=> start!122732 (array_inv!35894 a!2831)))

(declare-fun b!1422208 () Bool)

(declare-fun res!957649 () Bool)

(assert (=> b!1422208 (=> (not res!957649) (not e!804044))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422208 (= res!957649 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47416 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47416 a!2831))))))

(declare-fun b!1422209 () Bool)

(assert (=> b!1422209 (= e!804040 true)))

(declare-fun lt!626578 () SeekEntryResult!11151)

(declare-fun lt!626580 () (_ BitVec 64))

(declare-fun lt!626576 () array!97097)

(assert (=> b!1422209 (= lt!626578 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626574 lt!626580 lt!626576 mask!2608))))

(declare-fun b!1422210 () Bool)

(declare-fun res!957653 () Bool)

(assert (=> b!1422210 (=> (not res!957653) (not e!804044))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422210 (= res!957653 (and (= (size!47416 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47416 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47416 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422211 () Bool)

(declare-fun e!804038 () Bool)

(declare-fun e!804042 () Bool)

(assert (=> b!1422211 (= e!804038 (not e!804042))))

(declare-fun res!957647 () Bool)

(assert (=> b!1422211 (=> res!957647 e!804042)))

(assert (=> b!1422211 (= res!957647 (or (= (select (arr!46866 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46866 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46866 a!2831) index!585) (select (arr!46866 a!2831) j!81)) (= (select (store (arr!46866 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804041 () Bool)

(assert (=> b!1422211 e!804041))

(declare-fun res!957648 () Bool)

(assert (=> b!1422211 (=> (not res!957648) (not e!804041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97097 (_ BitVec 32)) Bool)

(assert (=> b!1422211 (= res!957648 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48138 0))(
  ( (Unit!48139) )
))
(declare-fun lt!626575 () Unit!48138)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48138)

(assert (=> b!1422211 (= lt!626575 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422212 () Bool)

(declare-fun e!804043 () Bool)

(assert (=> b!1422212 (= e!804044 e!804043)))

(declare-fun res!957652 () Bool)

(assert (=> b!1422212 (=> (not res!957652) (not e!804043))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422212 (= res!957652 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46866 a!2831) j!81) mask!2608) (select (arr!46866 a!2831) j!81) a!2831 mask!2608) lt!626577))))

(assert (=> b!1422212 (= lt!626577 (Intermediate!11151 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422213 () Bool)

(declare-fun res!957642 () Bool)

(assert (=> b!1422213 (=> (not res!957642) (not e!804038))))

(assert (=> b!1422213 (= res!957642 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46866 a!2831) j!81) a!2831 mask!2608) lt!626577))))

(declare-fun b!1422214 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97097 (_ BitVec 32)) SeekEntryResult!11151)

(assert (=> b!1422214 (= e!804041 (= (seekEntryOrOpen!0 (select (arr!46866 a!2831) j!81) a!2831 mask!2608) (Found!11151 j!81)))))

(declare-fun b!1422215 () Bool)

(declare-fun res!957646 () Bool)

(assert (=> b!1422215 (=> (not res!957646) (not e!804044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422215 (= res!957646 (validKeyInArray!0 (select (arr!46866 a!2831) i!982)))))

(declare-fun b!1422216 () Bool)

(assert (=> b!1422216 (= e!804043 e!804038)))

(declare-fun res!957654 () Bool)

(assert (=> b!1422216 (=> (not res!957654) (not e!804038))))

(declare-fun lt!626579 () SeekEntryResult!11151)

(assert (=> b!1422216 (= res!957654 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626580 mask!2608) lt!626580 lt!626576 mask!2608) lt!626579))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422216 (= lt!626579 (Intermediate!11151 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422216 (= lt!626580 (select (store (arr!46866 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422216 (= lt!626576 (array!97098 (store (arr!46866 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47416 a!2831)))))

(declare-fun b!1422217 () Bool)

(declare-fun res!957645 () Bool)

(assert (=> b!1422217 (=> (not res!957645) (not e!804044))))

(assert (=> b!1422217 (= res!957645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422218 () Bool)

(assert (=> b!1422218 (= e!804042 e!804040)))

(declare-fun res!957641 () Bool)

(assert (=> b!1422218 (=> res!957641 e!804040)))

(assert (=> b!1422218 (= res!957641 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626574 #b00000000000000000000000000000000) (bvsge lt!626574 (size!47416 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422218 (= lt!626574 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422219 () Bool)

(declare-fun res!957650 () Bool)

(assert (=> b!1422219 (=> (not res!957650) (not e!804038))))

(assert (=> b!1422219 (= res!957650 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626580 lt!626576 mask!2608) lt!626579))))

(declare-fun b!1422220 () Bool)

(declare-fun res!957640 () Bool)

(assert (=> b!1422220 (=> (not res!957640) (not e!804038))))

(assert (=> b!1422220 (= res!957640 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422221 () Bool)

(declare-fun res!957644 () Bool)

(assert (=> b!1422221 (=> (not res!957644) (not e!804044))))

(assert (=> b!1422221 (= res!957644 (validKeyInArray!0 (select (arr!46866 a!2831) j!81)))))

(declare-fun b!1422222 () Bool)

(declare-fun res!957643 () Bool)

(assert (=> b!1422222 (=> (not res!957643) (not e!804044))))

(declare-datatypes ((List!33376 0))(
  ( (Nil!33373) (Cons!33372 (h!34674 (_ BitVec 64)) (t!48070 List!33376)) )
))
(declare-fun arrayNoDuplicates!0 (array!97097 (_ BitVec 32) List!33376) Bool)

(assert (=> b!1422222 (= res!957643 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33373))))

(assert (= (and start!122732 res!957651) b!1422210))

(assert (= (and b!1422210 res!957653) b!1422215))

(assert (= (and b!1422215 res!957646) b!1422221))

(assert (= (and b!1422221 res!957644) b!1422217))

(assert (= (and b!1422217 res!957645) b!1422222))

(assert (= (and b!1422222 res!957643) b!1422208))

(assert (= (and b!1422208 res!957649) b!1422212))

(assert (= (and b!1422212 res!957652) b!1422216))

(assert (= (and b!1422216 res!957654) b!1422213))

(assert (= (and b!1422213 res!957642) b!1422219))

(assert (= (and b!1422219 res!957650) b!1422220))

(assert (= (and b!1422220 res!957640) b!1422211))

(assert (= (and b!1422211 res!957648) b!1422214))

(assert (= (and b!1422211 (not res!957647)) b!1422218))

(assert (= (and b!1422218 (not res!957641)) b!1422207))

(assert (= (and b!1422207 (not res!957655)) b!1422209))

(declare-fun m!1312755 () Bool)

(assert (=> start!122732 m!1312755))

(declare-fun m!1312757 () Bool)

(assert (=> start!122732 m!1312757))

(declare-fun m!1312759 () Bool)

(assert (=> b!1422217 m!1312759))

(declare-fun m!1312761 () Bool)

(assert (=> b!1422219 m!1312761))

(declare-fun m!1312763 () Bool)

(assert (=> b!1422221 m!1312763))

(assert (=> b!1422221 m!1312763))

(declare-fun m!1312765 () Bool)

(assert (=> b!1422221 m!1312765))

(declare-fun m!1312767 () Bool)

(assert (=> b!1422209 m!1312767))

(declare-fun m!1312769 () Bool)

(assert (=> b!1422211 m!1312769))

(declare-fun m!1312771 () Bool)

(assert (=> b!1422211 m!1312771))

(declare-fun m!1312773 () Bool)

(assert (=> b!1422211 m!1312773))

(declare-fun m!1312775 () Bool)

(assert (=> b!1422211 m!1312775))

(assert (=> b!1422211 m!1312763))

(declare-fun m!1312777 () Bool)

(assert (=> b!1422211 m!1312777))

(declare-fun m!1312779 () Bool)

(assert (=> b!1422216 m!1312779))

(assert (=> b!1422216 m!1312779))

(declare-fun m!1312781 () Bool)

(assert (=> b!1422216 m!1312781))

(assert (=> b!1422216 m!1312769))

(declare-fun m!1312783 () Bool)

(assert (=> b!1422216 m!1312783))

(assert (=> b!1422212 m!1312763))

(assert (=> b!1422212 m!1312763))

(declare-fun m!1312785 () Bool)

(assert (=> b!1422212 m!1312785))

(assert (=> b!1422212 m!1312785))

(assert (=> b!1422212 m!1312763))

(declare-fun m!1312787 () Bool)

(assert (=> b!1422212 m!1312787))

(assert (=> b!1422214 m!1312763))

(assert (=> b!1422214 m!1312763))

(declare-fun m!1312789 () Bool)

(assert (=> b!1422214 m!1312789))

(declare-fun m!1312791 () Bool)

(assert (=> b!1422222 m!1312791))

(assert (=> b!1422213 m!1312763))

(assert (=> b!1422213 m!1312763))

(declare-fun m!1312793 () Bool)

(assert (=> b!1422213 m!1312793))

(declare-fun m!1312795 () Bool)

(assert (=> b!1422218 m!1312795))

(declare-fun m!1312797 () Bool)

(assert (=> b!1422215 m!1312797))

(assert (=> b!1422215 m!1312797))

(declare-fun m!1312799 () Bool)

(assert (=> b!1422215 m!1312799))

(assert (=> b!1422207 m!1312763))

(assert (=> b!1422207 m!1312763))

(declare-fun m!1312801 () Bool)

(assert (=> b!1422207 m!1312801))

(check-sat (not b!1422221) (not b!1422207) (not b!1422215) (not b!1422216) (not b!1422219) (not b!1422214) (not b!1422213) (not b!1422211) (not start!122732) (not b!1422209) (not b!1422218) (not b!1422222) (not b!1422217) (not b!1422212))
(check-sat)
