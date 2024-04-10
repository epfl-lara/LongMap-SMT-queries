; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75692 () Bool)

(assert start!75692)

(declare-fun b!889957 () Bool)

(declare-fun b_free!15663 () Bool)

(declare-fun b_next!15663 () Bool)

(assert (=> b!889957 (= b_free!15663 (not b_next!15663))))

(declare-fun tp!54957 () Bool)

(declare-fun b_and!25903 () Bool)

(assert (=> b!889957 (= tp!54957 b_and!25903)))

(declare-fun e!496192 () Bool)

(declare-datatypes ((array!51962 0))(
  ( (array!51963 (arr!24987 (Array (_ BitVec 32) (_ BitVec 64))) (size!25431 (_ BitVec 32))) )
))
(declare-datatypes ((V!28953 0))(
  ( (V!28954 (val!9046 Int)) )
))
(declare-datatypes ((ValueCell!8514 0))(
  ( (ValueCellFull!8514 (v!11524 V!28953)) (EmptyCell!8514) )
))
(declare-datatypes ((array!51964 0))(
  ( (array!51965 (arr!24988 (Array (_ BitVec 32) ValueCell!8514)) (size!25432 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4044 0))(
  ( (LongMapFixedSize!4045 (defaultEntry!5219 Int) (mask!25680 (_ BitVec 32)) (extraKeys!4913 (_ BitVec 32)) (zeroValue!5017 V!28953) (minValue!5017 V!28953) (_size!2077 (_ BitVec 32)) (_keys!9902 array!51962) (_values!5204 array!51964) (_vacant!2077 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4044)

(declare-fun tp_is_empty!17991 () Bool)

(declare-fun e!496189 () Bool)

(declare-fun array_inv!19650 (array!51962) Bool)

(declare-fun array_inv!19651 (array!51964) Bool)

(assert (=> b!889957 (= e!496189 (and tp!54957 tp_is_empty!17991 (array_inv!19650 (_keys!9902 thiss!1181)) (array_inv!19651 (_values!5204 thiss!1181)) e!496192))))

(declare-fun res!603074 () Bool)

(declare-fun e!496188 () Bool)

(assert (=> start!75692 (=> (not res!603074) (not e!496188))))

(declare-fun valid!1570 (LongMapFixedSize!4044) Bool)

(assert (=> start!75692 (= res!603074 (valid!1570 thiss!1181))))

(assert (=> start!75692 e!496188))

(assert (=> start!75692 e!496189))

(assert (=> start!75692 true))

(declare-fun b!889958 () Bool)

(declare-fun e!496194 () Bool)

(assert (=> b!889958 (= e!496194 tp_is_empty!17991)))

(declare-fun b!889959 () Bool)

(declare-fun e!496193 () Bool)

(assert (=> b!889959 (= e!496193 false)))

(declare-fun lt!402148 () Bool)

(declare-datatypes ((List!17714 0))(
  ( (Nil!17711) (Cons!17710 (h!18841 (_ BitVec 64)) (t!25013 List!17714)) )
))
(declare-fun arrayNoDuplicates!0 (array!51962 (_ BitVec 32) List!17714) Bool)

(assert (=> b!889959 (= lt!402148 (arrayNoDuplicates!0 (_keys!9902 thiss!1181) #b00000000000000000000000000000000 Nil!17711))))

(declare-fun mapIsEmpty!28541 () Bool)

(declare-fun mapRes!28541 () Bool)

(assert (=> mapIsEmpty!28541 mapRes!28541))

(declare-fun b!889960 () Bool)

(declare-fun res!603071 () Bool)

(assert (=> b!889960 (=> (not res!603071) (not e!496188))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889960 (= res!603071 (not (= key!785 (bvneg key!785))))))

(declare-fun b!889961 () Bool)

(assert (=> b!889961 (= e!496188 e!496193)))

(declare-fun res!603073 () Bool)

(assert (=> b!889961 (=> (not res!603073) (not e!496193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889961 (= res!603073 (validMask!0 (mask!25680 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8787 0))(
  ( (MissingZero!8787 (index!37519 (_ BitVec 32))) (Found!8787 (index!37520 (_ BitVec 32))) (Intermediate!8787 (undefined!9599 Bool) (index!37521 (_ BitVec 32)) (x!75579 (_ BitVec 32))) (Undefined!8787) (MissingVacant!8787 (index!37522 (_ BitVec 32))) )
))
(declare-fun lt!402147 () SeekEntryResult!8787)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51962 (_ BitVec 32)) SeekEntryResult!8787)

(assert (=> b!889961 (= lt!402147 (seekEntry!0 key!785 (_keys!9902 thiss!1181) (mask!25680 thiss!1181)))))

(declare-fun b!889962 () Bool)

(declare-fun res!603072 () Bool)

(assert (=> b!889962 (=> (not res!603072) (not e!496193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51962 (_ BitVec 32)) Bool)

(assert (=> b!889962 (= res!603072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9902 thiss!1181) (mask!25680 thiss!1181)))))

(declare-fun b!889963 () Bool)

(declare-fun res!603070 () Bool)

(assert (=> b!889963 (=> (not res!603070) (not e!496193))))

(assert (=> b!889963 (= res!603070 (and (= (size!25432 (_values!5204 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25680 thiss!1181))) (= (size!25431 (_keys!9902 thiss!1181)) (size!25432 (_values!5204 thiss!1181))) (bvsge (mask!25680 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4913 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4913 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!889964 () Bool)

(declare-fun e!496190 () Bool)

(assert (=> b!889964 (= e!496192 (and e!496190 mapRes!28541))))

(declare-fun condMapEmpty!28541 () Bool)

(declare-fun mapDefault!28541 () ValueCell!8514)

(assert (=> b!889964 (= condMapEmpty!28541 (= (arr!24988 (_values!5204 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8514)) mapDefault!28541)))))

(declare-fun b!889965 () Bool)

(assert (=> b!889965 (= e!496190 tp_is_empty!17991)))

(declare-fun mapNonEmpty!28541 () Bool)

(declare-fun tp!54958 () Bool)

(assert (=> mapNonEmpty!28541 (= mapRes!28541 (and tp!54958 e!496194))))

(declare-fun mapRest!28541 () (Array (_ BitVec 32) ValueCell!8514))

(declare-fun mapKey!28541 () (_ BitVec 32))

(declare-fun mapValue!28541 () ValueCell!8514)

(assert (=> mapNonEmpty!28541 (= (arr!24988 (_values!5204 thiss!1181)) (store mapRest!28541 mapKey!28541 mapValue!28541))))

(assert (= (and start!75692 res!603074) b!889960))

(assert (= (and b!889960 res!603071) b!889961))

(assert (= (and b!889961 res!603073) b!889963))

(assert (= (and b!889963 res!603070) b!889962))

(assert (= (and b!889962 res!603072) b!889959))

(assert (= (and b!889964 condMapEmpty!28541) mapIsEmpty!28541))

(assert (= (and b!889964 (not condMapEmpty!28541)) mapNonEmpty!28541))

(get-info :version)

(assert (= (and mapNonEmpty!28541 ((_ is ValueCellFull!8514) mapValue!28541)) b!889958))

(assert (= (and b!889964 ((_ is ValueCellFull!8514) mapDefault!28541)) b!889965))

(assert (= b!889957 b!889964))

(assert (= start!75692 b!889957))

(declare-fun m!828661 () Bool)

(assert (=> b!889957 m!828661))

(declare-fun m!828663 () Bool)

(assert (=> b!889957 m!828663))

(declare-fun m!828665 () Bool)

(assert (=> start!75692 m!828665))

(declare-fun m!828667 () Bool)

(assert (=> mapNonEmpty!28541 m!828667))

(declare-fun m!828669 () Bool)

(assert (=> b!889959 m!828669))

(declare-fun m!828671 () Bool)

(assert (=> b!889961 m!828671))

(declare-fun m!828673 () Bool)

(assert (=> b!889961 m!828673))

(declare-fun m!828675 () Bool)

(assert (=> b!889962 m!828675))

(check-sat (not mapNonEmpty!28541) (not b!889961) (not b_next!15663) (not b!889959) (not b!889962) (not start!75692) (not b!889957) b_and!25903 tp_is_empty!17991)
(check-sat b_and!25903 (not b_next!15663))
