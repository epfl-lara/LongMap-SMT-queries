; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118170 () Bool)

(assert start!118170)

(declare-fun b!1383126 () Bool)

(declare-fun res!923965 () Bool)

(declare-fun e!784129 () Bool)

(assert (=> b!1383126 (=> (not res!923965) (not e!784129))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94457 0))(
  ( (array!94458 (arr!45609 (Array (_ BitVec 32) (_ BitVec 64))) (size!46160 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94457)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383126 (= res!923965 (and (= (size!46160 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46160 a!2971))))))

(declare-fun b!1383128 () Bool)

(declare-fun res!923968 () Bool)

(assert (=> b!1383128 (=> (not res!923968) (not e!784129))))

(declare-datatypes ((List!32130 0))(
  ( (Nil!32127) (Cons!32126 (h!33344 (_ BitVec 64)) (t!46816 List!32130)) )
))
(declare-fun arrayNoDuplicates!0 (array!94457 (_ BitVec 32) List!32130) Bool)

(assert (=> b!1383128 (= res!923968 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32127))))

(declare-fun res!923966 () Bool)

(assert (=> start!118170 (=> (not res!923966) (not e!784129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118170 (= res!923966 (validMask!0 mask!3034))))

(assert (=> start!118170 e!784129))

(assert (=> start!118170 true))

(declare-fun array_inv!34890 (array!94457) Bool)

(assert (=> start!118170 (array_inv!34890 a!2971)))

(declare-fun b!1383127 () Bool)

(declare-fun res!923967 () Bool)

(assert (=> b!1383127 (=> (not res!923967) (not e!784129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383127 (= res!923967 (validKeyInArray!0 (select (arr!45609 a!2971) i!1094)))))

(declare-fun b!1383129 () Bool)

(assert (=> b!1383129 (= e!784129 false)))

(declare-fun lt!608775 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94457 (_ BitVec 32)) Bool)

(assert (=> b!1383129 (= lt!608775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118170 res!923966) b!1383126))

(assert (= (and b!1383126 res!923965) b!1383127))

(assert (= (and b!1383127 res!923967) b!1383128))

(assert (= (and b!1383128 res!923968) b!1383129))

(declare-fun m!1268631 () Bool)

(assert (=> b!1383128 m!1268631))

(declare-fun m!1268633 () Bool)

(assert (=> start!118170 m!1268633))

(declare-fun m!1268635 () Bool)

(assert (=> start!118170 m!1268635))

(declare-fun m!1268637 () Bool)

(assert (=> b!1383127 m!1268637))

(assert (=> b!1383127 m!1268637))

(declare-fun m!1268639 () Bool)

(assert (=> b!1383127 m!1268639))

(declare-fun m!1268641 () Bool)

(assert (=> b!1383129 m!1268641))

(push 1)

(assert (not b!1383127))

(assert (not start!118170))

(assert (not b!1383128))

(assert (not b!1383129))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

