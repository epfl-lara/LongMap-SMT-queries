; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13546 () Bool)

(assert start!13546)

(declare-fun b!124315 () Bool)

(declare-fun b_free!2833 () Bool)

(declare-fun b_next!2833 () Bool)

(assert (=> b!124315 (= b_free!2833 (not b_next!2833))))

(declare-fun tp!10898 () Bool)

(declare-fun b_and!7635 () Bool)

(assert (=> b!124315 (= tp!10898 b_and!7635)))

(declare-fun b!124321 () Bool)

(declare-fun b_free!2835 () Bool)

(declare-fun b_next!2835 () Bool)

(assert (=> b!124321 (= b_free!2835 (not b_next!2835))))

(declare-fun tp!10899 () Bool)

(declare-fun b_and!7637 () Bool)

(assert (=> b!124321 (= tp!10899 b_and!7637)))

(declare-fun b!124314 () Bool)

(declare-fun e!81275 () Bool)

(declare-fun tp_is_empty!2833 () Bool)

(assert (=> b!124314 (= e!81275 tp_is_empty!2833)))

(declare-fun mapIsEmpty!4467 () Bool)

(declare-fun mapRes!4468 () Bool)

(assert (=> mapIsEmpty!4467 mapRes!4468))

(declare-datatypes ((V!3425 0))(
  ( (V!3426 (val!1461 Int)) )
))
(declare-datatypes ((array!4681 0))(
  ( (array!4682 (arr!2217 (Array (_ BitVec 32) (_ BitVec 64))) (size!2480 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1073 0))(
  ( (ValueCellFull!1073 (v!3105 V!3425)) (EmptyCell!1073) )
))
(declare-datatypes ((array!4683 0))(
  ( (array!4684 (arr!2218 (Array (_ BitVec 32) ValueCell!1073)) (size!2481 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1054 0))(
  ( (LongMapFixedSize!1055 (defaultEntry!2763 Int) (mask!7009 (_ BitVec 32)) (extraKeys!2548 (_ BitVec 32)) (zeroValue!2628 V!3425) (minValue!2628 V!3425) (_size!576 (_ BitVec 32)) (_keys!4492 array!4681) (_values!2746 array!4683) (_vacant!576 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!848 0))(
  ( (Cell!849 (v!3106 LongMapFixedSize!1054)) )
))
(declare-datatypes ((LongMap!848 0))(
  ( (LongMap!849 (underlying!435 Cell!848)) )
))
(declare-fun thiss!992 () LongMap!848)

(declare-fun e!81263 () Bool)

(declare-fun e!81271 () Bool)

(declare-fun array_inv!1391 (array!4681) Bool)

(declare-fun array_inv!1392 (array!4683) Bool)

(assert (=> b!124315 (= e!81263 (and tp!10898 tp_is_empty!2833 (array_inv!1391 (_keys!4492 (v!3106 (underlying!435 thiss!992)))) (array_inv!1392 (_values!2746 (v!3106 (underlying!435 thiss!992)))) e!81271))))

(declare-fun res!60271 () Bool)

(declare-fun e!81265 () Bool)

(assert (=> start!13546 (=> (not res!60271) (not e!81265))))

(declare-fun valid!501 (LongMap!848) Bool)

(assert (=> start!13546 (= res!60271 (valid!501 thiss!992))))

(assert (=> start!13546 e!81265))

(declare-fun e!81274 () Bool)

(assert (=> start!13546 e!81274))

(assert (=> start!13546 true))

(declare-fun e!81261 () Bool)

(assert (=> start!13546 e!81261))

(declare-fun mapNonEmpty!4467 () Bool)

(declare-fun mapRes!4467 () Bool)

(declare-fun tp!10897 () Bool)

(declare-fun e!81267 () Bool)

(assert (=> mapNonEmpty!4467 (= mapRes!4467 (and tp!10897 e!81267))))

(declare-fun mapRest!4467 () (Array (_ BitVec 32) ValueCell!1073))

(declare-fun mapValue!4468 () ValueCell!1073)

(declare-fun newMap!16 () LongMapFixedSize!1054)

(declare-fun mapKey!4468 () (_ BitVec 32))

(assert (=> mapNonEmpty!4467 (= (arr!2218 (_values!2746 newMap!16)) (store mapRest!4467 mapKey!4468 mapValue!4468))))

(declare-fun b!124316 () Bool)

(declare-fun e!81273 () Bool)

(assert (=> b!124316 (= e!81273 tp_is_empty!2833)))

(declare-fun b!124317 () Bool)

(declare-fun e!81264 () Bool)

(assert (=> b!124317 (= e!81264 (and e!81273 mapRes!4467))))

(declare-fun condMapEmpty!4467 () Bool)

(declare-fun mapDefault!4467 () ValueCell!1073)

