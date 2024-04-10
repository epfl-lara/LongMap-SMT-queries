; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9116 () Bool)

(assert start!9116)

(declare-fun b!64756 () Bool)

(declare-fun b_free!2025 () Bool)

(declare-fun b_next!2025 () Bool)

(assert (=> b!64756 (= b_free!2025 (not b_next!2025))))

(declare-fun tp!8219 () Bool)

(declare-fun b_and!3979 () Bool)

(assert (=> b!64756 (= tp!8219 b_and!3979)))

(declare-fun b!64757 () Bool)

(declare-fun b_free!2027 () Bool)

(declare-fun b_next!2027 () Bool)

(assert (=> b!64757 (= b_free!2027 (not b_next!2027))))

(declare-fun tp!8217 () Bool)

(declare-fun b_and!3981 () Bool)

(assert (=> b!64757 (= tp!8217 b_and!3981)))

(declare-fun mapNonEmpty!2999 () Bool)

(declare-fun mapRes!2999 () Bool)

(declare-fun tp!8218 () Bool)

(declare-fun e!42445 () Bool)

(assert (=> mapNonEmpty!2999 (= mapRes!2999 (and tp!8218 e!42445))))

(declare-datatypes ((V!2885 0))(
  ( (V!2886 (val!1259 Int)) )
))
(declare-datatypes ((array!3793 0))(
  ( (array!3794 (arr!1813 (Array (_ BitVec 32) (_ BitVec 64))) (size!2047 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!871 0))(
  ( (ValueCellFull!871 (v!2448 V!2885)) (EmptyCell!871) )
))
(declare-datatypes ((array!3795 0))(
  ( (array!3796 (arr!1814 (Array (_ BitVec 32) ValueCell!871)) (size!2048 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!650 0))(
  ( (LongMapFixedSize!651 (defaultEntry!2123 Int) (mask!6045 (_ BitVec 32)) (extraKeys!1996 (_ BitVec 32)) (zeroValue!2032 V!2885) (minValue!2032 V!2885) (_size!374 (_ BitVec 32)) (_keys!3761 array!3793) (_values!2106 array!3795) (_vacant!374 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!458 0))(
  ( (Cell!459 (v!2449 LongMapFixedSize!650)) )
))
(declare-datatypes ((LongMap!458 0))(
  ( (LongMap!459 (underlying!240 Cell!458)) )
))
(declare-fun thiss!992 () LongMap!458)

(declare-fun mapValue!2999 () ValueCell!871)

(declare-fun mapKey!3000 () (_ BitVec 32))

(declare-fun mapRest!2999 () (Array (_ BitVec 32) ValueCell!871))

(assert (=> mapNonEmpty!2999 (= (arr!1814 (_values!2106 (v!2449 (underlying!240 thiss!992)))) (store mapRest!2999 mapKey!3000 mapValue!2999))))

(declare-fun b!64752 () Bool)

(declare-fun res!35288 () Bool)

(declare-fun e!42450 () Bool)

(assert (=> b!64752 (=> (not res!35288) (not e!42450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3793 (_ BitVec 32)) Bool)

(assert (=> b!64752 (= res!35288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3761 (v!2449 (underlying!240 thiss!992))) (mask!6045 (v!2449 (underlying!240 thiss!992)))))))

(declare-fun b!64753 () Bool)

(declare-datatypes ((List!1450 0))(
  ( (Nil!1447) (Cons!1446 (h!2030 (_ BitVec 64)) (t!4884 List!1450)) )
))
(declare-fun arrayNoDuplicates!0 (array!3793 (_ BitVec 32) List!1450) Bool)

(assert (=> b!64753 (= e!42450 (not (arrayNoDuplicates!0 (_keys!3761 (v!2449 (underlying!240 thiss!992))) #b00000000000000000000000000000000 Nil!1447)))))

(declare-fun b!64754 () Bool)

(declare-fun e!42454 () Bool)

(declare-fun e!42443 () Bool)

(assert (=> b!64754 (= e!42454 e!42443)))

(declare-fun b!64755 () Bool)

(declare-fun res!35293 () Bool)

(assert (=> b!64755 (=> (not res!35293) (not e!42450))))

(assert (=> b!64755 (= res!35293 (and (= (size!2048 (_values!2106 (v!2449 (underlying!240 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6045 (v!2449 (underlying!240 thiss!992))))) (= (size!2047 (_keys!3761 (v!2449 (underlying!240 thiss!992)))) (size!2048 (_values!2106 (v!2449 (underlying!240 thiss!992))))) (bvsge (mask!6045 (v!2449 (underlying!240 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1996 (v!2449 (underlying!240 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1996 (v!2449 (underlying!240 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!2429 () Bool)

(declare-fun e!42452 () Bool)

(declare-fun e!42455 () Bool)

(declare-fun array_inv!1119 (array!3793) Bool)

(declare-fun array_inv!1120 (array!3795) Bool)

(assert (=> b!64756 (= e!42452 (and tp!8219 tp_is_empty!2429 (array_inv!1119 (_keys!3761 (v!2449 (underlying!240 thiss!992)))) (array_inv!1120 (_values!2106 (v!2449 (underlying!240 thiss!992)))) e!42455))))

(declare-fun mapIsEmpty!2999 () Bool)

(assert (=> mapIsEmpty!2999 mapRes!2999))

(declare-fun e!42453 () Bool)

(declare-fun e!42449 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!650)

(assert (=> b!64757 (= e!42453 (and tp!8217 tp_is_empty!2429 (array_inv!1119 (_keys!3761 newMap!16)) (array_inv!1120 (_values!2106 newMap!16)) e!42449))))

(declare-fun b!64758 () Bool)

(declare-fun res!35295 () Bool)

(assert (=> b!64758 (=> (not res!35295) (not e!42450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!64758 (= res!35295 (validMask!0 (mask!6045 (v!2449 (underlying!240 thiss!992)))))))

(declare-fun b!64759 () Bool)

(declare-datatypes ((Unit!1787 0))(
  ( (Unit!1788) )
))
(declare-fun e!42458 () Unit!1787)

(declare-fun Unit!1789 () Unit!1787)

(assert (=> b!64759 (= e!42458 Unit!1789)))

(declare-fun lt!27607 () Unit!1787)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!39 (array!3793 array!3795 (_ BitVec 32) (_ BitVec 32) V!2885 V!2885 (_ BitVec 64) (_ BitVec 32) Int) Unit!1787)

(assert (=> b!64759 (= lt!27607 (lemmaListMapContainsThenArrayContainsFrom!39 (_keys!3761 (v!2449 (underlying!240 thiss!992))) (_values!2106 (v!2449 (underlying!240 thiss!992))) (mask!6045 (v!2449 (underlying!240 thiss!992))) (extraKeys!1996 (v!2449 (underlying!240 thiss!992))) (zeroValue!2032 (v!2449 (underlying!240 thiss!992))) (minValue!2032 (v!2449 (underlying!240 thiss!992))) (select (arr!1813 (_keys!3761 (v!2449 (underlying!240 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2123 (v!2449 (underlying!240 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!64759 (arrayContainsKey!0 (_keys!3761 (v!2449 (underlying!240 thiss!992))) (select (arr!1813 (_keys!3761 (v!2449 (underlying!240 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!27606 () Unit!1787)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3793 (_ BitVec 32) (_ BitVec 32)) Unit!1787)

(assert (=> b!64759 (= lt!27606 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3761 (v!2449 (underlying!240 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!64759 (arrayNoDuplicates!0 (_keys!3761 (v!2449 (underlying!240 thiss!992))) from!355 Nil!1447)))

(declare-fun lt!27609 () Unit!1787)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3793 (_ BitVec 32) (_ BitVec 64) List!1450) Unit!1787)

(assert (=> b!64759 (= lt!27609 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3761 (v!2449 (underlying!240 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1813 (_keys!3761 (v!2449 (underlying!240 thiss!992)))) from!355) (Cons!1446 (select (arr!1813 (_keys!3761 (v!2449 (underlying!240 thiss!992)))) from!355) Nil!1447)))))

(assert (=> b!64759 false))

(declare-fun res!35291 () Bool)

(declare-fun e!42446 () Bool)

(assert (=> start!9116 (=> (not res!35291) (not e!42446))))

(declare-fun valid!269 (LongMap!458) Bool)

(assert (=> start!9116 (= res!35291 (valid!269 thiss!992))))

(assert (=> start!9116 e!42446))

(assert (=> start!9116 e!42454))

(assert (=> start!9116 true))

(assert (=> start!9116 e!42453))

(declare-fun b!64760 () Bool)

(declare-fun res!35289 () Bool)

(assert (=> b!64760 (=> (not res!35289) (not e!42446))))

(assert (=> b!64760 (= res!35289 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2047 (_keys!3761 (v!2449 (underlying!240 thiss!992)))))))))

(declare-fun b!64761 () Bool)

(declare-fun e!42447 () Bool)

(assert (=> b!64761 (= e!42446 e!42447)))

(declare-fun res!35294 () Bool)

(assert (=> b!64761 (=> (not res!35294) (not e!42447))))

(declare-datatypes ((tuple2!2060 0))(
  ( (tuple2!2061 (_1!1041 (_ BitVec 64)) (_2!1041 V!2885)) )
))
(declare-datatypes ((List!1451 0))(
  ( (Nil!1448) (Cons!1447 (h!2031 tuple2!2060) (t!4885 List!1451)) )
))
(declare-datatypes ((ListLongMap!1385 0))(
  ( (ListLongMap!1386 (toList!708 List!1451)) )
))
(declare-fun lt!27610 () ListLongMap!1385)

(declare-fun lt!27604 () ListLongMap!1385)

(assert (=> b!64761 (= res!35294 (and (= lt!27610 lt!27604) (not (= (select (arr!1813 (_keys!3761 (v!2449 (underlying!240 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1813 (_keys!3761 (v!2449 (underlying!240 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1123 (LongMapFixedSize!650) ListLongMap!1385)

(assert (=> b!64761 (= lt!27604 (map!1123 newMap!16))))

(declare-fun getCurrentListMap!410 (array!3793 array!3795 (_ BitVec 32) (_ BitVec 32) V!2885 V!2885 (_ BitVec 32) Int) ListLongMap!1385)

(assert (=> b!64761 (= lt!27610 (getCurrentListMap!410 (_keys!3761 (v!2449 (underlying!240 thiss!992))) (_values!2106 (v!2449 (underlying!240 thiss!992))) (mask!6045 (v!2449 (underlying!240 thiss!992))) (extraKeys!1996 (v!2449 (underlying!240 thiss!992))) (zeroValue!2032 (v!2449 (underlying!240 thiss!992))) (minValue!2032 (v!2449 (underlying!240 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2123 (v!2449 (underlying!240 thiss!992)))))))

(declare-fun mapNonEmpty!3000 () Bool)

(declare-fun mapRes!3000 () Bool)

(declare-fun tp!8220 () Bool)

(declare-fun e!42456 () Bool)

(assert (=> mapNonEmpty!3000 (= mapRes!3000 (and tp!8220 e!42456))))

(declare-fun mapKey!2999 () (_ BitVec 32))

(declare-fun mapRest!3000 () (Array (_ BitVec 32) ValueCell!871))

(declare-fun mapValue!3000 () ValueCell!871)

(assert (=> mapNonEmpty!3000 (= (arr!1814 (_values!2106 newMap!16)) (store mapRest!3000 mapKey!2999 mapValue!3000))))

(declare-fun mapIsEmpty!3000 () Bool)

(assert (=> mapIsEmpty!3000 mapRes!3000))

(declare-fun b!64762 () Bool)

(assert (=> b!64762 (= e!42443 e!42452)))

(declare-fun b!64763 () Bool)

(declare-fun res!35290 () Bool)

(assert (=> b!64763 (=> (not res!35290) (not e!42446))))

(declare-fun valid!270 (LongMapFixedSize!650) Bool)

(assert (=> b!64763 (= res!35290 (valid!270 newMap!16))))

(declare-fun b!64764 () Bool)

(declare-fun e!42457 () Bool)

(assert (=> b!64764 (= e!42457 tp_is_empty!2429)))

(declare-fun b!64765 () Bool)

(declare-fun Unit!1790 () Unit!1787)

(assert (=> b!64765 (= e!42458 Unit!1790)))

(declare-fun b!64766 () Bool)

(assert (=> b!64766 (= e!42447 e!42450)))

(declare-fun res!35292 () Bool)

(assert (=> b!64766 (=> (not res!35292) (not e!42450))))

(declare-datatypes ((tuple2!2062 0))(
  ( (tuple2!2063 (_1!1042 Bool) (_2!1042 LongMapFixedSize!650)) )
))
(declare-fun lt!27605 () tuple2!2062)

(assert (=> b!64766 (= res!35292 (and (_1!1042 lt!27605) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!27608 () Unit!1787)

(assert (=> b!64766 (= lt!27608 e!42458)))

(declare-fun c!8850 () Bool)

(declare-fun contains!699 (ListLongMap!1385 (_ BitVec 64)) Bool)

(assert (=> b!64766 (= c!8850 (contains!699 lt!27604 (select (arr!1813 (_keys!3761 (v!2449 (underlying!240 thiss!992)))) from!355)))))

(declare-fun update!82 (LongMapFixedSize!650 (_ BitVec 64) V!2885) tuple2!2062)

(declare-fun get!1097 (ValueCell!871 V!2885) V!2885)

(declare-fun dynLambda!313 (Int (_ BitVec 64)) V!2885)

(assert (=> b!64766 (= lt!27605 (update!82 newMap!16 (select (arr!1813 (_keys!3761 (v!2449 (underlying!240 thiss!992)))) from!355) (get!1097 (select (arr!1814 (_values!2106 (v!2449 (underlying!240 thiss!992)))) from!355) (dynLambda!313 (defaultEntry!2123 (v!2449 (underlying!240 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!64767 () Bool)

(assert (=> b!64767 (= e!42455 (and e!42457 mapRes!2999))))

(declare-fun condMapEmpty!2999 () Bool)

(declare-fun mapDefault!3000 () ValueCell!871)

