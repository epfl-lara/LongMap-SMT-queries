; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104782 () Bool)

(assert start!104782)

(declare-fun b_free!26587 () Bool)

(declare-fun b_next!26587 () Bool)

(assert (=> start!104782 (= b_free!26587 (not b_next!26587))))

(declare-fun tp!93251 () Bool)

(declare-fun b_and!44355 () Bool)

(assert (=> start!104782 (= tp!93251 b_and!44355)))

(declare-fun b!1249053 () Bool)

(declare-fun e!708862 () Bool)

(assert (=> b!1249053 (= e!708862 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47351 0))(
  ( (V!47352 (val!15807 Int)) )
))
(declare-datatypes ((tuple2!20360 0))(
  ( (tuple2!20361 (_1!10191 (_ BitVec 64)) (_2!10191 V!47351)) )
))
(declare-datatypes ((List!27607 0))(
  ( (Nil!27604) (Cons!27603 (h!28812 tuple2!20360) (t!41078 List!27607)) )
))
(declare-datatypes ((ListLongMap!18233 0))(
  ( (ListLongMap!18234 (toList!9132 List!27607)) )
))
(declare-fun lt!563589 () ListLongMap!18233)

(declare-fun minValueAfter!43 () V!47351)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47351)

(declare-datatypes ((array!80662 0))(
  ( (array!80663 (arr!38898 (Array (_ BitVec 32) (_ BitVec 64))) (size!39434 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80662)

(declare-datatypes ((ValueCell!14981 0))(
  ( (ValueCellFull!14981 (v!18503 V!47351)) (EmptyCell!14981) )
))
(declare-datatypes ((array!80664 0))(
  ( (array!80665 (arr!38899 (Array (_ BitVec 32) ValueCell!14981)) (size!39435 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80664)

(declare-fun getCurrentListMapNoExtraKeys!5539 (array!80662 array!80664 (_ BitVec 32) (_ BitVec 32) V!47351 V!47351 (_ BitVec 32) Int) ListLongMap!18233)

(assert (=> b!1249053 (= lt!563589 (getCurrentListMapNoExtraKeys!5539 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563590 () ListLongMap!18233)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47351)

(assert (=> b!1249053 (= lt!563590 (getCurrentListMapNoExtraKeys!5539 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!48994 () Bool)

(declare-fun mapRes!48994 () Bool)

(declare-fun tp!93250 () Bool)

(declare-fun e!708861 () Bool)

(assert (=> mapNonEmpty!48994 (= mapRes!48994 (and tp!93250 e!708861))))

(declare-fun mapKey!48994 () (_ BitVec 32))

(declare-fun mapRest!48994 () (Array (_ BitVec 32) ValueCell!14981))

(declare-fun mapValue!48994 () ValueCell!14981)

(assert (=> mapNonEmpty!48994 (= (arr!38899 _values!914) (store mapRest!48994 mapKey!48994 mapValue!48994))))

(declare-fun mapIsEmpty!48994 () Bool)

(assert (=> mapIsEmpty!48994 mapRes!48994))

(declare-fun b!1249054 () Bool)

(declare-fun res!833245 () Bool)

(assert (=> b!1249054 (=> (not res!833245) (not e!708862))))

(assert (=> b!1249054 (= res!833245 (and (= (size!39435 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39434 _keys!1118) (size!39435 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833247 () Bool)

(assert (=> start!104782 (=> (not res!833247) (not e!708862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104782 (= res!833247 (validMask!0 mask!1466))))

(assert (=> start!104782 e!708862))

(assert (=> start!104782 true))

(assert (=> start!104782 tp!93251))

(declare-fun tp_is_empty!31489 () Bool)

(assert (=> start!104782 tp_is_empty!31489))

(declare-fun array_inv!29685 (array!80662) Bool)

(assert (=> start!104782 (array_inv!29685 _keys!1118)))

(declare-fun e!708859 () Bool)

(declare-fun array_inv!29686 (array!80664) Bool)

(assert (=> start!104782 (and (array_inv!29686 _values!914) e!708859)))

(declare-fun b!1249055 () Bool)

(declare-fun res!833244 () Bool)

(assert (=> b!1249055 (=> (not res!833244) (not e!708862))))

(declare-datatypes ((List!27608 0))(
  ( (Nil!27605) (Cons!27604 (h!28813 (_ BitVec 64)) (t!41079 List!27608)) )
))
(declare-fun arrayNoDuplicates!0 (array!80662 (_ BitVec 32) List!27608) Bool)

(assert (=> b!1249055 (= res!833244 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27605))))

(declare-fun b!1249056 () Bool)

(declare-fun e!708858 () Bool)

(assert (=> b!1249056 (= e!708859 (and e!708858 mapRes!48994))))

(declare-fun condMapEmpty!48994 () Bool)

(declare-fun mapDefault!48994 () ValueCell!14981)

