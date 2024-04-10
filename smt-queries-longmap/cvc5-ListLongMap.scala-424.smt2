; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7880 () Bool)

(assert start!7880)

(declare-fun res!28733 () Bool)

(declare-fun e!31980 () Bool)

(assert (=> start!7880 (=> (not res!28733) (not e!31980))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7880 (= res!28733 (validMask!0 mask!2234))))

(assert (=> start!7880 e!31980))

(assert (=> start!7880 true))

(declare-datatypes ((array!3231 0))(
  ( (array!3232 (arr!1548 (Array (_ BitVec 32) (_ BitVec 64))) (size!1770 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3231)

(declare-fun array_inv!944 (array!3231) Bool)

(assert (=> start!7880 (array_inv!944 _keys!1794)))

(declare-fun b!49676 () Bool)

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49676 (= e!31980 (and (= (size!1770 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3232 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1770 _keys!1794)) (bvslt i!836 (size!1770 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000) (bvsge (bvsub (size!1770 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) (bvsub (size!1770 _keys!1794) i!836))))))

(assert (= (and start!7880 res!28733) b!49676))

(declare-fun m!43059 () Bool)

(assert (=> start!7880 m!43059))

(declare-fun m!43061 () Bool)

(assert (=> start!7880 m!43061))

(push 1)

(assert (not start!7880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

