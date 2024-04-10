; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7852 () Bool)

(assert start!7852)

(declare-fun res!28699 () Bool)

(declare-fun e!31926 () Bool)

(assert (=> start!7852 (=> (not res!28699) (not e!31926))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7852 (= res!28699 (validMask!0 mask!2234))))

(assert (=> start!7852 e!31926))

(assert (=> start!7852 true))

(declare-datatypes ((array!3211 0))(
  ( (array!3212 (arr!1539 (Array (_ BitVec 32) (_ BitVec 64))) (size!1761 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3211)

(declare-fun array_inv!935 (array!3211) Bool)

(assert (=> start!7852 (array_inv!935 _keys!1794)))

(declare-fun b!49642 () Bool)

(declare-fun res!28700 () Bool)

(assert (=> b!49642 (=> (not res!28700) (not e!31926))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49642 (= res!28700 (and (= (size!1761 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3212 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1761 _keys!1794)) (bvslt i!836 (size!1761 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49643 () Bool)

(assert (=> b!49643 (= e!31926 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3211 (_ BitVec 32)) Bool)

(assert (=> b!49643 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1399 0))(
  ( (Unit!1400) )
))
(declare-fun lt!20849 () Unit!1399)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3211 (_ BitVec 32) (_ BitVec 32)) Unit!1399)

(assert (=> b!49643 (= lt!20849 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7852 res!28699) b!49642))

(assert (= (and b!49642 res!28700) b!49643))

(declare-fun m!43011 () Bool)

(assert (=> start!7852 m!43011))

(declare-fun m!43013 () Bool)

(assert (=> start!7852 m!43013))

(declare-fun m!43015 () Bool)

(assert (=> b!49643 m!43015))

(declare-fun m!43017 () Bool)

(assert (=> b!49643 m!43017))

(push 1)

(assert (not b!49643))

(assert (not start!7852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

