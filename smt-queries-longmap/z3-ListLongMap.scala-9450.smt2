; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112310 () Bool)

(assert start!112310)

(declare-fun b_free!30705 () Bool)

(declare-fun b_next!30705 () Bool)

(assert (=> start!112310 (= b_free!30705 (not b_next!30705))))

(declare-fun tp!107751 () Bool)

(declare-fun b_and!49465 () Bool)

(assert (=> start!112310 (= tp!107751 b_and!49465)))

(declare-fun b!1330957 () Bool)

(declare-fun res!883181 () Bool)

(declare-fun e!758487 () Bool)

(assert (=> b!1330957 (=> (not res!883181) (not e!758487))))

(declare-datatypes ((V!53923 0))(
  ( (V!53924 (val!18382 Int)) )
))
(declare-datatypes ((ValueCell!17409 0))(
  ( (ValueCellFull!17409 (v!21019 V!53923)) (EmptyCell!17409) )
))
(declare-datatypes ((array!90114 0))(
  ( (array!90115 (arr!43523 (Array (_ BitVec 32) ValueCell!17409)) (size!44073 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90114)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90116 0))(
  ( (array!90117 (arr!43524 (Array (_ BitVec 32) (_ BitVec 64))) (size!44074 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90116)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53923)

(declare-fun zeroValue!1262 () V!53923)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23676 0))(
  ( (tuple2!23677 (_1!11849 (_ BitVec 64)) (_2!11849 V!53923)) )
))
(declare-datatypes ((List!30825 0))(
  ( (Nil!30822) (Cons!30821 (h!32030 tuple2!23676) (t!44943 List!30825)) )
))
(declare-datatypes ((ListLongMap!21333 0))(
  ( (ListLongMap!21334 (toList!10682 List!30825)) )
))
(declare-fun contains!8846 (ListLongMap!21333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5668 (array!90116 array!90114 (_ BitVec 32) (_ BitVec 32) V!53923 V!53923 (_ BitVec 32) Int) ListLongMap!21333)

(assert (=> b!1330957 (= res!883181 (contains!8846 (getCurrentListMap!5668 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330958 () Bool)

(declare-fun res!883174 () Bool)

(assert (=> b!1330958 (=> (not res!883174) (not e!758487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90116 (_ BitVec 32)) Bool)

(assert (=> b!1330958 (= res!883174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330959 () Bool)

(declare-fun res!883179 () Bool)

(assert (=> b!1330959 (=> (not res!883179) (not e!758487))))

(assert (=> b!1330959 (= res!883179 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330960 () Bool)

(declare-fun res!883178 () Bool)

(assert (=> b!1330960 (=> (not res!883178) (not e!758487))))

(assert (=> b!1330960 (= res!883178 (and (= (size!44073 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44074 _keys!1590) (size!44073 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330961 () Bool)

(declare-fun res!883177 () Bool)

(assert (=> b!1330961 (=> (not res!883177) (not e!758487))))

(assert (=> b!1330961 (= res!883177 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44074 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330962 () Bool)

(declare-fun e!758488 () Bool)

(declare-fun tp_is_empty!36615 () Bool)

(assert (=> b!1330962 (= e!758488 tp_is_empty!36615)))

(declare-fun mapNonEmpty!56596 () Bool)

(declare-fun mapRes!56596 () Bool)

(declare-fun tp!107752 () Bool)

(assert (=> mapNonEmpty!56596 (= mapRes!56596 (and tp!107752 e!758488))))

(declare-fun mapRest!56596 () (Array (_ BitVec 32) ValueCell!17409))

(declare-fun mapValue!56596 () ValueCell!17409)

(declare-fun mapKey!56596 () (_ BitVec 32))

(assert (=> mapNonEmpty!56596 (= (arr!43523 _values!1320) (store mapRest!56596 mapKey!56596 mapValue!56596))))

(declare-fun b!1330963 () Bool)

(declare-fun res!883175 () Bool)

(assert (=> b!1330963 (=> (not res!883175) (not e!758487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330963 (= res!883175 (validKeyInArray!0 (select (arr!43524 _keys!1590) from!1980)))))

(declare-fun b!1330964 () Bool)

(assert (=> b!1330964 (= e!758487 (not true))))

(declare-fun lt!591347 () ListLongMap!21333)

(assert (=> b!1330964 (contains!8846 lt!591347 k0!1153)))

(declare-datatypes ((Unit!43805 0))(
  ( (Unit!43806) )
))
(declare-fun lt!591345 () Unit!43805)

(declare-fun lt!591348 () V!53923)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!265 ((_ BitVec 64) (_ BitVec 64) V!53923 ListLongMap!21333) Unit!43805)

(assert (=> b!1330964 (= lt!591345 (lemmaInListMapAfterAddingDiffThenInBefore!265 k0!1153 (select (arr!43524 _keys!1590) from!1980) lt!591348 lt!591347))))

(declare-fun lt!591346 () ListLongMap!21333)

(assert (=> b!1330964 (contains!8846 lt!591346 k0!1153)))

(declare-fun lt!591349 () Unit!43805)

(assert (=> b!1330964 (= lt!591349 (lemmaInListMapAfterAddingDiffThenInBefore!265 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591346))))

(declare-fun +!4678 (ListLongMap!21333 tuple2!23676) ListLongMap!21333)

(assert (=> b!1330964 (= lt!591346 (+!4678 lt!591347 (tuple2!23677 (select (arr!43524 _keys!1590) from!1980) lt!591348)))))

(declare-fun get!21942 (ValueCell!17409 V!53923) V!53923)

(declare-fun dynLambda!3617 (Int (_ BitVec 64)) V!53923)

(assert (=> b!1330964 (= lt!591348 (get!21942 (select (arr!43523 _values!1320) from!1980) (dynLambda!3617 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6316 (array!90116 array!90114 (_ BitVec 32) (_ BitVec 32) V!53923 V!53923 (_ BitVec 32) Int) ListLongMap!21333)

(assert (=> b!1330964 (= lt!591347 (getCurrentListMapNoExtraKeys!6316 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun res!883176 () Bool)

(assert (=> start!112310 (=> (not res!883176) (not e!758487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112310 (= res!883176 (validMask!0 mask!1998))))

(assert (=> start!112310 e!758487))

(declare-fun e!758489 () Bool)

(declare-fun array_inv!32829 (array!90114) Bool)

(assert (=> start!112310 (and (array_inv!32829 _values!1320) e!758489)))

(assert (=> start!112310 true))

(declare-fun array_inv!32830 (array!90116) Bool)

(assert (=> start!112310 (array_inv!32830 _keys!1590)))

(assert (=> start!112310 tp!107751))

(assert (=> start!112310 tp_is_empty!36615))

(declare-fun b!1330965 () Bool)

(declare-fun e!758490 () Bool)

(assert (=> b!1330965 (= e!758490 tp_is_empty!36615)))

(declare-fun mapIsEmpty!56596 () Bool)

(assert (=> mapIsEmpty!56596 mapRes!56596))

(declare-fun b!1330966 () Bool)

(declare-fun res!883182 () Bool)

(assert (=> b!1330966 (=> (not res!883182) (not e!758487))))

(assert (=> b!1330966 (= res!883182 (not (= (select (arr!43524 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330967 () Bool)

(assert (=> b!1330967 (= e!758489 (and e!758490 mapRes!56596))))

(declare-fun condMapEmpty!56596 () Bool)

(declare-fun mapDefault!56596 () ValueCell!17409)

(assert (=> b!1330967 (= condMapEmpty!56596 (= (arr!43523 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17409)) mapDefault!56596)))))

(declare-fun b!1330968 () Bool)

(declare-fun res!883180 () Bool)

(assert (=> b!1330968 (=> (not res!883180) (not e!758487))))

(declare-datatypes ((List!30826 0))(
  ( (Nil!30823) (Cons!30822 (h!32031 (_ BitVec 64)) (t!44944 List!30826)) )
))
(declare-fun arrayNoDuplicates!0 (array!90116 (_ BitVec 32) List!30826) Bool)

(assert (=> b!1330968 (= res!883180 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30823))))

(assert (= (and start!112310 res!883176) b!1330960))

(assert (= (and b!1330960 res!883178) b!1330958))

(assert (= (and b!1330958 res!883174) b!1330968))

(assert (= (and b!1330968 res!883180) b!1330961))

(assert (= (and b!1330961 res!883177) b!1330957))

(assert (= (and b!1330957 res!883181) b!1330966))

(assert (= (and b!1330966 res!883182) b!1330963))

(assert (= (and b!1330963 res!883175) b!1330959))

(assert (= (and b!1330959 res!883179) b!1330964))

(assert (= (and b!1330967 condMapEmpty!56596) mapIsEmpty!56596))

(assert (= (and b!1330967 (not condMapEmpty!56596)) mapNonEmpty!56596))

(get-info :version)

(assert (= (and mapNonEmpty!56596 ((_ is ValueCellFull!17409) mapValue!56596)) b!1330962))

(assert (= (and b!1330967 ((_ is ValueCellFull!17409) mapDefault!56596)) b!1330965))

(assert (= start!112310 b!1330967))

(declare-fun b_lambda!23965 () Bool)

(assert (=> (not b_lambda!23965) (not b!1330964)))

(declare-fun t!44942 () Bool)

(declare-fun tb!11921 () Bool)

(assert (=> (and start!112310 (= defaultEntry!1323 defaultEntry!1323) t!44942) tb!11921))

(declare-fun result!24913 () Bool)

(assert (=> tb!11921 (= result!24913 tp_is_empty!36615)))

(assert (=> b!1330964 t!44942))

(declare-fun b_and!49467 () Bool)

(assert (= b_and!49465 (and (=> t!44942 result!24913) b_and!49467)))

(declare-fun m!1219619 () Bool)

(assert (=> b!1330963 m!1219619))

(assert (=> b!1330963 m!1219619))

(declare-fun m!1219621 () Bool)

(assert (=> b!1330963 m!1219621))

(assert (=> b!1330966 m!1219619))

(declare-fun m!1219623 () Bool)

(assert (=> b!1330957 m!1219623))

(assert (=> b!1330957 m!1219623))

(declare-fun m!1219625 () Bool)

(assert (=> b!1330957 m!1219625))

(assert (=> b!1330964 m!1219619))

(declare-fun m!1219627 () Bool)

(assert (=> b!1330964 m!1219627))

(declare-fun m!1219629 () Bool)

(assert (=> b!1330964 m!1219629))

(declare-fun m!1219631 () Bool)

(assert (=> b!1330964 m!1219631))

(assert (=> b!1330964 m!1219629))

(declare-fun m!1219633 () Bool)

(assert (=> b!1330964 m!1219633))

(declare-fun m!1219635 () Bool)

(assert (=> b!1330964 m!1219635))

(declare-fun m!1219637 () Bool)

(assert (=> b!1330964 m!1219637))

(declare-fun m!1219639 () Bool)

(assert (=> b!1330964 m!1219639))

(assert (=> b!1330964 m!1219631))

(declare-fun m!1219641 () Bool)

(assert (=> b!1330964 m!1219641))

(declare-fun m!1219643 () Bool)

(assert (=> b!1330964 m!1219643))

(assert (=> b!1330964 m!1219619))

(declare-fun m!1219645 () Bool)

(assert (=> b!1330968 m!1219645))

(declare-fun m!1219647 () Bool)

(assert (=> start!112310 m!1219647))

(declare-fun m!1219649 () Bool)

(assert (=> start!112310 m!1219649))

(declare-fun m!1219651 () Bool)

(assert (=> start!112310 m!1219651))

(declare-fun m!1219653 () Bool)

(assert (=> mapNonEmpty!56596 m!1219653))

(declare-fun m!1219655 () Bool)

(assert (=> b!1330958 m!1219655))

(check-sat (not b!1330958) (not start!112310) (not b!1330957) (not b!1330968) (not mapNonEmpty!56596) (not b!1330963) tp_is_empty!36615 (not b_lambda!23965) b_and!49467 (not b_next!30705) (not b!1330964))
(check-sat b_and!49467 (not b_next!30705))
