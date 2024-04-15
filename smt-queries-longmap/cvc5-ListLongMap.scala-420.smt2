; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7852 () Bool)

(assert start!7852)

(declare-fun res!28673 () Bool)

(declare-fun e!31878 () Bool)

(assert (=> start!7852 (=> (not res!28673) (not e!31878))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7852 (= res!28673 (validMask!0 mask!2234))))

(assert (=> start!7852 e!31878))

(assert (=> start!7852 true))

(declare-datatypes ((array!3188 0))(
  ( (array!3189 (arr!1527 (Array (_ BitVec 32) (_ BitVec 64))) (size!1750 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3188)

(declare-fun array_inv!926 (array!3188) Bool)

(assert (=> start!7852 (array_inv!926 _keys!1794)))

(declare-fun b!49570 () Bool)

(declare-fun res!28674 () Bool)

(assert (=> b!49570 (=> (not res!28674) (not e!31878))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49570 (= res!28674 (and (= (size!1750 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3189 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1750 _keys!1794)) (bvslt i!836 (size!1750 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49571 () Bool)

(assert (=> b!49571 (= e!31878 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3188 (_ BitVec 32)) Bool)

(assert (=> b!49571 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1402 0))(
  ( (Unit!1403) )
))
(declare-fun lt!20830 () Unit!1402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3188 (_ BitVec 32) (_ BitVec 32)) Unit!1402)

(assert (=> b!49571 (= lt!20830 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7852 res!28673) b!49570))

(assert (= (and b!49570 res!28674) b!49571))

(declare-fun m!42921 () Bool)

(assert (=> start!7852 m!42921))

(declare-fun m!42923 () Bool)

(assert (=> start!7852 m!42923))

(declare-fun m!42925 () Bool)

(assert (=> b!49571 m!42925))

(declare-fun m!42927 () Bool)

(assert (=> b!49571 m!42927))

(push 1)

(assert (not start!7852))

(assert (not b!49571))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

