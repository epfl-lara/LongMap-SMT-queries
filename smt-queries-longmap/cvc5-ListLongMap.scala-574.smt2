; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15586 () Bool)

(assert start!15586)

(declare-fun b!155140 () Bool)

(declare-fun b_free!3253 () Bool)

(declare-fun b_next!3253 () Bool)

(assert (=> b!155140 (= b_free!3253 (not b_next!3253))))

(declare-fun tp!12283 () Bool)

(declare-fun b_and!9667 () Bool)

(assert (=> b!155140 (= tp!12283 b_and!9667)))

(declare-fun b!155139 () Bool)

(declare-fun res!73246 () Bool)

(declare-fun e!101350 () Bool)

(assert (=> b!155139 (=> (not res!73246) (not e!101350))))

(declare-datatypes ((V!3721 0))(
  ( (V!3722 (val!1572 Int)) )
))
(declare-datatypes ((ValueCell!1184 0))(
  ( (ValueCellFull!1184 (v!3437 V!3721)) (EmptyCell!1184) )
))
(declare-datatypes ((array!5163 0))(
  ( (array!5164 (arr!2439 (Array (_ BitVec 32) (_ BitVec 64))) (size!2717 (_ BitVec 32))) )
))
(declare-datatypes ((array!5165 0))(
  ( (array!5166 (arr!2440 (Array (_ BitVec 32) ValueCell!1184)) (size!2718 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1276 0))(
  ( (LongMapFixedSize!1277 (defaultEntry!3080 Int) (mask!7497 (_ BitVec 32)) (extraKeys!2821 (_ BitVec 32)) (zeroValue!2923 V!3721) (minValue!2923 V!3721) (_size!687 (_ BitVec 32)) (_keys!4855 array!5163) (_values!3063 array!5165) (_vacant!687 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1276)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155139 (= res!73246 (validMask!0 (mask!7497 thiss!1248)))))

(declare-fun mapIsEmpty!5225 () Bool)

(declare-fun mapRes!5225 () Bool)

(assert (=> mapIsEmpty!5225 mapRes!5225))

(declare-fun tp_is_empty!3055 () Bool)

(declare-fun e!101353 () Bool)

(declare-fun e!101351 () Bool)

(declare-fun array_inv!1543 (array!5163) Bool)

(declare-fun array_inv!1544 (array!5165) Bool)

(assert (=> b!155140 (= e!101353 (and tp!12283 tp_is_empty!3055 (array_inv!1543 (_keys!4855 thiss!1248)) (array_inv!1544 (_values!3063 thiss!1248)) e!101351))))

(declare-fun b!155141 () Bool)

(declare-fun e!101352 () Bool)

(assert (=> b!155141 (= e!101352 tp_is_empty!3055)))

(declare-fun res!73245 () Bool)

(assert (=> start!15586 (=> (not res!73245) (not e!101350))))

(declare-fun valid!628 (LongMapFixedSize!1276) Bool)

(assert (=> start!15586 (= res!73245 (valid!628 thiss!1248))))

(assert (=> start!15586 e!101350))

(assert (=> start!15586 e!101353))

(assert (=> start!15586 true))

(declare-fun b!155142 () Bool)

(declare-fun e!101355 () Bool)

(assert (=> b!155142 (= e!101355 tp_is_empty!3055)))

(declare-fun mapNonEmpty!5225 () Bool)

(declare-fun tp!12284 () Bool)

(assert (=> mapNonEmpty!5225 (= mapRes!5225 (and tp!12284 e!101355))))

(declare-fun mapValue!5225 () ValueCell!1184)

(declare-fun mapRest!5225 () (Array (_ BitVec 32) ValueCell!1184))

(declare-fun mapKey!5225 () (_ BitVec 32))

(assert (=> mapNonEmpty!5225 (= (arr!2440 (_values!3063 thiss!1248)) (store mapRest!5225 mapKey!5225 mapValue!5225))))

(declare-fun b!155143 () Bool)

(assert (=> b!155143 (= e!101350 false)))

(declare-fun lt!81331 () Bool)

(declare-datatypes ((List!1816 0))(
  ( (Nil!1813) (Cons!1812 (h!2421 (_ BitVec 64)) (t!6618 List!1816)) )
))
(declare-fun arrayNoDuplicates!0 (array!5163 (_ BitVec 32) List!1816) Bool)

(assert (=> b!155143 (= lt!81331 (arrayNoDuplicates!0 (_keys!4855 thiss!1248) #b00000000000000000000000000000000 Nil!1813))))

(declare-fun b!155144 () Bool)

(assert (=> b!155144 (= e!101351 (and e!101352 mapRes!5225))))

(declare-fun condMapEmpty!5225 () Bool)

(declare-fun mapDefault!5225 () ValueCell!1184)

