; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7846 () Bool)

(assert start!7846)

(declare-fun res!28681 () Bool)

(declare-fun e!31908 () Bool)

(assert (=> start!7846 (=> (not res!28681) (not e!31908))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7846 (= res!28681 (validMask!0 mask!2234))))

(assert (=> start!7846 e!31908))

(assert (=> start!7846 true))

(declare-datatypes ((array!3205 0))(
  ( (array!3206 (arr!1536 (Array (_ BitVec 32) (_ BitVec 64))) (size!1758 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3205)

(declare-fun array_inv!932 (array!3205) Bool)

(assert (=> start!7846 (array_inv!932 _keys!1794)))

(declare-fun b!49624 () Bool)

(declare-fun res!28682 () Bool)

(assert (=> b!49624 (=> (not res!28682) (not e!31908))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49624 (= res!28682 (and (= (size!1758 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3206 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1758 _keys!1794)) (bvslt i!836 (size!1758 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49625 () Bool)

(assert (=> b!49625 (= e!31908 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3205 (_ BitVec 32)) Bool)

(assert (=> b!49625 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1393 0))(
  ( (Unit!1394) )
))
(declare-fun lt!20840 () Unit!1393)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3205 (_ BitVec 32) (_ BitVec 32)) Unit!1393)

(assert (=> b!49625 (= lt!20840 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7846 res!28681) b!49624))

(assert (= (and b!49624 res!28682) b!49625))

(declare-fun m!42987 () Bool)

(assert (=> start!7846 m!42987))

(declare-fun m!42989 () Bool)

(assert (=> start!7846 m!42989))

(declare-fun m!42991 () Bool)

(assert (=> b!49625 m!42991))

(declare-fun m!42993 () Bool)

(assert (=> b!49625 m!42993))

(push 1)

(assert (not b!49625))

(assert (not start!7846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

