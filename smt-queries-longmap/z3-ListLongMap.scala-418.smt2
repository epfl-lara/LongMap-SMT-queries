; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7840 () Bool)

(assert start!7840)

(declare-fun res!28620 () Bool)

(declare-fun e!31836 () Bool)

(assert (=> start!7840 (=> (not res!28620) (not e!31836))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7840 (= res!28620 (validMask!0 mask!2234))))

(assert (=> start!7840 e!31836))

(assert (=> start!7840 true))

(declare-datatypes ((array!3180 0))(
  ( (array!3181 (arr!1523 (Array (_ BitVec 32) (_ BitVec 64))) (size!1745 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3180)

(declare-fun array_inv!908 (array!3180) Bool)

(assert (=> start!7840 (array_inv!908 _keys!1794)))

(declare-fun b!49531 () Bool)

(declare-fun res!28621 () Bool)

(assert (=> b!49531 (=> (not res!28621) (not e!31836))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49531 (= res!28621 (and (= (size!1745 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3181 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1745 _keys!1794)) (bvslt i!836 (size!1745 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49532 () Bool)

(assert (=> b!49532 (= e!31836 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3180 (_ BitVec 32)) Bool)

(assert (=> b!49532 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1392 0))(
  ( (Unit!1393) )
))
(declare-fun lt!20779 () Unit!1392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3180 (_ BitVec 32) (_ BitVec 32)) Unit!1392)

(assert (=> b!49532 (= lt!20779 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7840 res!28620) b!49531))

(assert (= (and b!49531 res!28621) b!49532))

(declare-fun m!42815 () Bool)

(assert (=> start!7840 m!42815))

(declare-fun m!42817 () Bool)

(assert (=> start!7840 m!42817))

(declare-fun m!42819 () Bool)

(assert (=> b!49532 m!42819))

(declare-fun m!42821 () Bool)

(assert (=> b!49532 m!42821))

(check-sat (not start!7840) (not b!49532))
(check-sat)
