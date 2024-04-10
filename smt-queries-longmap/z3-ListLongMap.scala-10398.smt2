; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122510 () Bool)

(assert start!122510)

(declare-fun res!954764 () Bool)

(declare-fun e!803015 () Bool)

(assert (=> start!122510 (=> (not res!954764) (not e!803015))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122510 (= res!954764 (validMask!0 mask!2608))))

(assert (=> start!122510 e!803015))

(assert (=> start!122510 true))

(declare-datatypes ((array!96914 0))(
  ( (array!96915 (arr!46776 (Array (_ BitVec 32) (_ BitVec 64))) (size!47326 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96914)

(declare-fun array_inv!35804 (array!96914) Bool)

(assert (=> start!122510 (array_inv!35804 a!2831)))

(declare-fun b!1419242 () Bool)

(declare-fun res!954766 () Bool)

(assert (=> b!1419242 (=> (not res!954766) (not e!803015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96914 (_ BitVec 32)) Bool)

(assert (=> b!1419242 (= res!954766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419243 () Bool)

(declare-fun res!954763 () Bool)

(assert (=> b!1419243 (=> (not res!954763) (not e!803015))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419243 (= res!954763 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47326 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47326 a!2831))))))

(declare-fun b!1419244 () Bool)

(declare-fun res!954768 () Bool)

(assert (=> b!1419244 (=> (not res!954768) (not e!803015))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11061 0))(
  ( (MissingZero!11061 (index!46636 (_ BitVec 32))) (Found!11061 (index!46637 (_ BitVec 32))) (Intermediate!11061 (undefined!11873 Bool) (index!46638 (_ BitVec 32)) (x!128305 (_ BitVec 32))) (Undefined!11061) (MissingVacant!11061 (index!46639 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96914 (_ BitVec 32)) SeekEntryResult!11061)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419244 (= res!954768 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46776 a!2831) j!81) mask!2608) (select (arr!46776 a!2831) j!81) a!2831 mask!2608) (Intermediate!11061 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419245 () Bool)

(assert (=> b!1419245 (= e!803015 false)))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun lt!625746 () (_ BitVec 32))

(assert (=> b!1419245 (= lt!625746 (toIndex!0 (select (store (arr!46776 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419246 () Bool)

(declare-fun res!954769 () Bool)

(assert (=> b!1419246 (=> (not res!954769) (not e!803015))))

(assert (=> b!1419246 (= res!954769 (and (= (size!47326 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47326 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47326 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419247 () Bool)

(declare-fun res!954767 () Bool)

(assert (=> b!1419247 (=> (not res!954767) (not e!803015))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419247 (= res!954767 (validKeyInArray!0 (select (arr!46776 a!2831) i!982)))))

(declare-fun b!1419248 () Bool)

(declare-fun res!954765 () Bool)

(assert (=> b!1419248 (=> (not res!954765) (not e!803015))))

(assert (=> b!1419248 (= res!954765 (validKeyInArray!0 (select (arr!46776 a!2831) j!81)))))

(declare-fun b!1419249 () Bool)

(declare-fun res!954762 () Bool)

(assert (=> b!1419249 (=> (not res!954762) (not e!803015))))

(declare-datatypes ((List!33286 0))(
  ( (Nil!33283) (Cons!33282 (h!34581 (_ BitVec 64)) (t!47980 List!33286)) )
))
(declare-fun arrayNoDuplicates!0 (array!96914 (_ BitVec 32) List!33286) Bool)

(assert (=> b!1419249 (= res!954762 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33283))))

(assert (= (and start!122510 res!954764) b!1419246))

(assert (= (and b!1419246 res!954769) b!1419247))

(assert (= (and b!1419247 res!954767) b!1419248))

(assert (= (and b!1419248 res!954765) b!1419242))

(assert (= (and b!1419242 res!954766) b!1419249))

(assert (= (and b!1419249 res!954762) b!1419243))

(assert (= (and b!1419243 res!954763) b!1419244))

(assert (= (and b!1419244 res!954768) b!1419245))

(declare-fun m!1309757 () Bool)

(assert (=> b!1419247 m!1309757))

(assert (=> b!1419247 m!1309757))

(declare-fun m!1309759 () Bool)

(assert (=> b!1419247 m!1309759))

(declare-fun m!1309761 () Bool)

(assert (=> b!1419245 m!1309761))

(declare-fun m!1309763 () Bool)

(assert (=> b!1419245 m!1309763))

(assert (=> b!1419245 m!1309763))

(declare-fun m!1309765 () Bool)

(assert (=> b!1419245 m!1309765))

(declare-fun m!1309767 () Bool)

(assert (=> b!1419244 m!1309767))

(assert (=> b!1419244 m!1309767))

(declare-fun m!1309769 () Bool)

(assert (=> b!1419244 m!1309769))

(assert (=> b!1419244 m!1309769))

(assert (=> b!1419244 m!1309767))

(declare-fun m!1309771 () Bool)

(assert (=> b!1419244 m!1309771))

(declare-fun m!1309773 () Bool)

(assert (=> b!1419242 m!1309773))

(assert (=> b!1419248 m!1309767))

(assert (=> b!1419248 m!1309767))

(declare-fun m!1309775 () Bool)

(assert (=> b!1419248 m!1309775))

(declare-fun m!1309777 () Bool)

(assert (=> b!1419249 m!1309777))

(declare-fun m!1309779 () Bool)

(assert (=> start!122510 m!1309779))

(declare-fun m!1309781 () Bool)

(assert (=> start!122510 m!1309781))

(check-sat (not b!1419247) (not b!1419248) (not b!1419244) (not b!1419242) (not b!1419245) (not b!1419249) (not start!122510))
