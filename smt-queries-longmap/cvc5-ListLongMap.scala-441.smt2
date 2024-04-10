; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8258 () Bool)

(assert start!8258)

(declare-fun b!52769 () Bool)

(declare-fun b_free!1681 () Bool)

(declare-fun b_next!1681 () Bool)

(assert (=> b!52769 (= b_free!1681 (not b_next!1681))))

(declare-fun tp!7144 () Bool)

(declare-fun b_and!2903 () Bool)

(assert (=> b!52769 (= tp!7144 b_and!2903)))

(declare-fun b!52770 () Bool)

(declare-fun b_free!1683 () Bool)

(declare-fun b_next!1683 () Bool)

(assert (=> b!52770 (= b_free!1683 (not b_next!1683))))

(declare-fun tp!7146 () Bool)

(declare-fun b_and!2905 () Bool)

(assert (=> b!52770 (= tp!7146 b_and!2905)))

(declare-fun b!52755 () Bool)

(declare-fun e!34393 () Bool)

(declare-fun tp_is_empty!2257 () Bool)

(assert (=> b!52755 (= e!34393 tp_is_empty!2257)))

(declare-fun res!29955 () Bool)

(declare-fun e!34385 () Bool)

(assert (=> start!8258 (=> (not res!29955) (not e!34385))))

