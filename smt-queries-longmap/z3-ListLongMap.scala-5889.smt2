; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76068 () Bool)

(assert start!76068)

(declare-fun b!893939 () Bool)

(declare-fun b_free!15835 () Bool)

(declare-fun b_next!15835 () Bool)

(assert (=> b!893939 (= b_free!15835 (not b_next!15835))))

(declare-fun tp!55478 () Bool)

(declare-fun b_and!26107 () Bool)

(assert (=> b!893939 (= tp!55478 b_and!26107)))

(declare-fun mapNonEmpty!28802 () Bool)

(declare-fun mapRes!28802 () Bool)

(declare-fun tp!55477 () Bool)

(declare-fun e!499217 () Bool)

(assert (=> mapNonEmpty!28802 (= mapRes!28802 (and tp!55477 e!499217))))

(declare-datatypes ((V!29183 0))(
  ( (V!29184 (val!9132 Int)) )
))
(declare-datatypes ((ValueCell!8600 0))(
  ( (ValueCellFull!8600 (v!11608 V!29183)) (EmptyCell!8600) )
))
(declare-fun mapRest!28802 () (Array (_ BitVec 32) ValueCell!8600))

(declare-fun mapKey!28802 () (_ BitVec 32))

(declare-fun mapValue!28802 () ValueCell!8600)

(declare-datatypes ((array!52347 0))(
  ( (array!52348 (arr!25174 (Array (_ BitVec 32) (_ BitVec 64))) (size!25619 (_ BitVec 32))) )
))
(declare-datatypes ((array!52349 0))(
  ( (array!52350 (arr!25175 (Array (_ BitVec 32) ValueCell!8600)) (size!25620 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4216 0))(
  ( (LongMapFixedSize!4217 (defaultEntry!5308 Int) (mask!25873 (_ BitVec 32)) (extraKeys!5003 (_ BitVec 32)) (zeroValue!5107 V!29183) (minValue!5107 V!29183) (_size!2163 (_ BitVec 32)) (_keys!10021 array!52347) (_values!5294 array!52349) (_vacant!2163 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4216)

(assert (=> mapNonEmpty!28802 (= (arr!25175 (_values!5294 thiss!1181)) (store mapRest!28802 mapKey!28802 mapValue!28802))))

(declare-fun res!605201 () Bool)

(declare-fun e!499213 () Bool)

(assert (=> start!76068 (=> (not res!605201) (not e!499213))))

(declare-fun valid!1642 (LongMapFixedSize!4216) Bool)

(assert (=> start!76068 (= res!605201 (valid!1642 thiss!1181))))

(assert (=> start!76068 e!499213))

(declare-fun e!499212 () Bool)

(assert (=> start!76068 e!499212))

(assert (=> start!76068 true))

(declare-fun b!893933 () Bool)

(declare-fun e!499216 () Bool)

(declare-fun e!499218 () Bool)

(assert (=> b!893933 (= e!499216 (and e!499218 mapRes!28802))))

(declare-fun condMapEmpty!28802 () Bool)

(declare-fun mapDefault!28802 () ValueCell!8600)

(assert (=> b!893933 (= condMapEmpty!28802 (= (arr!25175 (_values!5294 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8600)) mapDefault!28802)))))

(declare-fun b!893934 () Bool)

(assert (=> b!893934 (= e!499213 (not true))))

(declare-fun e!499214 () Bool)

(assert (=> b!893934 e!499214))

(declare-fun res!605202 () Bool)

(assert (=> b!893934 (=> res!605202 e!499214)))

(declare-datatypes ((SeekEntryResult!8813 0))(
  ( (MissingZero!8813 (index!37623 (_ BitVec 32))) (Found!8813 (index!37624 (_ BitVec 32))) (Intermediate!8813 (undefined!9625 Bool) (index!37625 (_ BitVec 32)) (x!75879 (_ BitVec 32))) (Undefined!8813) (MissingVacant!8813 (index!37626 (_ BitVec 32))) )
))
(declare-fun lt!403868 () SeekEntryResult!8813)

(get-info :version)

(assert (=> b!893934 (= res!605202 (not ((_ is Found!8813) lt!403868)))))

(declare-datatypes ((Unit!30398 0))(
  ( (Unit!30399) )
))
(declare-fun lt!403867 () Unit!30398)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!62 (array!52347 array!52349 (_ BitVec 32) (_ BitVec 32) V!29183 V!29183 (_ BitVec 64)) Unit!30398)

(assert (=> b!893934 (= lt!403867 (lemmaSeekEntryGivesInRangeIndex!62 (_keys!10021 thiss!1181) (_values!5294 thiss!1181) (mask!25873 thiss!1181) (extraKeys!5003 thiss!1181) (zeroValue!5107 thiss!1181) (minValue!5107 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52347 (_ BitVec 32)) SeekEntryResult!8813)

(assert (=> b!893934 (= lt!403868 (seekEntry!0 key!785 (_keys!10021 thiss!1181) (mask!25873 thiss!1181)))))

(declare-fun b!893935 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893935 (= e!499214 (inRange!0 (index!37624 lt!403868) (mask!25873 thiss!1181)))))

(declare-fun b!893936 () Bool)

(declare-fun tp_is_empty!18163 () Bool)

(assert (=> b!893936 (= e!499218 tp_is_empty!18163)))

(declare-fun b!893937 () Bool)

(assert (=> b!893937 (= e!499217 tp_is_empty!18163)))

(declare-fun b!893938 () Bool)

(declare-fun res!605203 () Bool)

(assert (=> b!893938 (=> (not res!605203) (not e!499213))))

(assert (=> b!893938 (= res!605203 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28802 () Bool)

(assert (=> mapIsEmpty!28802 mapRes!28802))

(declare-fun array_inv!19822 (array!52347) Bool)

(declare-fun array_inv!19823 (array!52349) Bool)

(assert (=> b!893939 (= e!499212 (and tp!55478 tp_is_empty!18163 (array_inv!19822 (_keys!10021 thiss!1181)) (array_inv!19823 (_values!5294 thiss!1181)) e!499216))))

(assert (= (and start!76068 res!605201) b!893938))

(assert (= (and b!893938 res!605203) b!893934))

(assert (= (and b!893934 (not res!605202)) b!893935))

(assert (= (and b!893933 condMapEmpty!28802) mapIsEmpty!28802))

(assert (= (and b!893933 (not condMapEmpty!28802)) mapNonEmpty!28802))

(assert (= (and mapNonEmpty!28802 ((_ is ValueCellFull!8600) mapValue!28802)) b!893937))

(assert (= (and b!893933 ((_ is ValueCellFull!8600) mapDefault!28802)) b!893936))

(assert (= b!893939 b!893933))

(assert (= start!76068 b!893939))

(declare-fun m!832485 () Bool)

(assert (=> start!76068 m!832485))

(declare-fun m!832487 () Bool)

(assert (=> b!893934 m!832487))

(declare-fun m!832489 () Bool)

(assert (=> b!893934 m!832489))

(declare-fun m!832491 () Bool)

(assert (=> b!893935 m!832491))

(declare-fun m!832493 () Bool)

(assert (=> b!893939 m!832493))

(declare-fun m!832495 () Bool)

(assert (=> b!893939 m!832495))

(declare-fun m!832497 () Bool)

(assert (=> mapNonEmpty!28802 m!832497))

(check-sat b_and!26107 (not b!893939) (not b!893934) (not b!893935) (not start!76068) tp_is_empty!18163 (not mapNonEmpty!28802) (not b_next!15835))
(check-sat b_and!26107 (not b_next!15835))
