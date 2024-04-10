; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7840 () Bool)

(assert start!7840)

(declare-fun res!28664 () Bool)

(declare-fun e!31890 () Bool)

(assert (=> start!7840 (=> (not res!28664) (not e!31890))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7840 (= res!28664 (validMask!0 mask!2234))))

(assert (=> start!7840 e!31890))

(assert (=> start!7840 true))

(declare-datatypes ((array!3199 0))(
  ( (array!3200 (arr!1533 (Array (_ BitVec 32) (_ BitVec 64))) (size!1755 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3199)

(declare-fun array_inv!929 (array!3199) Bool)

(assert (=> start!7840 (array_inv!929 _keys!1794)))

(declare-fun b!49606 () Bool)

(declare-fun res!28663 () Bool)

(assert (=> b!49606 (=> (not res!28663) (not e!31890))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49606 (= res!28663 (and (= (size!1755 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3200 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1755 _keys!1794)) (bvslt i!836 (size!1755 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49607 () Bool)

(assert (=> b!49607 (= e!31890 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3199 (_ BitVec 32)) Bool)

(assert (=> b!49607 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1387 0))(
  ( (Unit!1388) )
))
(declare-fun lt!20831 () Unit!1387)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3199 (_ BitVec 32) (_ BitVec 32)) Unit!1387)

(assert (=> b!49607 (= lt!20831 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7840 res!28664) b!49606))

(assert (= (and b!49606 res!28663) b!49607))

(declare-fun m!42963 () Bool)

(assert (=> start!7840 m!42963))

(declare-fun m!42965 () Bool)

(assert (=> start!7840 m!42965))

(declare-fun m!42967 () Bool)

(assert (=> b!49607 m!42967))

(declare-fun m!42969 () Bool)

(assert (=> b!49607 m!42969))

(push 1)

(assert (not start!7840))

(assert (not b!49607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

