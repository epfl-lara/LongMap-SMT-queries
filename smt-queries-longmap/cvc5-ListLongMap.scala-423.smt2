; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7874 () Bool)

(assert start!7874)

(declare-fun res!28724 () Bool)

(declare-fun e!31962 () Bool)

(assert (=> start!7874 (=> (not res!28724) (not e!31962))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7874 (= res!28724 (validMask!0 mask!2234))))

(assert (=> start!7874 e!31962))

(assert (=> start!7874 true))

(declare-datatypes ((array!3225 0))(
  ( (array!3226 (arr!1545 (Array (_ BitVec 32) (_ BitVec 64))) (size!1767 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3225)

(declare-fun array_inv!941 (array!3225) Bool)

(assert (=> start!7874 (array_inv!941 _keys!1794)))

(declare-fun i!836 () (_ BitVec 32))

(declare-fun b!49667 () Bool)

(assert (=> b!49667 (= e!31962 (and (= (size!1767 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3226 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1767 _keys!1794)) (bvslt i!836 (size!1767 _keys!1794)) (bvslt (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(assert (= (and start!7874 res!28724) b!49667))

(declare-fun m!43047 () Bool)

(assert (=> start!7874 m!43047))

(declare-fun m!43049 () Bool)

(assert (=> start!7874 m!43049))

(push 1)

(assert (not start!7874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

