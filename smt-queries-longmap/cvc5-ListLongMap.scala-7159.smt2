; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91140 () Bool)

(assert start!91140)

(declare-fun b!1040303 () Bool)

(declare-fun b_free!21007 () Bool)

(declare-fun b_next!21007 () Bool)

(assert (=> b!1040303 (= b_free!21007 (not b_next!21007))))

(declare-fun tp!74216 () Bool)

(declare-fun b_and!33539 () Bool)

(assert (=> b!1040303 (= tp!74216 b_and!33539)))

(declare-fun e!588952 () Bool)

(declare-datatypes ((V!37843 0))(
  ( (V!37844 (val!12414 Int)) )
))
(declare-datatypes ((ValueCell!11660 0))(
  ( (ValueCellFull!11660 (v!15001 V!37843)) (EmptyCell!11660) )
))
(declare-datatypes ((array!65590 0))(
  ( (array!65591 (arr!31561 (Array (_ BitVec 32) (_ BitVec 64))) (size!32092 (_ BitVec 32))) )
))
(declare-datatypes ((array!65592 0))(
  ( (array!65593 (arr!31562 (Array (_ BitVec 32) ValueCell!11660)) (size!32093 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5914 0))(
  ( (LongMapFixedSize!5915 (defaultEntry!6339 Int) (mask!30330 (_ BitVec 32)) (extraKeys!6067 (_ BitVec 32)) (zeroValue!6173 V!37843) (minValue!6173 V!37843) (_size!3012 (_ BitVec 32)) (_keys!11559 array!65590) (_values!6362 array!65592) (_vacant!3012 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5914)

(declare-fun e!588949 () Bool)

(declare-fun tp_is_empty!24727 () Bool)

(declare-fun array_inv!24391 (array!65590) Bool)

(declare-fun array_inv!24392 (array!65592) Bool)

(assert (=> b!1040303 (= e!588949 (and tp!74216 tp_is_empty!24727 (array_inv!24391 (_keys!11559 thiss!1427)) (array_inv!24392 (_values!6362 thiss!1427)) e!588952))))

(declare-fun b!1040304 () Bool)

(declare-fun e!588948 () Bool)

(assert (=> b!1040304 (= e!588948 tp_is_empty!24727)))

(declare-fun mapNonEmpty!38668 () Bool)

(declare-fun mapRes!38668 () Bool)

(declare-fun tp!74215 () Bool)

(declare-fun e!588953 () Bool)

(assert (=> mapNonEmpty!38668 (= mapRes!38668 (and tp!74215 e!588953))))

(declare-fun mapValue!38668 () ValueCell!11660)

(declare-fun mapRest!38668 () (Array (_ BitVec 32) ValueCell!11660))

(declare-fun mapKey!38668 () (_ BitVec 32))

(assert (=> mapNonEmpty!38668 (= (arr!31562 (_values!6362 thiss!1427)) (store mapRest!38668 mapKey!38668 mapValue!38668))))

(declare-fun b!1040305 () Bool)

(declare-fun res!693594 () Bool)

(declare-fun e!588950 () Bool)

(assert (=> b!1040305 (=> res!693594 e!588950)))

(declare-datatypes ((List!21956 0))(
  ( (Nil!21953) (Cons!21952 (h!23156 (_ BitVec 64)) (t!31170 List!21956)) )
))
(declare-fun arrayNoDuplicates!0 (array!65590 (_ BitVec 32) List!21956) Bool)

(assert (=> b!1040305 (= res!693594 (not (arrayNoDuplicates!0 (_keys!11559 thiss!1427) #b00000000000000000000000000000000 Nil!21953)))))

(declare-fun b!1040306 () Bool)

(assert (=> b!1040306 (= e!588952 (and e!588948 mapRes!38668))))

(declare-fun condMapEmpty!38668 () Bool)

(declare-fun mapDefault!38668 () ValueCell!11660)

