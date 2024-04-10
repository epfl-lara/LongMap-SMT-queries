; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105002 () Bool)

(assert start!105002)

(declare-fun b_free!26771 () Bool)

(declare-fun b_next!26771 () Bool)

(assert (=> start!105002 (= b_free!26771 (not b_next!26771))))

(declare-fun tp!93808 () Bool)

(declare-fun b_and!44557 () Bool)

(assert (=> start!105002 (= tp!93808 b_and!44557)))

(declare-fun mapNonEmpty!49276 () Bool)

(declare-fun mapRes!49276 () Bool)

(declare-fun tp!93809 () Bool)

(declare-fun e!710724 () Bool)

(assert (=> mapNonEmpty!49276 (= mapRes!49276 (and tp!93809 e!710724))))

(declare-datatypes ((V!47595 0))(
  ( (V!47596 (val!15899 Int)) )
))
(declare-datatypes ((ValueCell!15073 0))(
  ( (ValueCellFull!15073 (v!18596 V!47595)) (EmptyCell!15073) )
))
(declare-fun mapRest!49276 () (Array (_ BitVec 32) ValueCell!15073))

(declare-fun mapKey!49276 () (_ BitVec 32))

(declare-fun mapValue!49276 () ValueCell!15073)

(declare-datatypes ((array!81010 0))(
  ( (array!81011 (arr!39070 (Array (_ BitVec 32) ValueCell!15073)) (size!39606 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81010)

(assert (=> mapNonEmpty!49276 (= (arr!39070 _values!914) (store mapRest!49276 mapKey!49276 mapValue!49276))))

(declare-fun b!1251558 () Bool)

(declare-fun e!710727 () Bool)

(declare-fun e!710726 () Bool)

(assert (=> b!1251558 (= e!710727 (not e!710726))))

(declare-fun res!834775 () Bool)

(assert (=> b!1251558 (=> res!834775 e!710726)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251558 (= res!834775 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20502 0))(
  ( (tuple2!20503 (_1!10262 (_ BitVec 64)) (_2!10262 V!47595)) )
))
(declare-datatypes ((List!27734 0))(
  ( (Nil!27731) (Cons!27730 (h!28939 tuple2!20502) (t!41209 List!27734)) )
))
(declare-datatypes ((ListLongMap!18375 0))(
  ( (ListLongMap!18376 (toList!9203 List!27734)) )
))
(declare-fun lt!564887 () ListLongMap!18375)

(declare-fun lt!564889 () ListLongMap!18375)

(assert (=> b!1251558 (= lt!564887 lt!564889)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41593 0))(
  ( (Unit!41594) )
))
(declare-fun lt!564890 () Unit!41593)

(declare-fun minValueAfter!43 () V!47595)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47595)

(declare-datatypes ((array!81012 0))(
  ( (array!81013 (arr!39071 (Array (_ BitVec 32) (_ BitVec 64))) (size!39607 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81012)

(declare-fun minValueBefore!43 () V!47595)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!963 (array!81012 array!81010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47595 V!47595 V!47595 V!47595 (_ BitVec 32) Int) Unit!41593)

(assert (=> b!1251558 (= lt!564890 (lemmaNoChangeToArrayThenSameMapNoExtras!963 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5599 (array!81012 array!81010 (_ BitVec 32) (_ BitVec 32) V!47595 V!47595 (_ BitVec 32) Int) ListLongMap!18375)

(assert (=> b!1251558 (= lt!564889 (getCurrentListMapNoExtraKeys!5599 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251558 (= lt!564887 (getCurrentListMapNoExtraKeys!5599 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251560 () Bool)

(declare-fun tp_is_empty!31673 () Bool)

(assert (=> b!1251560 (= e!710724 tp_is_empty!31673)))

(declare-fun b!1251561 () Bool)

(declare-fun e!710728 () Bool)

(assert (=> b!1251561 (= e!710726 e!710728)))

(declare-fun res!834772 () Bool)

(assert (=> b!1251561 (=> res!834772 e!710728)))

(declare-fun lt!564891 () ListLongMap!18375)

(declare-fun contains!7511 (ListLongMap!18375 (_ BitVec 64)) Bool)

(assert (=> b!1251561 (= res!834772 (contains!7511 lt!564891 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4471 (array!81012 array!81010 (_ BitVec 32) (_ BitVec 32) V!47595 V!47595 (_ BitVec 32) Int) ListLongMap!18375)

(assert (=> b!1251561 (= lt!564891 (getCurrentListMap!4471 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251562 () Bool)

(declare-fun e!710729 () Bool)

(assert (=> b!1251562 (= e!710729 tp_is_empty!31673)))

(declare-fun b!1251563 () Bool)

(declare-fun res!834773 () Bool)

(assert (=> b!1251563 (=> (not res!834773) (not e!710727))))

(assert (=> b!1251563 (= res!834773 (and (= (size!39606 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39607 _keys!1118) (size!39606 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251564 () Bool)

(declare-fun e!710730 () Bool)

(assert (=> b!1251564 (= e!710730 (and e!710729 mapRes!49276))))

(declare-fun condMapEmpty!49276 () Bool)

(declare-fun mapDefault!49276 () ValueCell!15073)

