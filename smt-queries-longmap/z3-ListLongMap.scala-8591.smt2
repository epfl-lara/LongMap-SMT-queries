; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104778 () Bool)

(assert start!104778)

(declare-fun b_free!26583 () Bool)

(declare-fun b_next!26583 () Bool)

(assert (=> start!104778 (= b_free!26583 (not b_next!26583))))

(declare-fun tp!93239 () Bool)

(declare-fun b_and!44351 () Bool)

(assert (=> start!104778 (= tp!93239 b_and!44351)))

(declare-fun mapNonEmpty!48988 () Bool)

(declare-fun mapRes!48988 () Bool)

(declare-fun tp!93238 () Bool)

(declare-fun e!708828 () Bool)

(assert (=> mapNonEmpty!48988 (= mapRes!48988 (and tp!93238 e!708828))))

(declare-fun mapKey!48988 () (_ BitVec 32))

(declare-datatypes ((V!47345 0))(
  ( (V!47346 (val!15805 Int)) )
))
(declare-datatypes ((ValueCell!14979 0))(
  ( (ValueCellFull!14979 (v!18501 V!47345)) (EmptyCell!14979) )
))
(declare-datatypes ((array!80656 0))(
  ( (array!80657 (arr!38895 (Array (_ BitVec 32) ValueCell!14979)) (size!39431 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80656)

(declare-fun mapRest!48988 () (Array (_ BitVec 32) ValueCell!14979))

(declare-fun mapValue!48988 () ValueCell!14979)

(assert (=> mapNonEmpty!48988 (= (arr!38895 _values!914) (store mapRest!48988 mapKey!48988 mapValue!48988))))

(declare-fun b!1249011 () Bool)

(declare-fun res!833221 () Bool)

(declare-fun e!708832 () Bool)

(assert (=> b!1249011 (=> (not res!833221) (not e!708832))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80658 0))(
  ( (array!80659 (arr!38896 (Array (_ BitVec 32) (_ BitVec 64))) (size!39432 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80658)

(assert (=> b!1249011 (= res!833221 (and (= (size!39431 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39432 _keys!1118) (size!39431 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249012 () Bool)

(declare-fun e!708830 () Bool)

(declare-fun tp_is_empty!31485 () Bool)

(assert (=> b!1249012 (= e!708830 tp_is_empty!31485)))

(declare-fun b!1249013 () Bool)

(declare-fun res!833220 () Bool)

(assert (=> b!1249013 (=> (not res!833220) (not e!708832))))

(declare-datatypes ((List!27605 0))(
  ( (Nil!27602) (Cons!27601 (h!28810 (_ BitVec 64)) (t!41076 List!27605)) )
))
(declare-fun arrayNoDuplicates!0 (array!80658 (_ BitVec 32) List!27605) Bool)

(assert (=> b!1249013 (= res!833220 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27602))))

(declare-fun b!1249015 () Bool)

(assert (=> b!1249015 (= e!708832 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47345)

(declare-datatypes ((tuple2!20358 0))(
  ( (tuple2!20359 (_1!10190 (_ BitVec 64)) (_2!10190 V!47345)) )
))
(declare-datatypes ((List!27606 0))(
  ( (Nil!27603) (Cons!27602 (h!28811 tuple2!20358) (t!41077 List!27606)) )
))
(declare-datatypes ((ListLongMap!18231 0))(
  ( (ListLongMap!18232 (toList!9131 List!27606)) )
))
(declare-fun lt!563577 () ListLongMap!18231)

(declare-fun minValueAfter!43 () V!47345)

(declare-fun getCurrentListMapNoExtraKeys!5538 (array!80658 array!80656 (_ BitVec 32) (_ BitVec 32) V!47345 V!47345 (_ BitVec 32) Int) ListLongMap!18231)

(assert (=> b!1249015 (= lt!563577 (getCurrentListMapNoExtraKeys!5538 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563578 () ListLongMap!18231)

(declare-fun minValueBefore!43 () V!47345)

(assert (=> b!1249015 (= lt!563578 (getCurrentListMapNoExtraKeys!5538 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48988 () Bool)

(assert (=> mapIsEmpty!48988 mapRes!48988))

(declare-fun b!1249016 () Bool)

(declare-fun res!833223 () Bool)

(assert (=> b!1249016 (=> (not res!833223) (not e!708832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80658 (_ BitVec 32)) Bool)

(assert (=> b!1249016 (= res!833223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249017 () Bool)

(assert (=> b!1249017 (= e!708828 tp_is_empty!31485)))

(declare-fun res!833222 () Bool)

(assert (=> start!104778 (=> (not res!833222) (not e!708832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104778 (= res!833222 (validMask!0 mask!1466))))

(assert (=> start!104778 e!708832))

(assert (=> start!104778 true))

(assert (=> start!104778 tp!93239))

(assert (=> start!104778 tp_is_empty!31485))

(declare-fun array_inv!29683 (array!80658) Bool)

(assert (=> start!104778 (array_inv!29683 _keys!1118)))

(declare-fun e!708831 () Bool)

(declare-fun array_inv!29684 (array!80656) Bool)

(assert (=> start!104778 (and (array_inv!29684 _values!914) e!708831)))

(declare-fun b!1249014 () Bool)

(assert (=> b!1249014 (= e!708831 (and e!708830 mapRes!48988))))

(declare-fun condMapEmpty!48988 () Bool)

(declare-fun mapDefault!48988 () ValueCell!14979)

(assert (=> b!1249014 (= condMapEmpty!48988 (= (arr!38895 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14979)) mapDefault!48988)))))

(assert (= (and start!104778 res!833222) b!1249011))

(assert (= (and b!1249011 res!833221) b!1249016))

(assert (= (and b!1249016 res!833223) b!1249013))

(assert (= (and b!1249013 res!833220) b!1249015))

(assert (= (and b!1249014 condMapEmpty!48988) mapIsEmpty!48988))

(assert (= (and b!1249014 (not condMapEmpty!48988)) mapNonEmpty!48988))

(get-info :version)

(assert (= (and mapNonEmpty!48988 ((_ is ValueCellFull!14979) mapValue!48988)) b!1249017))

(assert (= (and b!1249014 ((_ is ValueCellFull!14979) mapDefault!48988)) b!1249012))

(assert (= start!104778 b!1249014))

(declare-fun m!1150023 () Bool)

(assert (=> b!1249013 m!1150023))

(declare-fun m!1150025 () Bool)

(assert (=> mapNonEmpty!48988 m!1150025))

(declare-fun m!1150027 () Bool)

(assert (=> b!1249015 m!1150027))

(declare-fun m!1150029 () Bool)

(assert (=> b!1249015 m!1150029))

(declare-fun m!1150031 () Bool)

(assert (=> b!1249016 m!1150031))

(declare-fun m!1150033 () Bool)

(assert (=> start!104778 m!1150033))

(declare-fun m!1150035 () Bool)

(assert (=> start!104778 m!1150035))

(declare-fun m!1150037 () Bool)

(assert (=> start!104778 m!1150037))

(check-sat tp_is_empty!31485 (not b_next!26583) (not b!1249016) b_and!44351 (not b!1249013) (not mapNonEmpty!48988) (not b!1249015) (not start!104778))
(check-sat b_and!44351 (not b_next!26583))
