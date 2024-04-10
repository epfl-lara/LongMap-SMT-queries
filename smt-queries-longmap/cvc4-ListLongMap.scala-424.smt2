; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7884 () Bool)

(assert start!7884)

(declare-fun res!28739 () Bool)

(declare-fun e!31992 () Bool)

(assert (=> start!7884 (=> (not res!28739) (not e!31992))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7884 (= res!28739 (validMask!0 mask!2234))))

(assert (=> start!7884 e!31992))

(assert (=> start!7884 true))

(declare-datatypes ((array!3235 0))(
  ( (array!3236 (arr!1550 (Array (_ BitVec 32) (_ BitVec 64))) (size!1772 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3235)

(declare-fun array_inv!946 (array!3235) Bool)

(assert (=> start!7884 (array_inv!946 _keys!1794)))

(declare-fun b!49682 () Bool)

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49682 (= e!31992 (and (= (size!1772 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3236 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1772 _keys!1794)) (bvslt i!836 (size!1772 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000) (bvsge (bvsub (size!1772 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) (bvsub (size!1772 _keys!1794) i!836))))))

(assert (= (and start!7884 res!28739) b!49682))

(declare-fun m!43067 () Bool)

(assert (=> start!7884 m!43067))

(declare-fun m!43069 () Bool)

(assert (=> start!7884 m!43069))

(push 1)

(assert (not start!7884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

