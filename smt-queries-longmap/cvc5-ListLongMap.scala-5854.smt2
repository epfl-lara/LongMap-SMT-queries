; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75654 () Bool)

(assert start!75654)

(declare-fun b!889444 () Bool)

(declare-fun b_free!15625 () Bool)

(declare-fun b_next!15625 () Bool)

(assert (=> b!889444 (= b_free!15625 (not b_next!15625))))

(declare-fun tp!54843 () Bool)

(declare-fun b_and!25865 () Bool)

(assert (=> b!889444 (= tp!54843 b_and!25865)))

(declare-fun mapIsEmpty!28484 () Bool)

(declare-fun mapRes!28484 () Bool)

(assert (=> mapIsEmpty!28484 mapRes!28484))

(declare-fun res!602788 () Bool)

(declare-fun e!495792 () Bool)

(assert (=> start!75654 (=> (not res!602788) (not e!495792))))

(declare-datatypes ((array!51886 0))(
  ( (array!51887 (arr!24949 (Array (_ BitVec 32) (_ BitVec 64))) (size!25393 (_ BitVec 32))) )
))
(declare-datatypes ((V!28903 0))(
  ( (V!28904 (val!9027 Int)) )
))
(declare-datatypes ((ValueCell!8495 0))(
  ( (ValueCellFull!8495 (v!11505 V!28903)) (EmptyCell!8495) )
))
(declare-datatypes ((array!51888 0))(
  ( (array!51889 (arr!24950 (Array (_ BitVec 32) ValueCell!8495)) (size!25394 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4006 0))(
  ( (LongMapFixedSize!4007 (defaultEntry!5200 Int) (mask!25649 (_ BitVec 32)) (extraKeys!4894 (_ BitVec 32)) (zeroValue!4998 V!28903) (minValue!4998 V!28903) (_size!2058 (_ BitVec 32)) (_keys!9883 array!51886) (_values!5185 array!51888) (_vacant!2058 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4006)

(declare-fun valid!1559 (LongMapFixedSize!4006) Bool)

(assert (=> start!75654 (= res!602788 (valid!1559 thiss!1181))))

(assert (=> start!75654 e!495792))

(declare-fun e!495795 () Bool)

(assert (=> start!75654 e!495795))

(assert (=> start!75654 true))

(declare-fun tp_is_empty!17953 () Bool)

(declare-fun e!495791 () Bool)

(declare-fun array_inv!19626 (array!51886) Bool)

(declare-fun array_inv!19627 (array!51888) Bool)

(assert (=> b!889444 (= e!495795 (and tp!54843 tp_is_empty!17953 (array_inv!19626 (_keys!9883 thiss!1181)) (array_inv!19627 (_values!5185 thiss!1181)) e!495791))))

(declare-fun b!889445 () Bool)

(declare-fun e!495790 () Bool)

(assert (=> b!889445 (= e!495790 false)))

(declare-fun lt!402033 () Bool)

(declare-datatypes ((List!17702 0))(
  ( (Nil!17699) (Cons!17698 (h!18829 (_ BitVec 64)) (t!25001 List!17702)) )
))
(declare-fun arrayNoDuplicates!0 (array!51886 (_ BitVec 32) List!17702) Bool)

(assert (=> b!889445 (= lt!402033 (arrayNoDuplicates!0 (_keys!9883 thiss!1181) #b00000000000000000000000000000000 Nil!17699))))

(declare-fun b!889446 () Bool)

(declare-fun e!495793 () Bool)

(assert (=> b!889446 (= e!495793 tp_is_empty!17953)))

(declare-fun b!889447 () Bool)

(declare-fun e!495794 () Bool)

(assert (=> b!889447 (= e!495794 tp_is_empty!17953)))

(declare-fun mapNonEmpty!28484 () Bool)

(declare-fun tp!54844 () Bool)

(assert (=> mapNonEmpty!28484 (= mapRes!28484 (and tp!54844 e!495793))))

(declare-fun mapKey!28484 () (_ BitVec 32))

(declare-fun mapValue!28484 () ValueCell!8495)

(declare-fun mapRest!28484 () (Array (_ BitVec 32) ValueCell!8495))

(assert (=> mapNonEmpty!28484 (= (arr!24950 (_values!5185 thiss!1181)) (store mapRest!28484 mapKey!28484 mapValue!28484))))

(declare-fun b!889448 () Bool)

(declare-fun res!602786 () Bool)

(assert (=> b!889448 (=> (not res!602786) (not e!495790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51886 (_ BitVec 32)) Bool)

(assert (=> b!889448 (= res!602786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9883 thiss!1181) (mask!25649 thiss!1181)))))

(declare-fun b!889449 () Bool)

(declare-fun res!602789 () Bool)

(assert (=> b!889449 (=> (not res!602789) (not e!495790))))

(assert (=> b!889449 (= res!602789 (and (= (size!25394 (_values!5185 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25649 thiss!1181))) (= (size!25393 (_keys!9883 thiss!1181)) (size!25394 (_values!5185 thiss!1181))) (bvsge (mask!25649 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4894 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4894 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889450 () Bool)

(declare-fun res!602785 () Bool)

(assert (=> b!889450 (=> (not res!602785) (not e!495792))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889450 (= res!602785 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889451 () Bool)

(assert (=> b!889451 (= e!495792 e!495790)))

(declare-fun res!602787 () Bool)

(assert (=> b!889451 (=> (not res!602787) (not e!495790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889451 (= res!602787 (validMask!0 (mask!25649 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8774 0))(
  ( (MissingZero!8774 (index!37467 (_ BitVec 32))) (Found!8774 (index!37468 (_ BitVec 32))) (Intermediate!8774 (undefined!9586 Bool) (index!37469 (_ BitVec 32)) (x!75518 (_ BitVec 32))) (Undefined!8774) (MissingVacant!8774 (index!37470 (_ BitVec 32))) )
))
(declare-fun lt!402034 () SeekEntryResult!8774)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51886 (_ BitVec 32)) SeekEntryResult!8774)

(assert (=> b!889451 (= lt!402034 (seekEntry!0 key!785 (_keys!9883 thiss!1181) (mask!25649 thiss!1181)))))

(declare-fun b!889452 () Bool)

(assert (=> b!889452 (= e!495791 (and e!495794 mapRes!28484))))

(declare-fun condMapEmpty!28484 () Bool)

(declare-fun mapDefault!28484 () ValueCell!8495)

