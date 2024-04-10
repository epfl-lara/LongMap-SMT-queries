; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118042 () Bool)

(assert start!118042)

(declare-fun b!1382317 () Bool)

(declare-fun res!923908 () Bool)

(declare-fun e!783512 () Bool)

(assert (=> b!1382317 (=> (not res!923908) (not e!783512))))

(declare-datatypes ((array!94406 0))(
  ( (array!94407 (arr!45584 (Array (_ BitVec 32) (_ BitVec 64))) (size!46134 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94406)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382317 (= res!923908 (validKeyInArray!0 (select (arr!45584 a!2971) i!1094)))))

(declare-fun b!1382316 () Bool)

(declare-fun res!923909 () Bool)

(assert (=> b!1382316 (=> (not res!923909) (not e!783512))))

(declare-fun mask!3034 () (_ BitVec 32))

(assert (=> b!1382316 (= res!923909 (and (= (size!46134 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46134 a!2971))))))

(declare-fun res!923910 () Bool)

(assert (=> start!118042 (=> (not res!923910) (not e!783512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118042 (= res!923910 (validMask!0 mask!3034))))

(assert (=> start!118042 e!783512))

(assert (=> start!118042 true))

(declare-fun array_inv!34612 (array!94406) Bool)

(assert (=> start!118042 (array_inv!34612 a!2971)))

(declare-fun b!1382318 () Bool)

(declare-fun res!923911 () Bool)

(assert (=> b!1382318 (=> (not res!923911) (not e!783512))))

(declare-datatypes ((List!32118 0))(
  ( (Nil!32115) (Cons!32114 (h!33323 (_ BitVec 64)) (t!46812 List!32118)) )
))
(declare-fun arrayNoDuplicates!0 (array!94406 (_ BitVec 32) List!32118) Bool)

(assert (=> b!1382318 (= res!923911 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32115))))

(declare-fun b!1382319 () Bool)

(assert (=> b!1382319 (= e!783512 false)))

(declare-fun lt!608397 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94406 (_ BitVec 32)) Bool)

(assert (=> b!1382319 (= lt!608397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118042 res!923910) b!1382316))

(assert (= (and b!1382316 res!923909) b!1382317))

(assert (= (and b!1382317 res!923908) b!1382318))

(assert (= (and b!1382318 res!923911) b!1382319))

(declare-fun m!1267455 () Bool)

(assert (=> b!1382317 m!1267455))

(assert (=> b!1382317 m!1267455))

(declare-fun m!1267457 () Bool)

(assert (=> b!1382317 m!1267457))

(declare-fun m!1267459 () Bool)

(assert (=> start!118042 m!1267459))

(declare-fun m!1267461 () Bool)

(assert (=> start!118042 m!1267461))

(declare-fun m!1267463 () Bool)

(assert (=> b!1382318 m!1267463))

(declare-fun m!1267465 () Bool)

(assert (=> b!1382319 m!1267465))

(push 1)

(assert (not b!1382317))

(assert (not start!118042))

(assert (not b!1382318))

(assert (not b!1382319))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

