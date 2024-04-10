; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89400 () Bool)

(assert start!89400)

(declare-fun b!1024959 () Bool)

(declare-fun b_free!20399 () Bool)

(declare-fun b_next!20399 () Bool)

(assert (=> b!1024959 (= b_free!20399 (not b_next!20399))))

(declare-fun tp!72243 () Bool)

(declare-fun b_and!32645 () Bool)

(assert (=> b!1024959 (= tp!72243 b_and!32645)))

(declare-fun b!1024957 () Bool)

(declare-fun e!577843 () Bool)

(declare-fun tp_is_empty!24119 () Bool)

(assert (=> b!1024957 (= e!577843 tp_is_empty!24119)))

(declare-fun res!686228 () Bool)

(declare-fun e!577840 () Bool)

(assert (=> start!89400 (=> (not res!686228) (not e!577840))))

(declare-datatypes ((V!37031 0))(
  ( (V!37032 (val!12110 Int)) )
))
(declare-datatypes ((ValueCell!11356 0))(
  ( (ValueCellFull!11356 (v!14679 V!37031)) (EmptyCell!11356) )
))
(declare-datatypes ((array!64288 0))(
  ( (array!64289 (arr!30953 (Array (_ BitVec 32) (_ BitVec 64))) (size!31466 (_ BitVec 32))) )
))
(declare-datatypes ((array!64290 0))(
  ( (array!64291 (arr!30954 (Array (_ BitVec 32) ValueCell!11356)) (size!31467 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5306 0))(
  ( (LongMapFixedSize!5307 (defaultEntry!6005 Int) (mask!29665 (_ BitVec 32)) (extraKeys!5737 (_ BitVec 32)) (zeroValue!5841 V!37031) (minValue!5841 V!37031) (_size!2708 (_ BitVec 32)) (_keys!11152 array!64288) (_values!6028 array!64290) (_vacant!2708 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5306)

(declare-fun valid!2018 (LongMapFixedSize!5306) Bool)

(assert (=> start!89400 (= res!686228 (valid!2018 thiss!1427))))

(assert (=> start!89400 e!577840))

(declare-fun e!577842 () Bool)

(assert (=> start!89400 e!577842))

(assert (=> start!89400 true))

(declare-fun mapNonEmpty!37607 () Bool)

(declare-fun mapRes!37607 () Bool)

(declare-fun tp!72242 () Bool)

(declare-fun e!577841 () Bool)

(assert (=> mapNonEmpty!37607 (= mapRes!37607 (and tp!72242 e!577841))))

(declare-fun mapValue!37607 () ValueCell!11356)

(declare-fun mapRest!37607 () (Array (_ BitVec 32) ValueCell!11356))

(declare-fun mapKey!37607 () (_ BitVec 32))

(assert (=> mapNonEmpty!37607 (= (arr!30954 (_values!6028 thiss!1427)) (store mapRest!37607 mapKey!37607 mapValue!37607))))

(declare-fun b!1024958 () Bool)

(declare-fun e!577845 () Bool)

(assert (=> b!1024958 (= e!577845 (and e!577843 mapRes!37607))))

(declare-fun condMapEmpty!37607 () Bool)

(declare-fun mapDefault!37607 () ValueCell!11356)

