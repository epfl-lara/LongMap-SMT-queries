; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122612 () Bool)

(assert start!122612)

(declare-fun b!1420131 () Bool)

(declare-fun e!803286 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1420131 (= e!803286 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun b!1420132 () Bool)

(declare-fun res!955616 () Bool)

(declare-fun e!803288 () Bool)

(assert (=> b!1420132 (=> (not res!955616) (not e!803288))))

(declare-datatypes ((array!96930 0))(
  ( (array!96931 (arr!46783 (Array (_ BitVec 32) (_ BitVec 64))) (size!47335 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96930)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96930 (_ BitVec 32)) Bool)

(assert (=> b!1420132 (= res!955616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420133 () Bool)

(declare-fun res!955617 () Bool)

(assert (=> b!1420133 (=> (not res!955617) (not e!803288))))

(declare-datatypes ((List!33371 0))(
  ( (Nil!33368) (Cons!33367 (h!34669 (_ BitVec 64)) (t!48057 List!33371)) )
))
(declare-fun arrayNoDuplicates!0 (array!96930 (_ BitVec 32) List!33371) Bool)

(assert (=> b!1420133 (= res!955617 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33368))))

(declare-fun b!1420134 () Bool)

(assert (=> b!1420134 (= e!803288 e!803286)))

(declare-fun res!955622 () Bool)

(assert (=> b!1420134 (=> (not res!955622) (not e!803286))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11095 0))(
  ( (MissingZero!11095 (index!46772 (_ BitVec 32))) (Found!11095 (index!46773 (_ BitVec 32))) (Intermediate!11095 (undefined!11907 Bool) (index!46774 (_ BitVec 32)) (x!128430 (_ BitVec 32))) (Undefined!11095) (MissingVacant!11095 (index!46775 (_ BitVec 32))) )
))
(declare-fun lt!625703 () SeekEntryResult!11095)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96930 (_ BitVec 32)) SeekEntryResult!11095)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420134 (= res!955622 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46783 a!2831) j!81) mask!2608) (select (arr!46783 a!2831) j!81) a!2831 mask!2608) lt!625703))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420134 (= lt!625703 (Intermediate!11095 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420135 () Bool)

(declare-fun res!955621 () Bool)

(assert (=> b!1420135 (=> (not res!955621) (not e!803288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420135 (= res!955621 (validKeyInArray!0 (select (arr!46783 a!2831) j!81)))))

(declare-fun b!1420136 () Bool)

(declare-fun res!955619 () Bool)

(assert (=> b!1420136 (=> (not res!955619) (not e!803288))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420136 (= res!955619 (and (= (size!47335 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47335 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47335 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420137 () Bool)

(declare-fun res!955615 () Bool)

(assert (=> b!1420137 (=> (not res!955615) (not e!803286))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420137 (= res!955615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46783 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46783 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96931 (store (arr!46783 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47335 a!2831)) mask!2608) (Intermediate!11095 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun res!955624 () Bool)

(assert (=> start!122612 (=> (not res!955624) (not e!803288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122612 (= res!955624 (validMask!0 mask!2608))))

(assert (=> start!122612 e!803288))

(assert (=> start!122612 true))

(declare-fun array_inv!36016 (array!96930) Bool)

(assert (=> start!122612 (array_inv!36016 a!2831)))

(declare-fun b!1420138 () Bool)

(declare-fun res!955623 () Bool)

(assert (=> b!1420138 (=> (not res!955623) (not e!803288))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420138 (= res!955623 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47335 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47335 a!2831))))))

(declare-fun b!1420139 () Bool)

(declare-fun res!955620 () Bool)

(assert (=> b!1420139 (=> (not res!955620) (not e!803286))))

(assert (=> b!1420139 (= res!955620 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46783 a!2831) j!81) a!2831 mask!2608) lt!625703))))

(declare-fun b!1420140 () Bool)

(declare-fun res!955618 () Bool)

(assert (=> b!1420140 (=> (not res!955618) (not e!803288))))

(assert (=> b!1420140 (= res!955618 (validKeyInArray!0 (select (arr!46783 a!2831) i!982)))))

(assert (= (and start!122612 res!955624) b!1420136))

(assert (= (and b!1420136 res!955619) b!1420140))

(assert (= (and b!1420140 res!955618) b!1420135))

(assert (= (and b!1420135 res!955621) b!1420132))

(assert (= (and b!1420132 res!955616) b!1420133))

(assert (= (and b!1420133 res!955617) b!1420138))

(assert (= (and b!1420138 res!955623) b!1420134))

(assert (= (and b!1420134 res!955622) b!1420137))

(assert (= (and b!1420137 res!955615) b!1420139))

(assert (= (and b!1420139 res!955620) b!1420131))

(declare-fun m!1310163 () Bool)

(assert (=> b!1420140 m!1310163))

(assert (=> b!1420140 m!1310163))

(declare-fun m!1310165 () Bool)

(assert (=> b!1420140 m!1310165))

(declare-fun m!1310167 () Bool)

(assert (=> b!1420139 m!1310167))

(assert (=> b!1420139 m!1310167))

(declare-fun m!1310169 () Bool)

(assert (=> b!1420139 m!1310169))

(declare-fun m!1310171 () Bool)

(assert (=> start!122612 m!1310171))

(declare-fun m!1310173 () Bool)

(assert (=> start!122612 m!1310173))

(declare-fun m!1310175 () Bool)

(assert (=> b!1420133 m!1310175))

(assert (=> b!1420135 m!1310167))

(assert (=> b!1420135 m!1310167))

(declare-fun m!1310177 () Bool)

(assert (=> b!1420135 m!1310177))

(assert (=> b!1420134 m!1310167))

(assert (=> b!1420134 m!1310167))

(declare-fun m!1310179 () Bool)

(assert (=> b!1420134 m!1310179))

(assert (=> b!1420134 m!1310179))

(assert (=> b!1420134 m!1310167))

(declare-fun m!1310181 () Bool)

(assert (=> b!1420134 m!1310181))

(declare-fun m!1310183 () Bool)

(assert (=> b!1420137 m!1310183))

(declare-fun m!1310185 () Bool)

(assert (=> b!1420137 m!1310185))

(assert (=> b!1420137 m!1310185))

(declare-fun m!1310187 () Bool)

(assert (=> b!1420137 m!1310187))

(assert (=> b!1420137 m!1310187))

(assert (=> b!1420137 m!1310185))

(declare-fun m!1310189 () Bool)

(assert (=> b!1420137 m!1310189))

(declare-fun m!1310191 () Bool)

(assert (=> b!1420132 m!1310191))

(check-sat (not b!1420135) (not b!1420134) (not start!122612) (not b!1420133) (not b!1420132) (not b!1420137) (not b!1420139) (not b!1420140))
(check-sat)
