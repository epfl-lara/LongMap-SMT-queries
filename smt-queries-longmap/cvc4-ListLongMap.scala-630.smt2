; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16132 () Bool)

(assert start!16132)

(declare-fun b!160587 () Bool)

(declare-fun b_free!3593 () Bool)

(declare-fun b_next!3593 () Bool)

(assert (=> b!160587 (= b_free!3593 (not b_next!3593))))

(declare-fun tp!13349 () Bool)

(declare-fun b_and!10007 () Bool)

(assert (=> b!160587 (= tp!13349 b_and!10007)))

(declare-fun b!160584 () Bool)

(declare-fun res!76060 () Bool)

(declare-fun e!104986 () Bool)

(assert (=> b!160584 (=> (not res!76060) (not e!104986))))

(declare-datatypes ((V!4173 0))(
  ( (V!4174 (val!1742 Int)) )
))
(declare-datatypes ((ValueCell!1354 0))(
  ( (ValueCellFull!1354 (v!3607 V!4173)) (EmptyCell!1354) )
))
(declare-datatypes ((array!5869 0))(
  ( (array!5870 (arr!2779 (Array (_ BitVec 32) (_ BitVec 64))) (size!3063 (_ BitVec 32))) )
))
(declare-datatypes ((array!5871 0))(
  ( (array!5872 (arr!2780 (Array (_ BitVec 32) ValueCell!1354)) (size!3064 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1616 0))(
  ( (LongMapFixedSize!1617 (defaultEntry!3250 Int) (mask!7822 (_ BitVec 32)) (extraKeys!2991 (_ BitVec 32)) (zeroValue!3093 V!4173) (minValue!3093 V!4173) (_size!857 (_ BitVec 32)) (_keys!5051 array!5869) (_values!3233 array!5871) (_vacant!857 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1616)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160584 (= res!76060 (validMask!0 (mask!7822 thiss!1248)))))

(declare-fun b!160586 () Bool)

(declare-fun res!76063 () Bool)

(assert (=> b!160586 (=> (not res!76063) (not e!104986))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160586 (= res!76063 (not (= key!828 (bvneg key!828))))))

(declare-fun tp_is_empty!3395 () Bool)

(declare-fun e!104988 () Bool)

(declare-fun e!104985 () Bool)

(declare-fun array_inv!1775 (array!5869) Bool)

(declare-fun array_inv!1776 (array!5871) Bool)

(assert (=> b!160587 (= e!104985 (and tp!13349 tp_is_empty!3395 (array_inv!1775 (_keys!5051 thiss!1248)) (array_inv!1776 (_values!3233 thiss!1248)) e!104988))))

(declare-fun b!160588 () Bool)

(declare-fun res!76059 () Bool)

(assert (=> b!160588 (=> (not res!76059) (not e!104986))))

(assert (=> b!160588 (= res!76059 (and (= (size!3064 (_values!3233 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7822 thiss!1248))) (= (size!3063 (_keys!5051 thiss!1248)) (size!3064 (_values!3233 thiss!1248))) (bvsge (mask!7822 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2991 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2991 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160589 () Bool)

(declare-fun res!76061 () Bool)

(assert (=> b!160589 (=> (not res!76061) (not e!104986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5869 (_ BitVec 32)) Bool)

(assert (=> b!160589 (= res!76061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5051 thiss!1248) (mask!7822 thiss!1248)))))

(declare-fun b!160590 () Bool)

(declare-fun res!76058 () Bool)

(assert (=> b!160590 (=> (not res!76058) (not e!104986))))

(declare-datatypes ((SeekEntryResult!336 0))(
  ( (MissingZero!336 (index!3512 (_ BitVec 32))) (Found!336 (index!3513 (_ BitVec 32))) (Intermediate!336 (undefined!1148 Bool) (index!3514 (_ BitVec 32)) (x!17720 (_ BitVec 32))) (Undefined!336) (MissingVacant!336 (index!3515 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5869 (_ BitVec 32)) SeekEntryResult!336)

(assert (=> b!160590 (= res!76058 (is-Undefined!336 (seekEntryOrOpen!0 key!828 (_keys!5051 thiss!1248) (mask!7822 thiss!1248))))))

(declare-fun mapNonEmpty!5780 () Bool)

(declare-fun mapRes!5780 () Bool)

(declare-fun tp!13348 () Bool)

(declare-fun e!104987 () Bool)

(assert (=> mapNonEmpty!5780 (= mapRes!5780 (and tp!13348 e!104987))))

(declare-fun mapRest!5780 () (Array (_ BitVec 32) ValueCell!1354))

(declare-fun mapKey!5780 () (_ BitVec 32))

(declare-fun mapValue!5780 () ValueCell!1354)

(assert (=> mapNonEmpty!5780 (= (arr!2780 (_values!3233 thiss!1248)) (store mapRest!5780 mapKey!5780 mapValue!5780))))

(declare-fun b!160591 () Bool)

(assert (=> b!160591 (= e!104987 tp_is_empty!3395)))

(declare-fun b!160592 () Bool)

(assert (=> b!160592 (= e!104986 false)))

(declare-fun lt!82102 () Bool)

(declare-datatypes ((List!1950 0))(
  ( (Nil!1947) (Cons!1946 (h!2559 (_ BitVec 64)) (t!6752 List!1950)) )
))
(declare-fun arrayNoDuplicates!0 (array!5869 (_ BitVec 32) List!1950) Bool)

(assert (=> b!160592 (= lt!82102 (arrayNoDuplicates!0 (_keys!5051 thiss!1248) #b00000000000000000000000000000000 Nil!1947))))

(declare-fun b!160593 () Bool)

(declare-fun e!104983 () Bool)

(assert (=> b!160593 (= e!104988 (and e!104983 mapRes!5780))))

(declare-fun condMapEmpty!5780 () Bool)

(declare-fun mapDefault!5780 () ValueCell!1354)

