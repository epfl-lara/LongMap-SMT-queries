; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14590 () Bool)

(assert start!14590)

(declare-fun b!138052 () Bool)

(declare-fun b_free!2997 () Bool)

(declare-fun b_next!2997 () Bool)

(assert (=> b!138052 (= b_free!2997 (not b_next!2997))))

(declare-fun tp!11452 () Bool)

(declare-fun b_and!8603 () Bool)

(assert (=> b!138052 (= tp!11452 b_and!8603)))

(declare-fun b!138054 () Bool)

(declare-fun b_free!2999 () Bool)

(declare-fun b_next!2999 () Bool)

(assert (=> b!138054 (= b_free!2999 (not b_next!2999))))

(declare-fun tp!11453 () Bool)

(declare-fun b_and!8605 () Bool)

(assert (=> b!138054 (= tp!11453 b_and!8605)))

(declare-fun b!138043 () Bool)

(declare-fun e!90010 () Bool)

(declare-fun tp_is_empty!2915 () Bool)

(assert (=> b!138043 (= e!90010 tp_is_empty!2915)))

(declare-fun b!138044 () Bool)

(declare-fun e!90020 () Bool)

(declare-fun e!90018 () Bool)

(assert (=> b!138044 (= e!90020 e!90018)))

(declare-fun mapNonEmpty!4775 () Bool)

(declare-fun mapRes!4775 () Bool)

(declare-fun tp!11451 () Bool)

(assert (=> mapNonEmpty!4775 (= mapRes!4775 (and tp!11451 e!90010))))

(declare-datatypes ((V!3533 0))(
  ( (V!3534 (val!1502 Int)) )
))
(declare-datatypes ((ValueCell!1114 0))(
  ( (ValueCellFull!1114 (v!3256 V!3533)) (EmptyCell!1114) )
))
(declare-fun mapValue!4775 () ValueCell!1114)

(declare-fun mapKey!4776 () (_ BitVec 32))

(declare-datatypes ((array!4861 0))(
  ( (array!4862 (arr!2299 (Array (_ BitVec 32) (_ BitVec 64))) (size!2570 (_ BitVec 32))) )
))
(declare-datatypes ((array!4863 0))(
  ( (array!4864 (arr!2300 (Array (_ BitVec 32) ValueCell!1114)) (size!2571 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1136 0))(
  ( (LongMapFixedSize!1137 (defaultEntry!2920 Int) (mask!7250 (_ BitVec 32)) (extraKeys!2677 (_ BitVec 32)) (zeroValue!2771 V!3533) (minValue!2771 V!3533) (_size!617 (_ BitVec 32)) (_keys!4677 array!4861) (_values!2903 array!4863) (_vacant!617 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1136)

(declare-fun mapRest!4775 () (Array (_ BitVec 32) ValueCell!1114))

(assert (=> mapNonEmpty!4775 (= (arr!2300 (_values!2903 newMap!16)) (store mapRest!4775 mapKey!4776 mapValue!4775))))

(declare-fun b!138045 () Bool)

(declare-fun e!90024 () Bool)

(declare-fun e!90012 () Bool)

(assert (=> b!138045 (= e!90024 e!90012)))

(declare-fun res!66124 () Bool)

(assert (=> b!138045 (=> (not res!66124) (not e!90012))))

(declare-datatypes ((tuple2!2684 0))(
  ( (tuple2!2685 (_1!1353 (_ BitVec 64)) (_2!1353 V!3533)) )
))
(declare-datatypes ((List!1737 0))(
  ( (Nil!1734) (Cons!1733 (h!2340 tuple2!2684) (t!6285 List!1737)) )
))
(declare-datatypes ((ListLongMap!1737 0))(
  ( (ListLongMap!1738 (toList!884 List!1737)) )
))
(declare-fun lt!72076 () ListLongMap!1737)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!72074 () ListLongMap!1737)

(declare-datatypes ((Cell!924 0))(
  ( (Cell!925 (v!3257 LongMapFixedSize!1136)) )
))
(declare-datatypes ((LongMap!924 0))(
  ( (LongMap!925 (underlying!473 Cell!924)) )
))
(declare-fun thiss!992 () LongMap!924)

(assert (=> b!138045 (= res!66124 (and (= lt!72076 lt!72074) (not (= (select (arr!2299 (_keys!4677 (v!3257 (underlying!473 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2299 (_keys!4677 (v!3257 (underlying!473 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1433 (LongMapFixedSize!1136) ListLongMap!1737)

(assert (=> b!138045 (= lt!72074 (map!1433 newMap!16))))

(declare-fun getCurrentListMap!558 (array!4861 array!4863 (_ BitVec 32) (_ BitVec 32) V!3533 V!3533 (_ BitVec 32) Int) ListLongMap!1737)

(assert (=> b!138045 (= lt!72076 (getCurrentListMap!558 (_keys!4677 (v!3257 (underlying!473 thiss!992))) (_values!2903 (v!3257 (underlying!473 thiss!992))) (mask!7250 (v!3257 (underlying!473 thiss!992))) (extraKeys!2677 (v!3257 (underlying!473 thiss!992))) (zeroValue!2771 (v!3257 (underlying!473 thiss!992))) (minValue!2771 (v!3257 (underlying!473 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2920 (v!3257 (underlying!473 thiss!992)))))))

(declare-fun b!138046 () Bool)

(declare-fun e!90011 () Bool)

(assert (=> b!138046 (= e!90011 e!90020)))

(declare-fun b!138047 () Bool)

(declare-fun e!90015 () Bool)

(declare-datatypes ((List!1738 0))(
  ( (Nil!1735) (Cons!1734 (h!2341 (_ BitVec 64)) (t!6286 List!1738)) )
))
(declare-fun arrayNoDuplicates!0 (array!4861 (_ BitVec 32) List!1738) Bool)

(assert (=> b!138047 (= e!90015 (arrayNoDuplicates!0 (_keys!4677 (v!3257 (underlying!473 thiss!992))) #b00000000000000000000000000000000 Nil!1735))))

(declare-fun mapIsEmpty!4775 () Bool)

(declare-fun mapRes!4776 () Bool)

(assert (=> mapIsEmpty!4775 mapRes!4776))

(declare-fun res!66126 () Bool)

(assert (=> start!14590 (=> (not res!66126) (not e!90024))))

(declare-fun valid!549 (LongMap!924) Bool)

(assert (=> start!14590 (= res!66126 (valid!549 thiss!992))))

(assert (=> start!14590 e!90024))

(assert (=> start!14590 e!90011))

(assert (=> start!14590 true))

(declare-fun e!90022 () Bool)

(assert (=> start!14590 e!90022))

(declare-fun b!138048 () Bool)

(declare-fun e!90021 () Bool)

(declare-fun e!90019 () Bool)

(assert (=> b!138048 (= e!90021 (and e!90019 mapRes!4776))))

(declare-fun condMapEmpty!4775 () Bool)

(declare-fun mapDefault!4775 () ValueCell!1114)

