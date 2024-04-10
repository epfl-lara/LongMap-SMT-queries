; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122872 () Bool)

(assert start!122872)

(declare-fun b!1425153 () Bool)

(declare-fun res!960586 () Bool)

(declare-fun e!805289 () Bool)

(assert (=> b!1425153 (=> (not res!960586) (not e!805289))))

(declare-datatypes ((array!97237 0))(
  ( (array!97238 (arr!46936 (Array (_ BitVec 32) (_ BitVec 64))) (size!47486 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97237)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425153 (= res!960586 (validKeyInArray!0 (select (arr!46936 a!2831) i!982)))))

(declare-fun b!1425154 () Bool)

(declare-fun res!960587 () Bool)

(assert (=> b!1425154 (=> (not res!960587) (not e!805289))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425154 (= res!960587 (validKeyInArray!0 (select (arr!46936 a!2831) j!81)))))

(declare-fun b!1425155 () Bool)

(assert (=> b!1425155 (= e!805289 false)))

(declare-datatypes ((SeekEntryResult!11215 0))(
  ( (MissingZero!11215 (index!47252 (_ BitVec 32))) (Found!11215 (index!47253 (_ BitVec 32))) (Intermediate!11215 (undefined!12027 Bool) (index!47254 (_ BitVec 32)) (x!128889 (_ BitVec 32))) (Undefined!11215) (MissingVacant!11215 (index!47255 (_ BitVec 32))) )
))
(declare-fun lt!627780 () SeekEntryResult!11215)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97237 (_ BitVec 32)) SeekEntryResult!11215)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425155 (= lt!627780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46936 a!2831) j!81) mask!2608) (select (arr!46936 a!2831) j!81) a!2831 mask!2608))))

(declare-fun res!960591 () Bool)

(assert (=> start!122872 (=> (not res!960591) (not e!805289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122872 (= res!960591 (validMask!0 mask!2608))))

(assert (=> start!122872 e!805289))

(assert (=> start!122872 true))

(declare-fun array_inv!35964 (array!97237) Bool)

(assert (=> start!122872 (array_inv!35964 a!2831)))

(declare-fun b!1425156 () Bool)

(declare-fun res!960589 () Bool)

(assert (=> b!1425156 (=> (not res!960589) (not e!805289))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425156 (= res!960589 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47486 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47486 a!2831))))))

(declare-fun b!1425157 () Bool)

(declare-fun res!960592 () Bool)

(assert (=> b!1425157 (=> (not res!960592) (not e!805289))))

(declare-datatypes ((List!33446 0))(
  ( (Nil!33443) (Cons!33442 (h!34744 (_ BitVec 64)) (t!48140 List!33446)) )
))
(declare-fun arrayNoDuplicates!0 (array!97237 (_ BitVec 32) List!33446) Bool)

(assert (=> b!1425157 (= res!960592 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33443))))

(declare-fun b!1425158 () Bool)

(declare-fun res!960588 () Bool)

(assert (=> b!1425158 (=> (not res!960588) (not e!805289))))

(assert (=> b!1425158 (= res!960588 (and (= (size!47486 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47486 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47486 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425159 () Bool)

(declare-fun res!960590 () Bool)

(assert (=> b!1425159 (=> (not res!960590) (not e!805289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97237 (_ BitVec 32)) Bool)

(assert (=> b!1425159 (= res!960590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122872 res!960591) b!1425158))

(assert (= (and b!1425158 res!960588) b!1425153))

(assert (= (and b!1425153 res!960586) b!1425154))

(assert (= (and b!1425154 res!960587) b!1425159))

(assert (= (and b!1425159 res!960590) b!1425157))

(assert (= (and b!1425157 res!960592) b!1425156))

(assert (= (and b!1425156 res!960589) b!1425155))

(declare-fun m!1315705 () Bool)

(assert (=> b!1425154 m!1315705))

(assert (=> b!1425154 m!1315705))

(declare-fun m!1315707 () Bool)

(assert (=> b!1425154 m!1315707))

(declare-fun m!1315709 () Bool)

(assert (=> start!122872 m!1315709))

(declare-fun m!1315711 () Bool)

(assert (=> start!122872 m!1315711))

(declare-fun m!1315713 () Bool)

(assert (=> b!1425153 m!1315713))

(assert (=> b!1425153 m!1315713))

(declare-fun m!1315715 () Bool)

(assert (=> b!1425153 m!1315715))

(declare-fun m!1315717 () Bool)

(assert (=> b!1425159 m!1315717))

(declare-fun m!1315719 () Bool)

(assert (=> b!1425157 m!1315719))

(assert (=> b!1425155 m!1315705))

(assert (=> b!1425155 m!1315705))

(declare-fun m!1315721 () Bool)

(assert (=> b!1425155 m!1315721))

(assert (=> b!1425155 m!1315721))

(assert (=> b!1425155 m!1315705))

(declare-fun m!1315723 () Bool)

(assert (=> b!1425155 m!1315723))

(push 1)

(assert (not b!1425155))

(assert (not start!122872))

(assert (not b!1425157))

(assert (not b!1425159))

(assert (not b!1425154))

(assert (not b!1425153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

