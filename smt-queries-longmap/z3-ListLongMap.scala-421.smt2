; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7854 () Bool)

(assert start!7854)

(declare-fun res!28706 () Bool)

(declare-fun e!31932 () Bool)

(assert (=> start!7854 (=> (not res!28706) (not e!31932))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7854 (= res!28706 (validMask!0 mask!2234))))

(assert (=> start!7854 e!31932))

(assert (=> start!7854 true))

(declare-datatypes ((array!3213 0))(
  ( (array!3214 (arr!1540 (Array (_ BitVec 32) (_ BitVec 64))) (size!1762 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3213)

(declare-fun array_inv!936 (array!3213) Bool)

(assert (=> start!7854 (array_inv!936 _keys!1794)))

(declare-fun b!49648 () Bool)

(declare-fun res!28705 () Bool)

(assert (=> b!49648 (=> (not res!28705) (not e!31932))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49648 (= res!28705 (and (= (size!1762 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3214 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1762 _keys!1794)) (bvslt i!836 (size!1762 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49649 () Bool)

(assert (=> b!49649 (= e!31932 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3213 (_ BitVec 32)) Bool)

(assert (=> b!49649 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1401 0))(
  ( (Unit!1402) )
))
(declare-fun lt!20852 () Unit!1401)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3213 (_ BitVec 32) (_ BitVec 32)) Unit!1401)

(assert (=> b!49649 (= lt!20852 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7854 res!28706) b!49648))

(assert (= (and b!49648 res!28705) b!49649))

(declare-fun m!43019 () Bool)

(assert (=> start!7854 m!43019))

(declare-fun m!43021 () Bool)

(assert (=> start!7854 m!43021))

(declare-fun m!43023 () Bool)

(assert (=> b!49649 m!43023))

(declare-fun m!43025 () Bool)

(assert (=> b!49649 m!43025))

(check-sat (not start!7854) (not b!49649))
