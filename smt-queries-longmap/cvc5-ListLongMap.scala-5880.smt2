; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75810 () Bool)

(assert start!75810)

(declare-fun b!891809 () Bool)

(declare-fun b_free!15781 () Bool)

(declare-fun b_next!15781 () Bool)

(assert (=> b!891809 (= b_free!15781 (not b_next!15781))))

(declare-fun tp!55312 () Bool)

(declare-fun b_and!26021 () Bool)

(assert (=> b!891809 (= tp!55312 b_and!26021)))

(declare-fun b!891799 () Bool)

(declare-fun res!604206 () Bool)

(declare-fun e!497706 () Bool)

(assert (=> b!891799 (=> res!604206 e!497706)))

(declare-datatypes ((array!52198 0))(
  ( (array!52199 (arr!25105 (Array (_ BitVec 32) (_ BitVec 64))) (size!25549 (_ BitVec 32))) )
))
(declare-datatypes ((V!29111 0))(
  ( (V!29112 (val!9105 Int)) )
))
(declare-datatypes ((ValueCell!8573 0))(
  ( (ValueCellFull!8573 (v!11583 V!29111)) (EmptyCell!8573) )
))
(declare-datatypes ((array!52200 0))(
  ( (array!52201 (arr!25106 (Array (_ BitVec 32) ValueCell!8573)) (size!25550 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4162 0))(
  ( (LongMapFixedSize!4163 (defaultEntry!5278 Int) (mask!25779 (_ BitVec 32)) (extraKeys!4972 (_ BitVec 32)) (zeroValue!5076 V!29111) (minValue!5076 V!29111) (_size!2136 (_ BitVec 32)) (_keys!9961 array!52198) (_values!5263 array!52200) (_vacant!2136 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4162)

(declare-datatypes ((List!17760 0))(
  ( (Nil!17757) (Cons!17756 (h!18887 (_ BitVec 64)) (t!25059 List!17760)) )
))
(declare-fun arrayNoDuplicates!0 (array!52198 (_ BitVec 32) List!17760) Bool)

(assert (=> b!891799 (= res!604206 (not (arrayNoDuplicates!0 (_keys!9961 thiss!1181) #b00000000000000000000000000000000 Nil!17757)))))

(declare-fun b!891800 () Bool)

(declare-fun e!497707 () Bool)

(assert (=> b!891800 (= e!497707 e!497706)))

(declare-fun res!604210 () Bool)

(assert (=> b!891800 (=> res!604210 e!497706)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891800 (= res!604210 (not (validMask!0 (mask!25779 thiss!1181))))))

(declare-datatypes ((tuple2!11968 0))(
  ( (tuple2!11969 (_1!5995 (_ BitVec 64)) (_2!5995 V!29111)) )
))
(declare-datatypes ((List!17761 0))(
  ( (Nil!17758) (Cons!17757 (h!18888 tuple2!11968) (t!25060 List!17761)) )
))
(declare-datatypes ((ListLongMap!10665 0))(
  ( (ListLongMap!10666 (toList!5348 List!17761)) )
))
(declare-fun lt!402871 () ListLongMap!10665)

(declare-datatypes ((SeekEntryResult!8833 0))(
  ( (MissingZero!8833 (index!37703 (_ BitVec 32))) (Found!8833 (index!37704 (_ BitVec 32))) (Intermediate!8833 (undefined!9645 Bool) (index!37705 (_ BitVec 32)) (x!75785 (_ BitVec 32))) (Undefined!8833) (MissingVacant!8833 (index!37706 (_ BitVec 32))) )
))
(declare-fun lt!402870 () SeekEntryResult!8833)

(declare-fun contains!4350 (ListLongMap!10665 (_ BitVec 64)) Bool)

(assert (=> b!891800 (contains!4350 lt!402871 (select (arr!25105 (_keys!9961 thiss!1181)) (index!37704 lt!402870)))))

(declare-fun getCurrentListMap!2631 (array!52198 array!52200 (_ BitVec 32) (_ BitVec 32) V!29111 V!29111 (_ BitVec 32) Int) ListLongMap!10665)

(assert (=> b!891800 (= lt!402871 (getCurrentListMap!2631 (_keys!9961 thiss!1181) (_values!5263 thiss!1181) (mask!25779 thiss!1181) (extraKeys!4972 thiss!1181) (zeroValue!5076 thiss!1181) (minValue!5076 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5278 thiss!1181)))))

(declare-datatypes ((Unit!30362 0))(
  ( (Unit!30363) )
))
(declare-fun lt!402869 () Unit!30362)

(declare-fun lemmaValidKeyInArrayIsInListMap!220 (array!52198 array!52200 (_ BitVec 32) (_ BitVec 32) V!29111 V!29111 (_ BitVec 32) Int) Unit!30362)

(assert (=> b!891800 (= lt!402869 (lemmaValidKeyInArrayIsInListMap!220 (_keys!9961 thiss!1181) (_values!5263 thiss!1181) (mask!25779 thiss!1181) (extraKeys!4972 thiss!1181) (zeroValue!5076 thiss!1181) (minValue!5076 thiss!1181) (index!37704 lt!402870) (defaultEntry!5278 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891800 (arrayContainsKey!0 (_keys!9961 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402873 () Unit!30362)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52198 (_ BitVec 64) (_ BitVec 32)) Unit!30362)

(assert (=> b!891800 (= lt!402873 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9961 thiss!1181) key!785 (index!37704 lt!402870)))))

(declare-fun b!891801 () Bool)

(declare-fun res!604208 () Bool)

(assert (=> b!891801 (=> res!604208 e!497706)))

(assert (=> b!891801 (= res!604208 (or (not (= (size!25550 (_values!5263 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25779 thiss!1181)))) (not (= (size!25549 (_keys!9961 thiss!1181)) (size!25550 (_values!5263 thiss!1181)))) (bvslt (mask!25779 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4972 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4972 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28718 () Bool)

(declare-fun mapRes!28718 () Bool)

(declare-fun tp!55311 () Bool)

(declare-fun e!497704 () Bool)

(assert (=> mapNonEmpty!28718 (= mapRes!28718 (and tp!55311 e!497704))))

(declare-fun mapRest!28718 () (Array (_ BitVec 32) ValueCell!8573))

(declare-fun mapKey!28718 () (_ BitVec 32))

(declare-fun mapValue!28718 () ValueCell!8573)

(assert (=> mapNonEmpty!28718 (= (arr!25106 (_values!5263 thiss!1181)) (store mapRest!28718 mapKey!28718 mapValue!28718))))

(declare-fun mapIsEmpty!28718 () Bool)

(assert (=> mapIsEmpty!28718 mapRes!28718))

(declare-fun b!891802 () Bool)

(declare-fun e!497708 () Bool)

(assert (=> b!891802 (= e!497708 (not e!497707))))

(declare-fun res!604211 () Bool)

(assert (=> b!891802 (=> res!604211 e!497707)))

(assert (=> b!891802 (= res!604211 (not (is-Found!8833 lt!402870)))))

(declare-fun e!497709 () Bool)

(assert (=> b!891802 e!497709))

(declare-fun res!604204 () Bool)

(assert (=> b!891802 (=> res!604204 e!497709)))

(assert (=> b!891802 (= res!604204 (not (is-Found!8833 lt!402870)))))

(declare-fun lt!402874 () Unit!30362)

(declare-fun lemmaSeekEntryGivesInRangeIndex!35 (array!52198 array!52200 (_ BitVec 32) (_ BitVec 32) V!29111 V!29111 (_ BitVec 64)) Unit!30362)

(assert (=> b!891802 (= lt!402874 (lemmaSeekEntryGivesInRangeIndex!35 (_keys!9961 thiss!1181) (_values!5263 thiss!1181) (mask!25779 thiss!1181) (extraKeys!4972 thiss!1181) (zeroValue!5076 thiss!1181) (minValue!5076 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52198 (_ BitVec 32)) SeekEntryResult!8833)

(assert (=> b!891802 (= lt!402870 (seekEntry!0 key!785 (_keys!9961 thiss!1181) (mask!25779 thiss!1181)))))

(declare-fun b!891803 () Bool)

(assert (=> b!891803 (= e!497706 true)))

(declare-fun lt!402872 () Bool)

(assert (=> b!891803 (= lt!402872 (contains!4350 lt!402871 key!785))))

(declare-fun b!891804 () Bool)

(declare-fun e!497705 () Bool)

(declare-fun tp_is_empty!18109 () Bool)

(assert (=> b!891804 (= e!497705 tp_is_empty!18109)))

(declare-fun b!891805 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891805 (= e!497709 (inRange!0 (index!37704 lt!402870) (mask!25779 thiss!1181)))))

(declare-fun res!604207 () Bool)

(assert (=> start!75810 (=> (not res!604207) (not e!497708))))

(declare-fun valid!1612 (LongMapFixedSize!4162) Bool)

(assert (=> start!75810 (= res!604207 (valid!1612 thiss!1181))))

(assert (=> start!75810 e!497708))

(declare-fun e!497702 () Bool)

(assert (=> start!75810 e!497702))

(assert (=> start!75810 true))

(declare-fun b!891806 () Bool)

(declare-fun res!604205 () Bool)

(assert (=> b!891806 (=> (not res!604205) (not e!497708))))

(assert (=> b!891806 (= res!604205 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891807 () Bool)

(assert (=> b!891807 (= e!497704 tp_is_empty!18109)))

(declare-fun b!891808 () Bool)

(declare-fun res!604209 () Bool)

(assert (=> b!891808 (=> res!604209 e!497706)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52198 (_ BitVec 32)) Bool)

(assert (=> b!891808 (= res!604209 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9961 thiss!1181) (mask!25779 thiss!1181))))))

(declare-fun e!497703 () Bool)

(declare-fun array_inv!19724 (array!52198) Bool)

(declare-fun array_inv!19725 (array!52200) Bool)

(assert (=> b!891809 (= e!497702 (and tp!55312 tp_is_empty!18109 (array_inv!19724 (_keys!9961 thiss!1181)) (array_inv!19725 (_values!5263 thiss!1181)) e!497703))))

(declare-fun b!891810 () Bool)

(assert (=> b!891810 (= e!497703 (and e!497705 mapRes!28718))))

(declare-fun condMapEmpty!28718 () Bool)

(declare-fun mapDefault!28718 () ValueCell!8573)

