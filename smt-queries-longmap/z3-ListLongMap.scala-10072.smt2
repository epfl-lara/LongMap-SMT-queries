; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118568 () Bool)

(assert start!118568)

(declare-fun res!927374 () Bool)

(declare-fun e!785269 () Bool)

(assert (=> start!118568 (=> (not res!927374) (not e!785269))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118568 (= res!927374 (validMask!0 mask!2987))))

(assert (=> start!118568 e!785269))

(assert (=> start!118568 true))

(declare-datatypes ((array!94844 0))(
  ( (array!94845 (arr!45798 (Array (_ BitVec 32) (_ BitVec 64))) (size!46348 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94844)

(declare-fun array_inv!34826 (array!94844) Bool)

(assert (=> start!118568 (array_inv!34826 a!2938)))

(declare-fun b!1386120 () Bool)

(declare-fun res!927376 () Bool)

(assert (=> b!1386120 (=> (not res!927376) (not e!785269))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386120 (= res!927376 (and (= (size!46348 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46348 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46348 a!2938))))))

(declare-fun b!1386121 () Bool)

(declare-fun res!927375 () Bool)

(assert (=> b!1386121 (=> (not res!927375) (not e!785269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94844 (_ BitVec 32)) Bool)

(assert (=> b!1386121 (= res!927375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386122 () Bool)

(declare-fun res!927372 () Bool)

(assert (=> b!1386122 (=> (not res!927372) (not e!785269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386122 (= res!927372 (validKeyInArray!0 (select (arr!45798 a!2938) startIndex!16)))))

(declare-fun b!1386123 () Bool)

(declare-fun res!927371 () Bool)

(assert (=> b!1386123 (=> (not res!927371) (not e!785269))))

(assert (=> b!1386123 (= res!927371 (and (not (= (select (arr!45798 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45798 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1386124 () Bool)

(declare-fun res!927373 () Bool)

(assert (=> b!1386124 (=> (not res!927373) (not e!785269))))

(assert (=> b!1386124 (= res!927373 (validKeyInArray!0 (select (arr!45798 a!2938) i!1065)))))

(declare-fun b!1386125 () Bool)

(declare-fun res!927370 () Bool)

(assert (=> b!1386125 (=> (not res!927370) (not e!785269))))

(declare-datatypes ((List!32326 0))(
  ( (Nil!32323) (Cons!32322 (h!33531 (_ BitVec 64)) (t!47020 List!32326)) )
))
(declare-fun arrayNoDuplicates!0 (array!94844 (_ BitVec 32) List!32326) Bool)

(assert (=> b!1386125 (= res!927370 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32323))))

(declare-fun b!1386126 () Bool)

(assert (=> b!1386126 (= e!785269 (not (or (bvsgt #b00000000000000000000000000000000 (size!46348 a!2938)) (bvsle startIndex!16 (size!46348 a!2938)))))))

(declare-datatypes ((SeekEntryResult!10141 0))(
  ( (MissingZero!10141 (index!42935 (_ BitVec 32))) (Found!10141 (index!42936 (_ BitVec 32))) (Intermediate!10141 (undefined!10953 Bool) (index!42937 (_ BitVec 32)) (x!124558 (_ BitVec 32))) (Undefined!10141) (MissingVacant!10141 (index!42938 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94844 (_ BitVec 32)) SeekEntryResult!10141)

(assert (=> b!1386126 (= (seekEntryOrOpen!0 (select (arr!45798 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45798 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94845 (store (arr!45798 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46348 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46270 0))(
  ( (Unit!46271) )
))
(declare-fun lt!609375 () Unit!46270)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46270)

(assert (=> b!1386126 (= lt!609375 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (= (and start!118568 res!927374) b!1386120))

(assert (= (and b!1386120 res!927376) b!1386124))

(assert (= (and b!1386124 res!927373) b!1386125))

(assert (= (and b!1386125 res!927370) b!1386121))

(assert (= (and b!1386121 res!927375) b!1386123))

(assert (= (and b!1386123 res!927371) b!1386122))

(assert (= (and b!1386122 res!927372) b!1386126))

(declare-fun m!1271441 () Bool)

(assert (=> b!1386121 m!1271441))

(declare-fun m!1271443 () Bool)

(assert (=> start!118568 m!1271443))

(declare-fun m!1271445 () Bool)

(assert (=> start!118568 m!1271445))

(declare-fun m!1271447 () Bool)

(assert (=> b!1386126 m!1271447))

(assert (=> b!1386126 m!1271447))

(declare-fun m!1271449 () Bool)

(assert (=> b!1386126 m!1271449))

(declare-fun m!1271451 () Bool)

(assert (=> b!1386126 m!1271451))

(declare-fun m!1271453 () Bool)

(assert (=> b!1386126 m!1271453))

(declare-fun m!1271455 () Bool)

(assert (=> b!1386126 m!1271455))

(assert (=> b!1386126 m!1271455))

(declare-fun m!1271457 () Bool)

(assert (=> b!1386126 m!1271457))

(declare-fun m!1271459 () Bool)

(assert (=> b!1386124 m!1271459))

(assert (=> b!1386124 m!1271459))

(declare-fun m!1271461 () Bool)

(assert (=> b!1386124 m!1271461))

(assert (=> b!1386122 m!1271455))

(assert (=> b!1386122 m!1271455))

(declare-fun m!1271463 () Bool)

(assert (=> b!1386122 m!1271463))

(declare-fun m!1271465 () Bool)

(assert (=> b!1386125 m!1271465))

(assert (=> b!1386123 m!1271459))

(check-sat (not b!1386122) (not b!1386121) (not b!1386125) (not b!1386126) (not b!1386124) (not start!118568))
(check-sat)
