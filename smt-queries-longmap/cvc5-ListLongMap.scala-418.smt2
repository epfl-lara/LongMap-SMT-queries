; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7834 () Bool)

(assert start!7834)

(declare-fun res!28645 () Bool)

(declare-fun e!31873 () Bool)

(assert (=> start!7834 (=> (not res!28645) (not e!31873))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7834 (= res!28645 (validMask!0 mask!2234))))

(assert (=> start!7834 e!31873))

(assert (=> start!7834 true))

(declare-datatypes ((array!3193 0))(
  ( (array!3194 (arr!1530 (Array (_ BitVec 32) (_ BitVec 64))) (size!1752 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3193)

(declare-fun array_inv!926 (array!3193) Bool)

(assert (=> start!7834 (array_inv!926 _keys!1794)))

(declare-fun b!49588 () Bool)

(declare-fun res!28646 () Bool)

(assert (=> b!49588 (=> (not res!28646) (not e!31873))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49588 (= res!28646 (and (= (size!1752 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3194 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1752 _keys!1794)) (bvslt i!836 (size!1752 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49589 () Bool)

(assert (=> b!49589 (= e!31873 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3193 (_ BitVec 32)) Bool)

(assert (=> b!49589 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1381 0))(
  ( (Unit!1382) )
))
(declare-fun lt!20822 () Unit!1381)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3193 (_ BitVec 32) (_ BitVec 32)) Unit!1381)

(assert (=> b!49589 (= lt!20822 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7834 res!28645) b!49588))

(assert (= (and b!49588 res!28646) b!49589))

(declare-fun m!42939 () Bool)

(assert (=> start!7834 m!42939))

(declare-fun m!42941 () Bool)

(assert (=> start!7834 m!42941))

(declare-fun m!42943 () Bool)

(assert (=> b!49589 m!42943))

(declare-fun m!42945 () Bool)

(assert (=> b!49589 m!42945))

(push 1)

(assert (not start!7834))

(assert (not b!49589))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

