; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122858 () Bool)

(assert start!122858)

(declare-fun res!960439 () Bool)

(declare-fun e!805246 () Bool)

(assert (=> start!122858 (=> (not res!960439) (not e!805246))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122858 (= res!960439 (validMask!0 mask!2608))))

(assert (=> start!122858 e!805246))

(assert (=> start!122858 true))

(declare-datatypes ((array!97223 0))(
  ( (array!97224 (arr!46929 (Array (_ BitVec 32) (_ BitVec 64))) (size!47479 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97223)

(declare-fun array_inv!35957 (array!97223) Bool)

(assert (=> start!122858 (array_inv!35957 a!2831)))

(declare-fun b!1425006 () Bool)

(declare-fun res!960442 () Bool)

(assert (=> b!1425006 (=> (not res!960442) (not e!805246))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425006 (= res!960442 (validKeyInArray!0 (select (arr!46929 a!2831) i!982)))))

(declare-fun b!1425007 () Bool)

(declare-fun res!960441 () Bool)

(assert (=> b!1425007 (=> (not res!960441) (not e!805246))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425007 (= res!960441 (and (= (size!47479 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47479 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47479 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425008 () Bool)

(assert (=> b!1425008 (= e!805246 false)))

(declare-datatypes ((SeekEntryResult!11208 0))(
  ( (MissingZero!11208 (index!47224 (_ BitVec 32))) (Found!11208 (index!47225 (_ BitVec 32))) (Intermediate!11208 (undefined!12020 Bool) (index!47226 (_ BitVec 32)) (x!128866 (_ BitVec 32))) (Undefined!11208) (MissingVacant!11208 (index!47227 (_ BitVec 32))) )
))
(declare-fun lt!627759 () SeekEntryResult!11208)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97223 (_ BitVec 32)) SeekEntryResult!11208)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425008 (= lt!627759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46929 a!2831) j!81) mask!2608) (select (arr!46929 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425009 () Bool)

(declare-fun res!960444 () Bool)

(assert (=> b!1425009 (=> (not res!960444) (not e!805246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97223 (_ BitVec 32)) Bool)

(assert (=> b!1425009 (= res!960444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425010 () Bool)

(declare-fun res!960443 () Bool)

(assert (=> b!1425010 (=> (not res!960443) (not e!805246))))

(declare-datatypes ((List!33439 0))(
  ( (Nil!33436) (Cons!33435 (h!34737 (_ BitVec 64)) (t!48133 List!33439)) )
))
(declare-fun arrayNoDuplicates!0 (array!97223 (_ BitVec 32) List!33439) Bool)

(assert (=> b!1425010 (= res!960443 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33436))))

(declare-fun b!1425011 () Bool)

(declare-fun res!960440 () Bool)

(assert (=> b!1425011 (=> (not res!960440) (not e!805246))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425011 (= res!960440 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47479 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47479 a!2831))))))

(declare-fun b!1425012 () Bool)

(declare-fun res!960445 () Bool)

(assert (=> b!1425012 (=> (not res!960445) (not e!805246))))

(assert (=> b!1425012 (= res!960445 (validKeyInArray!0 (select (arr!46929 a!2831) j!81)))))

(assert (= (and start!122858 res!960439) b!1425007))

(assert (= (and b!1425007 res!960441) b!1425006))

(assert (= (and b!1425006 res!960442) b!1425012))

(assert (= (and b!1425012 res!960445) b!1425009))

(assert (= (and b!1425009 res!960444) b!1425010))

(assert (= (and b!1425010 res!960443) b!1425011))

(assert (= (and b!1425011 res!960440) b!1425008))

(declare-fun m!1315565 () Bool)

(assert (=> b!1425012 m!1315565))

(assert (=> b!1425012 m!1315565))

(declare-fun m!1315567 () Bool)

(assert (=> b!1425012 m!1315567))

(declare-fun m!1315569 () Bool)

(assert (=> b!1425009 m!1315569))

(assert (=> b!1425008 m!1315565))

(assert (=> b!1425008 m!1315565))

(declare-fun m!1315571 () Bool)

(assert (=> b!1425008 m!1315571))

(assert (=> b!1425008 m!1315571))

(assert (=> b!1425008 m!1315565))

(declare-fun m!1315573 () Bool)

(assert (=> b!1425008 m!1315573))

(declare-fun m!1315575 () Bool)

(assert (=> b!1425010 m!1315575))

(declare-fun m!1315577 () Bool)

(assert (=> start!122858 m!1315577))

(declare-fun m!1315579 () Bool)

(assert (=> start!122858 m!1315579))

(declare-fun m!1315581 () Bool)

(assert (=> b!1425006 m!1315581))

(assert (=> b!1425006 m!1315581))

(declare-fun m!1315583 () Bool)

(assert (=> b!1425006 m!1315583))

(check-sat (not b!1425012) (not b!1425006) (not b!1425009) (not start!122858) (not b!1425010) (not b!1425008))
