; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11946 () Bool)

(assert start!11946)

(declare-fun b!100649 () Bool)

(declare-fun b_free!2449 () Bool)

(declare-fun b_next!2449 () Bool)

(assert (=> b!100649 (= b_free!2449 (not b_next!2449))))

(declare-fun tp!9647 () Bool)

(declare-fun b_and!6195 () Bool)

(assert (=> b!100649 (= tp!9647 b_and!6195)))

(declare-fun b!100634 () Bool)

(declare-fun b_free!2451 () Bool)

(declare-fun b_next!2451 () Bool)

(assert (=> b!100634 (= b_free!2451 (not b_next!2451))))

(declare-fun tp!9646 () Bool)

(declare-fun b_and!6197 () Bool)

(assert (=> b!100634 (= tp!9646 b_and!6197)))

(declare-fun b!100631 () Bool)

(declare-fun res!50473 () Bool)

(declare-fun e!65536 () Bool)

(assert (=> b!100631 (=> (not res!50473) (not e!65536))))

(declare-datatypes ((V!3169 0))(
  ( (V!3170 (val!1365 Int)) )
))
(declare-datatypes ((array!4265 0))(
  ( (array!4266 (arr!2025 (Array (_ BitVec 32) (_ BitVec 64))) (size!2277 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!977 0))(
  ( (ValueCellFull!977 (v!2829 V!3169)) (EmptyCell!977) )
))
(declare-datatypes ((array!4267 0))(
  ( (array!4268 (arr!2026 (Array (_ BitVec 32) ValueCell!977)) (size!2278 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!862 0))(
  ( (LongMapFixedSize!863 (defaultEntry!2522 Int) (mask!6639 (_ BitVec 32)) (extraKeys!2335 (_ BitVec 32)) (zeroValue!2401 V!3169) (minValue!2401 V!3169) (_size!480 (_ BitVec 32)) (_keys!4220 array!4265) (_values!2505 array!4267) (_vacant!480 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!862)

(declare-fun valid!390 (LongMapFixedSize!862) Bool)

(assert (=> b!100631 (= res!50473 (valid!390 newMap!16))))

(declare-fun b!100632 () Bool)

(declare-fun res!50475 () Bool)

(declare-fun e!65531 () Bool)

(assert (=> b!100632 (=> (not res!50475) (not e!65531))))

(declare-datatypes ((Cell!662 0))(
  ( (Cell!663 (v!2830 LongMapFixedSize!862)) )
))
(declare-datatypes ((LongMap!662 0))(
  ( (LongMap!663 (underlying!342 Cell!662)) )
))
(declare-fun thiss!992 () LongMap!662)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!100632 (= res!50475 (validMask!0 (mask!6639 (v!2830 (underlying!342 thiss!992)))))))

(declare-fun b!100633 () Bool)

(declare-fun res!50478 () Bool)

(assert (=> b!100633 (=> (not res!50478) (not e!65536))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!100633 (= res!50478 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2277 (_keys!4220 (v!2830 (underlying!342 thiss!992)))))))))

(declare-fun e!65526 () Bool)

(declare-fun tp_is_empty!2641 () Bool)

(declare-fun e!65539 () Bool)

(declare-fun array_inv!1263 (array!4265) Bool)

(declare-fun array_inv!1264 (array!4267) Bool)

(assert (=> b!100634 (= e!65526 (and tp!9646 tp_is_empty!2641 (array_inv!1263 (_keys!4220 newMap!16)) (array_inv!1264 (_values!2505 newMap!16)) e!65539))))

(declare-fun b!100635 () Bool)

(declare-fun e!65532 () Bool)

(assert (=> b!100635 (= e!65536 e!65532)))

(declare-fun res!50474 () Bool)

(assert (=> b!100635 (=> (not res!50474) (not e!65532))))

(declare-datatypes ((tuple2!2350 0))(
  ( (tuple2!2351 (_1!1186 (_ BitVec 64)) (_2!1186 V!3169)) )
))
(declare-datatypes ((List!1585 0))(
  ( (Nil!1582) (Cons!1581 (h!2177 tuple2!2350) (t!5575 List!1585)) )
))
(declare-datatypes ((ListLongMap!1541 0))(
  ( (ListLongMap!1542 (toList!786 List!1585)) )
))
(declare-fun lt!50914 () ListLongMap!1541)

(declare-fun lt!50915 () ListLongMap!1541)

(assert (=> b!100635 (= res!50474 (and (= lt!50915 lt!50914) (not (= (select (arr!2025 (_keys!4220 (v!2830 (underlying!342 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2025 (_keys!4220 (v!2830 (underlying!342 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1262 (LongMapFixedSize!862) ListLongMap!1541)

(assert (=> b!100635 (= lt!50914 (map!1262 newMap!16))))

(declare-fun getCurrentListMap!477 (array!4265 array!4267 (_ BitVec 32) (_ BitVec 32) V!3169 V!3169 (_ BitVec 32) Int) ListLongMap!1541)

(assert (=> b!100635 (= lt!50915 (getCurrentListMap!477 (_keys!4220 (v!2830 (underlying!342 thiss!992))) (_values!2505 (v!2830 (underlying!342 thiss!992))) (mask!6639 (v!2830 (underlying!342 thiss!992))) (extraKeys!2335 (v!2830 (underlying!342 thiss!992))) (zeroValue!2401 (v!2830 (underlying!342 thiss!992))) (minValue!2401 (v!2830 (underlying!342 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2522 (v!2830 (underlying!342 thiss!992)))))))

(declare-fun b!100636 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4265 (_ BitVec 32)) Bool)

(assert (=> b!100636 (= e!65531 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4220 (v!2830 (underlying!342 thiss!992))) (mask!6639 (v!2830 (underlying!342 thiss!992))))))))

(declare-fun b!100637 () Bool)

(declare-fun e!65535 () Bool)

(assert (=> b!100637 (= e!65535 tp_is_empty!2641)))

(declare-fun b!100638 () Bool)

(declare-fun res!50479 () Bool)

(assert (=> b!100638 (=> (not res!50479) (not e!65536))))

(assert (=> b!100638 (= res!50479 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6639 newMap!16)) (_size!480 (v!2830 (underlying!342 thiss!992)))))))

(declare-fun mapNonEmpty!3791 () Bool)

(declare-fun mapRes!3792 () Bool)

(declare-fun tp!9648 () Bool)

(declare-fun e!65530 () Bool)

(assert (=> mapNonEmpty!3791 (= mapRes!3792 (and tp!9648 e!65530))))

(declare-fun mapRest!3791 () (Array (_ BitVec 32) ValueCell!977))

(declare-fun mapKey!3791 () (_ BitVec 32))

(declare-fun mapValue!3792 () ValueCell!977)

(assert (=> mapNonEmpty!3791 (= (arr!2026 (_values!2505 (v!2830 (underlying!342 thiss!992)))) (store mapRest!3791 mapKey!3791 mapValue!3792))))

(declare-fun b!100639 () Bool)

(declare-fun res!50480 () Bool)

(assert (=> b!100639 (=> (not res!50480) (not e!65531))))

(assert (=> b!100639 (= res!50480 (and (= (size!2278 (_values!2505 (v!2830 (underlying!342 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6639 (v!2830 (underlying!342 thiss!992))))) (= (size!2277 (_keys!4220 (v!2830 (underlying!342 thiss!992)))) (size!2278 (_values!2505 (v!2830 (underlying!342 thiss!992))))) (bvsge (mask!6639 (v!2830 (underlying!342 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2335 (v!2830 (underlying!342 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2335 (v!2830 (underlying!342 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!100640 () Bool)

(declare-fun e!65537 () Bool)

(assert (=> b!100640 (= e!65537 tp_is_empty!2641)))

(declare-fun mapIsEmpty!3791 () Bool)

(assert (=> mapIsEmpty!3791 mapRes!3792))

(declare-fun b!100641 () Bool)

(assert (=> b!100641 (= e!65532 e!65531)))

(declare-fun res!50477 () Bool)

(assert (=> b!100641 (=> (not res!50477) (not e!65531))))

(declare-datatypes ((tuple2!2352 0))(
  ( (tuple2!2353 (_1!1187 Bool) (_2!1187 LongMapFixedSize!862)) )
))
(declare-fun lt!50911 () tuple2!2352)

(assert (=> b!100641 (= res!50477 (and (_1!1187 lt!50911) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3058 0))(
  ( (Unit!3059) )
))
(declare-fun lt!50916 () Unit!3058)

(declare-fun e!65525 () Unit!3058)

(assert (=> b!100641 (= lt!50916 e!65525)))

(declare-fun c!17284 () Bool)

(declare-fun contains!807 (ListLongMap!1541 (_ BitVec 64)) Bool)

(assert (=> b!100641 (= c!17284 (contains!807 lt!50914 (select (arr!2025 (_keys!4220 (v!2830 (underlying!342 thiss!992)))) from!355)))))

(declare-fun update!143 (LongMapFixedSize!862 (_ BitVec 64) V!3169) tuple2!2352)

(declare-fun get!1293 (ValueCell!977 V!3169) V!3169)

(declare-fun dynLambda!371 (Int (_ BitVec 64)) V!3169)

(assert (=> b!100641 (= lt!50911 (update!143 newMap!16 (select (arr!2025 (_keys!4220 (v!2830 (underlying!342 thiss!992)))) from!355) (get!1293 (select (arr!2026 (_values!2505 (v!2830 (underlying!342 thiss!992)))) from!355) (dynLambda!371 (defaultEntry!2522 (v!2830 (underlying!342 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!100642 () Bool)

(declare-fun e!65524 () Bool)

(assert (=> b!100642 (= e!65524 (and e!65537 mapRes!3792))))

(declare-fun condMapEmpty!3792 () Bool)

(declare-fun mapDefault!3792 () ValueCell!977)

