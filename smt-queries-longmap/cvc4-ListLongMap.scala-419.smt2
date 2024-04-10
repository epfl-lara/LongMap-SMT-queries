; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7844 () Bool)

(assert start!7844)

(declare-fun res!28676 () Bool)

(declare-fun e!31902 () Bool)

(assert (=> start!7844 (=> (not res!28676) (not e!31902))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7844 (= res!28676 (validMask!0 mask!2234))))

(assert (=> start!7844 e!31902))

(assert (=> start!7844 true))

(declare-datatypes ((array!3203 0))(
  ( (array!3204 (arr!1535 (Array (_ BitVec 32) (_ BitVec 64))) (size!1757 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3203)

(declare-fun array_inv!931 (array!3203) Bool)

(assert (=> start!7844 (array_inv!931 _keys!1794)))

(declare-fun b!49618 () Bool)

(declare-fun res!28675 () Bool)

(assert (=> b!49618 (=> (not res!28675) (not e!31902))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49618 (= res!28675 (and (= (size!1757 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3204 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1757 _keys!1794)) (bvslt i!836 (size!1757 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49619 () Bool)

(assert (=> b!49619 (= e!31902 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3203 (_ BitVec 32)) Bool)

(assert (=> b!49619 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1391 0))(
  ( (Unit!1392) )
))
(declare-fun lt!20837 () Unit!1391)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3203 (_ BitVec 32) (_ BitVec 32)) Unit!1391)

(assert (=> b!49619 (= lt!20837 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7844 res!28676) b!49618))

(assert (= (and b!49618 res!28675) b!49619))

(declare-fun m!42979 () Bool)

(assert (=> start!7844 m!42979))

(declare-fun m!42981 () Bool)

(assert (=> start!7844 m!42981))

(declare-fun m!42983 () Bool)

(assert (=> b!49619 m!42983))

(declare-fun m!42985 () Bool)

(assert (=> b!49619 m!42985))

(push 1)

(assert (not start!7844))

(assert (not b!49619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

