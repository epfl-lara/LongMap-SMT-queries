; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23490 () Bool)

(assert start!23490)

(declare-fun b!246787 () Bool)

(declare-fun b_free!6575 () Bool)

(declare-fun b_next!6575 () Bool)

(assert (=> b!246787 (= b_free!6575 (not b_next!6575))))

(declare-fun tp!22967 () Bool)

(declare-fun b_and!13573 () Bool)

(assert (=> b!246787 (= tp!22967 b_and!13573)))

(declare-fun mapNonEmpty!10925 () Bool)

(declare-fun mapRes!10925 () Bool)

(declare-fun tp!22966 () Bool)

(declare-fun e!160098 () Bool)

(assert (=> mapNonEmpty!10925 (= mapRes!10925 (and tp!22966 e!160098))))

(declare-datatypes ((V!8229 0))(
  ( (V!8230 (val!3263 Int)) )
))
(declare-datatypes ((ValueCell!2875 0))(
  ( (ValueCellFull!2875 (v!5319 V!8229)) (EmptyCell!2875) )
))
(declare-fun mapValue!10925 () ValueCell!2875)

(declare-datatypes ((array!12177 0))(
  ( (array!12178 (arr!5778 (Array (_ BitVec 32) ValueCell!2875)) (size!6121 (_ BitVec 32))) )
))
(declare-datatypes ((array!12179 0))(
  ( (array!12180 (arr!5779 (Array (_ BitVec 32) (_ BitVec 64))) (size!6122 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3650 0))(
  ( (LongMapFixedSize!3651 (defaultEntry!4566 Int) (mask!10694 (_ BitVec 32)) (extraKeys!4303 (_ BitVec 32)) (zeroValue!4407 V!8229) (minValue!4407 V!8229) (_size!1874 (_ BitVec 32)) (_keys!6686 array!12179) (_values!4549 array!12177) (_vacant!1874 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3650)

(declare-fun mapRest!10925 () (Array (_ BitVec 32) ValueCell!2875))

(declare-fun mapKey!10925 () (_ BitVec 32))

(assert (=> mapNonEmpty!10925 (= (arr!5778 (_values!4549 thiss!1504)) (store mapRest!10925 mapKey!10925 mapValue!10925))))

(declare-fun b!246772 () Bool)

(declare-fun e!160100 () Bool)

(declare-fun e!160101 () Bool)

(assert (=> b!246772 (= e!160100 (and e!160101 mapRes!10925))))

(declare-fun condMapEmpty!10925 () Bool)

(declare-fun mapDefault!10925 () ValueCell!2875)

