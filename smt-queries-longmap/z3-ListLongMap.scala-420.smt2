; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7852 () Bool)

(assert start!7852)

(declare-fun res!28657 () Bool)

(declare-fun e!31871 () Bool)

(assert (=> start!7852 (=> (not res!28657) (not e!31871))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7852 (= res!28657 (validMask!0 mask!2234))))

(assert (=> start!7852 e!31871))

(assert (=> start!7852 true))

(declare-datatypes ((array!3192 0))(
  ( (array!3193 (arr!1529 (Array (_ BitVec 32) (_ BitVec 64))) (size!1751 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3192)

(declare-fun array_inv!914 (array!3192) Bool)

(assert (=> start!7852 (array_inv!914 _keys!1794)))

(declare-fun b!49567 () Bool)

(declare-fun res!28656 () Bool)

(assert (=> b!49567 (=> (not res!28656) (not e!31871))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49567 (= res!28656 (and (= (size!1751 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3193 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1751 _keys!1794)) (bvslt i!836 (size!1751 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49568 () Bool)

(assert (=> b!49568 (= e!31871 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3192 (_ BitVec 32)) Bool)

(assert (=> b!49568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1404 0))(
  ( (Unit!1405) )
))
(declare-fun lt!20797 () Unit!1404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3192 (_ BitVec 32) (_ BitVec 32)) Unit!1404)

(assert (=> b!49568 (= lt!20797 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7852 res!28657) b!49567))

(assert (= (and b!49567 res!28656) b!49568))

(declare-fun m!42863 () Bool)

(assert (=> start!7852 m!42863))

(declare-fun m!42865 () Bool)

(assert (=> start!7852 m!42865))

(declare-fun m!42867 () Bool)

(assert (=> b!49568 m!42867))

(declare-fun m!42869 () Bool)

(assert (=> b!49568 m!42869))

(check-sat (not start!7852) (not b!49568))
(check-sat)
