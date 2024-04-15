; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122438 () Bool)

(assert start!122438)

(declare-fun b!1418687 () Bool)

(declare-fun res!954345 () Bool)

(declare-fun e!802789 () Bool)

(assert (=> b!1418687 (=> (not res!954345) (not e!802789))))

(declare-datatypes ((array!96834 0))(
  ( (array!96835 (arr!46738 (Array (_ BitVec 32) (_ BitVec 64))) (size!47290 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96834)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418687 (= res!954345 (validKeyInArray!0 (select (arr!46738 a!2831) i!982)))))

(declare-fun b!1418688 () Bool)

(declare-fun res!954350 () Bool)

(assert (=> b!1418688 (=> (not res!954350) (not e!802789))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96834 (_ BitVec 32)) Bool)

(assert (=> b!1418688 (= res!954350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418689 () Bool)

(declare-fun res!954352 () Bool)

(assert (=> b!1418689 (=> (not res!954352) (not e!802789))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418689 (= res!954352 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47290 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47290 a!2831))))))

(declare-fun res!954351 () Bool)

(assert (=> start!122438 (=> (not res!954351) (not e!802789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122438 (= res!954351 (validMask!0 mask!2608))))

(assert (=> start!122438 e!802789))

(assert (=> start!122438 true))

(declare-fun array_inv!35971 (array!96834) Bool)

(assert (=> start!122438 (array_inv!35971 a!2831)))

(declare-fun b!1418690 () Bool)

(declare-fun res!954347 () Bool)

(assert (=> b!1418690 (=> (not res!954347) (not e!802789))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11050 0))(
  ( (MissingZero!11050 (index!46592 (_ BitVec 32))) (Found!11050 (index!46593 (_ BitVec 32))) (Intermediate!11050 (undefined!11862 Bool) (index!46594 (_ BitVec 32)) (x!128253 (_ BitVec 32))) (Undefined!11050) (MissingVacant!11050 (index!46595 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96834 (_ BitVec 32)) SeekEntryResult!11050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418690 (= res!954347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46738 a!2831) j!81) mask!2608) (select (arr!46738 a!2831) j!81) a!2831 mask!2608) (Intermediate!11050 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1418691 () Bool)

(declare-fun res!954349 () Bool)

(assert (=> b!1418691 (=> (not res!954349) (not e!802789))))

(assert (=> b!1418691 (= res!954349 (validKeyInArray!0 (select (arr!46738 a!2831) j!81)))))

(declare-fun b!1418692 () Bool)

(declare-fun res!954348 () Bool)

(assert (=> b!1418692 (=> (not res!954348) (not e!802789))))

(declare-datatypes ((List!33326 0))(
  ( (Nil!33323) (Cons!33322 (h!34618 (_ BitVec 64)) (t!48012 List!33326)) )
))
(declare-fun arrayNoDuplicates!0 (array!96834 (_ BitVec 32) List!33326) Bool)

(assert (=> b!1418692 (= res!954348 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33323))))

(declare-fun b!1418693 () Bool)

(declare-fun res!954346 () Bool)

(assert (=> b!1418693 (=> (not res!954346) (not e!802789))))

(assert (=> b!1418693 (= res!954346 (and (= (size!47290 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47290 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47290 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418694 () Bool)

(assert (=> b!1418694 (= e!802789 (bvslt mask!2608 #b00000000000000000000000000000000))))

(assert (= (and start!122438 res!954351) b!1418693))

(assert (= (and b!1418693 res!954346) b!1418687))

(assert (= (and b!1418687 res!954345) b!1418691))

(assert (= (and b!1418691 res!954349) b!1418688))

(assert (= (and b!1418688 res!954350) b!1418692))

(assert (= (and b!1418692 res!954348) b!1418689))

(assert (= (and b!1418689 res!954352) b!1418690))

(assert (= (and b!1418690 res!954347) b!1418694))

(declare-fun m!1308839 () Bool)

(assert (=> b!1418691 m!1308839))

(assert (=> b!1418691 m!1308839))

(declare-fun m!1308841 () Bool)

(assert (=> b!1418691 m!1308841))

(declare-fun m!1308843 () Bool)

(assert (=> b!1418688 m!1308843))

(assert (=> b!1418690 m!1308839))

(assert (=> b!1418690 m!1308839))

(declare-fun m!1308845 () Bool)

(assert (=> b!1418690 m!1308845))

(assert (=> b!1418690 m!1308845))

(assert (=> b!1418690 m!1308839))

(declare-fun m!1308847 () Bool)

(assert (=> b!1418690 m!1308847))

(declare-fun m!1308849 () Bool)

(assert (=> b!1418687 m!1308849))

(assert (=> b!1418687 m!1308849))

(declare-fun m!1308851 () Bool)

(assert (=> b!1418687 m!1308851))

(declare-fun m!1308853 () Bool)

(assert (=> start!122438 m!1308853))

(declare-fun m!1308855 () Bool)

(assert (=> start!122438 m!1308855))

(declare-fun m!1308857 () Bool)

(assert (=> b!1418692 m!1308857))

(check-sat (not start!122438) (not b!1418687) (not b!1418688) (not b!1418691) (not b!1418692) (not b!1418690))
(check-sat)
