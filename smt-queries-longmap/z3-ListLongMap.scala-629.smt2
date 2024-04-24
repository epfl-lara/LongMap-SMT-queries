; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16126 () Bool)

(assert start!16126)

(declare-fun b!160476 () Bool)

(declare-fun b_free!3583 () Bool)

(declare-fun b_next!3583 () Bool)

(assert (=> b!160476 (= b_free!3583 (not b_next!3583))))

(declare-fun tp!13319 () Bool)

(declare-fun b_and!10011 () Bool)

(assert (=> b!160476 (= tp!13319 b_and!10011)))

(declare-fun res!75980 () Bool)

(declare-fun e!104919 () Bool)

(assert (=> start!16126 (=> (not res!75980) (not e!104919))))

(declare-datatypes ((V!4161 0))(
  ( (V!4162 (val!1737 Int)) )
))
(declare-datatypes ((ValueCell!1349 0))(
  ( (ValueCellFull!1349 (v!3603 V!4161)) (EmptyCell!1349) )
))
(declare-datatypes ((array!5835 0))(
  ( (array!5836 (arr!2762 (Array (_ BitVec 32) (_ BitVec 64))) (size!3046 (_ BitVec 32))) )
))
(declare-datatypes ((array!5837 0))(
  ( (array!5838 (arr!2763 (Array (_ BitVec 32) ValueCell!1349)) (size!3047 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1606 0))(
  ( (LongMapFixedSize!1607 (defaultEntry!3245 Int) (mask!7815 (_ BitVec 32)) (extraKeys!2986 (_ BitVec 32)) (zeroValue!3088 V!4161) (minValue!3088 V!4161) (_size!852 (_ BitVec 32)) (_keys!5046 array!5835) (_values!3228 array!5837) (_vacant!852 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1606)

(declare-fun valid!764 (LongMapFixedSize!1606) Bool)

(assert (=> start!16126 (= res!75980 (valid!764 thiss!1248))))

(assert (=> start!16126 e!104919))

(declare-fun e!104917 () Bool)

(assert (=> start!16126 e!104917))

(assert (=> start!16126 true))

(declare-fun b!160466 () Bool)

(declare-fun res!75979 () Bool)

(assert (=> b!160466 (=> (not res!75979) (not e!104919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5835 (_ BitVec 32)) Bool)

(assert (=> b!160466 (= res!75979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5046 thiss!1248) (mask!7815 thiss!1248)))))

(declare-fun b!160467 () Bool)

(declare-fun res!75976 () Bool)

(assert (=> b!160467 (=> (not res!75976) (not e!104919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160467 (= res!75976 (validMask!0 (mask!7815 thiss!1248)))))

(declare-fun b!160468 () Bool)

(declare-fun res!75974 () Bool)

(assert (=> b!160468 (=> (not res!75974) (not e!104919))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2868 0))(
  ( (tuple2!2869 (_1!1445 (_ BitVec 64)) (_2!1445 V!4161)) )
))
(declare-datatypes ((List!1932 0))(
  ( (Nil!1929) (Cons!1928 (h!2541 tuple2!2868) (t!6726 List!1932)) )
))
(declare-datatypes ((ListLongMap!1867 0))(
  ( (ListLongMap!1868 (toList!949 List!1932)) )
))
(declare-fun contains!995 (ListLongMap!1867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!616 (array!5835 array!5837 (_ BitVec 32) (_ BitVec 32) V!4161 V!4161 (_ BitVec 32) Int) ListLongMap!1867)

(assert (=> b!160468 (= res!75974 (not (contains!995 (getCurrentListMap!616 (_keys!5046 thiss!1248) (_values!3228 thiss!1248) (mask!7815 thiss!1248) (extraKeys!2986 thiss!1248) (zeroValue!3088 thiss!1248) (minValue!3088 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3245 thiss!1248)) key!828)))))

(declare-fun b!160469 () Bool)

(declare-fun e!104921 () Bool)

(declare-fun tp_is_empty!3385 () Bool)

(assert (=> b!160469 (= e!104921 tp_is_empty!3385)))

(declare-fun b!160470 () Bool)

(assert (=> b!160470 (= e!104919 false)))

(declare-fun lt!82146 () Bool)

(declare-datatypes ((List!1933 0))(
  ( (Nil!1930) (Cons!1929 (h!2542 (_ BitVec 64)) (t!6727 List!1933)) )
))
(declare-fun arrayNoDuplicates!0 (array!5835 (_ BitVec 32) List!1933) Bool)

(assert (=> b!160470 (= lt!82146 (arrayNoDuplicates!0 (_keys!5046 thiss!1248) #b00000000000000000000000000000000 Nil!1930))))

(declare-fun b!160471 () Bool)

(declare-fun res!75975 () Bool)

(assert (=> b!160471 (=> (not res!75975) (not e!104919))))

(assert (=> b!160471 (= res!75975 (and (= (size!3047 (_values!3228 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7815 thiss!1248))) (= (size!3046 (_keys!5046 thiss!1248)) (size!3047 (_values!3228 thiss!1248))) (bvsge (mask!7815 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2986 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2986 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160472 () Bool)

(declare-fun e!104920 () Bool)

(declare-fun e!104922 () Bool)

(declare-fun mapRes!5765 () Bool)

(assert (=> b!160472 (= e!104920 (and e!104922 mapRes!5765))))

(declare-fun condMapEmpty!5765 () Bool)

(declare-fun mapDefault!5765 () ValueCell!1349)

(assert (=> b!160472 (= condMapEmpty!5765 (= (arr!2763 (_values!3228 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1349)) mapDefault!5765)))))

(declare-fun b!160473 () Bool)

(declare-fun res!75978 () Bool)

(assert (=> b!160473 (=> (not res!75978) (not e!104919))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!325 0))(
  ( (MissingZero!325 (index!3468 (_ BitVec 32))) (Found!325 (index!3469 (_ BitVec 32))) (Intermediate!325 (undefined!1137 Bool) (index!3470 (_ BitVec 32)) (x!17701 (_ BitVec 32))) (Undefined!325) (MissingVacant!325 (index!3471 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5835 (_ BitVec 32)) SeekEntryResult!325)

(assert (=> b!160473 (= res!75978 ((_ is Undefined!325) (seekEntryOrOpen!0 key!828 (_keys!5046 thiss!1248) (mask!7815 thiss!1248))))))

(declare-fun b!160474 () Bool)

(declare-fun res!75977 () Bool)

(assert (=> b!160474 (=> (not res!75977) (not e!104919))))

(assert (=> b!160474 (= res!75977 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5765 () Bool)

(declare-fun tp!13318 () Bool)

(assert (=> mapNonEmpty!5765 (= mapRes!5765 (and tp!13318 e!104921))))

(declare-fun mapValue!5765 () ValueCell!1349)

(declare-fun mapRest!5765 () (Array (_ BitVec 32) ValueCell!1349))

(declare-fun mapKey!5765 () (_ BitVec 32))

(assert (=> mapNonEmpty!5765 (= (arr!2763 (_values!3228 thiss!1248)) (store mapRest!5765 mapKey!5765 mapValue!5765))))

(declare-fun b!160475 () Bool)

(assert (=> b!160475 (= e!104922 tp_is_empty!3385)))

(declare-fun array_inv!1765 (array!5835) Bool)

(declare-fun array_inv!1766 (array!5837) Bool)

(assert (=> b!160476 (= e!104917 (and tp!13319 tp_is_empty!3385 (array_inv!1765 (_keys!5046 thiss!1248)) (array_inv!1766 (_values!3228 thiss!1248)) e!104920))))

(declare-fun mapIsEmpty!5765 () Bool)

(assert (=> mapIsEmpty!5765 mapRes!5765))

(assert (= (and start!16126 res!75980) b!160474))

(assert (= (and b!160474 res!75977) b!160473))

(assert (= (and b!160473 res!75978) b!160468))

(assert (= (and b!160468 res!75974) b!160467))

(assert (= (and b!160467 res!75976) b!160471))

(assert (= (and b!160471 res!75975) b!160466))

(assert (= (and b!160466 res!75979) b!160470))

(assert (= (and b!160472 condMapEmpty!5765) mapIsEmpty!5765))

(assert (= (and b!160472 (not condMapEmpty!5765)) mapNonEmpty!5765))

(assert (= (and mapNonEmpty!5765 ((_ is ValueCellFull!1349) mapValue!5765)) b!160469))

(assert (= (and b!160472 ((_ is ValueCellFull!1349) mapDefault!5765)) b!160475))

(assert (= b!160476 b!160472))

(assert (= start!16126 b!160476))

(declare-fun m!192479 () Bool)

(assert (=> mapNonEmpty!5765 m!192479))

(declare-fun m!192481 () Bool)

(assert (=> start!16126 m!192481))

(declare-fun m!192483 () Bool)

(assert (=> b!160466 m!192483))

(declare-fun m!192485 () Bool)

(assert (=> b!160468 m!192485))

(assert (=> b!160468 m!192485))

(declare-fun m!192487 () Bool)

(assert (=> b!160468 m!192487))

(declare-fun m!192489 () Bool)

(assert (=> b!160470 m!192489))

(declare-fun m!192491 () Bool)

(assert (=> b!160476 m!192491))

(declare-fun m!192493 () Bool)

(assert (=> b!160476 m!192493))

(declare-fun m!192495 () Bool)

(assert (=> b!160473 m!192495))

(declare-fun m!192497 () Bool)

(assert (=> b!160467 m!192497))

(check-sat (not mapNonEmpty!5765) tp_is_empty!3385 (not b!160467) (not b!160476) b_and!10011 (not b!160468) (not b!160473) (not start!16126) (not b_next!3583) (not b!160470) (not b!160466))
(check-sat b_and!10011 (not b_next!3583))
