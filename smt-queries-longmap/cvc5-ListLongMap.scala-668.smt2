; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16498 () Bool)

(assert start!16498)

(declare-fun b!164057 () Bool)

(declare-fun b_free!3817 () Bool)

(declare-fun b_next!3817 () Bool)

(assert (=> b!164057 (= b_free!3817 (not b_next!3817))))

(declare-fun tp!14049 () Bool)

(declare-fun b_and!10231 () Bool)

(assert (=> b!164057 (= tp!14049 b_and!10231)))

(declare-fun b!164055 () Bool)

(declare-fun e!107643 () Bool)

(declare-datatypes ((V!4473 0))(
  ( (V!4474 (val!1854 Int)) )
))
(declare-datatypes ((ValueCell!1466 0))(
  ( (ValueCellFull!1466 (v!3719 V!4473)) (EmptyCell!1466) )
))
(declare-datatypes ((array!6333 0))(
  ( (array!6334 (arr!3003 (Array (_ BitVec 32) (_ BitVec 64))) (size!3291 (_ BitVec 32))) )
))
(declare-datatypes ((array!6335 0))(
  ( (array!6336 (arr!3004 (Array (_ BitVec 32) ValueCell!1466)) (size!3292 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1840 0))(
  ( (LongMapFixedSize!1841 (defaultEntry!3362 Int) (mask!8044 (_ BitVec 32)) (extraKeys!3103 (_ BitVec 32)) (zeroValue!3205 V!4473) (minValue!3205 V!4473) (_size!969 (_ BitVec 32)) (_keys!5185 array!6333) (_values!3345 array!6335) (_vacant!969 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1840)

(assert (=> b!164055 (= e!107643 (bvsgt #b00000000000000000000000000000000 (size!3291 (_keys!5185 thiss!1248))))))

(declare-fun b!164056 () Bool)

(declare-fun res!77629 () Bool)

(declare-fun e!107644 () Bool)

(assert (=> b!164056 (=> (not res!77629) (not e!107644))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!164056 (= res!77629 (not (= key!828 (bvneg key!828))))))

(declare-fun e!107642 () Bool)

(declare-fun e!107646 () Bool)

(declare-fun tp_is_empty!3619 () Bool)

(declare-fun array_inv!1921 (array!6333) Bool)

(declare-fun array_inv!1922 (array!6335) Bool)

(assert (=> b!164057 (= e!107642 (and tp!14049 tp_is_empty!3619 (array_inv!1921 (_keys!5185 thiss!1248)) (array_inv!1922 (_values!3345 thiss!1248)) e!107646))))

(declare-fun b!164058 () Bool)

(declare-fun e!107645 () Bool)

(assert (=> b!164058 (= e!107645 tp_is_empty!3619)))

(declare-fun res!77626 () Bool)

(assert (=> start!16498 (=> (not res!77626) (not e!107644))))

(declare-fun valid!821 (LongMapFixedSize!1840) Bool)

(assert (=> start!16498 (= res!77626 (valid!821 thiss!1248))))

(assert (=> start!16498 e!107644))

(assert (=> start!16498 e!107642))

(assert (=> start!16498 true))

(declare-fun b!164059 () Bool)

(assert (=> b!164059 (= e!107644 e!107643)))

(declare-fun res!77625 () Bool)

(assert (=> b!164059 (=> (not res!77625) (not e!107643))))

(declare-datatypes ((SeekEntryResult!409 0))(
  ( (MissingZero!409 (index!3804 (_ BitVec 32))) (Found!409 (index!3805 (_ BitVec 32))) (Intermediate!409 (undefined!1221 Bool) (index!3806 (_ BitVec 32)) (x!18197 (_ BitVec 32))) (Undefined!409) (MissingVacant!409 (index!3807 (_ BitVec 32))) )
))
(declare-fun lt!82819 () SeekEntryResult!409)

(assert (=> b!164059 (= res!77625 (and (not (is-Undefined!409 lt!82819)) (not (is-MissingVacant!409 lt!82819)) (not (is-MissingZero!409 lt!82819)) (is-Found!409 lt!82819)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6333 (_ BitVec 32)) SeekEntryResult!409)

(assert (=> b!164059 (= lt!82819 (seekEntryOrOpen!0 key!828 (_keys!5185 thiss!1248) (mask!8044 thiss!1248)))))

(declare-fun b!164060 () Bool)

(declare-fun res!77627 () Bool)

(assert (=> b!164060 (=> (not res!77627) (not e!107643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6333 (_ BitVec 32)) Bool)

(assert (=> b!164060 (= res!77627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5185 thiss!1248) (mask!8044 thiss!1248)))))

(declare-fun mapNonEmpty!6144 () Bool)

(declare-fun mapRes!6144 () Bool)

(declare-fun tp!14048 () Bool)

(declare-fun e!107648 () Bool)

(assert (=> mapNonEmpty!6144 (= mapRes!6144 (and tp!14048 e!107648))))

(declare-fun mapRest!6144 () (Array (_ BitVec 32) ValueCell!1466))

(declare-fun mapValue!6144 () ValueCell!1466)

(declare-fun mapKey!6144 () (_ BitVec 32))

(assert (=> mapNonEmpty!6144 (= (arr!3004 (_values!3345 thiss!1248)) (store mapRest!6144 mapKey!6144 mapValue!6144))))

(declare-fun b!164061 () Bool)

(assert (=> b!164061 (= e!107646 (and e!107645 mapRes!6144))))

(declare-fun condMapEmpty!6144 () Bool)

(declare-fun mapDefault!6144 () ValueCell!1466)

