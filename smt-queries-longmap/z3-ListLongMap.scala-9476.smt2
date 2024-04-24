; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112688 () Bool)

(assert start!112688)

(declare-fun b_free!30859 () Bool)

(declare-fun b_next!30859 () Bool)

(assert (=> start!112688 (= b_free!30859 (not b_next!30859))))

(declare-fun tp!108214 () Bool)

(declare-fun b_and!49721 () Bool)

(assert (=> start!112688 (= tp!108214 b_and!49721)))

(declare-fun b!1334853 () Bool)

(declare-fun e!760498 () Bool)

(declare-fun e!760497 () Bool)

(declare-fun mapRes!56827 () Bool)

(assert (=> b!1334853 (= e!760498 (and e!760497 mapRes!56827))))

(declare-fun condMapEmpty!56827 () Bool)

(declare-datatypes ((V!54129 0))(
  ( (V!54130 (val!18459 Int)) )
))
(declare-datatypes ((ValueCell!17486 0))(
  ( (ValueCellFull!17486 (v!21091 V!54129)) (EmptyCell!17486) )
))
(declare-datatypes ((array!90511 0))(
  ( (array!90512 (arr!43717 (Array (_ BitVec 32) ValueCell!17486)) (size!44268 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90511)

(declare-fun mapDefault!56827 () ValueCell!17486)

(assert (=> b!1334853 (= condMapEmpty!56827 (= (arr!43717 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17486)) mapDefault!56827)))))

(declare-fun b!1334854 () Bool)

(declare-fun e!760499 () Bool)

(declare-fun e!760500 () Bool)

(assert (=> b!1334854 (= e!760499 e!760500)))

(declare-fun res!885500 () Bool)

(assert (=> b!1334854 (=> (not res!885500) (not e!760500))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90513 0))(
  ( (array!90514 (arr!43718 (Array (_ BitVec 32) (_ BitVec 64))) (size!44269 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90513)

(declare-fun lt!592632 () V!54129)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-datatypes ((tuple2!23818 0))(
  ( (tuple2!23819 (_1!11920 (_ BitVec 64)) (_2!11920 V!54129)) )
))
(declare-datatypes ((List!30975 0))(
  ( (Nil!30972) (Cons!30971 (h!32189 tuple2!23818) (t!45185 List!30975)) )
))
(declare-datatypes ((ListLongMap!21483 0))(
  ( (ListLongMap!21484 (toList!10757 List!30975)) )
))
(declare-fun lt!592631 () ListLongMap!21483)

(declare-fun contains!8933 (ListLongMap!21483 (_ BitVec 64)) Bool)

(declare-fun +!4750 (ListLongMap!21483 tuple2!23818) ListLongMap!21483)

(assert (=> b!1334854 (= res!885500 (contains!8933 (+!4750 lt!592631 (tuple2!23819 (select (arr!43718 _keys!1590) from!1980) lt!592632)) k0!1153))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54129)

(declare-fun zeroValue!1262 () V!54129)

(declare-fun getCurrentListMapNoExtraKeys!6394 (array!90513 array!90511 (_ BitVec 32) (_ BitVec 32) V!54129 V!54129 (_ BitVec 32) Int) ListLongMap!21483)

(assert (=> b!1334854 (= lt!592631 (getCurrentListMapNoExtraKeys!6394 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22069 (ValueCell!17486 V!54129) V!54129)

(declare-fun dynLambda!3704 (Int (_ BitVec 64)) V!54129)

(assert (=> b!1334854 (= lt!592632 (get!22069 (select (arr!43717 _values!1320) from!1980) (dynLambda!3704 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334855 () Bool)

(declare-fun tp_is_empty!36769 () Bool)

(assert (=> b!1334855 (= e!760497 tp_is_empty!36769)))

(declare-fun b!1334856 () Bool)

(declare-fun res!885499 () Bool)

(assert (=> b!1334856 (=> (not res!885499) (not e!760499))))

(assert (=> b!1334856 (= res!885499 (and (= (size!44268 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44269 _keys!1590) (size!44268 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56827 () Bool)

(declare-fun tp!108213 () Bool)

(declare-fun e!760501 () Bool)

(assert (=> mapNonEmpty!56827 (= mapRes!56827 (and tp!108213 e!760501))))

(declare-fun mapKey!56827 () (_ BitVec 32))

(declare-fun mapRest!56827 () (Array (_ BitVec 32) ValueCell!17486))

(declare-fun mapValue!56827 () ValueCell!17486)

(assert (=> mapNonEmpty!56827 (= (arr!43717 _values!1320) (store mapRest!56827 mapKey!56827 mapValue!56827))))

(declare-fun b!1334857 () Bool)

(declare-fun res!885497 () Bool)

(assert (=> b!1334857 (=> (not res!885497) (not e!760499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90513 (_ BitVec 32)) Bool)

(assert (=> b!1334857 (= res!885497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334858 () Bool)

(declare-fun res!885506 () Bool)

(assert (=> b!1334858 (=> (not res!885506) (not e!760500))))

(assert (=> b!1334858 (= res!885506 (not (= k0!1153 (select (arr!43718 _keys!1590) from!1980))))))

(declare-fun res!885501 () Bool)

(assert (=> start!112688 (=> (not res!885501) (not e!760499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112688 (= res!885501 (validMask!0 mask!1998))))

(assert (=> start!112688 e!760499))

(declare-fun array_inv!33245 (array!90511) Bool)

(assert (=> start!112688 (and (array_inv!33245 _values!1320) e!760498)))

(assert (=> start!112688 true))

(declare-fun array_inv!33246 (array!90513) Bool)

(assert (=> start!112688 (array_inv!33246 _keys!1590)))

(assert (=> start!112688 tp!108214))

(assert (=> start!112688 tp_is_empty!36769))

(declare-fun b!1334859 () Bool)

(declare-fun res!885498 () Bool)

(assert (=> b!1334859 (=> (not res!885498) (not e!760499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334859 (= res!885498 (validKeyInArray!0 (select (arr!43718 _keys!1590) from!1980)))))

(declare-fun b!1334860 () Bool)

(declare-fun res!885503 () Bool)

(assert (=> b!1334860 (=> (not res!885503) (not e!760499))))

(declare-fun getCurrentListMap!5721 (array!90513 array!90511 (_ BitVec 32) (_ BitVec 32) V!54129 V!54129 (_ BitVec 32) Int) ListLongMap!21483)

(assert (=> b!1334860 (= res!885503 (contains!8933 (getCurrentListMap!5721 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56827 () Bool)

(assert (=> mapIsEmpty!56827 mapRes!56827))

(declare-fun b!1334861 () Bool)

(assert (=> b!1334861 (= e!760500 (not true))))

(assert (=> b!1334861 (contains!8933 lt!592631 k0!1153)))

(declare-datatypes ((Unit!43802 0))(
  ( (Unit!43803) )
))
(declare-fun lt!592630 () Unit!43802)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!289 ((_ BitVec 64) (_ BitVec 64) V!54129 ListLongMap!21483) Unit!43802)

(assert (=> b!1334861 (= lt!592630 (lemmaInListMapAfterAddingDiffThenInBefore!289 k0!1153 (select (arr!43718 _keys!1590) from!1980) lt!592632 lt!592631))))

(declare-fun b!1334862 () Bool)

(declare-fun res!885502 () Bool)

(assert (=> b!1334862 (=> (not res!885502) (not e!760499))))

(declare-datatypes ((List!30976 0))(
  ( (Nil!30973) (Cons!30972 (h!32190 (_ BitVec 64)) (t!45186 List!30976)) )
))
(declare-fun arrayNoDuplicates!0 (array!90513 (_ BitVec 32) List!30976) Bool)

(assert (=> b!1334862 (= res!885502 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30973))))

(declare-fun b!1334863 () Bool)

(declare-fun res!885496 () Bool)

(assert (=> b!1334863 (=> (not res!885496) (not e!760499))))

(assert (=> b!1334863 (= res!885496 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334864 () Bool)

(assert (=> b!1334864 (= e!760501 tp_is_empty!36769)))

(declare-fun b!1334865 () Bool)

(declare-fun res!885505 () Bool)

(assert (=> b!1334865 (=> (not res!885505) (not e!760499))))

(assert (=> b!1334865 (= res!885505 (not (= (select (arr!43718 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1334866 () Bool)

(declare-fun res!885504 () Bool)

(assert (=> b!1334866 (=> (not res!885504) (not e!760499))))

(assert (=> b!1334866 (= res!885504 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44269 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112688 res!885501) b!1334856))

(assert (= (and b!1334856 res!885499) b!1334857))

(assert (= (and b!1334857 res!885497) b!1334862))

(assert (= (and b!1334862 res!885502) b!1334866))

(assert (= (and b!1334866 res!885504) b!1334860))

(assert (= (and b!1334860 res!885503) b!1334865))

(assert (= (and b!1334865 res!885505) b!1334859))

(assert (= (and b!1334859 res!885498) b!1334863))

(assert (= (and b!1334863 res!885496) b!1334854))

(assert (= (and b!1334854 res!885500) b!1334858))

(assert (= (and b!1334858 res!885506) b!1334861))

(assert (= (and b!1334853 condMapEmpty!56827) mapIsEmpty!56827))

(assert (= (and b!1334853 (not condMapEmpty!56827)) mapNonEmpty!56827))

(get-info :version)

(assert (= (and mapNonEmpty!56827 ((_ is ValueCellFull!17486) mapValue!56827)) b!1334864))

(assert (= (and b!1334853 ((_ is ValueCellFull!17486) mapDefault!56827)) b!1334855))

(assert (= start!112688 b!1334853))

(declare-fun b_lambda!24059 () Bool)

(assert (=> (not b_lambda!24059) (not b!1334854)))

(declare-fun t!45184 () Bool)

(declare-fun tb!12013 () Bool)

(assert (=> (and start!112688 (= defaultEntry!1323 defaultEntry!1323) t!45184) tb!12013))

(declare-fun result!25105 () Bool)

(assert (=> tb!12013 (= result!25105 tp_is_empty!36769)))

(assert (=> b!1334854 t!45184))

(declare-fun b_and!49723 () Bool)

(assert (= b_and!49721 (and (=> t!45184 result!25105) b_and!49723)))

(declare-fun m!1223681 () Bool)

(assert (=> b!1334862 m!1223681))

(declare-fun m!1223683 () Bool)

(assert (=> b!1334865 m!1223683))

(declare-fun m!1223685 () Bool)

(assert (=> start!112688 m!1223685))

(declare-fun m!1223687 () Bool)

(assert (=> start!112688 m!1223687))

(declare-fun m!1223689 () Bool)

(assert (=> start!112688 m!1223689))

(declare-fun m!1223691 () Bool)

(assert (=> b!1334857 m!1223691))

(declare-fun m!1223693 () Bool)

(assert (=> mapNonEmpty!56827 m!1223693))

(assert (=> b!1334859 m!1223683))

(assert (=> b!1334859 m!1223683))

(declare-fun m!1223695 () Bool)

(assert (=> b!1334859 m!1223695))

(declare-fun m!1223697 () Bool)

(assert (=> b!1334861 m!1223697))

(assert (=> b!1334861 m!1223683))

(assert (=> b!1334861 m!1223683))

(declare-fun m!1223699 () Bool)

(assert (=> b!1334861 m!1223699))

(assert (=> b!1334858 m!1223683))

(declare-fun m!1223701 () Bool)

(assert (=> b!1334860 m!1223701))

(assert (=> b!1334860 m!1223701))

(declare-fun m!1223703 () Bool)

(assert (=> b!1334860 m!1223703))

(declare-fun m!1223705 () Bool)

(assert (=> b!1334854 m!1223705))

(declare-fun m!1223707 () Bool)

(assert (=> b!1334854 m!1223707))

(assert (=> b!1334854 m!1223705))

(declare-fun m!1223709 () Bool)

(assert (=> b!1334854 m!1223709))

(declare-fun m!1223711 () Bool)

(assert (=> b!1334854 m!1223711))

(declare-fun m!1223713 () Bool)

(assert (=> b!1334854 m!1223713))

(assert (=> b!1334854 m!1223707))

(assert (=> b!1334854 m!1223711))

(declare-fun m!1223715 () Bool)

(assert (=> b!1334854 m!1223715))

(assert (=> b!1334854 m!1223683))

(check-sat (not b_next!30859) (not b!1334860) (not b!1334857) b_and!49723 (not b!1334859) tp_is_empty!36769 (not mapNonEmpty!56827) (not b!1334854) (not b!1334862) (not b!1334861) (not start!112688) (not b_lambda!24059))
(check-sat b_and!49723 (not b_next!30859))
