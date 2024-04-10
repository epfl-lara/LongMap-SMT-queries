; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89204 () Bool)

(assert start!89204)

(declare-fun b!1022767 () Bool)

(declare-fun b_free!20245 () Bool)

(declare-fun b_next!20245 () Bool)

(assert (=> b!1022767 (= b_free!20245 (not b_next!20245))))

(declare-fun tp!71770 () Bool)

(declare-fun b_and!32467 () Bool)

(assert (=> b!1022767 (= tp!71770 b_and!32467)))

(declare-fun mapNonEmpty!37365 () Bool)

(declare-fun mapRes!37365 () Bool)

(declare-fun tp!71769 () Bool)

(declare-fun e!576240 () Bool)

(assert (=> mapNonEmpty!37365 (= mapRes!37365 (and tp!71769 e!576240))))

(declare-fun mapKey!37365 () (_ BitVec 32))

(declare-datatypes ((V!36827 0))(
  ( (V!36828 (val!12033 Int)) )
))
(declare-datatypes ((ValueCell!11279 0))(
  ( (ValueCellFull!11279 (v!14602 V!36827)) (EmptyCell!11279) )
))
(declare-fun mapRest!37365 () (Array (_ BitVec 32) ValueCell!11279))

(declare-datatypes ((array!63974 0))(
  ( (array!63975 (arr!30799 (Array (_ BitVec 32) (_ BitVec 64))) (size!31310 (_ BitVec 32))) )
))
(declare-datatypes ((array!63976 0))(
  ( (array!63977 (arr!30800 (Array (_ BitVec 32) ValueCell!11279)) (size!31311 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5152 0))(
  ( (LongMapFixedSize!5153 (defaultEntry!5928 Int) (mask!29533 (_ BitVec 32)) (extraKeys!5660 (_ BitVec 32)) (zeroValue!5764 V!36827) (minValue!5764 V!36827) (_size!2631 (_ BitVec 32)) (_keys!11073 array!63974) (_values!5951 array!63976) (_vacant!2631 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5152)

(declare-fun mapValue!37365 () ValueCell!11279)

(assert (=> mapNonEmpty!37365 (= (arr!30800 (_values!5951 thiss!1427)) (store mapRest!37365 mapKey!37365 mapValue!37365))))

(declare-fun res!685055 () Bool)

(declare-fun e!576242 () Bool)

(assert (=> start!89204 (=> (not res!685055) (not e!576242))))

(declare-fun valid!1963 (LongMapFixedSize!5152) Bool)

(assert (=> start!89204 (= res!685055 (valid!1963 thiss!1427))))

(assert (=> start!89204 e!576242))

(declare-fun e!576241 () Bool)

(assert (=> start!89204 e!576241))

(assert (=> start!89204 true))

(declare-fun b!1022762 () Bool)

(assert (=> b!1022762 (= e!576242 false)))

(declare-fun lt!450333 () Bool)

(declare-datatypes ((List!21693 0))(
  ( (Nil!21690) (Cons!21689 (h!22887 (_ BitVec 64)) (t!30731 List!21693)) )
))
(declare-fun arrayNoDuplicates!0 (array!63974 (_ BitVec 32) List!21693) Bool)

(assert (=> b!1022762 (= lt!450333 (arrayNoDuplicates!0 (_keys!11073 thiss!1427) #b00000000000000000000000000000000 Nil!21690))))

(declare-fun b!1022763 () Bool)

(declare-fun tp_is_empty!23965 () Bool)

(assert (=> b!1022763 (= e!576240 tp_is_empty!23965)))

(declare-fun b!1022764 () Bool)

(declare-fun e!576238 () Bool)

(declare-fun e!576243 () Bool)

(assert (=> b!1022764 (= e!576238 (and e!576243 mapRes!37365))))

(declare-fun condMapEmpty!37365 () Bool)

(declare-fun mapDefault!37365 () ValueCell!11279)

