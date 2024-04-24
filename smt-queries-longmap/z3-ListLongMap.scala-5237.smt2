; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70668 () Bool)

(assert start!70668)

(declare-fun b_free!12829 () Bool)

(declare-fun b_next!12829 () Bool)

(assert (=> start!70668 (= b_free!12829 (not b_next!12829))))

(declare-fun tp!45220 () Bool)

(declare-fun b_and!21669 () Bool)

(assert (=> start!70668 (= tp!45220 b_and!21669)))

(declare-fun mapNonEmpty!23407 () Bool)

(declare-fun mapRes!23407 () Bool)

(declare-fun tp!45219 () Bool)

(declare-fun e!455277 () Bool)

(assert (=> mapNonEmpty!23407 (= mapRes!23407 (and tp!45219 e!455277))))

(declare-fun mapKey!23407 () (_ BitVec 32))

(declare-datatypes ((V!24387 0))(
  ( (V!24388 (val!7317 Int)) )
))
(declare-datatypes ((ValueCell!6854 0))(
  ( (ValueCellFull!6854 (v!9746 V!24387)) (EmptyCell!6854) )
))
(declare-datatypes ((array!45277 0))(
  ( (array!45278 (arr!21688 (Array (_ BitVec 32) ValueCell!6854)) (size!22108 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45277)

(declare-fun mapValue!23407 () ValueCell!6854)

(declare-fun mapRest!23407 () (Array (_ BitVec 32) ValueCell!6854))

(assert (=> mapNonEmpty!23407 (= (arr!21688 _values!788) (store mapRest!23407 mapKey!23407 mapValue!23407))))

(declare-fun b!819843 () Bool)

(declare-fun e!455281 () Bool)

(assert (=> b!819843 (= e!455281 true)))

(declare-datatypes ((tuple2!9534 0))(
  ( (tuple2!9535 (_1!4778 (_ BitVec 64)) (_2!4778 V!24387)) )
))
(declare-datatypes ((List!15341 0))(
  ( (Nil!15338) (Cons!15337 (h!16472 tuple2!9534) (t!21662 List!15341)) )
))
(declare-datatypes ((ListLongMap!8359 0))(
  ( (ListLongMap!8360 (toList!4195 List!15341)) )
))
(declare-fun lt!367584 () ListLongMap!8359)

(declare-fun lt!367577 () tuple2!9534)

(declare-fun lt!367585 () tuple2!9534)

(declare-fun lt!367579 () ListLongMap!8359)

(declare-fun +!1834 (ListLongMap!8359 tuple2!9534) ListLongMap!8359)

(assert (=> b!819843 (= lt!367584 (+!1834 (+!1834 lt!367579 lt!367577) lt!367585))))

(declare-fun lt!367580 () ListLongMap!8359)

(declare-fun lt!367586 () ListLongMap!8359)

(assert (=> b!819843 (= (+!1834 lt!367580 lt!367585) (+!1834 lt!367586 lt!367585))))

(declare-fun zeroValueBefore!34 () V!24387)

(declare-fun zeroValueAfter!34 () V!24387)

(declare-datatypes ((Unit!27940 0))(
  ( (Unit!27941) )
))
(declare-fun lt!367581 () Unit!27940)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!175 (ListLongMap!8359 (_ BitVec 64) V!24387 V!24387) Unit!27940)

(assert (=> b!819843 (= lt!367581 (addSameAsAddTwiceSameKeyDiffValues!175 lt!367580 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819843 (= lt!367585 (tuple2!9535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455279 () Bool)

(assert (=> b!819843 e!455279))

(declare-fun res!559212 () Bool)

(assert (=> b!819843 (=> (not res!559212) (not e!455279))))

(declare-fun lt!367583 () ListLongMap!8359)

(assert (=> b!819843 (= res!559212 (= lt!367583 lt!367586))))

(assert (=> b!819843 (= lt!367586 (+!1834 lt!367580 lt!367577))))

(assert (=> b!819843 (= lt!367577 (tuple2!9535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45279 0))(
  ( (array!45280 (arr!21689 (Array (_ BitVec 32) (_ BitVec 64))) (size!22109 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45279)

(declare-fun minValue!754 () V!24387)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lt!367578 () ListLongMap!8359)

(declare-fun getCurrentListMap!2388 (array!45279 array!45277 (_ BitVec 32) (_ BitVec 32) V!24387 V!24387 (_ BitVec 32) Int) ListLongMap!8359)

(assert (=> b!819843 (= lt!367578 (getCurrentListMap!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819843 (= lt!367583 (getCurrentListMap!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819844 () Bool)

(declare-fun res!559211 () Bool)

(declare-fun e!455275 () Bool)

(assert (=> b!819844 (=> (not res!559211) (not e!455275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45279 (_ BitVec 32)) Bool)

(assert (=> b!819844 (= res!559211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23407 () Bool)

(assert (=> mapIsEmpty!23407 mapRes!23407))

(declare-fun b!819845 () Bool)

(declare-fun res!559214 () Bool)

(assert (=> b!819845 (=> (not res!559214) (not e!455275))))

(declare-datatypes ((List!15342 0))(
  ( (Nil!15339) (Cons!15338 (h!16473 (_ BitVec 64)) (t!21663 List!15342)) )
))
(declare-fun arrayNoDuplicates!0 (array!45279 (_ BitVec 32) List!15342) Bool)

(assert (=> b!819845 (= res!559214 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15339))))

(declare-fun b!819846 () Bool)

(declare-fun tp_is_empty!14539 () Bool)

(assert (=> b!819846 (= e!455277 tp_is_empty!14539)))

(declare-fun b!819847 () Bool)

(declare-fun e!455276 () Bool)

(declare-fun e!455278 () Bool)

(assert (=> b!819847 (= e!455276 (and e!455278 mapRes!23407))))

(declare-fun condMapEmpty!23407 () Bool)

(declare-fun mapDefault!23407 () ValueCell!6854)

(assert (=> b!819847 (= condMapEmpty!23407 (= (arr!21688 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6854)) mapDefault!23407)))))

(declare-fun b!819848 () Bool)

(assert (=> b!819848 (= e!455279 (= lt!367578 (+!1834 lt!367579 (tuple2!9535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819849 () Bool)

(assert (=> b!819849 (= e!455278 tp_is_empty!14539)))

(declare-fun res!559216 () Bool)

(assert (=> start!70668 (=> (not res!559216) (not e!455275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70668 (= res!559216 (validMask!0 mask!1312))))

(assert (=> start!70668 e!455275))

(assert (=> start!70668 tp_is_empty!14539))

(declare-fun array_inv!17365 (array!45279) Bool)

(assert (=> start!70668 (array_inv!17365 _keys!976)))

(assert (=> start!70668 true))

(declare-fun array_inv!17366 (array!45277) Bool)

(assert (=> start!70668 (and (array_inv!17366 _values!788) e!455276)))

(assert (=> start!70668 tp!45220))

(declare-fun b!819850 () Bool)

(assert (=> b!819850 (= e!455275 (not e!455281))))

(declare-fun res!559215 () Bool)

(assert (=> b!819850 (=> res!559215 e!455281)))

(assert (=> b!819850 (= res!559215 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819850 (= lt!367580 lt!367579)))

(declare-fun lt!367582 () Unit!27940)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!379 (array!45279 array!45277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24387 V!24387 V!24387 V!24387 (_ BitVec 32) Int) Unit!27940)

(assert (=> b!819850 (= lt!367582 (lemmaNoChangeToArrayThenSameMapNoExtras!379 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2291 (array!45279 array!45277 (_ BitVec 32) (_ BitVec 32) V!24387 V!24387 (_ BitVec 32) Int) ListLongMap!8359)

(assert (=> b!819850 (= lt!367579 (getCurrentListMapNoExtraKeys!2291 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819850 (= lt!367580 (getCurrentListMapNoExtraKeys!2291 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819851 () Bool)

(declare-fun res!559213 () Bool)

(assert (=> b!819851 (=> (not res!559213) (not e!455275))))

(assert (=> b!819851 (= res!559213 (and (= (size!22108 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22109 _keys!976) (size!22108 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70668 res!559216) b!819851))

(assert (= (and b!819851 res!559213) b!819844))

(assert (= (and b!819844 res!559211) b!819845))

(assert (= (and b!819845 res!559214) b!819850))

(assert (= (and b!819850 (not res!559215)) b!819843))

(assert (= (and b!819843 res!559212) b!819848))

(assert (= (and b!819847 condMapEmpty!23407) mapIsEmpty!23407))

(assert (= (and b!819847 (not condMapEmpty!23407)) mapNonEmpty!23407))

(get-info :version)

(assert (= (and mapNonEmpty!23407 ((_ is ValueCellFull!6854) mapValue!23407)) b!819846))

(assert (= (and b!819847 ((_ is ValueCellFull!6854) mapDefault!23407)) b!819849))

(assert (= start!70668 b!819847))

(declare-fun m!761711 () Bool)

(assert (=> b!819848 m!761711))

(declare-fun m!761713 () Bool)

(assert (=> b!819843 m!761713))

(declare-fun m!761715 () Bool)

(assert (=> b!819843 m!761715))

(declare-fun m!761717 () Bool)

(assert (=> b!819843 m!761717))

(declare-fun m!761719 () Bool)

(assert (=> b!819843 m!761719))

(declare-fun m!761721 () Bool)

(assert (=> b!819843 m!761721))

(declare-fun m!761723 () Bool)

(assert (=> b!819843 m!761723))

(declare-fun m!761725 () Bool)

(assert (=> b!819843 m!761725))

(declare-fun m!761727 () Bool)

(assert (=> b!819843 m!761727))

(assert (=> b!819843 m!761719))

(declare-fun m!761729 () Bool)

(assert (=> b!819845 m!761729))

(declare-fun m!761731 () Bool)

(assert (=> start!70668 m!761731))

(declare-fun m!761733 () Bool)

(assert (=> start!70668 m!761733))

(declare-fun m!761735 () Bool)

(assert (=> start!70668 m!761735))

(declare-fun m!761737 () Bool)

(assert (=> b!819850 m!761737))

(declare-fun m!761739 () Bool)

(assert (=> b!819850 m!761739))

(declare-fun m!761741 () Bool)

(assert (=> b!819850 m!761741))

(declare-fun m!761743 () Bool)

(assert (=> mapNonEmpty!23407 m!761743))

(declare-fun m!761745 () Bool)

(assert (=> b!819844 m!761745))

(check-sat (not b!819848) (not b!819845) (not b_next!12829) (not b!819850) (not b!819843) tp_is_empty!14539 (not mapNonEmpty!23407) (not b!819844) b_and!21669 (not start!70668))
(check-sat b_and!21669 (not b_next!12829))
