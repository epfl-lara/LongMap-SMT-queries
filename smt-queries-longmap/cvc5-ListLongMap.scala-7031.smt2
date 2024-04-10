; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89198 () Bool)

(assert start!89198)

(declare-fun b!1022683 () Bool)

(declare-fun b_free!20239 () Bool)

(declare-fun b_next!20239 () Bool)

(assert (=> b!1022683 (= b_free!20239 (not b_next!20239))))

(declare-fun tp!71751 () Bool)

(declare-fun b_and!32461 () Bool)

(assert (=> b!1022683 (= tp!71751 b_and!32461)))

(declare-fun b!1022681 () Bool)

(declare-fun e!576188 () Bool)

(declare-fun tp_is_empty!23959 () Bool)

(assert (=> b!1022681 (= e!576188 tp_is_empty!23959)))

(declare-fun b!1022682 () Bool)

(declare-fun res!685012 () Bool)

(declare-fun e!576185 () Bool)

(assert (=> b!1022682 (=> (not res!685012) (not e!576185))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022682 (= res!685012 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!576184 () Bool)

(declare-fun e!576187 () Bool)

(declare-datatypes ((V!36819 0))(
  ( (V!36820 (val!12030 Int)) )
))
(declare-datatypes ((ValueCell!11276 0))(
  ( (ValueCellFull!11276 (v!14599 V!36819)) (EmptyCell!11276) )
))
(declare-datatypes ((array!63962 0))(
  ( (array!63963 (arr!30793 (Array (_ BitVec 32) (_ BitVec 64))) (size!31304 (_ BitVec 32))) )
))
(declare-datatypes ((array!63964 0))(
  ( (array!63965 (arr!30794 (Array (_ BitVec 32) ValueCell!11276)) (size!31305 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5146 0))(
  ( (LongMapFixedSize!5147 (defaultEntry!5925 Int) (mask!29528 (_ BitVec 32)) (extraKeys!5657 (_ BitVec 32)) (zeroValue!5761 V!36819) (minValue!5761 V!36819) (_size!2628 (_ BitVec 32)) (_keys!11070 array!63962) (_values!5948 array!63964) (_vacant!2628 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5146)

(declare-fun array_inv!23865 (array!63962) Bool)

(declare-fun array_inv!23866 (array!63964) Bool)

(assert (=> b!1022683 (= e!576187 (and tp!71751 tp_is_empty!23959 (array_inv!23865 (_keys!11070 thiss!1427)) (array_inv!23866 (_values!5948 thiss!1427)) e!576184))))

(declare-fun res!685010 () Bool)

(assert (=> start!89198 (=> (not res!685010) (not e!576185))))

(declare-fun valid!1961 (LongMapFixedSize!5146) Bool)

(assert (=> start!89198 (= res!685010 (valid!1961 thiss!1427))))

(assert (=> start!89198 e!576185))

(assert (=> start!89198 e!576187))

(assert (=> start!89198 true))

(declare-fun b!1022684 () Bool)

(declare-fun res!685011 () Bool)

(assert (=> b!1022684 (=> (not res!685011) (not e!576185))))

(assert (=> b!1022684 (= res!685011 (and (= (size!31305 (_values!5948 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29528 thiss!1427))) (= (size!31304 (_keys!11070 thiss!1427)) (size!31305 (_values!5948 thiss!1427))) (bvsge (mask!29528 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5657 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5657 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5657 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022685 () Bool)

(declare-fun e!576189 () Bool)

(assert (=> b!1022685 (= e!576189 tp_is_empty!23959)))

(declare-fun b!1022686 () Bool)

(declare-fun res!685009 () Bool)

(assert (=> b!1022686 (=> (not res!685009) (not e!576185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63962 (_ BitVec 32)) Bool)

(assert (=> b!1022686 (= res!685009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11070 thiss!1427) (mask!29528 thiss!1427)))))

(declare-fun b!1022687 () Bool)

(assert (=> b!1022687 (= e!576185 false)))

(declare-fun lt!450324 () Bool)

(declare-datatypes ((List!21691 0))(
  ( (Nil!21688) (Cons!21687 (h!22885 (_ BitVec 64)) (t!30729 List!21691)) )
))
(declare-fun arrayNoDuplicates!0 (array!63962 (_ BitVec 32) List!21691) Bool)

(assert (=> b!1022687 (= lt!450324 (arrayNoDuplicates!0 (_keys!11070 thiss!1427) #b00000000000000000000000000000000 Nil!21688))))

(declare-fun mapIsEmpty!37356 () Bool)

(declare-fun mapRes!37356 () Bool)

(assert (=> mapIsEmpty!37356 mapRes!37356))

(declare-fun mapNonEmpty!37356 () Bool)

(declare-fun tp!71752 () Bool)

(assert (=> mapNonEmpty!37356 (= mapRes!37356 (and tp!71752 e!576189))))

(declare-fun mapKey!37356 () (_ BitVec 32))

(declare-fun mapValue!37356 () ValueCell!11276)

(declare-fun mapRest!37356 () (Array (_ BitVec 32) ValueCell!11276))

(assert (=> mapNonEmpty!37356 (= (arr!30794 (_values!5948 thiss!1427)) (store mapRest!37356 mapKey!37356 mapValue!37356))))

(declare-fun b!1022688 () Bool)

(declare-fun res!685013 () Bool)

(assert (=> b!1022688 (=> (not res!685013) (not e!576185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022688 (= res!685013 (validMask!0 (mask!29528 thiss!1427)))))

(declare-fun b!1022689 () Bool)

(assert (=> b!1022689 (= e!576184 (and e!576188 mapRes!37356))))

(declare-fun condMapEmpty!37356 () Bool)

(declare-fun mapDefault!37356 () ValueCell!11276)

