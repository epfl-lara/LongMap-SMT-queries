; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81962 () Bool)

(assert start!81962)

(declare-fun b!956041 () Bool)

(declare-fun e!538615 () Bool)

(declare-fun tp_is_empty!21001 () Bool)

(assert (=> b!956041 (= e!538615 tp_is_empty!21001)))

(declare-fun res!640201 () Bool)

(declare-fun e!538618 () Bool)

(assert (=> start!81962 (=> (not res!640201) (not e!538618))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81962 (= res!640201 (validMask!0 mask!1823))))

(assert (=> start!81962 e!538618))

(assert (=> start!81962 true))

(declare-datatypes ((V!32985 0))(
  ( (V!32986 (val!10551 Int)) )
))
(declare-datatypes ((ValueCell!10019 0))(
  ( (ValueCellFull!10019 (v!13106 V!32985)) (EmptyCell!10019) )
))
(declare-datatypes ((array!58101 0))(
  ( (array!58102 (arr!27930 (Array (_ BitVec 32) ValueCell!10019)) (size!28409 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58101)

(declare-fun e!538617 () Bool)

(declare-fun array_inv!21673 (array!58101) Bool)

(assert (=> start!81962 (and (array_inv!21673 _values!1197) e!538617)))

(declare-datatypes ((array!58103 0))(
  ( (array!58104 (arr!27931 (Array (_ BitVec 32) (_ BitVec 64))) (size!28410 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58103)

(declare-fun array_inv!21674 (array!58103) Bool)

(assert (=> start!81962 (array_inv!21674 _keys!1441)))

(declare-fun mapIsEmpty!33463 () Bool)

(declare-fun mapRes!33463 () Bool)

(assert (=> mapIsEmpty!33463 mapRes!33463))

(declare-fun b!956042 () Bool)

(declare-fun e!538614 () Bool)

(assert (=> b!956042 (= e!538617 (and e!538614 mapRes!33463))))

(declare-fun condMapEmpty!33463 () Bool)

(declare-fun mapDefault!33463 () ValueCell!10019)

