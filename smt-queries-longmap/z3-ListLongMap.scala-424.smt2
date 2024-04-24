; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7884 () Bool)

(assert start!7884)

(declare-fun res!28708 () Bool)

(declare-fun e!31943 () Bool)

(assert (=> start!7884 (=> (not res!28708) (not e!31943))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7884 (= res!28708 (validMask!0 mask!2234))))

(assert (=> start!7884 e!31943))

(assert (=> start!7884 true))

(declare-datatypes ((array!3217 0))(
  ( (array!3218 (arr!1541 (Array (_ BitVec 32) (_ BitVec 64))) (size!1763 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3217)

(declare-fun array_inv!926 (array!3217) Bool)

(assert (=> start!7884 (array_inv!926 _keys!1794)))

(declare-fun b!49619 () Bool)

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49619 (= e!31943 (and (= (size!1763 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3218 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1763 _keys!1794)) (bvslt i!836 (size!1763 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000) (bvsge (bvsub (size!1763 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) (bvsub (size!1763 _keys!1794) i!836))))))

(assert (= (and start!7884 res!28708) b!49619))

(declare-fun m!42935 () Bool)

(assert (=> start!7884 m!42935))

(declare-fun m!42937 () Bool)

(assert (=> start!7884 m!42937))

(check-sat (not start!7884))
(check-sat)
