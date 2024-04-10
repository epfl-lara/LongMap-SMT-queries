; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7882 () Bool)

(assert start!7882)

(declare-fun res!28736 () Bool)

(declare-fun e!31986 () Bool)

(assert (=> start!7882 (=> (not res!28736) (not e!31986))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7882 (= res!28736 (validMask!0 mask!2234))))

(assert (=> start!7882 e!31986))

(assert (=> start!7882 true))

(declare-datatypes ((array!3233 0))(
  ( (array!3234 (arr!1549 (Array (_ BitVec 32) (_ BitVec 64))) (size!1771 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3233)

(declare-fun array_inv!945 (array!3233) Bool)

(assert (=> start!7882 (array_inv!945 _keys!1794)))

(declare-fun b!49679 () Bool)

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49679 (= e!31986 (and (= (size!1771 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3234 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1771 _keys!1794)) (bvslt i!836 (size!1771 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000) (bvsge (bvsub (size!1771 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) (bvsub (size!1771 _keys!1794) i!836))))))

(assert (= (and start!7882 res!28736) b!49679))

(declare-fun m!43063 () Bool)

(assert (=> start!7882 m!43063))

(declare-fun m!43065 () Bool)

(assert (=> start!7882 m!43065))

(check-sat (not start!7882))
(check-sat)
