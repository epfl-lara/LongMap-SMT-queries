; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75912 () Bool)

(assert start!75912)

(declare-fun b!891574 () Bool)

(declare-fun b_free!15715 () Bool)

(declare-fun b_next!15715 () Bool)

(assert (=> b!891574 (= b_free!15715 (not b_next!15715))))

(declare-fun tp!55115 () Bool)

(declare-fun b_and!25965 () Bool)

(assert (=> b!891574 (= tp!55115 b_and!25965)))

(declare-fun b!891566 () Bool)

(declare-fun e!497397 () Bool)

(declare-fun e!497395 () Bool)

(declare-fun mapRes!28619 () Bool)

(assert (=> b!891566 (= e!497397 (and e!497395 mapRes!28619))))

(declare-fun condMapEmpty!28619 () Bool)

(declare-datatypes ((array!52105 0))(
  ( (array!52106 (arr!25054 (Array (_ BitVec 32) (_ BitVec 64))) (size!25499 (_ BitVec 32))) )
))
(declare-datatypes ((V!29023 0))(
  ( (V!29024 (val!9072 Int)) )
))
(declare-datatypes ((ValueCell!8540 0))(
  ( (ValueCellFull!8540 (v!11547 V!29023)) (EmptyCell!8540) )
))
(declare-datatypes ((array!52107 0))(
  ( (array!52108 (arr!25055 (Array (_ BitVec 32) ValueCell!8540)) (size!25500 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4096 0))(
  ( (LongMapFixedSize!4097 (defaultEntry!5245 Int) (mask!25767 (_ BitVec 32)) (extraKeys!4939 (_ BitVec 32)) (zeroValue!5043 V!29023) (minValue!5043 V!29023) (_size!2103 (_ BitVec 32)) (_keys!9956 array!52105) (_values!5230 array!52107) (_vacant!2103 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4096)

(declare-fun mapDefault!28619 () ValueCell!8540)

(assert (=> b!891566 (= condMapEmpty!28619 (= (arr!25055 (_values!5230 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8540)) mapDefault!28619)))))

(declare-fun b!891567 () Bool)

(declare-fun e!497392 () Bool)

(declare-fun e!497393 () Bool)

(assert (=> b!891567 (= e!497392 e!497393)))

(declare-fun res!603813 () Bool)

(assert (=> b!891567 (=> res!603813 e!497393)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891567 (= res!603813 (not (validMask!0 (mask!25767 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891567 (arrayContainsKey!0 (_keys!9956 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30296 0))(
  ( (Unit!30297) )
))
(declare-fun lt!402741 () Unit!30296)

(declare-datatypes ((SeekEntryResult!8762 0))(
  ( (MissingZero!8762 (index!37419 (_ BitVec 32))) (Found!8762 (index!37420 (_ BitVec 32))) (Intermediate!8762 (undefined!9574 Bool) (index!37421 (_ BitVec 32)) (x!75640 (_ BitVec 32))) (Undefined!8762) (MissingVacant!8762 (index!37422 (_ BitVec 32))) )
))
(declare-fun lt!402740 () SeekEntryResult!8762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52105 (_ BitVec 64) (_ BitVec 32)) Unit!30296)

(assert (=> b!891567 (= lt!402741 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9956 thiss!1181) key!785 (index!37420 lt!402740)))))

(declare-fun b!891568 () Bool)

(declare-fun tp_is_empty!18043 () Bool)

(assert (=> b!891568 (= e!497395 tp_is_empty!18043)))

(declare-fun mapNonEmpty!28619 () Bool)

(declare-fun tp!55114 () Bool)

(declare-fun e!497396 () Bool)

(assert (=> mapNonEmpty!28619 (= mapRes!28619 (and tp!55114 e!497396))))

(declare-fun mapValue!28619 () ValueCell!8540)

(declare-fun mapRest!28619 () (Array (_ BitVec 32) ValueCell!8540))

(declare-fun mapKey!28619 () (_ BitVec 32))

(assert (=> mapNonEmpty!28619 (= (arr!25055 (_values!5230 thiss!1181)) (store mapRest!28619 mapKey!28619 mapValue!28619))))

(declare-fun b!891569 () Bool)

(declare-fun res!603811 () Bool)

(assert (=> b!891569 (=> res!603811 e!497393)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52105 (_ BitVec 32)) Bool)

(assert (=> b!891569 (= res!603811 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9956 thiss!1181) (mask!25767 thiss!1181))))))

(declare-fun b!891570 () Bool)

(assert (=> b!891570 (= e!497393 true)))

(declare-fun lt!402742 () Bool)

(declare-datatypes ((List!17679 0))(
  ( (Nil!17676) (Cons!17675 (h!18812 (_ BitVec 64)) (t!24970 List!17679)) )
))
(declare-fun arrayNoDuplicates!0 (array!52105 (_ BitVec 32) List!17679) Bool)

(assert (=> b!891570 (= lt!402742 (arrayNoDuplicates!0 (_keys!9956 thiss!1181) #b00000000000000000000000000000000 Nil!17676))))

(declare-fun b!891571 () Bool)

(assert (=> b!891571 (= e!497396 tp_is_empty!18043)))

(declare-fun b!891572 () Bool)

(declare-fun e!497400 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891572 (= e!497400 (inRange!0 (index!37420 lt!402740) (mask!25767 thiss!1181)))))

(declare-fun mapIsEmpty!28619 () Bool)

(assert (=> mapIsEmpty!28619 mapRes!28619))

(declare-fun res!603814 () Bool)

(declare-fun e!497398 () Bool)

(assert (=> start!75912 (=> (not res!603814) (not e!497398))))

(declare-fun valid!1601 (LongMapFixedSize!4096) Bool)

(assert (=> start!75912 (= res!603814 (valid!1601 thiss!1181))))

(assert (=> start!75912 e!497398))

(declare-fun e!497399 () Bool)

(assert (=> start!75912 e!497399))

(assert (=> start!75912 true))

(declare-fun b!891573 () Bool)

(assert (=> b!891573 (= e!497398 (not e!497392))))

(declare-fun res!603809 () Bool)

(assert (=> b!891573 (=> res!603809 e!497392)))

(get-info :version)

(assert (=> b!891573 (= res!603809 (not ((_ is Found!8762) lt!402740)))))

(assert (=> b!891573 e!497400))

(declare-fun res!603812 () Bool)

(assert (=> b!891573 (=> res!603812 e!497400)))

(assert (=> b!891573 (= res!603812 (not ((_ is Found!8762) lt!402740)))))

(declare-fun lt!402743 () Unit!30296)

(declare-fun lemmaSeekEntryGivesInRangeIndex!19 (array!52105 array!52107 (_ BitVec 32) (_ BitVec 32) V!29023 V!29023 (_ BitVec 64)) Unit!30296)

(assert (=> b!891573 (= lt!402743 (lemmaSeekEntryGivesInRangeIndex!19 (_keys!9956 thiss!1181) (_values!5230 thiss!1181) (mask!25767 thiss!1181) (extraKeys!4939 thiss!1181) (zeroValue!5043 thiss!1181) (minValue!5043 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52105 (_ BitVec 32)) SeekEntryResult!8762)

(assert (=> b!891573 (= lt!402740 (seekEntry!0 key!785 (_keys!9956 thiss!1181) (mask!25767 thiss!1181)))))

(declare-fun array_inv!19742 (array!52105) Bool)

(declare-fun array_inv!19743 (array!52107) Bool)

(assert (=> b!891574 (= e!497399 (and tp!55115 tp_is_empty!18043 (array_inv!19742 (_keys!9956 thiss!1181)) (array_inv!19743 (_values!5230 thiss!1181)) e!497397))))

(declare-fun b!891575 () Bool)

(declare-fun res!603810 () Bool)

(assert (=> b!891575 (=> (not res!603810) (not e!497398))))

(assert (=> b!891575 (= res!603810 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891576 () Bool)

(declare-fun res!603808 () Bool)

(assert (=> b!891576 (=> res!603808 e!497393)))

(assert (=> b!891576 (= res!603808 (or (not (= (size!25500 (_values!5230 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25767 thiss!1181)))) (not (= (size!25499 (_keys!9956 thiss!1181)) (size!25500 (_values!5230 thiss!1181)))) (bvslt (mask!25767 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4939 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4939 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!75912 res!603814) b!891575))

(assert (= (and b!891575 res!603810) b!891573))

(assert (= (and b!891573 (not res!603812)) b!891572))

(assert (= (and b!891573 (not res!603809)) b!891567))

(assert (= (and b!891567 (not res!603813)) b!891576))

(assert (= (and b!891576 (not res!603808)) b!891569))

(assert (= (and b!891569 (not res!603811)) b!891570))

(assert (= (and b!891566 condMapEmpty!28619) mapIsEmpty!28619))

(assert (= (and b!891566 (not condMapEmpty!28619)) mapNonEmpty!28619))

(assert (= (and mapNonEmpty!28619 ((_ is ValueCellFull!8540) mapValue!28619)) b!891571))

(assert (= (and b!891566 ((_ is ValueCellFull!8540) mapDefault!28619)) b!891568))

(assert (= b!891574 b!891566))

(assert (= start!75912 b!891574))

(declare-fun m!830443 () Bool)

(assert (=> start!75912 m!830443))

(declare-fun m!830445 () Bool)

(assert (=> b!891573 m!830445))

(declare-fun m!830447 () Bool)

(assert (=> b!891573 m!830447))

(declare-fun m!830449 () Bool)

(assert (=> mapNonEmpty!28619 m!830449))

(declare-fun m!830451 () Bool)

(assert (=> b!891574 m!830451))

(declare-fun m!830453 () Bool)

(assert (=> b!891574 m!830453))

(declare-fun m!830455 () Bool)

(assert (=> b!891567 m!830455))

(declare-fun m!830457 () Bool)

(assert (=> b!891567 m!830457))

(declare-fun m!830459 () Bool)

(assert (=> b!891567 m!830459))

(declare-fun m!830461 () Bool)

(assert (=> b!891572 m!830461))

(declare-fun m!830463 () Bool)

(assert (=> b!891569 m!830463))

(declare-fun m!830465 () Bool)

(assert (=> b!891570 m!830465))

(check-sat (not start!75912) (not b_next!15715) (not b!891569) (not b!891572) (not b!891570) (not b!891567) (not mapNonEmpty!28619) (not b!891574) tp_is_empty!18043 b_and!25965 (not b!891573))
(check-sat b_and!25965 (not b_next!15715))
