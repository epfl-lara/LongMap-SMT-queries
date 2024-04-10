; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80276 () Bool)

(assert start!80276)

(declare-fun b!942972 () Bool)

(declare-fun b_free!17975 () Bool)

(declare-fun b_next!17975 () Bool)

(assert (=> b!942972 (= b_free!17975 (not b_next!17975))))

(declare-fun tp!62430 () Bool)

(declare-fun b_and!29387 () Bool)

(assert (=> b!942972 (= tp!62430 b_and!29387)))

(declare-fun b!942970 () Bool)

(declare-fun res!633630 () Bool)

(declare-fun e!530185 () Bool)

(assert (=> b!942970 (=> (not res!633630) (not e!530185))))

(declare-datatypes ((V!32275 0))(
  ( (V!32276 (val!10292 Int)) )
))
(declare-datatypes ((ValueCell!9760 0))(
  ( (ValueCellFull!9760 (v!12823 V!32275)) (EmptyCell!9760) )
))
(declare-datatypes ((array!56932 0))(
  ( (array!56933 (arr!27392 (Array (_ BitVec 32) ValueCell!9760)) (size!27857 (_ BitVec 32))) )
))
(declare-datatypes ((array!56934 0))(
  ( (array!56935 (arr!27393 (Array (_ BitVec 32) (_ BitVec 64))) (size!27858 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4670 0))(
  ( (LongMapFixedSize!4671 (defaultEntry!5626 Int) (mask!27244 (_ BitVec 32)) (extraKeys!5358 (_ BitVec 32)) (zeroValue!5462 V!32275) (minValue!5462 V!32275) (_size!2390 (_ BitVec 32)) (_keys!10500 array!56934) (_values!5649 array!56932) (_vacant!2390 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4670)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13424 0))(
  ( (tuple2!13425 (_1!6723 (_ BitVec 64)) (_2!6723 V!32275)) )
))
(declare-datatypes ((List!19234 0))(
  ( (Nil!19231) (Cons!19230 (h!20380 tuple2!13424) (t!27549 List!19234)) )
))
(declare-datatypes ((ListLongMap!12121 0))(
  ( (ListLongMap!12122 (toList!6076 List!19234)) )
))
(declare-fun contains!5146 (ListLongMap!12121 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3310 (array!56934 array!56932 (_ BitVec 32) (_ BitVec 32) V!32275 V!32275 (_ BitVec 32) Int) ListLongMap!12121)

(assert (=> b!942970 (= res!633630 (contains!5146 (getCurrentListMap!3310 (_keys!10500 thiss!1141) (_values!5649 thiss!1141) (mask!27244 thiss!1141) (extraKeys!5358 thiss!1141) (zeroValue!5462 thiss!1141) (minValue!5462 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5626 thiss!1141)) key!756))))

(declare-fun b!942971 () Bool)

(declare-fun e!530189 () Bool)

(declare-fun tp_is_empty!20483 () Bool)

(assert (=> b!942971 (= e!530189 tp_is_empty!20483)))

(declare-fun e!530187 () Bool)

(declare-fun e!530190 () Bool)

(declare-fun array_inv!21282 (array!56934) Bool)

(declare-fun array_inv!21283 (array!56932) Bool)

(assert (=> b!942972 (= e!530187 (and tp!62430 tp_is_empty!20483 (array_inv!21282 (_keys!10500 thiss!1141)) (array_inv!21283 (_values!5649 thiss!1141)) e!530190))))

(declare-fun mapIsEmpty!32546 () Bool)

(declare-fun mapRes!32546 () Bool)

(assert (=> mapIsEmpty!32546 mapRes!32546))

(declare-fun b!942973 () Bool)

(declare-fun res!633629 () Bool)

(assert (=> b!942973 (=> (not res!633629) (not e!530185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942973 (= res!633629 (validMask!0 (mask!27244 thiss!1141)))))

(declare-fun b!942974 () Bool)

(declare-fun res!633631 () Bool)

(assert (=> b!942974 (=> (not res!633631) (not e!530185))))

(assert (=> b!942974 (= res!633631 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942975 () Bool)

(declare-fun e!530186 () Bool)

(assert (=> b!942975 (= e!530190 (and e!530186 mapRes!32546))))

(declare-fun condMapEmpty!32546 () Bool)

(declare-fun mapDefault!32546 () ValueCell!9760)

