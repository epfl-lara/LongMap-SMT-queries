; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14426 () Bool)

(assert start!14426)

(declare-fun b!136148 () Bool)

(declare-fun b_free!2929 () Bool)

(declare-fun b_next!2929 () Bool)

(assert (=> b!136148 (= b_free!2929 (not b_next!2929))))

(declare-fun tp!11241 () Bool)

(declare-fun b_and!8389 () Bool)

(assert (=> b!136148 (= tp!11241 b_and!8389)))

(declare-fun b!136147 () Bool)

(declare-fun b_free!2931 () Bool)

(declare-fun b_next!2931 () Bool)

(assert (=> b!136147 (= b_free!2931 (not b_next!2931))))

(declare-fun tp!11239 () Bool)

(declare-fun b_and!8391 () Bool)

(assert (=> b!136147 (= tp!11239 b_and!8391)))

(declare-fun b!136130 () Bool)

(declare-fun e!88628 () Bool)

(declare-fun tp_is_empty!2881 () Bool)

(assert (=> b!136130 (= e!88628 tp_is_empty!2881)))

(declare-fun b!136131 () Bool)

(declare-fun e!88631 () Bool)

(declare-fun e!88622 () Bool)

(declare-fun mapRes!4666 () Bool)

(assert (=> b!136131 (= e!88631 (and e!88622 mapRes!4666))))

(declare-fun condMapEmpty!4665 () Bool)

