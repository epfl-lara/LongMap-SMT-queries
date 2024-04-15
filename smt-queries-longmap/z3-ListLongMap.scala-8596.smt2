; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104802 () Bool)

(assert start!104802)

(declare-fun b_free!26611 () Bool)

(declare-fun b_next!26611 () Bool)

(assert (=> start!104802 (= b_free!26611 (not b_next!26611))))

(declare-fun tp!93322 () Bool)

(declare-fun b_and!44361 () Bool)

(assert (=> start!104802 (= tp!93322 b_and!44361)))

(declare-fun b!1249223 () Bool)

(declare-fun e!708993 () Bool)

(assert (=> b!1249223 (= e!708993 (not true))))

(declare-datatypes ((V!47383 0))(
  ( (V!47384 (val!15819 Int)) )
))
(declare-datatypes ((tuple2!20454 0))(
  ( (tuple2!20455 (_1!10238 (_ BitVec 64)) (_2!10238 V!47383)) )
))
(declare-datatypes ((List!27682 0))(
  ( (Nil!27679) (Cons!27678 (h!28887 tuple2!20454) (t!41144 List!27682)) )
))
(declare-datatypes ((ListLongMap!18327 0))(
  ( (ListLongMap!18328 (toList!9179 List!27682)) )
))
(declare-fun lt!563494 () ListLongMap!18327)

(declare-fun lt!563493 () ListLongMap!18327)

(assert (=> b!1249223 (= lt!563494 lt!563493)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41326 0))(
  ( (Unit!41327) )
))
(declare-fun lt!563495 () Unit!41326)

(declare-fun minValueAfter!43 () V!47383)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47383)

