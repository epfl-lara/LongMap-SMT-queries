; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89230 () Bool)

(assert start!89230)

(declare-fun b!1023117 () Bool)

(declare-fun b_free!20271 () Bool)

(declare-fun b_next!20271 () Bool)

(assert (=> b!1023117 (= b_free!20271 (not b_next!20271))))

(declare-fun tp!71848 () Bool)

(declare-fun b_and!32493 () Bool)

(assert (=> b!1023117 (= tp!71848 b_and!32493)))

(declare-fun res!685251 () Bool)

(declare-fun e!576473 () Bool)

(assert (=> start!89230 (=> (not res!685251) (not e!576473))))

(declare-datatypes ((V!36861 0))(
  ( (V!36862 (val!12046 Int)) )
))
(declare-datatypes ((ValueCell!11292 0))(
  ( (ValueCellFull!11292 (v!14615 V!36861)) (EmptyCell!11292) )
))
(declare-datatypes ((array!64026 0))(
  ( (array!64027 (arr!30825 (Array (_ BitVec 32) (_ BitVec 64))) (size!31336 (_ BitVec 32))) )
))
(declare-datatypes ((array!64028 0))(
  ( (array!64029 (arr!30826 (Array (_ BitVec 32) ValueCell!11292)) (size!31337 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5178 0))(
  ( (LongMapFixedSize!5179 (defaultEntry!5941 Int) (mask!29554 (_ BitVec 32)) (extraKeys!5673 (_ BitVec 32)) (zeroValue!5777 V!36861) (minValue!5777 V!36861) (_size!2644 (_ BitVec 32)) (_keys!11086 array!64026) (_values!5964 array!64028) (_vacant!2644 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5178)

(declare-fun valid!1973 (LongMapFixedSize!5178) Bool)

(assert (=> start!89230 (= res!685251 (valid!1973 thiss!1427))))

(assert (=> start!89230 e!576473))

(declare-fun e!576476 () Bool)

(assert (=> start!89230 e!576476))

(assert (=> start!89230 true))

(declare-fun b!1023113 () Bool)

(declare-fun e!576477 () Bool)

(declare-fun tp_is_empty!23991 () Bool)

(assert (=> b!1023113 (= e!576477 tp_is_empty!23991)))

(declare-fun b!1023114 () Bool)

(declare-fun e!576475 () Bool)

(assert (=> b!1023114 (= e!576475 tp_is_empty!23991)))

(declare-fun b!1023115 () Bool)

(declare-fun res!685253 () Bool)

(assert (=> b!1023115 (=> (not res!685253) (not e!576473))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023115 (= res!685253 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023116 () Bool)

(declare-fun e!576474 () Bool)

(declare-fun mapRes!37404 () Bool)

(assert (=> b!1023116 (= e!576474 (and e!576477 mapRes!37404))))

(declare-fun condMapEmpty!37404 () Bool)

(declare-fun mapDefault!37404 () ValueCell!11292)

(assert (=> b!1023116 (= condMapEmpty!37404 (= (arr!30826 (_values!5964 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11292)) mapDefault!37404)))))

(declare-fun array_inv!23883 (array!64026) Bool)

(declare-fun array_inv!23884 (array!64028) Bool)

(assert (=> b!1023117 (= e!576476 (and tp!71848 tp_is_empty!23991 (array_inv!23883 (_keys!11086 thiss!1427)) (array_inv!23884 (_values!5964 thiss!1427)) e!576474))))

(declare-fun mapIsEmpty!37404 () Bool)

(assert (=> mapIsEmpty!37404 mapRes!37404))

(declare-fun b!1023118 () Bool)

(assert (=> b!1023118 (= e!576473 false)))

(declare-fun lt!450372 () Bool)

(declare-datatypes ((List!21704 0))(
  ( (Nil!21701) (Cons!21700 (h!22898 (_ BitVec 64)) (t!30742 List!21704)) )
))
(declare-fun arrayNoDuplicates!0 (array!64026 (_ BitVec 32) List!21704) Bool)

(assert (=> b!1023118 (= lt!450372 (arrayNoDuplicates!0 (_keys!11086 thiss!1427) #b00000000000000000000000000000000 Nil!21701))))

(declare-fun mapNonEmpty!37404 () Bool)

(declare-fun tp!71847 () Bool)

(assert (=> mapNonEmpty!37404 (= mapRes!37404 (and tp!71847 e!576475))))

(declare-fun mapKey!37404 () (_ BitVec 32))

(declare-fun mapRest!37404 () (Array (_ BitVec 32) ValueCell!11292))

(declare-fun mapValue!37404 () ValueCell!11292)

(assert (=> mapNonEmpty!37404 (= (arr!30826 (_values!5964 thiss!1427)) (store mapRest!37404 mapKey!37404 mapValue!37404))))

(declare-fun b!1023119 () Bool)

(declare-fun res!685249 () Bool)

(assert (=> b!1023119 (=> (not res!685249) (not e!576473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64026 (_ BitVec 32)) Bool)

(assert (=> b!1023119 (= res!685249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11086 thiss!1427) (mask!29554 thiss!1427)))))

(declare-fun b!1023120 () Bool)

(declare-fun res!685252 () Bool)

(assert (=> b!1023120 (=> (not res!685252) (not e!576473))))

(assert (=> b!1023120 (= res!685252 (and (= (size!31337 (_values!5964 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29554 thiss!1427))) (= (size!31336 (_keys!11086 thiss!1427)) (size!31337 (_values!5964 thiss!1427))) (bvsge (mask!29554 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5673 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5673 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5673 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5673 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5673 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5673 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5673 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023121 () Bool)

(declare-fun res!685250 () Bool)

(assert (=> b!1023121 (=> (not res!685250) (not e!576473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023121 (= res!685250 (validMask!0 (mask!29554 thiss!1427)))))

(assert (= (and start!89230 res!685251) b!1023115))

(assert (= (and b!1023115 res!685253) b!1023121))

(assert (= (and b!1023121 res!685250) b!1023120))

(assert (= (and b!1023120 res!685252) b!1023119))

(assert (= (and b!1023119 res!685249) b!1023118))

(assert (= (and b!1023116 condMapEmpty!37404) mapIsEmpty!37404))

(assert (= (and b!1023116 (not condMapEmpty!37404)) mapNonEmpty!37404))

(get-info :version)

(assert (= (and mapNonEmpty!37404 ((_ is ValueCellFull!11292) mapValue!37404)) b!1023114))

(assert (= (and b!1023116 ((_ is ValueCellFull!11292) mapDefault!37404)) b!1023113))

(assert (= b!1023117 b!1023116))

(assert (= start!89230 b!1023117))

(declare-fun m!941953 () Bool)

(assert (=> b!1023119 m!941953))

(declare-fun m!941955 () Bool)

(assert (=> mapNonEmpty!37404 m!941955))

(declare-fun m!941957 () Bool)

(assert (=> b!1023117 m!941957))

(declare-fun m!941959 () Bool)

(assert (=> b!1023117 m!941959))

(declare-fun m!941961 () Bool)

(assert (=> b!1023118 m!941961))

(declare-fun m!941963 () Bool)

(assert (=> b!1023121 m!941963))

(declare-fun m!941965 () Bool)

(assert (=> start!89230 m!941965))

(check-sat (not mapNonEmpty!37404) b_and!32493 (not b!1023121) (not b!1023117) (not b!1023119) (not b!1023118) tp_is_empty!23991 (not b_next!20271) (not start!89230))
(check-sat b_and!32493 (not b_next!20271))
