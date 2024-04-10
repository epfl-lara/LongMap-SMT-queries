; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90396 () Bool)

(assert start!90396)

(declare-fun b!1034702 () Bool)

(declare-fun b_free!20807 () Bool)

(declare-fun b_next!20807 () Bool)

(assert (=> b!1034702 (= b_free!20807 (not b_next!20807))))

(declare-fun tp!73525 () Bool)

(declare-fun b_and!33307 () Bool)

(assert (=> b!1034702 (= tp!73525 b_and!33307)))

(declare-fun mapNonEmpty!38278 () Bool)

(declare-fun mapRes!38278 () Bool)

(declare-fun tp!73526 () Bool)

(declare-fun e!584938 () Bool)

(assert (=> mapNonEmpty!38278 (= mapRes!38278 (and tp!73526 e!584938))))

(declare-datatypes ((V!37575 0))(
  ( (V!37576 (val!12314 Int)) )
))
(declare-datatypes ((ValueCell!11560 0))(
  ( (ValueCellFull!11560 (v!14894 V!37575)) (EmptyCell!11560) )
))
(declare-fun mapValue!38278 () ValueCell!11560)

(declare-datatypes ((array!65136 0))(
  ( (array!65137 (arr!31361 (Array (_ BitVec 32) (_ BitVec 64))) (size!31884 (_ BitVec 32))) )
))
(declare-datatypes ((array!65138 0))(
  ( (array!65139 (arr!31362 (Array (_ BitVec 32) ValueCell!11560)) (size!31885 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5714 0))(
  ( (LongMapFixedSize!5715 (defaultEntry!6235 Int) (mask!30097 (_ BitVec 32)) (extraKeys!5965 (_ BitVec 32)) (zeroValue!6069 V!37575) (minValue!6071 V!37575) (_size!2912 (_ BitVec 32)) (_keys!11417 array!65136) (_values!6258 array!65138) (_vacant!2912 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5714)

(declare-fun mapRest!38278 () (Array (_ BitVec 32) ValueCell!11560))

(declare-fun mapKey!38278 () (_ BitVec 32))

(assert (=> mapNonEmpty!38278 (= (arr!31362 (_values!6258 thiss!1427)) (store mapRest!38278 mapKey!38278 mapValue!38278))))

(declare-fun b!1034698 () Bool)

(declare-fun tp_is_empty!24527 () Bool)

(assert (=> b!1034698 (= e!584938 tp_is_empty!24527)))

(declare-fun b!1034699 () Bool)

(declare-fun e!584942 () Bool)

(assert (=> b!1034699 (= e!584942 tp_is_empty!24527)))

(declare-fun res!691010 () Bool)

(declare-fun e!584939 () Bool)

(assert (=> start!90396 (=> (not res!691010) (not e!584939))))

(declare-fun valid!2159 (LongMapFixedSize!5714) Bool)

(assert (=> start!90396 (= res!691010 (valid!2159 thiss!1427))))

(assert (=> start!90396 e!584939))

(declare-fun e!584940 () Bool)

(assert (=> start!90396 e!584940))

(assert (=> start!90396 true))

(declare-fun b!1034700 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034700 (= e!584939 (not (validMask!0 (mask!30097 thiss!1427))))))

(declare-fun b!1034701 () Bool)

(declare-fun e!584941 () Bool)

(assert (=> b!1034701 (= e!584941 (and e!584942 mapRes!38278))))

(declare-fun condMapEmpty!38278 () Bool)

(declare-fun mapDefault!38278 () ValueCell!11560)

