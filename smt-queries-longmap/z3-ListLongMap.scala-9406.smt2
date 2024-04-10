; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111932 () Bool)

(assert start!111932)

(declare-fun b_free!30531 () Bool)

(declare-fun b_next!30531 () Bool)

(assert (=> start!111932 (= b_free!30531 (not b_next!30531))))

(declare-fun tp!107072 () Bool)

(declare-fun b_and!49157 () Bool)

(assert (=> start!111932 (= tp!107072 b_and!49157)))

(declare-fun mapNonEmpty!56178 () Bool)

(declare-fun mapRes!56178 () Bool)

(declare-fun tp!107073 () Bool)

(declare-fun e!756078 () Bool)

(assert (=> mapNonEmpty!56178 (= mapRes!56178 (and tp!107073 e!756078))))

(declare-datatypes ((V!53571 0))(
  ( (V!53572 (val!18250 Int)) )
))
(declare-datatypes ((ValueCell!17277 0))(
  ( (ValueCellFull!17277 (v!20883 V!53571)) (EmptyCell!17277) )
))
(declare-fun mapValue!56178 () ValueCell!17277)

(declare-fun mapRest!56178 () (Array (_ BitVec 32) ValueCell!17277))

(declare-datatypes ((array!89608 0))(
  ( (array!89609 (arr!43277 (Array (_ BitVec 32) ValueCell!17277)) (size!43827 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89608)

(declare-fun mapKey!56178 () (_ BitVec 32))

(assert (=> mapNonEmpty!56178 (= (arr!43277 _values!1337) (store mapRest!56178 mapKey!56178 mapValue!56178))))

(declare-fun b!1326573 () Bool)

(declare-fun e!756080 () Bool)

(declare-fun e!756081 () Bool)

(assert (=> b!1326573 (= e!756080 (and e!756081 mapRes!56178))))

(declare-fun condMapEmpty!56178 () Bool)

(declare-fun mapDefault!56178 () ValueCell!17277)

(assert (=> b!1326573 (= condMapEmpty!56178 (= (arr!43277 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17277)) mapDefault!56178)))))

(declare-fun b!1326574 () Bool)

(declare-fun res!880450 () Bool)

(declare-fun e!756079 () Bool)

(assert (=> b!1326574 (=> (not res!880450) (not e!756079))))

(declare-datatypes ((array!89610 0))(
  ( (array!89611 (arr!43278 (Array (_ BitVec 32) (_ BitVec 64))) (size!43828 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89610)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1326574 (= res!880450 (not (= (select (arr!43278 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326575 () Bool)

(declare-fun res!880449 () Bool)

(assert (=> b!1326575 (=> (not res!880449) (not e!756079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326575 (= res!880449 (validKeyInArray!0 (select (arr!43278 _keys!1609) from!2000)))))

(declare-fun b!1326576 () Bool)

(declare-fun res!880454 () Bool)

(assert (=> b!1326576 (=> (not res!880454) (not e!756079))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1326576 (= res!880454 (and (= (size!43827 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43828 _keys!1609) (size!43827 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326577 () Bool)

(declare-fun res!880451 () Bool)

(assert (=> b!1326577 (=> (not res!880451) (not e!756079))))

(declare-fun zeroValue!1279 () V!53571)

(declare-fun minValue!1279 () V!53571)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23548 0))(
  ( (tuple2!23549 (_1!11785 (_ BitVec 64)) (_2!11785 V!53571)) )
))
(declare-datatypes ((List!30684 0))(
  ( (Nil!30681) (Cons!30680 (h!31889 tuple2!23548) (t!44686 List!30684)) )
))
(declare-datatypes ((ListLongMap!21205 0))(
  ( (ListLongMap!21206 (toList!10618 List!30684)) )
))
(declare-fun contains!8775 (ListLongMap!21205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5609 (array!89610 array!89608 (_ BitVec 32) (_ BitVec 32) V!53571 V!53571 (_ BitVec 32) Int) ListLongMap!21205)

(assert (=> b!1326577 (= res!880451 (contains!8775 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326578 () Bool)

(declare-fun res!880453 () Bool)

(assert (=> b!1326578 (=> (not res!880453) (not e!756079))))

(declare-datatypes ((List!30685 0))(
  ( (Nil!30682) (Cons!30681 (h!31890 (_ BitVec 64)) (t!44687 List!30685)) )
))
(declare-fun arrayNoDuplicates!0 (array!89610 (_ BitVec 32) List!30685) Bool)

(assert (=> b!1326578 (= res!880453 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30682))))

(declare-fun b!1326579 () Bool)

(declare-fun tp_is_empty!36351 () Bool)

(assert (=> b!1326579 (= e!756078 tp_is_empty!36351)))

(declare-fun b!1326580 () Bool)

(declare-fun res!880455 () Bool)

(assert (=> b!1326580 (=> (not res!880455) (not e!756079))))

(assert (=> b!1326580 (= res!880455 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43828 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!880452 () Bool)

(assert (=> start!111932 (=> (not res!880452) (not e!756079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111932 (= res!880452 (validMask!0 mask!2019))))

(assert (=> start!111932 e!756079))

(declare-fun array_inv!32665 (array!89610) Bool)

(assert (=> start!111932 (array_inv!32665 _keys!1609)))

(assert (=> start!111932 true))

(assert (=> start!111932 tp_is_empty!36351))

(declare-fun array_inv!32666 (array!89608) Bool)

(assert (=> start!111932 (and (array_inv!32666 _values!1337) e!756080)))

(assert (=> start!111932 tp!107072))

(declare-fun b!1326581 () Bool)

(declare-fun res!880456 () Bool)

(assert (=> b!1326581 (=> (not res!880456) (not e!756079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89610 (_ BitVec 32)) Bool)

(assert (=> b!1326581 (= res!880456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326582 () Bool)

(assert (=> b!1326582 (= e!756079 (not (contains!8775 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164)))))

(declare-fun lt!590209 () ListLongMap!21205)

(declare-fun +!4639 (ListLongMap!21205 tuple2!23548) ListLongMap!21205)

(assert (=> b!1326582 (contains!8775 (+!4639 lt!590209 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43706 0))(
  ( (Unit!43707) )
))
(declare-fun lt!590210 () Unit!43706)

(declare-fun addStillContains!1163 (ListLongMap!21205 (_ BitVec 64) V!53571 (_ BitVec 64)) Unit!43706)

(assert (=> b!1326582 (= lt!590210 (addStillContains!1163 lt!590209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1326582 (contains!8775 lt!590209 k0!1164)))

(declare-fun lt!590207 () ListLongMap!21205)

(declare-fun lt!590202 () tuple2!23548)

(assert (=> b!1326582 (= lt!590209 (+!4639 lt!590207 lt!590202))))

(declare-fun lt!590201 () Unit!43706)

(assert (=> b!1326582 (= lt!590201 (addStillContains!1163 lt!590207 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1326582 (contains!8775 lt!590207 k0!1164)))

(declare-fun lt!590204 () Unit!43706)

(declare-fun lt!590205 () V!53571)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!231 ((_ BitVec 64) (_ BitVec 64) V!53571 ListLongMap!21205) Unit!43706)

(assert (=> b!1326582 (= lt!590204 (lemmaInListMapAfterAddingDiffThenInBefore!231 k0!1164 (select (arr!43278 _keys!1609) from!2000) lt!590205 lt!590207))))

(declare-fun lt!590208 () ListLongMap!21205)

(assert (=> b!1326582 (contains!8775 lt!590208 k0!1164)))

(declare-fun lt!590211 () Unit!43706)

(assert (=> b!1326582 (= lt!590211 (lemmaInListMapAfterAddingDiffThenInBefore!231 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590208))))

(declare-fun lt!590206 () ListLongMap!21205)

(assert (=> b!1326582 (contains!8775 lt!590206 k0!1164)))

(declare-fun lt!590203 () Unit!43706)

(assert (=> b!1326582 (= lt!590203 (lemmaInListMapAfterAddingDiffThenInBefore!231 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590206))))

(assert (=> b!1326582 (= lt!590206 (+!4639 lt!590208 lt!590202))))

(assert (=> b!1326582 (= lt!590202 (tuple2!23549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1326582 (= lt!590208 (+!4639 lt!590207 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205)))))

(declare-fun get!21810 (ValueCell!17277 V!53571) V!53571)

(declare-fun dynLambda!3578 (Int (_ BitVec 64)) V!53571)

(assert (=> b!1326582 (= lt!590205 (get!21810 (select (arr!43277 _values!1337) from!2000) (dynLambda!3578 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6277 (array!89610 array!89608 (_ BitVec 32) (_ BitVec 32) V!53571 V!53571 (_ BitVec 32) Int) ListLongMap!21205)

(assert (=> b!1326582 (= lt!590207 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapIsEmpty!56178 () Bool)

(assert (=> mapIsEmpty!56178 mapRes!56178))

(declare-fun b!1326583 () Bool)

(assert (=> b!1326583 (= e!756081 tp_is_empty!36351)))

(assert (= (and start!111932 res!880452) b!1326576))

(assert (= (and b!1326576 res!880454) b!1326581))

(assert (= (and b!1326581 res!880456) b!1326578))

(assert (= (and b!1326578 res!880453) b!1326580))

(assert (= (and b!1326580 res!880455) b!1326577))

(assert (= (and b!1326577 res!880451) b!1326574))

(assert (= (and b!1326574 res!880450) b!1326575))

(assert (= (and b!1326575 res!880449) b!1326582))

(assert (= (and b!1326573 condMapEmpty!56178) mapIsEmpty!56178))

(assert (= (and b!1326573 (not condMapEmpty!56178)) mapNonEmpty!56178))

(get-info :version)

(assert (= (and mapNonEmpty!56178 ((_ is ValueCellFull!17277) mapValue!56178)) b!1326579))

(assert (= (and b!1326573 ((_ is ValueCellFull!17277) mapDefault!56178)) b!1326583))

(assert (= start!111932 b!1326573))

(declare-fun b_lambda!23809 () Bool)

(assert (=> (not b_lambda!23809) (not b!1326582)))

(declare-fun t!44685 () Bool)

(declare-fun tb!11805 () Bool)

(assert (=> (and start!111932 (= defaultEntry!1340 defaultEntry!1340) t!44685) tb!11805))

(declare-fun result!24667 () Bool)

(assert (=> tb!11805 (= result!24667 tp_is_empty!36351)))

(assert (=> b!1326582 t!44685))

(declare-fun b_and!49159 () Bool)

(assert (= b_and!49157 (and (=> t!44685 result!24667) b_and!49159)))

(declare-fun m!1215631 () Bool)

(assert (=> mapNonEmpty!56178 m!1215631))

(declare-fun m!1215633 () Bool)

(assert (=> b!1326575 m!1215633))

(assert (=> b!1326575 m!1215633))

(declare-fun m!1215635 () Bool)

(assert (=> b!1326575 m!1215635))

(declare-fun m!1215637 () Bool)

(assert (=> b!1326581 m!1215637))

(declare-fun m!1215639 () Bool)

(assert (=> b!1326578 m!1215639))

(assert (=> b!1326574 m!1215633))

(declare-fun m!1215641 () Bool)

(assert (=> b!1326577 m!1215641))

(assert (=> b!1326577 m!1215641))

(declare-fun m!1215643 () Bool)

(assert (=> b!1326577 m!1215643))

(declare-fun m!1215645 () Bool)

(assert (=> b!1326582 m!1215645))

(declare-fun m!1215647 () Bool)

(assert (=> b!1326582 m!1215647))

(declare-fun m!1215649 () Bool)

(assert (=> b!1326582 m!1215649))

(assert (=> b!1326582 m!1215633))

(declare-fun m!1215651 () Bool)

(assert (=> b!1326582 m!1215651))

(declare-fun m!1215653 () Bool)

(assert (=> b!1326582 m!1215653))

(declare-fun m!1215655 () Bool)

(assert (=> b!1326582 m!1215655))

(declare-fun m!1215657 () Bool)

(assert (=> b!1326582 m!1215657))

(declare-fun m!1215659 () Bool)

(assert (=> b!1326582 m!1215659))

(declare-fun m!1215661 () Bool)

(assert (=> b!1326582 m!1215661))

(assert (=> b!1326582 m!1215659))

(assert (=> b!1326582 m!1215649))

(declare-fun m!1215663 () Bool)

(assert (=> b!1326582 m!1215663))

(declare-fun m!1215665 () Bool)

(assert (=> b!1326582 m!1215665))

(assert (=> b!1326582 m!1215633))

(assert (=> b!1326582 m!1215655))

(declare-fun m!1215667 () Bool)

(assert (=> b!1326582 m!1215667))

(declare-fun m!1215669 () Bool)

(assert (=> b!1326582 m!1215669))

(declare-fun m!1215671 () Bool)

(assert (=> b!1326582 m!1215671))

(declare-fun m!1215673 () Bool)

(assert (=> b!1326582 m!1215673))

(assert (=> b!1326582 m!1215671))

(declare-fun m!1215675 () Bool)

(assert (=> b!1326582 m!1215675))

(declare-fun m!1215677 () Bool)

(assert (=> b!1326582 m!1215677))

(declare-fun m!1215679 () Bool)

(assert (=> b!1326582 m!1215679))

(declare-fun m!1215681 () Bool)

(assert (=> b!1326582 m!1215681))

(declare-fun m!1215683 () Bool)

(assert (=> b!1326582 m!1215683))

(declare-fun m!1215685 () Bool)

(assert (=> start!111932 m!1215685))

(declare-fun m!1215687 () Bool)

(assert (=> start!111932 m!1215687))

(declare-fun m!1215689 () Bool)

(assert (=> start!111932 m!1215689))

(check-sat (not b!1326575) (not b!1326578) b_and!49159 (not mapNonEmpty!56178) (not b!1326582) (not start!111932) (not b_lambda!23809) (not b_next!30531) (not b!1326577) (not b!1326581) tp_is_empty!36351)
(check-sat b_and!49159 (not b_next!30531))
(get-model)

(declare-fun b_lambda!23813 () Bool)

(assert (= b_lambda!23809 (or (and start!111932 b_free!30531) b_lambda!23813)))

(check-sat (not b!1326578) b_and!49159 (not mapNonEmpty!56178) (not b!1326582) (not start!111932) (not b!1326575) (not b_lambda!23813) (not b_next!30531) (not b!1326577) (not b!1326581) tp_is_empty!36351)
(check-sat b_and!49159 (not b_next!30531))
(get-model)

(declare-fun d!143089 () Bool)

(assert (=> d!143089 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111932 d!143089))

(declare-fun d!143091 () Bool)

(assert (=> d!143091 (= (array_inv!32665 _keys!1609) (bvsge (size!43828 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111932 d!143091))

(declare-fun d!143093 () Bool)

(assert (=> d!143093 (= (array_inv!32666 _values!1337) (bvsge (size!43827 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111932 d!143093))

(declare-fun d!143095 () Bool)

(assert (=> d!143095 (= (validKeyInArray!0 (select (arr!43278 _keys!1609) from!2000)) (and (not (= (select (arr!43278 _keys!1609) from!2000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43278 _keys!1609) from!2000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326575 d!143095))

(declare-fun b!1326629 () Bool)

(declare-fun e!756104 () Bool)

(declare-fun call!64736 () Bool)

(assert (=> b!1326629 (= e!756104 call!64736)))

(declare-fun b!1326630 () Bool)

(declare-fun e!756105 () Bool)

(declare-fun e!756106 () Bool)

(assert (=> b!1326630 (= e!756105 e!756106)))

(declare-fun c!125757 () Bool)

(assert (=> b!1326630 (= c!125757 (validKeyInArray!0 (select (arr!43278 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!143097 () Bool)

(declare-fun res!880485 () Bool)

(assert (=> d!143097 (=> res!880485 e!756105)))

(assert (=> d!143097 (= res!880485 (bvsge #b00000000000000000000000000000000 (size!43828 _keys!1609)))))

(assert (=> d!143097 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!756105)))

(declare-fun bm!64733 () Bool)

(assert (=> bm!64733 (= call!64736 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1326631 () Bool)

(assert (=> b!1326631 (= e!756106 e!756104)))

(declare-fun lt!590251 () (_ BitVec 64))

(assert (=> b!1326631 (= lt!590251 (select (arr!43278 _keys!1609) #b00000000000000000000000000000000))))

(declare-fun lt!590253 () Unit!43706)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89610 (_ BitVec 64) (_ BitVec 32)) Unit!43706)

(assert (=> b!1326631 (= lt!590253 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590251 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1326631 (arrayContainsKey!0 _keys!1609 lt!590251 #b00000000000000000000000000000000)))

(declare-fun lt!590252 () Unit!43706)

(assert (=> b!1326631 (= lt!590252 lt!590253)))

(declare-fun res!880486 () Bool)

(declare-datatypes ((SeekEntryResult!10041 0))(
  ( (MissingZero!10041 (index!42535 (_ BitVec 32))) (Found!10041 (index!42536 (_ BitVec 32))) (Intermediate!10041 (undefined!10853 Bool) (index!42537 (_ BitVec 32)) (x!118292 (_ BitVec 32))) (Undefined!10041) (MissingVacant!10041 (index!42538 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89610 (_ BitVec 32)) SeekEntryResult!10041)

(assert (=> b!1326631 (= res!880486 (= (seekEntryOrOpen!0 (select (arr!43278 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10041 #b00000000000000000000000000000000)))))

(assert (=> b!1326631 (=> (not res!880486) (not e!756104))))

(declare-fun b!1326632 () Bool)

(assert (=> b!1326632 (= e!756106 call!64736)))

(assert (= (and d!143097 (not res!880485)) b!1326630))

(assert (= (and b!1326630 c!125757) b!1326631))

(assert (= (and b!1326630 (not c!125757)) b!1326632))

(assert (= (and b!1326631 res!880486) b!1326629))

(assert (= (or b!1326629 b!1326632) bm!64733))

(declare-fun m!1215751 () Bool)

(assert (=> b!1326630 m!1215751))

(assert (=> b!1326630 m!1215751))

(declare-fun m!1215753 () Bool)

(assert (=> b!1326630 m!1215753))

(declare-fun m!1215755 () Bool)

(assert (=> bm!64733 m!1215755))

(assert (=> b!1326631 m!1215751))

(declare-fun m!1215757 () Bool)

(assert (=> b!1326631 m!1215757))

(declare-fun m!1215759 () Bool)

(assert (=> b!1326631 m!1215759))

(assert (=> b!1326631 m!1215751))

(declare-fun m!1215761 () Bool)

(assert (=> b!1326631 m!1215761))

(assert (=> b!1326581 d!143097))

(declare-fun d!143099 () Bool)

(declare-fun e!756109 () Bool)

(assert (=> d!143099 e!756109))

(declare-fun res!880491 () Bool)

(assert (=> d!143099 (=> (not res!880491) (not e!756109))))

(declare-fun lt!590263 () ListLongMap!21205)

(assert (=> d!143099 (= res!880491 (contains!8775 lt!590263 (_1!11785 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205))))))

(declare-fun lt!590265 () List!30684)

(assert (=> d!143099 (= lt!590263 (ListLongMap!21206 lt!590265))))

(declare-fun lt!590262 () Unit!43706)

(declare-fun lt!590264 () Unit!43706)

(assert (=> d!143099 (= lt!590262 lt!590264)))

(declare-datatypes ((Option!765 0))(
  ( (Some!764 (v!20885 V!53571)) (None!763) )
))
(declare-fun getValueByKey!713 (List!30684 (_ BitVec 64)) Option!765)

(assert (=> d!143099 (= (getValueByKey!713 lt!590265 (_1!11785 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205))) (Some!764 (_2!11785 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205))))))

(declare-fun lemmaContainsTupThenGetReturnValue!358 (List!30684 (_ BitVec 64) V!53571) Unit!43706)

(assert (=> d!143099 (= lt!590264 (lemmaContainsTupThenGetReturnValue!358 lt!590265 (_1!11785 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205)) (_2!11785 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205))))))

(declare-fun insertStrictlySorted!487 (List!30684 (_ BitVec 64) V!53571) List!30684)

(assert (=> d!143099 (= lt!590265 (insertStrictlySorted!487 (toList!10618 lt!590207) (_1!11785 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205)) (_2!11785 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205))))))

(assert (=> d!143099 (= (+!4639 lt!590207 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205)) lt!590263)))

(declare-fun b!1326637 () Bool)

(declare-fun res!880492 () Bool)

(assert (=> b!1326637 (=> (not res!880492) (not e!756109))))

(assert (=> b!1326637 (= res!880492 (= (getValueByKey!713 (toList!10618 lt!590263) (_1!11785 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205))) (Some!764 (_2!11785 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205)))))))

(declare-fun b!1326638 () Bool)

(declare-fun contains!8776 (List!30684 tuple2!23548) Bool)

(assert (=> b!1326638 (= e!756109 (contains!8776 (toList!10618 lt!590263) (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205)))))

(assert (= (and d!143099 res!880491) b!1326637))

(assert (= (and b!1326637 res!880492) b!1326638))

(declare-fun m!1215763 () Bool)

(assert (=> d!143099 m!1215763))

(declare-fun m!1215765 () Bool)

(assert (=> d!143099 m!1215765))

(declare-fun m!1215767 () Bool)

(assert (=> d!143099 m!1215767))

(declare-fun m!1215769 () Bool)

(assert (=> d!143099 m!1215769))

(declare-fun m!1215771 () Bool)

(assert (=> b!1326637 m!1215771))

(declare-fun m!1215773 () Bool)

(assert (=> b!1326638 m!1215773))

(assert (=> b!1326582 d!143099))

(declare-fun d!143101 () Bool)

(assert (=> d!143101 (contains!8775 (+!4639 lt!590207 (tuple2!23549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) k0!1164)))

(declare-fun lt!590268 () Unit!43706)

(declare-fun choose!1950 (ListLongMap!21205 (_ BitVec 64) V!53571 (_ BitVec 64)) Unit!43706)

(assert (=> d!143101 (= lt!590268 (choose!1950 lt!590207 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> d!143101 (contains!8775 lt!590207 k0!1164)))

(assert (=> d!143101 (= (addStillContains!1163 lt!590207 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164) lt!590268)))

(declare-fun bs!37946 () Bool)

(assert (= bs!37946 d!143101))

(declare-fun m!1215775 () Bool)

(assert (=> bs!37946 m!1215775))

(assert (=> bs!37946 m!1215775))

(declare-fun m!1215777 () Bool)

(assert (=> bs!37946 m!1215777))

(declare-fun m!1215779 () Bool)

(assert (=> bs!37946 m!1215779))

(assert (=> bs!37946 m!1215653))

(assert (=> b!1326582 d!143101))

(declare-fun d!143103 () Bool)

(declare-fun e!756115 () Bool)

(assert (=> d!143103 e!756115))

(declare-fun res!880495 () Bool)

(assert (=> d!143103 (=> res!880495 e!756115)))

(declare-fun lt!590278 () Bool)

(assert (=> d!143103 (= res!880495 (not lt!590278))))

(declare-fun lt!590279 () Bool)

(assert (=> d!143103 (= lt!590278 lt!590279)))

(declare-fun lt!590277 () Unit!43706)

(declare-fun e!756114 () Unit!43706)

(assert (=> d!143103 (= lt!590277 e!756114)))

(declare-fun c!125760 () Bool)

(assert (=> d!143103 (= c!125760 lt!590279)))

(declare-fun containsKey!735 (List!30684 (_ BitVec 64)) Bool)

(assert (=> d!143103 (= lt!590279 (containsKey!735 (toList!10618 lt!590206) k0!1164))))

(assert (=> d!143103 (= (contains!8775 lt!590206 k0!1164) lt!590278)))

(declare-fun b!1326646 () Bool)

(declare-fun lt!590280 () Unit!43706)

(assert (=> b!1326646 (= e!756114 lt!590280)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!481 (List!30684 (_ BitVec 64)) Unit!43706)

(assert (=> b!1326646 (= lt!590280 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10618 lt!590206) k0!1164))))

(declare-fun isDefined!520 (Option!765) Bool)

(assert (=> b!1326646 (isDefined!520 (getValueByKey!713 (toList!10618 lt!590206) k0!1164))))

(declare-fun b!1326647 () Bool)

(declare-fun Unit!43708 () Unit!43706)

(assert (=> b!1326647 (= e!756114 Unit!43708)))

(declare-fun b!1326648 () Bool)

(assert (=> b!1326648 (= e!756115 (isDefined!520 (getValueByKey!713 (toList!10618 lt!590206) k0!1164)))))

(assert (= (and d!143103 c!125760) b!1326646))

(assert (= (and d!143103 (not c!125760)) b!1326647))

(assert (= (and d!143103 (not res!880495)) b!1326648))

(declare-fun m!1215781 () Bool)

(assert (=> d!143103 m!1215781))

(declare-fun m!1215783 () Bool)

(assert (=> b!1326646 m!1215783))

(declare-fun m!1215785 () Bool)

(assert (=> b!1326646 m!1215785))

(assert (=> b!1326646 m!1215785))

(declare-fun m!1215787 () Bool)

(assert (=> b!1326646 m!1215787))

(assert (=> b!1326648 m!1215785))

(assert (=> b!1326648 m!1215785))

(assert (=> b!1326648 m!1215787))

(assert (=> b!1326582 d!143103))

(declare-fun d!143105 () Bool)

(declare-fun e!756117 () Bool)

(assert (=> d!143105 e!756117))

(declare-fun res!880496 () Bool)

(assert (=> d!143105 (=> res!880496 e!756117)))

(declare-fun lt!590282 () Bool)

(assert (=> d!143105 (= res!880496 (not lt!590282))))

(declare-fun lt!590283 () Bool)

(assert (=> d!143105 (= lt!590282 lt!590283)))

(declare-fun lt!590281 () Unit!43706)

(declare-fun e!756116 () Unit!43706)

(assert (=> d!143105 (= lt!590281 e!756116)))

(declare-fun c!125761 () Bool)

(assert (=> d!143105 (= c!125761 lt!590283)))

(assert (=> d!143105 (= lt!590283 (containsKey!735 (toList!10618 lt!590207) k0!1164))))

(assert (=> d!143105 (= (contains!8775 lt!590207 k0!1164) lt!590282)))

(declare-fun b!1326649 () Bool)

(declare-fun lt!590284 () Unit!43706)

(assert (=> b!1326649 (= e!756116 lt!590284)))

(assert (=> b!1326649 (= lt!590284 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10618 lt!590207) k0!1164))))

(assert (=> b!1326649 (isDefined!520 (getValueByKey!713 (toList!10618 lt!590207) k0!1164))))

(declare-fun b!1326650 () Bool)

(declare-fun Unit!43709 () Unit!43706)

(assert (=> b!1326650 (= e!756116 Unit!43709)))

(declare-fun b!1326651 () Bool)

(assert (=> b!1326651 (= e!756117 (isDefined!520 (getValueByKey!713 (toList!10618 lt!590207) k0!1164)))))

(assert (= (and d!143105 c!125761) b!1326649))

(assert (= (and d!143105 (not c!125761)) b!1326650))

(assert (= (and d!143105 (not res!880496)) b!1326651))

(declare-fun m!1215789 () Bool)

(assert (=> d!143105 m!1215789))

(declare-fun m!1215791 () Bool)

(assert (=> b!1326649 m!1215791))

(declare-fun m!1215793 () Bool)

(assert (=> b!1326649 m!1215793))

(assert (=> b!1326649 m!1215793))

(declare-fun m!1215795 () Bool)

(assert (=> b!1326649 m!1215795))

(assert (=> b!1326651 m!1215793))

(assert (=> b!1326651 m!1215793))

(assert (=> b!1326651 m!1215795))

(assert (=> b!1326582 d!143105))

(declare-fun d!143107 () Bool)

(declare-fun c!125764 () Bool)

(assert (=> d!143107 (= c!125764 ((_ is ValueCellFull!17277) (select (arr!43277 _values!1337) from!2000)))))

(declare-fun e!756120 () V!53571)

(assert (=> d!143107 (= (get!21810 (select (arr!43277 _values!1337) from!2000) (dynLambda!3578 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!756120)))

(declare-fun b!1326656 () Bool)

(declare-fun get!21811 (ValueCell!17277 V!53571) V!53571)

(assert (=> b!1326656 (= e!756120 (get!21811 (select (arr!43277 _values!1337) from!2000) (dynLambda!3578 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1326657 () Bool)

(declare-fun get!21812 (ValueCell!17277 V!53571) V!53571)

(assert (=> b!1326657 (= e!756120 (get!21812 (select (arr!43277 _values!1337) from!2000) (dynLambda!3578 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143107 c!125764) b!1326656))

(assert (= (and d!143107 (not c!125764)) b!1326657))

(assert (=> b!1326656 m!1215659))

(assert (=> b!1326656 m!1215649))

(declare-fun m!1215797 () Bool)

(assert (=> b!1326656 m!1215797))

(assert (=> b!1326657 m!1215659))

(assert (=> b!1326657 m!1215649))

(declare-fun m!1215799 () Bool)

(assert (=> b!1326657 m!1215799))

(assert (=> b!1326582 d!143107))

(declare-fun d!143109 () Bool)

(assert (=> d!143109 (contains!8775 lt!590206 k0!1164)))

(declare-fun lt!590287 () Unit!43706)

(declare-fun choose!1951 ((_ BitVec 64) (_ BitVec 64) V!53571 ListLongMap!21205) Unit!43706)

(assert (=> d!143109 (= lt!590287 (choose!1951 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590206))))

(assert (=> d!143109 (contains!8775 (+!4639 lt!590206 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(assert (=> d!143109 (= (lemmaInListMapAfterAddingDiffThenInBefore!231 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590206) lt!590287)))

(declare-fun bs!37947 () Bool)

(assert (= bs!37947 d!143109))

(assert (=> bs!37947 m!1215675))

(declare-fun m!1215801 () Bool)

(assert (=> bs!37947 m!1215801))

(declare-fun m!1215803 () Bool)

(assert (=> bs!37947 m!1215803))

(assert (=> bs!37947 m!1215803))

(declare-fun m!1215805 () Bool)

(assert (=> bs!37947 m!1215805))

(assert (=> b!1326582 d!143109))

(declare-fun d!143111 () Bool)

(assert (=> d!143111 (contains!8775 lt!590207 k0!1164)))

(declare-fun lt!590288 () Unit!43706)

(assert (=> d!143111 (= lt!590288 (choose!1951 k0!1164 (select (arr!43278 _keys!1609) from!2000) lt!590205 lt!590207))))

(assert (=> d!143111 (contains!8775 (+!4639 lt!590207 (tuple2!23549 (select (arr!43278 _keys!1609) from!2000) lt!590205)) k0!1164)))

(assert (=> d!143111 (= (lemmaInListMapAfterAddingDiffThenInBefore!231 k0!1164 (select (arr!43278 _keys!1609) from!2000) lt!590205 lt!590207) lt!590288)))

(declare-fun bs!37948 () Bool)

(assert (= bs!37948 d!143111))

(assert (=> bs!37948 m!1215653))

(assert (=> bs!37948 m!1215633))

(declare-fun m!1215807 () Bool)

(assert (=> bs!37948 m!1215807))

(assert (=> bs!37948 m!1215683))

(assert (=> bs!37948 m!1215683))

(declare-fun m!1215809 () Bool)

(assert (=> bs!37948 m!1215809))

(assert (=> b!1326582 d!143111))

(declare-fun d!143113 () Bool)

(declare-fun e!756122 () Bool)

(assert (=> d!143113 e!756122))

(declare-fun res!880497 () Bool)

(assert (=> d!143113 (=> res!880497 e!756122)))

(declare-fun lt!590290 () Bool)

(assert (=> d!143113 (= res!880497 (not lt!590290))))

(declare-fun lt!590291 () Bool)

(assert (=> d!143113 (= lt!590290 lt!590291)))

(declare-fun lt!590289 () Unit!43706)

(declare-fun e!756121 () Unit!43706)

(assert (=> d!143113 (= lt!590289 e!756121)))

(declare-fun c!125765 () Bool)

(assert (=> d!143113 (= c!125765 lt!590291)))

(assert (=> d!143113 (= lt!590291 (containsKey!735 (toList!10618 lt!590209) k0!1164))))

(assert (=> d!143113 (= (contains!8775 lt!590209 k0!1164) lt!590290)))

(declare-fun b!1326658 () Bool)

(declare-fun lt!590292 () Unit!43706)

(assert (=> b!1326658 (= e!756121 lt!590292)))

(assert (=> b!1326658 (= lt!590292 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10618 lt!590209) k0!1164))))

(assert (=> b!1326658 (isDefined!520 (getValueByKey!713 (toList!10618 lt!590209) k0!1164))))

(declare-fun b!1326659 () Bool)

(declare-fun Unit!43710 () Unit!43706)

(assert (=> b!1326659 (= e!756121 Unit!43710)))

(declare-fun b!1326660 () Bool)

(assert (=> b!1326660 (= e!756122 (isDefined!520 (getValueByKey!713 (toList!10618 lt!590209) k0!1164)))))

(assert (= (and d!143113 c!125765) b!1326658))

(assert (= (and d!143113 (not c!125765)) b!1326659))

(assert (= (and d!143113 (not res!880497)) b!1326660))

(declare-fun m!1215811 () Bool)

(assert (=> d!143113 m!1215811))

(declare-fun m!1215813 () Bool)

(assert (=> b!1326658 m!1215813))

(declare-fun m!1215815 () Bool)

(assert (=> b!1326658 m!1215815))

(assert (=> b!1326658 m!1215815))

(declare-fun m!1215817 () Bool)

(assert (=> b!1326658 m!1215817))

(assert (=> b!1326660 m!1215815))

(assert (=> b!1326660 m!1215815))

(assert (=> b!1326660 m!1215817))

(assert (=> b!1326582 d!143113))

(declare-fun d!143115 () Bool)

(declare-fun e!756123 () Bool)

(assert (=> d!143115 e!756123))

(declare-fun res!880498 () Bool)

(assert (=> d!143115 (=> (not res!880498) (not e!756123))))

(declare-fun lt!590294 () ListLongMap!21205)

(assert (=> d!143115 (= res!880498 (contains!8775 lt!590294 (_1!11785 lt!590202)))))

(declare-fun lt!590296 () List!30684)

(assert (=> d!143115 (= lt!590294 (ListLongMap!21206 lt!590296))))

(declare-fun lt!590293 () Unit!43706)

(declare-fun lt!590295 () Unit!43706)

(assert (=> d!143115 (= lt!590293 lt!590295)))

(assert (=> d!143115 (= (getValueByKey!713 lt!590296 (_1!11785 lt!590202)) (Some!764 (_2!11785 lt!590202)))))

(assert (=> d!143115 (= lt!590295 (lemmaContainsTupThenGetReturnValue!358 lt!590296 (_1!11785 lt!590202) (_2!11785 lt!590202)))))

(assert (=> d!143115 (= lt!590296 (insertStrictlySorted!487 (toList!10618 lt!590208) (_1!11785 lt!590202) (_2!11785 lt!590202)))))

(assert (=> d!143115 (= (+!4639 lt!590208 lt!590202) lt!590294)))

(declare-fun b!1326661 () Bool)

(declare-fun res!880499 () Bool)

(assert (=> b!1326661 (=> (not res!880499) (not e!756123))))

(assert (=> b!1326661 (= res!880499 (= (getValueByKey!713 (toList!10618 lt!590294) (_1!11785 lt!590202)) (Some!764 (_2!11785 lt!590202))))))

(declare-fun b!1326662 () Bool)

(assert (=> b!1326662 (= e!756123 (contains!8776 (toList!10618 lt!590294) lt!590202))))

(assert (= (and d!143115 res!880498) b!1326661))

(assert (= (and b!1326661 res!880499) b!1326662))

(declare-fun m!1215819 () Bool)

(assert (=> d!143115 m!1215819))

(declare-fun m!1215821 () Bool)

(assert (=> d!143115 m!1215821))

(declare-fun m!1215823 () Bool)

(assert (=> d!143115 m!1215823))

(declare-fun m!1215825 () Bool)

(assert (=> d!143115 m!1215825))

(declare-fun m!1215827 () Bool)

(assert (=> b!1326661 m!1215827))

(declare-fun m!1215829 () Bool)

(assert (=> b!1326662 m!1215829))

(assert (=> b!1326582 d!143115))

(declare-fun d!143117 () Bool)

(declare-fun e!756125 () Bool)

(assert (=> d!143117 e!756125))

(declare-fun res!880500 () Bool)

(assert (=> d!143117 (=> res!880500 e!756125)))

(declare-fun lt!590298 () Bool)

(assert (=> d!143117 (= res!880500 (not lt!590298))))

(declare-fun lt!590299 () Bool)

(assert (=> d!143117 (= lt!590298 lt!590299)))

(declare-fun lt!590297 () Unit!43706)

(declare-fun e!756124 () Unit!43706)

(assert (=> d!143117 (= lt!590297 e!756124)))

(declare-fun c!125766 () Bool)

(assert (=> d!143117 (= c!125766 lt!590299)))

(assert (=> d!143117 (= lt!590299 (containsKey!735 (toList!10618 lt!590208) k0!1164))))

(assert (=> d!143117 (= (contains!8775 lt!590208 k0!1164) lt!590298)))

(declare-fun b!1326663 () Bool)

(declare-fun lt!590300 () Unit!43706)

(assert (=> b!1326663 (= e!756124 lt!590300)))

(assert (=> b!1326663 (= lt!590300 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10618 lt!590208) k0!1164))))

(assert (=> b!1326663 (isDefined!520 (getValueByKey!713 (toList!10618 lt!590208) k0!1164))))

(declare-fun b!1326664 () Bool)

(declare-fun Unit!43711 () Unit!43706)

(assert (=> b!1326664 (= e!756124 Unit!43711)))

(declare-fun b!1326665 () Bool)

(assert (=> b!1326665 (= e!756125 (isDefined!520 (getValueByKey!713 (toList!10618 lt!590208) k0!1164)))))

(assert (= (and d!143117 c!125766) b!1326663))

(assert (= (and d!143117 (not c!125766)) b!1326664))

(assert (= (and d!143117 (not res!880500)) b!1326665))

(declare-fun m!1215831 () Bool)

(assert (=> d!143117 m!1215831))

(declare-fun m!1215833 () Bool)

(assert (=> b!1326663 m!1215833))

(declare-fun m!1215835 () Bool)

(assert (=> b!1326663 m!1215835))

(assert (=> b!1326663 m!1215835))

(declare-fun m!1215837 () Bool)

(assert (=> b!1326663 m!1215837))

(assert (=> b!1326665 m!1215835))

(assert (=> b!1326665 m!1215835))

(assert (=> b!1326665 m!1215837))

(assert (=> b!1326582 d!143117))

(declare-fun d!143119 () Bool)

(assert (=> d!143119 (contains!8775 lt!590208 k0!1164)))

(declare-fun lt!590301 () Unit!43706)

(assert (=> d!143119 (= lt!590301 (choose!1951 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590208))))

(assert (=> d!143119 (contains!8775 (+!4639 lt!590208 (tuple2!23549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) k0!1164)))

(assert (=> d!143119 (= (lemmaInListMapAfterAddingDiffThenInBefore!231 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590208) lt!590301)))

(declare-fun bs!37949 () Bool)

(assert (= bs!37949 d!143119))

(assert (=> bs!37949 m!1215657))

(declare-fun m!1215839 () Bool)

(assert (=> bs!37949 m!1215839))

(declare-fun m!1215841 () Bool)

(assert (=> bs!37949 m!1215841))

(assert (=> bs!37949 m!1215841))

(declare-fun m!1215843 () Bool)

(assert (=> bs!37949 m!1215843))

(assert (=> b!1326582 d!143119))

(declare-fun b!1326708 () Bool)

(declare-fun e!756155 () Bool)

(declare-fun lt!590360 () ListLongMap!21205)

(declare-fun apply!1030 (ListLongMap!21205 (_ BitVec 64)) V!53571)

(assert (=> b!1326708 (= e!756155 (= (apply!1030 lt!590360 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1326709 () Bool)

(declare-fun e!756154 () Bool)

(assert (=> b!1326709 (= e!756154 e!756155)))

(declare-fun res!880522 () Bool)

(declare-fun call!64757 () Bool)

(assert (=> b!1326709 (= res!880522 call!64757)))

(assert (=> b!1326709 (=> (not res!880522) (not e!756155))))

(declare-fun call!64751 () ListLongMap!21205)

(declare-fun bm!64748 () Bool)

(assert (=> bm!64748 (= call!64751 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1326710 () Bool)

(declare-fun e!756156 () ListLongMap!21205)

(declare-fun e!756160 () ListLongMap!21205)

(assert (=> b!1326710 (= e!756156 e!756160)))

(declare-fun c!125784 () Bool)

(assert (=> b!1326710 (= c!125784 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1326711 () Bool)

(declare-fun e!756152 () Unit!43706)

(declare-fun Unit!43712 () Unit!43706)

(assert (=> b!1326711 (= e!756152 Unit!43712)))

(declare-fun bm!64749 () Bool)

(declare-fun call!64753 () ListLongMap!21205)

(assert (=> bm!64749 (= call!64753 call!64751)))

(declare-fun b!1326712 () Bool)

(declare-fun res!880524 () Bool)

(declare-fun e!756158 () Bool)

(assert (=> b!1326712 (=> (not res!880524) (not e!756158))))

(declare-fun e!756157 () Bool)

(assert (=> b!1326712 (= res!880524 e!756157)))

(declare-fun c!125783 () Bool)

(assert (=> b!1326712 (= c!125783 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64750 () Bool)

(assert (=> bm!64750 (= call!64757 (contains!8775 lt!590360 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326714 () Bool)

(declare-fun e!756159 () Bool)

(assert (=> b!1326714 (= e!756159 (= (apply!1030 lt!590360 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1326715 () Bool)

(declare-fun call!64752 () ListLongMap!21205)

(assert (=> b!1326715 (= e!756156 (+!4639 call!64752 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun b!1326716 () Bool)

(declare-fun res!880520 () Bool)

(assert (=> b!1326716 (=> (not res!880520) (not e!756158))))

(declare-fun e!756153 () Bool)

(assert (=> b!1326716 (= res!880520 e!756153)))

(declare-fun res!880527 () Bool)

(assert (=> b!1326716 (=> res!880527 e!756153)))

(declare-fun e!756162 () Bool)

(assert (=> b!1326716 (= res!880527 (not e!756162))))

(declare-fun res!880519 () Bool)

(assert (=> b!1326716 (=> (not res!880519) (not e!756162))))

(assert (=> b!1326716 (= res!880519 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43828 _keys!1609)))))

(declare-fun b!1326717 () Bool)

(declare-fun e!756161 () Bool)

(assert (=> b!1326717 (= e!756161 (= (apply!1030 lt!590360 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21810 (select (arr!43277 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3578 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326717 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43827 _values!1337)))))

(assert (=> b!1326717 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43828 _keys!1609)))))

(declare-fun b!1326718 () Bool)

(assert (=> b!1326718 (= e!756158 e!756154)))

(declare-fun c!125781 () Bool)

(assert (=> b!1326718 (= c!125781 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64751 () Bool)

(declare-fun call!64756 () Bool)

(assert (=> bm!64751 (= call!64756 (contains!8775 lt!590360 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326719 () Bool)

(declare-fun e!756163 () ListLongMap!21205)

(declare-fun call!64754 () ListLongMap!21205)

(assert (=> b!1326719 (= e!756163 call!64754)))

(declare-fun b!1326720 () Bool)

(assert (=> b!1326720 (= e!756162 (validKeyInArray!0 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun bm!64752 () Bool)

(declare-fun call!64755 () ListLongMap!21205)

(assert (=> bm!64752 (= call!64755 call!64752)))

(declare-fun b!1326721 () Bool)

(declare-fun lt!590347 () Unit!43706)

(assert (=> b!1326721 (= e!756152 lt!590347)))

(declare-fun lt!590361 () ListLongMap!21205)

(assert (=> b!1326721 (= lt!590361 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590348 () (_ BitVec 64))

(assert (=> b!1326721 (= lt!590348 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590346 () (_ BitVec 64))

(assert (=> b!1326721 (= lt!590346 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590363 () Unit!43706)

(assert (=> b!1326721 (= lt!590363 (addStillContains!1163 lt!590361 lt!590348 zeroValue!1279 lt!590346))))

(assert (=> b!1326721 (contains!8775 (+!4639 lt!590361 (tuple2!23549 lt!590348 zeroValue!1279)) lt!590346)))

(declare-fun lt!590362 () Unit!43706)

(assert (=> b!1326721 (= lt!590362 lt!590363)))

(declare-fun lt!590351 () ListLongMap!21205)

(assert (=> b!1326721 (= lt!590351 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590352 () (_ BitVec 64))

(assert (=> b!1326721 (= lt!590352 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590353 () (_ BitVec 64))

(assert (=> b!1326721 (= lt!590353 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590366 () Unit!43706)

(declare-fun addApplyDifferent!572 (ListLongMap!21205 (_ BitVec 64) V!53571 (_ BitVec 64)) Unit!43706)

(assert (=> b!1326721 (= lt!590366 (addApplyDifferent!572 lt!590351 lt!590352 minValue!1279 lt!590353))))

(assert (=> b!1326721 (= (apply!1030 (+!4639 lt!590351 (tuple2!23549 lt!590352 minValue!1279)) lt!590353) (apply!1030 lt!590351 lt!590353))))

(declare-fun lt!590356 () Unit!43706)

(assert (=> b!1326721 (= lt!590356 lt!590366)))

(declare-fun lt!590364 () ListLongMap!21205)

(assert (=> b!1326721 (= lt!590364 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590367 () (_ BitVec 64))

(assert (=> b!1326721 (= lt!590367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590355 () (_ BitVec 64))

(assert (=> b!1326721 (= lt!590355 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590354 () Unit!43706)

(assert (=> b!1326721 (= lt!590354 (addApplyDifferent!572 lt!590364 lt!590367 zeroValue!1279 lt!590355))))

(assert (=> b!1326721 (= (apply!1030 (+!4639 lt!590364 (tuple2!23549 lt!590367 zeroValue!1279)) lt!590355) (apply!1030 lt!590364 lt!590355))))

(declare-fun lt!590359 () Unit!43706)

(assert (=> b!1326721 (= lt!590359 lt!590354)))

(declare-fun lt!590358 () ListLongMap!21205)

(assert (=> b!1326721 (= lt!590358 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590349 () (_ BitVec 64))

(assert (=> b!1326721 (= lt!590349 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590350 () (_ BitVec 64))

(assert (=> b!1326721 (= lt!590350 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(assert (=> b!1326721 (= lt!590347 (addApplyDifferent!572 lt!590358 lt!590349 minValue!1279 lt!590350))))

(assert (=> b!1326721 (= (apply!1030 (+!4639 lt!590358 (tuple2!23549 lt!590349 minValue!1279)) lt!590350) (apply!1030 lt!590358 lt!590350))))

(declare-fun b!1326722 () Bool)

(assert (=> b!1326722 (= e!756160 call!64755)))

(declare-fun bm!64753 () Bool)

(declare-fun c!125779 () Bool)

(assert (=> bm!64753 (= call!64752 (+!4639 (ite c!125779 call!64751 (ite c!125784 call!64753 call!64754)) (ite (or c!125779 c!125784) (tuple2!23549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1326713 () Bool)

(assert (=> b!1326713 (= e!756157 e!756159)))

(declare-fun res!880526 () Bool)

(assert (=> b!1326713 (= res!880526 call!64756)))

(assert (=> b!1326713 (=> (not res!880526) (not e!756159))))

(declare-fun d!143121 () Bool)

(assert (=> d!143121 e!756158))

(declare-fun res!880525 () Bool)

(assert (=> d!143121 (=> (not res!880525) (not e!756158))))

(assert (=> d!143121 (= res!880525 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43828 _keys!1609)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43828 _keys!1609)))))))

(declare-fun lt!590357 () ListLongMap!21205)

(assert (=> d!143121 (= lt!590360 lt!590357)))

(declare-fun lt!590365 () Unit!43706)

(assert (=> d!143121 (= lt!590365 e!756152)))

(declare-fun c!125782 () Bool)

(declare-fun e!756164 () Bool)

(assert (=> d!143121 (= c!125782 e!756164)))

(declare-fun res!880521 () Bool)

(assert (=> d!143121 (=> (not res!880521) (not e!756164))))

(assert (=> d!143121 (= res!880521 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43828 _keys!1609)))))

(assert (=> d!143121 (= lt!590357 e!756156)))

(assert (=> d!143121 (= c!125779 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143121 (validMask!0 mask!2019)))

(assert (=> d!143121 (= (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590360)))

(declare-fun b!1326723 () Bool)

(declare-fun c!125780 () Bool)

(assert (=> b!1326723 (= c!125780 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1326723 (= e!756160 e!756163)))

(declare-fun bm!64754 () Bool)

(assert (=> bm!64754 (= call!64754 call!64753)))

(declare-fun b!1326724 () Bool)

(assert (=> b!1326724 (= e!756164 (validKeyInArray!0 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1326725 () Bool)

(assert (=> b!1326725 (= e!756154 (not call!64757))))

(declare-fun b!1326726 () Bool)

(assert (=> b!1326726 (= e!756157 (not call!64756))))

(declare-fun b!1326727 () Bool)

(assert (=> b!1326727 (= e!756163 call!64755)))

(declare-fun b!1326728 () Bool)

(assert (=> b!1326728 (= e!756153 e!756161)))

(declare-fun res!880523 () Bool)

(assert (=> b!1326728 (=> (not res!880523) (not e!756161))))

(assert (=> b!1326728 (= res!880523 (contains!8775 lt!590360 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1326728 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43828 _keys!1609)))))

(assert (= (and d!143121 c!125779) b!1326715))

(assert (= (and d!143121 (not c!125779)) b!1326710))

(assert (= (and b!1326710 c!125784) b!1326722))

(assert (= (and b!1326710 (not c!125784)) b!1326723))

(assert (= (and b!1326723 c!125780) b!1326727))

(assert (= (and b!1326723 (not c!125780)) b!1326719))

(assert (= (or b!1326727 b!1326719) bm!64754))

(assert (= (or b!1326722 bm!64754) bm!64749))

(assert (= (or b!1326722 b!1326727) bm!64752))

(assert (= (or b!1326715 bm!64749) bm!64748))

(assert (= (or b!1326715 bm!64752) bm!64753))

(assert (= (and d!143121 res!880521) b!1326724))

(assert (= (and d!143121 c!125782) b!1326721))

(assert (= (and d!143121 (not c!125782)) b!1326711))

(assert (= (and d!143121 res!880525) b!1326716))

(assert (= (and b!1326716 res!880519) b!1326720))

(assert (= (and b!1326716 (not res!880527)) b!1326728))

(assert (= (and b!1326728 res!880523) b!1326717))

(assert (= (and b!1326716 res!880520) b!1326712))

(assert (= (and b!1326712 c!125783) b!1326713))

(assert (= (and b!1326712 (not c!125783)) b!1326726))

(assert (= (and b!1326713 res!880526) b!1326714))

(assert (= (or b!1326713 b!1326726) bm!64751))

(assert (= (and b!1326712 res!880524) b!1326718))

(assert (= (and b!1326718 c!125781) b!1326709))

(assert (= (and b!1326718 (not c!125781)) b!1326725))

(assert (= (and b!1326709 res!880522) b!1326708))

(assert (= (or b!1326709 b!1326725) bm!64750))

(declare-fun b_lambda!23815 () Bool)

(assert (=> (not b_lambda!23815) (not b!1326717)))

(assert (=> b!1326717 t!44685))

(declare-fun b_and!49165 () Bool)

(assert (= b_and!49159 (and (=> t!44685 result!24667) b_and!49165)))

(declare-fun m!1215845 () Bool)

(assert (=> bm!64753 m!1215845))

(declare-fun m!1215847 () Bool)

(assert (=> b!1326717 m!1215847))

(declare-fun m!1215849 () Bool)

(assert (=> b!1326717 m!1215849))

(assert (=> b!1326717 m!1215849))

(assert (=> b!1326717 m!1215649))

(declare-fun m!1215851 () Bool)

(assert (=> b!1326717 m!1215851))

(assert (=> b!1326717 m!1215847))

(declare-fun m!1215853 () Bool)

(assert (=> b!1326717 m!1215853))

(assert (=> b!1326717 m!1215649))

(assert (=> b!1326720 m!1215847))

(assert (=> b!1326720 m!1215847))

(declare-fun m!1215855 () Bool)

(assert (=> b!1326720 m!1215855))

(declare-fun m!1215857 () Bool)

(assert (=> bm!64751 m!1215857))

(assert (=> d!143121 m!1215685))

(assert (=> b!1326728 m!1215847))

(assert (=> b!1326728 m!1215847))

(declare-fun m!1215859 () Bool)

(assert (=> b!1326728 m!1215859))

(declare-fun m!1215861 () Bool)

(assert (=> b!1326715 m!1215861))

(declare-fun m!1215863 () Bool)

(assert (=> bm!64750 m!1215863))

(declare-fun m!1215865 () Bool)

(assert (=> b!1326708 m!1215865))

(assert (=> b!1326724 m!1215847))

(assert (=> b!1326724 m!1215847))

(assert (=> b!1326724 m!1215855))

(declare-fun m!1215867 () Bool)

(assert (=> b!1326714 m!1215867))

(assert (=> bm!64748 m!1215647))

(declare-fun m!1215869 () Bool)

(assert (=> b!1326721 m!1215869))

(assert (=> b!1326721 m!1215847))

(declare-fun m!1215871 () Bool)

(assert (=> b!1326721 m!1215871))

(assert (=> b!1326721 m!1215869))

(declare-fun m!1215873 () Bool)

(assert (=> b!1326721 m!1215873))

(declare-fun m!1215875 () Bool)

(assert (=> b!1326721 m!1215875))

(declare-fun m!1215877 () Bool)

(assert (=> b!1326721 m!1215877))

(declare-fun m!1215879 () Bool)

(assert (=> b!1326721 m!1215879))

(declare-fun m!1215881 () Bool)

(assert (=> b!1326721 m!1215881))

(assert (=> b!1326721 m!1215647))

(declare-fun m!1215883 () Bool)

(assert (=> b!1326721 m!1215883))

(assert (=> b!1326721 m!1215881))

(declare-fun m!1215885 () Bool)

(assert (=> b!1326721 m!1215885))

(declare-fun m!1215887 () Bool)

(assert (=> b!1326721 m!1215887))

(declare-fun m!1215889 () Bool)

(assert (=> b!1326721 m!1215889))

(declare-fun m!1215891 () Bool)

(assert (=> b!1326721 m!1215891))

(assert (=> b!1326721 m!1215883))

(declare-fun m!1215893 () Bool)

(assert (=> b!1326721 m!1215893))

(declare-fun m!1215895 () Bool)

(assert (=> b!1326721 m!1215895))

(assert (=> b!1326721 m!1215887))

(declare-fun m!1215897 () Bool)

(assert (=> b!1326721 m!1215897))

(assert (=> b!1326582 d!143121))

(declare-fun d!143123 () Bool)

(declare-fun e!756166 () Bool)

(assert (=> d!143123 e!756166))

(declare-fun res!880528 () Bool)

(assert (=> d!143123 (=> res!880528 e!756166)))

(declare-fun lt!590369 () Bool)

(assert (=> d!143123 (= res!880528 (not lt!590369))))

(declare-fun lt!590370 () Bool)

(assert (=> d!143123 (= lt!590369 lt!590370)))

(declare-fun lt!590368 () Unit!43706)

(declare-fun e!756165 () Unit!43706)

(assert (=> d!143123 (= lt!590368 e!756165)))

(declare-fun c!125785 () Bool)

(assert (=> d!143123 (= c!125785 lt!590370)))

(assert (=> d!143123 (= lt!590370 (containsKey!735 (toList!10618 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (=> d!143123 (= (contains!8775 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164) lt!590369)))

(declare-fun b!1326729 () Bool)

(declare-fun lt!590371 () Unit!43706)

(assert (=> b!1326729 (= e!756165 lt!590371)))

(assert (=> b!1326729 (= lt!590371 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10618 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (=> b!1326729 (isDefined!520 (getValueByKey!713 (toList!10618 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun b!1326730 () Bool)

(declare-fun Unit!43713 () Unit!43706)

(assert (=> b!1326730 (= e!756165 Unit!43713)))

(declare-fun b!1326731 () Bool)

(assert (=> b!1326731 (= e!756166 (isDefined!520 (getValueByKey!713 (toList!10618 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143123 c!125785) b!1326729))

(assert (= (and d!143123 (not c!125785)) b!1326730))

(assert (= (and d!143123 (not res!880528)) b!1326731))

(declare-fun m!1215899 () Bool)

(assert (=> d!143123 m!1215899))

(declare-fun m!1215901 () Bool)

(assert (=> b!1326729 m!1215901))

(declare-fun m!1215903 () Bool)

(assert (=> b!1326729 m!1215903))

(assert (=> b!1326729 m!1215903))

(declare-fun m!1215905 () Bool)

(assert (=> b!1326729 m!1215905))

(assert (=> b!1326731 m!1215903))

(assert (=> b!1326731 m!1215903))

(assert (=> b!1326731 m!1215905))

(assert (=> b!1326582 d!143123))

(declare-fun b!1326756 () Bool)

(declare-fun res!880539 () Bool)

(declare-fun e!756185 () Bool)

(assert (=> b!1326756 (=> (not res!880539) (not e!756185))))

(declare-fun lt!590391 () ListLongMap!21205)

(assert (=> b!1326756 (= res!880539 (not (contains!8775 lt!590391 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1326757 () Bool)

(declare-fun e!756183 () ListLongMap!21205)

(declare-fun call!64760 () ListLongMap!21205)

(assert (=> b!1326757 (= e!756183 call!64760)))

(declare-fun b!1326758 () Bool)

(declare-fun e!756186 () Bool)

(declare-fun e!756187 () Bool)

(assert (=> b!1326758 (= e!756186 e!756187)))

(declare-fun c!125797 () Bool)

(assert (=> b!1326758 (= c!125797 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43828 _keys!1609)))))

(declare-fun bm!64757 () Bool)

(assert (=> bm!64757 (= call!64760 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1326759 () Bool)

(assert (=> b!1326759 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43828 _keys!1609)))))

(assert (=> b!1326759 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43827 _values!1337)))))

(declare-fun e!756181 () Bool)

(assert (=> b!1326759 (= e!756181 (= (apply!1030 lt!590391 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21810 (select (arr!43277 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3578 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326760 () Bool)

(declare-fun e!756184 () ListLongMap!21205)

(assert (=> b!1326760 (= e!756184 e!756183)))

(declare-fun c!125796 () Bool)

(assert (=> b!1326760 (= c!125796 (validKeyInArray!0 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1326761 () Bool)

(declare-fun e!756182 () Bool)

(assert (=> b!1326761 (= e!756182 (validKeyInArray!0 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1326761 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))

(declare-fun b!1326762 () Bool)

(assert (=> b!1326762 (= e!756186 e!756181)))

(assert (=> b!1326762 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43828 _keys!1609)))))

(declare-fun res!880538 () Bool)

(assert (=> b!1326762 (= res!880538 (contains!8775 lt!590391 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1326762 (=> (not res!880538) (not e!756181))))

(declare-fun b!1326763 () Bool)

(assert (=> b!1326763 (= e!756185 e!756186)))

(declare-fun c!125795 () Bool)

(assert (=> b!1326763 (= c!125795 e!756182)))

(declare-fun res!880540 () Bool)

(assert (=> b!1326763 (=> (not res!880540) (not e!756182))))

(assert (=> b!1326763 (= res!880540 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43828 _keys!1609)))))

(declare-fun b!1326764 () Bool)

(assert (=> b!1326764 (= e!756184 (ListLongMap!21206 Nil!30681))))

(declare-fun b!1326765 () Bool)

(declare-fun isEmpty!1078 (ListLongMap!21205) Bool)

(assert (=> b!1326765 (= e!756187 (isEmpty!1078 lt!590391))))

(declare-fun b!1326766 () Bool)

(declare-fun lt!590387 () Unit!43706)

(declare-fun lt!590388 () Unit!43706)

(assert (=> b!1326766 (= lt!590387 lt!590388)))

(declare-fun lt!590390 () V!53571)

(declare-fun lt!590389 () (_ BitVec 64))

(declare-fun lt!590392 () ListLongMap!21205)

(declare-fun lt!590386 () (_ BitVec 64))

(assert (=> b!1326766 (not (contains!8775 (+!4639 lt!590392 (tuple2!23549 lt!590389 lt!590390)) lt!590386))))

(declare-fun addStillNotContains!494 (ListLongMap!21205 (_ BitVec 64) V!53571 (_ BitVec 64)) Unit!43706)

(assert (=> b!1326766 (= lt!590388 (addStillNotContains!494 lt!590392 lt!590389 lt!590390 lt!590386))))

(assert (=> b!1326766 (= lt!590386 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1326766 (= lt!590390 (get!21810 (select (arr!43277 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3578 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1326766 (= lt!590389 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(assert (=> b!1326766 (= lt!590392 call!64760)))

(assert (=> b!1326766 (= e!756183 (+!4639 call!64760 (tuple2!23549 (select (arr!43278 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21810 (select (arr!43277 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3578 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326767 () Bool)

(assert (=> b!1326767 (= e!756187 (= lt!590391 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun d!143125 () Bool)

(assert (=> d!143125 e!756185))

(declare-fun res!880537 () Bool)

(assert (=> d!143125 (=> (not res!880537) (not e!756185))))

(assert (=> d!143125 (= res!880537 (not (contains!8775 lt!590391 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143125 (= lt!590391 e!756184)))

(declare-fun c!125794 () Bool)

(assert (=> d!143125 (= c!125794 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43828 _keys!1609)))))

(assert (=> d!143125 (validMask!0 mask!2019)))

(assert (=> d!143125 (= (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590391)))

(assert (= (and d!143125 c!125794) b!1326764))

(assert (= (and d!143125 (not c!125794)) b!1326760))

(assert (= (and b!1326760 c!125796) b!1326766))

(assert (= (and b!1326760 (not c!125796)) b!1326757))

(assert (= (or b!1326766 b!1326757) bm!64757))

(assert (= (and d!143125 res!880537) b!1326756))

(assert (= (and b!1326756 res!880539) b!1326763))

(assert (= (and b!1326763 res!880540) b!1326761))

(assert (= (and b!1326763 c!125795) b!1326762))

(assert (= (and b!1326763 (not c!125795)) b!1326758))

(assert (= (and b!1326762 res!880538) b!1326759))

(assert (= (and b!1326758 c!125797) b!1326767))

(assert (= (and b!1326758 (not c!125797)) b!1326765))

(declare-fun b_lambda!23817 () Bool)

(assert (=> (not b_lambda!23817) (not b!1326759)))

(assert (=> b!1326759 t!44685))

(declare-fun b_and!49167 () Bool)

(assert (= b_and!49165 (and (=> t!44685 result!24667) b_and!49167)))

(declare-fun b_lambda!23819 () Bool)

(assert (=> (not b_lambda!23819) (not b!1326766)))

(assert (=> b!1326766 t!44685))

(declare-fun b_and!49169 () Bool)

(assert (= b_and!49167 (and (=> t!44685 result!24667) b_and!49169)))

(assert (=> b!1326759 m!1215849))

(assert (=> b!1326759 m!1215649))

(assert (=> b!1326759 m!1215851))

(assert (=> b!1326759 m!1215649))

(assert (=> b!1326759 m!1215849))

(assert (=> b!1326759 m!1215847))

(declare-fun m!1215907 () Bool)

(assert (=> b!1326759 m!1215907))

(assert (=> b!1326759 m!1215847))

(declare-fun m!1215909 () Bool)

(assert (=> b!1326767 m!1215909))

(declare-fun m!1215911 () Bool)

(assert (=> b!1326766 m!1215911))

(declare-fun m!1215913 () Bool)

(assert (=> b!1326766 m!1215913))

(assert (=> b!1326766 m!1215849))

(assert (=> b!1326766 m!1215649))

(assert (=> b!1326766 m!1215851))

(declare-fun m!1215915 () Bool)

(assert (=> b!1326766 m!1215915))

(assert (=> b!1326766 m!1215911))

(assert (=> b!1326766 m!1215649))

(assert (=> b!1326766 m!1215849))

(declare-fun m!1215917 () Bool)

(assert (=> b!1326766 m!1215917))

(assert (=> b!1326766 m!1215847))

(assert (=> b!1326762 m!1215847))

(assert (=> b!1326762 m!1215847))

(declare-fun m!1215919 () Bool)

(assert (=> b!1326762 m!1215919))

(assert (=> bm!64757 m!1215909))

(declare-fun m!1215921 () Bool)

(assert (=> b!1326765 m!1215921))

(declare-fun m!1215923 () Bool)

(assert (=> d!143125 m!1215923))

(assert (=> d!143125 m!1215685))

(assert (=> b!1326760 m!1215847))

(assert (=> b!1326760 m!1215847))

(assert (=> b!1326760 m!1215855))

(assert (=> b!1326761 m!1215847))

(assert (=> b!1326761 m!1215847))

(assert (=> b!1326761 m!1215855))

(declare-fun m!1215925 () Bool)

(assert (=> b!1326756 m!1215925))

(assert (=> b!1326582 d!143125))

(declare-fun d!143127 () Bool)

(declare-fun e!756188 () Bool)

(assert (=> d!143127 e!756188))

(declare-fun res!880541 () Bool)

(assert (=> d!143127 (=> (not res!880541) (not e!756188))))

(declare-fun lt!590394 () ListLongMap!21205)

(assert (=> d!143127 (= res!880541 (contains!8775 lt!590394 (_1!11785 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!590396 () List!30684)

(assert (=> d!143127 (= lt!590394 (ListLongMap!21206 lt!590396))))

(declare-fun lt!590393 () Unit!43706)

(declare-fun lt!590395 () Unit!43706)

(assert (=> d!143127 (= lt!590393 lt!590395)))

(assert (=> d!143127 (= (getValueByKey!713 lt!590396 (_1!11785 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!764 (_2!11785 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143127 (= lt!590395 (lemmaContainsTupThenGetReturnValue!358 lt!590396 (_1!11785 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11785 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143127 (= lt!590396 (insertStrictlySorted!487 (toList!10618 lt!590209) (_1!11785 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11785 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143127 (= (+!4639 lt!590209 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!590394)))

(declare-fun b!1326768 () Bool)

(declare-fun res!880542 () Bool)

(assert (=> b!1326768 (=> (not res!880542) (not e!756188))))

(assert (=> b!1326768 (= res!880542 (= (getValueByKey!713 (toList!10618 lt!590394) (_1!11785 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!764 (_2!11785 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1326769 () Bool)

(assert (=> b!1326769 (= e!756188 (contains!8776 (toList!10618 lt!590394) (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!143127 res!880541) b!1326768))

(assert (= (and b!1326768 res!880542) b!1326769))

(declare-fun m!1215927 () Bool)

(assert (=> d!143127 m!1215927))

(declare-fun m!1215929 () Bool)

(assert (=> d!143127 m!1215929))

(declare-fun m!1215931 () Bool)

(assert (=> d!143127 m!1215931))

(declare-fun m!1215933 () Bool)

(assert (=> d!143127 m!1215933))

(declare-fun m!1215935 () Bool)

(assert (=> b!1326768 m!1215935))

(declare-fun m!1215937 () Bool)

(assert (=> b!1326769 m!1215937))

(assert (=> b!1326582 d!143127))

(declare-fun d!143129 () Bool)

(declare-fun e!756190 () Bool)

(assert (=> d!143129 e!756190))

(declare-fun res!880543 () Bool)

(assert (=> d!143129 (=> res!880543 e!756190)))

(declare-fun lt!590398 () Bool)

(assert (=> d!143129 (= res!880543 (not lt!590398))))

(declare-fun lt!590399 () Bool)

(assert (=> d!143129 (= lt!590398 lt!590399)))

(declare-fun lt!590397 () Unit!43706)

(declare-fun e!756189 () Unit!43706)

(assert (=> d!143129 (= lt!590397 e!756189)))

(declare-fun c!125798 () Bool)

(assert (=> d!143129 (= c!125798 lt!590399)))

(assert (=> d!143129 (= lt!590399 (containsKey!735 (toList!10618 (+!4639 lt!590209 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (=> d!143129 (= (contains!8775 (+!4639 lt!590209 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164) lt!590398)))

(declare-fun b!1326770 () Bool)

(declare-fun lt!590400 () Unit!43706)

(assert (=> b!1326770 (= e!756189 lt!590400)))

(assert (=> b!1326770 (= lt!590400 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10618 (+!4639 lt!590209 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (=> b!1326770 (isDefined!520 (getValueByKey!713 (toList!10618 (+!4639 lt!590209 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun b!1326771 () Bool)

(declare-fun Unit!43714 () Unit!43706)

(assert (=> b!1326771 (= e!756189 Unit!43714)))

(declare-fun b!1326772 () Bool)

(assert (=> b!1326772 (= e!756190 (isDefined!520 (getValueByKey!713 (toList!10618 (+!4639 lt!590209 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164)))))

(assert (= (and d!143129 c!125798) b!1326770))

(assert (= (and d!143129 (not c!125798)) b!1326771))

(assert (= (and d!143129 (not res!880543)) b!1326772))

(declare-fun m!1215939 () Bool)

(assert (=> d!143129 m!1215939))

(declare-fun m!1215941 () Bool)

(assert (=> b!1326770 m!1215941))

(declare-fun m!1215943 () Bool)

(assert (=> b!1326770 m!1215943))

(assert (=> b!1326770 m!1215943))

(declare-fun m!1215945 () Bool)

(assert (=> b!1326770 m!1215945))

(assert (=> b!1326772 m!1215943))

(assert (=> b!1326772 m!1215943))

(assert (=> b!1326772 m!1215945))

(assert (=> b!1326582 d!143129))

(declare-fun d!143131 () Bool)

(assert (=> d!143131 (contains!8775 (+!4639 lt!590209 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-fun lt!590401 () Unit!43706)

(assert (=> d!143131 (= lt!590401 (choose!1950 lt!590209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> d!143131 (contains!8775 lt!590209 k0!1164)))

(assert (=> d!143131 (= (addStillContains!1163 lt!590209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164) lt!590401)))

(declare-fun bs!37950 () Bool)

(assert (= bs!37950 d!143131))

(assert (=> bs!37950 m!1215655))

(assert (=> bs!37950 m!1215655))

(assert (=> bs!37950 m!1215667))

(declare-fun m!1215947 () Bool)

(assert (=> bs!37950 m!1215947))

(assert (=> bs!37950 m!1215677))

(assert (=> b!1326582 d!143131))

(declare-fun d!143133 () Bool)

(declare-fun e!756191 () Bool)

(assert (=> d!143133 e!756191))

(declare-fun res!880544 () Bool)

(assert (=> d!143133 (=> (not res!880544) (not e!756191))))

(declare-fun lt!590403 () ListLongMap!21205)

(assert (=> d!143133 (= res!880544 (contains!8775 lt!590403 (_1!11785 lt!590202)))))

(declare-fun lt!590405 () List!30684)

(assert (=> d!143133 (= lt!590403 (ListLongMap!21206 lt!590405))))

(declare-fun lt!590402 () Unit!43706)

(declare-fun lt!590404 () Unit!43706)

(assert (=> d!143133 (= lt!590402 lt!590404)))

(assert (=> d!143133 (= (getValueByKey!713 lt!590405 (_1!11785 lt!590202)) (Some!764 (_2!11785 lt!590202)))))

(assert (=> d!143133 (= lt!590404 (lemmaContainsTupThenGetReturnValue!358 lt!590405 (_1!11785 lt!590202) (_2!11785 lt!590202)))))

(assert (=> d!143133 (= lt!590405 (insertStrictlySorted!487 (toList!10618 lt!590207) (_1!11785 lt!590202) (_2!11785 lt!590202)))))

(assert (=> d!143133 (= (+!4639 lt!590207 lt!590202) lt!590403)))

(declare-fun b!1326773 () Bool)

(declare-fun res!880545 () Bool)

(assert (=> b!1326773 (=> (not res!880545) (not e!756191))))

(assert (=> b!1326773 (= res!880545 (= (getValueByKey!713 (toList!10618 lt!590403) (_1!11785 lt!590202)) (Some!764 (_2!11785 lt!590202))))))

(declare-fun b!1326774 () Bool)

(assert (=> b!1326774 (= e!756191 (contains!8776 (toList!10618 lt!590403) lt!590202))))

(assert (= (and d!143133 res!880544) b!1326773))

(assert (= (and b!1326773 res!880545) b!1326774))

(declare-fun m!1215949 () Bool)

(assert (=> d!143133 m!1215949))

(declare-fun m!1215951 () Bool)

(assert (=> d!143133 m!1215951))

(declare-fun m!1215953 () Bool)

(assert (=> d!143133 m!1215953))

(declare-fun m!1215955 () Bool)

(assert (=> d!143133 m!1215955))

(declare-fun m!1215957 () Bool)

(assert (=> b!1326773 m!1215957))

(declare-fun m!1215959 () Bool)

(assert (=> b!1326774 m!1215959))

(assert (=> b!1326582 d!143133))

(declare-fun d!143135 () Bool)

(declare-fun e!756193 () Bool)

(assert (=> d!143135 e!756193))

(declare-fun res!880546 () Bool)

(assert (=> d!143135 (=> res!880546 e!756193)))

(declare-fun lt!590407 () Bool)

(assert (=> d!143135 (= res!880546 (not lt!590407))))

(declare-fun lt!590408 () Bool)

(assert (=> d!143135 (= lt!590407 lt!590408)))

(declare-fun lt!590406 () Unit!43706)

(declare-fun e!756192 () Unit!43706)

(assert (=> d!143135 (= lt!590406 e!756192)))

(declare-fun c!125799 () Bool)

(assert (=> d!143135 (= c!125799 lt!590408)))

(assert (=> d!143135 (= lt!590408 (containsKey!735 (toList!10618 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> d!143135 (= (contains!8775 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164) lt!590407)))

(declare-fun b!1326775 () Bool)

(declare-fun lt!590409 () Unit!43706)

(assert (=> b!1326775 (= e!756192 lt!590409)))

(assert (=> b!1326775 (= lt!590409 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10618 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> b!1326775 (isDefined!520 (getValueByKey!713 (toList!10618 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun b!1326776 () Bool)

(declare-fun Unit!43715 () Unit!43706)

(assert (=> b!1326776 (= e!756192 Unit!43715)))

(declare-fun b!1326777 () Bool)

(assert (=> b!1326777 (= e!756193 (isDefined!520 (getValueByKey!713 (toList!10618 (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143135 c!125799) b!1326775))

(assert (= (and d!143135 (not c!125799)) b!1326776))

(assert (= (and d!143135 (not res!880546)) b!1326777))

(declare-fun m!1215961 () Bool)

(assert (=> d!143135 m!1215961))

(declare-fun m!1215963 () Bool)

(assert (=> b!1326775 m!1215963))

(declare-fun m!1215965 () Bool)

(assert (=> b!1326775 m!1215965))

(assert (=> b!1326775 m!1215965))

(declare-fun m!1215967 () Bool)

(assert (=> b!1326775 m!1215967))

(assert (=> b!1326777 m!1215965))

(assert (=> b!1326777 m!1215965))

(assert (=> b!1326777 m!1215967))

(assert (=> b!1326577 d!143135))

(declare-fun b!1326778 () Bool)

(declare-fun e!756197 () Bool)

(declare-fun lt!590424 () ListLongMap!21205)

(assert (=> b!1326778 (= e!756197 (= (apply!1030 lt!590424 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1326779 () Bool)

(declare-fun e!756196 () Bool)

(assert (=> b!1326779 (= e!756196 e!756197)))

(declare-fun res!880550 () Bool)

(declare-fun call!64767 () Bool)

(assert (=> b!1326779 (= res!880550 call!64767)))

(assert (=> b!1326779 (=> (not res!880550) (not e!756197))))

(declare-fun call!64761 () ListLongMap!21205)

(declare-fun bm!64758 () Bool)

(assert (=> bm!64758 (= call!64761 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun b!1326780 () Bool)

(declare-fun e!756198 () ListLongMap!21205)

(declare-fun e!756202 () ListLongMap!21205)

(assert (=> b!1326780 (= e!756198 e!756202)))

(declare-fun c!125805 () Bool)

(assert (=> b!1326780 (= c!125805 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1326781 () Bool)

(declare-fun e!756194 () Unit!43706)

(declare-fun Unit!43716 () Unit!43706)

(assert (=> b!1326781 (= e!756194 Unit!43716)))

(declare-fun bm!64759 () Bool)

(declare-fun call!64763 () ListLongMap!21205)

(assert (=> bm!64759 (= call!64763 call!64761)))

(declare-fun b!1326782 () Bool)

(declare-fun res!880552 () Bool)

(declare-fun e!756200 () Bool)

(assert (=> b!1326782 (=> (not res!880552) (not e!756200))))

(declare-fun e!756199 () Bool)

(assert (=> b!1326782 (= res!880552 e!756199)))

(declare-fun c!125804 () Bool)

(assert (=> b!1326782 (= c!125804 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64760 () Bool)

(assert (=> bm!64760 (= call!64767 (contains!8775 lt!590424 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326784 () Bool)

(declare-fun e!756201 () Bool)

(assert (=> b!1326784 (= e!756201 (= (apply!1030 lt!590424 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1326785 () Bool)

(declare-fun call!64762 () ListLongMap!21205)

(assert (=> b!1326785 (= e!756198 (+!4639 call!64762 (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun b!1326786 () Bool)

(declare-fun res!880548 () Bool)

(assert (=> b!1326786 (=> (not res!880548) (not e!756200))))

(declare-fun e!756195 () Bool)

(assert (=> b!1326786 (= res!880548 e!756195)))

(declare-fun res!880555 () Bool)

(assert (=> b!1326786 (=> res!880555 e!756195)))

(declare-fun e!756204 () Bool)

(assert (=> b!1326786 (= res!880555 (not e!756204))))

(declare-fun res!880547 () Bool)

(assert (=> b!1326786 (=> (not res!880547) (not e!756204))))

(assert (=> b!1326786 (= res!880547 (bvslt from!2000 (size!43828 _keys!1609)))))

(declare-fun e!756203 () Bool)

(declare-fun b!1326787 () Bool)

(assert (=> b!1326787 (= e!756203 (= (apply!1030 lt!590424 (select (arr!43278 _keys!1609) from!2000)) (get!21810 (select (arr!43277 _values!1337) from!2000) (dynLambda!3578 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326787 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43827 _values!1337)))))

(assert (=> b!1326787 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43828 _keys!1609)))))

(declare-fun b!1326788 () Bool)

(assert (=> b!1326788 (= e!756200 e!756196)))

(declare-fun c!125802 () Bool)

(assert (=> b!1326788 (= c!125802 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64761 () Bool)

(declare-fun call!64766 () Bool)

(assert (=> bm!64761 (= call!64766 (contains!8775 lt!590424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326789 () Bool)

(declare-fun e!756205 () ListLongMap!21205)

(declare-fun call!64764 () ListLongMap!21205)

(assert (=> b!1326789 (= e!756205 call!64764)))

(declare-fun b!1326790 () Bool)

(assert (=> b!1326790 (= e!756204 (validKeyInArray!0 (select (arr!43278 _keys!1609) from!2000)))))

(declare-fun bm!64762 () Bool)

(declare-fun call!64765 () ListLongMap!21205)

(assert (=> bm!64762 (= call!64765 call!64762)))

(declare-fun b!1326791 () Bool)

(declare-fun lt!590411 () Unit!43706)

(assert (=> b!1326791 (= e!756194 lt!590411)))

(declare-fun lt!590425 () ListLongMap!21205)

(assert (=> b!1326791 (= lt!590425 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590412 () (_ BitVec 64))

(assert (=> b!1326791 (= lt!590412 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590410 () (_ BitVec 64))

(assert (=> b!1326791 (= lt!590410 (select (arr!43278 _keys!1609) from!2000))))

(declare-fun lt!590427 () Unit!43706)

(assert (=> b!1326791 (= lt!590427 (addStillContains!1163 lt!590425 lt!590412 zeroValue!1279 lt!590410))))

(assert (=> b!1326791 (contains!8775 (+!4639 lt!590425 (tuple2!23549 lt!590412 zeroValue!1279)) lt!590410)))

(declare-fun lt!590426 () Unit!43706)

(assert (=> b!1326791 (= lt!590426 lt!590427)))

(declare-fun lt!590415 () ListLongMap!21205)

(assert (=> b!1326791 (= lt!590415 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590416 () (_ BitVec 64))

(assert (=> b!1326791 (= lt!590416 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590417 () (_ BitVec 64))

(assert (=> b!1326791 (= lt!590417 (select (arr!43278 _keys!1609) from!2000))))

(declare-fun lt!590430 () Unit!43706)

(assert (=> b!1326791 (= lt!590430 (addApplyDifferent!572 lt!590415 lt!590416 minValue!1279 lt!590417))))

(assert (=> b!1326791 (= (apply!1030 (+!4639 lt!590415 (tuple2!23549 lt!590416 minValue!1279)) lt!590417) (apply!1030 lt!590415 lt!590417))))

(declare-fun lt!590420 () Unit!43706)

(assert (=> b!1326791 (= lt!590420 lt!590430)))

(declare-fun lt!590428 () ListLongMap!21205)

(assert (=> b!1326791 (= lt!590428 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590431 () (_ BitVec 64))

(assert (=> b!1326791 (= lt!590431 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590419 () (_ BitVec 64))

(assert (=> b!1326791 (= lt!590419 (select (arr!43278 _keys!1609) from!2000))))

(declare-fun lt!590418 () Unit!43706)

(assert (=> b!1326791 (= lt!590418 (addApplyDifferent!572 lt!590428 lt!590431 zeroValue!1279 lt!590419))))

(assert (=> b!1326791 (= (apply!1030 (+!4639 lt!590428 (tuple2!23549 lt!590431 zeroValue!1279)) lt!590419) (apply!1030 lt!590428 lt!590419))))

(declare-fun lt!590423 () Unit!43706)

(assert (=> b!1326791 (= lt!590423 lt!590418)))

(declare-fun lt!590422 () ListLongMap!21205)

(assert (=> b!1326791 (= lt!590422 (getCurrentListMapNoExtraKeys!6277 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590413 () (_ BitVec 64))

(assert (=> b!1326791 (= lt!590413 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590414 () (_ BitVec 64))

(assert (=> b!1326791 (= lt!590414 (select (arr!43278 _keys!1609) from!2000))))

(assert (=> b!1326791 (= lt!590411 (addApplyDifferent!572 lt!590422 lt!590413 minValue!1279 lt!590414))))

(assert (=> b!1326791 (= (apply!1030 (+!4639 lt!590422 (tuple2!23549 lt!590413 minValue!1279)) lt!590414) (apply!1030 lt!590422 lt!590414))))

(declare-fun b!1326792 () Bool)

(assert (=> b!1326792 (= e!756202 call!64765)))

(declare-fun c!125800 () Bool)

(declare-fun bm!64763 () Bool)

(assert (=> bm!64763 (= call!64762 (+!4639 (ite c!125800 call!64761 (ite c!125805 call!64763 call!64764)) (ite (or c!125800 c!125805) (tuple2!23549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1326783 () Bool)

(assert (=> b!1326783 (= e!756199 e!756201)))

(declare-fun res!880554 () Bool)

(assert (=> b!1326783 (= res!880554 call!64766)))

(assert (=> b!1326783 (=> (not res!880554) (not e!756201))))

(declare-fun d!143137 () Bool)

(assert (=> d!143137 e!756200))

(declare-fun res!880553 () Bool)

(assert (=> d!143137 (=> (not res!880553) (not e!756200))))

(assert (=> d!143137 (= res!880553 (or (bvsge from!2000 (size!43828 _keys!1609)) (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43828 _keys!1609)))))))

(declare-fun lt!590421 () ListLongMap!21205)

(assert (=> d!143137 (= lt!590424 lt!590421)))

(declare-fun lt!590429 () Unit!43706)

(assert (=> d!143137 (= lt!590429 e!756194)))

(declare-fun c!125803 () Bool)

(declare-fun e!756206 () Bool)

(assert (=> d!143137 (= c!125803 e!756206)))

(declare-fun res!880549 () Bool)

(assert (=> d!143137 (=> (not res!880549) (not e!756206))))

(assert (=> d!143137 (= res!880549 (bvslt from!2000 (size!43828 _keys!1609)))))

(assert (=> d!143137 (= lt!590421 e!756198)))

(assert (=> d!143137 (= c!125800 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143137 (validMask!0 mask!2019)))

(assert (=> d!143137 (= (getCurrentListMap!5609 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!590424)))

(declare-fun b!1326793 () Bool)

(declare-fun c!125801 () Bool)

(assert (=> b!1326793 (= c!125801 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1326793 (= e!756202 e!756205)))

(declare-fun bm!64764 () Bool)

(assert (=> bm!64764 (= call!64764 call!64763)))

(declare-fun b!1326794 () Bool)

(assert (=> b!1326794 (= e!756206 (validKeyInArray!0 (select (arr!43278 _keys!1609) from!2000)))))

(declare-fun b!1326795 () Bool)

(assert (=> b!1326795 (= e!756196 (not call!64767))))

(declare-fun b!1326796 () Bool)

(assert (=> b!1326796 (= e!756199 (not call!64766))))

(declare-fun b!1326797 () Bool)

(assert (=> b!1326797 (= e!756205 call!64765)))

(declare-fun b!1326798 () Bool)

(assert (=> b!1326798 (= e!756195 e!756203)))

(declare-fun res!880551 () Bool)

(assert (=> b!1326798 (=> (not res!880551) (not e!756203))))

(assert (=> b!1326798 (= res!880551 (contains!8775 lt!590424 (select (arr!43278 _keys!1609) from!2000)))))

(assert (=> b!1326798 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43828 _keys!1609)))))

(assert (= (and d!143137 c!125800) b!1326785))

(assert (= (and d!143137 (not c!125800)) b!1326780))

(assert (= (and b!1326780 c!125805) b!1326792))

(assert (= (and b!1326780 (not c!125805)) b!1326793))

(assert (= (and b!1326793 c!125801) b!1326797))

(assert (= (and b!1326793 (not c!125801)) b!1326789))

(assert (= (or b!1326797 b!1326789) bm!64764))

(assert (= (or b!1326792 bm!64764) bm!64759))

(assert (= (or b!1326792 b!1326797) bm!64762))

(assert (= (or b!1326785 bm!64759) bm!64758))

(assert (= (or b!1326785 bm!64762) bm!64763))

(assert (= (and d!143137 res!880549) b!1326794))

(assert (= (and d!143137 c!125803) b!1326791))

(assert (= (and d!143137 (not c!125803)) b!1326781))

(assert (= (and d!143137 res!880553) b!1326786))

(assert (= (and b!1326786 res!880547) b!1326790))

(assert (= (and b!1326786 (not res!880555)) b!1326798))

(assert (= (and b!1326798 res!880551) b!1326787))

(assert (= (and b!1326786 res!880548) b!1326782))

(assert (= (and b!1326782 c!125804) b!1326783))

(assert (= (and b!1326782 (not c!125804)) b!1326796))

(assert (= (and b!1326783 res!880554) b!1326784))

(assert (= (or b!1326783 b!1326796) bm!64761))

(assert (= (and b!1326782 res!880552) b!1326788))

(assert (= (and b!1326788 c!125802) b!1326779))

(assert (= (and b!1326788 (not c!125802)) b!1326795))

(assert (= (and b!1326779 res!880550) b!1326778))

(assert (= (or b!1326779 b!1326795) bm!64760))

(declare-fun b_lambda!23821 () Bool)

(assert (=> (not b_lambda!23821) (not b!1326787)))

(assert (=> b!1326787 t!44685))

(declare-fun b_and!49171 () Bool)

(assert (= b_and!49169 (and (=> t!44685 result!24667) b_and!49171)))

(declare-fun m!1215969 () Bool)

(assert (=> bm!64763 m!1215969))

(assert (=> b!1326787 m!1215633))

(assert (=> b!1326787 m!1215659))

(assert (=> b!1326787 m!1215659))

(assert (=> b!1326787 m!1215649))

(assert (=> b!1326787 m!1215663))

(assert (=> b!1326787 m!1215633))

(declare-fun m!1215971 () Bool)

(assert (=> b!1326787 m!1215971))

(assert (=> b!1326787 m!1215649))

(assert (=> b!1326790 m!1215633))

(assert (=> b!1326790 m!1215633))

(assert (=> b!1326790 m!1215635))

(declare-fun m!1215973 () Bool)

(assert (=> bm!64761 m!1215973))

(assert (=> d!143137 m!1215685))

(assert (=> b!1326798 m!1215633))

(assert (=> b!1326798 m!1215633))

(declare-fun m!1215975 () Bool)

(assert (=> b!1326798 m!1215975))

(declare-fun m!1215977 () Bool)

(assert (=> b!1326785 m!1215977))

(declare-fun m!1215979 () Bool)

(assert (=> bm!64760 m!1215979))

(declare-fun m!1215981 () Bool)

(assert (=> b!1326778 m!1215981))

(assert (=> b!1326794 m!1215633))

(assert (=> b!1326794 m!1215633))

(assert (=> b!1326794 m!1215635))

(declare-fun m!1215983 () Bool)

(assert (=> b!1326784 m!1215983))

(declare-fun m!1215985 () Bool)

(assert (=> bm!64758 m!1215985))

(declare-fun m!1215987 () Bool)

(assert (=> b!1326791 m!1215987))

(assert (=> b!1326791 m!1215633))

(declare-fun m!1215989 () Bool)

(assert (=> b!1326791 m!1215989))

(assert (=> b!1326791 m!1215987))

(declare-fun m!1215991 () Bool)

(assert (=> b!1326791 m!1215991))

(declare-fun m!1215993 () Bool)

(assert (=> b!1326791 m!1215993))

(declare-fun m!1215995 () Bool)

(assert (=> b!1326791 m!1215995))

(declare-fun m!1215997 () Bool)

(assert (=> b!1326791 m!1215997))

(declare-fun m!1215999 () Bool)

(assert (=> b!1326791 m!1215999))

(assert (=> b!1326791 m!1215985))

(declare-fun m!1216001 () Bool)

(assert (=> b!1326791 m!1216001))

(assert (=> b!1326791 m!1215999))

(declare-fun m!1216003 () Bool)

(assert (=> b!1326791 m!1216003))

(declare-fun m!1216005 () Bool)

(assert (=> b!1326791 m!1216005))

(declare-fun m!1216007 () Bool)

(assert (=> b!1326791 m!1216007))

(declare-fun m!1216009 () Bool)

(assert (=> b!1326791 m!1216009))

(assert (=> b!1326791 m!1216001))

(declare-fun m!1216011 () Bool)

(assert (=> b!1326791 m!1216011))

(declare-fun m!1216013 () Bool)

(assert (=> b!1326791 m!1216013))

(assert (=> b!1326791 m!1216005))

(declare-fun m!1216015 () Bool)

(assert (=> b!1326791 m!1216015))

(assert (=> b!1326577 d!143137))

(declare-fun b!1326809 () Bool)

(declare-fun e!756217 () Bool)

(declare-fun contains!8777 (List!30685 (_ BitVec 64)) Bool)

(assert (=> b!1326809 (= e!756217 (contains!8777 Nil!30682 (select (arr!43278 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326811 () Bool)

(declare-fun e!756218 () Bool)

(declare-fun e!756216 () Bool)

(assert (=> b!1326811 (= e!756218 e!756216)))

(declare-fun c!125808 () Bool)

(assert (=> b!1326811 (= c!125808 (validKeyInArray!0 (select (arr!43278 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326812 () Bool)

(declare-fun call!64770 () Bool)

(assert (=> b!1326812 (= e!756216 call!64770)))

(declare-fun b!1326813 () Bool)

(assert (=> b!1326813 (= e!756216 call!64770)))

(declare-fun bm!64767 () Bool)

(assert (=> bm!64767 (= call!64770 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125808 (Cons!30681 (select (arr!43278 _keys!1609) #b00000000000000000000000000000000) Nil!30682) Nil!30682)))))

(declare-fun b!1326810 () Bool)

(declare-fun e!756215 () Bool)

(assert (=> b!1326810 (= e!756215 e!756218)))

(declare-fun res!880562 () Bool)

(assert (=> b!1326810 (=> (not res!880562) (not e!756218))))

(assert (=> b!1326810 (= res!880562 (not e!756217))))

(declare-fun res!880563 () Bool)

(assert (=> b!1326810 (=> (not res!880563) (not e!756217))))

(assert (=> b!1326810 (= res!880563 (validKeyInArray!0 (select (arr!43278 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!143139 () Bool)

(declare-fun res!880564 () Bool)

(assert (=> d!143139 (=> res!880564 e!756215)))

(assert (=> d!143139 (= res!880564 (bvsge #b00000000000000000000000000000000 (size!43828 _keys!1609)))))

(assert (=> d!143139 (= (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30682) e!756215)))

(assert (= (and d!143139 (not res!880564)) b!1326810))

(assert (= (and b!1326810 res!880563) b!1326809))

(assert (= (and b!1326810 res!880562) b!1326811))

(assert (= (and b!1326811 c!125808) b!1326812))

(assert (= (and b!1326811 (not c!125808)) b!1326813))

(assert (= (or b!1326812 b!1326813) bm!64767))

(assert (=> b!1326809 m!1215751))

(assert (=> b!1326809 m!1215751))

(declare-fun m!1216017 () Bool)

(assert (=> b!1326809 m!1216017))

(assert (=> b!1326811 m!1215751))

(assert (=> b!1326811 m!1215751))

(assert (=> b!1326811 m!1215753))

(assert (=> bm!64767 m!1215751))

(declare-fun m!1216019 () Bool)

(assert (=> bm!64767 m!1216019))

(assert (=> b!1326810 m!1215751))

(assert (=> b!1326810 m!1215751))

(assert (=> b!1326810 m!1215753))

(assert (=> b!1326578 d!143139))

(declare-fun b!1326821 () Bool)

(declare-fun e!756223 () Bool)

(assert (=> b!1326821 (= e!756223 tp_is_empty!36351)))

(declare-fun mapNonEmpty!56184 () Bool)

(declare-fun mapRes!56184 () Bool)

(declare-fun tp!107082 () Bool)

(declare-fun e!756224 () Bool)

(assert (=> mapNonEmpty!56184 (= mapRes!56184 (and tp!107082 e!756224))))

(declare-fun mapRest!56184 () (Array (_ BitVec 32) ValueCell!17277))

(declare-fun mapValue!56184 () ValueCell!17277)

(declare-fun mapKey!56184 () (_ BitVec 32))

(assert (=> mapNonEmpty!56184 (= mapRest!56178 (store mapRest!56184 mapKey!56184 mapValue!56184))))

(declare-fun condMapEmpty!56184 () Bool)

(declare-fun mapDefault!56184 () ValueCell!17277)

(assert (=> mapNonEmpty!56178 (= condMapEmpty!56184 (= mapRest!56178 ((as const (Array (_ BitVec 32) ValueCell!17277)) mapDefault!56184)))))

(assert (=> mapNonEmpty!56178 (= tp!107073 (and e!756223 mapRes!56184))))

(declare-fun b!1326820 () Bool)

(assert (=> b!1326820 (= e!756224 tp_is_empty!36351)))

(declare-fun mapIsEmpty!56184 () Bool)

(assert (=> mapIsEmpty!56184 mapRes!56184))

(assert (= (and mapNonEmpty!56178 condMapEmpty!56184) mapIsEmpty!56184))

(assert (= (and mapNonEmpty!56178 (not condMapEmpty!56184)) mapNonEmpty!56184))

(assert (= (and mapNonEmpty!56184 ((_ is ValueCellFull!17277) mapValue!56184)) b!1326820))

(assert (= (and mapNonEmpty!56178 ((_ is ValueCellFull!17277) mapDefault!56184)) b!1326821))

(declare-fun m!1216021 () Bool)

(assert (=> mapNonEmpty!56184 m!1216021))

(declare-fun b_lambda!23823 () Bool)

(assert (= b_lambda!23821 (or (and start!111932 b_free!30531) b_lambda!23823)))

(declare-fun b_lambda!23825 () Bool)

(assert (= b_lambda!23815 (or (and start!111932 b_free!30531) b_lambda!23825)))

(declare-fun b_lambda!23827 () Bool)

(assert (= b_lambda!23819 (or (and start!111932 b_free!30531) b_lambda!23827)))

(declare-fun b_lambda!23829 () Bool)

(assert (= b_lambda!23817 (or (and start!111932 b_free!30531) b_lambda!23829)))

(check-sat (not b!1326787) (not b!1326663) (not b!1326638) (not b!1326631) (not d!143131) (not d!143105) (not b!1326660) (not b!1326798) (not bm!64748) (not d!143137) (not b!1326790) (not b!1326715) (not b!1326794) (not bm!64750) (not b!1326662) (not b!1326714) (not b!1326791) (not d!143115) (not d!143113) (not b!1326708) (not d!143109) (not b!1326637) (not b!1326761) (not d!143101) (not b!1326809) (not b!1326646) (not d!143121) (not b!1326765) (not mapNonEmpty!56184) (not b_lambda!23813) (not bm!64733) (not b!1326772) (not b!1326665) (not b!1326656) (not b!1326720) (not b!1326759) (not b!1326657) b_and!49171 (not b!1326778) (not bm!64753) (not b!1326728) (not b!1326729) (not b!1326785) (not bm!64751) (not b!1326661) (not b!1326724) (not b!1326770) (not b!1326773) (not b!1326649) (not d!143135) (not b!1326658) (not d!143119) (not b_lambda!23827) (not b!1326766) (not b!1326784) (not b!1326811) (not bm!64757) (not b!1326756) (not d!143103) (not bm!64767) (not d!143099) (not d!143125) (not d!143133) (not b!1326717) (not bm!64761) (not d!143111) (not d!143129) (not b_lambda!23823) (not b!1326648) (not b!1326767) (not d!143117) (not b!1326810) (not d!143123) (not b!1326721) (not b!1326774) (not b_next!30531) (not b_lambda!23825) (not b_lambda!23829) (not b!1326651) (not b!1326775) (not d!143127) tp_is_empty!36351 (not b!1326762) (not b!1326777) (not b!1326760) (not bm!64758) (not bm!64760) (not b!1326769) (not b!1326630) (not bm!64763) (not b!1326768) (not b!1326731))
(check-sat b_and!49171 (not b_next!30531))
