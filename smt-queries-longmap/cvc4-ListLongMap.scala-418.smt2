; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7838 () Bool)

(assert start!7838)

(declare-fun res!28658 () Bool)

(declare-fun e!31885 () Bool)

(assert (=> start!7838 (=> (not res!28658) (not e!31885))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7838 (= res!28658 (validMask!0 mask!2234))))

(assert (=> start!7838 e!31885))

(assert (=> start!7838 true))

(declare-datatypes ((array!3197 0))(
  ( (array!3198 (arr!1532 (Array (_ BitVec 32) (_ BitVec 64))) (size!1754 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3197)

(declare-fun array_inv!928 (array!3197) Bool)

(assert (=> start!7838 (array_inv!928 _keys!1794)))

(declare-fun b!49600 () Bool)

(declare-fun res!28657 () Bool)

(assert (=> b!49600 (=> (not res!28657) (not e!31885))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49600 (= res!28657 (and (= (size!1754 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3198 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1754 _keys!1794)) (bvslt i!836 (size!1754 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49601 () Bool)

(assert (=> b!49601 (= e!31885 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3197 (_ BitVec 32)) Bool)

(assert (=> b!49601 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1385 0))(
  ( (Unit!1386) )
))
(declare-fun lt!20828 () Unit!1385)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3197 (_ BitVec 32) (_ BitVec 32)) Unit!1385)

(assert (=> b!49601 (= lt!20828 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7838 res!28658) b!49600))

(assert (= (and b!49600 res!28657) b!49601))

(declare-fun m!42955 () Bool)

(assert (=> start!7838 m!42955))

(declare-fun m!42957 () Bool)

(assert (=> start!7838 m!42957))

(declare-fun m!42959 () Bool)

(assert (=> b!49601 m!42959))

(declare-fun m!42961 () Bool)

(assert (=> b!49601 m!42961))

(push 1)

(assert (not start!7838))

