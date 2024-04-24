; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7878 () Bool)

(assert start!7878)

(declare-fun res!28699 () Bool)

(declare-fun e!31925 () Bool)

(assert (=> start!7878 (=> (not res!28699) (not e!31925))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7878 (= res!28699 (validMask!0 mask!2234))))

(assert (=> start!7878 e!31925))

(assert (=> start!7878 true))

(declare-datatypes ((array!3211 0))(
  ( (array!3212 (arr!1538 (Array (_ BitVec 32) (_ BitVec 64))) (size!1760 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3211)

(declare-fun array_inv!923 (array!3211) Bool)

(assert (=> start!7878 (array_inv!923 _keys!1794)))

(declare-fun b!49610 () Bool)

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49610 (= e!31925 (and (= (size!1760 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3212 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1760 _keys!1794)) (bvslt i!836 (size!1760 _keys!1794)) (bvslt (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(assert (= (and start!7878 res!28699) b!49610))

(declare-fun m!42923 () Bool)

(assert (=> start!7878 m!42923))

(declare-fun m!42925 () Bool)

(assert (=> start!7878 m!42925))

(check-sat (not start!7878))
(check-sat)
