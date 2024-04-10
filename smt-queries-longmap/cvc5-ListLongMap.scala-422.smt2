; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7858 () Bool)

(assert start!7858)

(declare-fun res!28715 () Bool)

(declare-fun e!31944 () Bool)

(assert (=> start!7858 (=> (not res!28715) (not e!31944))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7858 (= res!28715 (validMask!0 mask!2234))))

(assert (=> start!7858 e!31944))

(assert (=> start!7858 true))

(declare-datatypes ((array!3217 0))(
  ( (array!3218 (arr!1542 (Array (_ BitVec 32) (_ BitVec 64))) (size!1764 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3217)

(declare-fun array_inv!938 (array!3217) Bool)

(assert (=> start!7858 (array_inv!938 _keys!1794)))

(declare-fun b!49658 () Bool)

(assert (=> b!49658 (= e!31944 (and (= (size!1764 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (bvslt (bvadd #b00000000000000000000000000000001 mask!2234) #b00000000000000000000000000000000)))))

(assert (= (and start!7858 res!28715) b!49658))

(declare-fun m!43035 () Bool)

(assert (=> start!7858 m!43035))

(declare-fun m!43037 () Bool)

(assert (=> start!7858 m!43037))

(push 1)

(assert (not start!7858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9955 () Bool)

