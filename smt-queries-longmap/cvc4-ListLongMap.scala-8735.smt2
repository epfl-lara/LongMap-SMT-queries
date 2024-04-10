; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105908 () Bool)

(assert start!105908)

(declare-fun b_free!27449 () Bool)

(declare-fun b_next!27449 () Bool)

(assert (=> start!105908 (= b_free!27449 (not b_next!27449))))

(declare-fun tp!95878 () Bool)

(declare-fun b_and!45357 () Bool)

(assert (=> start!105908 (= tp!95878 b_and!45357)))

(declare-fun b!1261462 () Bool)

(declare-fun e!717962 () Bool)

(assert (=> b!1261462 (= e!717962 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48499 0))(
  ( (V!48500 (val!16238 Int)) )
))
(declare-fun minValueAfter!43 () V!48499)

(declare-datatypes ((tuple2!21014 0))(
  ( (tuple2!21015 (_1!10518 (_ BitVec 64)) (_2!10518 V!48499)) )
))
(declare-datatypes ((List!28211 0))(
  ( (Nil!28208) (Cons!28207 (h!29416 tuple2!21014) (t!41710 List!28211)) )
))
(declare-datatypes ((ListLongMap!18887 0))(
  ( (ListLongMap!18888 (toList!9459 List!28211)) )
))
(declare-fun lt!571634 () ListLongMap!18887)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48499)

(declare-datatypes ((array!82316 0))(
  ( (array!82317 (arr!39711 (Array (_ BitVec 32) (_ BitVec 64))) (size!40247 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82316)

(declare-datatypes ((ValueCell!15412 0))(
  ( (ValueCellFull!15412 (v!18942 V!48499)) (EmptyCell!15412) )
))
(declare-datatypes ((array!82318 0))(
  ( (array!82319 (arr!39712 (Array (_ BitVec 32) ValueCell!15412)) (size!40248 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82318)

(declare-fun getCurrentListMapNoExtraKeys!5827 (array!82316 array!82318 (_ BitVec 32) (_ BitVec 32) V!48499 V!48499 (_ BitVec 32) Int) ListLongMap!18887)

(assert (=> b!1261462 (= lt!571634 (getCurrentListMapNoExtraKeys!5827 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!571635 () ListLongMap!18887)

(declare-fun minValueBefore!43 () V!48499)

(assert (=> b!1261462 (= lt!571635 (getCurrentListMapNoExtraKeys!5827 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261463 () Bool)

(declare-fun res!840588 () Bool)

(assert (=> b!1261463 (=> (not res!840588) (not e!717962))))

(assert (=> b!1261463 (= res!840588 (and (= (size!40248 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40247 _keys!1118) (size!40248 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261464 () Bool)

(declare-fun e!717965 () Bool)

(declare-fun tp_is_empty!32351 () Bool)

(assert (=> b!1261464 (= e!717965 tp_is_empty!32351)))

(declare-fun b!1261465 () Bool)

(declare-fun e!717961 () Bool)

(assert (=> b!1261465 (= e!717961 tp_is_empty!32351)))

(declare-fun b!1261466 () Bool)

(declare-fun res!840589 () Bool)

(assert (=> b!1261466 (=> (not res!840589) (not e!717962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82316 (_ BitVec 32)) Bool)

(assert (=> b!1261466 (= res!840589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!840586 () Bool)

(assert (=> start!105908 (=> (not res!840586) (not e!717962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105908 (= res!840586 (validMask!0 mask!1466))))

(assert (=> start!105908 e!717962))

(assert (=> start!105908 true))

(assert (=> start!105908 tp!95878))

(assert (=> start!105908 tp_is_empty!32351))

(declare-fun array_inv!30233 (array!82316) Bool)

(assert (=> start!105908 (array_inv!30233 _keys!1118)))

(declare-fun e!717964 () Bool)

(declare-fun array_inv!30234 (array!82318) Bool)

(assert (=> start!105908 (and (array_inv!30234 _values!914) e!717964)))

(declare-fun mapNonEmpty!50329 () Bool)

(declare-fun mapRes!50329 () Bool)

(declare-fun tp!95879 () Bool)

(assert (=> mapNonEmpty!50329 (= mapRes!50329 (and tp!95879 e!717961))))

(declare-fun mapValue!50329 () ValueCell!15412)

(declare-fun mapKey!50329 () (_ BitVec 32))

(declare-fun mapRest!50329 () (Array (_ BitVec 32) ValueCell!15412))

(assert (=> mapNonEmpty!50329 (= (arr!39712 _values!914) (store mapRest!50329 mapKey!50329 mapValue!50329))))

(declare-fun b!1261467 () Bool)

(assert (=> b!1261467 (= e!717964 (and e!717965 mapRes!50329))))

(declare-fun condMapEmpty!50329 () Bool)

(declare-fun mapDefault!50329 () ValueCell!15412)

