; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76662 () Bool)

(assert start!76662)

(declare-fun b!897565 () Bool)

(declare-fun b_free!15985 () Bool)

(declare-fun b_next!15985 () Bool)

(assert (=> b!897565 (= b_free!15985 (not b_next!15985))))

(declare-fun tp!56009 () Bool)

(declare-fun b_and!26277 () Bool)

(assert (=> b!897565 (= tp!56009 b_and!26277)))

(declare-fun b!897558 () Bool)

(declare-fun e!501915 () Bool)

(declare-datatypes ((SeekEntryResult!8910 0))(
  ( (MissingZero!8910 (index!38011 (_ BitVec 32))) (Found!8910 (index!38012 (_ BitVec 32))) (Intermediate!8910 (undefined!9722 Bool) (index!38013 (_ BitVec 32)) (x!76475 (_ BitVec 32))) (Undefined!8910) (MissingVacant!8910 (index!38014 (_ BitVec 32))) )
))
(declare-fun lt!405226 () SeekEntryResult!8910)

(declare-datatypes ((array!52654 0))(
  ( (array!52655 (arr!25309 (Array (_ BitVec 32) (_ BitVec 64))) (size!25764 (_ BitVec 32))) )
))
(declare-datatypes ((V!29383 0))(
  ( (V!29384 (val!9207 Int)) )
))
(declare-datatypes ((ValueCell!8675 0))(
  ( (ValueCellFull!8675 (v!11697 V!29383)) (EmptyCell!8675) )
))
(declare-datatypes ((array!52656 0))(
  ( (array!52657 (arr!25310 (Array (_ BitVec 32) ValueCell!8675)) (size!25765 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4366 0))(
  ( (LongMapFixedSize!4367 (defaultEntry!5395 Int) (mask!26091 (_ BitVec 32)) (extraKeys!5106 (_ BitVec 32)) (zeroValue!5210 V!29383) (minValue!5210 V!29383) (_size!2238 (_ BitVec 32)) (_keys!10156 array!52654) (_values!5397 array!52656) (_vacant!2238 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4366)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897558 (= e!501915 (inRange!0 (index!38012 lt!405226) (mask!26091 thiss!1181)))))

(declare-fun b!897559 () Bool)

(declare-fun e!501920 () Bool)

(declare-fun tp_is_empty!18313 () Bool)

(assert (=> b!897559 (= e!501920 tp_is_empty!18313)))

(declare-fun b!897560 () Bool)

(declare-fun e!501916 () Bool)

(declare-fun e!501918 () Bool)

(assert (=> b!897560 (= e!501916 (not e!501918))))

(declare-fun res!606673 () Bool)

(assert (=> b!897560 (=> res!606673 e!501918)))

(assert (=> b!897560 (= res!606673 (not (is-Found!8910 lt!405226)))))

(assert (=> b!897560 e!501915))

(declare-fun res!606671 () Bool)

(assert (=> b!897560 (=> res!606671 e!501915)))

(assert (=> b!897560 (= res!606671 (not (is-Found!8910 lt!405226)))))

(declare-datatypes ((Unit!30510 0))(
  ( (Unit!30511) )
))
(declare-fun lt!405225 () Unit!30510)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!80 (array!52654 array!52656 (_ BitVec 32) (_ BitVec 32) V!29383 V!29383 (_ BitVec 64)) Unit!30510)

(assert (=> b!897560 (= lt!405225 (lemmaSeekEntryGivesInRangeIndex!80 (_keys!10156 thiss!1181) (_values!5397 thiss!1181) (mask!26091 thiss!1181) (extraKeys!5106 thiss!1181) (zeroValue!5210 thiss!1181) (minValue!5210 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52654 (_ BitVec 32)) SeekEntryResult!8910)

(assert (=> b!897560 (= lt!405226 (seekEntry!0 key!785 (_keys!10156 thiss!1181) (mask!26091 thiss!1181)))))

(declare-fun mapIsEmpty!29109 () Bool)

(declare-fun mapRes!29109 () Bool)

(assert (=> mapIsEmpty!29109 mapRes!29109))

(declare-fun mapNonEmpty!29109 () Bool)

(declare-fun tp!56008 () Bool)

(assert (=> mapNonEmpty!29109 (= mapRes!29109 (and tp!56008 e!501920))))

(declare-fun mapRest!29109 () (Array (_ BitVec 32) ValueCell!8675))

(declare-fun mapValue!29109 () ValueCell!8675)

(declare-fun mapKey!29109 () (_ BitVec 32))

(assert (=> mapNonEmpty!29109 (= (arr!25310 (_values!5397 thiss!1181)) (store mapRest!29109 mapKey!29109 mapValue!29109))))

(declare-fun b!897561 () Bool)

(declare-fun e!501917 () Bool)

(assert (=> b!897561 (= e!501917 tp_is_empty!18313)))

(declare-fun b!897562 () Bool)

(declare-fun res!606672 () Bool)

(assert (=> b!897562 (=> (not res!606672) (not e!501916))))

(assert (=> b!897562 (= res!606672 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897564 () Bool)

(declare-fun e!501923 () Bool)

(assert (=> b!897564 (= e!501918 e!501923)))

(declare-fun res!606675 () Bool)

(assert (=> b!897564 (=> res!606675 e!501923)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897564 (= res!606675 (not (validMask!0 (mask!26091 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897564 (arrayContainsKey!0 (_keys!10156 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405224 () Unit!30510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52654 (_ BitVec 64) (_ BitVec 32)) Unit!30510)

(assert (=> b!897564 (= lt!405224 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10156 thiss!1181) key!785 (index!38012 lt!405226)))))

(declare-fun e!501919 () Bool)

(declare-fun e!501921 () Bool)

(declare-fun array_inv!19864 (array!52654) Bool)

(declare-fun array_inv!19865 (array!52656) Bool)

(assert (=> b!897565 (= e!501919 (and tp!56009 tp_is_empty!18313 (array_inv!19864 (_keys!10156 thiss!1181)) (array_inv!19865 (_values!5397 thiss!1181)) e!501921))))

(declare-fun b!897566 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52654 (_ BitVec 32)) Bool)

(assert (=> b!897566 (= e!501923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10156 thiss!1181) (mask!26091 thiss!1181)))))

(declare-fun b!897567 () Bool)

(declare-fun res!606674 () Bool)

(assert (=> b!897567 (=> res!606674 e!501923)))

(assert (=> b!897567 (= res!606674 (or (not (= (size!25765 (_values!5397 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26091 thiss!1181)))) (not (= (size!25764 (_keys!10156 thiss!1181)) (size!25765 (_values!5397 thiss!1181)))) (bvslt (mask!26091 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5106 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5106 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!897563 () Bool)

(assert (=> b!897563 (= e!501921 (and e!501917 mapRes!29109))))

(declare-fun condMapEmpty!29109 () Bool)

(declare-fun mapDefault!29109 () ValueCell!8675)

