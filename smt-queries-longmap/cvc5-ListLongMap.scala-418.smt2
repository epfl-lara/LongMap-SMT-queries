; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7840 () Bool)

(assert start!7840)

(declare-fun res!28637 () Bool)

(declare-fun e!31841 () Bool)

(assert (=> start!7840 (=> (not res!28637) (not e!31841))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7840 (= res!28637 (validMask!0 mask!2234))))

(assert (=> start!7840 e!31841))

(assert (=> start!7840 true))

(declare-datatypes ((array!3176 0))(
  ( (array!3177 (arr!1521 (Array (_ BitVec 32) (_ BitVec 64))) (size!1744 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3176)

(declare-fun array_inv!920 (array!3176) Bool)

(assert (=> start!7840 (array_inv!920 _keys!1794)))

(declare-fun b!49534 () Bool)

(declare-fun res!28638 () Bool)

(assert (=> b!49534 (=> (not res!28638) (not e!31841))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49534 (= res!28638 (and (= (size!1744 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3177 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1744 _keys!1794)) (bvslt i!836 (size!1744 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49535 () Bool)

(assert (=> b!49535 (= e!31841 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3176 (_ BitVec 32)) Bool)

(assert (=> b!49535 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1390 0))(
  ( (Unit!1391) )
))
(declare-fun lt!20812 () Unit!1390)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3176 (_ BitVec 32) (_ BitVec 32)) Unit!1390)

(assert (=> b!49535 (= lt!20812 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7840 res!28637) b!49534))

(assert (= (and b!49534 res!28638) b!49535))

(declare-fun m!42873 () Bool)

(assert (=> start!7840 m!42873))

(declare-fun m!42875 () Bool)

(assert (=> start!7840 m!42875))

(declare-fun m!42877 () Bool)

(assert (=> b!49535 m!42877))

(declare-fun m!42879 () Bool)

(assert (=> b!49535 m!42879))

(push 1)

(assert (not start!7840))

(assert (not b!49535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

