; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7856 () Bool)

(assert start!7856)

(declare-fun res!28712 () Bool)

(declare-fun e!31939 () Bool)

(assert (=> start!7856 (=> (not res!28712) (not e!31939))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7856 (= res!28712 (validMask!0 mask!2234))))

(assert (=> start!7856 e!31939))

(assert (=> start!7856 true))

(declare-datatypes ((array!3215 0))(
  ( (array!3216 (arr!1541 (Array (_ BitVec 32) (_ BitVec 64))) (size!1763 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3215)

(declare-fun array_inv!937 (array!3215) Bool)

(assert (=> start!7856 (array_inv!937 _keys!1794)))

(declare-fun b!49654 () Bool)

(declare-fun res!28711 () Bool)

(assert (=> b!49654 (=> (not res!28711) (not e!31939))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49654 (= res!28711 (and (= (size!1763 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3216 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1763 _keys!1794)) (bvslt i!836 (size!1763 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49655 () Bool)

(assert (=> b!49655 (= e!31939 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3215 (_ BitVec 32)) Bool)

(assert (=> b!49655 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1403 0))(
  ( (Unit!1404) )
))
(declare-fun lt!20855 () Unit!1403)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3215 (_ BitVec 32) (_ BitVec 32)) Unit!1403)

(assert (=> b!49655 (= lt!20855 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7856 res!28712) b!49654))

(assert (= (and b!49654 res!28711) b!49655))

(declare-fun m!43027 () Bool)

(assert (=> start!7856 m!43027))

(declare-fun m!43029 () Bool)

(assert (=> start!7856 m!43029))

(declare-fun m!43031 () Bool)

(assert (=> b!49655 m!43031))

(declare-fun m!43033 () Bool)

(assert (=> b!49655 m!43033))

(push 1)

(assert (not start!7856))

(assert (not b!49655))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

