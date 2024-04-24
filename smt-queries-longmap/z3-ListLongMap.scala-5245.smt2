; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70736 () Bool)

(assert start!70736)

(declare-fun b_free!12877 () Bool)

(declare-fun b_next!12877 () Bool)

(assert (=> start!70736 (= b_free!12877 (not b_next!12877))))

(declare-fun tp!45367 () Bool)

(declare-fun b_and!21729 () Bool)

(assert (=> start!70736 (= tp!45367 b_and!21729)))

(declare-fun b!820685 () Bool)

(declare-fun e!455905 () Bool)

(declare-fun e!455904 () Bool)

(assert (=> b!820685 (= e!455905 (not e!455904))))

(declare-fun res!559735 () Bool)

(assert (=> b!820685 (=> res!559735 e!455904)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820685 (= res!559735 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24451 0))(
  ( (V!24452 (val!7341 Int)) )
))
(declare-datatypes ((tuple2!9576 0))(
  ( (tuple2!9577 (_1!4799 (_ BitVec 64)) (_2!4799 V!24451)) )
))
(declare-datatypes ((List!15379 0))(
  ( (Nil!15376) (Cons!15375 (h!16510 tuple2!9576) (t!21702 List!15379)) )
))
(declare-datatypes ((ListLongMap!8401 0))(
  ( (ListLongMap!8402 (toList!4216 List!15379)) )
))
(declare-fun lt!368453 () ListLongMap!8401)

(declare-fun lt!368451 () ListLongMap!8401)

(assert (=> b!820685 (= lt!368453 lt!368451)))

(declare-fun zeroValueBefore!34 () V!24451)

