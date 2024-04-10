; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7848 () Bool)

(assert start!7848)

(declare-fun res!28688 () Bool)

(declare-fun e!31914 () Bool)

(assert (=> start!7848 (=> (not res!28688) (not e!31914))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7848 (= res!28688 (validMask!0 mask!2234))))

(assert (=> start!7848 e!31914))

(assert (=> start!7848 true))

(declare-datatypes ((array!3207 0))(
  ( (array!3208 (arr!1537 (Array (_ BitVec 32) (_ BitVec 64))) (size!1759 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3207)

(declare-fun array_inv!933 (array!3207) Bool)

(assert (=> start!7848 (array_inv!933 _keys!1794)))

(declare-fun b!49630 () Bool)

(declare-fun res!28687 () Bool)

(assert (=> b!49630 (=> (not res!28687) (not e!31914))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49630 (= res!28687 (and (= (size!1759 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3208 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1759 _keys!1794)) (bvslt i!836 (size!1759 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49631 () Bool)

(assert (=> b!49631 (= e!31914 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3207 (_ BitVec 32)) Bool)

(assert (=> b!49631 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1395 0))(
  ( (Unit!1396) )
))
(declare-fun lt!20843 () Unit!1395)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3207 (_ BitVec 32) (_ BitVec 32)) Unit!1395)

(assert (=> b!49631 (= lt!20843 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7848 res!28688) b!49630))

(assert (= (and b!49630 res!28687) b!49631))

(declare-fun m!42995 () Bool)

(assert (=> start!7848 m!42995))

(declare-fun m!42997 () Bool)

(assert (=> start!7848 m!42997))

(declare-fun m!42999 () Bool)

(assert (=> b!49631 m!42999))

(declare-fun m!43001 () Bool)

(assert (=> b!49631 m!43001))

(check-sat (not b!49631) (not start!7848))
