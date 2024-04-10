; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105932 () Bool)

(assert start!105932)

(declare-fun b_free!27461 () Bool)

(declare-fun b_next!27461 () Bool)

(assert (=> start!105932 (= b_free!27461 (not b_next!27461))))

(declare-fun tp!95917 () Bool)

(declare-fun b_and!45377 () Bool)

(assert (=> start!105932 (= tp!95917 b_and!45377)))

(declare-fun mapNonEmpty!50350 () Bool)

(declare-fun mapRes!50350 () Bool)

(declare-fun tp!95918 () Bool)

(declare-fun e!718118 () Bool)

(assert (=> mapNonEmpty!50350 (= mapRes!50350 (and tp!95918 e!718118))))

(declare-datatypes ((V!48515 0))(
  ( (V!48516 (val!16244 Int)) )
))
(declare-datatypes ((ValueCell!15418 0))(
  ( (ValueCellFull!15418 (v!18948 V!48515)) (EmptyCell!15418) )
))
(declare-fun mapValue!50350 () ValueCell!15418)

(declare-fun mapRest!50350 () (Array (_ BitVec 32) ValueCell!15418))

(declare-datatypes ((array!82342 0))(
  ( (array!82343 (arr!39723 (Array (_ BitVec 32) ValueCell!15418)) (size!40259 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82342)

(declare-fun mapKey!50350 () (_ BitVec 32))

(assert (=> mapNonEmpty!50350 (= (arr!39723 _values!914) (store mapRest!50350 mapKey!50350 mapValue!50350))))

(declare-fun mapIsEmpty!50350 () Bool)

(assert (=> mapIsEmpty!50350 mapRes!50350))

(declare-fun res!840698 () Bool)

(declare-fun e!718114 () Bool)

(assert (=> start!105932 (=> (not res!840698) (not e!718114))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105932 (= res!840698 (validMask!0 mask!1466))))

(assert (=> start!105932 e!718114))

(assert (=> start!105932 true))

(assert (=> start!105932 tp!95917))

(declare-fun tp_is_empty!32363 () Bool)

(assert (=> start!105932 tp_is_empty!32363))

(declare-datatypes ((array!82344 0))(
  ( (array!82345 (arr!39724 (Array (_ BitVec 32) (_ BitVec 64))) (size!40260 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82344)

(declare-fun array_inv!30239 (array!82344) Bool)

(assert (=> start!105932 (array_inv!30239 _keys!1118)))

(declare-fun e!718116 () Bool)

(declare-fun array_inv!30240 (array!82342) Bool)

(assert (=> start!105932 (and (array_inv!30240 _values!914) e!718116)))

(declare-fun defaultEntry!922 () Int)

(declare-fun b!1261681 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48515)

(declare-fun e!718115 () Bool)

(declare-fun minValueBefore!43 () V!48515)

(declare-datatypes ((tuple2!21022 0))(
  ( (tuple2!21023 (_1!10522 (_ BitVec 64)) (_2!10522 V!48515)) )
))
(declare-datatypes ((List!28218 0))(
  ( (Nil!28215) (Cons!28214 (h!29423 tuple2!21022) (t!41719 List!28218)) )
))
(declare-datatypes ((ListLongMap!18895 0))(
  ( (ListLongMap!18896 (toList!9463 List!28218)) )
))
(declare-fun contains!7583 (ListLongMap!18895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4633 (array!82344 array!82342 (_ BitVec 32) (_ BitVec 32) V!48515 V!48515 (_ BitVec 32) Int) ListLongMap!18895)

(assert (=> b!1261681 (= e!718115 (not (contains!7583 (getCurrentListMap!4633 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261682 () Bool)

(declare-fun res!840699 () Bool)

(assert (=> b!1261682 (=> (not res!840699) (not e!718114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82344 (_ BitVec 32)) Bool)

(assert (=> b!1261682 (= res!840699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261683 () Bool)

(declare-fun e!718119 () Bool)

(assert (=> b!1261683 (= e!718116 (and e!718119 mapRes!50350))))

(declare-fun condMapEmpty!50350 () Bool)

(declare-fun mapDefault!50350 () ValueCell!15418)

