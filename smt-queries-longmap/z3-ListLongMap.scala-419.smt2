; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7842 () Bool)

(assert start!7842)

(declare-fun res!28670 () Bool)

(declare-fun e!31896 () Bool)

(assert (=> start!7842 (=> (not res!28670) (not e!31896))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7842 (= res!28670 (validMask!0 mask!2234))))

(assert (=> start!7842 e!31896))

(assert (=> start!7842 true))

(declare-datatypes ((array!3201 0))(
  ( (array!3202 (arr!1534 (Array (_ BitVec 32) (_ BitVec 64))) (size!1756 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3201)

(declare-fun array_inv!930 (array!3201) Bool)

(assert (=> start!7842 (array_inv!930 _keys!1794)))

(declare-fun b!49612 () Bool)

(declare-fun res!28669 () Bool)

(assert (=> b!49612 (=> (not res!28669) (not e!31896))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49612 (= res!28669 (and (= (size!1756 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3202 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1756 _keys!1794)) (bvslt i!836 (size!1756 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49613 () Bool)

(assert (=> b!49613 (= e!31896 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3201 (_ BitVec 32)) Bool)

(assert (=> b!49613 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1389 0))(
  ( (Unit!1390) )
))
(declare-fun lt!20834 () Unit!1389)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3201 (_ BitVec 32) (_ BitVec 32)) Unit!1389)

(assert (=> b!49613 (= lt!20834 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7842 res!28670) b!49612))

(assert (= (and b!49612 res!28669) b!49613))

(declare-fun m!42971 () Bool)

(assert (=> start!7842 m!42971))

(declare-fun m!42973 () Bool)

(assert (=> start!7842 m!42973))

(declare-fun m!42975 () Bool)

(assert (=> b!49613 m!42975))

(declare-fun m!42977 () Bool)

(assert (=> b!49613 m!42977))

(check-sat (not start!7842) (not b!49613))
