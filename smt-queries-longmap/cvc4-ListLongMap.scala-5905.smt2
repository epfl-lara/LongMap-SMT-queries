; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76376 () Bool)

(assert start!76376)

(declare-fun b!896028 () Bool)

(declare-fun b_free!15935 () Bool)

(declare-fun b_next!15935 () Bool)

(assert (=> b!896028 (= b_free!15935 (not b_next!15935))))

(declare-fun tp!55827 () Bool)

(declare-fun b_and!26227 () Bool)

(assert (=> b!896028 (= tp!55827 b_and!26227)))

(declare-fun mapIsEmpty!29002 () Bool)

(declare-fun mapRes!29002 () Bool)

(assert (=> mapIsEmpty!29002 mapRes!29002))

(declare-fun mapNonEmpty!29002 () Bool)

(declare-fun tp!55826 () Bool)

(declare-fun e!500750 () Bool)

(assert (=> mapNonEmpty!29002 (= mapRes!29002 (and tp!55826 e!500750))))

(declare-fun mapKey!29002 () (_ BitVec 32))

(declare-datatypes ((V!29315 0))(
  ( (V!29316 (val!9182 Int)) )
))
(declare-datatypes ((ValueCell!8650 0))(
  ( (ValueCellFull!8650 (v!11672 V!29315)) (EmptyCell!8650) )
))
(declare-fun mapRest!29002 () (Array (_ BitVec 32) ValueCell!8650))

(declare-datatypes ((array!52536 0))(
  ( (array!52537 (arr!25259 (Array (_ BitVec 32) (_ BitVec 64))) (size!25709 (_ BitVec 32))) )
))
(declare-datatypes ((array!52538 0))(
  ( (array!52539 (arr!25260 (Array (_ BitVec 32) ValueCell!8650)) (size!25710 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4316 0))(
  ( (LongMapFixedSize!4317 (defaultEntry!5370 Int) (mask!25989 (_ BitVec 32)) (extraKeys!5067 (_ BitVec 32)) (zeroValue!5171 V!29315) (minValue!5171 V!29315) (_size!2213 (_ BitVec 32)) (_keys!10093 array!52536) (_values!5358 array!52538) (_vacant!2213 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4316)

(declare-fun mapValue!29002 () ValueCell!8650)

(assert (=> mapNonEmpty!29002 (= (arr!25260 (_values!5358 thiss!1181)) (store mapRest!29002 mapKey!29002 mapValue!29002))))

(declare-fun b!896022 () Bool)

(declare-fun res!605975 () Bool)

(declare-fun e!500747 () Bool)

(assert (=> b!896022 (=> (not res!605975) (not e!500747))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!896022 (= res!605975 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896023 () Bool)

(declare-fun e!500745 () Bool)

(declare-fun e!500744 () Bool)

(assert (=> b!896023 (= e!500745 (and e!500744 mapRes!29002))))

(declare-fun condMapEmpty!29002 () Bool)

(declare-fun mapDefault!29002 () ValueCell!8650)

