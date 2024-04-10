; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118292 () Bool)

(assert start!118292)

(declare-fun b!1383528 () Bool)

(declare-fun res!925121 () Bool)

(declare-fun e!784126 () Bool)

(assert (=> b!1383528 (=> (not res!925121) (not e!784126))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94595 0))(
  ( (array!94596 (arr!45675 (Array (_ BitVec 32) (_ BitVec 64))) (size!46225 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94595)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383528 (= res!925121 (and (not (= (select (arr!45675 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45675 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun res!925122 () Bool)

(assert (=> start!118292 (=> (not res!925122) (not e!784126))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118292 (= res!925122 (validMask!0 mask!2987))))

(assert (=> start!118292 e!784126))

(assert (=> start!118292 true))

(declare-fun array_inv!34703 (array!94595) Bool)

(assert (=> start!118292 (array_inv!34703 a!2938)))

(declare-fun b!1383529 () Bool)

(declare-fun res!925120 () Bool)

(assert (=> b!1383529 (=> (not res!925120) (not e!784126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383529 (= res!925120 (validKeyInArray!0 (select (arr!45675 a!2938) i!1065)))))

(declare-fun b!1383530 () Bool)

(declare-fun res!925125 () Bool)

(assert (=> b!1383530 (=> (not res!925125) (not e!784126))))

(assert (=> b!1383530 (= res!925125 (validKeyInArray!0 (select (arr!45675 a!2938) startIndex!16)))))

(declare-fun b!1383531 () Bool)

(assert (=> b!1383531 (= e!784126 (not true))))

(declare-datatypes ((SeekEntryResult!10068 0))(
  ( (MissingZero!10068 (index!42643 (_ BitVec 32))) (Found!10068 (index!42644 (_ BitVec 32))) (Intermediate!10068 (undefined!10880 Bool) (index!42645 (_ BitVec 32)) (x!124157 (_ BitVec 32))) (Undefined!10068) (MissingVacant!10068 (index!42646 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94595 (_ BitVec 32)) SeekEntryResult!10068)

(assert (=> b!1383531 (= (seekEntryOrOpen!0 (select (arr!45675 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45675 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94596 (store (arr!45675 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46225 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46073 0))(
  ( (Unit!46074) )
))
(declare-fun lt!608628 () Unit!46073)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46073)

(assert (=> b!1383531 (= lt!608628 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383532 () Bool)

(declare-fun res!925124 () Bool)

(assert (=> b!1383532 (=> (not res!925124) (not e!784126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94595 (_ BitVec 32)) Bool)

(assert (=> b!1383532 (= res!925124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383533 () Bool)

(declare-fun res!925123 () Bool)

(assert (=> b!1383533 (=> (not res!925123) (not e!784126))))

(assert (=> b!1383533 (= res!925123 (and (= (size!46225 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46225 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46225 a!2938))))))

(declare-fun b!1383534 () Bool)

(declare-fun res!925126 () Bool)

(assert (=> b!1383534 (=> (not res!925126) (not e!784126))))

(declare-datatypes ((List!32203 0))(
  ( (Nil!32200) (Cons!32199 (h!33408 (_ BitVec 64)) (t!46897 List!32203)) )
))
(declare-fun arrayNoDuplicates!0 (array!94595 (_ BitVec 32) List!32203) Bool)

(assert (=> b!1383534 (= res!925126 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32200))))

(assert (= (and start!118292 res!925122) b!1383533))

(assert (= (and b!1383533 res!925123) b!1383529))

(assert (= (and b!1383529 res!925120) b!1383534))

(assert (= (and b!1383534 res!925126) b!1383532))

(assert (= (and b!1383532 res!925124) b!1383528))

(assert (= (and b!1383528 res!925121) b!1383530))

(assert (= (and b!1383530 res!925125) b!1383531))

(declare-fun m!1268645 () Bool)

(assert (=> b!1383531 m!1268645))

(assert (=> b!1383531 m!1268645))

(declare-fun m!1268647 () Bool)

(assert (=> b!1383531 m!1268647))

(declare-fun m!1268649 () Bool)

(assert (=> b!1383531 m!1268649))

(declare-fun m!1268651 () Bool)

(assert (=> b!1383531 m!1268651))

(declare-fun m!1268653 () Bool)

(assert (=> b!1383531 m!1268653))

(assert (=> b!1383531 m!1268653))

(declare-fun m!1268655 () Bool)

(assert (=> b!1383531 m!1268655))

(assert (=> b!1383530 m!1268653))

(assert (=> b!1383530 m!1268653))

(declare-fun m!1268657 () Bool)

(assert (=> b!1383530 m!1268657))

(declare-fun m!1268659 () Bool)

(assert (=> b!1383529 m!1268659))

(assert (=> b!1383529 m!1268659))

(declare-fun m!1268661 () Bool)

(assert (=> b!1383529 m!1268661))

(declare-fun m!1268663 () Bool)

(assert (=> b!1383532 m!1268663))

(declare-fun m!1268665 () Bool)

(assert (=> b!1383534 m!1268665))

(declare-fun m!1268667 () Bool)

(assert (=> start!118292 m!1268667))

(declare-fun m!1268669 () Bool)

(assert (=> start!118292 m!1268669))

(assert (=> b!1383528 m!1268659))

(check-sat (not b!1383529) (not b!1383532) (not b!1383534) (not b!1383530) (not b!1383531) (not start!118292))
