; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7884 () Bool)

(assert start!7884)

(declare-fun res!28713 () Bool)

(declare-fun e!31937 () Bool)

(assert (=> start!7884 (=> (not res!28713) (not e!31937))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7884 (= res!28713 (validMask!0 mask!2234))))

(assert (=> start!7884 e!31937))

(assert (=> start!7884 true))

(declare-datatypes ((array!3211 0))(
  ( (array!3212 (arr!1537 (Array (_ BitVec 32) (_ BitVec 64))) (size!1760 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3211)

(declare-fun array_inv!936 (array!3211) Bool)

(assert (=> start!7884 (array_inv!936 _keys!1794)))

(declare-fun b!49610 () Bool)

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49610 (= e!31937 (and (= (size!1760 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3212 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1760 _keys!1794)) (bvslt i!836 (size!1760 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000) (bvsge (bvsub (size!1760 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) (bvsub (size!1760 _keys!1794) i!836))))))

(assert (= (and start!7884 res!28713) b!49610))

(declare-fun m!42977 () Bool)

(assert (=> start!7884 m!42977))

(declare-fun m!42979 () Bool)

(assert (=> start!7884 m!42979))

(check-sat (not start!7884))
(check-sat)
