; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136766 () Bool)

(assert start!136766)

(declare-fun b!1579581 () Bool)

(declare-fun e!881201 () Bool)

(assert (=> b!1579581 (= e!881201 false)))

(declare-fun lt!676845 () (_ BitVec 32))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579581 (= lt!676845 (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(declare-fun b!1579579 () Bool)

(declare-fun res!1078265 () Bool)

(assert (=> b!1579579 (=> (not res!1078265) (not e!881201))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579579 (= res!1078265 (validKeyInArray!0 k!768))))

(declare-fun b!1579580 () Bool)

(declare-fun res!1078267 () Bool)

(assert (=> b!1579580 (=> (not res!1078267) (not e!881201))))

(declare-datatypes ((array!105678 0))(
  ( (array!105679 (arr!50952 (Array (_ BitVec 32) (_ BitVec 64))) (size!51503 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105678)

(assert (=> b!1579580 (= res!1078267 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50952 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50952 _keys!610) ee!12) (select (arr!50952 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1579578 () Bool)

(declare-fun res!1078268 () Bool)

(assert (=> b!1579578 (=> (not res!1078268) (not e!881201))))

(assert (=> b!1579578 (= res!1078268 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51503 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1078266 () Bool)

(assert (=> start!136766 (=> (not res!1078266) (not e!881201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136766 (= res!1078266 (validMask!0 mask!910))))

(assert (=> start!136766 e!881201))

(assert (=> start!136766 true))

(declare-fun array_inv!39907 (array!105678) Bool)

(assert (=> start!136766 (array_inv!39907 _keys!610)))

(assert (= (and start!136766 res!1078266) b!1579578))

(assert (= (and b!1579578 res!1078268) b!1579579))

(assert (= (and b!1579579 res!1078265) b!1579580))

(assert (= (and b!1579580 res!1078267) b!1579581))

(declare-fun m!1451717 () Bool)

(assert (=> b!1579581 m!1451717))

(declare-fun m!1451719 () Bool)

(assert (=> b!1579579 m!1451719))

(declare-fun m!1451721 () Bool)

(assert (=> b!1579580 m!1451721))

(declare-fun m!1451723 () Bool)

(assert (=> start!136766 m!1451723))

(declare-fun m!1451725 () Bool)

(assert (=> start!136766 m!1451725))

(push 1)

(assert (not b!1579579))

(assert (not start!136766))

(assert (not b!1579581))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

