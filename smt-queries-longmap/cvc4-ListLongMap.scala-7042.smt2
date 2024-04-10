; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89268 () Bool)

(assert start!89268)

(declare-fun b!1023631 () Bool)

(declare-fun b_free!20309 () Bool)

(declare-fun b_next!20309 () Bool)

(assert (=> b!1023631 (= b_free!20309 (not b_next!20309))))

(declare-fun tp!71962 () Bool)

(declare-fun b_and!32531 () Bool)

(assert (=> b!1023631 (= tp!71962 b_and!32531)))

(declare-fun res!685538 () Bool)

(declare-fun e!576819 () Bool)

(assert (=> start!89268 (=> (not res!685538) (not e!576819))))

(declare-datatypes ((V!36911 0))(
  ( (V!36912 (val!12065 Int)) )
))
(declare-datatypes ((ValueCell!11311 0))(
  ( (ValueCellFull!11311 (v!14634 V!36911)) (EmptyCell!11311) )
))
(declare-datatypes ((array!64102 0))(
  ( (array!64103 (arr!30863 (Array (_ BitVec 32) (_ BitVec 64))) (size!31374 (_ BitVec 32))) )
))
(declare-datatypes ((array!64104 0))(
  ( (array!64105 (arr!30864 (Array (_ BitVec 32) ValueCell!11311)) (size!31375 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5216 0))(
  ( (LongMapFixedSize!5217 (defaultEntry!5960 Int) (mask!29585 (_ BitVec 32)) (extraKeys!5692 (_ BitVec 32)) (zeroValue!5796 V!36911) (minValue!5796 V!36911) (_size!2663 (_ BitVec 32)) (_keys!11105 array!64102) (_values!5983 array!64104) (_vacant!2663 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5216)

(declare-fun valid!1987 (LongMapFixedSize!5216) Bool)

(assert (=> start!89268 (= res!685538 (valid!1987 thiss!1427))))

(assert (=> start!89268 e!576819))

(declare-fun e!576814 () Bool)

(assert (=> start!89268 e!576814))

(assert (=> start!89268 true))

(declare-fun b!1023626 () Bool)

(declare-fun e!576818 () Bool)

(declare-fun tp_is_empty!24029 () Bool)

(assert (=> b!1023626 (= e!576818 tp_is_empty!24029)))

(declare-fun b!1023627 () Bool)

(declare-fun res!685536 () Bool)

(assert (=> b!1023627 (=> (not res!685536) (not e!576819))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023627 (= res!685536 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023628 () Bool)

(declare-fun res!685534 () Bool)

(assert (=> b!1023628 (=> (not res!685534) (not e!576819))))

(assert (=> b!1023628 (= res!685534 (and (= (size!31375 (_values!5983 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29585 thiss!1427))) (= (size!31374 (_keys!11105 thiss!1427)) (size!31375 (_values!5983 thiss!1427))) (bvsge (mask!29585 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5692 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5692 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5692 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5692 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5692 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5692 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5692 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023629 () Bool)

(declare-fun res!685537 () Bool)

(assert (=> b!1023629 (=> (not res!685537) (not e!576819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64102 (_ BitVec 32)) Bool)

(assert (=> b!1023629 (= res!685537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11105 thiss!1427) (mask!29585 thiss!1427)))))

(declare-fun b!1023630 () Bool)

(declare-fun res!685535 () Bool)

(assert (=> b!1023630 (=> (not res!685535) (not e!576819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023630 (= res!685535 (validMask!0 (mask!29585 thiss!1427)))))

(declare-fun e!576817 () Bool)

(declare-fun array_inv!23913 (array!64102) Bool)

(declare-fun array_inv!23914 (array!64104) Bool)

(assert (=> b!1023631 (= e!576814 (and tp!71962 tp_is_empty!24029 (array_inv!23913 (_keys!11105 thiss!1427)) (array_inv!23914 (_values!5983 thiss!1427)) e!576817))))

(declare-fun b!1023632 () Bool)

(declare-fun e!576815 () Bool)

(declare-fun mapRes!37461 () Bool)

(assert (=> b!1023632 (= e!576817 (and e!576815 mapRes!37461))))

(declare-fun condMapEmpty!37461 () Bool)

(declare-fun mapDefault!37461 () ValueCell!11311)

