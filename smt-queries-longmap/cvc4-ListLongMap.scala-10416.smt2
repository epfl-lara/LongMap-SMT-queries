; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122662 () Bool)

(assert start!122662)

(declare-fun b!1420893 () Bool)

(declare-fun e!803542 () Bool)

(assert (=> b!1420893 (= e!803542 false)))

(declare-fun lt!626041 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11116 0))(
  ( (MissingZero!11116 (index!46856 (_ BitVec 32))) (Found!11116 (index!46857 (_ BitVec 32))) (Intermediate!11116 (undefined!11928 Bool) (index!46858 (_ BitVec 32)) (x!128510 (_ BitVec 32))) (Undefined!11116) (MissingVacant!11116 (index!46859 (_ BitVec 32))) )
))
(declare-fun lt!626043 () SeekEntryResult!11116)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97027 0))(
  ( (array!97028 (arr!46831 (Array (_ BitVec 32) (_ BitVec 64))) (size!47381 (_ BitVec 32))) )
))
(declare-fun lt!626042 () array!97027)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97027 (_ BitVec 32)) SeekEntryResult!11116)

(assert (=> b!1420893 (= lt!626043 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626041 lt!626042 mask!2608))))

(declare-fun b!1420894 () Bool)

(declare-fun res!956328 () Bool)

(declare-fun e!803540 () Bool)

(assert (=> b!1420894 (=> (not res!956328) (not e!803540))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97027)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420894 (= res!956328 (and (= (size!47381 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47381 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47381 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420895 () Bool)

(declare-fun res!956326 () Bool)

(assert (=> b!1420895 (=> (not res!956326) (not e!803540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97027 (_ BitVec 32)) Bool)

(assert (=> b!1420895 (= res!956326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420896 () Bool)

(declare-fun res!956333 () Bool)

(assert (=> b!1420896 (=> (not res!956333) (not e!803540))))

(declare-datatypes ((List!33341 0))(
  ( (Nil!33338) (Cons!33337 (h!34639 (_ BitVec 64)) (t!48035 List!33341)) )
))
(declare-fun arrayNoDuplicates!0 (array!97027 (_ BitVec 32) List!33341) Bool)

(assert (=> b!1420896 (= res!956333 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33338))))

(declare-fun b!1420897 () Bool)

(declare-fun res!956331 () Bool)

(assert (=> b!1420897 (=> (not res!956331) (not e!803540))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420897 (= res!956331 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47381 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47381 a!2831))))))

(declare-fun b!1420898 () Bool)

(declare-fun res!956327 () Bool)

(assert (=> b!1420898 (=> (not res!956327) (not e!803540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420898 (= res!956327 (validKeyInArray!0 (select (arr!46831 a!2831) j!81)))))

(declare-fun res!956335 () Bool)

(assert (=> start!122662 (=> (not res!956335) (not e!803540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122662 (= res!956335 (validMask!0 mask!2608))))

(assert (=> start!122662 e!803540))

(assert (=> start!122662 true))

(declare-fun array_inv!35859 (array!97027) Bool)

(assert (=> start!122662 (array_inv!35859 a!2831)))

(declare-fun b!1420899 () Bool)

(declare-fun e!803543 () Bool)

(assert (=> b!1420899 (= e!803540 e!803543)))

(declare-fun res!956332 () Bool)

(assert (=> b!1420899 (=> (not res!956332) (not e!803543))))

(declare-fun lt!626040 () SeekEntryResult!11116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420899 (= res!956332 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46831 a!2831) j!81) mask!2608) (select (arr!46831 a!2831) j!81) a!2831 mask!2608) lt!626040))))

(assert (=> b!1420899 (= lt!626040 (Intermediate!11116 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420900 () Bool)

(assert (=> b!1420900 (= e!803543 e!803542)))

(declare-fun res!956329 () Bool)

(assert (=> b!1420900 (=> (not res!956329) (not e!803542))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1420900 (= res!956329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626041 mask!2608) lt!626041 lt!626042 mask!2608) (Intermediate!11116 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420900 (= lt!626041 (select (store (arr!46831 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420900 (= lt!626042 (array!97028 (store (arr!46831 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47381 a!2831)))))

(declare-fun b!1420901 () Bool)

(declare-fun res!956330 () Bool)

(assert (=> b!1420901 (=> (not res!956330) (not e!803542))))

(assert (=> b!1420901 (= res!956330 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46831 a!2831) j!81) a!2831 mask!2608) lt!626040))))

(declare-fun b!1420902 () Bool)

(declare-fun res!956334 () Bool)

(assert (=> b!1420902 (=> (not res!956334) (not e!803540))))

(assert (=> b!1420902 (= res!956334 (validKeyInArray!0 (select (arr!46831 a!2831) i!982)))))

(assert (= (and start!122662 res!956335) b!1420894))

(assert (= (and b!1420894 res!956328) b!1420902))

(assert (= (and b!1420902 res!956334) b!1420898))

(assert (= (and b!1420898 res!956327) b!1420895))

(assert (= (and b!1420895 res!956326) b!1420896))

(assert (= (and b!1420896 res!956333) b!1420897))

(assert (= (and b!1420897 res!956331) b!1420899))

(assert (= (and b!1420899 res!956332) b!1420900))

(assert (= (and b!1420900 res!956329) b!1420901))

(assert (= (and b!1420901 res!956330) b!1420893))

(declare-fun m!1311427 () Bool)

(assert (=> b!1420901 m!1311427))

(assert (=> b!1420901 m!1311427))

(declare-fun m!1311429 () Bool)

(assert (=> b!1420901 m!1311429))

(assert (=> b!1420899 m!1311427))

(assert (=> b!1420899 m!1311427))

(declare-fun m!1311431 () Bool)

(assert (=> b!1420899 m!1311431))

(assert (=> b!1420899 m!1311431))

(assert (=> b!1420899 m!1311427))

(declare-fun m!1311433 () Bool)

(assert (=> b!1420899 m!1311433))

(declare-fun m!1311435 () Bool)

(assert (=> b!1420902 m!1311435))

(assert (=> b!1420902 m!1311435))

(declare-fun m!1311437 () Bool)

(assert (=> b!1420902 m!1311437))

(declare-fun m!1311439 () Bool)

(assert (=> b!1420900 m!1311439))

(assert (=> b!1420900 m!1311439))

(declare-fun m!1311441 () Bool)

(assert (=> b!1420900 m!1311441))

(declare-fun m!1311443 () Bool)

(assert (=> b!1420900 m!1311443))

(declare-fun m!1311445 () Bool)

(assert (=> b!1420900 m!1311445))

(declare-fun m!1311447 () Bool)

(assert (=> start!122662 m!1311447))

(declare-fun m!1311449 () Bool)

(assert (=> start!122662 m!1311449))

(declare-fun m!1311451 () Bool)

(assert (=> b!1420895 m!1311451))

(assert (=> b!1420898 m!1311427))

(assert (=> b!1420898 m!1311427))

(declare-fun m!1311453 () Bool)

(assert (=> b!1420898 m!1311453))

(declare-fun m!1311455 () Bool)

(assert (=> b!1420896 m!1311455))

(declare-fun m!1311457 () Bool)

(assert (=> b!1420893 m!1311457))

(push 1)

(assert (not b!1420900))

(assert (not b!1420902))

(assert (not b!1420895))

(assert (not b!1420896))

(assert (not b!1420893))

