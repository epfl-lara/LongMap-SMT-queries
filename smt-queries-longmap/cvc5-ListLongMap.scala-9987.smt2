; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118146 () Bool)

(assert start!118146)

(declare-fun b!1382982 () Bool)

(declare-fun res!923821 () Bool)

(declare-fun e!784057 () Bool)

(assert (=> b!1382982 (=> (not res!923821) (not e!784057))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94433 0))(
  ( (array!94434 (arr!45597 (Array (_ BitVec 32) (_ BitVec 64))) (size!46148 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94433)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382982 (= res!923821 (and (= (size!46148 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46148 a!2971))))))

(declare-fun b!1382983 () Bool)

(declare-fun res!923824 () Bool)

(assert (=> b!1382983 (=> (not res!923824) (not e!784057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382983 (= res!923824 (validKeyInArray!0 (select (arr!45597 a!2971) i!1094)))))

(declare-fun res!923822 () Bool)

(assert (=> start!118146 (=> (not res!923822) (not e!784057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118146 (= res!923822 (validMask!0 mask!3034))))

(assert (=> start!118146 e!784057))

(assert (=> start!118146 true))

(declare-fun array_inv!34878 (array!94433) Bool)

(assert (=> start!118146 (array_inv!34878 a!2971)))

(declare-fun b!1382984 () Bool)

(declare-fun res!923823 () Bool)

(assert (=> b!1382984 (=> (not res!923823) (not e!784057))))

(declare-datatypes ((List!32118 0))(
  ( (Nil!32115) (Cons!32114 (h!33332 (_ BitVec 64)) (t!46804 List!32118)) )
))
(declare-fun arrayNoDuplicates!0 (array!94433 (_ BitVec 32) List!32118) Bool)

(assert (=> b!1382984 (= res!923823 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32115))))

(declare-fun b!1382985 () Bool)

(assert (=> b!1382985 (= e!784057 false)))

(declare-fun lt!608739 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94433 (_ BitVec 32)) Bool)

(assert (=> b!1382985 (= lt!608739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118146 res!923822) b!1382982))

(assert (= (and b!1382982 res!923821) b!1382983))

(assert (= (and b!1382983 res!923824) b!1382984))

(assert (= (and b!1382984 res!923823) b!1382985))

(declare-fun m!1268487 () Bool)

(assert (=> b!1382983 m!1268487))

(assert (=> b!1382983 m!1268487))

(declare-fun m!1268489 () Bool)

(assert (=> b!1382983 m!1268489))

(declare-fun m!1268491 () Bool)

(assert (=> start!118146 m!1268491))

(declare-fun m!1268493 () Bool)

(assert (=> start!118146 m!1268493))

(declare-fun m!1268495 () Bool)

(assert (=> b!1382984 m!1268495))

(declare-fun m!1268497 () Bool)

(assert (=> b!1382985 m!1268497))

(push 1)

(assert (not b!1382985))

(assert (not start!118146))

(assert (not b!1382984))

(assert (not b!1382983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

