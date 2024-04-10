; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122632 () Bool)

(assert start!122632)

(declare-fun b!1420443 () Bool)

(declare-fun res!955885 () Bool)

(declare-fun e!803388 () Bool)

(assert (=> b!1420443 (=> (not res!955885) (not e!803388))))

(declare-datatypes ((array!96997 0))(
  ( (array!96998 (arr!46816 (Array (_ BitVec 32) (_ BitVec 64))) (size!47366 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96997)

(declare-datatypes ((List!33326 0))(
  ( (Nil!33323) (Cons!33322 (h!34624 (_ BitVec 64)) (t!48020 List!33326)) )
))
(declare-fun arrayNoDuplicates!0 (array!96997 (_ BitVec 32) List!33326) Bool)

(assert (=> b!1420443 (= res!955885 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33323))))

(declare-fun b!1420444 () Bool)

(declare-fun res!955878 () Bool)

(assert (=> b!1420444 (=> (not res!955878) (not e!803388))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420444 (= res!955878 (validKeyInArray!0 (select (arr!46816 a!2831) i!982)))))

(declare-fun b!1420445 () Bool)

(declare-fun res!955876 () Bool)

(assert (=> b!1420445 (=> (not res!955876) (not e!803388))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1420445 (= res!955876 (and (= (size!47366 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47366 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47366 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420446 () Bool)

(declare-fun res!955877 () Bool)

(declare-fun e!803389 () Bool)

(assert (=> b!1420446 (=> (not res!955877) (not e!803389))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11101 0))(
  ( (MissingZero!11101 (index!46796 (_ BitVec 32))) (Found!11101 (index!46797 (_ BitVec 32))) (Intermediate!11101 (undefined!11913 Bool) (index!46798 (_ BitVec 32)) (x!128455 (_ BitVec 32))) (Undefined!11101) (MissingVacant!11101 (index!46799 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96997 (_ BitVec 32)) SeekEntryResult!11101)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420446 (= res!955877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46816 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46816 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96998 (store (arr!46816 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47366 a!2831)) mask!2608) (Intermediate!11101 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420447 () Bool)

(declare-fun res!955881 () Bool)

(assert (=> b!1420447 (=> (not res!955881) (not e!803389))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!625917 () SeekEntryResult!11101)

(assert (=> b!1420447 (= res!955881 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46816 a!2831) j!81) a!2831 mask!2608) lt!625917))))

(declare-fun b!1420448 () Bool)

(assert (=> b!1420448 (= e!803389 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1420449 () Bool)

(declare-fun res!955882 () Bool)

(assert (=> b!1420449 (=> (not res!955882) (not e!803388))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420449 (= res!955882 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47366 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47366 a!2831))))))

(declare-fun b!1420450 () Bool)

(assert (=> b!1420450 (= e!803388 e!803389)))

(declare-fun res!955880 () Bool)

(assert (=> b!1420450 (=> (not res!955880) (not e!803389))))

(assert (=> b!1420450 (= res!955880 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46816 a!2831) j!81) mask!2608) (select (arr!46816 a!2831) j!81) a!2831 mask!2608) lt!625917))))

(assert (=> b!1420450 (= lt!625917 (Intermediate!11101 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420451 () Bool)

(declare-fun res!955883 () Bool)

(assert (=> b!1420451 (=> (not res!955883) (not e!803388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96997 (_ BitVec 32)) Bool)

(assert (=> b!1420451 (= res!955883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!955879 () Bool)

(assert (=> start!122632 (=> (not res!955879) (not e!803388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122632 (= res!955879 (validMask!0 mask!2608))))

(assert (=> start!122632 e!803388))

(assert (=> start!122632 true))

(declare-fun array_inv!35844 (array!96997) Bool)

(assert (=> start!122632 (array_inv!35844 a!2831)))

(declare-fun b!1420452 () Bool)

(declare-fun res!955884 () Bool)

(assert (=> b!1420452 (=> (not res!955884) (not e!803388))))

(assert (=> b!1420452 (= res!955884 (validKeyInArray!0 (select (arr!46816 a!2831) j!81)))))

(assert (= (and start!122632 res!955879) b!1420445))

(assert (= (and b!1420445 res!955876) b!1420444))

(assert (= (and b!1420444 res!955878) b!1420452))

(assert (= (and b!1420452 res!955884) b!1420451))

(assert (= (and b!1420451 res!955883) b!1420443))

(assert (= (and b!1420443 res!955885) b!1420449))

(assert (= (and b!1420449 res!955882) b!1420450))

(assert (= (and b!1420450 res!955880) b!1420446))

(assert (= (and b!1420446 res!955877) b!1420447))

(assert (= (and b!1420447 res!955881) b!1420448))

(declare-fun m!1310955 () Bool)

(assert (=> start!122632 m!1310955))

(declare-fun m!1310957 () Bool)

(assert (=> start!122632 m!1310957))

(declare-fun m!1310959 () Bool)

(assert (=> b!1420444 m!1310959))

(assert (=> b!1420444 m!1310959))

(declare-fun m!1310961 () Bool)

(assert (=> b!1420444 m!1310961))

(declare-fun m!1310963 () Bool)

(assert (=> b!1420443 m!1310963))

(declare-fun m!1310965 () Bool)

(assert (=> b!1420452 m!1310965))

(assert (=> b!1420452 m!1310965))

(declare-fun m!1310967 () Bool)

(assert (=> b!1420452 m!1310967))

(declare-fun m!1310969 () Bool)

(assert (=> b!1420446 m!1310969))

(declare-fun m!1310971 () Bool)

(assert (=> b!1420446 m!1310971))

(assert (=> b!1420446 m!1310971))

(declare-fun m!1310973 () Bool)

(assert (=> b!1420446 m!1310973))

(assert (=> b!1420446 m!1310973))

(assert (=> b!1420446 m!1310971))

(declare-fun m!1310975 () Bool)

(assert (=> b!1420446 m!1310975))

(assert (=> b!1420450 m!1310965))

(assert (=> b!1420450 m!1310965))

(declare-fun m!1310977 () Bool)

(assert (=> b!1420450 m!1310977))

(assert (=> b!1420450 m!1310977))

(assert (=> b!1420450 m!1310965))

(declare-fun m!1310979 () Bool)

(assert (=> b!1420450 m!1310979))

(assert (=> b!1420447 m!1310965))

(assert (=> b!1420447 m!1310965))

(declare-fun m!1310981 () Bool)

(assert (=> b!1420447 m!1310981))

(declare-fun m!1310983 () Bool)

(assert (=> b!1420451 m!1310983))

(push 1)

(assert (not b!1420447))

(assert (not b!1420451))

(assert (not b!1420452))

(assert (not start!122632))

(assert (not b!1420444))

(assert (not b!1420446))

(assert (not b!1420450))

(assert (not b!1420443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

