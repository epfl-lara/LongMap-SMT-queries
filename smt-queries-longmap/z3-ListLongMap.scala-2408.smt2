; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38112 () Bool)

(assert start!38112)

(declare-fun b_free!9015 () Bool)

(declare-fun b_next!9015 () Bool)

(assert (=> start!38112 (= b_free!9015 (not b_next!9015))))

(declare-fun tp!31823 () Bool)

(declare-fun b_and!16365 () Bool)

(assert (=> start!38112 (= tp!31823 b_and!16365)))

(declare-fun b!392640 () Bool)

(declare-fun res!224864 () Bool)

(declare-fun e!237764 () Bool)

(assert (=> b!392640 (=> (not res!224864) (not e!237764))))

(declare-datatypes ((array!23281 0))(
  ( (array!23282 (arr!11100 (Array (_ BitVec 32) (_ BitVec 64))) (size!11452 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23281)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23281 (_ BitVec 32)) Bool)

(assert (=> b!392640 (= res!224864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392641 () Bool)

(declare-fun e!237765 () Bool)

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!392641 (= e!237765 (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!237769 () Bool)

(assert (=> b!392641 e!237769))

(declare-fun res!224872 () Bool)

(assert (=> b!392641 (=> (not res!224872) (not e!237769))))

(declare-datatypes ((V!14021 0))(
  ( (V!14022 (val!4888 Int)) )
))
(declare-datatypes ((tuple2!6594 0))(
  ( (tuple2!6595 (_1!3308 (_ BitVec 64)) (_2!3308 V!14021)) )
))
(declare-datatypes ((List!6447 0))(
  ( (Nil!6444) (Cons!6443 (h!7299 tuple2!6594) (t!11615 List!6447)) )
))
(declare-datatypes ((ListLongMap!5507 0))(
  ( (ListLongMap!5508 (toList!2769 List!6447)) )
))
(declare-fun lt!185578 () ListLongMap!5507)

(declare-fun lt!185579 () tuple2!6594)

(declare-fun lt!185582 () ListLongMap!5507)

(declare-fun +!1064 (ListLongMap!5507 tuple2!6594) ListLongMap!5507)

(assert (=> b!392641 (= res!224872 (= lt!185582 (+!1064 lt!185578 lt!185579)))))

(declare-fun minValue!472 () V!14021)

(assert (=> b!392641 (= lt!185579 (tuple2!6595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392642 () Bool)

(declare-fun e!237768 () Bool)

(assert (=> b!392642 (= e!237764 e!237768)))

(declare-fun res!224867 () Bool)

(assert (=> b!392642 (=> (not res!224867) (not e!237768))))

(declare-fun lt!185581 () array!23281)

(assert (=> b!392642 (= res!224867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185581 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!392642 (= lt!185581 (array!23282 (store (arr!11100 _keys!658) i!548 k0!778) (size!11452 _keys!658)))))

(declare-fun b!392643 () Bool)

(assert (=> b!392643 (= e!237768 (not e!237765))))

(declare-fun res!224866 () Bool)

(assert (=> b!392643 (=> res!224866 e!237765)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392643 (= res!224866 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!185574 () ListLongMap!5507)

(declare-datatypes ((ValueCell!4500 0))(
  ( (ValueCellFull!4500 (v!7121 V!14021)) (EmptyCell!4500) )
))
(declare-datatypes ((array!23283 0))(
  ( (array!23284 (arr!11101 (Array (_ BitVec 32) ValueCell!4500)) (size!11453 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23283)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14021)

(declare-fun getCurrentListMap!2111 (array!23281 array!23283 (_ BitVec 32) (_ BitVec 32) V!14021 V!14021 (_ BitVec 32) Int) ListLongMap!5507)

(assert (=> b!392643 (= lt!185574 (getCurrentListMap!2111 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185580 () array!23283)

(assert (=> b!392643 (= lt!185582 (getCurrentListMap!2111 lt!185581 lt!185580 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185577 () ListLongMap!5507)

(assert (=> b!392643 (and (= lt!185578 lt!185577) (= lt!185577 lt!185578))))

(declare-fun v!373 () V!14021)

(declare-fun lt!185575 () ListLongMap!5507)

(assert (=> b!392643 (= lt!185577 (+!1064 lt!185575 (tuple2!6595 k0!778 v!373)))))

(declare-datatypes ((Unit!12014 0))(
  ( (Unit!12015) )
))
(declare-fun lt!185576 () Unit!12014)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!275 (array!23281 array!23283 (_ BitVec 32) (_ BitVec 32) V!14021 V!14021 (_ BitVec 32) (_ BitVec 64) V!14021 (_ BitVec 32) Int) Unit!12014)

(assert (=> b!392643 (= lt!185576 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!275 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!991 (array!23281 array!23283 (_ BitVec 32) (_ BitVec 32) V!14021 V!14021 (_ BitVec 32) Int) ListLongMap!5507)

(assert (=> b!392643 (= lt!185578 (getCurrentListMapNoExtraKeys!991 lt!185581 lt!185580 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392643 (= lt!185580 (array!23284 (store (arr!11101 _values!506) i!548 (ValueCellFull!4500 v!373)) (size!11453 _values!506)))))

(assert (=> b!392643 (= lt!185575 (getCurrentListMapNoExtraKeys!991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392644 () Bool)

(declare-fun res!224865 () Bool)

(assert (=> b!392644 (=> (not res!224865) (not e!237768))))

(declare-datatypes ((List!6448 0))(
  ( (Nil!6445) (Cons!6444 (h!7300 (_ BitVec 64)) (t!11616 List!6448)) )
))
(declare-fun arrayNoDuplicates!0 (array!23281 (_ BitVec 32) List!6448) Bool)

(assert (=> b!392644 (= res!224865 (arrayNoDuplicates!0 lt!185581 #b00000000000000000000000000000000 Nil!6445))))

(declare-fun b!392645 () Bool)

(declare-fun res!224874 () Bool)

(assert (=> b!392645 (=> (not res!224874) (not e!237764))))

(assert (=> b!392645 (= res!224874 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11452 _keys!658))))))

(declare-fun b!392646 () Bool)

(declare-fun res!224868 () Bool)

(assert (=> b!392646 (=> (not res!224868) (not e!237769))))

(assert (=> b!392646 (= res!224868 (= lt!185582 (+!1064 lt!185577 lt!185579)))))

(declare-fun b!392647 () Bool)

(declare-fun res!224871 () Bool)

(assert (=> b!392647 (=> (not res!224871) (not e!237764))))

(assert (=> b!392647 (= res!224871 (and (= (size!11453 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11452 _keys!658) (size!11453 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16122 () Bool)

(declare-fun mapRes!16122 () Bool)

(declare-fun tp!31824 () Bool)

(declare-fun e!237762 () Bool)

(assert (=> mapNonEmpty!16122 (= mapRes!16122 (and tp!31824 e!237762))))

(declare-fun mapValue!16122 () ValueCell!4500)

(declare-fun mapRest!16122 () (Array (_ BitVec 32) ValueCell!4500))

(declare-fun mapKey!16122 () (_ BitVec 32))

(assert (=> mapNonEmpty!16122 (= (arr!11101 _values!506) (store mapRest!16122 mapKey!16122 mapValue!16122))))

(declare-fun res!224863 () Bool)

(assert (=> start!38112 (=> (not res!224863) (not e!237764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38112 (= res!224863 (validMask!0 mask!970))))

(assert (=> start!38112 e!237764))

(declare-fun e!237767 () Bool)

(declare-fun array_inv!8152 (array!23283) Bool)

(assert (=> start!38112 (and (array_inv!8152 _values!506) e!237767)))

(assert (=> start!38112 tp!31823))

(assert (=> start!38112 true))

(declare-fun tp_is_empty!9687 () Bool)

(assert (=> start!38112 tp_is_empty!9687))

(declare-fun array_inv!8153 (array!23281) Bool)

(assert (=> start!38112 (array_inv!8153 _keys!658)))

(declare-fun b!392648 () Bool)

(assert (=> b!392648 (= e!237769 (= lt!185574 (+!1064 lt!185575 lt!185579)))))

(declare-fun b!392649 () Bool)

(declare-fun res!224870 () Bool)

(assert (=> b!392649 (=> (not res!224870) (not e!237764))))

(assert (=> b!392649 (= res!224870 (or (= (select (arr!11100 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11100 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392650 () Bool)

(declare-fun e!237766 () Bool)

(assert (=> b!392650 (= e!237767 (and e!237766 mapRes!16122))))

(declare-fun condMapEmpty!16122 () Bool)

(declare-fun mapDefault!16122 () ValueCell!4500)

(assert (=> b!392650 (= condMapEmpty!16122 (= (arr!11101 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4500)) mapDefault!16122)))))

(declare-fun b!392651 () Bool)

(declare-fun res!224873 () Bool)

(assert (=> b!392651 (=> (not res!224873) (not e!237764))))

(declare-fun arrayContainsKey!0 (array!23281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392651 (= res!224873 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!392652 () Bool)

(assert (=> b!392652 (= e!237766 tp_is_empty!9687)))

(declare-fun mapIsEmpty!16122 () Bool)

(assert (=> mapIsEmpty!16122 mapRes!16122))

(declare-fun b!392653 () Bool)

(declare-fun res!224862 () Bool)

(assert (=> b!392653 (=> (not res!224862) (not e!237764))))

(assert (=> b!392653 (= res!224862 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6445))))

(declare-fun b!392654 () Bool)

(assert (=> b!392654 (= e!237762 tp_is_empty!9687)))

(declare-fun b!392655 () Bool)

(declare-fun res!224869 () Bool)

(assert (=> b!392655 (=> (not res!224869) (not e!237764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392655 (= res!224869 (validKeyInArray!0 k0!778))))

(assert (= (and start!38112 res!224863) b!392647))

(assert (= (and b!392647 res!224871) b!392640))

(assert (= (and b!392640 res!224864) b!392653))

(assert (= (and b!392653 res!224862) b!392645))

(assert (= (and b!392645 res!224874) b!392655))

(assert (= (and b!392655 res!224869) b!392649))

(assert (= (and b!392649 res!224870) b!392651))

(assert (= (and b!392651 res!224873) b!392642))

(assert (= (and b!392642 res!224867) b!392644))

(assert (= (and b!392644 res!224865) b!392643))

(assert (= (and b!392643 (not res!224866)) b!392641))

(assert (= (and b!392641 res!224872) b!392646))

(assert (= (and b!392646 res!224868) b!392648))

(assert (= (and b!392650 condMapEmpty!16122) mapIsEmpty!16122))

(assert (= (and b!392650 (not condMapEmpty!16122)) mapNonEmpty!16122))

(get-info :version)

(assert (= (and mapNonEmpty!16122 ((_ is ValueCellFull!4500) mapValue!16122)) b!392654))

(assert (= (and b!392650 ((_ is ValueCellFull!4500) mapDefault!16122)) b!392652))

(assert (= start!38112 b!392650))

(declare-fun m!389055 () Bool)

(assert (=> b!392644 m!389055))

(declare-fun m!389057 () Bool)

(assert (=> b!392646 m!389057))

(declare-fun m!389059 () Bool)

(assert (=> b!392643 m!389059))

(declare-fun m!389061 () Bool)

(assert (=> b!392643 m!389061))

(declare-fun m!389063 () Bool)

(assert (=> b!392643 m!389063))

(declare-fun m!389065 () Bool)

(assert (=> b!392643 m!389065))

(declare-fun m!389067 () Bool)

(assert (=> b!392643 m!389067))

(declare-fun m!389069 () Bool)

(assert (=> b!392643 m!389069))

(declare-fun m!389071 () Bool)

(assert (=> b!392643 m!389071))

(declare-fun m!389073 () Bool)

(assert (=> b!392655 m!389073))

(declare-fun m!389075 () Bool)

(assert (=> mapNonEmpty!16122 m!389075))

(declare-fun m!389077 () Bool)

(assert (=> b!392648 m!389077))

(declare-fun m!389079 () Bool)

(assert (=> b!392653 m!389079))

(declare-fun m!389081 () Bool)

(assert (=> b!392640 m!389081))

(declare-fun m!389083 () Bool)

(assert (=> b!392641 m!389083))

(declare-fun m!389085 () Bool)

(assert (=> b!392649 m!389085))

(declare-fun m!389087 () Bool)

(assert (=> b!392651 m!389087))

(declare-fun m!389089 () Bool)

(assert (=> start!38112 m!389089))

(declare-fun m!389091 () Bool)

(assert (=> start!38112 m!389091))

(declare-fun m!389093 () Bool)

(assert (=> start!38112 m!389093))

(declare-fun m!389095 () Bool)

(assert (=> b!392642 m!389095))

(declare-fun m!389097 () Bool)

(assert (=> b!392642 m!389097))

(check-sat (not b!392653) (not b!392648) (not b!392646) (not b!392655) (not b!392640) (not b!392643) (not start!38112) (not b!392641) tp_is_empty!9687 (not mapNonEmpty!16122) (not b!392644) (not b!392642) (not b!392651) (not b_next!9015) b_and!16365)
(check-sat b_and!16365 (not b_next!9015))
(get-model)

(declare-fun d!73165 () Bool)

(declare-fun res!224918 () Bool)

(declare-fun e!237798 () Bool)

(assert (=> d!73165 (=> res!224918 e!237798)))

(assert (=> d!73165 (= res!224918 (= (select (arr!11100 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73165 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!237798)))

(declare-fun b!392708 () Bool)

(declare-fun e!237799 () Bool)

(assert (=> b!392708 (= e!237798 e!237799)))

(declare-fun res!224919 () Bool)

(assert (=> b!392708 (=> (not res!224919) (not e!237799))))

(assert (=> b!392708 (= res!224919 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11452 _keys!658)))))

(declare-fun b!392709 () Bool)

(assert (=> b!392709 (= e!237799 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73165 (not res!224918)) b!392708))

(assert (= (and b!392708 res!224919) b!392709))

(declare-fun m!389143 () Bool)

(assert (=> d!73165 m!389143))

(declare-fun m!389145 () Bool)

(assert (=> b!392709 m!389145))

(assert (=> b!392651 d!73165))

(declare-fun d!73167 () Bool)

(declare-fun e!237802 () Bool)

(assert (=> d!73167 e!237802))

(declare-fun res!224925 () Bool)

(assert (=> d!73167 (=> (not res!224925) (not e!237802))))

(declare-fun lt!185621 () ListLongMap!5507)

(declare-fun contains!2467 (ListLongMap!5507 (_ BitVec 64)) Bool)

(assert (=> d!73167 (= res!224925 (contains!2467 lt!185621 (_1!3308 lt!185579)))))

(declare-fun lt!185620 () List!6447)

(assert (=> d!73167 (= lt!185621 (ListLongMap!5508 lt!185620))))

(declare-fun lt!185619 () Unit!12014)

(declare-fun lt!185618 () Unit!12014)

(assert (=> d!73167 (= lt!185619 lt!185618)))

(declare-datatypes ((Option!370 0))(
  ( (Some!369 (v!7126 V!14021)) (None!368) )
))
(declare-fun getValueByKey!364 (List!6447 (_ BitVec 64)) Option!370)

(assert (=> d!73167 (= (getValueByKey!364 lt!185620 (_1!3308 lt!185579)) (Some!369 (_2!3308 lt!185579)))))

(declare-fun lemmaContainsTupThenGetReturnValue!186 (List!6447 (_ BitVec 64) V!14021) Unit!12014)

(assert (=> d!73167 (= lt!185618 (lemmaContainsTupThenGetReturnValue!186 lt!185620 (_1!3308 lt!185579) (_2!3308 lt!185579)))))

(declare-fun insertStrictlySorted!189 (List!6447 (_ BitVec 64) V!14021) List!6447)

(assert (=> d!73167 (= lt!185620 (insertStrictlySorted!189 (toList!2769 lt!185578) (_1!3308 lt!185579) (_2!3308 lt!185579)))))

(assert (=> d!73167 (= (+!1064 lt!185578 lt!185579) lt!185621)))

(declare-fun b!392714 () Bool)

(declare-fun res!224924 () Bool)

(assert (=> b!392714 (=> (not res!224924) (not e!237802))))

(assert (=> b!392714 (= res!224924 (= (getValueByKey!364 (toList!2769 lt!185621) (_1!3308 lt!185579)) (Some!369 (_2!3308 lt!185579))))))

(declare-fun b!392715 () Bool)

(declare-fun contains!2468 (List!6447 tuple2!6594) Bool)

(assert (=> b!392715 (= e!237802 (contains!2468 (toList!2769 lt!185621) lt!185579))))

(assert (= (and d!73167 res!224925) b!392714))

(assert (= (and b!392714 res!224924) b!392715))

(declare-fun m!389147 () Bool)

(assert (=> d!73167 m!389147))

(declare-fun m!389149 () Bool)

(assert (=> d!73167 m!389149))

(declare-fun m!389151 () Bool)

(assert (=> d!73167 m!389151))

(declare-fun m!389153 () Bool)

(assert (=> d!73167 m!389153))

(declare-fun m!389155 () Bool)

(assert (=> b!392714 m!389155))

(declare-fun m!389157 () Bool)

(assert (=> b!392715 m!389157))

(assert (=> b!392641 d!73167))

(declare-fun d!73169 () Bool)

(declare-fun res!224930 () Bool)

(declare-fun e!237810 () Bool)

(assert (=> d!73169 (=> res!224930 e!237810)))

(assert (=> d!73169 (= res!224930 (bvsge #b00000000000000000000000000000000 (size!11452 lt!185581)))))

(assert (=> d!73169 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185581 mask!970) e!237810)))

(declare-fun b!392724 () Bool)

(declare-fun e!237811 () Bool)

(assert (=> b!392724 (= e!237810 e!237811)))

(declare-fun c!54386 () Bool)

(assert (=> b!392724 (= c!54386 (validKeyInArray!0 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)))))

(declare-fun b!392725 () Bool)

(declare-fun e!237809 () Bool)

(declare-fun call!27725 () Bool)

(assert (=> b!392725 (= e!237809 call!27725)))

(declare-fun b!392726 () Bool)

(assert (=> b!392726 (= e!237811 e!237809)))

(declare-fun lt!185629 () (_ BitVec 64))

(assert (=> b!392726 (= lt!185629 (select (arr!11100 lt!185581) #b00000000000000000000000000000000))))

(declare-fun lt!185630 () Unit!12014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23281 (_ BitVec 64) (_ BitVec 32)) Unit!12014)

(assert (=> b!392726 (= lt!185630 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!185581 lt!185629 #b00000000000000000000000000000000))))

(assert (=> b!392726 (arrayContainsKey!0 lt!185581 lt!185629 #b00000000000000000000000000000000)))

(declare-fun lt!185628 () Unit!12014)

(assert (=> b!392726 (= lt!185628 lt!185630)))

(declare-fun res!224931 () Bool)

(declare-datatypes ((SeekEntryResult!3517 0))(
  ( (MissingZero!3517 (index!16247 (_ BitVec 32))) (Found!3517 (index!16248 (_ BitVec 32))) (Intermediate!3517 (undefined!4329 Bool) (index!16249 (_ BitVec 32)) (x!38433 (_ BitVec 32))) (Undefined!3517) (MissingVacant!3517 (index!16250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23281 (_ BitVec 32)) SeekEntryResult!3517)

(assert (=> b!392726 (= res!224931 (= (seekEntryOrOpen!0 (select (arr!11100 lt!185581) #b00000000000000000000000000000000) lt!185581 mask!970) (Found!3517 #b00000000000000000000000000000000)))))

(assert (=> b!392726 (=> (not res!224931) (not e!237809))))

(declare-fun b!392727 () Bool)

(assert (=> b!392727 (= e!237811 call!27725)))

(declare-fun bm!27722 () Bool)

(assert (=> bm!27722 (= call!27725 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!185581 mask!970))))

(assert (= (and d!73169 (not res!224930)) b!392724))

(assert (= (and b!392724 c!54386) b!392726))

(assert (= (and b!392724 (not c!54386)) b!392727))

(assert (= (and b!392726 res!224931) b!392725))

(assert (= (or b!392725 b!392727) bm!27722))

(declare-fun m!389159 () Bool)

(assert (=> b!392724 m!389159))

(assert (=> b!392724 m!389159))

(declare-fun m!389161 () Bool)

(assert (=> b!392724 m!389161))

(assert (=> b!392726 m!389159))

(declare-fun m!389163 () Bool)

(assert (=> b!392726 m!389163))

(declare-fun m!389165 () Bool)

(assert (=> b!392726 m!389165))

(assert (=> b!392726 m!389159))

(declare-fun m!389167 () Bool)

(assert (=> b!392726 m!389167))

(declare-fun m!389169 () Bool)

(assert (=> bm!27722 m!389169))

(assert (=> b!392642 d!73169))

(declare-fun d!73171 () Bool)

(declare-fun res!224932 () Bool)

(declare-fun e!237813 () Bool)

(assert (=> d!73171 (=> res!224932 e!237813)))

(assert (=> d!73171 (= res!224932 (bvsge #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(assert (=> d!73171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!237813)))

(declare-fun b!392728 () Bool)

(declare-fun e!237814 () Bool)

(assert (=> b!392728 (= e!237813 e!237814)))

(declare-fun c!54387 () Bool)

(assert (=> b!392728 (= c!54387 (validKeyInArray!0 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392729 () Bool)

(declare-fun e!237812 () Bool)

(declare-fun call!27726 () Bool)

(assert (=> b!392729 (= e!237812 call!27726)))

(declare-fun b!392730 () Bool)

(assert (=> b!392730 (= e!237814 e!237812)))

(declare-fun lt!185632 () (_ BitVec 64))

(assert (=> b!392730 (= lt!185632 (select (arr!11100 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185633 () Unit!12014)

(assert (=> b!392730 (= lt!185633 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!185632 #b00000000000000000000000000000000))))

(assert (=> b!392730 (arrayContainsKey!0 _keys!658 lt!185632 #b00000000000000000000000000000000)))

(declare-fun lt!185631 () Unit!12014)

(assert (=> b!392730 (= lt!185631 lt!185633)))

(declare-fun res!224933 () Bool)

(assert (=> b!392730 (= res!224933 (= (seekEntryOrOpen!0 (select (arr!11100 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3517 #b00000000000000000000000000000000)))))

(assert (=> b!392730 (=> (not res!224933) (not e!237812))))

(declare-fun b!392731 () Bool)

(assert (=> b!392731 (= e!237814 call!27726)))

(declare-fun bm!27723 () Bool)

(assert (=> bm!27723 (= call!27726 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!73171 (not res!224932)) b!392728))

(assert (= (and b!392728 c!54387) b!392730))

(assert (= (and b!392728 (not c!54387)) b!392731))

(assert (= (and b!392730 res!224933) b!392729))

(assert (= (or b!392729 b!392731) bm!27723))

(assert (=> b!392728 m!389143))

(assert (=> b!392728 m!389143))

(declare-fun m!389171 () Bool)

(assert (=> b!392728 m!389171))

(assert (=> b!392730 m!389143))

(declare-fun m!389173 () Bool)

(assert (=> b!392730 m!389173))

(declare-fun m!389175 () Bool)

(assert (=> b!392730 m!389175))

(assert (=> b!392730 m!389143))

(declare-fun m!389177 () Bool)

(assert (=> b!392730 m!389177))

(declare-fun m!389179 () Bool)

(assert (=> bm!27723 m!389179))

(assert (=> b!392640 d!73171))

(declare-fun b!392742 () Bool)

(declare-fun e!237823 () Bool)

(declare-fun call!27729 () Bool)

(assert (=> b!392742 (= e!237823 call!27729)))

(declare-fun bm!27726 () Bool)

(declare-fun c!54390 () Bool)

(assert (=> bm!27726 (= call!27729 (arrayNoDuplicates!0 lt!185581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54390 (Cons!6444 (select (arr!11100 lt!185581) #b00000000000000000000000000000000) Nil!6445) Nil!6445)))))

(declare-fun b!392743 () Bool)

(declare-fun e!237826 () Bool)

(declare-fun contains!2469 (List!6448 (_ BitVec 64)) Bool)

(assert (=> b!392743 (= e!237826 (contains!2469 Nil!6445 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)))))

(declare-fun b!392744 () Bool)

(declare-fun e!237825 () Bool)

(declare-fun e!237824 () Bool)

(assert (=> b!392744 (= e!237825 e!237824)))

(declare-fun res!224940 () Bool)

(assert (=> b!392744 (=> (not res!224940) (not e!237824))))

(assert (=> b!392744 (= res!224940 (not e!237826))))

(declare-fun res!224942 () Bool)

(assert (=> b!392744 (=> (not res!224942) (not e!237826))))

(assert (=> b!392744 (= res!224942 (validKeyInArray!0 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)))))

(declare-fun d!73173 () Bool)

(declare-fun res!224941 () Bool)

(assert (=> d!73173 (=> res!224941 e!237825)))

(assert (=> d!73173 (= res!224941 (bvsge #b00000000000000000000000000000000 (size!11452 lt!185581)))))

(assert (=> d!73173 (= (arrayNoDuplicates!0 lt!185581 #b00000000000000000000000000000000 Nil!6445) e!237825)))

(declare-fun b!392745 () Bool)

(assert (=> b!392745 (= e!237823 call!27729)))

(declare-fun b!392746 () Bool)

(assert (=> b!392746 (= e!237824 e!237823)))

(assert (=> b!392746 (= c!54390 (validKeyInArray!0 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)))))

(assert (= (and d!73173 (not res!224941)) b!392744))

(assert (= (and b!392744 res!224942) b!392743))

(assert (= (and b!392744 res!224940) b!392746))

(assert (= (and b!392746 c!54390) b!392742))

(assert (= (and b!392746 (not c!54390)) b!392745))

(assert (= (or b!392742 b!392745) bm!27726))

(assert (=> bm!27726 m!389159))

(declare-fun m!389181 () Bool)

(assert (=> bm!27726 m!389181))

(assert (=> b!392743 m!389159))

(assert (=> b!392743 m!389159))

(declare-fun m!389183 () Bool)

(assert (=> b!392743 m!389183))

(assert (=> b!392744 m!389159))

(assert (=> b!392744 m!389159))

(assert (=> b!392744 m!389161))

(assert (=> b!392746 m!389159))

(assert (=> b!392746 m!389159))

(assert (=> b!392746 m!389161))

(assert (=> b!392644 d!73173))

(declare-fun b!392747 () Bool)

(declare-fun e!237827 () Bool)

(declare-fun call!27730 () Bool)

(assert (=> b!392747 (= e!237827 call!27730)))

(declare-fun bm!27727 () Bool)

(declare-fun c!54391 () Bool)

(assert (=> bm!27727 (= call!27730 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54391 (Cons!6444 (select (arr!11100 _keys!658) #b00000000000000000000000000000000) Nil!6445) Nil!6445)))))

(declare-fun b!392748 () Bool)

(declare-fun e!237830 () Bool)

(assert (=> b!392748 (= e!237830 (contains!2469 Nil!6445 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392749 () Bool)

(declare-fun e!237829 () Bool)

(declare-fun e!237828 () Bool)

(assert (=> b!392749 (= e!237829 e!237828)))

(declare-fun res!224943 () Bool)

(assert (=> b!392749 (=> (not res!224943) (not e!237828))))

(assert (=> b!392749 (= res!224943 (not e!237830))))

(declare-fun res!224945 () Bool)

(assert (=> b!392749 (=> (not res!224945) (not e!237830))))

(assert (=> b!392749 (= res!224945 (validKeyInArray!0 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!73175 () Bool)

(declare-fun res!224944 () Bool)

(assert (=> d!73175 (=> res!224944 e!237829)))

(assert (=> d!73175 (= res!224944 (bvsge #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(assert (=> d!73175 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6445) e!237829)))

(declare-fun b!392750 () Bool)

(assert (=> b!392750 (= e!237827 call!27730)))

(declare-fun b!392751 () Bool)

(assert (=> b!392751 (= e!237828 e!237827)))

(assert (=> b!392751 (= c!54391 (validKeyInArray!0 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73175 (not res!224944)) b!392749))

(assert (= (and b!392749 res!224945) b!392748))

(assert (= (and b!392749 res!224943) b!392751))

(assert (= (and b!392751 c!54391) b!392747))

(assert (= (and b!392751 (not c!54391)) b!392750))

(assert (= (or b!392747 b!392750) bm!27727))

(assert (=> bm!27727 m!389143))

(declare-fun m!389185 () Bool)

(assert (=> bm!27727 m!389185))

(assert (=> b!392748 m!389143))

(assert (=> b!392748 m!389143))

(declare-fun m!389187 () Bool)

(assert (=> b!392748 m!389187))

(assert (=> b!392749 m!389143))

(assert (=> b!392749 m!389143))

(assert (=> b!392749 m!389171))

(assert (=> b!392751 m!389143))

(assert (=> b!392751 m!389143))

(assert (=> b!392751 m!389171))

(assert (=> b!392653 d!73175))

(declare-fun b!392776 () Bool)

(declare-fun e!237846 () Bool)

(assert (=> b!392776 (= e!237846 (validKeyInArray!0 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392776 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!392777 () Bool)

(declare-fun e!237849 () ListLongMap!5507)

(assert (=> b!392777 (= e!237849 (ListLongMap!5508 Nil!6444))))

(declare-fun b!392778 () Bool)

(declare-fun e!237851 () ListLongMap!5507)

(assert (=> b!392778 (= e!237849 e!237851)))

(declare-fun c!54403 () Bool)

(assert (=> b!392778 (= c!54403 (validKeyInArray!0 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392779 () Bool)

(declare-fun e!237850 () Bool)

(declare-fun e!237847 () Bool)

(assert (=> b!392779 (= e!237850 e!237847)))

(assert (=> b!392779 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(declare-fun res!224955 () Bool)

(declare-fun lt!185651 () ListLongMap!5507)

(assert (=> b!392779 (= res!224955 (contains!2467 lt!185651 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392779 (=> (not res!224955) (not e!237847))))

(declare-fun b!392780 () Bool)

(declare-fun e!237848 () Bool)

(declare-fun isEmpty!552 (ListLongMap!5507) Bool)

(assert (=> b!392780 (= e!237848 (isEmpty!552 lt!185651))))

(declare-fun d!73177 () Bool)

(declare-fun e!237845 () Bool)

(assert (=> d!73177 e!237845))

(declare-fun res!224957 () Bool)

(assert (=> d!73177 (=> (not res!224957) (not e!237845))))

(assert (=> d!73177 (= res!224957 (not (contains!2467 lt!185651 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73177 (= lt!185651 e!237849)))

(declare-fun c!54401 () Bool)

(assert (=> d!73177 (= c!54401 (bvsge #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(assert (=> d!73177 (validMask!0 mask!970)))

(assert (=> d!73177 (= (getCurrentListMapNoExtraKeys!991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185651)))

(declare-fun b!392781 () Bool)

(assert (=> b!392781 (= e!237848 (= lt!185651 (getCurrentListMapNoExtraKeys!991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!392782 () Bool)

(declare-fun res!224956 () Bool)

(assert (=> b!392782 (=> (not res!224956) (not e!237845))))

(assert (=> b!392782 (= res!224956 (not (contains!2467 lt!185651 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392783 () Bool)

(declare-fun lt!185653 () Unit!12014)

(declare-fun lt!185652 () Unit!12014)

(assert (=> b!392783 (= lt!185653 lt!185652)))

(declare-fun lt!185654 () (_ BitVec 64))

(declare-fun lt!185650 () V!14021)

(declare-fun lt!185648 () (_ BitVec 64))

(declare-fun lt!185649 () ListLongMap!5507)

(assert (=> b!392783 (not (contains!2467 (+!1064 lt!185649 (tuple2!6595 lt!185648 lt!185650)) lt!185654))))

(declare-fun addStillNotContains!139 (ListLongMap!5507 (_ BitVec 64) V!14021 (_ BitVec 64)) Unit!12014)

(assert (=> b!392783 (= lt!185652 (addStillNotContains!139 lt!185649 lt!185648 lt!185650 lt!185654))))

(assert (=> b!392783 (= lt!185654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5608 (ValueCell!4500 V!14021) V!14021)

(declare-fun dynLambda!649 (Int (_ BitVec 64)) V!14021)

(assert (=> b!392783 (= lt!185650 (get!5608 (select (arr!11101 _values!506) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392783 (= lt!185648 (select (arr!11100 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27733 () ListLongMap!5507)

(assert (=> b!392783 (= lt!185649 call!27733)))

(assert (=> b!392783 (= e!237851 (+!1064 call!27733 (tuple2!6595 (select (arr!11100 _keys!658) #b00000000000000000000000000000000) (get!5608 (select (arr!11101 _values!506) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392784 () Bool)

(assert (=> b!392784 (= e!237851 call!27733)))

(declare-fun b!392785 () Bool)

(assert (=> b!392785 (= e!237850 e!237848)))

(declare-fun c!54402 () Bool)

(assert (=> b!392785 (= c!54402 (bvslt #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(declare-fun b!392786 () Bool)

(assert (=> b!392786 (= e!237845 e!237850)))

(declare-fun c!54400 () Bool)

(assert (=> b!392786 (= c!54400 e!237846)))

(declare-fun res!224954 () Bool)

(assert (=> b!392786 (=> (not res!224954) (not e!237846))))

(assert (=> b!392786 (= res!224954 (bvslt #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(declare-fun bm!27730 () Bool)

(assert (=> bm!27730 (= call!27733 (getCurrentListMapNoExtraKeys!991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!392787 () Bool)

(assert (=> b!392787 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(assert (=> b!392787 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11453 _values!506)))))

(declare-fun apply!306 (ListLongMap!5507 (_ BitVec 64)) V!14021)

(assert (=> b!392787 (= e!237847 (= (apply!306 lt!185651 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)) (get!5608 (select (arr!11101 _values!506) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!73177 c!54401) b!392777))

(assert (= (and d!73177 (not c!54401)) b!392778))

(assert (= (and b!392778 c!54403) b!392783))

(assert (= (and b!392778 (not c!54403)) b!392784))

(assert (= (or b!392783 b!392784) bm!27730))

(assert (= (and d!73177 res!224957) b!392782))

(assert (= (and b!392782 res!224956) b!392786))

(assert (= (and b!392786 res!224954) b!392776))

(assert (= (and b!392786 c!54400) b!392779))

(assert (= (and b!392786 (not c!54400)) b!392785))

(assert (= (and b!392779 res!224955) b!392787))

(assert (= (and b!392785 c!54402) b!392781))

(assert (= (and b!392785 (not c!54402)) b!392780))

(declare-fun b_lambda!8743 () Bool)

(assert (=> (not b_lambda!8743) (not b!392783)))

(declare-fun t!11620 () Bool)

(declare-fun tb!3127 () Bool)

(assert (=> (and start!38112 (= defaultEntry!514 defaultEntry!514) t!11620) tb!3127))

(declare-fun result!5761 () Bool)

(assert (=> tb!3127 (= result!5761 tp_is_empty!9687)))

(assert (=> b!392783 t!11620))

(declare-fun b_and!16369 () Bool)

(assert (= b_and!16365 (and (=> t!11620 result!5761) b_and!16369)))

(declare-fun b_lambda!8745 () Bool)

(assert (=> (not b_lambda!8745) (not b!392787)))

(assert (=> b!392787 t!11620))

(declare-fun b_and!16371 () Bool)

(assert (= b_and!16369 (and (=> t!11620 result!5761) b_and!16371)))

(declare-fun m!389189 () Bool)

(assert (=> bm!27730 m!389189))

(assert (=> b!392787 m!389143))

(assert (=> b!392787 m!389143))

(declare-fun m!389191 () Bool)

(assert (=> b!392787 m!389191))

(declare-fun m!389193 () Bool)

(assert (=> b!392787 m!389193))

(declare-fun m!389195 () Bool)

(assert (=> b!392787 m!389195))

(assert (=> b!392787 m!389193))

(declare-fun m!389197 () Bool)

(assert (=> b!392787 m!389197))

(assert (=> b!392787 m!389195))

(assert (=> b!392781 m!389189))

(declare-fun m!389199 () Bool)

(assert (=> b!392782 m!389199))

(assert (=> b!392778 m!389143))

(assert (=> b!392778 m!389143))

(assert (=> b!392778 m!389171))

(assert (=> b!392779 m!389143))

(assert (=> b!392779 m!389143))

(declare-fun m!389201 () Bool)

(assert (=> b!392779 m!389201))

(assert (=> b!392776 m!389143))

(assert (=> b!392776 m!389143))

(assert (=> b!392776 m!389171))

(declare-fun m!389203 () Bool)

(assert (=> b!392780 m!389203))

(declare-fun m!389205 () Bool)

(assert (=> d!73177 m!389205))

(assert (=> d!73177 m!389089))

(declare-fun m!389207 () Bool)

(assert (=> b!392783 m!389207))

(declare-fun m!389209 () Bool)

(assert (=> b!392783 m!389209))

(assert (=> b!392783 m!389143))

(assert (=> b!392783 m!389207))

(declare-fun m!389211 () Bool)

(assert (=> b!392783 m!389211))

(assert (=> b!392783 m!389193))

(assert (=> b!392783 m!389195))

(assert (=> b!392783 m!389193))

(assert (=> b!392783 m!389197))

(assert (=> b!392783 m!389195))

(declare-fun m!389213 () Bool)

(assert (=> b!392783 m!389213))

(assert (=> b!392643 d!73177))

(declare-fun d!73179 () Bool)

(declare-fun e!237881 () Bool)

(assert (=> d!73179 e!237881))

(declare-fun res!224983 () Bool)

(assert (=> d!73179 (=> (not res!224983) (not e!237881))))

(assert (=> d!73179 (= res!224983 (or (bvsge #b00000000000000000000000000000000 (size!11452 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11452 _keys!658)))))))

(declare-fun lt!185704 () ListLongMap!5507)

(declare-fun lt!185702 () ListLongMap!5507)

(assert (=> d!73179 (= lt!185704 lt!185702)))

(declare-fun lt!185713 () Unit!12014)

(declare-fun e!237882 () Unit!12014)

(assert (=> d!73179 (= lt!185713 e!237882)))

(declare-fun c!54416 () Bool)

(declare-fun e!237884 () Bool)

(assert (=> d!73179 (= c!54416 e!237884)))

(declare-fun res!224978 () Bool)

(assert (=> d!73179 (=> (not res!224978) (not e!237884))))

(assert (=> d!73179 (= res!224978 (bvslt #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(declare-fun e!237887 () ListLongMap!5507)

(assert (=> d!73179 (= lt!185702 e!237887)))

(declare-fun c!54418 () Bool)

(assert (=> d!73179 (= c!54418 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73179 (validMask!0 mask!970)))

(assert (=> d!73179 (= (getCurrentListMap!2111 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185704)))

(declare-fun call!27750 () ListLongMap!5507)

(declare-fun call!27749 () ListLongMap!5507)

(declare-fun call!27752 () ListLongMap!5507)

(declare-fun call!27754 () ListLongMap!5507)

(declare-fun c!54417 () Bool)

(declare-fun bm!27745 () Bool)

(assert (=> bm!27745 (= call!27752 (+!1064 (ite c!54418 call!27749 (ite c!54417 call!27750 call!27754)) (ite (or c!54418 c!54417) (tuple2!6595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392832 () Bool)

(declare-fun e!237878 () ListLongMap!5507)

(assert (=> b!392832 (= e!237878 call!27754)))

(declare-fun b!392833 () Bool)

(assert (=> b!392833 (= e!237884 (validKeyInArray!0 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392834 () Bool)

(declare-fun e!237890 () Bool)

(assert (=> b!392834 (= e!237890 (= (apply!306 lt!185704 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)) (get!5608 (select (arr!11101 _values!506) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392834 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11453 _values!506)))))

(assert (=> b!392834 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(declare-fun b!392835 () Bool)

(declare-fun res!224982 () Bool)

(assert (=> b!392835 (=> (not res!224982) (not e!237881))))

(declare-fun e!237880 () Bool)

(assert (=> b!392835 (= res!224982 e!237880)))

(declare-fun res!224981 () Bool)

(assert (=> b!392835 (=> res!224981 e!237880)))

(declare-fun e!237886 () Bool)

(assert (=> b!392835 (= res!224981 (not e!237886))))

(declare-fun res!224979 () Bool)

(assert (=> b!392835 (=> (not res!224979) (not e!237886))))

(assert (=> b!392835 (= res!224979 (bvslt #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(declare-fun bm!27746 () Bool)

(assert (=> bm!27746 (= call!27749 (getCurrentListMapNoExtraKeys!991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392836 () Bool)

(declare-fun e!237889 () ListLongMap!5507)

(assert (=> b!392836 (= e!237887 e!237889)))

(assert (=> b!392836 (= c!54417 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392837 () Bool)

(declare-fun e!237885 () Bool)

(assert (=> b!392837 (= e!237885 (= (apply!306 lt!185704 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!392838 () Bool)

(declare-fun e!237883 () Bool)

(declare-fun call!27751 () Bool)

(assert (=> b!392838 (= e!237883 (not call!27751))))

(declare-fun bm!27747 () Bool)

(assert (=> bm!27747 (= call!27751 (contains!2467 lt!185704 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392839 () Bool)

(assert (=> b!392839 (= e!237886 (validKeyInArray!0 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392840 () Bool)

(declare-fun e!237888 () Bool)

(assert (=> b!392840 (= e!237888 (= (apply!306 lt!185704 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392841 () Bool)

(assert (=> b!392841 (= e!237880 e!237890)))

(declare-fun res!224984 () Bool)

(assert (=> b!392841 (=> (not res!224984) (not e!237890))))

(assert (=> b!392841 (= res!224984 (contains!2467 lt!185704 (select (arr!11100 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392841 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(declare-fun bm!27748 () Bool)

(declare-fun call!27753 () Bool)

(assert (=> bm!27748 (= call!27753 (contains!2467 lt!185704 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27749 () Bool)

(assert (=> bm!27749 (= call!27750 call!27749)))

(declare-fun b!392842 () Bool)

(declare-fun Unit!12018 () Unit!12014)

(assert (=> b!392842 (= e!237882 Unit!12018)))

(declare-fun b!392843 () Bool)

(declare-fun e!237879 () Bool)

(assert (=> b!392843 (= e!237879 (not call!27753))))

(declare-fun bm!27750 () Bool)

(assert (=> bm!27750 (= call!27754 call!27750)))

(declare-fun b!392844 () Bool)

(assert (=> b!392844 (= e!237883 e!237888)))

(declare-fun res!224976 () Bool)

(assert (=> b!392844 (= res!224976 call!27751)))

(assert (=> b!392844 (=> (not res!224976) (not e!237888))))

(declare-fun b!392845 () Bool)

(declare-fun res!224977 () Bool)

(assert (=> b!392845 (=> (not res!224977) (not e!237881))))

(assert (=> b!392845 (= res!224977 e!237879)))

(declare-fun c!54419 () Bool)

(assert (=> b!392845 (= c!54419 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392846 () Bool)

(assert (=> b!392846 (= e!237879 e!237885)))

(declare-fun res!224980 () Bool)

(assert (=> b!392846 (= res!224980 call!27753)))

(assert (=> b!392846 (=> (not res!224980) (not e!237885))))

(declare-fun b!392847 () Bool)

(declare-fun call!27748 () ListLongMap!5507)

(assert (=> b!392847 (= e!237878 call!27748)))

(declare-fun b!392848 () Bool)

(declare-fun lt!185714 () Unit!12014)

(assert (=> b!392848 (= e!237882 lt!185714)))

(declare-fun lt!185705 () ListLongMap!5507)

(assert (=> b!392848 (= lt!185705 (getCurrentListMapNoExtraKeys!991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185709 () (_ BitVec 64))

(assert (=> b!392848 (= lt!185709 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185717 () (_ BitVec 64))

(assert (=> b!392848 (= lt!185717 (select (arr!11100 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185718 () Unit!12014)

(declare-fun addStillContains!282 (ListLongMap!5507 (_ BitVec 64) V!14021 (_ BitVec 64)) Unit!12014)

(assert (=> b!392848 (= lt!185718 (addStillContains!282 lt!185705 lt!185709 zeroValue!472 lt!185717))))

(assert (=> b!392848 (contains!2467 (+!1064 lt!185705 (tuple2!6595 lt!185709 zeroValue!472)) lt!185717)))

(declare-fun lt!185716 () Unit!12014)

(assert (=> b!392848 (= lt!185716 lt!185718)))

(declare-fun lt!185712 () ListLongMap!5507)

(assert (=> b!392848 (= lt!185712 (getCurrentListMapNoExtraKeys!991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185720 () (_ BitVec 64))

(assert (=> b!392848 (= lt!185720 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185701 () (_ BitVec 64))

(assert (=> b!392848 (= lt!185701 (select (arr!11100 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185699 () Unit!12014)

(declare-fun addApplyDifferent!282 (ListLongMap!5507 (_ BitVec 64) V!14021 (_ BitVec 64)) Unit!12014)

(assert (=> b!392848 (= lt!185699 (addApplyDifferent!282 lt!185712 lt!185720 minValue!472 lt!185701))))

(assert (=> b!392848 (= (apply!306 (+!1064 lt!185712 (tuple2!6595 lt!185720 minValue!472)) lt!185701) (apply!306 lt!185712 lt!185701))))

(declare-fun lt!185708 () Unit!12014)

(assert (=> b!392848 (= lt!185708 lt!185699)))

(declare-fun lt!185715 () ListLongMap!5507)

(assert (=> b!392848 (= lt!185715 (getCurrentListMapNoExtraKeys!991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185703 () (_ BitVec 64))

(assert (=> b!392848 (= lt!185703 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185707 () (_ BitVec 64))

(assert (=> b!392848 (= lt!185707 (select (arr!11100 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185710 () Unit!12014)

(assert (=> b!392848 (= lt!185710 (addApplyDifferent!282 lt!185715 lt!185703 zeroValue!472 lt!185707))))

(assert (=> b!392848 (= (apply!306 (+!1064 lt!185715 (tuple2!6595 lt!185703 zeroValue!472)) lt!185707) (apply!306 lt!185715 lt!185707))))

(declare-fun lt!185706 () Unit!12014)

(assert (=> b!392848 (= lt!185706 lt!185710)))

(declare-fun lt!185700 () ListLongMap!5507)

(assert (=> b!392848 (= lt!185700 (getCurrentListMapNoExtraKeys!991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185711 () (_ BitVec 64))

(assert (=> b!392848 (= lt!185711 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185719 () (_ BitVec 64))

(assert (=> b!392848 (= lt!185719 (select (arr!11100 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!392848 (= lt!185714 (addApplyDifferent!282 lt!185700 lt!185711 minValue!472 lt!185719))))

(assert (=> b!392848 (= (apply!306 (+!1064 lt!185700 (tuple2!6595 lt!185711 minValue!472)) lt!185719) (apply!306 lt!185700 lt!185719))))

(declare-fun b!392849 () Bool)

(assert (=> b!392849 (= e!237889 call!27748)))

(declare-fun b!392850 () Bool)

(declare-fun c!54420 () Bool)

(assert (=> b!392850 (= c!54420 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!392850 (= e!237889 e!237878)))

(declare-fun b!392851 () Bool)

(assert (=> b!392851 (= e!237887 (+!1064 call!27752 (tuple2!6595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!392852 () Bool)

(assert (=> b!392852 (= e!237881 e!237883)))

(declare-fun c!54421 () Bool)

(assert (=> b!392852 (= c!54421 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27751 () Bool)

(assert (=> bm!27751 (= call!27748 call!27752)))

(assert (= (and d!73179 c!54418) b!392851))

(assert (= (and d!73179 (not c!54418)) b!392836))

(assert (= (and b!392836 c!54417) b!392849))

(assert (= (and b!392836 (not c!54417)) b!392850))

(assert (= (and b!392850 c!54420) b!392847))

(assert (= (and b!392850 (not c!54420)) b!392832))

(assert (= (or b!392847 b!392832) bm!27750))

(assert (= (or b!392849 bm!27750) bm!27749))

(assert (= (or b!392849 b!392847) bm!27751))

(assert (= (or b!392851 bm!27749) bm!27746))

(assert (= (or b!392851 bm!27751) bm!27745))

(assert (= (and d!73179 res!224978) b!392833))

(assert (= (and d!73179 c!54416) b!392848))

(assert (= (and d!73179 (not c!54416)) b!392842))

(assert (= (and d!73179 res!224983) b!392835))

(assert (= (and b!392835 res!224979) b!392839))

(assert (= (and b!392835 (not res!224981)) b!392841))

(assert (= (and b!392841 res!224984) b!392834))

(assert (= (and b!392835 res!224982) b!392845))

(assert (= (and b!392845 c!54419) b!392846))

(assert (= (and b!392845 (not c!54419)) b!392843))

(assert (= (and b!392846 res!224980) b!392837))

(assert (= (or b!392846 b!392843) bm!27748))

(assert (= (and b!392845 res!224977) b!392852))

(assert (= (and b!392852 c!54421) b!392844))

(assert (= (and b!392852 (not c!54421)) b!392838))

(assert (= (and b!392844 res!224976) b!392840))

(assert (= (or b!392844 b!392838) bm!27747))

(declare-fun b_lambda!8747 () Bool)

(assert (=> (not b_lambda!8747) (not b!392834)))

(assert (=> b!392834 t!11620))

(declare-fun b_and!16373 () Bool)

(assert (= b_and!16371 (and (=> t!11620 result!5761) b_and!16373)))

(assert (=> b!392841 m!389143))

(assert (=> b!392841 m!389143))

(declare-fun m!389215 () Bool)

(assert (=> b!392841 m!389215))

(assert (=> bm!27746 m!389059))

(declare-fun m!389217 () Bool)

(assert (=> b!392837 m!389217))

(declare-fun m!389219 () Bool)

(assert (=> b!392840 m!389219))

(assert (=> b!392834 m!389143))

(declare-fun m!389221 () Bool)

(assert (=> b!392834 m!389221))

(assert (=> b!392834 m!389195))

(assert (=> b!392834 m!389193))

(assert (=> b!392834 m!389197))

(assert (=> b!392834 m!389195))

(assert (=> b!392834 m!389143))

(assert (=> b!392834 m!389193))

(declare-fun m!389223 () Bool)

(assert (=> bm!27747 m!389223))

(assert (=> b!392833 m!389143))

(assert (=> b!392833 m!389143))

(assert (=> b!392833 m!389171))

(declare-fun m!389225 () Bool)

(assert (=> bm!27745 m!389225))

(assert (=> d!73179 m!389089))

(declare-fun m!389227 () Bool)

(assert (=> b!392851 m!389227))

(declare-fun m!389229 () Bool)

(assert (=> bm!27748 m!389229))

(assert (=> b!392839 m!389143))

(assert (=> b!392839 m!389143))

(assert (=> b!392839 m!389171))

(assert (=> b!392848 m!389059))

(declare-fun m!389231 () Bool)

(assert (=> b!392848 m!389231))

(declare-fun m!389233 () Bool)

(assert (=> b!392848 m!389233))

(assert (=> b!392848 m!389143))

(declare-fun m!389235 () Bool)

(assert (=> b!392848 m!389235))

(declare-fun m!389237 () Bool)

(assert (=> b!392848 m!389237))

(declare-fun m!389239 () Bool)

(assert (=> b!392848 m!389239))

(declare-fun m!389241 () Bool)

(assert (=> b!392848 m!389241))

(declare-fun m!389243 () Bool)

(assert (=> b!392848 m!389243))

(assert (=> b!392848 m!389235))

(declare-fun m!389245 () Bool)

(assert (=> b!392848 m!389245))

(declare-fun m!389247 () Bool)

(assert (=> b!392848 m!389247))

(declare-fun m!389249 () Bool)

(assert (=> b!392848 m!389249))

(declare-fun m!389251 () Bool)

(assert (=> b!392848 m!389251))

(declare-fun m!389253 () Bool)

(assert (=> b!392848 m!389253))

(assert (=> b!392848 m!389239))

(declare-fun m!389255 () Bool)

(assert (=> b!392848 m!389255))

(assert (=> b!392848 m!389241))

(assert (=> b!392848 m!389247))

(declare-fun m!389257 () Bool)

(assert (=> b!392848 m!389257))

(declare-fun m!389259 () Bool)

(assert (=> b!392848 m!389259))

(assert (=> b!392643 d!73179))

(declare-fun d!73181 () Bool)

(declare-fun e!237891 () Bool)

(assert (=> d!73181 e!237891))

(declare-fun res!224986 () Bool)

(assert (=> d!73181 (=> (not res!224986) (not e!237891))))

(declare-fun lt!185724 () ListLongMap!5507)

(assert (=> d!73181 (= res!224986 (contains!2467 lt!185724 (_1!3308 (tuple2!6595 k0!778 v!373))))))

(declare-fun lt!185723 () List!6447)

(assert (=> d!73181 (= lt!185724 (ListLongMap!5508 lt!185723))))

(declare-fun lt!185722 () Unit!12014)

(declare-fun lt!185721 () Unit!12014)

(assert (=> d!73181 (= lt!185722 lt!185721)))

(assert (=> d!73181 (= (getValueByKey!364 lt!185723 (_1!3308 (tuple2!6595 k0!778 v!373))) (Some!369 (_2!3308 (tuple2!6595 k0!778 v!373))))))

(assert (=> d!73181 (= lt!185721 (lemmaContainsTupThenGetReturnValue!186 lt!185723 (_1!3308 (tuple2!6595 k0!778 v!373)) (_2!3308 (tuple2!6595 k0!778 v!373))))))

(assert (=> d!73181 (= lt!185723 (insertStrictlySorted!189 (toList!2769 lt!185575) (_1!3308 (tuple2!6595 k0!778 v!373)) (_2!3308 (tuple2!6595 k0!778 v!373))))))

(assert (=> d!73181 (= (+!1064 lt!185575 (tuple2!6595 k0!778 v!373)) lt!185724)))

(declare-fun b!392853 () Bool)

(declare-fun res!224985 () Bool)

(assert (=> b!392853 (=> (not res!224985) (not e!237891))))

(assert (=> b!392853 (= res!224985 (= (getValueByKey!364 (toList!2769 lt!185724) (_1!3308 (tuple2!6595 k0!778 v!373))) (Some!369 (_2!3308 (tuple2!6595 k0!778 v!373)))))))

(declare-fun b!392854 () Bool)

(assert (=> b!392854 (= e!237891 (contains!2468 (toList!2769 lt!185724) (tuple2!6595 k0!778 v!373)))))

(assert (= (and d!73181 res!224986) b!392853))

(assert (= (and b!392853 res!224985) b!392854))

(declare-fun m!389261 () Bool)

(assert (=> d!73181 m!389261))

(declare-fun m!389263 () Bool)

(assert (=> d!73181 m!389263))

(declare-fun m!389265 () Bool)

(assert (=> d!73181 m!389265))

(declare-fun m!389267 () Bool)

(assert (=> d!73181 m!389267))

(declare-fun m!389269 () Bool)

(assert (=> b!392853 m!389269))

(declare-fun m!389271 () Bool)

(assert (=> b!392854 m!389271))

(assert (=> b!392643 d!73181))

(declare-fun call!27760 () ListLongMap!5507)

(declare-fun bm!27756 () Bool)

(assert (=> bm!27756 (= call!27760 (getCurrentListMapNoExtraKeys!991 (array!23282 (store (arr!11100 _keys!658) i!548 k0!778) (size!11452 _keys!658)) (array!23284 (store (arr!11101 _values!506) i!548 (ValueCellFull!4500 v!373)) (size!11453 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun call!27759 () ListLongMap!5507)

(declare-fun e!237896 () Bool)

(declare-fun b!392861 () Bool)

(assert (=> b!392861 (= e!237896 (= call!27760 (+!1064 call!27759 (tuple2!6595 k0!778 v!373))))))

(declare-fun d!73183 () Bool)

(declare-fun e!237897 () Bool)

(assert (=> d!73183 e!237897))

(declare-fun res!224989 () Bool)

(assert (=> d!73183 (=> (not res!224989) (not e!237897))))

(assert (=> d!73183 (= res!224989 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11452 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11453 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11452 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11453 _values!506))))))))

(declare-fun lt!185727 () Unit!12014)

(declare-fun choose!1321 (array!23281 array!23283 (_ BitVec 32) (_ BitVec 32) V!14021 V!14021 (_ BitVec 32) (_ BitVec 64) V!14021 (_ BitVec 32) Int) Unit!12014)

(assert (=> d!73183 (= lt!185727 (choose!1321 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11452 _keys!658)))))

(assert (=> d!73183 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!275 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!185727)))

(declare-fun bm!27757 () Bool)

(assert (=> bm!27757 (= call!27759 (getCurrentListMapNoExtraKeys!991 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392862 () Bool)

(assert (=> b!392862 (= e!237896 (= call!27760 call!27759))))

(declare-fun b!392863 () Bool)

(assert (=> b!392863 (= e!237897 e!237896)))

(declare-fun c!54424 () Bool)

(assert (=> b!392863 (= c!54424 (bvsle #b00000000000000000000000000000000 i!548))))

(assert (= (and d!73183 res!224989) b!392863))

(assert (= (and b!392863 c!54424) b!392861))

(assert (= (and b!392863 (not c!54424)) b!392862))

(assert (= (or b!392861 b!392862) bm!27757))

(assert (= (or b!392861 b!392862) bm!27756))

(assert (=> bm!27756 m!389097))

(assert (=> bm!27756 m!389067))

(declare-fun m!389273 () Bool)

(assert (=> bm!27756 m!389273))

(declare-fun m!389275 () Bool)

(assert (=> b!392861 m!389275))

(declare-fun m!389277 () Bool)

(assert (=> d!73183 m!389277))

(assert (=> bm!27757 m!389059))

(assert (=> b!392643 d!73183))

(declare-fun d!73185 () Bool)

(declare-fun e!237901 () Bool)

(assert (=> d!73185 e!237901))

(declare-fun res!224997 () Bool)

(assert (=> d!73185 (=> (not res!224997) (not e!237901))))

(assert (=> d!73185 (= res!224997 (or (bvsge #b00000000000000000000000000000000 (size!11452 lt!185581)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11452 lt!185581)))))))

(declare-fun lt!185733 () ListLongMap!5507)

(declare-fun lt!185731 () ListLongMap!5507)

(assert (=> d!73185 (= lt!185733 lt!185731)))

(declare-fun lt!185742 () Unit!12014)

(declare-fun e!237902 () Unit!12014)

(assert (=> d!73185 (= lt!185742 e!237902)))

(declare-fun c!54425 () Bool)

(declare-fun e!237904 () Bool)

(assert (=> d!73185 (= c!54425 e!237904)))

(declare-fun res!224992 () Bool)

(assert (=> d!73185 (=> (not res!224992) (not e!237904))))

(assert (=> d!73185 (= res!224992 (bvslt #b00000000000000000000000000000000 (size!11452 lt!185581)))))

(declare-fun e!237907 () ListLongMap!5507)

(assert (=> d!73185 (= lt!185731 e!237907)))

(declare-fun c!54427 () Bool)

(assert (=> d!73185 (= c!54427 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73185 (validMask!0 mask!970)))

(assert (=> d!73185 (= (getCurrentListMap!2111 lt!185581 lt!185580 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185733)))

(declare-fun call!27767 () ListLongMap!5507)

(declare-fun c!54426 () Bool)

(declare-fun call!27765 () ListLongMap!5507)

(declare-fun call!27762 () ListLongMap!5507)

(declare-fun call!27763 () ListLongMap!5507)

(declare-fun bm!27758 () Bool)

(assert (=> bm!27758 (= call!27765 (+!1064 (ite c!54427 call!27762 (ite c!54426 call!27763 call!27767)) (ite (or c!54427 c!54426) (tuple2!6595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392864 () Bool)

(declare-fun e!237898 () ListLongMap!5507)

(assert (=> b!392864 (= e!237898 call!27767)))

(declare-fun b!392865 () Bool)

(assert (=> b!392865 (= e!237904 (validKeyInArray!0 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)))))

(declare-fun b!392866 () Bool)

(declare-fun e!237910 () Bool)

(assert (=> b!392866 (= e!237910 (= (apply!306 lt!185733 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)) (get!5608 (select (arr!11101 lt!185580) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11453 lt!185580)))))

(assert (=> b!392866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11452 lt!185581)))))

(declare-fun b!392867 () Bool)

(declare-fun res!224996 () Bool)

(assert (=> b!392867 (=> (not res!224996) (not e!237901))))

(declare-fun e!237900 () Bool)

(assert (=> b!392867 (= res!224996 e!237900)))

(declare-fun res!224995 () Bool)

(assert (=> b!392867 (=> res!224995 e!237900)))

(declare-fun e!237906 () Bool)

(assert (=> b!392867 (= res!224995 (not e!237906))))

(declare-fun res!224993 () Bool)

(assert (=> b!392867 (=> (not res!224993) (not e!237906))))

(assert (=> b!392867 (= res!224993 (bvslt #b00000000000000000000000000000000 (size!11452 lt!185581)))))

(declare-fun bm!27759 () Bool)

(assert (=> bm!27759 (= call!27762 (getCurrentListMapNoExtraKeys!991 lt!185581 lt!185580 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392868 () Bool)

(declare-fun e!237909 () ListLongMap!5507)

(assert (=> b!392868 (= e!237907 e!237909)))

(assert (=> b!392868 (= c!54426 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392869 () Bool)

(declare-fun e!237905 () Bool)

(assert (=> b!392869 (= e!237905 (= (apply!306 lt!185733 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!392870 () Bool)

(declare-fun e!237903 () Bool)

(declare-fun call!27764 () Bool)

(assert (=> b!392870 (= e!237903 (not call!27764))))

(declare-fun bm!27760 () Bool)

(assert (=> bm!27760 (= call!27764 (contains!2467 lt!185733 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!392871 () Bool)

(assert (=> b!392871 (= e!237906 (validKeyInArray!0 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)))))

(declare-fun b!392872 () Bool)

(declare-fun e!237908 () Bool)

(assert (=> b!392872 (= e!237908 (= (apply!306 lt!185733 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392873 () Bool)

(assert (=> b!392873 (= e!237900 e!237910)))

(declare-fun res!224998 () Bool)

(assert (=> b!392873 (=> (not res!224998) (not e!237910))))

(assert (=> b!392873 (= res!224998 (contains!2467 lt!185733 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)))))

(assert (=> b!392873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11452 lt!185581)))))

(declare-fun bm!27761 () Bool)

(declare-fun call!27766 () Bool)

(assert (=> bm!27761 (= call!27766 (contains!2467 lt!185733 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27762 () Bool)

(assert (=> bm!27762 (= call!27763 call!27762)))

(declare-fun b!392874 () Bool)

(declare-fun Unit!12019 () Unit!12014)

(assert (=> b!392874 (= e!237902 Unit!12019)))

(declare-fun b!392875 () Bool)

(declare-fun e!237899 () Bool)

(assert (=> b!392875 (= e!237899 (not call!27766))))

(declare-fun bm!27763 () Bool)

(assert (=> bm!27763 (= call!27767 call!27763)))

(declare-fun b!392876 () Bool)

(assert (=> b!392876 (= e!237903 e!237908)))

(declare-fun res!224990 () Bool)

(assert (=> b!392876 (= res!224990 call!27764)))

(assert (=> b!392876 (=> (not res!224990) (not e!237908))))

(declare-fun b!392877 () Bool)

(declare-fun res!224991 () Bool)

(assert (=> b!392877 (=> (not res!224991) (not e!237901))))

(assert (=> b!392877 (= res!224991 e!237899)))

(declare-fun c!54428 () Bool)

(assert (=> b!392877 (= c!54428 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!392878 () Bool)

(assert (=> b!392878 (= e!237899 e!237905)))

(declare-fun res!224994 () Bool)

(assert (=> b!392878 (= res!224994 call!27766)))

(assert (=> b!392878 (=> (not res!224994) (not e!237905))))

(declare-fun b!392879 () Bool)

(declare-fun call!27761 () ListLongMap!5507)

(assert (=> b!392879 (= e!237898 call!27761)))

(declare-fun b!392880 () Bool)

(declare-fun lt!185743 () Unit!12014)

(assert (=> b!392880 (= e!237902 lt!185743)))

(declare-fun lt!185734 () ListLongMap!5507)

(assert (=> b!392880 (= lt!185734 (getCurrentListMapNoExtraKeys!991 lt!185581 lt!185580 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185738 () (_ BitVec 64))

(assert (=> b!392880 (= lt!185738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185746 () (_ BitVec 64))

(assert (=> b!392880 (= lt!185746 (select (arr!11100 lt!185581) #b00000000000000000000000000000000))))

(declare-fun lt!185747 () Unit!12014)

(assert (=> b!392880 (= lt!185747 (addStillContains!282 lt!185734 lt!185738 zeroValue!472 lt!185746))))

(assert (=> b!392880 (contains!2467 (+!1064 lt!185734 (tuple2!6595 lt!185738 zeroValue!472)) lt!185746)))

(declare-fun lt!185745 () Unit!12014)

(assert (=> b!392880 (= lt!185745 lt!185747)))

(declare-fun lt!185741 () ListLongMap!5507)

(assert (=> b!392880 (= lt!185741 (getCurrentListMapNoExtraKeys!991 lt!185581 lt!185580 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185749 () (_ BitVec 64))

(assert (=> b!392880 (= lt!185749 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185730 () (_ BitVec 64))

(assert (=> b!392880 (= lt!185730 (select (arr!11100 lt!185581) #b00000000000000000000000000000000))))

(declare-fun lt!185728 () Unit!12014)

(assert (=> b!392880 (= lt!185728 (addApplyDifferent!282 lt!185741 lt!185749 minValue!472 lt!185730))))

(assert (=> b!392880 (= (apply!306 (+!1064 lt!185741 (tuple2!6595 lt!185749 minValue!472)) lt!185730) (apply!306 lt!185741 lt!185730))))

(declare-fun lt!185737 () Unit!12014)

(assert (=> b!392880 (= lt!185737 lt!185728)))

(declare-fun lt!185744 () ListLongMap!5507)

(assert (=> b!392880 (= lt!185744 (getCurrentListMapNoExtraKeys!991 lt!185581 lt!185580 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185732 () (_ BitVec 64))

(assert (=> b!392880 (= lt!185732 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185736 () (_ BitVec 64))

(assert (=> b!392880 (= lt!185736 (select (arr!11100 lt!185581) #b00000000000000000000000000000000))))

(declare-fun lt!185739 () Unit!12014)

(assert (=> b!392880 (= lt!185739 (addApplyDifferent!282 lt!185744 lt!185732 zeroValue!472 lt!185736))))

(assert (=> b!392880 (= (apply!306 (+!1064 lt!185744 (tuple2!6595 lt!185732 zeroValue!472)) lt!185736) (apply!306 lt!185744 lt!185736))))

(declare-fun lt!185735 () Unit!12014)

(assert (=> b!392880 (= lt!185735 lt!185739)))

(declare-fun lt!185729 () ListLongMap!5507)

(assert (=> b!392880 (= lt!185729 (getCurrentListMapNoExtraKeys!991 lt!185581 lt!185580 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185740 () (_ BitVec 64))

(assert (=> b!392880 (= lt!185740 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185748 () (_ BitVec 64))

(assert (=> b!392880 (= lt!185748 (select (arr!11100 lt!185581) #b00000000000000000000000000000000))))

(assert (=> b!392880 (= lt!185743 (addApplyDifferent!282 lt!185729 lt!185740 minValue!472 lt!185748))))

(assert (=> b!392880 (= (apply!306 (+!1064 lt!185729 (tuple2!6595 lt!185740 minValue!472)) lt!185748) (apply!306 lt!185729 lt!185748))))

(declare-fun b!392881 () Bool)

(assert (=> b!392881 (= e!237909 call!27761)))

(declare-fun b!392882 () Bool)

(declare-fun c!54429 () Bool)

(assert (=> b!392882 (= c!54429 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!392882 (= e!237909 e!237898)))

(declare-fun b!392883 () Bool)

(assert (=> b!392883 (= e!237907 (+!1064 call!27765 (tuple2!6595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!392884 () Bool)

(assert (=> b!392884 (= e!237901 e!237903)))

(declare-fun c!54430 () Bool)

(assert (=> b!392884 (= c!54430 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27764 () Bool)

(assert (=> bm!27764 (= call!27761 call!27765)))

(assert (= (and d!73185 c!54427) b!392883))

(assert (= (and d!73185 (not c!54427)) b!392868))

(assert (= (and b!392868 c!54426) b!392881))

(assert (= (and b!392868 (not c!54426)) b!392882))

(assert (= (and b!392882 c!54429) b!392879))

(assert (= (and b!392882 (not c!54429)) b!392864))

(assert (= (or b!392879 b!392864) bm!27763))

(assert (= (or b!392881 bm!27763) bm!27762))

(assert (= (or b!392881 b!392879) bm!27764))

(assert (= (or b!392883 bm!27762) bm!27759))

(assert (= (or b!392883 bm!27764) bm!27758))

(assert (= (and d!73185 res!224992) b!392865))

(assert (= (and d!73185 c!54425) b!392880))

(assert (= (and d!73185 (not c!54425)) b!392874))

(assert (= (and d!73185 res!224997) b!392867))

(assert (= (and b!392867 res!224993) b!392871))

(assert (= (and b!392867 (not res!224995)) b!392873))

(assert (= (and b!392873 res!224998) b!392866))

(assert (= (and b!392867 res!224996) b!392877))

(assert (= (and b!392877 c!54428) b!392878))

(assert (= (and b!392877 (not c!54428)) b!392875))

(assert (= (and b!392878 res!224994) b!392869))

(assert (= (or b!392878 b!392875) bm!27761))

(assert (= (and b!392877 res!224991) b!392884))

(assert (= (and b!392884 c!54430) b!392876))

(assert (= (and b!392884 (not c!54430)) b!392870))

(assert (= (and b!392876 res!224990) b!392872))

(assert (= (or b!392876 b!392870) bm!27760))

(declare-fun b_lambda!8749 () Bool)

(assert (=> (not b_lambda!8749) (not b!392866)))

(assert (=> b!392866 t!11620))

(declare-fun b_and!16375 () Bool)

(assert (= b_and!16373 (and (=> t!11620 result!5761) b_and!16375)))

(assert (=> b!392873 m!389159))

(assert (=> b!392873 m!389159))

(declare-fun m!389279 () Bool)

(assert (=> b!392873 m!389279))

(assert (=> bm!27759 m!389069))

(declare-fun m!389281 () Bool)

(assert (=> b!392869 m!389281))

(declare-fun m!389283 () Bool)

(assert (=> b!392872 m!389283))

(assert (=> b!392866 m!389159))

(declare-fun m!389285 () Bool)

(assert (=> b!392866 m!389285))

(declare-fun m!389287 () Bool)

(assert (=> b!392866 m!389287))

(assert (=> b!392866 m!389193))

(declare-fun m!389289 () Bool)

(assert (=> b!392866 m!389289))

(assert (=> b!392866 m!389287))

(assert (=> b!392866 m!389159))

(assert (=> b!392866 m!389193))

(declare-fun m!389291 () Bool)

(assert (=> bm!27760 m!389291))

(assert (=> b!392865 m!389159))

(assert (=> b!392865 m!389159))

(assert (=> b!392865 m!389161))

(declare-fun m!389293 () Bool)

(assert (=> bm!27758 m!389293))

(assert (=> d!73185 m!389089))

(declare-fun m!389295 () Bool)

(assert (=> b!392883 m!389295))

(declare-fun m!389297 () Bool)

(assert (=> bm!27761 m!389297))

(assert (=> b!392871 m!389159))

(assert (=> b!392871 m!389159))

(assert (=> b!392871 m!389161))

(assert (=> b!392880 m!389069))

(declare-fun m!389299 () Bool)

(assert (=> b!392880 m!389299))

(declare-fun m!389301 () Bool)

(assert (=> b!392880 m!389301))

(assert (=> b!392880 m!389159))

(declare-fun m!389303 () Bool)

(assert (=> b!392880 m!389303))

(declare-fun m!389305 () Bool)

(assert (=> b!392880 m!389305))

(declare-fun m!389307 () Bool)

(assert (=> b!392880 m!389307))

(declare-fun m!389309 () Bool)

(assert (=> b!392880 m!389309))

(declare-fun m!389311 () Bool)

(assert (=> b!392880 m!389311))

(assert (=> b!392880 m!389303))

(declare-fun m!389313 () Bool)

(assert (=> b!392880 m!389313))

(declare-fun m!389315 () Bool)

(assert (=> b!392880 m!389315))

(declare-fun m!389317 () Bool)

(assert (=> b!392880 m!389317))

(declare-fun m!389319 () Bool)

(assert (=> b!392880 m!389319))

(declare-fun m!389321 () Bool)

(assert (=> b!392880 m!389321))

(assert (=> b!392880 m!389307))

(declare-fun m!389323 () Bool)

(assert (=> b!392880 m!389323))

(assert (=> b!392880 m!389309))

(assert (=> b!392880 m!389315))

(declare-fun m!389325 () Bool)

(assert (=> b!392880 m!389325))

(declare-fun m!389327 () Bool)

(assert (=> b!392880 m!389327))

(assert (=> b!392643 d!73185))

(declare-fun b!392885 () Bool)

(declare-fun e!237912 () Bool)

(assert (=> b!392885 (= e!237912 (validKeyInArray!0 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)))))

(assert (=> b!392885 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!392886 () Bool)

(declare-fun e!237915 () ListLongMap!5507)

(assert (=> b!392886 (= e!237915 (ListLongMap!5508 Nil!6444))))

(declare-fun b!392887 () Bool)

(declare-fun e!237917 () ListLongMap!5507)

(assert (=> b!392887 (= e!237915 e!237917)))

(declare-fun c!54434 () Bool)

(assert (=> b!392887 (= c!54434 (validKeyInArray!0 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)))))

(declare-fun b!392888 () Bool)

(declare-fun e!237916 () Bool)

(declare-fun e!237913 () Bool)

(assert (=> b!392888 (= e!237916 e!237913)))

(assert (=> b!392888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11452 lt!185581)))))

(declare-fun res!225000 () Bool)

(declare-fun lt!185753 () ListLongMap!5507)

(assert (=> b!392888 (= res!225000 (contains!2467 lt!185753 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)))))

(assert (=> b!392888 (=> (not res!225000) (not e!237913))))

(declare-fun b!392889 () Bool)

(declare-fun e!237914 () Bool)

(assert (=> b!392889 (= e!237914 (isEmpty!552 lt!185753))))

(declare-fun d!73187 () Bool)

(declare-fun e!237911 () Bool)

(assert (=> d!73187 e!237911))

(declare-fun res!225002 () Bool)

(assert (=> d!73187 (=> (not res!225002) (not e!237911))))

(assert (=> d!73187 (= res!225002 (not (contains!2467 lt!185753 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73187 (= lt!185753 e!237915)))

(declare-fun c!54432 () Bool)

(assert (=> d!73187 (= c!54432 (bvsge #b00000000000000000000000000000000 (size!11452 lt!185581)))))

(assert (=> d!73187 (validMask!0 mask!970)))

(assert (=> d!73187 (= (getCurrentListMapNoExtraKeys!991 lt!185581 lt!185580 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185753)))

(declare-fun b!392890 () Bool)

(assert (=> b!392890 (= e!237914 (= lt!185753 (getCurrentListMapNoExtraKeys!991 lt!185581 lt!185580 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!392891 () Bool)

(declare-fun res!225001 () Bool)

(assert (=> b!392891 (=> (not res!225001) (not e!237911))))

(assert (=> b!392891 (= res!225001 (not (contains!2467 lt!185753 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392892 () Bool)

(declare-fun lt!185755 () Unit!12014)

(declare-fun lt!185754 () Unit!12014)

(assert (=> b!392892 (= lt!185755 lt!185754)))

(declare-fun lt!185750 () (_ BitVec 64))

(declare-fun lt!185751 () ListLongMap!5507)

(declare-fun lt!185752 () V!14021)

(declare-fun lt!185756 () (_ BitVec 64))

(assert (=> b!392892 (not (contains!2467 (+!1064 lt!185751 (tuple2!6595 lt!185750 lt!185752)) lt!185756))))

(assert (=> b!392892 (= lt!185754 (addStillNotContains!139 lt!185751 lt!185750 lt!185752 lt!185756))))

(assert (=> b!392892 (= lt!185756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392892 (= lt!185752 (get!5608 (select (arr!11101 lt!185580) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392892 (= lt!185750 (select (arr!11100 lt!185581) #b00000000000000000000000000000000))))

(declare-fun call!27768 () ListLongMap!5507)

(assert (=> b!392892 (= lt!185751 call!27768)))

(assert (=> b!392892 (= e!237917 (+!1064 call!27768 (tuple2!6595 (select (arr!11100 lt!185581) #b00000000000000000000000000000000) (get!5608 (select (arr!11101 lt!185580) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392893 () Bool)

(assert (=> b!392893 (= e!237917 call!27768)))

(declare-fun b!392894 () Bool)

(assert (=> b!392894 (= e!237916 e!237914)))

(declare-fun c!54433 () Bool)

(assert (=> b!392894 (= c!54433 (bvslt #b00000000000000000000000000000000 (size!11452 lt!185581)))))

(declare-fun b!392895 () Bool)

(assert (=> b!392895 (= e!237911 e!237916)))

(declare-fun c!54431 () Bool)

(assert (=> b!392895 (= c!54431 e!237912)))

(declare-fun res!224999 () Bool)

(assert (=> b!392895 (=> (not res!224999) (not e!237912))))

(assert (=> b!392895 (= res!224999 (bvslt #b00000000000000000000000000000000 (size!11452 lt!185581)))))

(declare-fun bm!27765 () Bool)

(assert (=> bm!27765 (= call!27768 (getCurrentListMapNoExtraKeys!991 lt!185581 lt!185580 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!392896 () Bool)

(assert (=> b!392896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11452 lt!185581)))))

(assert (=> b!392896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11453 lt!185580)))))

(assert (=> b!392896 (= e!237913 (= (apply!306 lt!185753 (select (arr!11100 lt!185581) #b00000000000000000000000000000000)) (get!5608 (select (arr!11101 lt!185580) #b00000000000000000000000000000000) (dynLambda!649 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!73187 c!54432) b!392886))

(assert (= (and d!73187 (not c!54432)) b!392887))

(assert (= (and b!392887 c!54434) b!392892))

(assert (= (and b!392887 (not c!54434)) b!392893))

(assert (= (or b!392892 b!392893) bm!27765))

(assert (= (and d!73187 res!225002) b!392891))

(assert (= (and b!392891 res!225001) b!392895))

(assert (= (and b!392895 res!224999) b!392885))

(assert (= (and b!392895 c!54431) b!392888))

(assert (= (and b!392895 (not c!54431)) b!392894))

(assert (= (and b!392888 res!225000) b!392896))

(assert (= (and b!392894 c!54433) b!392890))

(assert (= (and b!392894 (not c!54433)) b!392889))

(declare-fun b_lambda!8751 () Bool)

(assert (=> (not b_lambda!8751) (not b!392892)))

(assert (=> b!392892 t!11620))

(declare-fun b_and!16377 () Bool)

(assert (= b_and!16375 (and (=> t!11620 result!5761) b_and!16377)))

(declare-fun b_lambda!8753 () Bool)

(assert (=> (not b_lambda!8753) (not b!392896)))

(assert (=> b!392896 t!11620))

(declare-fun b_and!16379 () Bool)

(assert (= b_and!16377 (and (=> t!11620 result!5761) b_and!16379)))

(declare-fun m!389329 () Bool)

(assert (=> bm!27765 m!389329))

(assert (=> b!392896 m!389159))

(assert (=> b!392896 m!389159))

(declare-fun m!389331 () Bool)

(assert (=> b!392896 m!389331))

(assert (=> b!392896 m!389193))

(assert (=> b!392896 m!389287))

(assert (=> b!392896 m!389193))

(assert (=> b!392896 m!389289))

(assert (=> b!392896 m!389287))

(assert (=> b!392890 m!389329))

(declare-fun m!389333 () Bool)

(assert (=> b!392891 m!389333))

(assert (=> b!392887 m!389159))

(assert (=> b!392887 m!389159))

(assert (=> b!392887 m!389161))

(assert (=> b!392888 m!389159))

(assert (=> b!392888 m!389159))

(declare-fun m!389335 () Bool)

(assert (=> b!392888 m!389335))

(assert (=> b!392885 m!389159))

(assert (=> b!392885 m!389159))

(assert (=> b!392885 m!389161))

(declare-fun m!389337 () Bool)

(assert (=> b!392889 m!389337))

(declare-fun m!389339 () Bool)

(assert (=> d!73187 m!389339))

(assert (=> d!73187 m!389089))

(declare-fun m!389341 () Bool)

(assert (=> b!392892 m!389341))

(declare-fun m!389343 () Bool)

(assert (=> b!392892 m!389343))

(assert (=> b!392892 m!389159))

(assert (=> b!392892 m!389341))

(declare-fun m!389345 () Bool)

(assert (=> b!392892 m!389345))

(assert (=> b!392892 m!389193))

(assert (=> b!392892 m!389287))

(assert (=> b!392892 m!389193))

(assert (=> b!392892 m!389289))

(assert (=> b!392892 m!389287))

(declare-fun m!389347 () Bool)

(assert (=> b!392892 m!389347))

(assert (=> b!392643 d!73187))

(declare-fun d!73189 () Bool)

(assert (=> d!73189 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392655 d!73189))

(declare-fun d!73191 () Bool)

(assert (=> d!73191 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38112 d!73191))

(declare-fun d!73193 () Bool)

(assert (=> d!73193 (= (array_inv!8152 _values!506) (bvsge (size!11453 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38112 d!73193))

(declare-fun d!73195 () Bool)

(assert (=> d!73195 (= (array_inv!8153 _keys!658) (bvsge (size!11452 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38112 d!73195))

(declare-fun d!73197 () Bool)

(declare-fun e!237918 () Bool)

(assert (=> d!73197 e!237918))

(declare-fun res!225004 () Bool)

(assert (=> d!73197 (=> (not res!225004) (not e!237918))))

(declare-fun lt!185760 () ListLongMap!5507)

(assert (=> d!73197 (= res!225004 (contains!2467 lt!185760 (_1!3308 lt!185579)))))

(declare-fun lt!185759 () List!6447)

(assert (=> d!73197 (= lt!185760 (ListLongMap!5508 lt!185759))))

(declare-fun lt!185758 () Unit!12014)

(declare-fun lt!185757 () Unit!12014)

(assert (=> d!73197 (= lt!185758 lt!185757)))

(assert (=> d!73197 (= (getValueByKey!364 lt!185759 (_1!3308 lt!185579)) (Some!369 (_2!3308 lt!185579)))))

(assert (=> d!73197 (= lt!185757 (lemmaContainsTupThenGetReturnValue!186 lt!185759 (_1!3308 lt!185579) (_2!3308 lt!185579)))))

(assert (=> d!73197 (= lt!185759 (insertStrictlySorted!189 (toList!2769 lt!185577) (_1!3308 lt!185579) (_2!3308 lt!185579)))))

(assert (=> d!73197 (= (+!1064 lt!185577 lt!185579) lt!185760)))

(declare-fun b!392897 () Bool)

(declare-fun res!225003 () Bool)

(assert (=> b!392897 (=> (not res!225003) (not e!237918))))

(assert (=> b!392897 (= res!225003 (= (getValueByKey!364 (toList!2769 lt!185760) (_1!3308 lt!185579)) (Some!369 (_2!3308 lt!185579))))))

(declare-fun b!392898 () Bool)

(assert (=> b!392898 (= e!237918 (contains!2468 (toList!2769 lt!185760) lt!185579))))

(assert (= (and d!73197 res!225004) b!392897))

(assert (= (and b!392897 res!225003) b!392898))

(declare-fun m!389349 () Bool)

(assert (=> d!73197 m!389349))

(declare-fun m!389351 () Bool)

(assert (=> d!73197 m!389351))

(declare-fun m!389353 () Bool)

(assert (=> d!73197 m!389353))

(declare-fun m!389355 () Bool)

(assert (=> d!73197 m!389355))

(declare-fun m!389357 () Bool)

(assert (=> b!392897 m!389357))

(declare-fun m!389359 () Bool)

(assert (=> b!392898 m!389359))

(assert (=> b!392646 d!73197))

(declare-fun d!73199 () Bool)

(declare-fun e!237919 () Bool)

(assert (=> d!73199 e!237919))

(declare-fun res!225006 () Bool)

(assert (=> d!73199 (=> (not res!225006) (not e!237919))))

(declare-fun lt!185764 () ListLongMap!5507)

(assert (=> d!73199 (= res!225006 (contains!2467 lt!185764 (_1!3308 lt!185579)))))

(declare-fun lt!185763 () List!6447)

(assert (=> d!73199 (= lt!185764 (ListLongMap!5508 lt!185763))))

(declare-fun lt!185762 () Unit!12014)

(declare-fun lt!185761 () Unit!12014)

(assert (=> d!73199 (= lt!185762 lt!185761)))

(assert (=> d!73199 (= (getValueByKey!364 lt!185763 (_1!3308 lt!185579)) (Some!369 (_2!3308 lt!185579)))))

(assert (=> d!73199 (= lt!185761 (lemmaContainsTupThenGetReturnValue!186 lt!185763 (_1!3308 lt!185579) (_2!3308 lt!185579)))))

(assert (=> d!73199 (= lt!185763 (insertStrictlySorted!189 (toList!2769 lt!185575) (_1!3308 lt!185579) (_2!3308 lt!185579)))))

(assert (=> d!73199 (= (+!1064 lt!185575 lt!185579) lt!185764)))

(declare-fun b!392899 () Bool)

(declare-fun res!225005 () Bool)

(assert (=> b!392899 (=> (not res!225005) (not e!237919))))

(assert (=> b!392899 (= res!225005 (= (getValueByKey!364 (toList!2769 lt!185764) (_1!3308 lt!185579)) (Some!369 (_2!3308 lt!185579))))))

(declare-fun b!392900 () Bool)

(assert (=> b!392900 (= e!237919 (contains!2468 (toList!2769 lt!185764) lt!185579))))

(assert (= (and d!73199 res!225006) b!392899))

(assert (= (and b!392899 res!225005) b!392900))

(declare-fun m!389361 () Bool)

(assert (=> d!73199 m!389361))

(declare-fun m!389363 () Bool)

(assert (=> d!73199 m!389363))

(declare-fun m!389365 () Bool)

(assert (=> d!73199 m!389365))

(declare-fun m!389367 () Bool)

(assert (=> d!73199 m!389367))

(declare-fun m!389369 () Bool)

(assert (=> b!392899 m!389369))

(declare-fun m!389371 () Bool)

(assert (=> b!392900 m!389371))

(assert (=> b!392648 d!73199))

(declare-fun b!392908 () Bool)

(declare-fun e!237925 () Bool)

(assert (=> b!392908 (= e!237925 tp_is_empty!9687)))

(declare-fun mapNonEmpty!16128 () Bool)

(declare-fun mapRes!16128 () Bool)

(declare-fun tp!31833 () Bool)

(declare-fun e!237924 () Bool)

(assert (=> mapNonEmpty!16128 (= mapRes!16128 (and tp!31833 e!237924))))

(declare-fun mapKey!16128 () (_ BitVec 32))

(declare-fun mapRest!16128 () (Array (_ BitVec 32) ValueCell!4500))

(declare-fun mapValue!16128 () ValueCell!4500)

(assert (=> mapNonEmpty!16128 (= mapRest!16122 (store mapRest!16128 mapKey!16128 mapValue!16128))))

(declare-fun mapIsEmpty!16128 () Bool)

(assert (=> mapIsEmpty!16128 mapRes!16128))

(declare-fun condMapEmpty!16128 () Bool)

(declare-fun mapDefault!16128 () ValueCell!4500)

(assert (=> mapNonEmpty!16122 (= condMapEmpty!16128 (= mapRest!16122 ((as const (Array (_ BitVec 32) ValueCell!4500)) mapDefault!16128)))))

(assert (=> mapNonEmpty!16122 (= tp!31824 (and e!237925 mapRes!16128))))

(declare-fun b!392907 () Bool)

(assert (=> b!392907 (= e!237924 tp_is_empty!9687)))

(assert (= (and mapNonEmpty!16122 condMapEmpty!16128) mapIsEmpty!16128))

(assert (= (and mapNonEmpty!16122 (not condMapEmpty!16128)) mapNonEmpty!16128))

(assert (= (and mapNonEmpty!16128 ((_ is ValueCellFull!4500) mapValue!16128)) b!392907))

(assert (= (and mapNonEmpty!16122 ((_ is ValueCellFull!4500) mapDefault!16128)) b!392908))

(declare-fun m!389373 () Bool)

(assert (=> mapNonEmpty!16128 m!389373))

(declare-fun b_lambda!8755 () Bool)

(assert (= b_lambda!8747 (or (and start!38112 b_free!9015) b_lambda!8755)))

(declare-fun b_lambda!8757 () Bool)

(assert (= b_lambda!8745 (or (and start!38112 b_free!9015) b_lambda!8757)))

(declare-fun b_lambda!8759 () Bool)

(assert (= b_lambda!8749 (or (and start!38112 b_free!9015) b_lambda!8759)))

(declare-fun b_lambda!8761 () Bool)

(assert (= b_lambda!8743 (or (and start!38112 b_free!9015) b_lambda!8761)))

(declare-fun b_lambda!8763 () Bool)

(assert (= b_lambda!8753 (or (and start!38112 b_free!9015) b_lambda!8763)))

(declare-fun b_lambda!8765 () Bool)

(assert (= b_lambda!8751 (or (and start!38112 b_free!9015) b_lambda!8765)))

(check-sat (not b!392861) (not b!392899) b_and!16379 (not bm!27765) (not b!392780) (not bm!27757) (not bm!27761) (not b!392776) (not bm!27730) (not b!392709) (not b_lambda!8757) (not b!392848) (not b!392834) (not b!392869) (not d!73197) (not b!392715) (not b!392851) (not b_lambda!8761) (not bm!27760) (not b!392779) (not bm!27723) (not b!392783) (not b!392714) (not d!73183) (not b!392839) (not b!392749) (not b!392866) (not b!392744) (not d!73179) (not b!392837) (not b_lambda!8755) (not b!392746) (not b!392872) (not bm!27748) (not b!392885) (not b!392778) (not b!392880) (not d!73181) (not b!392853) (not b!392865) tp_is_empty!9687 (not bm!27746) (not d!73177) (not b!392889) (not b!392833) (not b!392891) (not b_lambda!8759) (not b!392888) (not d!73199) (not b!392873) (not b!392887) (not b!392726) (not b!392751) (not b!392782) (not b!392781) (not b!392900) (not b!392730) (not b_lambda!8765) (not bm!27747) (not bm!27722) (not b!392892) (not b!392883) (not bm!27726) (not mapNonEmpty!16128) (not b!392840) (not b!392854) (not b!392724) (not b!392787) (not bm!27758) (not b!392871) (not bm!27727) (not bm!27745) (not b!392743) (not b_lambda!8763) (not d!73187) (not d!73167) (not b!392748) (not b!392898) (not bm!27756) (not d!73185) (not b_next!9015) (not b!392897) (not b!392841) (not bm!27759) (not b!392728) (not b!392896) (not b!392890))
(check-sat b_and!16379 (not b_next!9015))
