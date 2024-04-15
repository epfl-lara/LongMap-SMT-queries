; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90834 () Bool)

(assert start!90834)

(declare-fun b!1038159 () Bool)

(declare-fun b_free!20935 () Bool)

(declare-fun b_next!20935 () Bool)

(assert (=> b!1038159 (= b_free!20935 (not b_next!20935))))

(declare-fun tp!73966 () Bool)

(declare-fun b_and!33441 () Bool)

(assert (=> b!1038159 (= tp!73966 b_and!33441)))

(declare-fun b!1038158 () Bool)

(declare-fun e!587382 () Bool)

(declare-fun e!587381 () Bool)

(assert (=> b!1038158 (= e!587382 e!587381)))

(declare-fun res!692587 () Bool)

(assert (=> b!1038158 (=> (not res!692587) (not e!587381))))

(declare-datatypes ((SeekEntryResult!9761 0))(
  ( (MissingZero!9761 (index!41415 (_ BitVec 32))) (Found!9761 (index!41416 (_ BitVec 32))) (Intermediate!9761 (undefined!10573 Bool) (index!41417 (_ BitVec 32)) (x!92637 (_ BitVec 32))) (Undefined!9761) (MissingVacant!9761 (index!41418 (_ BitVec 32))) )
))
(declare-fun lt!457498 () SeekEntryResult!9761)

(get-info :version)

