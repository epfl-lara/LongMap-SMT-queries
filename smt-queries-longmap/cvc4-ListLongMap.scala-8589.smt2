; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104768 () Bool)

(assert start!104768)

(declare-fun b_free!26573 () Bool)

(declare-fun b_next!26573 () Bool)

(assert (=> start!104768 (= b_free!26573 (not b_next!26573))))

(declare-fun tp!93209 () Bool)

(declare-fun b_and!44341 () Bool)

(assert (=> start!104768 (= tp!93209 b_and!44341)))

(declare-fun b!1248906 () Bool)

(declare-fun e!708756 () Bool)

(declare-fun tp_is_empty!31475 () Bool)

(assert (=> b!1248906 (= e!708756 tp_is_empty!31475)))

(declare-fun mapIsEmpty!48973 () Bool)

(declare-fun mapRes!48973 () Bool)

(assert (=> mapIsEmpty!48973 mapRes!48973))

(declare-fun b!1248907 () Bool)

(declare-fun res!833160 () Bool)

(declare-fun e!708755 () Bool)

(assert (=> b!1248907 (=> (not res!833160) (not e!708755))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80636 0))(
  ( (array!80637 (arr!38885 (Array (_ BitVec 32) (_ BitVec 64))) (size!39421 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80636)

(declare-datatypes ((V!47331 0))(
  ( (V!47332 (val!15800 Int)) )
))
(declare-datatypes ((ValueCell!14974 0))(
  ( (ValueCellFull!14974 (v!18496 V!47331)) (EmptyCell!14974) )
))
(declare-datatypes ((array!80638 0))(
  ( (array!80639 (arr!38886 (Array (_ BitVec 32) ValueCell!14974)) (size!39422 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80638)

(assert (=> b!1248907 (= res!833160 (and (= (size!39422 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39421 _keys!1118) (size!39422 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!48973 () Bool)

(declare-fun tp!93208 () Bool)

(assert (=> mapNonEmpty!48973 (= mapRes!48973 (and tp!93208 e!708756))))

(declare-fun mapRest!48973 () (Array (_ BitVec 32) ValueCell!14974))

(declare-fun mapValue!48973 () ValueCell!14974)

(declare-fun mapKey!48973 () (_ BitVec 32))

(assert (=> mapNonEmpty!48973 (= (arr!38886 _values!914) (store mapRest!48973 mapKey!48973 mapValue!48973))))

(declare-fun b!1248908 () Bool)

(declare-fun res!833163 () Bool)

(assert (=> b!1248908 (=> (not res!833163) (not e!708755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80636 (_ BitVec 32)) Bool)

(assert (=> b!1248908 (= res!833163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833161 () Bool)

(assert (=> start!104768 (=> (not res!833161) (not e!708755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104768 (= res!833161 (validMask!0 mask!1466))))

(assert (=> start!104768 e!708755))

(assert (=> start!104768 true))

(assert (=> start!104768 tp!93209))

(assert (=> start!104768 tp_is_empty!31475))

(declare-fun array_inv!29673 (array!80636) Bool)

(assert (=> start!104768 (array_inv!29673 _keys!1118)))

(declare-fun e!708757 () Bool)

(declare-fun array_inv!29674 (array!80638) Bool)

(assert (=> start!104768 (and (array_inv!29674 _values!914) e!708757)))

(declare-fun b!1248909 () Bool)

(assert (=> b!1248909 (= e!708755 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47331)

(declare-datatypes ((tuple2!20348 0))(
  ( (tuple2!20349 (_1!10185 (_ BitVec 64)) (_2!10185 V!47331)) )
))
(declare-datatypes ((List!27595 0))(
  ( (Nil!27592) (Cons!27591 (h!28800 tuple2!20348) (t!41066 List!27595)) )
))
(declare-datatypes ((ListLongMap!18221 0))(
  ( (ListLongMap!18222 (toList!9126 List!27595)) )
))
(declare-fun lt!563547 () ListLongMap!18221)

(declare-fun minValueAfter!43 () V!47331)

(declare-fun getCurrentListMapNoExtraKeys!5533 (array!80636 array!80638 (_ BitVec 32) (_ BitVec 32) V!47331 V!47331 (_ BitVec 32) Int) ListLongMap!18221)

(assert (=> b!1248909 (= lt!563547 (getCurrentListMapNoExtraKeys!5533 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563548 () ListLongMap!18221)

(declare-fun minValueBefore!43 () V!47331)

(assert (=> b!1248909 (= lt!563548 (getCurrentListMapNoExtraKeys!5533 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248910 () Bool)

(declare-fun e!708754 () Bool)

(assert (=> b!1248910 (= e!708754 tp_is_empty!31475)))

(declare-fun b!1248911 () Bool)

(declare-fun res!833162 () Bool)

(assert (=> b!1248911 (=> (not res!833162) (not e!708755))))

(declare-datatypes ((List!27596 0))(
  ( (Nil!27593) (Cons!27592 (h!28801 (_ BitVec 64)) (t!41067 List!27596)) )
))
(declare-fun arrayNoDuplicates!0 (array!80636 (_ BitVec 32) List!27596) Bool)

(assert (=> b!1248911 (= res!833162 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27593))))

(declare-fun b!1248912 () Bool)

(assert (=> b!1248912 (= e!708757 (and e!708754 mapRes!48973))))

(declare-fun condMapEmpty!48973 () Bool)

(declare-fun mapDefault!48973 () ValueCell!14974)

