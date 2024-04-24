; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122778 () Bool)

(assert start!122778)

(declare-fun b!1421018 () Bool)

(declare-fun res!955772 () Bool)

(declare-fun e!803984 () Bool)

(assert (=> b!1421018 (=> (not res!955772) (not e!803984))))

(declare-datatypes ((array!97065 0))(
  ( (array!97066 (arr!46848 (Array (_ BitVec 32) (_ BitVec 64))) (size!47399 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97065)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421018 (= res!955772 (validKeyInArray!0 (select (arr!46848 a!2831) i!982)))))

(declare-fun b!1421019 () Bool)

(declare-fun res!955771 () Bool)

(assert (=> b!1421019 (=> (not res!955771) (not e!803984))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421019 (= res!955771 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47399 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47399 a!2831))))))

(declare-fun b!1421020 () Bool)

(declare-fun res!955768 () Bool)

(assert (=> b!1421020 (=> (not res!955768) (not e!803984))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1421020 (= res!955768 (validKeyInArray!0 (select (arr!46848 a!2831) j!81)))))

(declare-fun b!1421021 () Bool)

(declare-fun res!955767 () Bool)

(assert (=> b!1421021 (=> (not res!955767) (not e!803984))))

(declare-datatypes ((List!33345 0))(
  ( (Nil!33342) (Cons!33341 (h!34651 (_ BitVec 64)) (t!48031 List!33345)) )
))
(declare-fun arrayNoDuplicates!0 (array!97065 (_ BitVec 32) List!33345) Bool)

(assert (=> b!1421021 (= res!955767 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33342))))

(declare-fun b!1421022 () Bool)

(declare-fun res!955773 () Bool)

(assert (=> b!1421022 (=> (not res!955773) (not e!803984))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11035 0))(
  ( (MissingZero!11035 (index!46532 (_ BitVec 32))) (Found!11035 (index!46533 (_ BitVec 32))) (Intermediate!11035 (undefined!11847 Bool) (index!46534 (_ BitVec 32)) (x!128352 (_ BitVec 32))) (Undefined!11035) (MissingVacant!11035 (index!46535 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97065 (_ BitVec 32)) SeekEntryResult!11035)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421022 (= res!955773 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46848 a!2831) j!81) mask!2608) (select (arr!46848 a!2831) j!81) a!2831 mask!2608) (Intermediate!11035 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1421023 () Bool)

(declare-fun res!955770 () Bool)

(assert (=> b!1421023 (=> (not res!955770) (not e!803984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97065 (_ BitVec 32)) Bool)

(assert (=> b!1421023 (= res!955770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421024 () Bool)

(assert (=> b!1421024 (= e!803984 false)))

(declare-fun lt!626261 () SeekEntryResult!11035)

(assert (=> b!1421024 (= lt!626261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46848 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46848 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97066 (store (arr!46848 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47399 a!2831)) mask!2608))))

(declare-fun res!955769 () Bool)

(assert (=> start!122778 (=> (not res!955769) (not e!803984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122778 (= res!955769 (validMask!0 mask!2608))))

(assert (=> start!122778 e!803984))

(assert (=> start!122778 true))

(declare-fun array_inv!36129 (array!97065) Bool)

(assert (=> start!122778 (array_inv!36129 a!2831)))

(declare-fun b!1421025 () Bool)

(declare-fun res!955774 () Bool)

(assert (=> b!1421025 (=> (not res!955774) (not e!803984))))

(assert (=> b!1421025 (= res!955774 (and (= (size!47399 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47399 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47399 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122778 res!955769) b!1421025))

(assert (= (and b!1421025 res!955774) b!1421018))

(assert (= (and b!1421018 res!955772) b!1421020))

(assert (= (and b!1421020 res!955768) b!1421023))

(assert (= (and b!1421023 res!955770) b!1421021))

(assert (= (and b!1421021 res!955767) b!1421019))

(assert (= (and b!1421019 res!955771) b!1421022))

(assert (= (and b!1421022 res!955773) b!1421024))

(declare-fun m!1311713 () Bool)

(assert (=> b!1421022 m!1311713))

(assert (=> b!1421022 m!1311713))

(declare-fun m!1311715 () Bool)

(assert (=> b!1421022 m!1311715))

(assert (=> b!1421022 m!1311715))

(assert (=> b!1421022 m!1311713))

(declare-fun m!1311717 () Bool)

(assert (=> b!1421022 m!1311717))

(assert (=> b!1421020 m!1311713))

(assert (=> b!1421020 m!1311713))

(declare-fun m!1311719 () Bool)

(assert (=> b!1421020 m!1311719))

(declare-fun m!1311721 () Bool)

(assert (=> start!122778 m!1311721))

(declare-fun m!1311723 () Bool)

(assert (=> start!122778 m!1311723))

(declare-fun m!1311725 () Bool)

(assert (=> b!1421018 m!1311725))

(assert (=> b!1421018 m!1311725))

(declare-fun m!1311727 () Bool)

(assert (=> b!1421018 m!1311727))

(declare-fun m!1311729 () Bool)

(assert (=> b!1421024 m!1311729))

(declare-fun m!1311731 () Bool)

(assert (=> b!1421024 m!1311731))

(assert (=> b!1421024 m!1311731))

(declare-fun m!1311733 () Bool)

(assert (=> b!1421024 m!1311733))

(assert (=> b!1421024 m!1311733))

(assert (=> b!1421024 m!1311731))

(declare-fun m!1311735 () Bool)

(assert (=> b!1421024 m!1311735))

(declare-fun m!1311737 () Bool)

(assert (=> b!1421023 m!1311737))

(declare-fun m!1311739 () Bool)

(assert (=> b!1421021 m!1311739))

(push 1)

(assert (not b!1421020))

(assert (not b!1421022))

(assert (not b!1421023))

(assert (not b!1421024))

(assert (not b!1421021))

(assert (not b!1421018))

(assert (not start!122778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

