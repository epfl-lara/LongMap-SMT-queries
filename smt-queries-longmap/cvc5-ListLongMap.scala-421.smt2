; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7858 () Bool)

(assert start!7858)

(declare-fun res!28691 () Bool)

(declare-fun e!31895 () Bool)

(assert (=> start!7858 (=> (not res!28691) (not e!31895))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7858 (= res!28691 (validMask!0 mask!2234))))

(assert (=> start!7858 e!31895))

(assert (=> start!7858 true))

(declare-datatypes ((array!3194 0))(
  ( (array!3195 (arr!1530 (Array (_ BitVec 32) (_ BitVec 64))) (size!1753 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3194)

(declare-fun array_inv!929 (array!3194) Bool)

(assert (=> start!7858 (array_inv!929 _keys!1794)))

(declare-fun b!49588 () Bool)

(declare-fun res!28692 () Bool)

(assert (=> b!49588 (=> (not res!28692) (not e!31895))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49588 (= res!28692 (and (= (size!1753 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3195 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1753 _keys!1794)) (bvslt i!836 (size!1753 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49589 () Bool)

(assert (=> b!49589 (= e!31895 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3194 (_ BitVec 32)) Bool)

(assert (=> b!49589 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1408 0))(
  ( (Unit!1409) )
))
(declare-fun lt!20839 () Unit!1408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3194 (_ BitVec 32) (_ BitVec 32)) Unit!1408)

(assert (=> b!49589 (= lt!20839 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7858 res!28691) b!49588))

(assert (= (and b!49588 res!28692) b!49589))

(declare-fun m!42945 () Bool)

(assert (=> start!7858 m!42945))

(declare-fun m!42947 () Bool)

(assert (=> start!7858 m!42947))

(declare-fun m!42949 () Bool)

(assert (=> b!49589 m!42949))

(declare-fun m!42951 () Bool)

(assert (=> b!49589 m!42951))

(push 1)

(assert (not start!7858))

(assert (not b!49589))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

