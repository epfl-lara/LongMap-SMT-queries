; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89206 () Bool)

(assert start!89206)

(declare-fun b!1022790 () Bool)

(declare-fun b_free!20247 () Bool)

(declare-fun b_next!20247 () Bool)

(assert (=> b!1022790 (= b_free!20247 (not b_next!20247))))

(declare-fun tp!71775 () Bool)

(declare-fun b_and!32469 () Bool)

(assert (=> b!1022790 (= tp!71775 b_and!32469)))

(declare-fun b!1022789 () Bool)

(declare-fun res!685070 () Bool)

(declare-fun e!576261 () Bool)

(assert (=> b!1022789 (=> (not res!685070) (not e!576261))))

(declare-datatypes ((V!36829 0))(
  ( (V!36830 (val!12034 Int)) )
))
(declare-datatypes ((ValueCell!11280 0))(
  ( (ValueCellFull!11280 (v!14603 V!36829)) (EmptyCell!11280) )
))
(declare-datatypes ((array!63978 0))(
  ( (array!63979 (arr!30801 (Array (_ BitVec 32) (_ BitVec 64))) (size!31312 (_ BitVec 32))) )
))
(declare-datatypes ((array!63980 0))(
  ( (array!63981 (arr!30802 (Array (_ BitVec 32) ValueCell!11280)) (size!31313 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5154 0))(
  ( (LongMapFixedSize!5155 (defaultEntry!5929 Int) (mask!29534 (_ BitVec 32)) (extraKeys!5661 (_ BitVec 32)) (zeroValue!5765 V!36829) (minValue!5765 V!36829) (_size!2632 (_ BitVec 32)) (_keys!11074 array!63978) (_values!5952 array!63980) (_vacant!2632 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5154)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63978 (_ BitVec 32)) Bool)

(assert (=> b!1022789 (= res!685070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11074 thiss!1427) (mask!29534 thiss!1427)))))

(declare-fun e!576259 () Bool)

(declare-fun e!576258 () Bool)

(declare-fun tp_is_empty!23967 () Bool)

(declare-fun array_inv!23869 (array!63978) Bool)

(declare-fun array_inv!23870 (array!63980) Bool)

(assert (=> b!1022790 (= e!576258 (and tp!71775 tp_is_empty!23967 (array_inv!23869 (_keys!11074 thiss!1427)) (array_inv!23870 (_values!5952 thiss!1427)) e!576259))))

(declare-fun b!1022791 () Bool)

(assert (=> b!1022791 (= e!576261 false)))

(declare-fun lt!450336 () Bool)

(declare-datatypes ((List!21694 0))(
  ( (Nil!21691) (Cons!21690 (h!22888 (_ BitVec 64)) (t!30732 List!21694)) )
))
(declare-fun arrayNoDuplicates!0 (array!63978 (_ BitVec 32) List!21694) Bool)

(assert (=> b!1022791 (= lt!450336 (arrayNoDuplicates!0 (_keys!11074 thiss!1427) #b00000000000000000000000000000000 Nil!21691))))

(declare-fun b!1022792 () Bool)

(declare-fun res!685069 () Bool)

(assert (=> b!1022792 (=> (not res!685069) (not e!576261))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022792 (= res!685069 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1022793 () Bool)

(declare-fun e!576256 () Bool)

(assert (=> b!1022793 (= e!576256 tp_is_empty!23967)))

(declare-fun res!685072 () Bool)

(assert (=> start!89206 (=> (not res!685072) (not e!576261))))

(declare-fun valid!1964 (LongMapFixedSize!5154) Bool)

(assert (=> start!89206 (= res!685072 (valid!1964 thiss!1427))))

(assert (=> start!89206 e!576261))

(assert (=> start!89206 e!576258))

(assert (=> start!89206 true))

(declare-fun b!1022794 () Bool)

(declare-fun res!685071 () Bool)

(assert (=> b!1022794 (=> (not res!685071) (not e!576261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022794 (= res!685071 (validMask!0 (mask!29534 thiss!1427)))))

(declare-fun mapNonEmpty!37368 () Bool)

(declare-fun mapRes!37368 () Bool)

(declare-fun tp!71776 () Bool)

(assert (=> mapNonEmpty!37368 (= mapRes!37368 (and tp!71776 e!576256))))

(declare-fun mapValue!37368 () ValueCell!11280)

(declare-fun mapRest!37368 () (Array (_ BitVec 32) ValueCell!11280))

(declare-fun mapKey!37368 () (_ BitVec 32))

(assert (=> mapNonEmpty!37368 (= (arr!30802 (_values!5952 thiss!1427)) (store mapRest!37368 mapKey!37368 mapValue!37368))))

(declare-fun mapIsEmpty!37368 () Bool)

(assert (=> mapIsEmpty!37368 mapRes!37368))

(declare-fun b!1022795 () Bool)

(declare-fun e!576260 () Bool)

(assert (=> b!1022795 (= e!576259 (and e!576260 mapRes!37368))))

(declare-fun condMapEmpty!37368 () Bool)

(declare-fun mapDefault!37368 () ValueCell!11280)

(assert (=> b!1022795 (= condMapEmpty!37368 (= (arr!30802 (_values!5952 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11280)) mapDefault!37368)))))

(declare-fun b!1022796 () Bool)

(assert (=> b!1022796 (= e!576260 tp_is_empty!23967)))

(declare-fun b!1022797 () Bool)

(declare-fun res!685073 () Bool)

(assert (=> b!1022797 (=> (not res!685073) (not e!576261))))

(assert (=> b!1022797 (= res!685073 (and (= (size!31313 (_values!5952 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29534 thiss!1427))) (= (size!31312 (_keys!11074 thiss!1427)) (size!31313 (_values!5952 thiss!1427))) (bvsge (mask!29534 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5661 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5661 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5661 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5661 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5661 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5661 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5661 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!89206 res!685072) b!1022792))

(assert (= (and b!1022792 res!685069) b!1022794))

(assert (= (and b!1022794 res!685071) b!1022797))

(assert (= (and b!1022797 res!685073) b!1022789))

(assert (= (and b!1022789 res!685070) b!1022791))

(assert (= (and b!1022795 condMapEmpty!37368) mapIsEmpty!37368))

(assert (= (and b!1022795 (not condMapEmpty!37368)) mapNonEmpty!37368))

(get-info :version)

(assert (= (and mapNonEmpty!37368 ((_ is ValueCellFull!11280) mapValue!37368)) b!1022793))

(assert (= (and b!1022795 ((_ is ValueCellFull!11280) mapDefault!37368)) b!1022796))

(assert (= b!1022790 b!1022795))

(assert (= start!89206 b!1022790))

(declare-fun m!941785 () Bool)

(assert (=> b!1022794 m!941785))

(declare-fun m!941787 () Bool)

(assert (=> mapNonEmpty!37368 m!941787))

(declare-fun m!941789 () Bool)

(assert (=> b!1022790 m!941789))

(declare-fun m!941791 () Bool)

(assert (=> b!1022790 m!941791))

(declare-fun m!941793 () Bool)

(assert (=> start!89206 m!941793))

(declare-fun m!941795 () Bool)

(assert (=> b!1022789 m!941795))

(declare-fun m!941797 () Bool)

(assert (=> b!1022791 m!941797))

(check-sat (not b!1022789) (not b!1022794) (not start!89206) (not b!1022790) (not b!1022791) tp_is_empty!23967 (not b_next!20247) (not mapNonEmpty!37368) b_and!32469)
(check-sat b_and!32469 (not b_next!20247))
