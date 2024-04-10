; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118550 () Bool)

(assert start!118550)

(declare-fun b!1385931 () Bool)

(declare-fun res!927185 () Bool)

(declare-fun e!785216 () Bool)

(assert (=> b!1385931 (=> (not res!927185) (not e!785216))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94826 0))(
  ( (array!94827 (arr!45789 (Array (_ BitVec 32) (_ BitVec 64))) (size!46339 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94826)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385931 (= res!927185 (and (not (= (select (arr!45789 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45789 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1385932 () Bool)

(declare-fun res!927181 () Bool)

(assert (=> b!1385932 (=> (not res!927181) (not e!785216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385932 (= res!927181 (validKeyInArray!0 (select (arr!45789 a!2938) startIndex!16)))))

(declare-fun b!1385933 () Bool)

(declare-fun res!927182 () Bool)

(assert (=> b!1385933 (=> (not res!927182) (not e!785216))))

(declare-datatypes ((List!32317 0))(
  ( (Nil!32314) (Cons!32313 (h!33522 (_ BitVec 64)) (t!47011 List!32317)) )
))
(declare-fun arrayNoDuplicates!0 (array!94826 (_ BitVec 32) List!32317) Bool)

(assert (=> b!1385933 (= res!927182 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32314))))

(declare-fun res!927186 () Bool)

(assert (=> start!118550 (=> (not res!927186) (not e!785216))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118550 (= res!927186 (validMask!0 mask!2987))))

(assert (=> start!118550 e!785216))

(assert (=> start!118550 true))

(declare-fun array_inv!34817 (array!94826) Bool)

(assert (=> start!118550 (array_inv!34817 a!2938)))

(declare-fun b!1385934 () Bool)

(declare-fun res!927183 () Bool)

(assert (=> b!1385934 (=> (not res!927183) (not e!785216))))

(assert (=> b!1385934 (= res!927183 (validKeyInArray!0 (select (arr!45789 a!2938) i!1065)))))

(declare-fun b!1385935 () Bool)

(declare-fun res!927184 () Bool)

(assert (=> b!1385935 (=> (not res!927184) (not e!785216))))

(assert (=> b!1385935 (= res!927184 (and (= (size!46339 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46339 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46339 a!2938))))))

(declare-fun b!1385936 () Bool)

(assert (=> b!1385936 (= e!785216 (not true))))

(declare-datatypes ((SeekEntryResult!10132 0))(
  ( (MissingZero!10132 (index!42899 (_ BitVec 32))) (Found!10132 (index!42900 (_ BitVec 32))) (Intermediate!10132 (undefined!10944 Bool) (index!42901 (_ BitVec 32)) (x!124525 (_ BitVec 32))) (Undefined!10132) (MissingVacant!10132 (index!42902 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94826 (_ BitVec 32)) SeekEntryResult!10132)

(assert (=> b!1385936 (= (seekEntryOrOpen!0 (select (arr!45789 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45789 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94827 (store (arr!45789 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46339 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46252 0))(
  ( (Unit!46253) )
))
(declare-fun lt!609348 () Unit!46252)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46252)

(assert (=> b!1385936 (= lt!609348 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1385937 () Bool)

(declare-fun res!927187 () Bool)

(assert (=> b!1385937 (=> (not res!927187) (not e!785216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94826 (_ BitVec 32)) Bool)

(assert (=> b!1385937 (= res!927187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118550 res!927186) b!1385935))

(assert (= (and b!1385935 res!927184) b!1385934))

(assert (= (and b!1385934 res!927183) b!1385933))

(assert (= (and b!1385933 res!927182) b!1385937))

(assert (= (and b!1385937 res!927187) b!1385931))

(assert (= (and b!1385931 res!927185) b!1385932))

(assert (= (and b!1385932 res!927181) b!1385936))

(declare-fun m!1271207 () Bool)

(assert (=> b!1385933 m!1271207))

(declare-fun m!1271209 () Bool)

(assert (=> b!1385931 m!1271209))

(declare-fun m!1271211 () Bool)

(assert (=> b!1385932 m!1271211))

(assert (=> b!1385932 m!1271211))

(declare-fun m!1271213 () Bool)

(assert (=> b!1385932 m!1271213))

(declare-fun m!1271215 () Bool)

(assert (=> b!1385936 m!1271215))

(assert (=> b!1385936 m!1271215))

(declare-fun m!1271217 () Bool)

(assert (=> b!1385936 m!1271217))

(declare-fun m!1271219 () Bool)

(assert (=> b!1385936 m!1271219))

(declare-fun m!1271221 () Bool)

(assert (=> b!1385936 m!1271221))

(assert (=> b!1385936 m!1271211))

(assert (=> b!1385936 m!1271211))

(declare-fun m!1271223 () Bool)

(assert (=> b!1385936 m!1271223))

(assert (=> b!1385934 m!1271209))

(assert (=> b!1385934 m!1271209))

(declare-fun m!1271225 () Bool)

(assert (=> b!1385934 m!1271225))

(declare-fun m!1271227 () Bool)

(assert (=> b!1385937 m!1271227))

(declare-fun m!1271229 () Bool)

(assert (=> start!118550 m!1271229))

(declare-fun m!1271231 () Bool)

(assert (=> start!118550 m!1271231))

(check-sat (not b!1385936) (not start!118550) (not b!1385933) (not b!1385934) (not b!1385932) (not b!1385937))
