; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118058 () Bool)

(assert start!118058)

(declare-fun res!924006 () Bool)

(declare-fun e!783560 () Bool)

(assert (=> start!118058 (=> (not res!924006) (not e!783560))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118058 (= res!924006 (validMask!0 mask!3034))))

(assert (=> start!118058 e!783560))

(assert (=> start!118058 true))

(declare-datatypes ((array!94422 0))(
  ( (array!94423 (arr!45592 (Array (_ BitVec 32) (_ BitVec 64))) (size!46142 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94422)

(declare-fun array_inv!34620 (array!94422) Bool)

(assert (=> start!118058 (array_inv!34620 a!2971)))

(declare-fun b!1382414 () Bool)

(declare-fun res!924004 () Bool)

(assert (=> b!1382414 (=> (not res!924004) (not e!783560))))

(declare-datatypes ((List!32126 0))(
  ( (Nil!32123) (Cons!32122 (h!33331 (_ BitVec 64)) (t!46820 List!32126)) )
))
(declare-fun arrayNoDuplicates!0 (array!94422 (_ BitVec 32) List!32126) Bool)

(assert (=> b!1382414 (= res!924004 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32123))))

(declare-fun b!1382415 () Bool)

(assert (=> b!1382415 (= e!783560 false)))

(declare-fun lt!608421 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94422 (_ BitVec 32)) Bool)

(assert (=> b!1382415 (= lt!608421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382412 () Bool)

(declare-fun res!924005 () Bool)

(assert (=> b!1382412 (=> (not res!924005) (not e!783560))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382412 (= res!924005 (and (= (size!46142 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46142 a!2971))))))

(declare-fun b!1382413 () Bool)

(declare-fun res!924007 () Bool)

(assert (=> b!1382413 (=> (not res!924007) (not e!783560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382413 (= res!924007 (validKeyInArray!0 (select (arr!45592 a!2971) i!1094)))))

(assert (= (and start!118058 res!924006) b!1382412))

(assert (= (and b!1382412 res!924005) b!1382413))

(assert (= (and b!1382413 res!924007) b!1382414))

(assert (= (and b!1382414 res!924004) b!1382415))

(declare-fun m!1267551 () Bool)

(assert (=> start!118058 m!1267551))

(declare-fun m!1267553 () Bool)

(assert (=> start!118058 m!1267553))

(declare-fun m!1267555 () Bool)

(assert (=> b!1382414 m!1267555))

(declare-fun m!1267557 () Bool)

(assert (=> b!1382415 m!1267557))

(declare-fun m!1267559 () Bool)

(assert (=> b!1382413 m!1267559))

(assert (=> b!1382413 m!1267559))

(declare-fun m!1267561 () Bool)

(assert (=> b!1382413 m!1267561))

(push 1)

(assert (not b!1382415))

(assert (not start!118058))

(assert (not b!1382414))

(assert (not b!1382413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

