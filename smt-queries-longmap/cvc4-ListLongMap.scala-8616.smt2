; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104966 () Bool)

(assert start!104966)

(declare-fun b_free!26735 () Bool)

(declare-fun b_next!26735 () Bool)

(assert (=> start!104966 (= b_free!26735 (not b_next!26735))))

(declare-fun tp!93700 () Bool)

(declare-fun b_and!44521 () Bool)

(assert (=> start!104966 (= tp!93700 b_and!44521)))

(declare-fun b!1251072 () Bool)

(declare-fun e!710351 () Bool)

(declare-fun e!710346 () Bool)

(assert (=> b!1251072 (= e!710351 e!710346)))

(declare-fun res!834449 () Bool)

(assert (=> b!1251072 (=> res!834449 e!710346)))

(declare-datatypes ((V!47547 0))(
  ( (V!47548 (val!15881 Int)) )
))
(declare-datatypes ((tuple2!20468 0))(
  ( (tuple2!20469 (_1!10245 (_ BitVec 64)) (_2!10245 V!47547)) )
))
(declare-datatypes ((List!27704 0))(
  ( (Nil!27701) (Cons!27700 (h!28909 tuple2!20468) (t!41179 List!27704)) )
))
(declare-datatypes ((ListLongMap!18341 0))(
  ( (ListLongMap!18342 (toList!9186 List!27704)) )
))
(declare-fun lt!564619 () ListLongMap!18341)

(declare-fun contains!7499 (ListLongMap!18341 (_ BitVec 64)) Bool)

(assert (=> b!1251072 (= res!834449 (contains!7499 lt!564619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47547)

(declare-datatypes ((array!80938 0))(
  ( (array!80939 (arr!39034 (Array (_ BitVec 32) (_ BitVec 64))) (size!39570 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80938)

(declare-datatypes ((ValueCell!15055 0))(
  ( (ValueCellFull!15055 (v!18578 V!47547)) (EmptyCell!15055) )
))
(declare-datatypes ((array!80940 0))(
  ( (array!80941 (arr!39035 (Array (_ BitVec 32) ValueCell!15055)) (size!39571 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80940)

(declare-fun minValueBefore!43 () V!47547)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun getCurrentListMap!4459 (array!80938 array!80940 (_ BitVec 32) (_ BitVec 32) V!47547 V!47547 (_ BitVec 32) Int) ListLongMap!18341)

(assert (=> b!1251072 (= lt!564619 (getCurrentListMap!4459 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251073 () Bool)

(declare-fun e!710350 () Bool)

(assert (=> b!1251073 (= e!710350 (not e!710351))))

(declare-fun res!834450 () Bool)

(assert (=> b!1251073 (=> res!834450 e!710351)))

(assert (=> b!1251073 (= res!834450 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564617 () ListLongMap!18341)

(declare-fun lt!564620 () ListLongMap!18341)

(assert (=> b!1251073 (= lt!564617 lt!564620)))

(declare-datatypes ((Unit!41561 0))(
  ( (Unit!41562) )
))
(declare-fun lt!564621 () Unit!41561)

(declare-fun minValueAfter!43 () V!47547)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!949 (array!80938 array!80940 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47547 V!47547 V!47547 V!47547 (_ BitVec 32) Int) Unit!41561)

(assert (=> b!1251073 (= lt!564621 (lemmaNoChangeToArrayThenSameMapNoExtras!949 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5585 (array!80938 array!80940 (_ BitVec 32) (_ BitVec 32) V!47547 V!47547 (_ BitVec 32) Int) ListLongMap!18341)

(assert (=> b!1251073 (= lt!564620 (getCurrentListMapNoExtraKeys!5585 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251073 (= lt!564617 (getCurrentListMapNoExtraKeys!5585 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251074 () Bool)

(assert (=> b!1251074 (= e!710346 true)))

(declare-fun -!2009 (ListLongMap!18341 (_ BitVec 64)) ListLongMap!18341)

(assert (=> b!1251074 (= (-!2009 lt!564619 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564619)))

(declare-fun lt!564618 () Unit!41561)

(declare-fun removeNotPresentStillSame!104 (ListLongMap!18341 (_ BitVec 64)) Unit!41561)

(assert (=> b!1251074 (= lt!564618 (removeNotPresentStillSame!104 lt!564619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251075 () Bool)

(declare-fun res!834448 () Bool)

(assert (=> b!1251075 (=> (not res!834448) (not e!710350))))

(assert (=> b!1251075 (= res!834448 (and (= (size!39571 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39570 _keys!1118) (size!39571 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49222 () Bool)

(declare-fun mapRes!49222 () Bool)

(assert (=> mapIsEmpty!49222 mapRes!49222))

(declare-fun b!1251076 () Bool)

(declare-fun e!710352 () Bool)

(declare-fun tp_is_empty!31637 () Bool)

(assert (=> b!1251076 (= e!710352 tp_is_empty!31637)))

(declare-fun b!1251077 () Bool)

(declare-fun res!834452 () Bool)

(assert (=> b!1251077 (=> (not res!834452) (not e!710350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80938 (_ BitVec 32)) Bool)

(assert (=> b!1251077 (= res!834452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49222 () Bool)

(declare-fun tp!93701 () Bool)

(declare-fun e!710348 () Bool)

(assert (=> mapNonEmpty!49222 (= mapRes!49222 (and tp!93701 e!710348))))

(declare-fun mapValue!49222 () ValueCell!15055)

(declare-fun mapRest!49222 () (Array (_ BitVec 32) ValueCell!15055))

(declare-fun mapKey!49222 () (_ BitVec 32))

(assert (=> mapNonEmpty!49222 (= (arr!39035 _values!914) (store mapRest!49222 mapKey!49222 mapValue!49222))))

(declare-fun res!834447 () Bool)

(assert (=> start!104966 (=> (not res!834447) (not e!710350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104966 (= res!834447 (validMask!0 mask!1466))))

(assert (=> start!104966 e!710350))

(assert (=> start!104966 true))

(assert (=> start!104966 tp!93700))

(assert (=> start!104966 tp_is_empty!31637))

(declare-fun array_inv!29775 (array!80938) Bool)

(assert (=> start!104966 (array_inv!29775 _keys!1118)))

(declare-fun e!710347 () Bool)

(declare-fun array_inv!29776 (array!80940) Bool)

(assert (=> start!104966 (and (array_inv!29776 _values!914) e!710347)))

(declare-fun b!1251078 () Bool)

(assert (=> b!1251078 (= e!710347 (and e!710352 mapRes!49222))))

(declare-fun condMapEmpty!49222 () Bool)

(declare-fun mapDefault!49222 () ValueCell!15055)