(assert (=> b!1038158 (= res!692587 ((_ is Found!9761) lt!457498))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37747 0))(
  ( (V!37748 (val!12378 Int)) )
))
(declare-datatypes ((ValueCell!11624 0))(
  ( (ValueCellFull!11624 (v!14963 V!37747)) (EmptyCell!11624) )
))
(declare-datatypes ((array!65363 0))(
  ( (array!65364 (arr!31458 (Array (_ BitVec 32) (_ BitVec 64))) (size!31990 (_ BitVec 32))) )
))
(declare-datatypes ((array!65365 0))(
  ( (array!65366 (arr!31459 (Array (_ BitVec 32) ValueCell!11624)) (size!31991 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5842 0))(
  ( (LongMapFixedSize!5843 (defaultEntry!6303 Int) (mask!30234 (_ BitVec 32)) (extraKeys!6031 (_ BitVec 32)) (zeroValue!6137 V!37747) (minValue!6137 V!37747) (_size!2976 (_ BitVec 32)) (_keys!11500 array!65363) (_values!6326 array!65365) (_vacant!2976 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5842)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65363 (_ BitVec 32)) SeekEntryResult!9761)

(assert (=> b!1038158 (= lt!457498 (seekEntry!0 key!909 (_keys!11500 thiss!1427) (mask!30234 thiss!1427)))))

(declare-fun tp_is_empty!24655 () Bool)

(declare-fun e!587386 () Bool)

(declare-fun e!587383 () Bool)

(declare-fun array_inv!24325 (array!65363) Bool)

(declare-fun array_inv!24326 (array!65365) Bool)

(assert (=> b!1038159 (= e!587386 (and tp!73966 tp_is_empty!24655 (array_inv!24325 (_keys!11500 thiss!1427)) (array_inv!24326 (_values!6326 thiss!1427)) e!587383))))

(declare-fun res!692594 () Bool)

(assert (=> start!90834 (=> (not res!692594) (not e!587382))))

(declare-fun valid!2191 (LongMapFixedSize!5842) Bool)

(assert (=> start!90834 (= res!692594 (valid!2191 thiss!1427))))

(assert (=> start!90834 e!587382))

(assert (=> start!90834 e!587386))

(assert (=> start!90834 true))

(declare-fun b!1038160 () Bool)

(declare-fun res!692593 () Bool)

(declare-fun e!587379 () Bool)

(assert (=> b!1038160 (=> res!692593 e!587379)))

(declare-datatypes ((List!21968 0))(
  ( (Nil!21965) (Cons!21964 (h!23167 (_ BitVec 64)) (t!31173 List!21968)) )
))
(declare-fun noDuplicate!1496 (List!21968) Bool)

(assert (=> b!1038160 (= res!692593 (not (noDuplicate!1496 Nil!21965)))))

(declare-fun b!1038161 () Bool)

(declare-fun res!692590 () Bool)

(assert (=> b!1038161 (=> res!692590 e!587379)))

(declare-fun arrayNoDuplicates!0 (array!65363 (_ BitVec 32) List!21968) Bool)

(assert (=> b!1038161 (= res!692590 (not (arrayNoDuplicates!0 (_keys!11500 thiss!1427) #b00000000000000000000000000000000 Nil!21965)))))

(declare-fun mapIsEmpty!38526 () Bool)

(declare-fun mapRes!38526 () Bool)

(assert (=> mapIsEmpty!38526 mapRes!38526))

(declare-fun b!1038162 () Bool)

(declare-fun res!692592 () Bool)

(assert (=> b!1038162 (=> res!692592 e!587379)))

(declare-fun contains!6015 (List!21968 (_ BitVec 64)) Bool)

(assert (=> b!1038162 (= res!692592 (contains!6015 Nil!21965 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038163 () Bool)

(assert (=> b!1038163 (= e!587379 true)))

(declare-fun b!1038164 () Bool)

(declare-fun res!692588 () Bool)

(assert (=> b!1038164 (=> (not res!692588) (not e!587382))))

(assert (=> b!1038164 (= res!692588 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038165 () Bool)

(declare-fun e!587380 () Bool)

(assert (=> b!1038165 (= e!587383 (and e!587380 mapRes!38526))))

(declare-fun condMapEmpty!38526 () Bool)

(declare-fun mapDefault!38526 () ValueCell!11624)

(assert (=> b!1038165 (= condMapEmpty!38526 (= (arr!31459 (_values!6326 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11624)) mapDefault!38526)))))

(declare-fun b!1038166 () Bool)

(assert (=> b!1038166 (= e!587381 (not e!587379))))

(declare-fun res!692591 () Bool)

(assert (=> b!1038166 (=> res!692591 e!587379)))

(assert (=> b!1038166 (= res!692591 (or (bvsge (size!31990 (_keys!11500 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31990 (_keys!11500 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65363 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038166 (= (arrayCountValidKeys!0 (array!65364 (store (arr!31458 (_keys!11500 thiss!1427)) (index!41416 lt!457498) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31990 (_keys!11500 thiss!1427))) #b00000000000000000000000000000000 (size!31990 (_keys!11500 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11500 thiss!1427) #b00000000000000000000000000000000 (size!31990 (_keys!11500 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33853 0))(
  ( (Unit!33854) )
))
(declare-fun lt!457499 () Unit!33853)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65363 (_ BitVec 32) (_ BitVec 64)) Unit!33853)

(assert (=> b!1038166 (= lt!457499 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11500 thiss!1427) (index!41416 lt!457498) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038167 () Bool)

(declare-fun e!587384 () Bool)

(assert (=> b!1038167 (= e!587384 tp_is_empty!24655)))

(declare-fun b!1038168 () Bool)

(declare-fun res!692589 () Bool)

(assert (=> b!1038168 (=> res!692589 e!587379)))

(assert (=> b!1038168 (= res!692589 (contains!6015 Nil!21965 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038169 () Bool)

(assert (=> b!1038169 (= e!587380 tp_is_empty!24655)))

(declare-fun mapNonEmpty!38526 () Bool)

(declare-fun tp!73965 () Bool)

(assert (=> mapNonEmpty!38526 (= mapRes!38526 (and tp!73965 e!587384))))

(declare-fun mapRest!38526 () (Array (_ BitVec 32) ValueCell!11624))

(declare-fun mapKey!38526 () (_ BitVec 32))

(declare-fun mapValue!38526 () ValueCell!11624)

(assert (=> mapNonEmpty!38526 (= (arr!31459 (_values!6326 thiss!1427)) (store mapRest!38526 mapKey!38526 mapValue!38526))))

(assert (= (and start!90834 res!692594) b!1038164))

(assert (= (and b!1038164 res!692588) b!1038158))

(assert (= (and b!1038158 res!692587) b!1038166))

(assert (= (and b!1038166 (not res!692591)) b!1038160))

(assert (= (and b!1038160 (not res!692593)) b!1038168))

(assert (= (and b!1038168 (not res!692589)) b!1038162))

(assert (= (and b!1038162 (not res!692592)) b!1038161))

(assert (= (and b!1038161 (not res!692590)) b!1038163))

(assert (= (and b!1038165 condMapEmpty!38526) mapIsEmpty!38526))

(assert (= (and b!1038165 (not condMapEmpty!38526)) mapNonEmpty!38526))

(assert (= (and mapNonEmpty!38526 ((_ is ValueCellFull!11624) mapValue!38526)) b!1038167))

(assert (= (and b!1038165 ((_ is ValueCellFull!11624) mapDefault!38526)) b!1038169))

(assert (= b!1038159 b!1038165))

(assert (= start!90834 b!1038159))

(declare-fun m!957651 () Bool)

(assert (=> b!1038168 m!957651))

(declare-fun m!957653 () Bool)

(assert (=> b!1038162 m!957653))

(declare-fun m!957655 () Bool)

(assert (=> start!90834 m!957655))

(declare-fun m!957657 () Bool)

(assert (=> b!1038160 m!957657))

(declare-fun m!957659 () Bool)

(assert (=> mapNonEmpty!38526 m!957659))

(declare-fun m!957661 () Bool)

(assert (=> b!1038161 m!957661))

(declare-fun m!957663 () Bool)

(assert (=> b!1038166 m!957663))

(declare-fun m!957665 () Bool)

(assert (=> b!1038166 m!957665))

(declare-fun m!957667 () Bool)

(assert (=> b!1038166 m!957667))

(declare-fun m!957669 () Bool)

(assert (=> b!1038166 m!957669))

(declare-fun m!957671 () Bool)

(assert (=> b!1038159 m!957671))

(declare-fun m!957673 () Bool)

(assert (=> b!1038159 m!957673))

(declare-fun m!957675 () Bool)

(assert (=> b!1038158 m!957675))

(check-sat (not b!1038161) tp_is_empty!24655 (not b!1038166) (not b!1038159) (not b!1038168) (not b!1038162) (not start!90834) b_and!33441 (not b_next!20935) (not mapNonEmpty!38526) (not b!1038158) (not b!1038160))
(check-sat b_and!33441 (not b_next!20935))
