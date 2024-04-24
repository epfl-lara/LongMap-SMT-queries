; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113566 () Bool)

(assert start!113566)

(declare-fun b_free!31393 () Bool)

(declare-fun b_next!31393 () Bool)

(assert (=> start!113566 (= b_free!31393 (not b_next!31393))))

(declare-fun tp!109984 () Bool)

(declare-fun b_and!50641 () Bool)

(assert (=> start!113566 (= tp!109984 b_and!50641)))

(declare-fun b!1346349 () Bool)

(declare-fun res!892972 () Bool)

(declare-fun e!766292 () Bool)

(assert (=> b!1346349 (=> (not res!892972) (not e!766292))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91733 0))(
  ( (array!91734 (arr!44318 (Array (_ BitVec 32) (_ BitVec 64))) (size!44869 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91733)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346349 (= res!892972 (not (= (select (arr!44318 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346350 () Bool)

(declare-fun e!766288 () Bool)

(assert (=> b!1346350 (= e!766292 e!766288)))

(declare-fun res!892970 () Bool)

(assert (=> b!1346350 (=> (not res!892970) (not e!766288))))

(declare-datatypes ((V!54961 0))(
  ( (V!54962 (val!18771 Int)) )
))
(declare-fun lt!595746 () V!54961)

(declare-datatypes ((tuple2!24232 0))(
  ( (tuple2!24233 (_1!12127 (_ BitVec 64)) (_2!12127 V!54961)) )
))
(declare-datatypes ((List!31377 0))(
  ( (Nil!31374) (Cons!31373 (h!32591 tuple2!24232) (t!45919 List!31377)) )
))
(declare-datatypes ((ListLongMap!21897 0))(
  ( (ListLongMap!21898 (toList!10964 List!31377)) )
))
(declare-fun lt!595748 () ListLongMap!21897)

(declare-fun contains!9152 (ListLongMap!21897 (_ BitVec 64)) Bool)

(declare-fun +!4859 (ListLongMap!21897 tuple2!24232) ListLongMap!21897)

(assert (=> b!1346350 (= res!892970 (contains!9152 (+!4859 lt!595748 (tuple2!24233 (select (arr!44318 _keys!1571) from!1960) lt!595746)) k0!1142))))

(declare-fun minValue!1245 () V!54961)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17798 0))(
  ( (ValueCellFull!17798 (v!21414 V!54961)) (EmptyCell!17798) )
))
(declare-datatypes ((array!91735 0))(
  ( (array!91736 (arr!44319 (Array (_ BitVec 32) ValueCell!17798)) (size!44870 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91735)

(declare-fun zeroValue!1245 () V!54961)

(declare-fun getCurrentListMapNoExtraKeys!6508 (array!91733 array!91735 (_ BitVec 32) (_ BitVec 32) V!54961 V!54961 (_ BitVec 32) Int) ListLongMap!21897)

(assert (=> b!1346350 (= lt!595748 (getCurrentListMapNoExtraKeys!6508 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22399 (ValueCell!17798 V!54961) V!54961)

(declare-fun dynLambda!3813 (Int (_ BitVec 64)) V!54961)

(assert (=> b!1346350 (= lt!595746 (get!22399 (select (arr!44319 _values!1303) from!1960) (dynLambda!3813 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1346351 () Bool)

(declare-fun res!892969 () Bool)

(assert (=> b!1346351 (=> (not res!892969) (not e!766292))))

(declare-datatypes ((List!31378 0))(
  ( (Nil!31375) (Cons!31374 (h!32592 (_ BitVec 64)) (t!45920 List!31378)) )
))
(declare-fun arrayNoDuplicates!0 (array!91733 (_ BitVec 32) List!31378) Bool)

(assert (=> b!1346351 (= res!892969 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31375))))

(declare-fun res!892963 () Bool)

(assert (=> start!113566 (=> (not res!892963) (not e!766292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113566 (= res!892963 (validMask!0 mask!1977))))

(assert (=> start!113566 e!766292))

(declare-fun tp_is_empty!37393 () Bool)

(assert (=> start!113566 tp_is_empty!37393))

(assert (=> start!113566 true))

(declare-fun array_inv!33665 (array!91733) Bool)

(assert (=> start!113566 (array_inv!33665 _keys!1571)))

(declare-fun e!766290 () Bool)

(declare-fun array_inv!33666 (array!91735) Bool)

(assert (=> start!113566 (and (array_inv!33666 _values!1303) e!766290)))

(assert (=> start!113566 tp!109984))

(declare-fun b!1346352 () Bool)

(declare-fun res!892964 () Bool)

(assert (=> b!1346352 (=> (not res!892964) (not e!766292))))

(assert (=> b!1346352 (= res!892964 (and (= (size!44870 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44869 _keys!1571) (size!44870 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346353 () Bool)

(declare-fun e!766291 () Bool)

(assert (=> b!1346353 (= e!766291 tp_is_empty!37393)))

(declare-fun b!1346354 () Bool)

(declare-fun res!892973 () Bool)

(assert (=> b!1346354 (=> (not res!892973) (not e!766288))))

(assert (=> b!1346354 (= res!892973 (not (= k0!1142 (select (arr!44318 _keys!1571) from!1960))))))

(declare-fun b!1346355 () Bool)

(assert (=> b!1346355 (= e!766288 (not true))))

(assert (=> b!1346355 (contains!9152 lt!595748 k0!1142)))

(declare-datatypes ((Unit!44048 0))(
  ( (Unit!44049) )
))
(declare-fun lt!595747 () Unit!44048)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!380 ((_ BitVec 64) (_ BitVec 64) V!54961 ListLongMap!21897) Unit!44048)

(assert (=> b!1346355 (= lt!595747 (lemmaInListMapAfterAddingDiffThenInBefore!380 k0!1142 (select (arr!44318 _keys!1571) from!1960) lt!595746 lt!595748))))

(declare-fun mapIsEmpty!57796 () Bool)

(declare-fun mapRes!57796 () Bool)

(assert (=> mapIsEmpty!57796 mapRes!57796))

(declare-fun b!1346356 () Bool)

(declare-fun res!892967 () Bool)

(assert (=> b!1346356 (=> (not res!892967) (not e!766292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346356 (= res!892967 (validKeyInArray!0 (select (arr!44318 _keys!1571) from!1960)))))

(declare-fun b!1346357 () Bool)

(declare-fun res!892965 () Bool)

(assert (=> b!1346357 (=> (not res!892965) (not e!766292))))

(assert (=> b!1346357 (= res!892965 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44869 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57796 () Bool)

(declare-fun tp!109983 () Bool)

(assert (=> mapNonEmpty!57796 (= mapRes!57796 (and tp!109983 e!766291))))

(declare-fun mapKey!57796 () (_ BitVec 32))

(declare-fun mapValue!57796 () ValueCell!17798)

(declare-fun mapRest!57796 () (Array (_ BitVec 32) ValueCell!17798))

(assert (=> mapNonEmpty!57796 (= (arr!44319 _values!1303) (store mapRest!57796 mapKey!57796 mapValue!57796))))

(declare-fun b!1346358 () Bool)

(declare-fun res!892968 () Bool)

(assert (=> b!1346358 (=> (not res!892968) (not e!766292))))

(assert (=> b!1346358 (= res!892968 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1346359 () Bool)

(declare-fun res!892966 () Bool)

(assert (=> b!1346359 (=> (not res!892966) (not e!766292))))

(declare-fun getCurrentListMap!5906 (array!91733 array!91735 (_ BitVec 32) (_ BitVec 32) V!54961 V!54961 (_ BitVec 32) Int) ListLongMap!21897)

(assert (=> b!1346359 (= res!892966 (contains!9152 (getCurrentListMap!5906 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346360 () Bool)

(declare-fun e!766289 () Bool)

(assert (=> b!1346360 (= e!766289 tp_is_empty!37393)))

(declare-fun b!1346361 () Bool)

(assert (=> b!1346361 (= e!766290 (and e!766289 mapRes!57796))))

(declare-fun condMapEmpty!57796 () Bool)

(declare-fun mapDefault!57796 () ValueCell!17798)

(assert (=> b!1346361 (= condMapEmpty!57796 (= (arr!44319 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17798)) mapDefault!57796)))))

(declare-fun b!1346362 () Bool)

(declare-fun res!892971 () Bool)

(assert (=> b!1346362 (=> (not res!892971) (not e!766292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91733 (_ BitVec 32)) Bool)

(assert (=> b!1346362 (= res!892971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113566 res!892963) b!1346352))

(assert (= (and b!1346352 res!892964) b!1346362))

(assert (= (and b!1346362 res!892971) b!1346351))

(assert (= (and b!1346351 res!892969) b!1346357))

(assert (= (and b!1346357 res!892965) b!1346359))

(assert (= (and b!1346359 res!892966) b!1346349))

(assert (= (and b!1346349 res!892972) b!1346356))

(assert (= (and b!1346356 res!892967) b!1346358))

(assert (= (and b!1346358 res!892968) b!1346350))

(assert (= (and b!1346350 res!892970) b!1346354))

(assert (= (and b!1346354 res!892973) b!1346355))

(assert (= (and b!1346361 condMapEmpty!57796) mapIsEmpty!57796))

(assert (= (and b!1346361 (not condMapEmpty!57796)) mapNonEmpty!57796))

(get-info :version)

(assert (= (and mapNonEmpty!57796 ((_ is ValueCellFull!17798) mapValue!57796)) b!1346353))

(assert (= (and b!1346361 ((_ is ValueCellFull!17798) mapDefault!57796)) b!1346360))

(assert (= start!113566 b!1346361))

(declare-fun b_lambda!24509 () Bool)

(assert (=> (not b_lambda!24509) (not b!1346350)))

(declare-fun t!45918 () Bool)

(declare-fun tb!12345 () Bool)

(assert (=> (and start!113566 (= defaultEntry!1306 defaultEntry!1306) t!45918) tb!12345))

(declare-fun result!25789 () Bool)

(assert (=> tb!12345 (= result!25789 tp_is_empty!37393)))

(assert (=> b!1346350 t!45918))

(declare-fun b_and!50643 () Bool)

(assert (= b_and!50641 (and (=> t!45918 result!25789) b_and!50643)))

(declare-fun m!1234113 () Bool)

(assert (=> mapNonEmpty!57796 m!1234113))

(declare-fun m!1234115 () Bool)

(assert (=> b!1346362 m!1234115))

(declare-fun m!1234117 () Bool)

(assert (=> b!1346356 m!1234117))

(assert (=> b!1346356 m!1234117))

(declare-fun m!1234119 () Bool)

(assert (=> b!1346356 m!1234119))

(assert (=> b!1346349 m!1234117))

(declare-fun m!1234121 () Bool)

(assert (=> b!1346355 m!1234121))

(assert (=> b!1346355 m!1234117))

(assert (=> b!1346355 m!1234117))

(declare-fun m!1234123 () Bool)

(assert (=> b!1346355 m!1234123))

(declare-fun m!1234125 () Bool)

(assert (=> b!1346350 m!1234125))

(declare-fun m!1234127 () Bool)

(assert (=> b!1346350 m!1234127))

(declare-fun m!1234129 () Bool)

(assert (=> b!1346350 m!1234129))

(declare-fun m!1234131 () Bool)

(assert (=> b!1346350 m!1234131))

(assert (=> b!1346350 m!1234117))

(assert (=> b!1346350 m!1234127))

(assert (=> b!1346350 m!1234129))

(declare-fun m!1234133 () Bool)

(assert (=> b!1346350 m!1234133))

(assert (=> b!1346350 m!1234131))

(declare-fun m!1234135 () Bool)

(assert (=> b!1346350 m!1234135))

(assert (=> b!1346354 m!1234117))

(declare-fun m!1234137 () Bool)

(assert (=> b!1346359 m!1234137))

(assert (=> b!1346359 m!1234137))

(declare-fun m!1234139 () Bool)

(assert (=> b!1346359 m!1234139))

(declare-fun m!1234141 () Bool)

(assert (=> b!1346351 m!1234141))

(declare-fun m!1234143 () Bool)

(assert (=> start!113566 m!1234143))

(declare-fun m!1234145 () Bool)

(assert (=> start!113566 m!1234145))

(declare-fun m!1234147 () Bool)

(assert (=> start!113566 m!1234147))

(check-sat (not b!1346351) (not mapNonEmpty!57796) tp_is_empty!37393 (not b!1346362) (not b!1346355) (not start!113566) b_and!50643 (not b_next!31393) (not b!1346350) (not b!1346359) (not b_lambda!24509) (not b!1346356))
(check-sat b_and!50643 (not b_next!31393))
