; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8312 () Bool)

(assert start!8312)

(declare-fun b!54511 () Bool)

(declare-fun b_free!1789 () Bool)

(declare-fun b_next!1789 () Bool)

(assert (=> b!54511 (= b_free!1789 (not b_next!1789))))

(declare-fun tp!7467 () Bool)

(declare-fun b_and!3119 () Bool)

(assert (=> b!54511 (= tp!7467 b_and!3119)))

(declare-fun b!54507 () Bool)

(declare-fun b_free!1791 () Bool)

(declare-fun b_next!1791 () Bool)

(assert (=> b!54507 (= b_free!1791 (not b_next!1791))))

(declare-fun tp!7470 () Bool)

(declare-fun b_and!3121 () Bool)

(assert (=> b!54507 (= tp!7470 b_and!3121)))

(declare-fun b!54502 () Bool)

(declare-fun e!35615 () Bool)

(declare-fun tp_is_empty!2311 () Bool)

(assert (=> b!54502 (= e!35615 tp_is_empty!2311)))

(declare-fun b!54503 () Bool)

(declare-fun e!35602 () Bool)

(assert (=> b!54503 (= e!35602 tp_is_empty!2311)))

(declare-fun b!54504 () Bool)

(declare-fun res!30839 () Bool)

(declare-fun e!35606 () Bool)

(assert (=> b!54504 (=> (not res!30839) (not e!35606))))

