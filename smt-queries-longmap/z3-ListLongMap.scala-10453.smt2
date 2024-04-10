; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122882 () Bool)

(assert start!122882)

(declare-fun b!1425272 () Bool)

(declare-fun res!960706 () Bool)

(declare-fun e!805319 () Bool)

(assert (=> b!1425272 (=> (not res!960706) (not e!805319))))

(declare-datatypes ((array!97247 0))(
  ( (array!97248 (arr!46941 (Array (_ BitVec 32) (_ BitVec 64))) (size!47491 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97247)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97247 (_ BitVec 32)) Bool)

(assert (=> b!1425272 (= res!960706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425273 () Bool)

(declare-fun res!960710 () Bool)

(assert (=> b!1425273 (=> (not res!960710) (not e!805319))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11220 0))(
  ( (MissingZero!11220 (index!47272 (_ BitVec 32))) (Found!11220 (index!47273 (_ BitVec 32))) (Intermediate!11220 (undefined!12032 Bool) (index!47274 (_ BitVec 32)) (x!128910 (_ BitVec 32))) (Undefined!11220) (MissingVacant!11220 (index!47275 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97247 (_ BitVec 32)) SeekEntryResult!11220)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425273 (= res!960710 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46941 a!2831) j!81) mask!2608) (select (arr!46941 a!2831) j!81) a!2831 mask!2608) (Intermediate!11220 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!960705 () Bool)

(assert (=> start!122882 (=> (not res!960705) (not e!805319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122882 (= res!960705 (validMask!0 mask!2608))))

(assert (=> start!122882 e!805319))

(assert (=> start!122882 true))

(declare-fun array_inv!35969 (array!97247) Bool)

(assert (=> start!122882 (array_inv!35969 a!2831)))

(declare-fun b!1425274 () Bool)

(declare-fun res!960712 () Bool)

(assert (=> b!1425274 (=> (not res!960712) (not e!805319))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425274 (= res!960712 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47491 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47491 a!2831))))))

(declare-fun b!1425275 () Bool)

(assert (=> b!1425275 (= e!805319 false)))

(declare-fun lt!627795 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425275 (= lt!627795 (toIndex!0 (select (store (arr!46941 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1425276 () Bool)

(declare-fun res!960707 () Bool)

(assert (=> b!1425276 (=> (not res!960707) (not e!805319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425276 (= res!960707 (validKeyInArray!0 (select (arr!46941 a!2831) i!982)))))

(declare-fun b!1425277 () Bool)

(declare-fun res!960711 () Bool)

(assert (=> b!1425277 (=> (not res!960711) (not e!805319))))

(declare-datatypes ((List!33451 0))(
  ( (Nil!33448) (Cons!33447 (h!34749 (_ BitVec 64)) (t!48145 List!33451)) )
))
(declare-fun arrayNoDuplicates!0 (array!97247 (_ BitVec 32) List!33451) Bool)

(assert (=> b!1425277 (= res!960711 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33448))))

(declare-fun b!1425278 () Bool)

(declare-fun res!960708 () Bool)

(assert (=> b!1425278 (=> (not res!960708) (not e!805319))))

(assert (=> b!1425278 (= res!960708 (and (= (size!47491 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47491 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47491 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425279 () Bool)

(declare-fun res!960709 () Bool)

(assert (=> b!1425279 (=> (not res!960709) (not e!805319))))

(assert (=> b!1425279 (= res!960709 (validKeyInArray!0 (select (arr!46941 a!2831) j!81)))))

(assert (= (and start!122882 res!960705) b!1425278))

(assert (= (and b!1425278 res!960708) b!1425276))

(assert (= (and b!1425276 res!960707) b!1425279))

(assert (= (and b!1425279 res!960709) b!1425272))

(assert (= (and b!1425272 res!960706) b!1425277))

(assert (= (and b!1425277 res!960711) b!1425274))

(assert (= (and b!1425274 res!960712) b!1425273))

(assert (= (and b!1425273 res!960710) b!1425275))

(declare-fun m!1315829 () Bool)

(assert (=> b!1425277 m!1315829))

(declare-fun m!1315831 () Bool)

(assert (=> start!122882 m!1315831))

(declare-fun m!1315833 () Bool)

(assert (=> start!122882 m!1315833))

(declare-fun m!1315835 () Bool)

(assert (=> b!1425273 m!1315835))

(assert (=> b!1425273 m!1315835))

(declare-fun m!1315837 () Bool)

(assert (=> b!1425273 m!1315837))

(assert (=> b!1425273 m!1315837))

(assert (=> b!1425273 m!1315835))

(declare-fun m!1315839 () Bool)

(assert (=> b!1425273 m!1315839))

(declare-fun m!1315841 () Bool)

(assert (=> b!1425272 m!1315841))

(declare-fun m!1315843 () Bool)

(assert (=> b!1425275 m!1315843))

(declare-fun m!1315845 () Bool)

(assert (=> b!1425275 m!1315845))

(assert (=> b!1425275 m!1315845))

(declare-fun m!1315847 () Bool)

(assert (=> b!1425275 m!1315847))

(declare-fun m!1315849 () Bool)

(assert (=> b!1425276 m!1315849))

(assert (=> b!1425276 m!1315849))

(declare-fun m!1315851 () Bool)

(assert (=> b!1425276 m!1315851))

(assert (=> b!1425279 m!1315835))

(assert (=> b!1425279 m!1315835))

(declare-fun m!1315853 () Bool)

(assert (=> b!1425279 m!1315853))

(check-sat (not b!1425279) (not b!1425277) (not b!1425273) (not start!122882) (not b!1425272) (not b!1425275) (not b!1425276))
