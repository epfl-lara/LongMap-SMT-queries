; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89136 () Bool)

(assert start!89136)

(declare-fun b!1021934 () Bool)

(declare-fun b_free!20177 () Bool)

(declare-fun b_next!20177 () Bool)

(assert (=> b!1021934 (= b_free!20177 (not b_next!20177))))

(declare-fun tp!71565 () Bool)

(declare-fun b_and!32375 () Bool)

(assert (=> b!1021934 (= tp!71565 b_and!32375)))

(declare-fun b!1021928 () Bool)

(declare-fun res!684655 () Bool)

(declare-fun e!575626 () Bool)

(assert (=> b!1021928 (=> (not res!684655) (not e!575626))))

(declare-datatypes ((V!36735 0))(
  ( (V!36736 (val!11999 Int)) )
))
(declare-datatypes ((ValueCell!11245 0))(
  ( (ValueCellFull!11245 (v!14568 V!36735)) (EmptyCell!11245) )
))
(declare-datatypes ((array!63838 0))(
  ( (array!63839 (arr!30731 (Array (_ BitVec 32) (_ BitVec 64))) (size!31242 (_ BitVec 32))) )
))
(declare-datatypes ((array!63840 0))(
  ( (array!63841 (arr!30732 (Array (_ BitVec 32) ValueCell!11245)) (size!31243 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5084 0))(
  ( (LongMapFixedSize!5085 (defaultEntry!5894 Int) (mask!29475 (_ BitVec 32)) (extraKeys!5626 (_ BitVec 32)) (zeroValue!5730 V!36735) (minValue!5730 V!36735) (_size!2597 (_ BitVec 32)) (_keys!11039 array!63838) (_values!5917 array!63840) (_vacant!2597 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5084)

(assert (=> b!1021928 (= res!684655 (and (= (size!31243 (_values!5917 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29475 thiss!1427))) (= (size!31242 (_keys!11039 thiss!1427)) (size!31243 (_values!5917 thiss!1427))) (bvsge (mask!29475 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5626 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5626 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5626 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5626 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5626 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5626 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5626 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37263 () Bool)

(declare-fun mapRes!37263 () Bool)

(declare-fun tp!71566 () Bool)

(declare-fun e!575629 () Bool)

(assert (=> mapNonEmpty!37263 (= mapRes!37263 (and tp!71566 e!575629))))

(declare-fun mapValue!37263 () ValueCell!11245)

(declare-fun mapRest!37263 () (Array (_ BitVec 32) ValueCell!11245))

(declare-fun mapKey!37263 () (_ BitVec 32))

(assert (=> mapNonEmpty!37263 (= (arr!30732 (_values!5917 thiss!1427)) (store mapRest!37263 mapKey!37263 mapValue!37263))))

(declare-fun mapIsEmpty!37263 () Bool)

(assert (=> mapIsEmpty!37263 mapRes!37263))

(declare-fun b!1021929 () Bool)

(declare-fun res!684653 () Bool)

(assert (=> b!1021929 (=> (not res!684653) (not e!575626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021929 (= res!684653 (validMask!0 (mask!29475 thiss!1427)))))

(declare-fun res!684654 () Bool)

(assert (=> start!89136 (=> (not res!684654) (not e!575626))))

(declare-fun valid!1939 (LongMapFixedSize!5084) Bool)

(assert (=> start!89136 (= res!684654 (valid!1939 thiss!1427))))

(assert (=> start!89136 e!575626))

(declare-fun e!575627 () Bool)

(assert (=> start!89136 e!575627))

(assert (=> start!89136 true))

(declare-fun b!1021930 () Bool)

(declare-fun res!684656 () Bool)

(assert (=> b!1021930 (=> (not res!684656) (not e!575626))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021930 (= res!684656 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021931 () Bool)

(assert (=> b!1021931 (= e!575626 false)))

(declare-fun lt!450159 () Bool)

(declare-datatypes ((List!21667 0))(
  ( (Nil!21664) (Cons!21663 (h!22861 (_ BitVec 64)) (t!30681 List!21667)) )
))
(declare-fun arrayNoDuplicates!0 (array!63838 (_ BitVec 32) List!21667) Bool)

(assert (=> b!1021931 (= lt!450159 (arrayNoDuplicates!0 (_keys!11039 thiss!1427) #b00000000000000000000000000000000 Nil!21664))))

(declare-fun b!1021932 () Bool)

(declare-fun e!575630 () Bool)

(declare-fun tp_is_empty!23897 () Bool)

(assert (=> b!1021932 (= e!575630 tp_is_empty!23897)))

(declare-fun b!1021933 () Bool)

(declare-fun e!575628 () Bool)

(assert (=> b!1021933 (= e!575628 (and e!575630 mapRes!37263))))

(declare-fun condMapEmpty!37263 () Bool)

(declare-fun mapDefault!37263 () ValueCell!11245)

