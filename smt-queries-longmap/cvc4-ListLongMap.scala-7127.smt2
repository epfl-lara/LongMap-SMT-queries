; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90440 () Bool)

(assert start!90440)

(declare-fun b!1034964 () Bool)

(declare-fun b_free!20819 () Bool)

(declare-fun b_next!20819 () Bool)

(assert (=> b!1034964 (= b_free!20819 (not b_next!20819))))

(declare-fun tp!73569 () Bool)

(declare-fun b_and!33319 () Bool)

(assert (=> b!1034964 (= tp!73569 b_and!33319)))

(declare-fun mapIsEmpty!38304 () Bool)

(declare-fun mapRes!38304 () Bool)

(assert (=> mapIsEmpty!38304 mapRes!38304))

(declare-fun b!1034963 () Bool)

(declare-fun e!585129 () Bool)

(declare-datatypes ((V!37591 0))(
  ( (V!37592 (val!12320 Int)) )
))
(declare-datatypes ((ValueCell!11566 0))(
  ( (ValueCellFull!11566 (v!14900 V!37591)) (EmptyCell!11566) )
))
(declare-datatypes ((array!65164 0))(
  ( (array!65165 (arr!31373 (Array (_ BitVec 32) (_ BitVec 64))) (size!31898 (_ BitVec 32))) )
))
(declare-datatypes ((array!65166 0))(
  ( (array!65167 (arr!31374 (Array (_ BitVec 32) ValueCell!11566)) (size!31899 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5726 0))(
  ( (LongMapFixedSize!5727 (defaultEntry!6241 Int) (mask!30111 (_ BitVec 32)) (extraKeys!5971 (_ BitVec 32)) (zeroValue!6075 V!37591) (minValue!6077 V!37591) (_size!2918 (_ BitVec 32)) (_keys!11425 array!65164) (_values!6264 array!65166) (_vacant!2918 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5726)

(assert (=> b!1034963 (= e!585129 (and (= (size!31899 (_values!6264 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30111 thiss!1427))) (not (= (size!31898 (_keys!11425 thiss!1427)) (size!31899 (_values!6264 thiss!1427))))))))

(declare-fun res!691136 () Bool)

(assert (=> start!90440 (=> (not res!691136) (not e!585129))))

(declare-fun valid!2163 (LongMapFixedSize!5726) Bool)

(assert (=> start!90440 (= res!691136 (valid!2163 thiss!1427))))

(assert (=> start!90440 e!585129))

(declare-fun e!585128 () Bool)

(assert (=> start!90440 e!585128))

(assert (=> start!90440 true))

(declare-fun e!585130 () Bool)

(declare-fun tp_is_empty!24539 () Bool)

(declare-fun array_inv!24269 (array!65164) Bool)

(declare-fun array_inv!24270 (array!65166) Bool)

(assert (=> b!1034964 (= e!585128 (and tp!73569 tp_is_empty!24539 (array_inv!24269 (_keys!11425 thiss!1427)) (array_inv!24270 (_values!6264 thiss!1427)) e!585130))))

(declare-fun b!1034965 () Bool)

(declare-fun res!691135 () Bool)

(assert (=> b!1034965 (=> (not res!691135) (not e!585129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034965 (= res!691135 (validMask!0 (mask!30111 thiss!1427)))))

(declare-fun b!1034966 () Bool)

(declare-fun e!585132 () Bool)

(assert (=> b!1034966 (= e!585132 tp_is_empty!24539)))

(declare-fun b!1034967 () Bool)

(declare-fun res!691134 () Bool)

(assert (=> b!1034967 (=> (not res!691134) (not e!585129))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034967 (= res!691134 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034968 () Bool)

(declare-fun e!585131 () Bool)

(assert (=> b!1034968 (= e!585131 tp_is_empty!24539)))

(declare-fun mapNonEmpty!38304 () Bool)

(declare-fun tp!73570 () Bool)

(assert (=> mapNonEmpty!38304 (= mapRes!38304 (and tp!73570 e!585132))))

(declare-fun mapKey!38304 () (_ BitVec 32))

(declare-fun mapRest!38304 () (Array (_ BitVec 32) ValueCell!11566))

(declare-fun mapValue!38304 () ValueCell!11566)

(assert (=> mapNonEmpty!38304 (= (arr!31374 (_values!6264 thiss!1427)) (store mapRest!38304 mapKey!38304 mapValue!38304))))

(declare-fun b!1034969 () Bool)

(assert (=> b!1034969 (= e!585130 (and e!585131 mapRes!38304))))

(declare-fun condMapEmpty!38304 () Bool)

(declare-fun mapDefault!38304 () ValueCell!11566)

