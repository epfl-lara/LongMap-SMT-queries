; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105928 () Bool)

(assert start!105928)

(declare-fun b_free!27457 () Bool)

(declare-fun b_next!27457 () Bool)

(assert (=> start!105928 (= b_free!27457 (not b_next!27457))))

(declare-fun tp!95906 () Bool)

(declare-fun b_and!45373 () Bool)

(assert (=> start!105928 (= tp!95906 b_and!45373)))

(declare-fun mapIsEmpty!50344 () Bool)

(declare-fun mapRes!50344 () Bool)

(assert (=> mapIsEmpty!50344 mapRes!50344))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun b!1261633 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun e!718078 () Bool)

(declare-datatypes ((V!48511 0))(
  ( (V!48512 (val!16242 Int)) )
))
(declare-fun zeroValue!871 () V!48511)

(declare-datatypes ((array!82334 0))(
  ( (array!82335 (arr!39719 (Array (_ BitVec 32) (_ BitVec 64))) (size!40255 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82334)

(declare-datatypes ((ValueCell!15416 0))(
  ( (ValueCellFull!15416 (v!18946 V!48511)) (EmptyCell!15416) )
))
(declare-datatypes ((array!82336 0))(
  ( (array!82337 (arr!39720 (Array (_ BitVec 32) ValueCell!15416)) (size!40256 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82336)

(declare-fun minValueBefore!43 () V!48511)

(declare-datatypes ((tuple2!21018 0))(
  ( (tuple2!21019 (_1!10520 (_ BitVec 64)) (_2!10520 V!48511)) )
))
(declare-datatypes ((List!28214 0))(
  ( (Nil!28211) (Cons!28210 (h!29419 tuple2!21018) (t!41715 List!28214)) )
))
(declare-datatypes ((ListLongMap!18891 0))(
  ( (ListLongMap!18892 (toList!9461 List!28214)) )
))
(declare-fun contains!7581 (ListLongMap!18891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4631 (array!82334 array!82336 (_ BitVec 32) (_ BitVec 32) V!48511 V!48511 (_ BitVec 32) Int) ListLongMap!18891)

(assert (=> b!1261633 (= e!718078 (not (contains!7581 (getCurrentListMap!4631 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50344 () Bool)

(declare-fun tp!95905 () Bool)

(declare-fun e!718083 () Bool)

(assert (=> mapNonEmpty!50344 (= mapRes!50344 (and tp!95905 e!718083))))

(declare-fun mapRest!50344 () (Array (_ BitVec 32) ValueCell!15416))

(declare-fun mapValue!50344 () ValueCell!15416)

(declare-fun mapKey!50344 () (_ BitVec 32))

(assert (=> mapNonEmpty!50344 (= (arr!39720 _values!914) (store mapRest!50344 mapKey!50344 mapValue!50344))))

(declare-fun b!1261634 () Bool)

(declare-fun res!840667 () Bool)

(declare-fun e!718081 () Bool)

(assert (=> b!1261634 (=> (not res!840667) (not e!718081))))

(declare-datatypes ((List!28215 0))(
  ( (Nil!28212) (Cons!28211 (h!29420 (_ BitVec 64)) (t!41716 List!28215)) )
))
(declare-fun arrayNoDuplicates!0 (array!82334 (_ BitVec 32) List!28215) Bool)

(assert (=> b!1261634 (= res!840667 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28212))))

(declare-fun b!1261635 () Bool)

(declare-fun e!718082 () Bool)

(declare-fun e!718080 () Bool)

(assert (=> b!1261635 (= e!718082 (and e!718080 mapRes!50344))))

(declare-fun condMapEmpty!50344 () Bool)

(declare-fun mapDefault!50344 () ValueCell!15416)

