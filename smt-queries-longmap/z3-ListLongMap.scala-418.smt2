; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7836 () Bool)

(assert start!7836)

(declare-fun res!28652 () Bool)

(declare-fun e!31879 () Bool)

(assert (=> start!7836 (=> (not res!28652) (not e!31879))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7836 (= res!28652 (validMask!0 mask!2234))))

(assert (=> start!7836 e!31879))

(assert (=> start!7836 true))

(declare-datatypes ((array!3195 0))(
  ( (array!3196 (arr!1531 (Array (_ BitVec 32) (_ BitVec 64))) (size!1753 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3195)

(declare-fun array_inv!927 (array!3195) Bool)

(assert (=> start!7836 (array_inv!927 _keys!1794)))

(declare-fun b!49594 () Bool)

(declare-fun res!28651 () Bool)

(assert (=> b!49594 (=> (not res!28651) (not e!31879))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49594 (= res!28651 (and (= (size!1753 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3196 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1753 _keys!1794)) (bvslt i!836 (size!1753 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49595 () Bool)

(assert (=> b!49595 (= e!31879 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3195 (_ BitVec 32)) Bool)

(assert (=> b!49595 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1383 0))(
  ( (Unit!1384) )
))
(declare-fun lt!20825 () Unit!1383)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3195 (_ BitVec 32) (_ BitVec 32)) Unit!1383)

(assert (=> b!49595 (= lt!20825 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7836 res!28652) b!49594))

(assert (= (and b!49594 res!28651) b!49595))

(declare-fun m!42947 () Bool)

(assert (=> start!7836 m!42947))

(declare-fun m!42949 () Bool)

(assert (=> start!7836 m!42949))

(declare-fun m!42951 () Bool)

(assert (=> b!49595 m!42951))

(declare-fun m!42953 () Bool)

(assert (=> b!49595 m!42953))

(check-sat (not start!7836) (not b!49595))
