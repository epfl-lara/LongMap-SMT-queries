; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17172 () Bool)

(assert start!17172)

(declare-fun b!172483 () Bool)

(declare-fun b_free!4259 () Bool)

(declare-fun b_next!4259 () Bool)

(assert (=> b!172483 (= b_free!4259 (not b_next!4259))))

(declare-fun tp!15424 () Bool)

(declare-fun b_and!10699 () Bool)

(assert (=> b!172483 (= tp!15424 b_and!10699)))

(declare-fun b!172481 () Bool)

(declare-fun res!81898 () Bool)

(declare-fun e!113862 () Bool)

(assert (=> b!172481 (=> (not res!81898) (not e!113862))))

(declare-datatypes ((V!5021 0))(
  ( (V!5022 (val!2060 Int)) )
))
(declare-datatypes ((ValueCell!1672 0))(
  ( (ValueCellFull!1672 (v!3928 V!5021)) (EmptyCell!1672) )
))
(declare-datatypes ((array!7183 0))(
  ( (array!7184 (arr!3415 (Array (_ BitVec 32) (_ BitVec 64))) (size!3712 (_ BitVec 32))) )
))
(declare-datatypes ((array!7185 0))(
  ( (array!7186 (arr!3416 (Array (_ BitVec 32) ValueCell!1672)) (size!3713 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2252 0))(
  ( (LongMapFixedSize!2253 (defaultEntry!3572 Int) (mask!8417 (_ BitVec 32)) (extraKeys!3311 (_ BitVec 32)) (zeroValue!3413 V!5021) (minValue!3415 V!5021) (_size!1175 (_ BitVec 32)) (_keys!5409 array!7183) (_values!3555 array!7185) (_vacant!1175 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2252)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172481 (= res!81898 (validMask!0 (mask!8417 thiss!1248)))))

(declare-fun mapIsEmpty!6856 () Bool)

(declare-fun mapRes!6856 () Bool)

(assert (=> mapIsEmpty!6856 mapRes!6856))

(declare-fun res!81900 () Bool)

(assert (=> start!17172 (=> (not res!81900) (not e!113862))))

(declare-fun valid!956 (LongMapFixedSize!2252) Bool)

(assert (=> start!17172 (= res!81900 (valid!956 thiss!1248))))

(assert (=> start!17172 e!113862))

(declare-fun e!113860 () Bool)

(assert (=> start!17172 e!113860))

(assert (=> start!17172 true))

(declare-fun b!172482 () Bool)

(assert (=> b!172482 (= e!113862 (and (= (size!3713 (_values!3555 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8417 thiss!1248))) (= (size!3712 (_keys!5409 thiss!1248)) (size!3713 (_values!3555 thiss!1248))) (bvslt (mask!8417 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6856 () Bool)

(declare-fun tp!15423 () Bool)

(declare-fun e!113858 () Bool)

(assert (=> mapNonEmpty!6856 (= mapRes!6856 (and tp!15423 e!113858))))

(declare-fun mapValue!6856 () ValueCell!1672)

(declare-fun mapRest!6856 () (Array (_ BitVec 32) ValueCell!1672))

(declare-fun mapKey!6856 () (_ BitVec 32))

(assert (=> mapNonEmpty!6856 (= (arr!3416 (_values!3555 thiss!1248)) (store mapRest!6856 mapKey!6856 mapValue!6856))))

(declare-fun e!113859 () Bool)

(declare-fun tp_is_empty!4031 () Bool)

(declare-fun array_inv!2187 (array!7183) Bool)

(declare-fun array_inv!2188 (array!7185) Bool)

(assert (=> b!172483 (= e!113860 (and tp!15424 tp_is_empty!4031 (array_inv!2187 (_keys!5409 thiss!1248)) (array_inv!2188 (_values!3555 thiss!1248)) e!113859))))

(declare-fun b!172484 () Bool)

(assert (=> b!172484 (= e!113858 tp_is_empty!4031)))

(declare-fun b!172485 () Bool)

(declare-fun e!113861 () Bool)

(assert (=> b!172485 (= e!113859 (and e!113861 mapRes!6856))))

(declare-fun condMapEmpty!6856 () Bool)

(declare-fun mapDefault!6856 () ValueCell!1672)