(declare-datatypes ((array!45375 0))(
  ( (array!45376 (arr!21736 (Array (_ BitVec 32) (_ BitVec 64))) (size!22156 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45375)

(declare-datatypes ((Unit!27982 0))(
  ( (Unit!27983) )
))
(declare-fun lt!368452 () Unit!27982)

(declare-fun zeroValueAfter!34 () V!24451)

(declare-fun minValue!754 () V!24451)

(declare-datatypes ((ValueCell!6878 0))(
  ( (ValueCellFull!6878 (v!9771 V!24451)) (EmptyCell!6878) )
))
(declare-datatypes ((array!45377 0))(
  ( (array!45378 (arr!21737 (Array (_ BitVec 32) ValueCell!6878)) (size!22157 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45377)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!397 (array!45375 array!45377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24451 V!24451 V!24451 V!24451 (_ BitVec 32) Int) Unit!27982)

(assert (=> b!820685 (= lt!368452 (lemmaNoChangeToArrayThenSameMapNoExtras!397 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2309 (array!45375 array!45377 (_ BitVec 32) (_ BitVec 32) V!24451 V!24451 (_ BitVec 32) Int) ListLongMap!8401)

(assert (=> b!820685 (= lt!368451 (getCurrentListMapNoExtraKeys!2309 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820685 (= lt!368453 (getCurrentListMapNoExtraKeys!2309 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23482 () Bool)

(declare-fun mapRes!23482 () Bool)

(declare-fun tp!45366 () Bool)

(declare-fun e!455909 () Bool)

(assert (=> mapNonEmpty!23482 (= mapRes!23482 (and tp!45366 e!455909))))

(declare-fun mapValue!23482 () ValueCell!6878)

(declare-fun mapRest!23482 () (Array (_ BitVec 32) ValueCell!6878))

(declare-fun mapKey!23482 () (_ BitVec 32))

(assert (=> mapNonEmpty!23482 (= (arr!21737 _values!788) (store mapRest!23482 mapKey!23482 mapValue!23482))))

(declare-fun mapIsEmpty!23482 () Bool)

(assert (=> mapIsEmpty!23482 mapRes!23482))

(declare-fun e!455907 () Bool)

(declare-fun b!820686 () Bool)

(declare-fun lt!368457 () ListLongMap!8401)

(declare-fun +!1852 (ListLongMap!8401 tuple2!9576) ListLongMap!8401)

(assert (=> b!820686 (= e!455907 (= lt!368457 (+!1852 lt!368451 (tuple2!9577 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820687 () Bool)

(declare-fun e!455906 () Bool)

(declare-fun e!455903 () Bool)

(assert (=> b!820687 (= e!455906 (and e!455903 mapRes!23482))))

(declare-fun condMapEmpty!23482 () Bool)

(declare-fun mapDefault!23482 () ValueCell!6878)

(assert (=> b!820687 (= condMapEmpty!23482 (= (arr!21737 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6878)) mapDefault!23482)))))

(declare-fun b!820688 () Bool)

(declare-fun tp_is_empty!14587 () Bool)

(assert (=> b!820688 (= e!455903 tp_is_empty!14587)))

(declare-fun b!820689 () Bool)

(declare-fun res!559737 () Bool)

(assert (=> b!820689 (=> (not res!559737) (not e!455905))))

(declare-datatypes ((List!15380 0))(
  ( (Nil!15377) (Cons!15376 (h!16511 (_ BitVec 64)) (t!21703 List!15380)) )
))
(declare-fun arrayNoDuplicates!0 (array!45375 (_ BitVec 32) List!15380) Bool)

(assert (=> b!820689 (= res!559737 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15377))))

(declare-fun b!820690 () Bool)

(declare-fun res!559740 () Bool)

(assert (=> b!820690 (=> (not res!559740) (not e!455905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45375 (_ BitVec 32)) Bool)

(assert (=> b!820690 (= res!559740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820691 () Bool)

(assert (=> b!820691 (= e!455904 true)))

(declare-fun lt!368456 () tuple2!9576)

(declare-fun lt!368460 () tuple2!9576)

(declare-fun lt!368459 () ListLongMap!8401)

(assert (=> b!820691 (= lt!368459 (+!1852 (+!1852 lt!368451 lt!368460) lt!368456))))

(declare-fun lt!368458 () ListLongMap!8401)

(assert (=> b!820691 (= (+!1852 lt!368453 lt!368456) (+!1852 lt!368458 lt!368456))))

(declare-fun lt!368455 () Unit!27982)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!189 (ListLongMap!8401 (_ BitVec 64) V!24451 V!24451) Unit!27982)

(assert (=> b!820691 (= lt!368455 (addSameAsAddTwiceSameKeyDiffValues!189 lt!368453 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820691 (= lt!368456 (tuple2!9577 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!820691 e!455907))

(declare-fun res!559738 () Bool)

(assert (=> b!820691 (=> (not res!559738) (not e!455907))))

(declare-fun lt!368454 () ListLongMap!8401)

(assert (=> b!820691 (= res!559738 (= lt!368454 lt!368458))))

(assert (=> b!820691 (= lt!368458 (+!1852 lt!368453 lt!368460))))

(assert (=> b!820691 (= lt!368460 (tuple2!9577 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2402 (array!45375 array!45377 (_ BitVec 32) (_ BitVec 32) V!24451 V!24451 (_ BitVec 32) Int) ListLongMap!8401)

(assert (=> b!820691 (= lt!368457 (getCurrentListMap!2402 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820691 (= lt!368454 (getCurrentListMap!2402 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820692 () Bool)

(assert (=> b!820692 (= e!455909 tp_is_empty!14587)))

(declare-fun b!820693 () Bool)

(declare-fun res!559739 () Bool)

(assert (=> b!820693 (=> (not res!559739) (not e!455905))))

(assert (=> b!820693 (= res!559739 (and (= (size!22157 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22156 _keys!976) (size!22157 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!559736 () Bool)

(assert (=> start!70736 (=> (not res!559736) (not e!455905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70736 (= res!559736 (validMask!0 mask!1312))))

(assert (=> start!70736 e!455905))

(assert (=> start!70736 tp_is_empty!14587))

(declare-fun array_inv!17405 (array!45375) Bool)

(assert (=> start!70736 (array_inv!17405 _keys!976)))

(assert (=> start!70736 true))

(declare-fun array_inv!17406 (array!45377) Bool)

(assert (=> start!70736 (and (array_inv!17406 _values!788) e!455906)))

(assert (=> start!70736 tp!45367))

(assert (= (and start!70736 res!559736) b!820693))

(assert (= (and b!820693 res!559739) b!820690))

(assert (= (and b!820690 res!559740) b!820689))

(assert (= (and b!820689 res!559737) b!820685))

(assert (= (and b!820685 (not res!559735)) b!820691))

(assert (= (and b!820691 res!559738) b!820686))

(assert (= (and b!820687 condMapEmpty!23482) mapIsEmpty!23482))

(assert (= (and b!820687 (not condMapEmpty!23482)) mapNonEmpty!23482))

(get-info :version)

(assert (= (and mapNonEmpty!23482 ((_ is ValueCellFull!6878) mapValue!23482)) b!820692))

(assert (= (and b!820687 ((_ is ValueCellFull!6878) mapDefault!23482)) b!820688))

(assert (= start!70736 b!820687))

(declare-fun m!762813 () Bool)

(assert (=> b!820691 m!762813))

(declare-fun m!762815 () Bool)

(assert (=> b!820691 m!762815))

(assert (=> b!820691 m!762813))

(declare-fun m!762817 () Bool)

(assert (=> b!820691 m!762817))

(declare-fun m!762819 () Bool)

(assert (=> b!820691 m!762819))

(declare-fun m!762821 () Bool)

(assert (=> b!820691 m!762821))

(declare-fun m!762823 () Bool)

(assert (=> b!820691 m!762823))

(declare-fun m!762825 () Bool)

(assert (=> b!820691 m!762825))

(declare-fun m!762827 () Bool)

(assert (=> b!820691 m!762827))

(declare-fun m!762829 () Bool)

(assert (=> b!820690 m!762829))

(declare-fun m!762831 () Bool)

(assert (=> b!820689 m!762831))

(declare-fun m!762833 () Bool)

(assert (=> b!820685 m!762833))

(declare-fun m!762835 () Bool)

(assert (=> b!820685 m!762835))

(declare-fun m!762837 () Bool)

(assert (=> b!820685 m!762837))

(declare-fun m!762839 () Bool)

(assert (=> start!70736 m!762839))

(declare-fun m!762841 () Bool)

(assert (=> start!70736 m!762841))

(declare-fun m!762843 () Bool)

(assert (=> start!70736 m!762843))

(declare-fun m!762845 () Bool)

(assert (=> b!820686 m!762845))

(declare-fun m!762847 () Bool)

(assert (=> mapNonEmpty!23482 m!762847))

(check-sat (not b!820686) (not b!820690) (not b!820685) (not b!820689) (not b!820691) tp_is_empty!14587 b_and!21729 (not mapNonEmpty!23482) (not b_next!12877) (not start!70736))
(check-sat b_and!21729 (not b_next!12877))
