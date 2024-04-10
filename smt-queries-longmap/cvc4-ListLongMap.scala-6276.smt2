; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80282 () Bool)

(assert start!80282)

(declare-fun b!943071 () Bool)

(declare-fun b_free!17981 () Bool)

(declare-fun b_next!17981 () Bool)

(assert (=> b!943071 (= b_free!17981 (not b_next!17981))))

(declare-fun tp!62448 () Bool)

(declare-fun b_and!29393 () Bool)

(assert (=> b!943071 (= tp!62448 b_and!29393)))

(declare-fun b!943069 () Bool)

(declare-fun e!530240 () Bool)

(declare-fun tp_is_empty!20489 () Bool)

(assert (=> b!943069 (= e!530240 tp_is_empty!20489)))

(declare-fun b!943070 () Bool)

(declare-fun res!633689 () Bool)

(declare-fun e!530241 () Bool)

(assert (=> b!943070 (=> (not res!633689) (not e!530241))))

(declare-datatypes ((V!32283 0))(
  ( (V!32284 (val!10295 Int)) )
))
(declare-datatypes ((ValueCell!9763 0))(
  ( (ValueCellFull!9763 (v!12826 V!32283)) (EmptyCell!9763) )
))
(declare-datatypes ((array!56944 0))(
  ( (array!56945 (arr!27398 (Array (_ BitVec 32) ValueCell!9763)) (size!27863 (_ BitVec 32))) )
))
(declare-datatypes ((array!56946 0))(
  ( (array!56947 (arr!27399 (Array (_ BitVec 32) (_ BitVec 64))) (size!27864 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4676 0))(
  ( (LongMapFixedSize!4677 (defaultEntry!5629 Int) (mask!27249 (_ BitVec 32)) (extraKeys!5361 (_ BitVec 32)) (zeroValue!5465 V!32283) (minValue!5465 V!32283) (_size!2393 (_ BitVec 32)) (_keys!10503 array!56946) (_values!5652 array!56944) (_vacant!2393 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4676)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943070 (= res!633689 (validMask!0 (mask!27249 thiss!1141)))))

(declare-fun e!530243 () Bool)

(declare-fun e!530244 () Bool)

(declare-fun array_inv!21288 (array!56946) Bool)

(declare-fun array_inv!21289 (array!56944) Bool)

(assert (=> b!943071 (= e!530244 (and tp!62448 tp_is_empty!20489 (array_inv!21288 (_keys!10503 thiss!1141)) (array_inv!21289 (_values!5652 thiss!1141)) e!530243))))

(declare-fun mapIsEmpty!32555 () Bool)

(declare-fun mapRes!32555 () Bool)

(assert (=> mapIsEmpty!32555 mapRes!32555))

(declare-fun b!943073 () Bool)

(declare-fun res!633695 () Bool)

(assert (=> b!943073 (=> (not res!633695) (not e!530241))))

(assert (=> b!943073 (= res!633695 (and (= (size!27863 (_values!5652 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27249 thiss!1141))) (= (size!27864 (_keys!10503 thiss!1141)) (size!27863 (_values!5652 thiss!1141))) (bvsge (mask!27249 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5361 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5361 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!32555 () Bool)

(declare-fun tp!62449 () Bool)

(assert (=> mapNonEmpty!32555 (= mapRes!32555 (and tp!62449 e!530240))))

(declare-fun mapKey!32555 () (_ BitVec 32))

(declare-fun mapValue!32555 () ValueCell!9763)

(declare-fun mapRest!32555 () (Array (_ BitVec 32) ValueCell!9763))

(assert (=> mapNonEmpty!32555 (= (arr!27398 (_values!5652 thiss!1141)) (store mapRest!32555 mapKey!32555 mapValue!32555))))

(declare-fun b!943074 () Bool)

(declare-fun res!633692 () Bool)

(assert (=> b!943074 (=> (not res!633692) (not e!530241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56946 (_ BitVec 32)) Bool)

(assert (=> b!943074 (= res!633692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10503 thiss!1141) (mask!27249 thiss!1141)))))

(declare-fun b!943075 () Bool)

(declare-fun e!530239 () Bool)

(assert (=> b!943075 (= e!530243 (and e!530239 mapRes!32555))))

(declare-fun condMapEmpty!32555 () Bool)

(declare-fun mapDefault!32555 () ValueCell!9763)

