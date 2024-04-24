; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7850 () Bool)

(assert start!7850)

(declare-fun res!28651 () Bool)

(declare-fun e!31865 () Bool)

(assert (=> start!7850 (=> (not res!28651) (not e!31865))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7850 (= res!28651 (validMask!0 mask!2234))))

(assert (=> start!7850 e!31865))

(assert (=> start!7850 true))

(declare-datatypes ((array!3190 0))(
  ( (array!3191 (arr!1528 (Array (_ BitVec 32) (_ BitVec 64))) (size!1750 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3190)

(declare-fun array_inv!913 (array!3190) Bool)

(assert (=> start!7850 (array_inv!913 _keys!1794)))

(declare-fun b!49561 () Bool)

(declare-fun res!28650 () Bool)

(assert (=> b!49561 (=> (not res!28650) (not e!31865))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49561 (= res!28650 (and (= (size!1750 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3191 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1750 _keys!1794)) (bvslt i!836 (size!1750 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49562 () Bool)

(assert (=> b!49562 (= e!31865 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3190 (_ BitVec 32)) Bool)

(assert (=> b!49562 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1402 0))(
  ( (Unit!1403) )
))
(declare-fun lt!20794 () Unit!1402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3190 (_ BitVec 32) (_ BitVec 32)) Unit!1402)

(assert (=> b!49562 (= lt!20794 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7850 res!28651) b!49561))

(assert (= (and b!49561 res!28650) b!49562))

(declare-fun m!42855 () Bool)

(assert (=> start!7850 m!42855))

(declare-fun m!42857 () Bool)

(assert (=> start!7850 m!42857))

(declare-fun m!42859 () Bool)

(assert (=> b!49562 m!42859))

(declare-fun m!42861 () Bool)

(assert (=> b!49562 m!42861))

(push 1)

(assert (not start!7850))

(assert (not b!49562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

