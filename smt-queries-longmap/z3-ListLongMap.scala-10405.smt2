; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122780 () Bool)

(assert start!122780)

(declare-fun b!1421044 () Bool)

(declare-fun res!955796 () Bool)

(declare-fun e!803989 () Bool)

(assert (=> b!1421044 (=> (not res!955796) (not e!803989))))

(declare-datatypes ((array!97067 0))(
  ( (array!97068 (arr!46849 (Array (_ BitVec 32) (_ BitVec 64))) (size!47400 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97067)

(declare-datatypes ((List!33346 0))(
  ( (Nil!33343) (Cons!33342 (h!34652 (_ BitVec 64)) (t!48032 List!33346)) )
))
(declare-fun arrayNoDuplicates!0 (array!97067 (_ BitVec 32) List!33346) Bool)

(assert (=> b!1421044 (= res!955796 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33343))))

(declare-fun b!1421045 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421045 (= e!803989 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1421046 () Bool)

(declare-fun res!955798 () Bool)

(assert (=> b!1421046 (=> (not res!955798) (not e!803989))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421046 (= res!955798 (and (= (size!47400 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47400 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47400 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!955800 () Bool)

(assert (=> start!122780 (=> (not res!955800) (not e!803989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122780 (= res!955800 (validMask!0 mask!2608))))

(assert (=> start!122780 e!803989))

(assert (=> start!122780 true))

(declare-fun array_inv!36130 (array!97067) Bool)

(assert (=> start!122780 (array_inv!36130 a!2831)))

(declare-fun b!1421047 () Bool)

(declare-fun res!955794 () Bool)

(assert (=> b!1421047 (=> (not res!955794) (not e!803989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421047 (= res!955794 (validKeyInArray!0 (select (arr!46849 a!2831) j!81)))))

(declare-fun b!1421048 () Bool)

(declare-fun res!955797 () Bool)

(assert (=> b!1421048 (=> (not res!955797) (not e!803989))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11036 0))(
  ( (MissingZero!11036 (index!46536 (_ BitVec 32))) (Found!11036 (index!46537 (_ BitVec 32))) (Intermediate!11036 (undefined!11848 Bool) (index!46538 (_ BitVec 32)) (x!128361 (_ BitVec 32))) (Undefined!11036) (MissingVacant!11036 (index!46539 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97067 (_ BitVec 32)) SeekEntryResult!11036)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421048 (= res!955797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46849 a!2831) j!81) mask!2608) (select (arr!46849 a!2831) j!81) a!2831 mask!2608) (Intermediate!11036 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1421049 () Bool)

(declare-fun res!955795 () Bool)

(assert (=> b!1421049 (=> (not res!955795) (not e!803989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97067 (_ BitVec 32)) Bool)

(assert (=> b!1421049 (= res!955795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421050 () Bool)

(declare-fun res!955801 () Bool)

(assert (=> b!1421050 (=> (not res!955801) (not e!803989))))

(assert (=> b!1421050 (= res!955801 (validKeyInArray!0 (select (arr!46849 a!2831) i!982)))))

(declare-fun b!1421051 () Bool)

(declare-fun res!955793 () Bool)

(assert (=> b!1421051 (=> (not res!955793) (not e!803989))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1421051 (= res!955793 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47400 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47400 a!2831))))))

(declare-fun b!1421052 () Bool)

(declare-fun res!955799 () Bool)

(assert (=> b!1421052 (=> (not res!955799) (not e!803989))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1421052 (= res!955799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46849 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46849 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97068 (store (arr!46849 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47400 a!2831)) mask!2608) (Intermediate!11036 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (= (and start!122780 res!955800) b!1421046))

(assert (= (and b!1421046 res!955798) b!1421050))

(assert (= (and b!1421050 res!955801) b!1421047))

(assert (= (and b!1421047 res!955794) b!1421049))

(assert (= (and b!1421049 res!955795) b!1421044))

(assert (= (and b!1421044 res!955796) b!1421051))

(assert (= (and b!1421051 res!955793) b!1421048))

(assert (= (and b!1421048 res!955797) b!1421052))

(assert (= (and b!1421052 res!955799) b!1421045))

(declare-fun m!1311741 () Bool)

(assert (=> b!1421050 m!1311741))

(assert (=> b!1421050 m!1311741))

(declare-fun m!1311743 () Bool)

(assert (=> b!1421050 m!1311743))

(declare-fun m!1311745 () Bool)

(assert (=> b!1421049 m!1311745))

(declare-fun m!1311747 () Bool)

(assert (=> b!1421047 m!1311747))

(assert (=> b!1421047 m!1311747))

(declare-fun m!1311749 () Bool)

(assert (=> b!1421047 m!1311749))

(declare-fun m!1311751 () Bool)

(assert (=> b!1421052 m!1311751))

(declare-fun m!1311753 () Bool)

(assert (=> b!1421052 m!1311753))

(assert (=> b!1421052 m!1311753))

(declare-fun m!1311755 () Bool)

(assert (=> b!1421052 m!1311755))

(assert (=> b!1421052 m!1311755))

(assert (=> b!1421052 m!1311753))

(declare-fun m!1311757 () Bool)

(assert (=> b!1421052 m!1311757))

(declare-fun m!1311759 () Bool)

(assert (=> b!1421044 m!1311759))

(assert (=> b!1421048 m!1311747))

(assert (=> b!1421048 m!1311747))

(declare-fun m!1311761 () Bool)

(assert (=> b!1421048 m!1311761))

(assert (=> b!1421048 m!1311761))

(assert (=> b!1421048 m!1311747))

(declare-fun m!1311763 () Bool)

(assert (=> b!1421048 m!1311763))

(declare-fun m!1311765 () Bool)

(assert (=> start!122780 m!1311765))

(declare-fun m!1311767 () Bool)

(assert (=> start!122780 m!1311767))

(check-sat (not b!1421048) (not b!1421049) (not b!1421044) (not b!1421047) (not b!1421052) (not start!122780) (not b!1421050))
(check-sat)
