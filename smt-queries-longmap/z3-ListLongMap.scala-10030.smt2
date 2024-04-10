; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118286 () Bool)

(assert start!118286)

(declare-fun b!1383465 () Bool)

(declare-fun res!925057 () Bool)

(declare-fun e!784108 () Bool)

(assert (=> b!1383465 (=> (not res!925057) (not e!784108))))

(declare-datatypes ((array!94589 0))(
  ( (array!94590 (arr!45672 (Array (_ BitVec 32) (_ BitVec 64))) (size!46222 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94589)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383465 (= res!925057 (validKeyInArray!0 (select (arr!45672 a!2938) i!1065)))))

(declare-fun res!925062 () Bool)

(assert (=> start!118286 (=> (not res!925062) (not e!784108))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118286 (= res!925062 (validMask!0 mask!2987))))

(assert (=> start!118286 e!784108))

(assert (=> start!118286 true))

(declare-fun array_inv!34700 (array!94589) Bool)

(assert (=> start!118286 (array_inv!34700 a!2938)))

(declare-fun b!1383466 () Bool)

(declare-fun res!925063 () Bool)

(assert (=> b!1383466 (=> (not res!925063) (not e!784108))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383466 (= res!925063 (and (= (size!46222 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46222 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46222 a!2938))))))

(declare-fun b!1383467 () Bool)

(declare-fun res!925059 () Bool)

(assert (=> b!1383467 (=> (not res!925059) (not e!784108))))

(assert (=> b!1383467 (= res!925059 (validKeyInArray!0 (select (arr!45672 a!2938) startIndex!16)))))

(declare-fun b!1383468 () Bool)

(declare-fun res!925058 () Bool)

(assert (=> b!1383468 (=> (not res!925058) (not e!784108))))

(declare-datatypes ((List!32200 0))(
  ( (Nil!32197) (Cons!32196 (h!33405 (_ BitVec 64)) (t!46894 List!32200)) )
))
(declare-fun arrayNoDuplicates!0 (array!94589 (_ BitVec 32) List!32200) Bool)

(assert (=> b!1383468 (= res!925058 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32197))))

(declare-fun b!1383469 () Bool)

(declare-fun res!925060 () Bool)

(assert (=> b!1383469 (=> (not res!925060) (not e!784108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94589 (_ BitVec 32)) Bool)

(assert (=> b!1383469 (= res!925060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383470 () Bool)

(declare-fun res!925061 () Bool)

(assert (=> b!1383470 (=> (not res!925061) (not e!784108))))

(assert (=> b!1383470 (= res!925061 (and (not (= (select (arr!45672 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45672 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383471 () Bool)

(assert (=> b!1383471 (= e!784108 (not true))))

(declare-datatypes ((SeekEntryResult!10065 0))(
  ( (MissingZero!10065 (index!42631 (_ BitVec 32))) (Found!10065 (index!42632 (_ BitVec 32))) (Intermediate!10065 (undefined!10877 Bool) (index!42633 (_ BitVec 32)) (x!124146 (_ BitVec 32))) (Undefined!10065) (MissingVacant!10065 (index!42634 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94589 (_ BitVec 32)) SeekEntryResult!10065)

(assert (=> b!1383471 (= (seekEntryOrOpen!0 (select (arr!45672 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45672 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94590 (store (arr!45672 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46222 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46067 0))(
  ( (Unit!46068) )
))
(declare-fun lt!608619 () Unit!46067)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46067)

(assert (=> b!1383471 (= lt!608619 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (= (and start!118286 res!925062) b!1383466))

(assert (= (and b!1383466 res!925063) b!1383465))

(assert (= (and b!1383465 res!925057) b!1383468))

(assert (= (and b!1383468 res!925058) b!1383469))

(assert (= (and b!1383469 res!925060) b!1383470))

(assert (= (and b!1383470 res!925061) b!1383467))

(assert (= (and b!1383467 res!925059) b!1383471))

(declare-fun m!1268567 () Bool)

(assert (=> b!1383468 m!1268567))

(declare-fun m!1268569 () Bool)

(assert (=> b!1383470 m!1268569))

(declare-fun m!1268571 () Bool)

(assert (=> b!1383471 m!1268571))

(assert (=> b!1383471 m!1268571))

(declare-fun m!1268573 () Bool)

(assert (=> b!1383471 m!1268573))

(declare-fun m!1268575 () Bool)

(assert (=> b!1383471 m!1268575))

(declare-fun m!1268577 () Bool)

(assert (=> b!1383471 m!1268577))

(declare-fun m!1268579 () Bool)

(assert (=> b!1383471 m!1268579))

(assert (=> b!1383471 m!1268579))

(declare-fun m!1268581 () Bool)

(assert (=> b!1383471 m!1268581))

(assert (=> b!1383467 m!1268579))

(assert (=> b!1383467 m!1268579))

(declare-fun m!1268583 () Bool)

(assert (=> b!1383467 m!1268583))

(assert (=> b!1383465 m!1268569))

(assert (=> b!1383465 m!1268569))

(declare-fun m!1268585 () Bool)

(assert (=> b!1383465 m!1268585))

(declare-fun m!1268587 () Bool)

(assert (=> start!118286 m!1268587))

(declare-fun m!1268589 () Bool)

(assert (=> start!118286 m!1268589))

(declare-fun m!1268591 () Bool)

(assert (=> b!1383469 m!1268591))

(check-sat (not b!1383471) (not b!1383465) (not start!118286) (not b!1383467) (not b!1383469) (not b!1383468))
