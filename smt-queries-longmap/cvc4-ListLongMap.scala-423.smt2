; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7878 () Bool)

(assert start!7878)

(declare-fun res!28730 () Bool)

(declare-fun e!31974 () Bool)

(assert (=> start!7878 (=> (not res!28730) (not e!31974))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7878 (= res!28730 (validMask!0 mask!2234))))

(assert (=> start!7878 e!31974))

(assert (=> start!7878 true))

(declare-datatypes ((array!3229 0))(
  ( (array!3230 (arr!1547 (Array (_ BitVec 32) (_ BitVec 64))) (size!1769 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3229)

(declare-fun array_inv!943 (array!3229) Bool)

(assert (=> start!7878 (array_inv!943 _keys!1794)))

(declare-fun b!49673 () Bool)

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49673 (= e!31974 (and (= (size!1769 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3230 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1769 _keys!1794)) (bvslt i!836 (size!1769 _keys!1794)) (bvslt (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(assert (= (and start!7878 res!28730) b!49673))

(declare-fun m!43055 () Bool)

(assert (=> start!7878 m!43055))

(declare-fun m!43057 () Bool)

(assert (=> start!7878 m!43057))

(push 1)

(assert (not start!7878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

