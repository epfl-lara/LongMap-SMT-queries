; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89260 () Bool)

(assert start!89260)

(declare-fun b!1023519 () Bool)

(declare-fun b_free!20301 () Bool)

(declare-fun b_next!20301 () Bool)

(assert (=> b!1023519 (= b_free!20301 (not b_next!20301))))

(declare-fun tp!71938 () Bool)

(declare-fun b_and!32523 () Bool)

(assert (=> b!1023519 (= tp!71938 b_and!32523)))

(declare-fun b!1023518 () Bool)

(declare-fun res!685475 () Bool)

(declare-fun e!576746 () Bool)

(assert (=> b!1023518 (=> (not res!685475) (not e!576746))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023518 (= res!685475 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!576745 () Bool)

(declare-fun tp_is_empty!24021 () Bool)

(declare-datatypes ((V!36901 0))(
  ( (V!36902 (val!12061 Int)) )
))
(declare-datatypes ((ValueCell!11307 0))(
  ( (ValueCellFull!11307 (v!14630 V!36901)) (EmptyCell!11307) )
))
(declare-datatypes ((array!64086 0))(
  ( (array!64087 (arr!30855 (Array (_ BitVec 32) (_ BitVec 64))) (size!31366 (_ BitVec 32))) )
))
(declare-datatypes ((array!64088 0))(
  ( (array!64089 (arr!30856 (Array (_ BitVec 32) ValueCell!11307)) (size!31367 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5208 0))(
  ( (LongMapFixedSize!5209 (defaultEntry!5956 Int) (mask!29579 (_ BitVec 32)) (extraKeys!5688 (_ BitVec 32)) (zeroValue!5792 V!36901) (minValue!5792 V!36901) (_size!2659 (_ BitVec 32)) (_keys!11101 array!64086) (_values!5979 array!64088) (_vacant!2659 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5208)

(declare-fun e!576743 () Bool)

(declare-fun array_inv!23907 (array!64086) Bool)

(declare-fun array_inv!23908 (array!64088) Bool)

(assert (=> b!1023519 (= e!576743 (and tp!71938 tp_is_empty!24021 (array_inv!23907 (_keys!11101 thiss!1427)) (array_inv!23908 (_values!5979 thiss!1427)) e!576745))))

(declare-fun b!1023520 () Bool)

(assert (=> b!1023520 (= e!576746 false)))

(declare-fun lt!450417 () Bool)

(declare-datatypes ((List!21715 0))(
  ( (Nil!21712) (Cons!21711 (h!22909 (_ BitVec 64)) (t!30753 List!21715)) )
))
(declare-fun arrayNoDuplicates!0 (array!64086 (_ BitVec 32) List!21715) Bool)

(assert (=> b!1023520 (= lt!450417 (arrayNoDuplicates!0 (_keys!11101 thiss!1427) #b00000000000000000000000000000000 Nil!21712))))

(declare-fun b!1023521 () Bool)

(declare-fun res!685476 () Bool)

(assert (=> b!1023521 (=> (not res!685476) (not e!576746))))

(assert (=> b!1023521 (= res!685476 (and (= (size!31367 (_values!5979 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29579 thiss!1427))) (= (size!31366 (_keys!11101 thiss!1427)) (size!31367 (_values!5979 thiss!1427))) (bvsge (mask!29579 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5688 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5688 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5688 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5688 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5688 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5688 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5688 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37449 () Bool)

(declare-fun mapRes!37449 () Bool)

(declare-fun tp!71937 () Bool)

(declare-fun e!576744 () Bool)

(assert (=> mapNonEmpty!37449 (= mapRes!37449 (and tp!71937 e!576744))))

(declare-fun mapRest!37449 () (Array (_ BitVec 32) ValueCell!11307))

(declare-fun mapValue!37449 () ValueCell!11307)

(declare-fun mapKey!37449 () (_ BitVec 32))

(assert (=> mapNonEmpty!37449 (= (arr!30856 (_values!5979 thiss!1427)) (store mapRest!37449 mapKey!37449 mapValue!37449))))

(declare-fun b!1023522 () Bool)

(declare-fun res!685474 () Bool)

(assert (=> b!1023522 (=> (not res!685474) (not e!576746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023522 (= res!685474 (validMask!0 (mask!29579 thiss!1427)))))

(declare-fun mapIsEmpty!37449 () Bool)

(assert (=> mapIsEmpty!37449 mapRes!37449))

(declare-fun b!1023523 () Bool)

(declare-fun e!576742 () Bool)

(assert (=> b!1023523 (= e!576742 tp_is_empty!24021)))

(declare-fun res!685478 () Bool)

(assert (=> start!89260 (=> (not res!685478) (not e!576746))))

(declare-fun valid!1984 (LongMapFixedSize!5208) Bool)

(assert (=> start!89260 (= res!685478 (valid!1984 thiss!1427))))

(assert (=> start!89260 e!576746))

(assert (=> start!89260 e!576743))

(assert (=> start!89260 true))

(declare-fun b!1023524 () Bool)

(declare-fun res!685477 () Bool)

(assert (=> b!1023524 (=> (not res!685477) (not e!576746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64086 (_ BitVec 32)) Bool)

(assert (=> b!1023524 (= res!685477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11101 thiss!1427) (mask!29579 thiss!1427)))))

(declare-fun b!1023525 () Bool)

(assert (=> b!1023525 (= e!576744 tp_is_empty!24021)))

(declare-fun b!1023526 () Bool)

(assert (=> b!1023526 (= e!576745 (and e!576742 mapRes!37449))))

(declare-fun condMapEmpty!37449 () Bool)

(declare-fun mapDefault!37449 () ValueCell!11307)

(assert (=> b!1023526 (= condMapEmpty!37449 (= (arr!30856 (_values!5979 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11307)) mapDefault!37449)))))

(assert (= (and start!89260 res!685478) b!1023518))

(assert (= (and b!1023518 res!685475) b!1023522))

(assert (= (and b!1023522 res!685474) b!1023521))

(assert (= (and b!1023521 res!685476) b!1023524))

(assert (= (and b!1023524 res!685477) b!1023520))

(assert (= (and b!1023526 condMapEmpty!37449) mapIsEmpty!37449))

(assert (= (and b!1023526 (not condMapEmpty!37449)) mapNonEmpty!37449))

(get-info :version)

(assert (= (and mapNonEmpty!37449 ((_ is ValueCellFull!11307) mapValue!37449)) b!1023525))

(assert (= (and b!1023526 ((_ is ValueCellFull!11307) mapDefault!37449)) b!1023523))

(assert (= b!1023519 b!1023526))

(assert (= start!89260 b!1023519))

(declare-fun m!942163 () Bool)

(assert (=> start!89260 m!942163))

(declare-fun m!942165 () Bool)

(assert (=> b!1023522 m!942165))

(declare-fun m!942167 () Bool)

(assert (=> b!1023519 m!942167))

(declare-fun m!942169 () Bool)

(assert (=> b!1023519 m!942169))

(declare-fun m!942171 () Bool)

(assert (=> mapNonEmpty!37449 m!942171))

(declare-fun m!942173 () Bool)

(assert (=> b!1023520 m!942173))

(declare-fun m!942175 () Bool)

(assert (=> b!1023524 m!942175))

(check-sat (not b!1023522) (not b!1023524) tp_is_empty!24021 (not start!89260) (not b!1023520) (not b!1023519) b_and!32523 (not b_next!20301) (not mapNonEmpty!37449))
(check-sat b_and!32523 (not b_next!20301))
