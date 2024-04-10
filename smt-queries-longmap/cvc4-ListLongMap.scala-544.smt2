; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14262 () Bool)

(assert start!14262)

(declare-fun b!132380 () Bool)

(declare-fun b_free!2925 () Bool)

(declare-fun b_next!2925 () Bool)

(assert (=> b!132380 (= b_free!2925 (not b_next!2925))))

(declare-fun tp!11219 () Bool)

(declare-fun b_and!8203 () Bool)

(assert (=> b!132380 (= tp!11219 b_and!8203)))

(declare-fun b!132376 () Bool)

(declare-fun b_free!2927 () Bool)

(declare-fun b_next!2927 () Bool)

(assert (=> b!132376 (= b_free!2927 (not b_next!2927))))

(declare-fun tp!11217 () Bool)

(declare-fun b_and!8205 () Bool)

(assert (=> b!132376 (= tp!11217 b_and!8205)))

(declare-fun b!132362 () Bool)

(declare-fun res!63769 () Bool)

(declare-fun e!86323 () Bool)

(assert (=> b!132362 (=> (not res!63769) (not e!86323))))

(declare-datatypes ((V!3485 0))(
  ( (V!3486 (val!1484 Int)) )
))
(declare-datatypes ((array!4785 0))(
  ( (array!4786 (arr!2263 (Array (_ BitVec 32) (_ BitVec 64))) (size!2532 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1096 0))(
  ( (ValueCellFull!1096 (v!3200 V!3485)) (EmptyCell!1096) )
))
(declare-datatypes ((array!4787 0))(
  ( (array!4788 (arr!2264 (Array (_ BitVec 32) ValueCell!1096)) (size!2533 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1100 0))(
  ( (LongMapFixedSize!1101 (defaultEntry!2866 Int) (mask!7166 (_ BitVec 32)) (extraKeys!2631 (_ BitVec 32)) (zeroValue!2721 V!3485) (minValue!2721 V!3485) (_size!599 (_ BitVec 32)) (_keys!4615 array!4785) (_values!2849 array!4787) (_vacant!599 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!890 0))(
  ( (Cell!891 (v!3201 LongMapFixedSize!1100)) )
))
(declare-datatypes ((LongMap!890 0))(
  ( (LongMap!891 (underlying!456 Cell!890)) )
))
(declare-fun thiss!992 () LongMap!890)

(declare-datatypes ((List!1718 0))(
  ( (Nil!1715) (Cons!1714 (h!2319 (_ BitVec 64)) (t!6173 List!1718)) )
))
(declare-fun arrayNoDuplicates!0 (array!4785 (_ BitVec 32) List!1718) Bool)

(assert (=> b!132362 (= res!63769 (arrayNoDuplicates!0 (_keys!4615 (v!3201 (underlying!456 thiss!992))) #b00000000000000000000000000000000 Nil!1715))))

(declare-fun b!132363 () Bool)

(declare-fun e!86316 () Bool)

(declare-fun tp_is_empty!2879 () Bool)

(assert (=> b!132363 (= e!86316 tp_is_empty!2879)))

(declare-fun b!132364 () Bool)

(declare-fun res!63773 () Bool)

(assert (=> b!132364 (=> (not res!63773) (not e!86323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!132364 (= res!63773 (validMask!0 (mask!7166 (v!3201 (underlying!456 thiss!992)))))))

(declare-fun b!132365 () Bool)

(declare-fun res!63771 () Bool)

(assert (=> b!132365 (=> (not res!63771) (not e!86323))))

(assert (=> b!132365 (= res!63771 (and (= (size!2533 (_values!2849 (v!3201 (underlying!456 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7166 (v!3201 (underlying!456 thiss!992))))) (= (size!2532 (_keys!4615 (v!3201 (underlying!456 thiss!992)))) (size!2533 (_values!2849 (v!3201 (underlying!456 thiss!992))))) (bvsge (mask!7166 (v!3201 (underlying!456 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2631 (v!3201 (underlying!456 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2631 (v!3201 (underlying!456 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!4649 () Bool)

(declare-fun mapRes!4650 () Bool)

(declare-fun tp!11220 () Bool)

(declare-fun e!86318 () Bool)

(assert (=> mapNonEmpty!4649 (= mapRes!4650 (and tp!11220 e!86318))))

(declare-fun mapRest!4650 () (Array (_ BitVec 32) ValueCell!1096))

(declare-fun newMap!16 () LongMapFixedSize!1100)

(declare-fun mapValue!4650 () ValueCell!1096)

(declare-fun mapKey!4649 () (_ BitVec 32))

(assert (=> mapNonEmpty!4649 (= (arr!2264 (_values!2849 newMap!16)) (store mapRest!4650 mapKey!4649 mapValue!4650))))

(declare-fun b!132366 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!132366 (= e!86323 (or (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2532 (_keys!4615 (v!3201 (underlying!456 thiss!992)))))))))

(declare-fun b!132367 () Bool)

(declare-fun res!63766 () Bool)

(assert (=> b!132367 (=> (not res!63766) (not e!86323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4785 (_ BitVec 32)) Bool)

(assert (=> b!132367 (= res!63766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4615 (v!3201 (underlying!456 thiss!992))) (mask!7166 (v!3201 (underlying!456 thiss!992)))))))

(declare-fun b!132368 () Bool)

(declare-fun e!86322 () Bool)

(declare-fun e!86317 () Bool)

(assert (=> b!132368 (= e!86322 e!86317)))

(declare-fun b!132369 () Bool)

(declare-fun e!86313 () Bool)

(assert (=> b!132369 (= e!86313 tp_is_empty!2879)))

(declare-fun res!63764 () Bool)

(declare-fun e!86314 () Bool)

(assert (=> start!14262 (=> (not res!63764) (not e!86314))))

(declare-fun valid!525 (LongMap!890) Bool)

(assert (=> start!14262 (= res!63764 (valid!525 thiss!992))))

(assert (=> start!14262 e!86314))

(assert (=> start!14262 e!86322))

(assert (=> start!14262 true))

(declare-fun e!86311 () Bool)

(assert (=> start!14262 e!86311))

(declare-fun b!132370 () Bool)

(declare-fun res!63772 () Bool)

(assert (=> b!132370 (=> (not res!63772) (not e!86314))))

(assert (=> b!132370 (= res!63772 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7166 newMap!16)) (_size!599 (v!3201 (underlying!456 thiss!992)))))))

(declare-fun b!132371 () Bool)

(declare-fun e!86324 () Bool)

(assert (=> b!132371 (= e!86324 tp_is_empty!2879)))

(declare-fun b!132372 () Bool)

(declare-fun res!63765 () Bool)

(assert (=> b!132372 (=> (not res!63765) (not e!86314))))

(declare-fun valid!526 (LongMapFixedSize!1100) Bool)

(assert (=> b!132372 (= res!63765 (valid!526 newMap!16))))

(declare-fun mapIsEmpty!4649 () Bool)

(assert (=> mapIsEmpty!4649 mapRes!4650))

(declare-fun b!132373 () Bool)

(declare-fun e!86320 () Bool)

(assert (=> b!132373 (= e!86314 e!86320)))

(declare-fun res!63767 () Bool)

(assert (=> b!132373 (=> (not res!63767) (not e!86320))))

(declare-datatypes ((tuple2!2630 0))(
  ( (tuple2!2631 (_1!1326 (_ BitVec 64)) (_2!1326 V!3485)) )
))
(declare-datatypes ((List!1719 0))(
  ( (Nil!1716) (Cons!1715 (h!2320 tuple2!2630) (t!6174 List!1719)) )
))
(declare-datatypes ((ListLongMap!1709 0))(
  ( (ListLongMap!1710 (toList!870 List!1719)) )
))
(declare-fun lt!69032 () ListLongMap!1709)

(declare-fun lt!69031 () ListLongMap!1709)

(assert (=> b!132373 (= res!63767 (and (= lt!69032 lt!69031) (not (= (select (arr!2263 (_keys!4615 (v!3201 (underlying!456 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2263 (_keys!4615 (v!3201 (underlying!456 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1410 (LongMapFixedSize!1100) ListLongMap!1709)

(assert (=> b!132373 (= lt!69031 (map!1410 newMap!16))))

(declare-fun getCurrentListMap!547 (array!4785 array!4787 (_ BitVec 32) (_ BitVec 32) V!3485 V!3485 (_ BitVec 32) Int) ListLongMap!1709)

(assert (=> b!132373 (= lt!69032 (getCurrentListMap!547 (_keys!4615 (v!3201 (underlying!456 thiss!992))) (_values!2849 (v!3201 (underlying!456 thiss!992))) (mask!7166 (v!3201 (underlying!456 thiss!992))) (extraKeys!2631 (v!3201 (underlying!456 thiss!992))) (zeroValue!2721 (v!3201 (underlying!456 thiss!992))) (minValue!2721 (v!3201 (underlying!456 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2866 (v!3201 (underlying!456 thiss!992)))))))

(declare-fun mapNonEmpty!4650 () Bool)

(declare-fun mapRes!4649 () Bool)

(declare-fun tp!11218 () Bool)

(assert (=> mapNonEmpty!4650 (= mapRes!4649 (and tp!11218 e!86313))))

(declare-fun mapKey!4650 () (_ BitVec 32))

(declare-fun mapValue!4649 () ValueCell!1096)

(declare-fun mapRest!4649 () (Array (_ BitVec 32) ValueCell!1096))

(assert (=> mapNonEmpty!4650 (= (arr!2264 (_values!2849 (v!3201 (underlying!456 thiss!992)))) (store mapRest!4649 mapKey!4650 mapValue!4649))))

(declare-fun mapIsEmpty!4650 () Bool)

(assert (=> mapIsEmpty!4650 mapRes!4649))

(declare-fun b!132374 () Bool)

(assert (=> b!132374 (= e!86320 e!86323)))

(declare-fun res!63770 () Bool)

(assert (=> b!132374 (=> (not res!63770) (not e!86323))))

(declare-fun contains!900 (ListLongMap!1709 (_ BitVec 64)) Bool)

(assert (=> b!132374 (= res!63770 (contains!900 lt!69031 (select (arr!2263 (_keys!4615 (v!3201 (underlying!456 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2632 0))(
  ( (tuple2!2633 (_1!1327 Bool) (_2!1327 LongMapFixedSize!1100)) )
))
(declare-fun lt!69030 () tuple2!2632)

(declare-fun update!195 (LongMapFixedSize!1100 (_ BitVec 64) V!3485) tuple2!2632)

(declare-fun get!1483 (ValueCell!1096 V!3485) V!3485)

(declare-fun dynLambda!426 (Int (_ BitVec 64)) V!3485)

(assert (=> b!132374 (= lt!69030 (update!195 newMap!16 (select (arr!2263 (_keys!4615 (v!3201 (underlying!456 thiss!992)))) from!355) (get!1483 (select (arr!2264 (_values!2849 (v!3201 (underlying!456 thiss!992)))) from!355) (dynLambda!426 (defaultEntry!2866 (v!3201 (underlying!456 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!132375 () Bool)

(declare-fun e!86321 () Bool)

(assert (=> b!132375 (= e!86321 (and e!86316 mapRes!4649))))

(declare-fun condMapEmpty!4649 () Bool)

(declare-fun mapDefault!4649 () ValueCell!1096)

