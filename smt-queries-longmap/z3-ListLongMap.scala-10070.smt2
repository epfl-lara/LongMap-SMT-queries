; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118556 () Bool)

(assert start!118556)

(declare-fun b!1385994 () Bool)

(declare-fun res!927249 () Bool)

(declare-fun e!785233 () Bool)

(assert (=> b!1385994 (=> (not res!927249) (not e!785233))))

(declare-datatypes ((array!94832 0))(
  ( (array!94833 (arr!45792 (Array (_ BitVec 32) (_ BitVec 64))) (size!46342 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94832)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385994 (= res!927249 (validKeyInArray!0 (select (arr!45792 a!2938) i!1065)))))

(declare-fun res!927250 () Bool)

(assert (=> start!118556 (=> (not res!927250) (not e!785233))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118556 (= res!927250 (validMask!0 mask!2987))))

(assert (=> start!118556 e!785233))

(assert (=> start!118556 true))

(declare-fun array_inv!34820 (array!94832) Bool)

(assert (=> start!118556 (array_inv!34820 a!2938)))

(declare-fun b!1385995 () Bool)

(declare-fun res!927246 () Bool)

(assert (=> b!1385995 (=> (not res!927246) (not e!785233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94832 (_ BitVec 32)) Bool)

(assert (=> b!1385995 (= res!927246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385996 () Bool)

(declare-fun res!927247 () Bool)

(assert (=> b!1385996 (=> (not res!927247) (not e!785233))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385996 (= res!927247 (validKeyInArray!0 (select (arr!45792 a!2938) startIndex!16)))))

(declare-fun b!1385997 () Bool)

(declare-fun res!927248 () Bool)

(assert (=> b!1385997 (=> (not res!927248) (not e!785233))))

(assert (=> b!1385997 (= res!927248 (and (not (= (select (arr!45792 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45792 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1385998 () Bool)

(declare-fun res!927245 () Bool)

(assert (=> b!1385998 (=> (not res!927245) (not e!785233))))

(declare-datatypes ((List!32320 0))(
  ( (Nil!32317) (Cons!32316 (h!33525 (_ BitVec 64)) (t!47014 List!32320)) )
))
(declare-fun arrayNoDuplicates!0 (array!94832 (_ BitVec 32) List!32320) Bool)

(assert (=> b!1385998 (= res!927245 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32317))))

(declare-fun b!1385999 () Bool)

(assert (=> b!1385999 (= e!785233 (not true))))

(declare-datatypes ((SeekEntryResult!10135 0))(
  ( (MissingZero!10135 (index!42911 (_ BitVec 32))) (Found!10135 (index!42912 (_ BitVec 32))) (Intermediate!10135 (undefined!10947 Bool) (index!42913 (_ BitVec 32)) (x!124536 (_ BitVec 32))) (Undefined!10135) (MissingVacant!10135 (index!42914 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94832 (_ BitVec 32)) SeekEntryResult!10135)

(assert (=> b!1385999 (= (seekEntryOrOpen!0 (select (arr!45792 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45792 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94833 (store (arr!45792 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46342 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46258 0))(
  ( (Unit!46259) )
))
(declare-fun lt!609357 () Unit!46258)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46258)

(assert (=> b!1385999 (= lt!609357 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1386000 () Bool)

(declare-fun res!927244 () Bool)

(assert (=> b!1386000 (=> (not res!927244) (not e!785233))))

(assert (=> b!1386000 (= res!927244 (and (= (size!46342 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46342 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46342 a!2938))))))

(assert (= (and start!118556 res!927250) b!1386000))

(assert (= (and b!1386000 res!927244) b!1385994))

(assert (= (and b!1385994 res!927249) b!1385998))

(assert (= (and b!1385998 res!927245) b!1385995))

(assert (= (and b!1385995 res!927246) b!1385997))

(assert (= (and b!1385997 res!927248) b!1385996))

(assert (= (and b!1385996 res!927247) b!1385999))

(declare-fun m!1271285 () Bool)

(assert (=> b!1385996 m!1271285))

(assert (=> b!1385996 m!1271285))

(declare-fun m!1271287 () Bool)

(assert (=> b!1385996 m!1271287))

(declare-fun m!1271289 () Bool)

(assert (=> b!1385994 m!1271289))

(assert (=> b!1385994 m!1271289))

(declare-fun m!1271291 () Bool)

(assert (=> b!1385994 m!1271291))

(declare-fun m!1271293 () Bool)

(assert (=> b!1385999 m!1271293))

(assert (=> b!1385999 m!1271293))

(declare-fun m!1271295 () Bool)

(assert (=> b!1385999 m!1271295))

(declare-fun m!1271297 () Bool)

(assert (=> b!1385999 m!1271297))

(declare-fun m!1271299 () Bool)

(assert (=> b!1385999 m!1271299))

(assert (=> b!1385999 m!1271285))

(assert (=> b!1385999 m!1271285))

(declare-fun m!1271301 () Bool)

(assert (=> b!1385999 m!1271301))

(declare-fun m!1271303 () Bool)

(assert (=> b!1385995 m!1271303))

(declare-fun m!1271305 () Bool)

(assert (=> b!1385998 m!1271305))

(assert (=> b!1385997 m!1271289))

(declare-fun m!1271307 () Bool)

(assert (=> start!118556 m!1271307))

(declare-fun m!1271309 () Bool)

(assert (=> start!118556 m!1271309))

(check-sat (not start!118556) (not b!1385994) (not b!1385995) (not b!1385999) (not b!1385996) (not b!1385998))
