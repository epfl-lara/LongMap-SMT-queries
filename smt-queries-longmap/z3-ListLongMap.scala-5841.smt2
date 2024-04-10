; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75434 () Bool)

(assert start!75434)

(declare-fun b!887997 () Bool)

(declare-fun b_free!15549 () Bool)

(declare-fun b_next!15549 () Bool)

(assert (=> b!887997 (= b_free!15549 (not b_next!15549))))

(declare-fun tp!54594 () Bool)

(declare-fun b_and!25785 () Bool)

(assert (=> b!887997 (= tp!54594 b_and!25785)))

(declare-fun b!887994 () Bool)

(declare-fun res!602234 () Bool)

(declare-fun e!494708 () Bool)

(assert (=> b!887994 (=> (not res!602234) (not e!494708))))

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((array!51722 0))(
  ( (array!51723 (arr!24873 (Array (_ BitVec 32) (_ BitVec 64))) (size!25313 (_ BitVec 32))) )
))
(declare-datatypes ((V!28801 0))(
  ( (V!28802 (val!8989 Int)) )
))
(declare-datatypes ((ValueCell!8457 0))(
  ( (ValueCellFull!8457 (v!11461 V!28801)) (EmptyCell!8457) )
))
(declare-datatypes ((array!51724 0))(
  ( (array!51725 (arr!24874 (Array (_ BitVec 32) ValueCell!8457)) (size!25314 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3930 0))(
  ( (LongMapFixedSize!3931 (defaultEntry!5156 Int) (mask!25566 (_ BitVec 32)) (extraKeys!4850 (_ BitVec 32)) (zeroValue!4954 V!28801) (minValue!4954 V!28801) (_size!2020 (_ BitVec 32)) (_keys!9833 array!51722) (_values!5141 array!51724) (_vacant!2020 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3930)

(assert (=> b!887994 (= res!602234 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4850 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!887995 () Bool)

(declare-fun e!494711 () Bool)

(declare-fun tp_is_empty!17877 () Bool)

(assert (=> b!887995 (= e!494711 tp_is_empty!17877)))

(declare-fun b!887996 () Bool)

(assert (=> b!887996 (= e!494708 false)))

(declare-fun lt!401534 () Bool)

(declare-fun contains!4317 (LongMapFixedSize!3930 (_ BitVec 64)) Bool)

(assert (=> b!887996 (= lt!401534 (contains!4317 thiss!1181 key!785))))

(declare-fun e!494709 () Bool)

(declare-fun e!494706 () Bool)

(declare-fun array_inv!19578 (array!51722) Bool)

(declare-fun array_inv!19579 (array!51724) Bool)

(assert (=> b!887997 (= e!494709 (and tp!54594 tp_is_empty!17877 (array_inv!19578 (_keys!9833 thiss!1181)) (array_inv!19579 (_values!5141 thiss!1181)) e!494706))))

(declare-fun b!887998 () Bool)

(declare-fun e!494707 () Bool)

(assert (=> b!887998 (= e!494707 tp_is_empty!17877)))

(declare-fun b!887999 () Bool)

(declare-fun mapRes!28348 () Bool)

(assert (=> b!887999 (= e!494706 (and e!494707 mapRes!28348))))

(declare-fun condMapEmpty!28348 () Bool)

(declare-fun mapDefault!28348 () ValueCell!8457)

(assert (=> b!887999 (= condMapEmpty!28348 (= (arr!24874 (_values!5141 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8457)) mapDefault!28348)))))

(declare-fun res!602233 () Bool)

(assert (=> start!75434 (=> (not res!602233) (not e!494708))))

(declare-fun valid!1533 (LongMapFixedSize!3930) Bool)

(assert (=> start!75434 (= res!602233 (valid!1533 thiss!1181))))

(assert (=> start!75434 e!494708))

(assert (=> start!75434 e!494709))

(assert (=> start!75434 true))

(declare-fun mapIsEmpty!28348 () Bool)

(assert (=> mapIsEmpty!28348 mapRes!28348))

(declare-fun mapNonEmpty!28348 () Bool)

(declare-fun tp!54593 () Bool)

(assert (=> mapNonEmpty!28348 (= mapRes!28348 (and tp!54593 e!494711))))

(declare-fun mapRest!28348 () (Array (_ BitVec 32) ValueCell!8457))

(declare-fun mapValue!28348 () ValueCell!8457)

(declare-fun mapKey!28348 () (_ BitVec 32))

(assert (=> mapNonEmpty!28348 (= (arr!24874 (_values!5141 thiss!1181)) (store mapRest!28348 mapKey!28348 mapValue!28348))))

(assert (= (and start!75434 res!602233) b!887994))

(assert (= (and b!887994 res!602234) b!887996))

(assert (= (and b!887999 condMapEmpty!28348) mapIsEmpty!28348))

(assert (= (and b!887999 (not condMapEmpty!28348)) mapNonEmpty!28348))

(get-info :version)

(assert (= (and mapNonEmpty!28348 ((_ is ValueCellFull!8457) mapValue!28348)) b!887995))

(assert (= (and b!887999 ((_ is ValueCellFull!8457) mapDefault!28348)) b!887998))

(assert (= b!887997 b!887999))

(assert (= start!75434 b!887997))

(declare-fun m!827435 () Bool)

(assert (=> b!887996 m!827435))

(declare-fun m!827437 () Bool)

(assert (=> b!887997 m!827437))

(declare-fun m!827439 () Bool)

(assert (=> b!887997 m!827439))

(declare-fun m!827441 () Bool)

(assert (=> start!75434 m!827441))

(declare-fun m!827443 () Bool)

(assert (=> mapNonEmpty!28348 m!827443))

(check-sat tp_is_empty!17877 (not b_next!15549) b_and!25785 (not b!887996) (not b!887997) (not start!75434) (not mapNonEmpty!28348))
(check-sat b_and!25785 (not b_next!15549))
