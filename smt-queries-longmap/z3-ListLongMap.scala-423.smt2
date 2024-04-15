; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7878 () Bool)

(assert start!7878)

(declare-fun res!28704 () Bool)

(declare-fun e!31919 () Bool)

(assert (=> start!7878 (=> (not res!28704) (not e!31919))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7878 (= res!28704 (validMask!0 mask!2234))))

(assert (=> start!7878 e!31919))

(assert (=> start!7878 true))

(declare-datatypes ((array!3205 0))(
  ( (array!3206 (arr!1534 (Array (_ BitVec 32) (_ BitVec 64))) (size!1757 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3205)

(declare-fun array_inv!933 (array!3205) Bool)

(assert (=> start!7878 (array_inv!933 _keys!1794)))

(declare-fun i!836 () (_ BitVec 32))

(declare-fun b!49601 () Bool)

(assert (=> b!49601 (= e!31919 (and (= (size!1757 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3206 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1757 _keys!1794)) (bvslt i!836 (size!1757 _keys!1794)) (bvslt (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(assert (= (and start!7878 res!28704) b!49601))

(declare-fun m!42965 () Bool)

(assert (=> start!7878 m!42965))

(declare-fun m!42967 () Bool)

(assert (=> start!7878 m!42967))

(check-sat (not start!7878))
(check-sat)
