; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7876 () Bool)

(assert start!7876)

(declare-fun res!28727 () Bool)

(declare-fun e!31968 () Bool)

(assert (=> start!7876 (=> (not res!28727) (not e!31968))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7876 (= res!28727 (validMask!0 mask!2234))))

(assert (=> start!7876 e!31968))

(assert (=> start!7876 true))

(declare-datatypes ((array!3227 0))(
  ( (array!3228 (arr!1546 (Array (_ BitVec 32) (_ BitVec 64))) (size!1768 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3227)

(declare-fun array_inv!942 (array!3227) Bool)

(assert (=> start!7876 (array_inv!942 _keys!1794)))

(declare-fun b!49670 () Bool)

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49670 (= e!31968 (and (= (size!1768 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3228 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1768 _keys!1794)) (bvslt i!836 (size!1768 _keys!1794)) (bvslt (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(assert (= (and start!7876 res!28727) b!49670))

(declare-fun m!43051 () Bool)

(assert (=> start!7876 m!43051))

(declare-fun m!43053 () Bool)

(assert (=> start!7876 m!43053))

(check-sat (not start!7876))
(check-sat)