(declare-datatypes ((V!2729 0))(
  ( (V!2730 (val!1200 Int)) )
))
(declare-datatypes ((array!3545 0))(
  ( (array!3546 (arr!1695 (Array (_ BitVec 32) (_ BitVec 64))) (size!1924 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!812 0))(
  ( (ValueCellFull!812 (v!2286 V!2729)) (EmptyCell!812) )
))
(declare-datatypes ((array!3547 0))(
  ( (array!3548 (arr!1696 (Array (_ BitVec 32) ValueCell!812)) (size!1925 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!532 0))(
  ( (LongMapFixedSize!533 (defaultEntry!1980 Int) (mask!5827 (_ BitVec 32)) (extraKeys!1871 (_ BitVec 32)) (zeroValue!1898 V!2729) (minValue!1898 V!2729) (_size!315 (_ BitVec 32)) (_keys!3600 array!3545) (_values!1963 array!3547) (_vacant!315 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!532)

(declare-datatypes ((Cell!348 0))(
  ( (Cell!349 (v!2287 LongMapFixedSize!532)) )
))
(declare-datatypes ((LongMap!348 0))(
  ( (LongMap!349 (underlying!185 Cell!348)) )
))
(declare-fun thiss!992 () LongMap!348)

(assert (=> b!54504 (= res!30839 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5827 newMap!16)) (_size!315 (v!2287 (underlying!185 thiss!992)))))))

(declare-fun b!54505 () Bool)

(declare-fun e!35601 () Bool)

(assert (=> b!54505 (= e!35601 true)))

(declare-fun lt!21668 () Bool)

(declare-datatypes ((List!1374 0))(
  ( (Nil!1371) (Cons!1370 (h!1950 (_ BitVec 64)) (t!4532 List!1374)) )
))
(declare-fun arrayNoDuplicates!0 (array!3545 (_ BitVec 32) List!1374) Bool)

(assert (=> b!54505 (= lt!21668 (arrayNoDuplicates!0 (_keys!3600 (v!2287 (underlying!185 thiss!992))) #b00000000000000000000000000000000 Nil!1371))))

(declare-fun mapIsEmpty!2603 () Bool)

(declare-fun mapRes!2604 () Bool)

(assert (=> mapIsEmpty!2603 mapRes!2604))

(declare-fun b!54506 () Bool)

(declare-fun e!35604 () Bool)

(assert (=> b!54506 (= e!35604 tp_is_empty!2311)))

(declare-fun res!30834 () Bool)

(assert (=> start!8312 (=> (not res!30834) (not e!35606))))

(declare-fun valid!206 (LongMap!348) Bool)

(assert (=> start!8312 (= res!30834 (valid!206 thiss!992))))

(assert (=> start!8312 e!35606))

(declare-fun e!35603 () Bool)

(assert (=> start!8312 e!35603))

(assert (=> start!8312 true))

(declare-fun e!35609 () Bool)

(assert (=> start!8312 e!35609))

(declare-fun mapIsEmpty!2604 () Bool)

(declare-fun mapRes!2603 () Bool)

(assert (=> mapIsEmpty!2604 mapRes!2603))

(declare-fun mapNonEmpty!2603 () Bool)

(declare-fun tp!7468 () Bool)

(declare-fun e!35607 () Bool)

(assert (=> mapNonEmpty!2603 (= mapRes!2603 (and tp!7468 e!35607))))

(declare-fun mapValue!2603 () ValueCell!812)

(declare-fun mapRest!2604 () (Array (_ BitVec 32) ValueCell!812))

(declare-fun mapKey!2604 () (_ BitVec 32))

(assert (=> mapNonEmpty!2603 (= (arr!1696 (_values!1963 newMap!16)) (store mapRest!2604 mapKey!2604 mapValue!2603))))

(declare-fun e!35614 () Bool)

(declare-fun array_inv!1047 (array!3545) Bool)

(declare-fun array_inv!1048 (array!3547) Bool)

(assert (=> b!54507 (= e!35609 (and tp!7470 tp_is_empty!2311 (array_inv!1047 (_keys!3600 newMap!16)) (array_inv!1048 (_values!1963 newMap!16)) e!35614))))

(declare-fun b!54508 () Bool)

(declare-fun e!35600 () Bool)

(assert (=> b!54508 (= e!35603 e!35600)))

(declare-fun b!54509 () Bool)

(declare-fun e!35613 () Bool)

(assert (=> b!54509 (= e!35606 e!35613)))

(declare-fun res!30835 () Bool)

(assert (=> b!54509 (=> (not res!30835) (not e!35613))))

(declare-datatypes ((tuple2!1922 0))(
  ( (tuple2!1923 (_1!972 (_ BitVec 64)) (_2!972 V!2729)) )
))
(declare-datatypes ((List!1375 0))(
  ( (Nil!1372) (Cons!1371 (h!1951 tuple2!1922) (t!4533 List!1375)) )
))
(declare-datatypes ((ListLongMap!1309 0))(
  ( (ListLongMap!1310 (toList!670 List!1375)) )
))
(declare-fun lt!21666 () ListLongMap!1309)

(declare-fun lt!21669 () ListLongMap!1309)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54509 (= res!30835 (and (= lt!21666 lt!21669) (not (= (select (arr!1695 (_keys!3600 (v!2287 (underlying!185 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1695 (_keys!3600 (v!2287 (underlying!185 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1055 (LongMapFixedSize!532) ListLongMap!1309)

(assert (=> b!54509 (= lt!21669 (map!1055 newMap!16))))

(declare-fun getCurrentListMap!380 (array!3545 array!3547 (_ BitVec 32) (_ BitVec 32) V!2729 V!2729 (_ BitVec 32) Int) ListLongMap!1309)

(assert (=> b!54509 (= lt!21666 (getCurrentListMap!380 (_keys!3600 (v!2287 (underlying!185 thiss!992))) (_values!1963 (v!2287 (underlying!185 thiss!992))) (mask!5827 (v!2287 (underlying!185 thiss!992))) (extraKeys!1871 (v!2287 (underlying!185 thiss!992))) (zeroValue!1898 (v!2287 (underlying!185 thiss!992))) (minValue!1898 (v!2287 (underlying!185 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1980 (v!2287 (underlying!185 thiss!992)))))))

(declare-fun b!54510 () Bool)

(declare-fun res!30838 () Bool)

(assert (=> b!54510 (=> (not res!30838) (not e!35606))))

(declare-fun valid!207 (LongMapFixedSize!532) Bool)

(assert (=> b!54510 (= res!30838 (valid!207 newMap!16))))

(declare-fun mapNonEmpty!2604 () Bool)

(declare-fun tp!7469 () Bool)

(assert (=> mapNonEmpty!2604 (= mapRes!2604 (and tp!7469 e!35604))))

(declare-fun mapValue!2604 () ValueCell!812)

(declare-fun mapRest!2603 () (Array (_ BitVec 32) ValueCell!812))

(declare-fun mapKey!2603 () (_ BitVec 32))

(assert (=> mapNonEmpty!2604 (= (arr!1696 (_values!1963 (v!2287 (underlying!185 thiss!992)))) (store mapRest!2603 mapKey!2603 mapValue!2604))))

(declare-fun e!35605 () Bool)

(declare-fun e!35612 () Bool)

(assert (=> b!54511 (= e!35612 (and tp!7467 tp_is_empty!2311 (array_inv!1047 (_keys!3600 (v!2287 (underlying!185 thiss!992)))) (array_inv!1048 (_values!1963 (v!2287 (underlying!185 thiss!992)))) e!35605))))

(declare-fun b!54512 () Bool)

(declare-fun e!35608 () Bool)

(assert (=> b!54512 (= e!35608 (not e!35601))))

(declare-fun res!30837 () Bool)

(assert (=> b!54512 (=> res!30837 e!35601)))

(assert (=> b!54512 (= res!30837 (or (bvsge (size!1924 (_keys!3600 (v!2287 (underlying!185 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1924 (_keys!3600 (v!2287 (underlying!185 thiss!992))))) (bvsgt from!355 (size!1924 (_keys!3600 (v!2287 (underlying!185 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54512 (arrayContainsKey!0 (_keys!3600 (v!2287 (underlying!185 thiss!992))) (select (arr!1695 (_keys!3600 (v!2287 (underlying!185 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1431 0))(
  ( (Unit!1432) )
))
(declare-fun lt!21667 () Unit!1431)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!5 (array!3545 array!3547 (_ BitVec 32) (_ BitVec 32) V!2729 V!2729 (_ BitVec 64) (_ BitVec 32) Int) Unit!1431)

(assert (=> b!54512 (= lt!21667 (lemmaListMapContainsThenArrayContainsFrom!5 (_keys!3600 (v!2287 (underlying!185 thiss!992))) (_values!1963 (v!2287 (underlying!185 thiss!992))) (mask!5827 (v!2287 (underlying!185 thiss!992))) (extraKeys!1871 (v!2287 (underlying!185 thiss!992))) (zeroValue!1898 (v!2287 (underlying!185 thiss!992))) (minValue!1898 (v!2287 (underlying!185 thiss!992))) (select (arr!1695 (_keys!3600 (v!2287 (underlying!185 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1980 (v!2287 (underlying!185 thiss!992)))))))

(declare-fun b!54513 () Bool)

(declare-fun res!30836 () Bool)

(assert (=> b!54513 (=> (not res!30836) (not e!35606))))

(assert (=> b!54513 (= res!30836 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1924 (_keys!3600 (v!2287 (underlying!185 thiss!992)))))))))

(declare-fun b!54514 () Bool)

(assert (=> b!54514 (= e!35600 e!35612)))

(declare-fun b!54515 () Bool)

(assert (=> b!54515 (= e!35607 tp_is_empty!2311)))

(declare-fun b!54516 () Bool)

(assert (=> b!54516 (= e!35613 e!35608)))

(declare-fun res!30833 () Bool)

(assert (=> b!54516 (=> (not res!30833) (not e!35608))))

(declare-fun contains!643 (ListLongMap!1309 (_ BitVec 64)) Bool)

(assert (=> b!54516 (= res!30833 (contains!643 lt!21669 (select (arr!1695 (_keys!3600 (v!2287 (underlying!185 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1924 0))(
  ( (tuple2!1925 (_1!973 Bool) (_2!973 LongMapFixedSize!532)) )
))
(declare-fun lt!21665 () tuple2!1924)

(declare-fun update!51 (LongMapFixedSize!532 (_ BitVec 64) V!2729) tuple2!1924)

(declare-fun get!1011 (ValueCell!812 V!2729) V!2729)

(declare-fun dynLambda!282 (Int (_ BitVec 64)) V!2729)

(assert (=> b!54516 (= lt!21665 (update!51 newMap!16 (select (arr!1695 (_keys!3600 (v!2287 (underlying!185 thiss!992)))) from!355) (get!1011 (select (arr!1696 (_values!1963 (v!2287 (underlying!185 thiss!992)))) from!355) (dynLambda!282 (defaultEntry!1980 (v!2287 (underlying!185 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54517 () Bool)

(assert (=> b!54517 (= e!35605 (and e!35602 mapRes!2604))))

(declare-fun condMapEmpty!2604 () Bool)

(declare-fun mapDefault!2604 () ValueCell!812)

