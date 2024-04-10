; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80302 () Bool)

(assert start!80302)

(declare-fun b!943407 () Bool)

(declare-fun b_free!18001 () Bool)

(declare-fun b_next!18001 () Bool)

(assert (=> b!943407 (= b_free!18001 (not b_next!18001))))

(declare-fun tp!62508 () Bool)

(declare-fun b_and!29413 () Bool)

(assert (=> b!943407 (= tp!62508 b_and!29413)))

(declare-fun b!943399 () Bool)

(declare-fun e!530424 () Bool)

(declare-fun tp_is_empty!20509 () Bool)

(assert (=> b!943399 (= e!530424 tp_is_empty!20509)))

(declare-fun b!943400 () Bool)

(declare-fun res!633904 () Bool)

(declare-fun e!530421 () Bool)

(assert (=> b!943400 (=> (not res!633904) (not e!530421))))

(declare-datatypes ((V!32311 0))(
  ( (V!32312 (val!10305 Int)) )
))
(declare-datatypes ((ValueCell!9773 0))(
  ( (ValueCellFull!9773 (v!12836 V!32311)) (EmptyCell!9773) )
))
(declare-datatypes ((array!56984 0))(
  ( (array!56985 (arr!27418 (Array (_ BitVec 32) ValueCell!9773)) (size!27883 (_ BitVec 32))) )
))
(declare-datatypes ((array!56986 0))(
  ( (array!56987 (arr!27419 (Array (_ BitVec 32) (_ BitVec 64))) (size!27884 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4696 0))(
  ( (LongMapFixedSize!4697 (defaultEntry!5639 Int) (mask!27267 (_ BitVec 32)) (extraKeys!5371 (_ BitVec 32)) (zeroValue!5475 V!32311) (minValue!5475 V!32311) (_size!2403 (_ BitVec 32)) (_keys!10513 array!56986) (_values!5662 array!56984) (_vacant!2403 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4696)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13440 0))(
  ( (tuple2!13441 (_1!6731 (_ BitVec 64)) (_2!6731 V!32311)) )
))
(declare-datatypes ((List!19250 0))(
  ( (Nil!19247) (Cons!19246 (h!20396 tuple2!13440) (t!27565 List!19250)) )
))
(declare-datatypes ((ListLongMap!12137 0))(
  ( (ListLongMap!12138 (toList!6084 List!19250)) )
))
(declare-fun contains!5154 (ListLongMap!12137 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3318 (array!56986 array!56984 (_ BitVec 32) (_ BitVec 32) V!32311 V!32311 (_ BitVec 32) Int) ListLongMap!12137)

(assert (=> b!943400 (= res!633904 (contains!5154 (getCurrentListMap!3318 (_keys!10513 thiss!1141) (_values!5662 thiss!1141) (mask!27267 thiss!1141) (extraKeys!5371 thiss!1141) (zeroValue!5475 thiss!1141) (minValue!5475 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5639 thiss!1141)) key!756))))

(declare-fun b!943401 () Bool)

(declare-fun res!633903 () Bool)

(assert (=> b!943401 (=> (not res!633903) (not e!530421))))

(assert (=> b!943401 (= res!633903 (and (= (size!27883 (_values!5662 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27267 thiss!1141))) (= (size!27884 (_keys!10513 thiss!1141)) (size!27883 (_values!5662 thiss!1141))) (bvsge (mask!27267 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5371 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5371 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32585 () Bool)

(declare-fun mapRes!32585 () Bool)

(assert (=> mapIsEmpty!32585 mapRes!32585))

(declare-fun b!943402 () Bool)

(declare-fun res!633902 () Bool)

(assert (=> b!943402 (=> (not res!633902) (not e!530421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943402 (= res!633902 (validMask!0 (mask!27267 thiss!1141)))))

(declare-fun res!633901 () Bool)

(assert (=> start!80302 (=> (not res!633901) (not e!530421))))

(declare-fun valid!1795 (LongMapFixedSize!4696) Bool)

(assert (=> start!80302 (= res!633901 (valid!1795 thiss!1141))))

(assert (=> start!80302 e!530421))

(declare-fun e!530423 () Bool)

(assert (=> start!80302 e!530423))

(assert (=> start!80302 true))

(declare-fun b!943403 () Bool)

(declare-fun res!633899 () Bool)

(assert (=> b!943403 (=> (not res!633899) (not e!530421))))

(declare-datatypes ((SeekEntryResult!9050 0))(
  ( (MissingZero!9050 (index!38571 (_ BitVec 32))) (Found!9050 (index!38572 (_ BitVec 32))) (Intermediate!9050 (undefined!9862 Bool) (index!38573 (_ BitVec 32)) (x!81019 (_ BitVec 32))) (Undefined!9050) (MissingVacant!9050 (index!38574 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56986 (_ BitVec 32)) SeekEntryResult!9050)

(assert (=> b!943403 (= res!633899 (not (is-Found!9050 (seekEntry!0 key!756 (_keys!10513 thiss!1141) (mask!27267 thiss!1141)))))))

(declare-fun b!943404 () Bool)

(declare-fun res!633905 () Bool)

(assert (=> b!943404 (=> (not res!633905) (not e!530421))))

(assert (=> b!943404 (= res!633905 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943405 () Bool)

(assert (=> b!943405 (= e!530421 false)))

(declare-fun lt!425251 () Bool)

(declare-datatypes ((List!19251 0))(
  ( (Nil!19248) (Cons!19247 (h!20397 (_ BitVec 64)) (t!27566 List!19251)) )
))
(declare-fun arrayNoDuplicates!0 (array!56986 (_ BitVec 32) List!19251) Bool)

(assert (=> b!943405 (= lt!425251 (arrayNoDuplicates!0 (_keys!10513 thiss!1141) #b00000000000000000000000000000000 Nil!19248))))

(declare-fun b!943406 () Bool)

(declare-fun e!530419 () Bool)

(assert (=> b!943406 (= e!530419 tp_is_empty!20509)))

(declare-fun e!530422 () Bool)

(declare-fun array_inv!21304 (array!56986) Bool)

(declare-fun array_inv!21305 (array!56984) Bool)

(assert (=> b!943407 (= e!530423 (and tp!62508 tp_is_empty!20509 (array_inv!21304 (_keys!10513 thiss!1141)) (array_inv!21305 (_values!5662 thiss!1141)) e!530422))))

(declare-fun mapNonEmpty!32585 () Bool)

(declare-fun tp!62509 () Bool)

(assert (=> mapNonEmpty!32585 (= mapRes!32585 (and tp!62509 e!530424))))

(declare-fun mapValue!32585 () ValueCell!9773)

(declare-fun mapKey!32585 () (_ BitVec 32))

(declare-fun mapRest!32585 () (Array (_ BitVec 32) ValueCell!9773))

(assert (=> mapNonEmpty!32585 (= (arr!27418 (_values!5662 thiss!1141)) (store mapRest!32585 mapKey!32585 mapValue!32585))))

(declare-fun b!943408 () Bool)

(assert (=> b!943408 (= e!530422 (and e!530419 mapRes!32585))))

(declare-fun condMapEmpty!32585 () Bool)

(declare-fun mapDefault!32585 () ValueCell!9773)

