; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118466 () Bool)

(assert start!118466)

(declare-fun res!926638 () Bool)

(declare-fun e!784963 () Bool)

(assert (=> start!118466 (=> (not res!926638) (not e!784963))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118466 (= res!926638 (validMask!0 mask!2987))))

(assert (=> start!118466 e!784963))

(assert (=> start!118466 true))

(declare-datatypes ((array!94742 0))(
  ( (array!94743 (arr!45747 (Array (_ BitVec 32) (_ BitVec 64))) (size!46297 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94742)

(declare-fun array_inv!34775 (array!94742) Bool)

(assert (=> start!118466 (array_inv!34775 a!2938)))

(declare-fun b!1385386 () Bool)

(declare-fun res!926635 () Bool)

(assert (=> b!1385386 (=> (not res!926635) (not e!784963))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385386 (= res!926635 (validKeyInArray!0 (select (arr!45747 a!2938) i!1065)))))

(declare-fun b!1385388 () Bool)

(assert (=> b!1385388 (= e!784963 false)))

(declare-fun lt!609231 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94742 (_ BitVec 32)) Bool)

(assert (=> b!1385388 (= lt!609231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385387 () Bool)

(declare-fun res!926637 () Bool)

(assert (=> b!1385387 (=> (not res!926637) (not e!784963))))

(declare-datatypes ((List!32275 0))(
  ( (Nil!32272) (Cons!32271 (h!33480 (_ BitVec 64)) (t!46969 List!32275)) )
))
(declare-fun arrayNoDuplicates!0 (array!94742 (_ BitVec 32) List!32275) Bool)

(assert (=> b!1385387 (= res!926637 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32272))))

(declare-fun b!1385385 () Bool)

(declare-fun res!926636 () Bool)

(assert (=> b!1385385 (=> (not res!926636) (not e!784963))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385385 (= res!926636 (and (= (size!46297 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46297 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46297 a!2938))))))

(assert (= (and start!118466 res!926638) b!1385385))

(assert (= (and b!1385385 res!926636) b!1385386))

(assert (= (and b!1385386 res!926635) b!1385387))

(assert (= (and b!1385387 res!926637) b!1385388))

(declare-fun m!1270677 () Bool)

(assert (=> start!118466 m!1270677))

(declare-fun m!1270679 () Bool)

(assert (=> start!118466 m!1270679))

(declare-fun m!1270681 () Bool)

(assert (=> b!1385386 m!1270681))

(assert (=> b!1385386 m!1270681))

(declare-fun m!1270683 () Bool)

(assert (=> b!1385386 m!1270683))

(declare-fun m!1270685 () Bool)

(assert (=> b!1385388 m!1270685))

(declare-fun m!1270687 () Bool)

(assert (=> b!1385387 m!1270687))

(check-sat (not b!1385386) (not start!118466) (not b!1385387) (not b!1385388))