(declare-datatypes ((V!2657 0))(
  ( (V!2658 (val!1173 Int)) )
))
(declare-datatypes ((array!3437 0))(
  ( (array!3438 (arr!1641 (Array (_ BitVec 32) (_ BitVec 64))) (size!1870 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!785 0))(
  ( (ValueCellFull!785 (v!2235 V!2657)) (EmptyCell!785) )
))
(declare-datatypes ((array!3439 0))(
  ( (array!3440 (arr!1642 (Array (_ BitVec 32) ValueCell!785)) (size!1871 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!478 0))(
  ( (LongMapFixedSize!479 (defaultEntry!1953 Int) (mask!5782 (_ BitVec 32)) (extraKeys!1844 (_ BitVec 32)) (zeroValue!1871 V!2657) (minValue!1871 V!2657) (_size!288 (_ BitVec 32)) (_keys!3573 array!3437) (_values!1936 array!3439) (_vacant!288 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!300 0))(
  ( (Cell!301 (v!2236 LongMapFixedSize!478)) )
))
(declare-datatypes ((LongMap!300 0))(
  ( (LongMap!301 (underlying!161 Cell!300)) )
))
(declare-fun thiss!992 () LongMap!300)

(declare-fun valid!177 (LongMap!300) Bool)

(assert (=> start!8258 (= res!29955 (valid!177 thiss!992))))

(assert (=> start!8258 e!34385))

(declare-fun e!34384 () Bool)

(assert (=> start!8258 e!34384))

(assert (=> start!8258 true))

(declare-fun e!34387 () Bool)

(assert (=> start!8258 e!34387))

(declare-fun b!52756 () Bool)

(declare-fun res!29959 () Bool)

(assert (=> b!52756 (=> (not res!29959) (not e!34385))))

(declare-fun newMap!16 () LongMapFixedSize!478)

(declare-fun valid!178 (LongMapFixedSize!478) Bool)

(assert (=> b!52756 (= res!29959 (valid!178 newMap!16))))

(declare-fun b!52757 () Bool)

(declare-fun res!29950 () Bool)

(declare-fun e!34394 () Bool)

(assert (=> b!52757 (=> (not res!29950) (not e!34394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3437 (_ BitVec 32)) Bool)

(assert (=> b!52757 (= res!29950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3573 (v!2236 (underlying!161 thiss!992))) (mask!5782 (v!2236 (underlying!161 thiss!992)))))))

(declare-fun mapIsEmpty!2441 () Bool)

(declare-fun mapRes!2442 () Bool)

(assert (=> mapIsEmpty!2441 mapRes!2442))

(declare-fun b!52758 () Bool)

(assert (=> b!52758 (= e!34394 false)))

(declare-fun lt!21340 () Bool)

(declare-datatypes ((tuple2!1860 0))(
  ( (tuple2!1861 (_1!941 (_ BitVec 64)) (_2!941 V!2657)) )
))
(declare-datatypes ((List!1345 0))(
  ( (Nil!1342) (Cons!1341 (h!1921 tuple2!1860) (t!4395 List!1345)) )
))
(declare-datatypes ((ListLongMap!1271 0))(
  ( (ListLongMap!1272 (toList!651 List!1345)) )
))
(declare-fun lt!21339 () ListLongMap!1271)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!627 (ListLongMap!1271 (_ BitVec 64)) Bool)

(assert (=> b!52758 (= lt!21340 (contains!627 lt!21339 (select (arr!1641 (_keys!3573 (v!2236 (underlying!161 thiss!992)))) from!355)))))

(declare-fun b!52759 () Bool)

(declare-fun e!34397 () Bool)

(assert (=> b!52759 (= e!34397 e!34394)))

(declare-fun res!29956 () Bool)

(assert (=> b!52759 (=> (not res!29956) (not e!34394))))

(declare-fun lt!21341 () ListLongMap!1271)

(assert (=> b!52759 (= res!29956 (contains!627 lt!21341 (select (arr!1641 (_keys!3573 (v!2236 (underlying!161 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1862 0))(
  ( (tuple2!1863 (_1!942 Bool) (_2!942 LongMapFixedSize!478)) )
))
(declare-fun lt!21342 () tuple2!1862)

(declare-fun update!39 (LongMapFixedSize!478 (_ BitVec 64) V!2657) tuple2!1862)

(declare-fun get!981 (ValueCell!785 V!2657) V!2657)

(declare-fun dynLambda!270 (Int (_ BitVec 64)) V!2657)

(assert (=> b!52759 (= lt!21342 (update!39 newMap!16 (select (arr!1641 (_keys!3573 (v!2236 (underlying!161 thiss!992)))) from!355) (get!981 (select (arr!1642 (_values!1936 (v!2236 (underlying!161 thiss!992)))) from!355) (dynLambda!270 (defaultEntry!1953 (v!2236 (underlying!161 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!2442 () Bool)

(declare-fun mapRes!2441 () Bool)

(assert (=> mapIsEmpty!2442 mapRes!2441))

(declare-fun b!52760 () Bool)

(declare-fun e!34392 () Bool)

(assert (=> b!52760 (= e!34392 tp_is_empty!2257)))

(declare-fun b!52761 () Bool)

(declare-fun res!29960 () Bool)

(assert (=> b!52761 (=> (not res!29960) (not e!34394))))

(assert (=> b!52761 (= res!29960 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1870 (_keys!3573 (v!2236 (underlying!161 thiss!992)))))))))

(declare-fun b!52762 () Bool)

(declare-fun res!29952 () Bool)

(assert (=> b!52762 (=> (not res!29952) (not e!34385))))

(assert (=> b!52762 (= res!29952 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1870 (_keys!3573 (v!2236 (underlying!161 thiss!992)))))))))

(declare-fun b!52763 () Bool)

(declare-fun e!34388 () Bool)

(assert (=> b!52763 (= e!34384 e!34388)))

(declare-fun b!52764 () Bool)

(declare-fun e!34389 () Bool)

(assert (=> b!52764 (= e!34389 tp_is_empty!2257)))

(declare-fun b!52765 () Bool)

(declare-fun res!29957 () Bool)

(assert (=> b!52765 (=> (not res!29957) (not e!34394))))

(declare-datatypes ((List!1346 0))(
  ( (Nil!1343) (Cons!1342 (h!1922 (_ BitVec 64)) (t!4396 List!1346)) )
))
(declare-fun arrayNoDuplicates!0 (array!3437 (_ BitVec 32) List!1346) Bool)

(assert (=> b!52765 (= res!29957 (arrayNoDuplicates!0 (_keys!3573 (v!2236 (underlying!161 thiss!992))) #b00000000000000000000000000000000 Nil!1343))))

(declare-fun b!52766 () Bool)

(declare-fun res!29951 () Bool)

(assert (=> b!52766 (=> (not res!29951) (not e!34394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52766 (= res!29951 (validMask!0 (mask!5782 (v!2236 (underlying!161 thiss!992)))))))

(declare-fun b!52767 () Bool)

(declare-fun e!34395 () Bool)

(assert (=> b!52767 (= e!34395 tp_is_empty!2257)))

(declare-fun b!52768 () Bool)

(declare-fun res!29954 () Bool)

(assert (=> b!52768 (=> (not res!29954) (not e!34394))))

(assert (=> b!52768 (= res!29954 (and (= (size!1871 (_values!1936 (v!2236 (underlying!161 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5782 (v!2236 (underlying!161 thiss!992))))) (= (size!1870 (_keys!3573 (v!2236 (underlying!161 thiss!992)))) (size!1871 (_values!1936 (v!2236 (underlying!161 thiss!992))))) (bvsge (mask!5782 (v!2236 (underlying!161 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1844 (v!2236 (underlying!161 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1844 (v!2236 (underlying!161 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun e!34396 () Bool)

(declare-fun e!34386 () Bool)

(declare-fun array_inv!1015 (array!3437) Bool)

(declare-fun array_inv!1016 (array!3439) Bool)

(assert (=> b!52769 (= e!34386 (and tp!7144 tp_is_empty!2257 (array_inv!1015 (_keys!3573 (v!2236 (underlying!161 thiss!992)))) (array_inv!1016 (_values!1936 (v!2236 (underlying!161 thiss!992)))) e!34396))))

(declare-fun e!34390 () Bool)

(assert (=> b!52770 (= e!34387 (and tp!7146 tp_is_empty!2257 (array_inv!1015 (_keys!3573 newMap!16)) (array_inv!1016 (_values!1936 newMap!16)) e!34390))))

(declare-fun b!52771 () Bool)

(assert (=> b!52771 (= e!34385 e!34397)))

(declare-fun res!29958 () Bool)

(assert (=> b!52771 (=> (not res!29958) (not e!34397))))

(assert (=> b!52771 (= res!29958 (and (= lt!21339 lt!21341) (not (= (select (arr!1641 (_keys!3573 (v!2236 (underlying!161 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1641 (_keys!3573 (v!2236 (underlying!161 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1020 (LongMapFixedSize!478) ListLongMap!1271)

(assert (=> b!52771 (= lt!21341 (map!1020 newMap!16))))

(declare-fun getCurrentListMap!363 (array!3437 array!3439 (_ BitVec 32) (_ BitVec 32) V!2657 V!2657 (_ BitVec 32) Int) ListLongMap!1271)

(assert (=> b!52771 (= lt!21339 (getCurrentListMap!363 (_keys!3573 (v!2236 (underlying!161 thiss!992))) (_values!1936 (v!2236 (underlying!161 thiss!992))) (mask!5782 (v!2236 (underlying!161 thiss!992))) (extraKeys!1844 (v!2236 (underlying!161 thiss!992))) (zeroValue!1871 (v!2236 (underlying!161 thiss!992))) (minValue!1871 (v!2236 (underlying!161 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1953 (v!2236 (underlying!161 thiss!992)))))))

(declare-fun b!52772 () Bool)

(assert (=> b!52772 (= e!34388 e!34386)))

(declare-fun b!52773 () Bool)

(assert (=> b!52773 (= e!34396 (and e!34392 mapRes!2441))))

(declare-fun condMapEmpty!2442 () Bool)

(declare-fun mapDefault!2441 () ValueCell!785)

