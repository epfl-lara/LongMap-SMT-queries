; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122682 () Bool)

(assert start!122682)

(declare-fun b!1421215 () Bool)

(declare-fun res!956657 () Bool)

(declare-fun e!803660 () Bool)

(assert (=> b!1421215 (=> (not res!956657) (not e!803660))))

(declare-datatypes ((array!97047 0))(
  ( (array!97048 (arr!46841 (Array (_ BitVec 32) (_ BitVec 64))) (size!47391 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97047)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421215 (= res!956657 (validKeyInArray!0 (select (arr!46841 a!2831) j!81)))))

(declare-fun b!1421216 () Bool)

(declare-fun res!956649 () Bool)

(declare-fun e!803663 () Bool)

(assert (=> b!1421216 (=> (not res!956649) (not e!803663))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11126 0))(
  ( (MissingZero!11126 (index!46896 (_ BitVec 32))) (Found!11126 (index!46897 (_ BitVec 32))) (Intermediate!11126 (undefined!11938 Bool) (index!46898 (_ BitVec 32)) (x!128552 (_ BitVec 32))) (Undefined!11126) (MissingVacant!11126 (index!46899 (_ BitVec 32))) )
))
(declare-fun lt!626175 () SeekEntryResult!11126)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97047 (_ BitVec 32)) SeekEntryResult!11126)

(assert (=> b!1421216 (= res!956649 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46841 a!2831) j!81) a!2831 mask!2608) lt!626175))))

(declare-fun b!1421217 () Bool)

(declare-fun res!956654 () Bool)

(assert (=> b!1421217 (=> (not res!956654) (not e!803660))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421217 (= res!956654 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47391 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47391 a!2831))))))

(declare-fun res!956648 () Bool)

(assert (=> start!122682 (=> (not res!956648) (not e!803660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122682 (= res!956648 (validMask!0 mask!2608))))

(assert (=> start!122682 e!803660))

(assert (=> start!122682 true))

(declare-fun array_inv!35869 (array!97047) Bool)

(assert (=> start!122682 (array_inv!35869 a!2831)))

(declare-fun b!1421218 () Bool)

(declare-fun res!956651 () Bool)

(assert (=> b!1421218 (=> (not res!956651) (not e!803660))))

(declare-datatypes ((List!33351 0))(
  ( (Nil!33348) (Cons!33347 (h!34649 (_ BitVec 64)) (t!48045 List!33351)) )
))
(declare-fun arrayNoDuplicates!0 (array!97047 (_ BitVec 32) List!33351) Bool)

(assert (=> b!1421218 (= res!956651 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33348))))

(declare-fun b!1421219 () Bool)

(declare-fun res!956655 () Bool)

(assert (=> b!1421219 (=> (not res!956655) (not e!803663))))

(declare-fun lt!626173 () (_ BitVec 64))

(declare-fun lt!626172 () array!97047)

(declare-fun lt!626171 () SeekEntryResult!11126)

(assert (=> b!1421219 (= res!956655 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626173 lt!626172 mask!2608) lt!626171))))

(declare-fun b!1421220 () Bool)

(declare-fun res!956653 () Bool)

(assert (=> b!1421220 (=> (not res!956653) (not e!803660))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421220 (= res!956653 (validKeyInArray!0 (select (arr!46841 a!2831) i!982)))))

(declare-fun b!1421221 () Bool)

(declare-fun res!956656 () Bool)

(assert (=> b!1421221 (=> (not res!956656) (not e!803663))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421221 (= res!956656 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421222 () Bool)

(declare-fun e!803662 () Bool)

(assert (=> b!1421222 (= e!803660 e!803662)))

(declare-fun res!956652 () Bool)

(assert (=> b!1421222 (=> (not res!956652) (not e!803662))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421222 (= res!956652 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46841 a!2831) j!81) mask!2608) (select (arr!46841 a!2831) j!81) a!2831 mask!2608) lt!626175))))

