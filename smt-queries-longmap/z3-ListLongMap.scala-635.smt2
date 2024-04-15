; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16162 () Bool)

(assert start!16162)

(declare-fun b!160867 () Bool)

(declare-fun b_free!3619 () Bool)

(declare-fun b_next!3619 () Bool)

(assert (=> b!160867 (= b_free!3619 (not b_next!3619))))

(declare-fun tp!13426 () Bool)

(declare-fun b_and!10007 () Bool)

(assert (=> b!160867 (= tp!13426 b_and!10007)))

(declare-fun b!160866 () Bool)

(declare-fun e!105121 () Bool)

(declare-fun e!105117 () Bool)

(declare-fun mapRes!5819 () Bool)

(assert (=> b!160866 (= e!105121 (and e!105117 mapRes!5819))))

(declare-fun condMapEmpty!5819 () Bool)

(declare-datatypes ((V!4209 0))(
  ( (V!4210 (val!1755 Int)) )
))
(declare-datatypes ((ValueCell!1367 0))(
  ( (ValueCellFull!1367 (v!3614 V!4209)) (EmptyCell!1367) )
))
(declare-datatypes ((array!5901 0))(
  ( (array!5902 (arr!2794 (Array (_ BitVec 32) (_ BitVec 64))) (size!3079 (_ BitVec 32))) )
))
(declare-datatypes ((array!5903 0))(
  ( (array!5904 (arr!2795 (Array (_ BitVec 32) ValueCell!1367)) (size!3080 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1642 0))(
  ( (LongMapFixedSize!1643 (defaultEntry!3263 Int) (mask!7844 (_ BitVec 32)) (extraKeys!3004 (_ BitVec 32)) (zeroValue!3106 V!4209) (minValue!3106 V!4209) (_size!870 (_ BitVec 32)) (_keys!5063 array!5901) (_values!3246 array!5903) (_vacant!870 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1642)

(declare-fun mapDefault!5819 () ValueCell!1367)

(assert (=> b!160866 (= condMapEmpty!5819 (= (arr!2795 (_values!3246 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1367)) mapDefault!5819)))))

(declare-fun e!105119 () Bool)

(declare-fun tp_is_empty!3421 () Bool)

(declare-fun array_inv!1797 (array!5901) Bool)

(declare-fun array_inv!1798 (array!5903) Bool)

(assert (=> b!160867 (= e!105119 (and tp!13426 tp_is_empty!3421 (array_inv!1797 (_keys!5063 thiss!1248)) (array_inv!1798 (_values!3246 thiss!1248)) e!105121))))

(declare-fun b!160868 () Bool)

(declare-fun res!76240 () Bool)

(declare-fun e!105116 () Bool)

(assert (=> b!160868 (=> (not res!76240) (not e!105116))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2916 0))(
  ( (tuple2!2917 (_1!1469 (_ BitVec 64)) (_2!1469 V!4209)) )
))
(declare-datatypes ((List!1967 0))(
  ( (Nil!1964) (Cons!1963 (h!2576 tuple2!2916) (t!6760 List!1967)) )
))
(declare-datatypes ((ListLongMap!1903 0))(
  ( (ListLongMap!1904 (toList!967 List!1967)) )
))
(declare-fun contains!1006 (ListLongMap!1903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!617 (array!5901 array!5903 (_ BitVec 32) (_ BitVec 32) V!4209 V!4209 (_ BitVec 32) Int) ListLongMap!1903)

(assert (=> b!160868 (= res!76240 (not (contains!1006 (getCurrentListMap!617 (_keys!5063 thiss!1248) (_values!3246 thiss!1248) (mask!7844 thiss!1248) (extraKeys!3004 thiss!1248) (zeroValue!3106 thiss!1248) (minValue!3106 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3263 thiss!1248)) key!828)))))

(declare-fun b!160869 () Bool)

(declare-fun res!76237 () Bool)

(assert (=> b!160869 (=> (not res!76237) (not e!105116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5901 (_ BitVec 32)) Bool)

(assert (=> b!160869 (= res!76237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5063 thiss!1248) (mask!7844 thiss!1248)))))

(declare-fun mapIsEmpty!5819 () Bool)

(assert (=> mapIsEmpty!5819 mapRes!5819))

(declare-fun b!160870 () Bool)

(assert (=> b!160870 (= e!105116 false)))

(declare-fun lt!81960 () Bool)

(declare-datatypes ((List!1968 0))(
  ( (Nil!1965) (Cons!1964 (h!2577 (_ BitVec 64)) (t!6761 List!1968)) )
))
(declare-fun arrayNoDuplicates!0 (array!5901 (_ BitVec 32) List!1968) Bool)

(assert (=> b!160870 (= lt!81960 (arrayNoDuplicates!0 (_keys!5063 thiss!1248) #b00000000000000000000000000000000 Nil!1965))))

(declare-fun b!160871 () Bool)

(declare-fun e!105120 () Bool)

(assert (=> b!160871 (= e!105120 tp_is_empty!3421)))

(declare-fun b!160872 () Bool)

(declare-fun res!76241 () Bool)

(assert (=> b!160872 (=> (not res!76241) (not e!105116))))

(assert (=> b!160872 (= res!76241 (and (= (size!3080 (_values!3246 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7844 thiss!1248))) (= (size!3079 (_keys!5063 thiss!1248)) (size!3080 (_values!3246 thiss!1248))) (bvsge (mask!7844 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3004 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3004 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160873 () Bool)

(declare-fun res!76242 () Bool)

(assert (=> b!160873 (=> (not res!76242) (not e!105116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160873 (= res!76242 (validMask!0 (mask!7844 thiss!1248)))))

(declare-fun mapNonEmpty!5819 () Bool)

(declare-fun tp!13427 () Bool)

(assert (=> mapNonEmpty!5819 (= mapRes!5819 (and tp!13427 e!105120))))

(declare-fun mapRest!5819 () (Array (_ BitVec 32) ValueCell!1367))

(declare-fun mapKey!5819 () (_ BitVec 32))

(declare-fun mapValue!5819 () ValueCell!1367)

(assert (=> mapNonEmpty!5819 (= (arr!2795 (_values!3246 thiss!1248)) (store mapRest!5819 mapKey!5819 mapValue!5819))))

(declare-fun b!160874 () Bool)

(declare-fun res!76239 () Bool)

(assert (=> b!160874 (=> (not res!76239) (not e!105116))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!350 0))(
  ( (MissingZero!350 (index!3568 (_ BitVec 32))) (Found!350 (index!3569 (_ BitVec 32))) (Intermediate!350 (undefined!1162 Bool) (index!3570 (_ BitVec 32)) (x!17773 (_ BitVec 32))) (Undefined!350) (MissingVacant!350 (index!3571 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5901 (_ BitVec 32)) SeekEntryResult!350)

(assert (=> b!160874 (= res!76239 ((_ is Undefined!350) (seekEntryOrOpen!0 key!828 (_keys!5063 thiss!1248) (mask!7844 thiss!1248))))))

(declare-fun res!76236 () Bool)

(assert (=> start!16162 (=> (not res!76236) (not e!105116))))

(declare-fun valid!758 (LongMapFixedSize!1642) Bool)

(assert (=> start!16162 (= res!76236 (valid!758 thiss!1248))))

(assert (=> start!16162 e!105116))

(assert (=> start!16162 e!105119))

(assert (=> start!16162 true))

(declare-fun b!160875 () Bool)

(declare-fun res!76238 () Bool)

(assert (=> b!160875 (=> (not res!76238) (not e!105116))))

(assert (=> b!160875 (= res!76238 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160876 () Bool)

(assert (=> b!160876 (= e!105117 tp_is_empty!3421)))

(assert (= (and start!16162 res!76236) b!160875))

(assert (= (and b!160875 res!76238) b!160874))

(assert (= (and b!160874 res!76239) b!160868))

(assert (= (and b!160868 res!76240) b!160873))

(assert (= (and b!160873 res!76242) b!160872))

(assert (= (and b!160872 res!76241) b!160869))

(assert (= (and b!160869 res!76237) b!160870))

(assert (= (and b!160866 condMapEmpty!5819) mapIsEmpty!5819))

(assert (= (and b!160866 (not condMapEmpty!5819)) mapNonEmpty!5819))

(assert (= (and mapNonEmpty!5819 ((_ is ValueCellFull!1367) mapValue!5819)) b!160871))

(assert (= (and b!160866 ((_ is ValueCellFull!1367) mapDefault!5819)) b!160876))

(assert (= b!160867 b!160866))

(assert (= start!16162 b!160867))

(declare-fun m!192037 () Bool)

(assert (=> b!160874 m!192037))

(declare-fun m!192039 () Bool)

(assert (=> mapNonEmpty!5819 m!192039))

(declare-fun m!192041 () Bool)

(assert (=> b!160870 m!192041))

(declare-fun m!192043 () Bool)

(assert (=> b!160867 m!192043))

(declare-fun m!192045 () Bool)

(assert (=> b!160867 m!192045))

(declare-fun m!192047 () Bool)

(assert (=> b!160873 m!192047))

(declare-fun m!192049 () Bool)

(assert (=> b!160869 m!192049))

(declare-fun m!192051 () Bool)

(assert (=> b!160868 m!192051))

(assert (=> b!160868 m!192051))

(declare-fun m!192053 () Bool)

(assert (=> b!160868 m!192053))

(declare-fun m!192055 () Bool)

(assert (=> start!16162 m!192055))

(check-sat (not b!160870) (not b!160874) (not b_next!3619) (not b!160867) (not b!160869) (not b!160868) (not mapNonEmpty!5819) tp_is_empty!3421 (not b!160873) (not start!16162) b_and!10007)
(check-sat b_and!10007 (not b_next!3619))
