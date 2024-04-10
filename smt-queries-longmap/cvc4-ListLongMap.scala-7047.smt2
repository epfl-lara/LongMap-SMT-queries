; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89298 () Bool)

(assert start!89298)

(declare-fun b!1023925 () Bool)

(declare-fun b_free!20339 () Bool)

(declare-fun b_next!20339 () Bool)

(assert (=> b!1023925 (= b_free!20339 (not b_next!20339))))

(declare-fun tp!72051 () Bool)

(declare-fun b_and!32585 () Bool)

(assert (=> b!1023925 (= tp!72051 b_and!32585)))

(declare-fun res!685627 () Bool)

(declare-fun e!577084 () Bool)

(assert (=> start!89298 (=> (not res!685627) (not e!577084))))

(declare-datatypes ((V!36951 0))(
  ( (V!36952 (val!12080 Int)) )
))
(declare-datatypes ((ValueCell!11326 0))(
  ( (ValueCellFull!11326 (v!14649 V!36951)) (EmptyCell!11326) )
))
(declare-datatypes ((array!64162 0))(
  ( (array!64163 (arr!30893 (Array (_ BitVec 32) (_ BitVec 64))) (size!31404 (_ BitVec 32))) )
))
(declare-datatypes ((array!64164 0))(
  ( (array!64165 (arr!30894 (Array (_ BitVec 32) ValueCell!11326)) (size!31405 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5246 0))(
  ( (LongMapFixedSize!5247 (defaultEntry!5975 Int) (mask!29610 (_ BitVec 32)) (extraKeys!5707 (_ BitVec 32)) (zeroValue!5811 V!36951) (minValue!5811 V!36951) (_size!2678 (_ BitVec 32)) (_keys!11120 array!64162) (_values!5998 array!64164) (_vacant!2678 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5246)

(declare-fun valid!1999 (LongMapFixedSize!5246) Bool)

(assert (=> start!89298 (= res!685627 (valid!1999 thiss!1427))))

(assert (=> start!89298 e!577084))

(declare-fun e!577088 () Bool)

(assert (=> start!89298 e!577088))

(assert (=> start!89298 true))

(declare-fun mapIsEmpty!37506 () Bool)

(declare-fun mapRes!37506 () Bool)

(assert (=> mapIsEmpty!37506 mapRes!37506))

(declare-fun b!1023923 () Bool)

(declare-fun e!577089 () Bool)

(declare-fun tp_is_empty!24059 () Bool)

(assert (=> b!1023923 (= e!577089 tp_is_empty!24059)))

(declare-fun b!1023924 () Bool)

(declare-fun e!577087 () Bool)

(assert (=> b!1023924 (= e!577087 tp_is_empty!24059)))

(declare-fun mapNonEmpty!37506 () Bool)

(declare-fun tp!72052 () Bool)

(assert (=> mapNonEmpty!37506 (= mapRes!37506 (and tp!72052 e!577089))))

(declare-fun mapRest!37506 () (Array (_ BitVec 32) ValueCell!11326))

(declare-fun mapValue!37506 () ValueCell!11326)

(declare-fun mapKey!37506 () (_ BitVec 32))

(assert (=> mapNonEmpty!37506 (= (arr!30894 (_values!5998 thiss!1427)) (store mapRest!37506 mapKey!37506 mapValue!37506))))

(declare-fun e!577085 () Bool)

(declare-fun array_inv!23935 (array!64162) Bool)

(declare-fun array_inv!23936 (array!64164) Bool)

(assert (=> b!1023925 (= e!577088 (and tp!72051 tp_is_empty!24059 (array_inv!23935 (_keys!11120 thiss!1427)) (array_inv!23936 (_values!5998 thiss!1427)) e!577085))))

(declare-fun b!1023926 () Bool)

(assert (=> b!1023926 (= e!577085 (and e!577087 mapRes!37506))))

(declare-fun condMapEmpty!37506 () Bool)

(declare-fun mapDefault!37506 () ValueCell!11326)

