; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104668 () Bool)

(assert start!104668)

(declare-fun b_free!26485 () Bool)

(declare-fun b_next!26485 () Bool)

(assert (=> start!104668 (= b_free!26485 (not b_next!26485))))

(declare-fun tp!92941 () Bool)

(declare-fun b_and!44249 () Bool)

(assert (=> start!104668 (= tp!92941 b_and!44249)))

(declare-fun mapIsEmpty!48838 () Bool)

(declare-fun mapRes!48838 () Bool)

(assert (=> mapIsEmpty!48838 mapRes!48838))

(declare-fun b!1247909 () Bool)

(declare-fun e!708046 () Bool)

(assert (=> b!1247909 (= e!708046 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!47215 0))(
  ( (V!47216 (val!15756 Int)) )
))
(declare-fun zeroValue!871 () V!47215)

(declare-datatypes ((array!80468 0))(
  ( (array!80469 (arr!38802 (Array (_ BitVec 32) (_ BitVec 64))) (size!39338 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80468)

(declare-datatypes ((ValueCell!14930 0))(
  ( (ValueCellFull!14930 (v!18452 V!47215)) (EmptyCell!14930) )
))
(declare-datatypes ((array!80470 0))(
  ( (array!80471 (arr!38803 (Array (_ BitVec 32) ValueCell!14930)) (size!39339 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80470)

(declare-datatypes ((tuple2!20294 0))(
  ( (tuple2!20295 (_1!10158 (_ BitVec 64)) (_2!10158 V!47215)) )
))
(declare-datatypes ((List!27541 0))(
  ( (Nil!27538) (Cons!27537 (h!28746 tuple2!20294) (t!41010 List!27541)) )
))
(declare-datatypes ((ListLongMap!18167 0))(
  ( (ListLongMap!18168 (toList!9099 List!27541)) )
))
(declare-fun lt!563332 () ListLongMap!18167)

(declare-fun minValueBefore!43 () V!47215)

(declare-fun getCurrentListMapNoExtraKeys!5506 (array!80468 array!80470 (_ BitVec 32) (_ BitVec 32) V!47215 V!47215 (_ BitVec 32) Int) ListLongMap!18167)

(assert (=> b!1247909 (= lt!563332 (getCurrentListMapNoExtraKeys!5506 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1247910 () Bool)

(declare-fun res!832605 () Bool)

(assert (=> b!1247910 (=> (not res!832605) (not e!708046))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247910 (= res!832605 (and (= (size!39339 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39338 _keys!1118) (size!39339 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247911 () Bool)

(declare-fun res!832607 () Bool)

(assert (=> b!1247911 (=> (not res!832607) (not e!708046))))

(declare-datatypes ((List!27542 0))(
  ( (Nil!27539) (Cons!27538 (h!28747 (_ BitVec 64)) (t!41011 List!27542)) )
))
(declare-fun arrayNoDuplicates!0 (array!80468 (_ BitVec 32) List!27542) Bool)

(assert (=> b!1247911 (= res!832607 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27539))))

(declare-fun res!832608 () Bool)

(assert (=> start!104668 (=> (not res!832608) (not e!708046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104668 (= res!832608 (validMask!0 mask!1466))))

(assert (=> start!104668 e!708046))

(assert (=> start!104668 true))

(assert (=> start!104668 tp!92941))

(declare-fun tp_is_empty!31387 () Bool)

(assert (=> start!104668 tp_is_empty!31387))

(declare-fun array_inv!29623 (array!80468) Bool)

(assert (=> start!104668 (array_inv!29623 _keys!1118)))

(declare-fun e!708047 () Bool)

(declare-fun array_inv!29624 (array!80470) Bool)

(assert (=> start!104668 (and (array_inv!29624 _values!914) e!708047)))

(declare-fun b!1247912 () Bool)

(declare-fun e!708045 () Bool)

(assert (=> b!1247912 (= e!708045 tp_is_empty!31387)))

(declare-fun mapNonEmpty!48838 () Bool)

(declare-fun tp!92942 () Bool)

(assert (=> mapNonEmpty!48838 (= mapRes!48838 (and tp!92942 e!708045))))

(declare-fun mapKey!48838 () (_ BitVec 32))

(declare-fun mapRest!48838 () (Array (_ BitVec 32) ValueCell!14930))

(declare-fun mapValue!48838 () ValueCell!14930)

(assert (=> mapNonEmpty!48838 (= (arr!38803 _values!914) (store mapRest!48838 mapKey!48838 mapValue!48838))))

(declare-fun b!1247913 () Bool)

(declare-fun res!832606 () Bool)

(assert (=> b!1247913 (=> (not res!832606) (not e!708046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80468 (_ BitVec 32)) Bool)

(assert (=> b!1247913 (= res!832606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247914 () Bool)

(declare-fun e!708048 () Bool)

(assert (=> b!1247914 (= e!708047 (and e!708048 mapRes!48838))))

(declare-fun condMapEmpty!48838 () Bool)

(declare-fun mapDefault!48838 () ValueCell!14930)

