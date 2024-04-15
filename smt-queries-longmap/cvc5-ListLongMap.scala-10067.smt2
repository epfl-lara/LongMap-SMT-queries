; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118536 () Bool)

(assert start!118536)

(declare-fun b!1385790 () Bool)

(declare-fun e!785155 () Bool)

(assert (=> b!1385790 (= e!785155 false)))

(declare-fun lt!609149 () Bool)

(declare-datatypes ((array!94765 0))(
  ( (array!94766 (arr!45759 (Array (_ BitVec 32) (_ BitVec 64))) (size!46311 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94765)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94765 (_ BitVec 32)) Bool)

(assert (=> b!1385790 (= lt!609149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385787 () Bool)

(declare-fun res!927080 () Bool)

(assert (=> b!1385787 (=> (not res!927080) (not e!785155))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385787 (= res!927080 (and (= (size!46311 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46311 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46311 a!2938))))))

(declare-fun b!1385788 () Bool)

(declare-fun res!927081 () Bool)

(assert (=> b!1385788 (=> (not res!927081) (not e!785155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385788 (= res!927081 (validKeyInArray!0 (select (arr!45759 a!2938) i!1065)))))

(declare-fun res!927082 () Bool)

(assert (=> start!118536 (=> (not res!927082) (not e!785155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118536 (= res!927082 (validMask!0 mask!2987))))

(assert (=> start!118536 e!785155))

(assert (=> start!118536 true))

(declare-fun array_inv!34992 (array!94765) Bool)

(assert (=> start!118536 (array_inv!34992 a!2938)))

(declare-fun b!1385789 () Bool)

(declare-fun res!927083 () Bool)

(assert (=> b!1385789 (=> (not res!927083) (not e!785155))))

(declare-datatypes ((List!32365 0))(
  ( (Nil!32362) (Cons!32361 (h!33570 (_ BitVec 64)) (t!47051 List!32365)) )
))
(declare-fun arrayNoDuplicates!0 (array!94765 (_ BitVec 32) List!32365) Bool)

(assert (=> b!1385789 (= res!927083 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32362))))

(assert (= (and start!118536 res!927082) b!1385787))

(assert (= (and b!1385787 res!927080) b!1385788))

(assert (= (and b!1385788 res!927081) b!1385789))

(assert (= (and b!1385789 res!927083) b!1385790))

(declare-fun m!1270629 () Bool)

(assert (=> b!1385790 m!1270629))

(declare-fun m!1270631 () Bool)

(assert (=> b!1385788 m!1270631))

(assert (=> b!1385788 m!1270631))

(declare-fun m!1270633 () Bool)

(assert (=> b!1385788 m!1270633))

(declare-fun m!1270635 () Bool)

(assert (=> start!118536 m!1270635))

(declare-fun m!1270637 () Bool)

(assert (=> start!118536 m!1270637))

(declare-fun m!1270639 () Bool)

(assert (=> b!1385789 m!1270639))

(push 1)

(assert (not b!1385788))

(assert (not start!118536))

(assert (not b!1385789))

(assert (not b!1385790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

