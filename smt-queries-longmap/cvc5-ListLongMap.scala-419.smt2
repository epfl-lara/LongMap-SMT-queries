; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7846 () Bool)

(assert start!7846)

(declare-fun res!28655 () Bool)

(declare-fun e!31860 () Bool)

(assert (=> start!7846 (=> (not res!28655) (not e!31860))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7846 (= res!28655 (validMask!0 mask!2234))))

(assert (=> start!7846 e!31860))

(assert (=> start!7846 true))

(declare-datatypes ((array!3182 0))(
  ( (array!3183 (arr!1524 (Array (_ BitVec 32) (_ BitVec 64))) (size!1747 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3182)

(declare-fun array_inv!923 (array!3182) Bool)

(assert (=> start!7846 (array_inv!923 _keys!1794)))

(declare-fun b!49552 () Bool)

(declare-fun res!28656 () Bool)

(assert (=> b!49552 (=> (not res!28656) (not e!31860))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49552 (= res!28656 (and (= (size!1747 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3183 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1747 _keys!1794)) (bvslt i!836 (size!1747 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49553 () Bool)

(assert (=> b!49553 (= e!31860 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3182 (_ BitVec 32)) Bool)

(assert (=> b!49553 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1396 0))(
  ( (Unit!1397) )
))
(declare-fun lt!20821 () Unit!1396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3182 (_ BitVec 32) (_ BitVec 32)) Unit!1396)

(assert (=> b!49553 (= lt!20821 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7846 res!28655) b!49552))

(assert (= (and b!49552 res!28656) b!49553))

(declare-fun m!42897 () Bool)

(assert (=> start!7846 m!42897))

(declare-fun m!42899 () Bool)

(assert (=> start!7846 m!42899))

(declare-fun m!42901 () Bool)

(assert (=> b!49553 m!42901))

(declare-fun m!42903 () Bool)

(assert (=> b!49553 m!42903))

(push 1)

(assert (not start!7846))

(assert (not b!49553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

