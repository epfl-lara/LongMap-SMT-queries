; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7850 () Bool)

(assert start!7850)

(declare-fun res!28693 () Bool)

(declare-fun e!31920 () Bool)

(assert (=> start!7850 (=> (not res!28693) (not e!31920))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7850 (= res!28693 (validMask!0 mask!2234))))

(assert (=> start!7850 e!31920))

(assert (=> start!7850 true))

(declare-datatypes ((array!3209 0))(
  ( (array!3210 (arr!1538 (Array (_ BitVec 32) (_ BitVec 64))) (size!1760 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3209)

(declare-fun array_inv!934 (array!3209) Bool)

(assert (=> start!7850 (array_inv!934 _keys!1794)))

(declare-fun b!49636 () Bool)

(declare-fun res!28694 () Bool)

(assert (=> b!49636 (=> (not res!28694) (not e!31920))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49636 (= res!28694 (and (= (size!1760 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3210 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1760 _keys!1794)) (bvslt i!836 (size!1760 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49637 () Bool)

(assert (=> b!49637 (= e!31920 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3209 (_ BitVec 32)) Bool)

(assert (=> b!49637 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1397 0))(
  ( (Unit!1398) )
))
(declare-fun lt!20846 () Unit!1397)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3209 (_ BitVec 32) (_ BitVec 32)) Unit!1397)

(assert (=> b!49637 (= lt!20846 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7850 res!28693) b!49636))

(assert (= (and b!49636 res!28694) b!49637))

(declare-fun m!43003 () Bool)

(assert (=> start!7850 m!43003))

(declare-fun m!43005 () Bool)

(assert (=> start!7850 m!43005))

(declare-fun m!43007 () Bool)

(assert (=> b!49637 m!43007))

(declare-fun m!43009 () Bool)

(assert (=> b!49637 m!43009))

(push 1)

(assert (not b!49637))

(assert (not start!7850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

