; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122672 () Bool)

(assert start!122672)

(declare-fun b!1421043 () Bool)

(declare-fun e!803600 () Bool)

(assert (=> b!1421043 (= e!803600 false)))

(declare-datatypes ((SeekEntryResult!11121 0))(
  ( (MissingZero!11121 (index!46876 (_ BitVec 32))) (Found!11121 (index!46877 (_ BitVec 32))) (Intermediate!11121 (undefined!11933 Bool) (index!46878 (_ BitVec 32)) (x!128531 (_ BitVec 32))) (Undefined!11121) (MissingVacant!11121 (index!46879 (_ BitVec 32))) )
))
(declare-fun lt!626103 () SeekEntryResult!11121)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!626100 () (_ BitVec 64))

(declare-datatypes ((array!97037 0))(
  ( (array!97038 (arr!46836 (Array (_ BitVec 32) (_ BitVec 64))) (size!47386 (_ BitVec 32))) )
))
(declare-fun lt!626101 () array!97037)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97037 (_ BitVec 32)) SeekEntryResult!11121)

(assert (=> b!1421043 (= lt!626103 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626100 lt!626101 mask!2608))))

(declare-fun b!1421044 () Bool)

(declare-fun e!803603 () Bool)

(assert (=> b!1421044 (= e!803603 e!803600)))

(declare-fun res!956481 () Bool)

(assert (=> b!1421044 (=> (not res!956481) (not e!803600))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421044 (= res!956481 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626100 mask!2608) lt!626100 lt!626101 mask!2608) (Intermediate!11121 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97037)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421044 (= lt!626100 (select (store (arr!46836 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421044 (= lt!626101 (array!97038 (store (arr!46836 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47386 a!2831)))))

(declare-fun b!1421045 () Bool)

(declare-fun res!956479 () Bool)

(declare-fun e!803602 () Bool)

(assert (=> b!1421045 (=> (not res!956479) (not e!803602))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421045 (= res!956479 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47386 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47386 a!2831))))))

(declare-fun res!956482 () Bool)

(assert (=> start!122672 (=> (not res!956482) (not e!803602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122672 (= res!956482 (validMask!0 mask!2608))))

(assert (=> start!122672 e!803602))

(assert (=> start!122672 true))

(declare-fun array_inv!35864 (array!97037) Bool)

(assert (=> start!122672 (array_inv!35864 a!2831)))

(declare-fun b!1421046 () Bool)

(declare-fun res!956480 () Bool)

(assert (=> b!1421046 (=> (not res!956480) (not e!803602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421046 (= res!956480 (validKeyInArray!0 (select (arr!46836 a!2831) i!982)))))

(declare-fun b!1421047 () Bool)

(declare-fun res!956478 () Bool)

(assert (=> b!1421047 (=> (not res!956478) (not e!803602))))

(declare-datatypes ((List!33346 0))(
  ( (Nil!33343) (Cons!33342 (h!34644 (_ BitVec 64)) (t!48040 List!33346)) )
))
(declare-fun arrayNoDuplicates!0 (array!97037 (_ BitVec 32) List!33346) Bool)

(assert (=> b!1421047 (= res!956478 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33343))))

(declare-fun b!1421048 () Bool)

(declare-fun res!956483 () Bool)

(assert (=> b!1421048 (=> (not res!956483) (not e!803600))))

(declare-fun lt!626102 () SeekEntryResult!11121)

(assert (=> b!1421048 (= res!956483 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46836 a!2831) j!81) a!2831 mask!2608) lt!626102))))

(declare-fun b!1421049 () Bool)

(assert (=> b!1421049 (= e!803602 e!803603)))

(declare-fun res!956477 () Bool)

(assert (=> b!1421049 (=> (not res!956477) (not e!803603))))

(assert (=> b!1421049 (= res!956477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46836 a!2831) j!81) mask!2608) (select (arr!46836 a!2831) j!81) a!2831 mask!2608) lt!626102))))

(assert (=> b!1421049 (= lt!626102 (Intermediate!11121 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421050 () Bool)

(declare-fun res!956476 () Bool)

(assert (=> b!1421050 (=> (not res!956476) (not e!803602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97037 (_ BitVec 32)) Bool)

(assert (=> b!1421050 (= res!956476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421051 () Bool)

(declare-fun res!956485 () Bool)

(assert (=> b!1421051 (=> (not res!956485) (not e!803602))))

(assert (=> b!1421051 (= res!956485 (and (= (size!47386 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47386 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47386 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421052 () Bool)

(declare-fun res!956484 () Bool)

(assert (=> b!1421052 (=> (not res!956484) (not e!803602))))

(assert (=> b!1421052 (= res!956484 (validKeyInArray!0 (select (arr!46836 a!2831) j!81)))))

(assert (= (and start!122672 res!956482) b!1421051))

(assert (= (and b!1421051 res!956485) b!1421046))

(assert (= (and b!1421046 res!956480) b!1421052))

(assert (= (and b!1421052 res!956484) b!1421050))

(assert (= (and b!1421050 res!956476) b!1421047))

(assert (= (and b!1421047 res!956478) b!1421045))

(assert (= (and b!1421045 res!956479) b!1421049))

(assert (= (and b!1421049 res!956477) b!1421044))

(assert (= (and b!1421044 res!956481) b!1421048))

(assert (= (and b!1421048 res!956483) b!1421043))

(declare-fun m!1311587 () Bool)

(assert (=> b!1421046 m!1311587))

(assert (=> b!1421046 m!1311587))

(declare-fun m!1311589 () Bool)

(assert (=> b!1421046 m!1311589))

(declare-fun m!1311591 () Bool)

(assert (=> b!1421050 m!1311591))

(declare-fun m!1311593 () Bool)

(assert (=> start!122672 m!1311593))

(declare-fun m!1311595 () Bool)

(assert (=> start!122672 m!1311595))

(declare-fun m!1311597 () Bool)

(assert (=> b!1421043 m!1311597))

(declare-fun m!1311599 () Bool)

(assert (=> b!1421044 m!1311599))

(assert (=> b!1421044 m!1311599))

(declare-fun m!1311601 () Bool)

(assert (=> b!1421044 m!1311601))

(declare-fun m!1311603 () Bool)

(assert (=> b!1421044 m!1311603))

(declare-fun m!1311605 () Bool)

(assert (=> b!1421044 m!1311605))

(declare-fun m!1311607 () Bool)

(assert (=> b!1421052 m!1311607))

(assert (=> b!1421052 m!1311607))

(declare-fun m!1311609 () Bool)

(assert (=> b!1421052 m!1311609))

(assert (=> b!1421049 m!1311607))

(assert (=> b!1421049 m!1311607))

(declare-fun m!1311611 () Bool)

(assert (=> b!1421049 m!1311611))

(assert (=> b!1421049 m!1311611))

(assert (=> b!1421049 m!1311607))

(declare-fun m!1311613 () Bool)

(assert (=> b!1421049 m!1311613))

(assert (=> b!1421048 m!1311607))

(assert (=> b!1421048 m!1311607))

(declare-fun m!1311615 () Bool)

(assert (=> b!1421048 m!1311615))

(declare-fun m!1311617 () Bool)

(assert (=> b!1421047 m!1311617))

(check-sat (not b!1421044) (not b!1421046) (not b!1421050) (not b!1421048) (not start!122672) (not b!1421052) (not b!1421043) (not b!1421047) (not b!1421049))
(check-sat)
