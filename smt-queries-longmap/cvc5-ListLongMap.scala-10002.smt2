; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118266 () Bool)

(assert start!118266)

(declare-fun res!924488 () Bool)

(declare-fun e!784390 () Bool)

(assert (=> start!118266 (=> (not res!924488) (not e!784390))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118266 (= res!924488 (validMask!0 mask!3034))))

(assert (=> start!118266 e!784390))

(assert (=> start!118266 true))

(declare-datatypes ((array!94526 0))(
  ( (array!94527 (arr!45642 (Array (_ BitVec 32) (_ BitVec 64))) (size!46193 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94526)

(declare-fun array_inv!34923 (array!94526) Bool)

(assert (=> start!118266 (array_inv!34923 a!2971)))

(declare-fun b!1383684 () Bool)

(declare-fun res!924490 () Bool)

(assert (=> b!1383684 (=> (not res!924490) (not e!784390))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383684 (= res!924490 (and (= (size!46193 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46193 a!2971))))))

(declare-fun b!1383687 () Bool)

(assert (=> b!1383687 (= e!784390 false)))

(declare-fun lt!608892 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94526 (_ BitVec 32)) Bool)

(assert (=> b!1383687 (= lt!608892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383685 () Bool)

(declare-fun res!924487 () Bool)

(assert (=> b!1383685 (=> (not res!924487) (not e!784390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383685 (= res!924487 (validKeyInArray!0 (select (arr!45642 a!2971) i!1094)))))

(declare-fun b!1383686 () Bool)

(declare-fun res!924489 () Bool)

(assert (=> b!1383686 (=> (not res!924489) (not e!784390))))

(declare-datatypes ((List!32163 0))(
  ( (Nil!32160) (Cons!32159 (h!33377 (_ BitVec 64)) (t!46849 List!32163)) )
))
(declare-fun arrayNoDuplicates!0 (array!94526 (_ BitVec 32) List!32163) Bool)

(assert (=> b!1383686 (= res!924489 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32160))))

(assert (= (and start!118266 res!924488) b!1383684))

(assert (= (and b!1383684 res!924490) b!1383685))

(assert (= (and b!1383685 res!924487) b!1383686))

(assert (= (and b!1383686 res!924489) b!1383687))

(declare-fun m!1269147 () Bool)

(assert (=> start!118266 m!1269147))

(declare-fun m!1269149 () Bool)

(assert (=> start!118266 m!1269149))

(declare-fun m!1269151 () Bool)

(assert (=> b!1383687 m!1269151))

(declare-fun m!1269153 () Bool)

(assert (=> b!1383685 m!1269153))

(assert (=> b!1383685 m!1269153))

(declare-fun m!1269155 () Bool)

(assert (=> b!1383685 m!1269155))

(declare-fun m!1269157 () Bool)

(assert (=> b!1383686 m!1269157))

(push 1)

(assert (not b!1383685))

(assert (not start!118266))

(assert (not b!1383686))

(assert (not b!1383687))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

