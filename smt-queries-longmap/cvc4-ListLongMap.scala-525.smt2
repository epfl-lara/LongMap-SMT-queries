; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13144 () Bool)

(assert start!13144)

(declare-fun b!115451 () Bool)

(declare-fun b_free!2697 () Bool)

(declare-fun b_next!2697 () Bool)

(assert (=> b!115451 (= b_free!2697 (not b_next!2697))))

(declare-fun tp!10455 () Bool)

(declare-fun b_and!7167 () Bool)

(assert (=> b!115451 (= tp!10455 b_and!7167)))

(declare-fun b!115446 () Bool)

(declare-fun b_free!2699 () Bool)

(declare-fun b_next!2699 () Bool)

(assert (=> b!115446 (= b_free!2699 (not b_next!2699))))

(declare-fun tp!10456 () Bool)

(declare-fun b_and!7169 () Bool)

(assert (=> b!115446 (= tp!10456 b_and!7169)))

(declare-fun b!115438 () Bool)

(declare-fun e!75280 () Bool)

(declare-fun tp_is_empty!2765 () Bool)

(assert (=> b!115438 (= e!75280 tp_is_empty!2765)))

(declare-fun b!115439 () Bool)

(declare-fun res!56651 () Bool)

(declare-fun e!75283 () Bool)

(assert (=> b!115439 (=> (not res!56651) (not e!75283))))

(declare-datatypes ((V!3333 0))(
  ( (V!3334 (val!1427 Int)) )
))
(declare-datatypes ((array!4533 0))(
  ( (array!4534 (arr!2149 (Array (_ BitVec 32) (_ BitVec 64))) (size!2409 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1039 0))(
  ( (ValueCellFull!1039 (v!3023 V!3333)) (EmptyCell!1039) )
))
(declare-datatypes ((array!4535 0))(
  ( (array!4536 (arr!2150 (Array (_ BitVec 32) ValueCell!1039)) (size!2410 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!986 0))(
  ( (LongMapFixedSize!987 (defaultEntry!2702 Int) (mask!6908 (_ BitVec 32)) (extraKeys!2491 (_ BitVec 32)) (zeroValue!2569 V!3333) (minValue!2569 V!3333) (_size!542 (_ BitVec 32)) (_keys!4424 array!4533) (_values!2685 array!4535) (_vacant!542 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!986)

(declare-datatypes ((Cell!786 0))(
  ( (Cell!787 (v!3024 LongMapFixedSize!986)) )
))
(declare-datatypes ((LongMap!786 0))(
  ( (LongMap!787 (underlying!404 Cell!786)) )
))
(declare-fun thiss!992 () LongMap!786)

(assert (=> b!115439 (= res!56651 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6908 newMap!16)) (_size!542 (v!3024 (underlying!404 thiss!992)))))))

(declare-fun b!115440 () Bool)

(declare-fun e!75278 () Bool)

(assert (=> b!115440 (= e!75278 tp_is_empty!2765)))

(declare-fun b!115441 () Bool)

(declare-fun res!56652 () Bool)

(assert (=> b!115441 (=> (not res!56652) (not e!75283))))

(declare-fun valid!467 (LongMapFixedSize!986) Bool)

(assert (=> b!115441 (= res!56652 (valid!467 newMap!16))))

(declare-fun b!115442 () Bool)

(declare-fun res!56650 () Bool)

(assert (=> b!115442 (=> (not res!56650) (not e!75283))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!115442 (= res!56650 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2409 (_keys!4424 (v!3024 (underlying!404 thiss!992)))))))))

(declare-fun mapIsEmpty!4227 () Bool)

(declare-fun mapRes!4227 () Bool)

(assert (=> mapIsEmpty!4227 mapRes!4227))

(declare-fun b!115443 () Bool)

(declare-fun e!75277 () Bool)

(assert (=> b!115443 (= e!75277 tp_is_empty!2765)))

(declare-fun b!115444 () Bool)

(assert (=> b!115444 (= e!75283 false)))

(declare-datatypes ((tuple2!2518 0))(
  ( (tuple2!2519 (_1!1270 (_ BitVec 64)) (_2!1270 V!3333)) )
))
(declare-datatypes ((List!1671 0))(
  ( (Nil!1668) (Cons!1667 (h!2267 tuple2!2518) (t!5925 List!1671)) )
))
(declare-datatypes ((ListLongMap!1641 0))(
  ( (ListLongMap!1642 (toList!836 List!1671)) )
))
(declare-fun lt!59994 () ListLongMap!1641)

(declare-fun map!1342 (LongMapFixedSize!986) ListLongMap!1641)

(assert (=> b!115444 (= lt!59994 (map!1342 newMap!16))))

(declare-fun lt!59993 () ListLongMap!1641)

(declare-fun getCurrentListMap!517 (array!4533 array!4535 (_ BitVec 32) (_ BitVec 32) V!3333 V!3333 (_ BitVec 32) Int) ListLongMap!1641)

(assert (=> b!115444 (= lt!59993 (getCurrentListMap!517 (_keys!4424 (v!3024 (underlying!404 thiss!992))) (_values!2685 (v!3024 (underlying!404 thiss!992))) (mask!6908 (v!3024 (underlying!404 thiss!992))) (extraKeys!2491 (v!3024 (underlying!404 thiss!992))) (zeroValue!2569 (v!3024 (underlying!404 thiss!992))) (minValue!2569 (v!3024 (underlying!404 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2702 (v!3024 (underlying!404 thiss!992)))))))

(declare-fun b!115445 () Bool)

(declare-fun e!75284 () Bool)

(declare-fun e!75287 () Bool)

(assert (=> b!115445 (= e!75284 (and e!75287 mapRes!4227))))

(declare-fun condMapEmpty!4227 () Bool)

(declare-fun mapDefault!4228 () ValueCell!1039)

