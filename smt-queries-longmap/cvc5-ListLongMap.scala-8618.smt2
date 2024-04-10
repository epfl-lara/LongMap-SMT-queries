; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104974 () Bool)

(assert start!104974)

(declare-fun b_free!26743 () Bool)

(declare-fun b_next!26743 () Bool)

(assert (=> start!104974 (= b_free!26743 (not b_next!26743))))

(declare-fun tp!93724 () Bool)

(declare-fun b_and!44529 () Bool)

(assert (=> start!104974 (= tp!93724 b_and!44529)))

(declare-fun b!1251180 () Bool)

(declare-fun e!710430 () Bool)

(declare-fun tp_is_empty!31645 () Bool)

(assert (=> b!1251180 (= e!710430 tp_is_empty!31645)))

(declare-fun b!1251181 () Bool)

(declare-fun res!834519 () Bool)

(declare-fun e!710434 () Bool)

(assert (=> b!1251181 (=> (not res!834519) (not e!710434))))

(declare-datatypes ((array!80954 0))(
  ( (array!80955 (arr!39042 (Array (_ BitVec 32) (_ BitVec 64))) (size!39578 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80954)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80954 (_ BitVec 32)) Bool)

(assert (=> b!1251181 (= res!834519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251182 () Bool)

(declare-fun e!710432 () Bool)

(assert (=> b!1251182 (= e!710434 (not e!710432))))

(declare-fun res!834521 () Bool)

(assert (=> b!1251182 (=> res!834521 e!710432)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251182 (= res!834521 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47559 0))(
  ( (V!47560 (val!15885 Int)) )
))
(declare-datatypes ((tuple2!20476 0))(
  ( (tuple2!20477 (_1!10249 (_ BitVec 64)) (_2!10249 V!47559)) )
))
(declare-datatypes ((List!27710 0))(
  ( (Nil!27707) (Cons!27706 (h!28915 tuple2!20476) (t!41185 List!27710)) )
))
(declare-datatypes ((ListLongMap!18349 0))(
  ( (ListLongMap!18350 (toList!9190 List!27710)) )
))
(declare-fun lt!564680 () ListLongMap!18349)

(declare-fun lt!564679 () ListLongMap!18349)

(assert (=> b!1251182 (= lt!564680 lt!564679)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47559)

(declare-datatypes ((Unit!41569 0))(
  ( (Unit!41570) )
))
(declare-fun lt!564678 () Unit!41569)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47559)

(declare-datatypes ((ValueCell!15059 0))(
  ( (ValueCellFull!15059 (v!18582 V!47559)) (EmptyCell!15059) )
))
(declare-datatypes ((array!80956 0))(
  ( (array!80957 (arr!39043 (Array (_ BitVec 32) ValueCell!15059)) (size!39579 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80956)

(declare-fun minValueBefore!43 () V!47559)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!953 (array!80954 array!80956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47559 V!47559 V!47559 V!47559 (_ BitVec 32) Int) Unit!41569)

(assert (=> b!1251182 (= lt!564678 (lemmaNoChangeToArrayThenSameMapNoExtras!953 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5589 (array!80954 array!80956 (_ BitVec 32) (_ BitVec 32) V!47559 V!47559 (_ BitVec 32) Int) ListLongMap!18349)

(assert (=> b!1251182 (= lt!564679 (getCurrentListMapNoExtraKeys!5589 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251182 (= lt!564680 (getCurrentListMapNoExtraKeys!5589 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251184 () Bool)

(declare-fun e!710435 () Bool)

(assert (=> b!1251184 (= e!710432 e!710435)))

(declare-fun res!834522 () Bool)

(assert (=> b!1251184 (=> res!834522 e!710435)))

(declare-fun lt!564677 () ListLongMap!18349)

(declare-fun contains!7502 (ListLongMap!18349 (_ BitVec 64)) Bool)

(assert (=> b!1251184 (= res!834522 (contains!7502 lt!564677 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4462 (array!80954 array!80956 (_ BitVec 32) (_ BitVec 32) V!47559 V!47559 (_ BitVec 32) Int) ListLongMap!18349)

(assert (=> b!1251184 (= lt!564677 (getCurrentListMap!4462 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251185 () Bool)

(declare-fun e!710431 () Bool)

(assert (=> b!1251185 (= e!710431 tp_is_empty!31645)))

(declare-fun b!1251186 () Bool)

(declare-fun res!834524 () Bool)

(assert (=> b!1251186 (=> (not res!834524) (not e!710434))))

(declare-datatypes ((List!27711 0))(
  ( (Nil!27708) (Cons!27707 (h!28916 (_ BitVec 64)) (t!41186 List!27711)) )
))
(declare-fun arrayNoDuplicates!0 (array!80954 (_ BitVec 32) List!27711) Bool)

(assert (=> b!1251186 (= res!834524 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27708))))

(declare-fun b!1251187 () Bool)

(declare-fun res!834523 () Bool)

(assert (=> b!1251187 (=> (not res!834523) (not e!710434))))

(assert (=> b!1251187 (= res!834523 (and (= (size!39579 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39578 _keys!1118) (size!39579 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251188 () Bool)

(assert (=> b!1251188 (= e!710435 true)))

(declare-fun -!2012 (ListLongMap!18349 (_ BitVec 64)) ListLongMap!18349)

(assert (=> b!1251188 (= (-!2012 lt!564677 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564677)))

(declare-fun lt!564681 () Unit!41569)

(declare-fun removeNotPresentStillSame!107 (ListLongMap!18349 (_ BitVec 64)) Unit!41569)

(assert (=> b!1251188 (= lt!564681 (removeNotPresentStillSame!107 lt!564677 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!834520 () Bool)

(assert (=> start!104974 (=> (not res!834520) (not e!710434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104974 (= res!834520 (validMask!0 mask!1466))))

(assert (=> start!104974 e!710434))

(assert (=> start!104974 true))

(assert (=> start!104974 tp!93724))

(assert (=> start!104974 tp_is_empty!31645))

(declare-fun array_inv!29783 (array!80954) Bool)

(assert (=> start!104974 (array_inv!29783 _keys!1118)))

(declare-fun e!710436 () Bool)

(declare-fun array_inv!29784 (array!80956) Bool)

(assert (=> start!104974 (and (array_inv!29784 _values!914) e!710436)))

(declare-fun b!1251183 () Bool)

(declare-fun mapRes!49234 () Bool)

(assert (=> b!1251183 (= e!710436 (and e!710430 mapRes!49234))))

(declare-fun condMapEmpty!49234 () Bool)

(declare-fun mapDefault!49234 () ValueCell!15059)

