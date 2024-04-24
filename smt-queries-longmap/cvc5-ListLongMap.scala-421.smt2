; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7862 () Bool)

(assert start!7862)

(declare-fun res!28687 () Bool)

(declare-fun e!31902 () Bool)

(assert (=> start!7862 (=> (not res!28687) (not e!31902))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7862 (= res!28687 (validMask!0 mask!2234))))

(assert (=> start!7862 e!31902))

(assert (=> start!7862 true))

(declare-datatypes ((array!3202 0))(
  ( (array!3203 (arr!1534 (Array (_ BitVec 32) (_ BitVec 64))) (size!1756 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3202)

(declare-fun array_inv!919 (array!3202) Bool)

(assert (=> start!7862 (array_inv!919 _keys!1794)))

(declare-fun b!49597 () Bool)

(declare-fun res!28686 () Bool)

(assert (=> b!49597 (=> (not res!28686) (not e!31902))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49597 (= res!28686 (and (= (size!1756 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3203 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1756 _keys!1794)) (bvslt i!836 (size!1756 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49598 () Bool)

(assert (=> b!49598 (= e!31902 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3202 (_ BitVec 32)) Bool)

(assert (=> b!49598 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1414 0))(
  ( (Unit!1415) )
))
(declare-fun lt!20812 () Unit!1414)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3202 (_ BitVec 32) (_ BitVec 32)) Unit!1414)

(assert (=> b!49598 (= lt!20812 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7862 res!28687) b!49597))

(assert (= (and b!49597 res!28686) b!49598))

(declare-fun m!42903 () Bool)

(assert (=> start!7862 m!42903))

(declare-fun m!42905 () Bool)

(assert (=> start!7862 m!42905))

(declare-fun m!42907 () Bool)

(assert (=> b!49598 m!42907))

(declare-fun m!42909 () Bool)

(assert (=> b!49598 m!42909))

(push 1)

(assert (not start!7862))

(assert (not b!49598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