(declare-datatypes ((V!3489 0))(
  ( (V!3490 (val!1485 Int)) )
))
(declare-datatypes ((array!4771 0))(
  ( (array!4772 (arr!2254 (Array (_ BitVec 32) (_ BitVec 64))) (size!2525 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1097 0))(
  ( (ValueCellFull!1097 (v!3208 V!3489)) (EmptyCell!1097) )
))
(declare-datatypes ((array!4773 0))(
  ( (array!4774 (arr!2255 (Array (_ BitVec 32) ValueCell!1097)) (size!2526 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1102 0))(
  ( (LongMapFixedSize!1103 (defaultEntry!2885 Int) (mask!7196 (_ BitVec 32)) (extraKeys!2646 (_ BitVec 32)) (zeroValue!2738 V!3489) (minValue!2738 V!3489) (_size!600 (_ BitVec 32)) (_keys!4637 array!4771) (_values!2868 array!4773) (_vacant!600 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1102)

(declare-fun mapDefault!4665 () ValueCell!1097)

(assert (=> b!136131 (= condMapEmpty!4665 (= (arr!2255 (_values!2868 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1097)) mapDefault!4665)))))

(declare-fun b!136132 () Bool)

(declare-fun res!65254 () Bool)

(declare-fun e!88630 () Bool)

(assert (=> b!136132 (=> (not res!65254) (not e!88630))))

(declare-datatypes ((Cell!886 0))(
  ( (Cell!887 (v!3209 LongMapFixedSize!1102)) )
))
(declare-datatypes ((LongMap!886 0))(
  ( (LongMap!887 (underlying!454 Cell!886)) )
))
(declare-fun thiss!992 () LongMap!886)

(assert (=> b!136132 (= res!65254 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7196 newMap!16)) (_size!600 (v!3209 (underlying!454 thiss!992)))))))

(declare-fun b!136133 () Bool)

(declare-fun e!88624 () Bool)

(assert (=> b!136133 (= e!88624 tp_is_empty!2881)))

(declare-fun res!65250 () Bool)

(assert (=> start!14426 (=> (not res!65250) (not e!88630))))

(declare-fun valid!532 (LongMap!886) Bool)

(assert (=> start!14426 (= res!65250 (valid!532 thiss!992))))

(assert (=> start!14426 e!88630))

(declare-fun e!88625 () Bool)

(assert (=> start!14426 e!88625))

(assert (=> start!14426 true))

(declare-fun e!88623 () Bool)

(assert (=> start!14426 e!88623))

(declare-fun b!136134 () Bool)

(declare-fun e!88626 () Bool)

(assert (=> b!136134 (= e!88626 tp_is_empty!2881)))

(declare-fun b!136135 () Bool)

(declare-fun res!65259 () Bool)

(assert (=> b!136135 (=> (not res!65259) (not e!88630))))

(declare-fun valid!533 (LongMapFixedSize!1102) Bool)

(assert (=> b!136135 (= res!65259 (valid!533 newMap!16))))

(declare-fun mapNonEmpty!4665 () Bool)

(declare-fun tp!11240 () Bool)

(assert (=> mapNonEmpty!4665 (= mapRes!4666 (and tp!11240 e!88624))))

(declare-fun mapValue!4666 () ValueCell!1097)

(declare-fun mapRest!4665 () (Array (_ BitVec 32) ValueCell!1097))

(declare-fun mapKey!4666 () (_ BitVec 32))

(assert (=> mapNonEmpty!4665 (= (arr!2255 (_values!2868 newMap!16)) (store mapRest!4665 mapKey!4666 mapValue!4666))))

(declare-fun b!136136 () Bool)

(declare-fun res!65251 () Bool)

(declare-fun e!88629 () Bool)

(assert (=> b!136136 (=> (not res!65251) (not e!88629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4771 (_ BitVec 32)) Bool)

(assert (=> b!136136 (= res!65251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4637 (v!3209 (underlying!454 thiss!992))) (mask!7196 (v!3209 (underlying!454 thiss!992)))))))

(declare-fun b!136137 () Bool)

(declare-fun res!65257 () Bool)

(assert (=> b!136137 (=> (not res!65257) (not e!88629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!136137 (= res!65257 (validMask!0 (mask!7196 (v!3209 (underlying!454 thiss!992)))))))

(declare-fun b!136138 () Bool)

(declare-fun res!65253 () Bool)

(assert (=> b!136138 (=> (not res!65253) (not e!88629))))

(assert (=> b!136138 (= res!65253 (and (= (size!2526 (_values!2868 (v!3209 (underlying!454 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7196 (v!3209 (underlying!454 thiss!992))))) (= (size!2525 (_keys!4637 (v!3209 (underlying!454 thiss!992)))) (size!2526 (_values!2868 (v!3209 (underlying!454 thiss!992))))) (bvsge (mask!7196 (v!3209 (underlying!454 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2646 (v!3209 (underlying!454 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2646 (v!3209 (underlying!454 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!136139 () Bool)

(declare-fun res!65256 () Bool)

(assert (=> b!136139 (=> (not res!65256) (not e!88630))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!136139 (= res!65256 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2525 (_keys!4637 (v!3209 (underlying!454 thiss!992)))))))))

(declare-fun b!136140 () Bool)

(declare-fun e!88620 () Bool)

(assert (=> b!136140 (= e!88620 e!88629)))

(declare-fun res!65258 () Bool)

(assert (=> b!136140 (=> (not res!65258) (not e!88629))))

(declare-datatypes ((tuple2!2592 0))(
  ( (tuple2!2593 (_1!1307 (_ BitVec 64)) (_2!1307 V!3489)) )
))
(declare-datatypes ((List!1713 0))(
  ( (Nil!1710) (Cons!1709 (h!2315 tuple2!2592) (t!6180 List!1713)) )
))
(declare-datatypes ((ListLongMap!1675 0))(
  ( (ListLongMap!1676 (toList!853 List!1713)) )
))
(declare-fun lt!70994 () ListLongMap!1675)

(declare-fun contains!890 (ListLongMap!1675 (_ BitVec 64)) Bool)

(assert (=> b!136140 (= res!65258 (contains!890 lt!70994 (select (arr!2254 (_keys!4637 (v!3209 (underlying!454 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2594 0))(
  ( (tuple2!2595 (_1!1308 Bool) (_2!1308 LongMapFixedSize!1102)) )
))
(declare-fun lt!70993 () tuple2!2594)

(declare-fun update!194 (LongMapFixedSize!1102 (_ BitVec 64) V!3489) tuple2!2594)

(declare-fun get!1485 (ValueCell!1097 V!3489) V!3489)

(declare-fun dynLambda!420 (Int (_ BitVec 64)) V!3489)

(assert (=> b!136140 (= lt!70993 (update!194 newMap!16 (select (arr!2254 (_keys!4637 (v!3209 (underlying!454 thiss!992)))) from!355) (get!1485 (select (arr!2255 (_values!2868 (v!3209 (underlying!454 thiss!992)))) from!355) (dynLambda!420 (defaultEntry!2885 (v!3209 (underlying!454 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!136141 () Bool)

(declare-fun e!88617 () Bool)

(assert (=> b!136141 (= e!88625 e!88617)))

(declare-fun b!136142 () Bool)

(declare-fun e!88627 () Bool)

(declare-fun mapRes!4665 () Bool)

(assert (=> b!136142 (= e!88627 (and e!88628 mapRes!4665))))

(declare-fun condMapEmpty!4666 () Bool)

(declare-fun mapDefault!4666 () ValueCell!1097)

(assert (=> b!136142 (= condMapEmpty!4666 (= (arr!2255 (_values!2868 (v!3209 (underlying!454 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1097)) mapDefault!4666)))))

(declare-fun mapIsEmpty!4665 () Bool)

(assert (=> mapIsEmpty!4665 mapRes!4665))

(declare-fun b!136143 () Bool)

(assert (=> b!136143 (= e!88630 e!88620)))

(declare-fun res!65252 () Bool)

(assert (=> b!136143 (=> (not res!65252) (not e!88620))))

(declare-fun lt!70992 () ListLongMap!1675)

(assert (=> b!136143 (= res!65252 (and (= lt!70992 lt!70994) (not (= (select (arr!2254 (_keys!4637 (v!3209 (underlying!454 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2254 (_keys!4637 (v!3209 (underlying!454 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1394 (LongMapFixedSize!1102) ListLongMap!1675)

(assert (=> b!136143 (= lt!70994 (map!1394 newMap!16))))

(declare-fun getCurrentListMap!520 (array!4771 array!4773 (_ BitVec 32) (_ BitVec 32) V!3489 V!3489 (_ BitVec 32) Int) ListLongMap!1675)

(assert (=> b!136143 (= lt!70992 (getCurrentListMap!520 (_keys!4637 (v!3209 (underlying!454 thiss!992))) (_values!2868 (v!3209 (underlying!454 thiss!992))) (mask!7196 (v!3209 (underlying!454 thiss!992))) (extraKeys!2646 (v!3209 (underlying!454 thiss!992))) (zeroValue!2738 (v!3209 (underlying!454 thiss!992))) (minValue!2738 (v!3209 (underlying!454 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2885 (v!3209 (underlying!454 thiss!992)))))))

(declare-fun b!136144 () Bool)

(declare-fun res!65255 () Bool)

(assert (=> b!136144 (=> (not res!65255) (not e!88629))))

(assert (=> b!136144 (= res!65255 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2525 (_keys!4637 (v!3209 (underlying!454 thiss!992)))))))))

(declare-fun mapNonEmpty!4666 () Bool)

(declare-fun tp!11242 () Bool)

(assert (=> mapNonEmpty!4666 (= mapRes!4665 (and tp!11242 e!88626))))

(declare-fun mapKey!4665 () (_ BitVec 32))

(declare-fun mapValue!4665 () ValueCell!1097)

(declare-fun mapRest!4666 () (Array (_ BitVec 32) ValueCell!1097))

(assert (=> mapNonEmpty!4666 (= (arr!2255 (_values!2868 (v!3209 (underlying!454 thiss!992)))) (store mapRest!4666 mapKey!4665 mapValue!4665))))

(declare-fun b!136145 () Bool)

(declare-fun e!88618 () Bool)

(assert (=> b!136145 (= e!88617 e!88618)))

(declare-fun b!136146 () Bool)

(declare-fun res!65249 () Bool)

(assert (=> b!136146 (=> (not res!65249) (not e!88629))))

(declare-datatypes ((List!1714 0))(
  ( (Nil!1711) (Cons!1710 (h!2316 (_ BitVec 64)) (t!6181 List!1714)) )
))
(declare-fun arrayNoDuplicates!0 (array!4771 (_ BitVec 32) List!1714) Bool)

(assert (=> b!136146 (= res!65249 (arrayNoDuplicates!0 (_keys!4637 (v!3209 (underlying!454 thiss!992))) #b00000000000000000000000000000000 Nil!1711))))

(declare-fun array_inv!1433 (array!4771) Bool)

(declare-fun array_inv!1434 (array!4773) Bool)

(assert (=> b!136147 (= e!88623 (and tp!11239 tp_is_empty!2881 (array_inv!1433 (_keys!4637 newMap!16)) (array_inv!1434 (_values!2868 newMap!16)) e!88631))))

(assert (=> b!136148 (= e!88618 (and tp!11241 tp_is_empty!2881 (array_inv!1433 (_keys!4637 (v!3209 (underlying!454 thiss!992)))) (array_inv!1434 (_values!2868 (v!3209 (underlying!454 thiss!992)))) e!88627))))

(declare-fun b!136149 () Bool)

(assert (=> b!136149 (= e!88622 tp_is_empty!2881)))

(declare-fun mapIsEmpty!4666 () Bool)

(assert (=> mapIsEmpty!4666 mapRes!4666))

(declare-fun b!136150 () Bool)

(assert (=> b!136150 (= e!88629 (not (contains!890 lt!70992 (select (arr!2254 (_keys!4637 (v!3209 (underlying!454 thiss!992)))) from!355))))))

(assert (= (and start!14426 res!65250) b!136139))

(assert (= (and b!136139 res!65256) b!136135))

(assert (= (and b!136135 res!65259) b!136132))

(assert (= (and b!136132 res!65254) b!136143))

(assert (= (and b!136143 res!65252) b!136140))

(assert (= (and b!136140 res!65258) b!136137))

(assert (= (and b!136137 res!65257) b!136138))

(assert (= (and b!136138 res!65253) b!136136))

(assert (= (and b!136136 res!65251) b!136146))

(assert (= (and b!136146 res!65249) b!136144))

(assert (= (and b!136144 res!65255) b!136150))

(assert (= (and b!136142 condMapEmpty!4666) mapIsEmpty!4665))

(assert (= (and b!136142 (not condMapEmpty!4666)) mapNonEmpty!4666))

(get-info :version)

(assert (= (and mapNonEmpty!4666 ((_ is ValueCellFull!1097) mapValue!4665)) b!136134))

(assert (= (and b!136142 ((_ is ValueCellFull!1097) mapDefault!4666)) b!136130))

(assert (= b!136148 b!136142))

(assert (= b!136145 b!136148))

(assert (= b!136141 b!136145))

(assert (= start!14426 b!136141))

(assert (= (and b!136131 condMapEmpty!4665) mapIsEmpty!4666))

(assert (= (and b!136131 (not condMapEmpty!4665)) mapNonEmpty!4665))

(assert (= (and mapNonEmpty!4665 ((_ is ValueCellFull!1097) mapValue!4666)) b!136133))

(assert (= (and b!136131 ((_ is ValueCellFull!1097) mapDefault!4665)) b!136149))

(assert (= b!136147 b!136131))

(assert (= start!14426 b!136147))

(declare-fun b_lambda!6071 () Bool)

(assert (=> (not b_lambda!6071) (not b!136140)))

(declare-fun t!6177 () Bool)

(declare-fun tb!2429 () Bool)

(assert (=> (and b!136148 (= (defaultEntry!2885 (v!3209 (underlying!454 thiss!992))) (defaultEntry!2885 (v!3209 (underlying!454 thiss!992)))) t!6177) tb!2429))

(declare-fun result!4005 () Bool)

(assert (=> tb!2429 (= result!4005 tp_is_empty!2881)))

(assert (=> b!136140 t!6177))

(declare-fun b_and!8393 () Bool)

(assert (= b_and!8389 (and (=> t!6177 result!4005) b_and!8393)))

(declare-fun tb!2431 () Bool)

(declare-fun t!6179 () Bool)

(assert (=> (and b!136147 (= (defaultEntry!2885 newMap!16) (defaultEntry!2885 (v!3209 (underlying!454 thiss!992)))) t!6179) tb!2431))

(declare-fun result!4009 () Bool)

(assert (= result!4009 result!4005))

(assert (=> b!136140 t!6179))

(declare-fun b_and!8395 () Bool)

(assert (= b_and!8391 (and (=> t!6179 result!4009) b_and!8395)))

(declare-fun m!162299 () Bool)

(assert (=> b!136147 m!162299))

(declare-fun m!162301 () Bool)

(assert (=> b!136147 m!162301))

(declare-fun m!162303 () Bool)

(assert (=> b!136137 m!162303))

(declare-fun m!162305 () Bool)

(assert (=> b!136136 m!162305))

(declare-fun m!162307 () Bool)

(assert (=> mapNonEmpty!4665 m!162307))

(declare-fun m!162309 () Bool)

(assert (=> start!14426 m!162309))

(declare-fun m!162311 () Bool)

(assert (=> b!136148 m!162311))

(declare-fun m!162313 () Bool)

(assert (=> b!136148 m!162313))

(declare-fun m!162315 () Bool)

(assert (=> mapNonEmpty!4666 m!162315))

(declare-fun m!162317 () Bool)

(assert (=> b!136150 m!162317))

(assert (=> b!136150 m!162317))

(declare-fun m!162319 () Bool)

(assert (=> b!136150 m!162319))

(declare-fun m!162321 () Bool)

(assert (=> b!136140 m!162321))

(declare-fun m!162323 () Bool)

(assert (=> b!136140 m!162323))

(declare-fun m!162325 () Bool)

(assert (=> b!136140 m!162325))

(assert (=> b!136140 m!162317))

(assert (=> b!136140 m!162323))

(assert (=> b!136140 m!162317))

(declare-fun m!162327 () Bool)

(assert (=> b!136140 m!162327))

(assert (=> b!136140 m!162317))

(assert (=> b!136140 m!162325))

(declare-fun m!162329 () Bool)

(assert (=> b!136140 m!162329))

(assert (=> b!136140 m!162321))

(declare-fun m!162331 () Bool)

(assert (=> b!136146 m!162331))

(assert (=> b!136143 m!162317))

(declare-fun m!162333 () Bool)

(assert (=> b!136143 m!162333))

(declare-fun m!162335 () Bool)

(assert (=> b!136143 m!162335))

(declare-fun m!162337 () Bool)

(assert (=> b!136135 m!162337))

(check-sat (not b!136140) b_and!8395 (not mapNonEmpty!4666) (not b!136148) tp_is_empty!2881 (not b!136146) (not b!136147) (not b!136150) (not b_lambda!6071) (not b_next!2929) (not b_next!2931) (not b!136136) (not b!136135) (not mapNonEmpty!4665) b_and!8393 (not b!136137) (not start!14426) (not b!136143))
(check-sat b_and!8393 b_and!8395 (not b_next!2929) (not b_next!2931))
