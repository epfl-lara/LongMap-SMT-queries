; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75604 () Bool)

(assert start!75604)

(declare-fun b!889061 () Bool)

(declare-fun b_free!15601 () Bool)

(declare-fun b_next!15601 () Bool)

(assert (=> b!889061 (= b_free!15601 (not b_next!15601))))

(declare-fun tp!54765 () Bool)

(declare-fun b_and!25841 () Bool)

(assert (=> b!889061 (= tp!54765 b_and!25841)))

(declare-fun b!889056 () Bool)

(declare-fun e!495504 () Bool)

(declare-fun tp_is_empty!17929 () Bool)

(assert (=> b!889056 (= e!495504 tp_is_empty!17929)))

(declare-fun b!889057 () Bool)

(declare-fun res!602585 () Bool)

(declare-fun e!495508 () Bool)

(assert (=> b!889057 (=> (not res!602585) (not e!495508))))

(declare-datatypes ((array!51834 0))(
  ( (array!51835 (arr!24925 (Array (_ BitVec 32) (_ BitVec 64))) (size!25368 (_ BitVec 32))) )
))
(declare-datatypes ((V!28871 0))(
  ( (V!28872 (val!9015 Int)) )
))
(declare-datatypes ((ValueCell!8483 0))(
  ( (ValueCellFull!8483 (v!11493 V!28871)) (EmptyCell!8483) )
))
(declare-datatypes ((array!51836 0))(
  ( (array!51837 (arr!24926 (Array (_ BitVec 32) ValueCell!8483)) (size!25369 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3982 0))(
  ( (LongMapFixedSize!3983 (defaultEntry!5188 Int) (mask!25626 (_ BitVec 32)) (extraKeys!4882 (_ BitVec 32)) (zeroValue!4986 V!28871) (minValue!4986 V!28871) (_size!2046 (_ BitVec 32)) (_keys!9870 array!51834) (_values!5173 array!51836) (_vacant!2046 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3982)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889057 (= res!602585 (validMask!0 (mask!25626 thiss!1181)))))

(declare-fun res!602583 () Bool)

(assert (=> start!75604 (=> (not res!602583) (not e!495508))))

(declare-fun valid!1553 (LongMapFixedSize!3982) Bool)

(assert (=> start!75604 (= res!602583 (valid!1553 thiss!1181))))

(assert (=> start!75604 e!495508))

(declare-fun e!495503 () Bool)

(assert (=> start!75604 e!495503))

(assert (=> start!75604 true))

(declare-fun mapNonEmpty!28441 () Bool)

(declare-fun mapRes!28441 () Bool)

(declare-fun tp!54764 () Bool)

(assert (=> mapNonEmpty!28441 (= mapRes!28441 (and tp!54764 e!495504))))

(declare-fun mapKey!28441 () (_ BitVec 32))

(declare-fun mapRest!28441 () (Array (_ BitVec 32) ValueCell!8483))

(declare-fun mapValue!28441 () ValueCell!8483)

(assert (=> mapNonEmpty!28441 (= (arr!24926 (_values!5173 thiss!1181)) (store mapRest!28441 mapKey!28441 mapValue!28441))))

(declare-fun b!889058 () Bool)

(declare-fun e!495505 () Bool)

(declare-fun e!495506 () Bool)

(assert (=> b!889058 (= e!495505 (and e!495506 mapRes!28441))))

(declare-fun condMapEmpty!28441 () Bool)

(declare-fun mapDefault!28441 () ValueCell!8483)

