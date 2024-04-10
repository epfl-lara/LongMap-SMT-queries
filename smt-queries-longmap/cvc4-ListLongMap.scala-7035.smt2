; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89226 () Bool)

(assert start!89226)

(declare-fun b!1023059 () Bool)

(declare-fun b_free!20267 () Bool)

(declare-fun b_next!20267 () Bool)

(assert (=> b!1023059 (= b_free!20267 (not b_next!20267))))

(declare-fun tp!71836 () Bool)

(declare-fun b_and!32489 () Bool)

(assert (=> b!1023059 (= tp!71836 b_and!32489)))

(declare-fun mapNonEmpty!37398 () Bool)

(declare-fun mapRes!37398 () Bool)

(declare-fun tp!71835 () Bool)

(declare-fun e!576440 () Bool)

(assert (=> mapNonEmpty!37398 (= mapRes!37398 (and tp!71835 e!576440))))

(declare-fun mapKey!37398 () (_ BitVec 32))

(declare-datatypes ((V!36855 0))(
  ( (V!36856 (val!12044 Int)) )
))
(declare-datatypes ((ValueCell!11290 0))(
  ( (ValueCellFull!11290 (v!14613 V!36855)) (EmptyCell!11290) )
))
(declare-fun mapRest!37398 () (Array (_ BitVec 32) ValueCell!11290))

(declare-datatypes ((array!64018 0))(
  ( (array!64019 (arr!30821 (Array (_ BitVec 32) (_ BitVec 64))) (size!31332 (_ BitVec 32))) )
))
(declare-datatypes ((array!64020 0))(
  ( (array!64021 (arr!30822 (Array (_ BitVec 32) ValueCell!11290)) (size!31333 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5174 0))(
  ( (LongMapFixedSize!5175 (defaultEntry!5939 Int) (mask!29550 (_ BitVec 32)) (extraKeys!5671 (_ BitVec 32)) (zeroValue!5775 V!36855) (minValue!5775 V!36855) (_size!2642 (_ BitVec 32)) (_keys!11084 array!64018) (_values!5962 array!64020) (_vacant!2642 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5174)

(declare-fun mapValue!37398 () ValueCell!11290)

(assert (=> mapNonEmpty!37398 (= (arr!30822 (_values!5962 thiss!1427)) (store mapRest!37398 mapKey!37398 mapValue!37398))))

(declare-fun mapIsEmpty!37398 () Bool)

(assert (=> mapIsEmpty!37398 mapRes!37398))

(declare-fun e!576437 () Bool)

(declare-fun e!576439 () Bool)

(declare-fun tp_is_empty!23987 () Bool)

(declare-fun array_inv!23881 (array!64018) Bool)

(declare-fun array_inv!23882 (array!64020) Bool)

(assert (=> b!1023059 (= e!576437 (and tp!71836 tp_is_empty!23987 (array_inv!23881 (_keys!11084 thiss!1427)) (array_inv!23882 (_values!5962 thiss!1427)) e!576439))))

(declare-fun b!1023060 () Bool)

(declare-fun res!685219 () Bool)

(declare-fun e!576436 () Bool)

(assert (=> b!1023060 (=> (not res!685219) (not e!576436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023060 (= res!685219 (validMask!0 (mask!29550 thiss!1427)))))

(declare-fun b!1023061 () Bool)

(assert (=> b!1023061 (= e!576440 tp_is_empty!23987)))

(declare-fun b!1023062 () Bool)

(declare-fun e!576438 () Bool)

(assert (=> b!1023062 (= e!576438 tp_is_empty!23987)))

(declare-fun b!1023063 () Bool)

(declare-fun res!685222 () Bool)

(assert (=> b!1023063 (=> (not res!685222) (not e!576436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64018 (_ BitVec 32)) Bool)

(assert (=> b!1023063 (= res!685222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11084 thiss!1427) (mask!29550 thiss!1427)))))

(declare-fun res!685220 () Bool)

(assert (=> start!89226 (=> (not res!685220) (not e!576436))))

(declare-fun valid!1971 (LongMapFixedSize!5174) Bool)

(assert (=> start!89226 (= res!685220 (valid!1971 thiss!1427))))

(assert (=> start!89226 e!576436))

(assert (=> start!89226 e!576437))

(assert (=> start!89226 true))

(declare-fun b!1023064 () Bool)

(assert (=> b!1023064 (= e!576436 false)))

(declare-fun lt!450366 () Bool)

(declare-datatypes ((List!21703 0))(
  ( (Nil!21700) (Cons!21699 (h!22897 (_ BitVec 64)) (t!30741 List!21703)) )
))
(declare-fun arrayNoDuplicates!0 (array!64018 (_ BitVec 32) List!21703) Bool)

(assert (=> b!1023064 (= lt!450366 (arrayNoDuplicates!0 (_keys!11084 thiss!1427) #b00000000000000000000000000000000 Nil!21700))))

(declare-fun b!1023065 () Bool)

(declare-fun res!685221 () Bool)

(assert (=> b!1023065 (=> (not res!685221) (not e!576436))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023065 (= res!685221 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023066 () Bool)

(assert (=> b!1023066 (= e!576439 (and e!576438 mapRes!37398))))

(declare-fun condMapEmpty!37398 () Bool)

(declare-fun mapDefault!37398 () ValueCell!11290)