(assert (=> b!1421222 (= lt!626175 (Intermediate!11126 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421223 () Bool)

(assert (=> b!1421223 (= e!803663 (not (bvsge mask!2608 #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97047 (_ BitVec 32)) Bool)

(assert (=> b!1421223 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48088 0))(
  ( (Unit!48089) )
))
(declare-fun lt!626174 () Unit!48088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97047 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48088)

(assert (=> b!1421223 (= lt!626174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421224 () Bool)

(assert (=> b!1421224 (= e!803662 e!803663)))

(declare-fun res!956659 () Bool)

(assert (=> b!1421224 (=> (not res!956659) (not e!803663))))

(assert (=> b!1421224 (= res!956659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626173 mask!2608) lt!626173 lt!626172 mask!2608) lt!626171))))

(assert (=> b!1421224 (= lt!626171 (Intermediate!11126 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421224 (= lt!626173 (select (store (arr!46841 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421224 (= lt!626172 (array!97048 (store (arr!46841 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47391 a!2831)))))

(declare-fun b!1421225 () Bool)

(declare-fun res!956658 () Bool)

(assert (=> b!1421225 (=> (not res!956658) (not e!803660))))

(assert (=> b!1421225 (= res!956658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421226 () Bool)

(declare-fun res!956650 () Bool)

(assert (=> b!1421226 (=> (not res!956650) (not e!803660))))

(assert (=> b!1421226 (= res!956650 (and (= (size!47391 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47391 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47391 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122682 res!956648) b!1421226))

(assert (= (and b!1421226 res!956650) b!1421220))

(assert (= (and b!1421220 res!956653) b!1421215))

(assert (= (and b!1421215 res!956657) b!1421225))

(assert (= (and b!1421225 res!956658) b!1421218))

(assert (= (and b!1421218 res!956651) b!1421217))

(assert (= (and b!1421217 res!956654) b!1421222))

(assert (= (and b!1421222 res!956652) b!1421224))

(assert (= (and b!1421224 res!956659) b!1421216))

(assert (= (and b!1421216 res!956649) b!1421219))

(assert (= (and b!1421219 res!956655) b!1421221))

(assert (= (and b!1421221 res!956656) b!1421223))

(declare-fun m!1311759 () Bool)

(assert (=> b!1421218 m!1311759))

(declare-fun m!1311761 () Bool)

(assert (=> b!1421216 m!1311761))

(assert (=> b!1421216 m!1311761))

(declare-fun m!1311763 () Bool)

(assert (=> b!1421216 m!1311763))

(declare-fun m!1311765 () Bool)

(assert (=> b!1421224 m!1311765))

(assert (=> b!1421224 m!1311765))

(declare-fun m!1311767 () Bool)

(assert (=> b!1421224 m!1311767))

(declare-fun m!1311769 () Bool)

(assert (=> b!1421224 m!1311769))

(declare-fun m!1311771 () Bool)

(assert (=> b!1421224 m!1311771))

(declare-fun m!1311773 () Bool)

(assert (=> start!122682 m!1311773))

(declare-fun m!1311775 () Bool)

(assert (=> start!122682 m!1311775))

(assert (=> b!1421215 m!1311761))

(assert (=> b!1421215 m!1311761))

(declare-fun m!1311777 () Bool)

(assert (=> b!1421215 m!1311777))

(declare-fun m!1311779 () Bool)

(assert (=> b!1421223 m!1311779))

(declare-fun m!1311781 () Bool)

(assert (=> b!1421223 m!1311781))

(declare-fun m!1311783 () Bool)

(assert (=> b!1421219 m!1311783))

(assert (=> b!1421222 m!1311761))

(assert (=> b!1421222 m!1311761))

(declare-fun m!1311785 () Bool)

(assert (=> b!1421222 m!1311785))

(assert (=> b!1421222 m!1311785))

(assert (=> b!1421222 m!1311761))

(declare-fun m!1311787 () Bool)

(assert (=> b!1421222 m!1311787))

(declare-fun m!1311789 () Bool)

(assert (=> b!1421220 m!1311789))

(assert (=> b!1421220 m!1311789))

(declare-fun m!1311791 () Bool)

(assert (=> b!1421220 m!1311791))

(declare-fun m!1311793 () Bool)

(assert (=> b!1421225 m!1311793))

(push 1)

