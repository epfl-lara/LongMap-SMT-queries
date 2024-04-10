; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122648 () Bool)

(assert start!122648)

(declare-fun b!1420683 () Bool)

(declare-fun res!956125 () Bool)

(declare-fun e!803456 () Bool)

(assert (=> b!1420683 (=> (not res!956125) (not e!803456))))

(declare-datatypes ((array!97013 0))(
  ( (array!97014 (arr!46824 (Array (_ BitVec 32) (_ BitVec 64))) (size!47374 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97013)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97013 (_ BitVec 32)) Bool)

(assert (=> b!1420683 (= res!956125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420684 () Bool)

(declare-fun res!956116 () Bool)

(declare-fun e!803457 () Bool)

(assert (=> b!1420684 (=> (not res!956116) (not e!803457))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11109 0))(
  ( (MissingZero!11109 (index!46828 (_ BitVec 32))) (Found!11109 (index!46829 (_ BitVec 32))) (Intermediate!11109 (undefined!11921 Bool) (index!46830 (_ BitVec 32)) (x!128487 (_ BitVec 32))) (Undefined!11109) (MissingVacant!11109 (index!46831 (_ BitVec 32))) )
))
(declare-fun lt!625959 () SeekEntryResult!11109)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97013 (_ BitVec 32)) SeekEntryResult!11109)

(assert (=> b!1420684 (= res!956116 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46824 a!2831) j!81) a!2831 mask!2608) lt!625959))))

(declare-fun res!956122 () Bool)

(assert (=> start!122648 (=> (not res!956122) (not e!803456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122648 (= res!956122 (validMask!0 mask!2608))))

(assert (=> start!122648 e!803456))

(assert (=> start!122648 true))

(declare-fun array_inv!35852 (array!97013) Bool)

(assert (=> start!122648 (array_inv!35852 a!2831)))

(declare-fun b!1420685 () Bool)

(declare-fun res!956120 () Bool)

(assert (=> b!1420685 (=> (not res!956120) (not e!803456))))

(declare-datatypes ((List!33334 0))(
  ( (Nil!33331) (Cons!33330 (h!34632 (_ BitVec 64)) (t!48028 List!33334)) )
))
(declare-fun arrayNoDuplicates!0 (array!97013 (_ BitVec 32) List!33334) Bool)

(assert (=> b!1420685 (= res!956120 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33331))))

(declare-fun b!1420686 () Bool)

(declare-fun res!956124 () Bool)

(assert (=> b!1420686 (=> (not res!956124) (not e!803456))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420686 (= res!956124 (and (= (size!47374 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47374 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47374 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420687 () Bool)

(declare-fun e!803459 () Bool)

(assert (=> b!1420687 (= e!803459 e!803457)))

(declare-fun res!956123 () Bool)

(assert (=> b!1420687 (=> (not res!956123) (not e!803457))))

(declare-fun lt!625957 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!625958 () array!97013)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420687 (= res!956123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625957 mask!2608) lt!625957 lt!625958 mask!2608) (Intermediate!11109 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420687 (= lt!625957 (select (store (arr!46824 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420687 (= lt!625958 (array!97014 (store (arr!46824 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47374 a!2831)))))

(declare-fun b!1420688 () Bool)

(assert (=> b!1420688 (= e!803457 false)))

(declare-fun lt!625956 () SeekEntryResult!11109)

(assert (=> b!1420688 (= lt!625956 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625957 lt!625958 mask!2608))))

(declare-fun b!1420689 () Bool)

(assert (=> b!1420689 (= e!803456 e!803459)))

(declare-fun res!956121 () Bool)

(assert (=> b!1420689 (=> (not res!956121) (not e!803459))))

(assert (=> b!1420689 (= res!956121 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46824 a!2831) j!81) mask!2608) (select (arr!46824 a!2831) j!81) a!2831 mask!2608) lt!625959))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420689 (= lt!625959 (Intermediate!11109 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420690 () Bool)

(declare-fun res!956117 () Bool)

(assert (=> b!1420690 (=> (not res!956117) (not e!803456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420690 (= res!956117 (validKeyInArray!0 (select (arr!46824 a!2831) i!982)))))

(declare-fun b!1420691 () Bool)

(declare-fun res!956119 () Bool)

(assert (=> b!1420691 (=> (not res!956119) (not e!803456))))

(assert (=> b!1420691 (= res!956119 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47374 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47374 a!2831))))))

(declare-fun b!1420692 () Bool)

(declare-fun res!956118 () Bool)

(assert (=> b!1420692 (=> (not res!956118) (not e!803456))))

(assert (=> b!1420692 (= res!956118 (validKeyInArray!0 (select (arr!46824 a!2831) j!81)))))

(assert (= (and start!122648 res!956122) b!1420686))

(assert (= (and b!1420686 res!956124) b!1420690))

(assert (= (and b!1420690 res!956117) b!1420692))

(assert (= (and b!1420692 res!956118) b!1420683))

(assert (= (and b!1420683 res!956125) b!1420685))

(assert (= (and b!1420685 res!956120) b!1420691))

(assert (= (and b!1420691 res!956119) b!1420689))

(assert (= (and b!1420689 res!956121) b!1420687))

(assert (= (and b!1420687 res!956123) b!1420684))

(assert (= (and b!1420684 res!956116) b!1420688))

(declare-fun m!1311203 () Bool)

(assert (=> b!1420689 m!1311203))

(assert (=> b!1420689 m!1311203))

(declare-fun m!1311205 () Bool)

(assert (=> b!1420689 m!1311205))

(assert (=> b!1420689 m!1311205))

(assert (=> b!1420689 m!1311203))

(declare-fun m!1311207 () Bool)

(assert (=> b!1420689 m!1311207))

(assert (=> b!1420684 m!1311203))

(assert (=> b!1420684 m!1311203))

(declare-fun m!1311209 () Bool)

(assert (=> b!1420684 m!1311209))

(declare-fun m!1311211 () Bool)

(assert (=> b!1420687 m!1311211))

(assert (=> b!1420687 m!1311211))

(declare-fun m!1311213 () Bool)

(assert (=> b!1420687 m!1311213))

(declare-fun m!1311215 () Bool)

(assert (=> b!1420687 m!1311215))

(declare-fun m!1311217 () Bool)

(assert (=> b!1420687 m!1311217))

(declare-fun m!1311219 () Bool)

(assert (=> b!1420683 m!1311219))

(declare-fun m!1311221 () Bool)

(assert (=> b!1420685 m!1311221))

(declare-fun m!1311223 () Bool)

(assert (=> b!1420690 m!1311223))

(assert (=> b!1420690 m!1311223))

(declare-fun m!1311225 () Bool)

(assert (=> b!1420690 m!1311225))

(assert (=> b!1420692 m!1311203))

(assert (=> b!1420692 m!1311203))

(declare-fun m!1311227 () Bool)

(assert (=> b!1420692 m!1311227))

(declare-fun m!1311229 () Bool)

(assert (=> b!1420688 m!1311229))

(declare-fun m!1311231 () Bool)

(assert (=> start!122648 m!1311231))

(declare-fun m!1311233 () Bool)

(assert (=> start!122648 m!1311233))

(check-sat (not b!1420692) (not b!1420687) (not b!1420685) (not b!1420683) (not b!1420688) (not start!122648) (not b!1420684) (not b!1420690) (not b!1420689))
(check-sat)
