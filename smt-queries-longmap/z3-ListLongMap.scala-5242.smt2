; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70718 () Bool)

(assert start!70718)

(declare-fun b_free!12859 () Bool)

(declare-fun b_next!12859 () Bool)

(assert (=> start!70718 (= b_free!12859 (not b_next!12859))))

(declare-fun tp!45312 () Bool)

(declare-fun b_and!21711 () Bool)

(assert (=> start!70718 (= tp!45312 b_and!21711)))

(declare-fun b!820442 () Bool)

(declare-fun res!559577 () Bool)

(declare-fun e!455715 () Bool)

(assert (=> b!820442 (=> (not res!559577) (not e!455715))))

(declare-datatypes ((array!45339 0))(
  ( (array!45340 (arr!21718 (Array (_ BitVec 32) (_ BitVec 64))) (size!22138 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45339)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45339 (_ BitVec 32)) Bool)

(assert (=> b!820442 (= res!559577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23455 () Bool)

(declare-fun mapRes!23455 () Bool)

(declare-fun tp!45313 () Bool)

(declare-fun e!455714 () Bool)

(assert (=> mapNonEmpty!23455 (= mapRes!23455 (and tp!45313 e!455714))))

(declare-datatypes ((V!24427 0))(
  ( (V!24428 (val!7332 Int)) )
))
(declare-datatypes ((ValueCell!6869 0))(
  ( (ValueCellFull!6869 (v!9762 V!24427)) (EmptyCell!6869) )
))
(declare-fun mapRest!23455 () (Array (_ BitVec 32) ValueCell!6869))

(declare-fun mapValue!23455 () ValueCell!6869)

(declare-datatypes ((array!45341 0))(
  ( (array!45342 (arr!21719 (Array (_ BitVec 32) ValueCell!6869)) (size!22139 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45341)

(declare-fun mapKey!23455 () (_ BitVec 32))

(assert (=> mapNonEmpty!23455 (= (arr!21719 _values!788) (store mapRest!23455 mapKey!23455 mapValue!23455))))

(declare-fun b!820443 () Bool)

(declare-fun e!455720 () Bool)

(declare-fun tp_is_empty!14569 () Bool)

(assert (=> b!820443 (= e!455720 tp_is_empty!14569)))

(declare-fun b!820444 () Bool)

(declare-fun e!455717 () Bool)

(assert (=> b!820444 (= e!455715 (not e!455717))))

(declare-fun res!559573 () Bool)

(assert (=> b!820444 (=> res!559573 e!455717)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820444 (= res!559573 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9560 0))(
  ( (tuple2!9561 (_1!4791 (_ BitVec 64)) (_2!4791 V!24427)) )
))
(declare-datatypes ((List!15364 0))(
  ( (Nil!15361) (Cons!15360 (h!16495 tuple2!9560) (t!21687 List!15364)) )
))
(declare-datatypes ((ListLongMap!8385 0))(
  ( (ListLongMap!8386 (toList!4208 List!15364)) )
))
(declare-fun lt!368189 () ListLongMap!8385)

(declare-fun lt!368190 () ListLongMap!8385)

(assert (=> b!820444 (= lt!368189 lt!368190)))

(declare-fun zeroValueBefore!34 () V!24427)

(declare-datatypes ((Unit!27966 0))(
  ( (Unit!27967) )
))
(declare-fun lt!368184 () Unit!27966)

(declare-fun zeroValueAfter!34 () V!24427)

(declare-fun minValue!754 () V!24427)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!391 (array!45339 array!45341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24427 V!24427 V!24427 V!24427 (_ BitVec 32) Int) Unit!27966)

(assert (=> b!820444 (= lt!368184 (lemmaNoChangeToArrayThenSameMapNoExtras!391 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2303 (array!45339 array!45341 (_ BitVec 32) (_ BitVec 32) V!24427 V!24427 (_ BitVec 32) Int) ListLongMap!8385)

(assert (=> b!820444 (= lt!368190 (getCurrentListMapNoExtraKeys!2303 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820444 (= lt!368189 (getCurrentListMapNoExtraKeys!2303 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23455 () Bool)

(assert (=> mapIsEmpty!23455 mapRes!23455))

(declare-fun b!820445 () Bool)

(declare-fun res!559578 () Bool)

(assert (=> b!820445 (=> (not res!559578) (not e!455715))))

(assert (=> b!820445 (= res!559578 (and (= (size!22139 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22138 _keys!976) (size!22139 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820446 () Bool)

(assert (=> b!820446 (= e!455714 tp_is_empty!14569)))

(declare-fun b!820447 () Bool)

(declare-fun e!455718 () Bool)

(assert (=> b!820447 (= e!455718 (and e!455720 mapRes!23455))))

(declare-fun condMapEmpty!23455 () Bool)

(declare-fun mapDefault!23455 () ValueCell!6869)

(assert (=> b!820447 (= condMapEmpty!23455 (= (arr!21719 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6869)) mapDefault!23455)))))

(declare-fun b!820448 () Bool)

(declare-fun res!559574 () Bool)

(assert (=> b!820448 (=> (not res!559574) (not e!455715))))

(declare-datatypes ((List!15365 0))(
  ( (Nil!15362) (Cons!15361 (h!16496 (_ BitVec 64)) (t!21688 List!15365)) )
))
(declare-fun arrayNoDuplicates!0 (array!45339 (_ BitVec 32) List!15365) Bool)

(assert (=> b!820448 (= res!559574 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15362))))

(declare-fun res!559576 () Bool)

(assert (=> start!70718 (=> (not res!559576) (not e!455715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70718 (= res!559576 (validMask!0 mask!1312))))

(assert (=> start!70718 e!455715))

(assert (=> start!70718 tp_is_empty!14569))

(declare-fun array_inv!17389 (array!45339) Bool)

(assert (=> start!70718 (array_inv!17389 _keys!976)))

(assert (=> start!70718 true))

(declare-fun array_inv!17390 (array!45341) Bool)

(assert (=> start!70718 (and (array_inv!17390 _values!788) e!455718)))

(assert (=> start!70718 tp!45312))

(declare-fun e!455716 () Bool)

(declare-fun b!820449 () Bool)

(declare-fun lt!368185 () ListLongMap!8385)

(declare-fun +!1844 (ListLongMap!8385 tuple2!9560) ListLongMap!8385)

(assert (=> b!820449 (= e!455716 (= lt!368185 (+!1844 lt!368190 (tuple2!9561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820450 () Bool)

(assert (=> b!820450 (= e!455717 true)))

(declare-fun lt!368188 () tuple2!9560)

(declare-fun lt!368183 () tuple2!9560)

(declare-fun lt!368181 () ListLongMap!8385)

(assert (=> b!820450 (= lt!368181 (+!1844 (+!1844 lt!368190 lt!368188) lt!368183))))

(declare-fun lt!368187 () ListLongMap!8385)

(assert (=> b!820450 (= (+!1844 lt!368189 lt!368183) (+!1844 lt!368187 lt!368183))))

(declare-fun lt!368186 () Unit!27966)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!182 (ListLongMap!8385 (_ BitVec 64) V!24427 V!24427) Unit!27966)

(assert (=> b!820450 (= lt!368186 (addSameAsAddTwiceSameKeyDiffValues!182 lt!368189 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820450 (= lt!368183 (tuple2!9561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!820450 e!455716))

(declare-fun res!559575 () Bool)

(assert (=> b!820450 (=> (not res!559575) (not e!455716))))

(declare-fun lt!368182 () ListLongMap!8385)

(assert (=> b!820450 (= res!559575 (= lt!368182 lt!368187))))

(assert (=> b!820450 (= lt!368187 (+!1844 lt!368189 lt!368188))))

(assert (=> b!820450 (= lt!368188 (tuple2!9561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2395 (array!45339 array!45341 (_ BitVec 32) (_ BitVec 32) V!24427 V!24427 (_ BitVec 32) Int) ListLongMap!8385)

(assert (=> b!820450 (= lt!368185 (getCurrentListMap!2395 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820450 (= lt!368182 (getCurrentListMap!2395 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70718 res!559576) b!820445))

(assert (= (and b!820445 res!559578) b!820442))

(assert (= (and b!820442 res!559577) b!820448))

(assert (= (and b!820448 res!559574) b!820444))

(assert (= (and b!820444 (not res!559573)) b!820450))

(assert (= (and b!820450 res!559575) b!820449))

(assert (= (and b!820447 condMapEmpty!23455) mapIsEmpty!23455))

(assert (= (and b!820447 (not condMapEmpty!23455)) mapNonEmpty!23455))

(get-info :version)

(assert (= (and mapNonEmpty!23455 ((_ is ValueCellFull!6869) mapValue!23455)) b!820446))

(assert (= (and b!820447 ((_ is ValueCellFull!6869) mapDefault!23455)) b!820443))

(assert (= start!70718 b!820447))

(declare-fun m!762489 () Bool)

(assert (=> mapNonEmpty!23455 m!762489))

(declare-fun m!762491 () Bool)

(assert (=> b!820450 m!762491))

(declare-fun m!762493 () Bool)

(assert (=> b!820450 m!762493))

(declare-fun m!762495 () Bool)

(assert (=> b!820450 m!762495))

(declare-fun m!762497 () Bool)

(assert (=> b!820450 m!762497))

(declare-fun m!762499 () Bool)

(assert (=> b!820450 m!762499))

(declare-fun m!762501 () Bool)

(assert (=> b!820450 m!762501))

(declare-fun m!762503 () Bool)

(assert (=> b!820450 m!762503))

(assert (=> b!820450 m!762493))

(declare-fun m!762505 () Bool)

(assert (=> b!820450 m!762505))

(declare-fun m!762507 () Bool)

(assert (=> b!820449 m!762507))

(declare-fun m!762509 () Bool)

(assert (=> b!820442 m!762509))

(declare-fun m!762511 () Bool)

(assert (=> b!820444 m!762511))

(declare-fun m!762513 () Bool)

(assert (=> b!820444 m!762513))

(declare-fun m!762515 () Bool)

(assert (=> b!820444 m!762515))

(declare-fun m!762517 () Bool)

(assert (=> b!820448 m!762517))

(declare-fun m!762519 () Bool)

(assert (=> start!70718 m!762519))

(declare-fun m!762521 () Bool)

(assert (=> start!70718 m!762521))

(declare-fun m!762523 () Bool)

(assert (=> start!70718 m!762523))

(check-sat (not start!70718) (not b!820442) (not b!820449) (not b_next!12859) b_and!21711 (not b!820448) (not mapNonEmpty!23455) tp_is_empty!14569 (not b!820450) (not b!820444))
(check-sat b_and!21711 (not b_next!12859))