(declare-datatypes ((array!80625 0))(
  ( (array!80626 (arr!38880 (Array (_ BitVec 32) (_ BitVec 64))) (size!39418 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80625)

(declare-datatypes ((ValueCell!14993 0))(
  ( (ValueCellFull!14993 (v!18514 V!47383)) (EmptyCell!14993) )
))
(declare-datatypes ((array!80627 0))(
  ( (array!80628 (arr!38881 (Array (_ BitVec 32) ValueCell!14993)) (size!39419 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80627)

(declare-fun minValueBefore!43 () V!47383)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!918 (array!80625 array!80627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47383 V!47383 V!47383 V!47383 (_ BitVec 32) Int) Unit!41326)

(assert (=> b!1249223 (= lt!563495 (lemmaNoChangeToArrayThenSameMapNoExtras!918 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5596 (array!80625 array!80627 (_ BitVec 32) (_ BitVec 32) V!47383 V!47383 (_ BitVec 32) Int) ListLongMap!18327)

(assert (=> b!1249223 (= lt!563493 (getCurrentListMapNoExtraKeys!5596 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249223 (= lt!563494 (getCurrentListMapNoExtraKeys!5596 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249224 () Bool)

(declare-fun res!833351 () Bool)

(assert (=> b!1249224 (=> (not res!833351) (not e!708993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80625 (_ BitVec 32)) Bool)

(assert (=> b!1249224 (= res!833351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249225 () Bool)

(declare-fun e!708994 () Bool)

(declare-fun tp_is_empty!31513 () Bool)

(assert (=> b!1249225 (= e!708994 tp_is_empty!31513)))

(declare-fun b!1249226 () Bool)

(declare-fun res!833350 () Bool)

(assert (=> b!1249226 (=> (not res!833350) (not e!708993))))

(assert (=> b!1249226 (= res!833350 (and (= (size!39419 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39418 _keys!1118) (size!39419 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249227 () Bool)

(declare-fun e!708995 () Bool)

(assert (=> b!1249227 (= e!708995 tp_is_empty!31513)))

(declare-fun res!833348 () Bool)

(assert (=> start!104802 (=> (not res!833348) (not e!708993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104802 (= res!833348 (validMask!0 mask!1466))))

(assert (=> start!104802 e!708993))

(assert (=> start!104802 true))

(assert (=> start!104802 tp!93322))

(assert (=> start!104802 tp_is_empty!31513))

(declare-fun array_inv!29807 (array!80625) Bool)

(assert (=> start!104802 (array_inv!29807 _keys!1118)))

(declare-fun e!708997 () Bool)

(declare-fun array_inv!29808 (array!80627) Bool)

(assert (=> start!104802 (and (array_inv!29808 _values!914) e!708997)))

(declare-fun mapNonEmpty!49030 () Bool)

(declare-fun mapRes!49030 () Bool)

(declare-fun tp!93323 () Bool)

(assert (=> mapNonEmpty!49030 (= mapRes!49030 (and tp!93323 e!708994))))

(declare-fun mapValue!49030 () ValueCell!14993)

(declare-fun mapKey!49030 () (_ BitVec 32))

(declare-fun mapRest!49030 () (Array (_ BitVec 32) ValueCell!14993))

(assert (=> mapNonEmpty!49030 (= (arr!38881 _values!914) (store mapRest!49030 mapKey!49030 mapValue!49030))))

(declare-fun b!1249228 () Bool)

(assert (=> b!1249228 (= e!708997 (and e!708995 mapRes!49030))))

(declare-fun condMapEmpty!49030 () Bool)

(declare-fun mapDefault!49030 () ValueCell!14993)

(assert (=> b!1249228 (= condMapEmpty!49030 (= (arr!38881 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14993)) mapDefault!49030)))))

(declare-fun b!1249229 () Bool)

(declare-fun res!833349 () Bool)

(assert (=> b!1249229 (=> (not res!833349) (not e!708993))))

(declare-datatypes ((List!27683 0))(
  ( (Nil!27680) (Cons!27679 (h!28888 (_ BitVec 64)) (t!41145 List!27683)) )
))
(declare-fun arrayNoDuplicates!0 (array!80625 (_ BitVec 32) List!27683) Bool)

(assert (=> b!1249229 (= res!833349 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27680))))

(declare-fun mapIsEmpty!49030 () Bool)

(assert (=> mapIsEmpty!49030 mapRes!49030))

(assert (= (and start!104802 res!833348) b!1249226))

(assert (= (and b!1249226 res!833350) b!1249224))

(assert (= (and b!1249224 res!833351) b!1249229))

(assert (= (and b!1249229 res!833349) b!1249223))

(assert (= (and b!1249228 condMapEmpty!49030) mapIsEmpty!49030))

(assert (= (and b!1249228 (not condMapEmpty!49030)) mapNonEmpty!49030))

(get-info :version)

(assert (= (and mapNonEmpty!49030 ((_ is ValueCellFull!14993) mapValue!49030)) b!1249225))

(assert (= (and b!1249228 ((_ is ValueCellFull!14993) mapDefault!49030)) b!1249227))

(assert (= start!104802 b!1249228))

(declare-fun m!1149733 () Bool)

(assert (=> b!1249229 m!1149733))

(declare-fun m!1149735 () Bool)

(assert (=> start!104802 m!1149735))

(declare-fun m!1149737 () Bool)

(assert (=> start!104802 m!1149737))

(declare-fun m!1149739 () Bool)

(assert (=> start!104802 m!1149739))

(declare-fun m!1149741 () Bool)

(assert (=> mapNonEmpty!49030 m!1149741))

(declare-fun m!1149743 () Bool)

(assert (=> b!1249223 m!1149743))

(declare-fun m!1149745 () Bool)

(assert (=> b!1249223 m!1149745))

(declare-fun m!1149747 () Bool)

(assert (=> b!1249223 m!1149747))

(declare-fun m!1149749 () Bool)

(assert (=> b!1249224 m!1149749))

(check-sat (not b!1249229) (not mapNonEmpty!49030) b_and!44361 (not b!1249223) tp_is_empty!31513 (not start!104802) (not b_next!26611) (not b!1249224))
(check-sat b_and!44361 (not b_next!26611))
