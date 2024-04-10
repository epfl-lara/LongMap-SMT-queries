; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81978 () Bool)

(assert start!81978)

(declare-fun mapIsEmpty!33487 () Bool)

(declare-fun mapRes!33487 () Bool)

(assert (=> mapIsEmpty!33487 mapRes!33487))

(declare-fun b!956185 () Bool)

(declare-fun res!640274 () Bool)

(declare-fun e!538734 () Bool)

(assert (=> b!956185 (=> (not res!640274) (not e!538734))))

(declare-datatypes ((array!58133 0))(
  ( (array!58134 (arr!27946 (Array (_ BitVec 32) (_ BitVec 64))) (size!28425 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58133)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58133 (_ BitVec 32)) Bool)

(assert (=> b!956185 (= res!640274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956186 () Bool)

(declare-fun e!538735 () Bool)

(declare-fun tp_is_empty!21017 () Bool)

(assert (=> b!956186 (= e!538735 tp_is_empty!21017)))

(declare-fun b!956187 () Bool)

(declare-fun res!640275 () Bool)

(assert (=> b!956187 (=> (not res!640275) (not e!538734))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33005 0))(
  ( (V!33006 (val!10559 Int)) )
))
(declare-datatypes ((ValueCell!10027 0))(
  ( (ValueCellFull!10027 (v!13114 V!33005)) (EmptyCell!10027) )
))
(declare-datatypes ((array!58135 0))(
  ( (array!58136 (arr!27947 (Array (_ BitVec 32) ValueCell!10027)) (size!28426 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58135)

(assert (=> b!956187 (= res!640275 (and (= (size!28426 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28425 _keys!1441) (size!28426 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!640273 () Bool)

(assert (=> start!81978 (=> (not res!640273) (not e!538734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81978 (= res!640273 (validMask!0 mask!1823))))

(assert (=> start!81978 e!538734))

(assert (=> start!81978 true))

(declare-fun e!538738 () Bool)

(declare-fun array_inv!21685 (array!58135) Bool)

(assert (=> start!81978 (and (array_inv!21685 _values!1197) e!538738)))

(declare-fun array_inv!21686 (array!58133) Bool)

(assert (=> start!81978 (array_inv!21686 _keys!1441)))

(declare-fun b!956188 () Bool)

(declare-fun e!538736 () Bool)

(assert (=> b!956188 (= e!538736 tp_is_empty!21017)))

(declare-fun b!956189 () Bool)

(assert (=> b!956189 (= e!538738 (and e!538735 mapRes!33487))))

(declare-fun condMapEmpty!33487 () Bool)

(declare-fun mapDefault!33487 () ValueCell!10027)

