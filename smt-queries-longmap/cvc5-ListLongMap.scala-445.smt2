; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8282 () Bool)

(assert start!8282)

(declare-fun b!53551 () Bool)

(declare-fun b_free!1729 () Bool)

(declare-fun b_next!1729 () Bool)

(assert (=> b!53551 (= b_free!1729 (not b_next!1729))))

(declare-fun tp!7290 () Bool)

(declare-fun b_and!2999 () Bool)

(assert (=> b!53551 (= tp!7290 b_and!2999)))

(declare-fun b!53555 () Bool)

(declare-fun b_free!1731 () Bool)

(declare-fun b_next!1731 () Bool)

(assert (=> b!53555 (= b_free!1731 (not b_next!1731))))

(declare-fun tp!7288 () Bool)

(declare-fun b_and!3001 () Bool)

(assert (=> b!53555 (= tp!7288 b_and!3001)))

(declare-fun mapNonEmpty!2513 () Bool)

(declare-fun mapRes!2514 () Bool)

(declare-fun tp!7289 () Bool)

(declare-fun e!34926 () Bool)

(assert (=> mapNonEmpty!2513 (= mapRes!2514 (and tp!7289 e!34926))))

(declare-datatypes ((V!2689 0))(
  ( (V!2690 (val!1185 Int)) )
))
(declare-datatypes ((ValueCell!797 0))(
  ( (ValueCellFull!797 (v!2257 V!2689)) (EmptyCell!797) )
))
(declare-fun mapRest!2514 () (Array (_ BitVec 32) ValueCell!797))

(declare-fun mapValue!2514 () ValueCell!797)

