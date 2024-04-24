; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104892 () Bool)

(assert start!104892)

(declare-fun b_free!26485 () Bool)

(declare-fun b_next!26485 () Bool)

(assert (=> start!104892 (= b_free!26485 (not b_next!26485))))

(declare-fun tp!92941 () Bool)

(declare-fun b_and!44251 () Bool)

(assert (=> start!104892 (= tp!92941 b_and!44251)))

(declare-fun b!1249214 () Bool)

(declare-fun e!708893 () Bool)

(assert (=> b!1249214 (= e!708893 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!47215 0))(
  ( (V!47216 (val!15756 Int)) )
))
(declare-fun zeroValue!871 () V!47215)

(declare-datatypes ((array!80499 0))(
  ( (array!80500 (arr!38813 (Array (_ BitVec 32) (_ BitVec 64))) (size!39350 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80499)

(declare-datatypes ((ValueCell!14930 0))(
  ( (ValueCellFull!14930 (v!18448 V!47215)) (EmptyCell!14930) )
))
(declare-datatypes ((array!80501 0))(
  ( (array!80502 (arr!38814 (Array (_ BitVec 32) ValueCell!14930)) (size!39351 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80501)

(declare-datatypes ((tuple2!20310 0))(
  ( (tuple2!20311 (_1!10166 (_ BitVec 64)) (_2!10166 V!47215)) )
))
(declare-datatypes ((List!27566 0))(
  ( (Nil!27563) (Cons!27562 (h!28780 tuple2!20310) (t!41027 List!27566)) )
))
(declare-datatypes ((ListLongMap!18191 0))(
  ( (ListLongMap!18192 (toList!9111 List!27566)) )
))
(declare-fun lt!563816 () ListLongMap!18191)

(declare-fun minValueBefore!43 () V!47215)

(declare-fun getCurrentListMapNoExtraKeys!5546 (array!80499 array!80501 (_ BitVec 32) (_ BitVec 32) V!47215 V!47215 (_ BitVec 32) Int) ListLongMap!18191)

(assert (=> b!1249214 (= lt!563816 (getCurrentListMapNoExtraKeys!5546 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249215 () Bool)

(declare-fun res!833126 () Bool)

(assert (=> b!1249215 (=> (not res!833126) (not e!708893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80499 (_ BitVec 32)) Bool)

(assert (=> b!1249215 (= res!833126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249216 () Bool)

(declare-fun e!708892 () Bool)

(declare-fun tp_is_empty!31387 () Bool)

(assert (=> b!1249216 (= e!708892 tp_is_empty!31387)))

(declare-fun mapIsEmpty!48838 () Bool)

(declare-fun mapRes!48838 () Bool)

(assert (=> mapIsEmpty!48838 mapRes!48838))

(declare-fun b!1249217 () Bool)

(declare-fun res!833128 () Bool)

(assert (=> b!1249217 (=> (not res!833128) (not e!708893))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249217 (= res!833128 (and (= (size!39351 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39350 _keys!1118) (size!39351 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249218 () Bool)

(declare-fun e!708894 () Bool)

(assert (=> b!1249218 (= e!708894 (and e!708892 mapRes!48838))))

(declare-fun condMapEmpty!48838 () Bool)

(declare-fun mapDefault!48838 () ValueCell!14930)

(assert (=> b!1249218 (= condMapEmpty!48838 (= (arr!38814 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14930)) mapDefault!48838)))))

(declare-fun b!1249219 () Bool)

(declare-fun res!833127 () Bool)

(assert (=> b!1249219 (=> (not res!833127) (not e!708893))))

(declare-datatypes ((List!27567 0))(
  ( (Nil!27564) (Cons!27563 (h!28781 (_ BitVec 64)) (t!41028 List!27567)) )
))
(declare-fun arrayNoDuplicates!0 (array!80499 (_ BitVec 32) List!27567) Bool)

(assert (=> b!1249219 (= res!833127 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27564))))

(declare-fun b!1249220 () Bool)

(declare-fun e!708896 () Bool)

(assert (=> b!1249220 (= e!708896 tp_is_empty!31387)))

(declare-fun res!833125 () Bool)

(assert (=> start!104892 (=> (not res!833125) (not e!708893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104892 (= res!833125 (validMask!0 mask!1466))))

(assert (=> start!104892 e!708893))

(assert (=> start!104892 true))

(assert (=> start!104892 tp!92941))

(assert (=> start!104892 tp_is_empty!31387))

(declare-fun array_inv!29727 (array!80499) Bool)

(assert (=> start!104892 (array_inv!29727 _keys!1118)))

(declare-fun array_inv!29728 (array!80501) Bool)

(assert (=> start!104892 (and (array_inv!29728 _values!914) e!708894)))

(declare-fun mapNonEmpty!48838 () Bool)

(declare-fun tp!92942 () Bool)

(assert (=> mapNonEmpty!48838 (= mapRes!48838 (and tp!92942 e!708896))))

(declare-fun mapValue!48838 () ValueCell!14930)

(declare-fun mapKey!48838 () (_ BitVec 32))

(declare-fun mapRest!48838 () (Array (_ BitVec 32) ValueCell!14930))

(assert (=> mapNonEmpty!48838 (= (arr!38814 _values!914) (store mapRest!48838 mapKey!48838 mapValue!48838))))

(assert (= (and start!104892 res!833125) b!1249217))

(assert (= (and b!1249217 res!833128) b!1249215))

(assert (= (and b!1249215 res!833126) b!1249219))

(assert (= (and b!1249219 res!833127) b!1249214))

(assert (= (and b!1249218 condMapEmpty!48838) mapIsEmpty!48838))

(assert (= (and b!1249218 (not condMapEmpty!48838)) mapNonEmpty!48838))

(get-info :version)

(assert (= (and mapNonEmpty!48838 ((_ is ValueCellFull!14930) mapValue!48838)) b!1249220))

(assert (= (and b!1249218 ((_ is ValueCellFull!14930) mapDefault!48838)) b!1249216))

(assert (= start!104892 b!1249218))

(declare-fun m!1150861 () Bool)

(assert (=> start!104892 m!1150861))

(declare-fun m!1150863 () Bool)

(assert (=> start!104892 m!1150863))

(declare-fun m!1150865 () Bool)

(assert (=> start!104892 m!1150865))

(declare-fun m!1150867 () Bool)

(assert (=> b!1249219 m!1150867))

(declare-fun m!1150869 () Bool)

(assert (=> b!1249215 m!1150869))

(declare-fun m!1150871 () Bool)

(assert (=> mapNonEmpty!48838 m!1150871))

(declare-fun m!1150873 () Bool)

(assert (=> b!1249214 m!1150873))

(check-sat (not mapNonEmpty!48838) tp_is_empty!31387 (not b!1249219) b_and!44251 (not b_next!26485) (not b!1249214) (not start!104892) (not b!1249215))
(check-sat b_and!44251 (not b_next!26485))
