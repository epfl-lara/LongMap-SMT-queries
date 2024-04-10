; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9210 () Bool)

(assert start!9210)

(declare-fun b!65594 () Bool)

(declare-fun b_free!2037 () Bool)

(declare-fun b_next!2037 () Bool)

(assert (=> b!65594 (= b_free!2037 (not b_next!2037))))

(declare-fun tp!8262 () Bool)

(declare-fun b_and!4027 () Bool)

(assert (=> b!65594 (= tp!8262 b_and!4027)))

(declare-fun b!65585 () Bool)

(declare-fun b_free!2039 () Bool)

(declare-fun b_next!2039 () Bool)

(assert (=> b!65585 (= b_free!2039 (not b_next!2039))))

(declare-fun tp!8261 () Bool)

(declare-fun b_and!4029 () Bool)

(assert (=> b!65585 (= tp!8261 b_and!4029)))

(declare-fun b!65580 () Bool)

(declare-fun e!42965 () Bool)

(declare-fun tp_is_empty!2435 () Bool)

(assert (=> b!65580 (= e!42965 tp_is_empty!2435)))

(declare-fun mapNonEmpty!3023 () Bool)

(declare-fun mapRes!3023 () Bool)

(declare-fun tp!8260 () Bool)

(declare-fun e!42971 () Bool)

(assert (=> mapNonEmpty!3023 (= mapRes!3023 (and tp!8260 e!42971))))

(declare-datatypes ((V!2893 0))(
  ( (V!2894 (val!1262 Int)) )
))
(declare-datatypes ((ValueCell!874 0))(
  ( (ValueCellFull!874 (v!2460 V!2893)) (EmptyCell!874) )
))
(declare-fun mapValue!3023 () ValueCell!874)

(declare-fun mapKey!3024 () (_ BitVec 32))

(declare-datatypes ((array!3807 0))(
  ( (array!3808 (arr!1819 (Array (_ BitVec 32) (_ BitVec 64))) (size!2054 (_ BitVec 32))) )
))
(declare-datatypes ((array!3809 0))(
  ( (array!3810 (arr!1820 (Array (_ BitVec 32) ValueCell!874)) (size!2055 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!656 0))(
  ( (LongMapFixedSize!657 (defaultEntry!2136 Int) (mask!6064 (_ BitVec 32)) (extraKeys!2007 (_ BitVec 32)) (zeroValue!2044 V!2893) (minValue!2044 V!2893) (_size!377 (_ BitVec 32)) (_keys!3776 array!3807) (_values!2119 array!3809) (_vacant!377 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!656)

(declare-fun mapRest!3024 () (Array (_ BitVec 32) ValueCell!874))

(assert (=> mapNonEmpty!3023 (= (arr!1820 (_values!2119 newMap!16)) (store mapRest!3024 mapKey!3024 mapValue!3023))))

(declare-fun b!65581 () Bool)

(declare-fun e!42959 () Bool)

(assert (=> b!65581 (= e!42959 tp_is_empty!2435)))

(declare-fun b!65582 () Bool)

(declare-fun e!42966 () Bool)

(assert (=> b!65582 (= e!42966 tp_is_empty!2435)))

(declare-fun b!65583 () Bool)

(declare-fun e!42963 () Bool)

(declare-fun e!42969 () Bool)

(assert (=> b!65583 (= e!42963 e!42969)))

(declare-fun b!65584 () Bool)

(declare-fun res!35658 () Bool)

(declare-fun e!42958 () Bool)

(assert (=> b!65584 (=> (not res!35658) (not e!42958))))

(declare-datatypes ((Cell!464 0))(
  ( (Cell!465 (v!2461 LongMapFixedSize!656)) )
))
(declare-datatypes ((LongMap!464 0))(
  ( (LongMap!465 (underlying!243 Cell!464)) )
))
(declare-fun thiss!992 () LongMap!464)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3807 (_ BitVec 32)) Bool)

(assert (=> b!65584 (= res!35658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3776 (v!2461 (underlying!243 thiss!992))) (mask!6064 (v!2461 (underlying!243 thiss!992)))))))

(declare-fun b!65586 () Bool)

(declare-fun res!35661 () Bool)

(assert (=> b!65586 (=> (not res!35661) (not e!42958))))

(declare-datatypes ((List!1455 0))(
  ( (Nil!1452) (Cons!1451 (h!2035 (_ BitVec 64)) (t!4905 List!1455)) )
))
(declare-fun arrayNoDuplicates!0 (array!3807 (_ BitVec 32) List!1455) Bool)

(assert (=> b!65586 (= res!35661 (arrayNoDuplicates!0 (_keys!3776 (v!2461 (underlying!243 thiss!992))) #b00000000000000000000000000000000 Nil!1452))))

(declare-fun b!65587 () Bool)

(declare-fun e!42967 () Bool)

(declare-fun mapRes!3024 () Bool)

(assert (=> b!65587 (= e!42967 (and e!42965 mapRes!3024))))

(declare-fun condMapEmpty!3023 () Bool)

(declare-fun mapDefault!3024 () ValueCell!874)