(declare-datatypes ((array!3485 0))(
  ( (array!3486 (arr!1665 (Array (_ BitVec 32) (_ BitVec 64))) (size!1894 (_ BitVec 32))) )
))
(declare-datatypes ((array!3487 0))(
  ( (array!3488 (arr!1666 (Array (_ BitVec 32) ValueCell!797)) (size!1895 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!502 0))(
  ( (LongMapFixedSize!503 (defaultEntry!1965 Int) (mask!5802 (_ BitVec 32)) (extraKeys!1856 (_ BitVec 32)) (zeroValue!1883 V!2689) (minValue!1883 V!2689) (_size!300 (_ BitVec 32)) (_keys!3585 array!3485) (_values!1948 array!3487) (_vacant!300 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!502)

(declare-fun mapKey!2514 () (_ BitVec 32))

(assert (=> mapNonEmpty!2513 (= (arr!1666 (_values!1948 newMap!16)) (store mapRest!2514 mapKey!2514 mapValue!2514))))

(declare-fun b!53535 () Bool)

(declare-fun e!34929 () Bool)

(declare-fun e!34923 () Bool)

(assert (=> b!53535 (= e!34929 e!34923)))

(declare-fun res!30350 () Bool)

(assert (=> b!53535 (=> (not res!30350) (not e!34923))))

(declare-datatypes ((tuple2!1888 0))(
  ( (tuple2!1889 (_1!955 (_ BitVec 64)) (_2!955 V!2689)) )
))
(declare-datatypes ((List!1359 0))(
  ( (Nil!1356) (Cons!1355 (h!1935 tuple2!1888) (t!4457 List!1359)) )
))
(declare-datatypes ((ListLongMap!1289 0))(
  ( (ListLongMap!1290 (toList!660 List!1359)) )
))
(declare-fun lt!21484 () ListLongMap!1289)

(declare-datatypes ((Cell!320 0))(
  ( (Cell!321 (v!2258 LongMapFixedSize!502)) )
))
(declare-datatypes ((LongMap!320 0))(
  ( (LongMap!321 (underlying!171 Cell!320)) )
))
(declare-fun thiss!992 () LongMap!320)

(declare-fun lt!21486 () ListLongMap!1289)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!53535 (= res!30350 (and (= lt!21486 lt!21484) (not (= (select (arr!1665 (_keys!3585 (v!2258 (underlying!171 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1665 (_keys!3585 (v!2258 (underlying!171 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1036 (LongMapFixedSize!502) ListLongMap!1289)

(assert (=> b!53535 (= lt!21484 (map!1036 newMap!16))))

(declare-fun getCurrentListMap!371 (array!3485 array!3487 (_ BitVec 32) (_ BitVec 32) V!2689 V!2689 (_ BitVec 32) Int) ListLongMap!1289)

(assert (=> b!53535 (= lt!21486 (getCurrentListMap!371 (_keys!3585 (v!2258 (underlying!171 thiss!992))) (_values!1948 (v!2258 (underlying!171 thiss!992))) (mask!5802 (v!2258 (underlying!171 thiss!992))) (extraKeys!1856 (v!2258 (underlying!171 thiss!992))) (zeroValue!1883 (v!2258 (underlying!171 thiss!992))) (minValue!1883 (v!2258 (underlying!171 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1965 (v!2258 (underlying!171 thiss!992)))))))

(declare-fun b!53536 () Bool)

(declare-fun res!30356 () Bool)

(assert (=> b!53536 (=> (not res!30356) (not e!34929))))

(declare-fun valid!189 (LongMapFixedSize!502) Bool)

(assert (=> b!53536 (= res!30356 (valid!189 newMap!16))))

(declare-fun b!53537 () Bool)

(declare-fun e!34933 () Bool)

(declare-fun e!34931 () Bool)

(assert (=> b!53537 (= e!34933 e!34931)))

(declare-fun b!53538 () Bool)

(declare-fun res!30354 () Bool)

(declare-fun e!34936 () Bool)

(assert (=> b!53538 (=> (not res!30354) (not e!34936))))

(assert (=> b!53538 (= res!30354 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1894 (_keys!3585 (v!2258 (underlying!171 thiss!992)))))))))

(declare-fun b!53539 () Bool)

(declare-fun e!34932 () Bool)

(declare-fun tp_is_empty!2281 () Bool)

(assert (=> b!53539 (= e!34932 tp_is_empty!2281)))

(declare-fun mapIsEmpty!2513 () Bool)

(declare-fun mapRes!2513 () Bool)

(assert (=> mapIsEmpty!2513 mapRes!2513))

(declare-fun b!53540 () Bool)

(declare-fun res!30351 () Bool)

(assert (=> b!53540 (=> (not res!30351) (not e!34929))))

(assert (=> b!53540 (= res!30351 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5802 newMap!16)) (_size!300 (v!2258 (underlying!171 thiss!992)))))))

(declare-fun b!53541 () Bool)

(declare-fun e!34934 () Bool)

(assert (=> b!53541 (= e!34934 tp_is_empty!2281)))

(declare-fun b!53542 () Bool)

(declare-fun res!30353 () Bool)

(assert (=> b!53542 (=> (not res!30353) (not e!34936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53542 (= res!30353 (validMask!0 (mask!5802 (v!2258 (underlying!171 thiss!992)))))))

(declare-fun b!53543 () Bool)

(declare-fun e!34928 () Bool)

(assert (=> b!53543 (= e!34928 tp_is_empty!2281)))

(declare-fun b!53545 () Bool)

(assert (=> b!53545 (= e!34936 false)))

(declare-fun lt!21483 () Bool)

(declare-fun contains!635 (ListLongMap!1289 (_ BitVec 64)) Bool)

(assert (=> b!53545 (= lt!21483 (contains!635 lt!21486 (select (arr!1665 (_keys!3585 (v!2258 (underlying!171 thiss!992)))) from!355)))))

(declare-fun b!53546 () Bool)

(declare-fun e!34930 () Bool)

(assert (=> b!53546 (= e!34930 e!34933)))

(declare-fun b!53547 () Bool)

(assert (=> b!53547 (= e!34926 tp_is_empty!2281)))

(declare-fun b!53548 () Bool)

(declare-fun res!30346 () Bool)

(assert (=> b!53548 (=> (not res!30346) (not e!34936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3485 (_ BitVec 32)) Bool)

(assert (=> b!53548 (= res!30346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3585 (v!2258 (underlying!171 thiss!992))) (mask!5802 (v!2258 (underlying!171 thiss!992)))))))

(declare-fun mapIsEmpty!2514 () Bool)

(assert (=> mapIsEmpty!2514 mapRes!2514))

(declare-fun b!53549 () Bool)

(declare-fun res!30348 () Bool)

(assert (=> b!53549 (=> (not res!30348) (not e!34936))))

(assert (=> b!53549 (= res!30348 (and (= (size!1895 (_values!1948 (v!2258 (underlying!171 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5802 (v!2258 (underlying!171 thiss!992))))) (= (size!1894 (_keys!3585 (v!2258 (underlying!171 thiss!992)))) (size!1895 (_values!1948 (v!2258 (underlying!171 thiss!992))))) (bvsge (mask!5802 (v!2258 (underlying!171 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1856 (v!2258 (underlying!171 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1856 (v!2258 (underlying!171 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun res!30355 () Bool)

(assert (=> start!8282 (=> (not res!30355) (not e!34929))))

(declare-fun valid!190 (LongMap!320) Bool)

(assert (=> start!8282 (= res!30355 (valid!190 thiss!992))))

(assert (=> start!8282 e!34929))

(assert (=> start!8282 e!34930))

(assert (=> start!8282 true))

(declare-fun e!34927 () Bool)

(assert (=> start!8282 e!34927))

(declare-fun b!53544 () Bool)

(declare-fun e!34924 () Bool)

(assert (=> b!53544 (= e!34924 (and e!34932 mapRes!2514))))

(declare-fun condMapEmpty!2513 () Bool)

(declare-fun mapDefault!2513 () ValueCell!797)

