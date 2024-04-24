; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122768 () Bool)

(assert start!122768)

(declare-fun b!1420891 () Bool)

(declare-fun res!955644 () Bool)

(declare-fun e!803954 () Bool)

(assert (=> b!1420891 (=> (not res!955644) (not e!803954))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-datatypes ((array!97055 0))(
  ( (array!97056 (arr!46843 (Array (_ BitVec 32) (_ BitVec 64))) (size!47394 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97055)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11030 0))(
  ( (MissingZero!11030 (index!46512 (_ BitVec 32))) (Found!11030 (index!46513 (_ BitVec 32))) (Intermediate!11030 (undefined!11842 Bool) (index!46514 (_ BitVec 32)) (x!128339 (_ BitVec 32))) (Undefined!11030) (MissingVacant!11030 (index!46515 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97055 (_ BitVec 32)) SeekEntryResult!11030)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420891 (= res!955644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46843 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46843 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97056 (store (arr!46843 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47394 a!2831)) mask!2608) (Intermediate!11030 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420892 () Bool)

(declare-fun res!955641 () Bool)

(assert (=> b!1420892 (=> (not res!955641) (not e!803954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420892 (= res!955641 (validKeyInArray!0 (select (arr!46843 a!2831) i!982)))))

(declare-fun b!1420893 () Bool)

(declare-fun res!955642 () Bool)

(assert (=> b!1420893 (=> (not res!955642) (not e!803954))))

(assert (=> b!1420893 (= res!955642 (validKeyInArray!0 (select (arr!46843 a!2831) j!81)))))

(declare-fun b!1420894 () Bool)

(declare-fun res!955648 () Bool)

(assert (=> b!1420894 (=> (not res!955648) (not e!803954))))

(assert (=> b!1420894 (= res!955648 (and (= (size!47394 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47394 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47394 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420895 () Bool)

(declare-fun res!955645 () Bool)

(assert (=> b!1420895 (=> (not res!955645) (not e!803954))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420895 (= res!955645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46843 a!2831) j!81) mask!2608) (select (arr!46843 a!2831) j!81) a!2831 mask!2608) (Intermediate!11030 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!955646 () Bool)

(assert (=> start!122768 (=> (not res!955646) (not e!803954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122768 (= res!955646 (validMask!0 mask!2608))))

(assert (=> start!122768 e!803954))

(assert (=> start!122768 true))

(declare-fun array_inv!36124 (array!97055) Bool)

(assert (=> start!122768 (array_inv!36124 a!2831)))

(declare-fun b!1420896 () Bool)

(declare-fun res!955643 () Bool)

(assert (=> b!1420896 (=> (not res!955643) (not e!803954))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420896 (= res!955643 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47394 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47394 a!2831))))))

(declare-fun b!1420897 () Bool)

(declare-fun res!955640 () Bool)

(assert (=> b!1420897 (=> (not res!955640) (not e!803954))))

(declare-datatypes ((List!33340 0))(
  ( (Nil!33337) (Cons!33336 (h!34646 (_ BitVec 64)) (t!48026 List!33340)) )
))
(declare-fun arrayNoDuplicates!0 (array!97055 (_ BitVec 32) List!33340) Bool)

(assert (=> b!1420897 (= res!955640 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33337))))

(declare-fun b!1420898 () Bool)

(assert (=> b!1420898 (= e!803954 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun b!1420899 () Bool)

(declare-fun res!955647 () Bool)

(assert (=> b!1420899 (=> (not res!955647) (not e!803954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97055 (_ BitVec 32)) Bool)

(assert (=> b!1420899 (= res!955647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122768 res!955646) b!1420894))

(assert (= (and b!1420894 res!955648) b!1420892))

(assert (= (and b!1420892 res!955641) b!1420893))

(assert (= (and b!1420893 res!955642) b!1420899))

(assert (= (and b!1420899 res!955647) b!1420897))

(assert (= (and b!1420897 res!955640) b!1420896))

(assert (= (and b!1420896 res!955643) b!1420895))

(assert (= (and b!1420895 res!955645) b!1420891))

(assert (= (and b!1420891 res!955644) b!1420898))

(declare-fun m!1311573 () Bool)

(assert (=> b!1420899 m!1311573))

(declare-fun m!1311575 () Bool)

(assert (=> b!1420891 m!1311575))

(declare-fun m!1311577 () Bool)

(assert (=> b!1420891 m!1311577))

(assert (=> b!1420891 m!1311577))

(declare-fun m!1311579 () Bool)

(assert (=> b!1420891 m!1311579))

(assert (=> b!1420891 m!1311579))

(assert (=> b!1420891 m!1311577))

(declare-fun m!1311581 () Bool)

(assert (=> b!1420891 m!1311581))

(declare-fun m!1311583 () Bool)

(assert (=> b!1420893 m!1311583))

(assert (=> b!1420893 m!1311583))

(declare-fun m!1311585 () Bool)

(assert (=> b!1420893 m!1311585))

(assert (=> b!1420895 m!1311583))

(assert (=> b!1420895 m!1311583))

(declare-fun m!1311587 () Bool)

(assert (=> b!1420895 m!1311587))

(assert (=> b!1420895 m!1311587))

(assert (=> b!1420895 m!1311583))

(declare-fun m!1311589 () Bool)

(assert (=> b!1420895 m!1311589))

(declare-fun m!1311591 () Bool)

(assert (=> b!1420892 m!1311591))

(assert (=> b!1420892 m!1311591))

(declare-fun m!1311593 () Bool)

(assert (=> b!1420892 m!1311593))

(declare-fun m!1311595 () Bool)

(assert (=> b!1420897 m!1311595))

(declare-fun m!1311597 () Bool)

(assert (=> start!122768 m!1311597))

(declare-fun m!1311599 () Bool)

(assert (=> start!122768 m!1311599))

(check-sat (not b!1420895) (not b!1420899) (not b!1420891) (not b!1420897) (not start!122768) (not b!1420893) (not b!1420892))
(check-sat)
