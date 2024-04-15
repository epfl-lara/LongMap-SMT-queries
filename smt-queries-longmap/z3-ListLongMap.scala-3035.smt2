; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42570 () Bool)

(assert start!42570)

(declare-fun b_free!12019 () Bool)

(declare-fun b_next!12019 () Bool)

(assert (=> start!42570 (= b_free!12019 (not b_next!12019))))

(declare-fun tp!42097 () Bool)

(declare-fun b_and!20473 () Bool)

(assert (=> start!42570 (= tp!42097 b_and!20473)))

(declare-fun b!474817 () Bool)

(declare-fun e!278752 () Bool)

(declare-fun e!278750 () Bool)

(declare-fun mapRes!21889 () Bool)

(assert (=> b!474817 (= e!278752 (and e!278750 mapRes!21889))))

(declare-fun condMapEmpty!21889 () Bool)

(declare-datatypes ((V!19035 0))(
  ( (V!19036 (val!6768 Int)) )
))
(declare-datatypes ((ValueCell!6380 0))(
  ( (ValueCellFull!6380 (v!9055 V!19035)) (EmptyCell!6380) )
))
(declare-datatypes ((array!30623 0))(
  ( (array!30624 (arr!14729 (Array (_ BitVec 32) ValueCell!6380)) (size!15082 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30623)

(declare-fun mapDefault!21889 () ValueCell!6380)

(assert (=> b!474817 (= condMapEmpty!21889 (= (arr!14729 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6380)) mapDefault!21889)))))

(declare-fun mapNonEmpty!21889 () Bool)

(declare-fun tp!42096 () Bool)

(declare-fun e!278751 () Bool)

(assert (=> mapNonEmpty!21889 (= mapRes!21889 (and tp!42096 e!278751))))

(declare-fun mapKey!21889 () (_ BitVec 32))

(declare-fun mapValue!21889 () ValueCell!6380)

(declare-fun mapRest!21889 () (Array (_ BitVec 32) ValueCell!6380))

(assert (=> mapNonEmpty!21889 (= (arr!14729 _values!833) (store mapRest!21889 mapKey!21889 mapValue!21889))))

(declare-fun b!474818 () Bool)

(declare-fun res!283604 () Bool)

(declare-fun e!278754 () Bool)

(assert (=> b!474818 (=> (not res!283604) (not e!278754))))

(declare-datatypes ((array!30625 0))(
  ( (array!30626 (arr!14730 (Array (_ BitVec 32) (_ BitVec 64))) (size!15083 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30625)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30625 (_ BitVec 32)) Bool)

(assert (=> b!474818 (= res!283604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474819 () Bool)

(assert (=> b!474819 (= e!278754 false)))

(declare-fun zeroValue!794 () V!19035)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8980 0))(
  ( (tuple2!8981 (_1!4501 (_ BitVec 64)) (_2!4501 V!19035)) )
))
(declare-datatypes ((List!9042 0))(
  ( (Nil!9039) (Cons!9038 (h!9894 tuple2!8980) (t!15007 List!9042)) )
))
(declare-datatypes ((ListLongMap!7883 0))(
  ( (ListLongMap!7884 (toList!3957 List!9042)) )
))
(declare-fun lt!216142 () ListLongMap!7883)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!19035)

(declare-fun getCurrentListMapNoExtraKeys!2124 (array!30625 array!30623 (_ BitVec 32) (_ BitVec 32) V!19035 V!19035 (_ BitVec 32) Int) ListLongMap!7883)

(assert (=> b!474819 (= lt!216142 (getCurrentListMapNoExtraKeys!2124 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19035)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!216143 () ListLongMap!7883)

(assert (=> b!474819 (= lt!216143 (getCurrentListMapNoExtraKeys!2124 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21889 () Bool)

(assert (=> mapIsEmpty!21889 mapRes!21889))

(declare-fun b!474820 () Bool)

(declare-fun res!283605 () Bool)

(assert (=> b!474820 (=> (not res!283605) (not e!278754))))

(assert (=> b!474820 (= res!283605 (and (= (size!15082 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15083 _keys!1025) (size!15082 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474821 () Bool)

(declare-fun res!283602 () Bool)

(assert (=> b!474821 (=> (not res!283602) (not e!278754))))

(declare-datatypes ((List!9043 0))(
  ( (Nil!9040) (Cons!9039 (h!9895 (_ BitVec 64)) (t!15008 List!9043)) )
))
(declare-fun arrayNoDuplicates!0 (array!30625 (_ BitVec 32) List!9043) Bool)

(assert (=> b!474821 (= res!283602 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9040))))

(declare-fun b!474822 () Bool)

(declare-fun tp_is_empty!13447 () Bool)

(assert (=> b!474822 (= e!278751 tp_is_empty!13447)))

(declare-fun res!283603 () Bool)

(assert (=> start!42570 (=> (not res!283603) (not e!278754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42570 (= res!283603 (validMask!0 mask!1365))))

(assert (=> start!42570 e!278754))

(assert (=> start!42570 tp_is_empty!13447))

(assert (=> start!42570 tp!42097))

(assert (=> start!42570 true))

(declare-fun array_inv!10710 (array!30625) Bool)

(assert (=> start!42570 (array_inv!10710 _keys!1025)))

(declare-fun array_inv!10711 (array!30623) Bool)

(assert (=> start!42570 (and (array_inv!10711 _values!833) e!278752)))

(declare-fun b!474823 () Bool)

(assert (=> b!474823 (= e!278750 tp_is_empty!13447)))

(assert (= (and start!42570 res!283603) b!474820))

(assert (= (and b!474820 res!283605) b!474818))

(assert (= (and b!474818 res!283604) b!474821))

(assert (= (and b!474821 res!283602) b!474819))

(assert (= (and b!474817 condMapEmpty!21889) mapIsEmpty!21889))

(assert (= (and b!474817 (not condMapEmpty!21889)) mapNonEmpty!21889))

(get-info :version)

(assert (= (and mapNonEmpty!21889 ((_ is ValueCellFull!6380) mapValue!21889)) b!474822))

(assert (= (and b!474817 ((_ is ValueCellFull!6380) mapDefault!21889)) b!474823))

(assert (= start!42570 b!474817))

(declare-fun m!456617 () Bool)

(assert (=> b!474818 m!456617))

(declare-fun m!456619 () Bool)

(assert (=> b!474821 m!456619))

(declare-fun m!456621 () Bool)

(assert (=> mapNonEmpty!21889 m!456621))

(declare-fun m!456623 () Bool)

(assert (=> b!474819 m!456623))

(declare-fun m!456625 () Bool)

(assert (=> b!474819 m!456625))

(declare-fun m!456627 () Bool)

(assert (=> start!42570 m!456627))

(declare-fun m!456629 () Bool)

(assert (=> start!42570 m!456629))

(declare-fun m!456631 () Bool)

(assert (=> start!42570 m!456631))

(check-sat b_and!20473 tp_is_empty!13447 (not b_next!12019) (not b!474818) (not b!474819) (not mapNonEmpty!21889) (not start!42570) (not b!474821))
(check-sat b_and!20473 (not b_next!12019))
