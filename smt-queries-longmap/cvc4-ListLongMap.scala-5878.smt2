; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75802 () Bool)

(assert start!75802)

(declare-fun b!891662 () Bool)

(declare-fun b_free!15773 () Bool)

(declare-fun b_next!15773 () Bool)

(assert (=> b!891662 (= b_free!15773 (not b_next!15773))))

(declare-fun tp!55288 () Bool)

(declare-fun b_and!26013 () Bool)

(assert (=> b!891662 (= tp!55288 b_and!26013)))

(declare-fun b!891655 () Bool)

(declare-fun e!497595 () Bool)

(declare-fun tp_is_empty!18101 () Bool)

(assert (=> b!891655 (= e!497595 tp_is_empty!18101)))

(declare-fun res!604109 () Bool)

(declare-fun e!497594 () Bool)

(assert (=> start!75802 (=> (not res!604109) (not e!497594))))

(declare-datatypes ((array!52182 0))(
  ( (array!52183 (arr!25097 (Array (_ BitVec 32) (_ BitVec 64))) (size!25541 (_ BitVec 32))) )
))
(declare-datatypes ((V!29099 0))(
  ( (V!29100 (val!9101 Int)) )
))
(declare-datatypes ((ValueCell!8569 0))(
  ( (ValueCellFull!8569 (v!11579 V!29099)) (EmptyCell!8569) )
))
(declare-datatypes ((array!52184 0))(
  ( (array!52185 (arr!25098 (Array (_ BitVec 32) ValueCell!8569)) (size!25542 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4154 0))(
  ( (LongMapFixedSize!4155 (defaultEntry!5274 Int) (mask!25771 (_ BitVec 32)) (extraKeys!4968 (_ BitVec 32)) (zeroValue!5072 V!29099) (minValue!5072 V!29099) (_size!2132 (_ BitVec 32)) (_keys!9957 array!52182) (_values!5259 array!52184) (_vacant!2132 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4154)

(declare-fun valid!1608 (LongMapFixedSize!4154) Bool)

(assert (=> start!75802 (= res!604109 (valid!1608 thiss!1181))))

(assert (=> start!75802 e!497594))

(declare-fun e!497601 () Bool)

(assert (=> start!75802 e!497601))

(assert (=> start!75802 true))

(declare-fun b!891656 () Bool)

(declare-fun res!604111 () Bool)

(declare-fun e!497598 () Bool)

(assert (=> b!891656 (=> res!604111 e!497598)))

(declare-datatypes ((List!17752 0))(
  ( (Nil!17749) (Cons!17748 (h!18879 (_ BitVec 64)) (t!25051 List!17752)) )
))
(declare-fun arrayNoDuplicates!0 (array!52182 (_ BitVec 32) List!17752) Bool)

(assert (=> b!891656 (= res!604111 (not (arrayNoDuplicates!0 (_keys!9957 thiss!1181) #b00000000000000000000000000000000 Nil!17749)))))

(declare-fun b!891657 () Bool)

(declare-fun res!604114 () Bool)

(assert (=> b!891657 (=> res!604114 e!497598)))

(assert (=> b!891657 (= res!604114 (or (not (= (size!25542 (_values!5259 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25771 thiss!1181)))) (not (= (size!25541 (_keys!9957 thiss!1181)) (size!25542 (_values!5259 thiss!1181)))) (bvslt (mask!25771 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4968 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4968 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28706 () Bool)

(declare-fun mapRes!28706 () Bool)

(declare-fun tp!55287 () Bool)

(declare-fun e!497596 () Bool)

(assert (=> mapNonEmpty!28706 (= mapRes!28706 (and tp!55287 e!497596))))

(declare-fun mapValue!28706 () ValueCell!8569)

(declare-fun mapRest!28706 () (Array (_ BitVec 32) ValueCell!8569))

(declare-fun mapKey!28706 () (_ BitVec 32))

(assert (=> mapNonEmpty!28706 (= (arr!25098 (_values!5259 thiss!1181)) (store mapRest!28706 mapKey!28706 mapValue!28706))))

(declare-fun b!891658 () Bool)

(declare-fun res!604112 () Bool)

(assert (=> b!891658 (=> (not res!604112) (not e!497594))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!891658 (= res!604112 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891659 () Bool)

(declare-fun e!497599 () Bool)

(assert (=> b!891659 (= e!497594 (not e!497599))))

(declare-fun res!604113 () Bool)

(assert (=> b!891659 (=> res!604113 e!497599)))

(declare-datatypes ((SeekEntryResult!8829 0))(
  ( (MissingZero!8829 (index!37687 (_ BitVec 32))) (Found!8829 (index!37688 (_ BitVec 32))) (Intermediate!8829 (undefined!9641 Bool) (index!37689 (_ BitVec 32)) (x!75765 (_ BitVec 32))) (Undefined!8829) (MissingVacant!8829 (index!37690 (_ BitVec 32))) )
))
(declare-fun lt!402799 () SeekEntryResult!8829)

(assert (=> b!891659 (= res!604113 (not (is-Found!8829 lt!402799)))))

(declare-fun e!497593 () Bool)

(assert (=> b!891659 e!497593))

(declare-fun res!604115 () Bool)

(assert (=> b!891659 (=> res!604115 e!497593)))

(assert (=> b!891659 (= res!604115 (not (is-Found!8829 lt!402799)))))

(declare-datatypes ((Unit!30354 0))(
  ( (Unit!30355) )
))
(declare-fun lt!402801 () Unit!30354)

(declare-fun lemmaSeekEntryGivesInRangeIndex!31 (array!52182 array!52184 (_ BitVec 32) (_ BitVec 32) V!29099 V!29099 (_ BitVec 64)) Unit!30354)

(assert (=> b!891659 (= lt!402801 (lemmaSeekEntryGivesInRangeIndex!31 (_keys!9957 thiss!1181) (_values!5259 thiss!1181) (mask!25771 thiss!1181) (extraKeys!4968 thiss!1181) (zeroValue!5072 thiss!1181) (minValue!5072 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52182 (_ BitVec 32)) SeekEntryResult!8829)

(assert (=> b!891659 (= lt!402799 (seekEntry!0 key!785 (_keys!9957 thiss!1181) (mask!25771 thiss!1181)))))

(declare-fun b!891660 () Bool)

(assert (=> b!891660 (= e!497599 e!497598)))

(declare-fun res!604110 () Bool)

(assert (=> b!891660 (=> res!604110 e!497598)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891660 (= res!604110 (not (validMask!0 (mask!25771 thiss!1181))))))

(declare-datatypes ((tuple2!11960 0))(
  ( (tuple2!11961 (_1!5991 (_ BitVec 64)) (_2!5991 V!29099)) )
))
(declare-datatypes ((List!17753 0))(
  ( (Nil!17750) (Cons!17749 (h!18880 tuple2!11960) (t!25052 List!17753)) )
))
(declare-datatypes ((ListLongMap!10657 0))(
  ( (ListLongMap!10658 (toList!5344 List!17753)) )
))
(declare-fun lt!402797 () ListLongMap!10657)

(declare-fun contains!4346 (ListLongMap!10657 (_ BitVec 64)) Bool)

(assert (=> b!891660 (contains!4346 lt!402797 (select (arr!25097 (_keys!9957 thiss!1181)) (index!37688 lt!402799)))))

(declare-fun getCurrentListMap!2627 (array!52182 array!52184 (_ BitVec 32) (_ BitVec 32) V!29099 V!29099 (_ BitVec 32) Int) ListLongMap!10657)

(assert (=> b!891660 (= lt!402797 (getCurrentListMap!2627 (_keys!9957 thiss!1181) (_values!5259 thiss!1181) (mask!25771 thiss!1181) (extraKeys!4968 thiss!1181) (zeroValue!5072 thiss!1181) (minValue!5072 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5274 thiss!1181)))))

(declare-fun lt!402800 () Unit!30354)

(declare-fun lemmaValidKeyInArrayIsInListMap!216 (array!52182 array!52184 (_ BitVec 32) (_ BitVec 32) V!29099 V!29099 (_ BitVec 32) Int) Unit!30354)

(assert (=> b!891660 (= lt!402800 (lemmaValidKeyInArrayIsInListMap!216 (_keys!9957 thiss!1181) (_values!5259 thiss!1181) (mask!25771 thiss!1181) (extraKeys!4968 thiss!1181) (zeroValue!5072 thiss!1181) (minValue!5072 thiss!1181) (index!37688 lt!402799) (defaultEntry!5274 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891660 (arrayContainsKey!0 (_keys!9957 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402798 () Unit!30354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52182 (_ BitVec 64) (_ BitVec 32)) Unit!30354)

(assert (=> b!891660 (= lt!402798 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9957 thiss!1181) key!785 (index!37688 lt!402799)))))

(declare-fun b!891661 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891661 (= e!497593 (inRange!0 (index!37688 lt!402799) (mask!25771 thiss!1181)))))

(declare-fun mapIsEmpty!28706 () Bool)

(assert (=> mapIsEmpty!28706 mapRes!28706))

(declare-fun e!497600 () Bool)

(declare-fun array_inv!19716 (array!52182) Bool)

(declare-fun array_inv!19717 (array!52184) Bool)

(assert (=> b!891662 (= e!497601 (and tp!55288 tp_is_empty!18101 (array_inv!19716 (_keys!9957 thiss!1181)) (array_inv!19717 (_values!5259 thiss!1181)) e!497600))))

(declare-fun b!891663 () Bool)

(assert (=> b!891663 (= e!497596 tp_is_empty!18101)))

(declare-fun b!891664 () Bool)

(assert (=> b!891664 (= e!497600 (and e!497595 mapRes!28706))))

(declare-fun condMapEmpty!28706 () Bool)

(declare-fun mapDefault!28706 () ValueCell!8569)

