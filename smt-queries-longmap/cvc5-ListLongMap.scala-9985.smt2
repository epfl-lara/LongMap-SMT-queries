; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118134 () Bool)

(assert start!118134)

(declare-fun b!1382913 () Bool)

(declare-fun e!784020 () Bool)

(assert (=> b!1382913 (= e!784020 false)))

(declare-fun lt!608721 () Bool)

(declare-datatypes ((array!94421 0))(
  ( (array!94422 (arr!45591 (Array (_ BitVec 32) (_ BitVec 64))) (size!46142 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94421)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94421 (_ BitVec 32)) Bool)

(assert (=> b!1382913 (= lt!608721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382910 () Bool)

(declare-fun res!923749 () Bool)

(assert (=> b!1382910 (=> (not res!923749) (not e!784020))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382910 (= res!923749 (and (= (size!46142 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46142 a!2971))))))

(declare-fun b!1382912 () Bool)

(declare-fun res!923750 () Bool)

(assert (=> b!1382912 (=> (not res!923750) (not e!784020))))

(declare-datatypes ((List!32112 0))(
  ( (Nil!32109) (Cons!32108 (h!33326 (_ BitVec 64)) (t!46798 List!32112)) )
))
(declare-fun arrayNoDuplicates!0 (array!94421 (_ BitVec 32) List!32112) Bool)

(assert (=> b!1382912 (= res!923750 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32109))))

(declare-fun b!1382911 () Bool)

(declare-fun res!923752 () Bool)

(assert (=> b!1382911 (=> (not res!923752) (not e!784020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382911 (= res!923752 (validKeyInArray!0 (select (arr!45591 a!2971) i!1094)))))

(declare-fun res!923751 () Bool)

(assert (=> start!118134 (=> (not res!923751) (not e!784020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118134 (= res!923751 (validMask!0 mask!3034))))

(assert (=> start!118134 e!784020))

(assert (=> start!118134 true))

(declare-fun array_inv!34872 (array!94421) Bool)

(assert (=> start!118134 (array_inv!34872 a!2971)))

(assert (= (and start!118134 res!923751) b!1382910))

(assert (= (and b!1382910 res!923749) b!1382911))

(assert (= (and b!1382911 res!923752) b!1382912))

(assert (= (and b!1382912 res!923750) b!1382913))

(declare-fun m!1268415 () Bool)

(assert (=> b!1382913 m!1268415))

(declare-fun m!1268417 () Bool)

(assert (=> b!1382912 m!1268417))

(declare-fun m!1268419 () Bool)

(assert (=> b!1382911 m!1268419))

(assert (=> b!1382911 m!1268419))

(declare-fun m!1268421 () Bool)

(assert (=> b!1382911 m!1268421))

(declare-fun m!1268423 () Bool)

(assert (=> start!118134 m!1268423))

(declare-fun m!1268425 () Bool)

(assert (=> start!118134 m!1268425))

(push 1)

(assert (not b!1382913))

(assert (not start!118134))

(assert (not b!1382912))

(assert (not b!1382911))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

