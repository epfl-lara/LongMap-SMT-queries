; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90436 () Bool)

(assert start!90436)

(declare-fun b!1034923 () Bool)

(declare-fun b_free!20815 () Bool)

(declare-fun b_next!20815 () Bool)

(assert (=> b!1034923 (= b_free!20815 (not b_next!20815))))

(declare-fun tp!73557 () Bool)

(declare-fun b_and!33315 () Bool)

(assert (=> b!1034923 (= tp!73557 b_and!33315)))

(declare-fun res!691117 () Bool)

(declare-fun e!585095 () Bool)

(assert (=> start!90436 (=> (not res!691117) (not e!585095))))

(declare-datatypes ((V!37587 0))(
  ( (V!37588 (val!12318 Int)) )
))
(declare-datatypes ((ValueCell!11564 0))(
  ( (ValueCellFull!11564 (v!14898 V!37587)) (EmptyCell!11564) )
))
(declare-datatypes ((array!65156 0))(
  ( (array!65157 (arr!31369 (Array (_ BitVec 32) (_ BitVec 64))) (size!31894 (_ BitVec 32))) )
))
(declare-datatypes ((array!65158 0))(
  ( (array!65159 (arr!31370 (Array (_ BitVec 32) ValueCell!11564)) (size!31895 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5722 0))(
  ( (LongMapFixedSize!5723 (defaultEntry!6239 Int) (mask!30109 (_ BitVec 32)) (extraKeys!5969 (_ BitVec 32)) (zeroValue!6073 V!37587) (minValue!6075 V!37587) (_size!2916 (_ BitVec 32)) (_keys!11423 array!65156) (_values!6262 array!65158) (_vacant!2916 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5722)

(declare-fun valid!2161 (LongMapFixedSize!5722) Bool)

(assert (=> start!90436 (= res!691117 (valid!2161 thiss!1427))))

(assert (=> start!90436 e!585095))

(declare-fun e!585094 () Bool)

(assert (=> start!90436 e!585094))

(assert (=> start!90436 true))

(declare-fun b!1034921 () Bool)

(declare-fun res!691116 () Bool)

(assert (=> b!1034921 (=> (not res!691116) (not e!585095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034921 (= res!691116 (validMask!0 (mask!30109 thiss!1427)))))

(declare-fun b!1034922 () Bool)

(declare-fun res!691118 () Bool)

(assert (=> b!1034922 (=> (not res!691118) (not e!585095))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034922 (= res!691118 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!585097 () Bool)

(declare-fun tp_is_empty!24535 () Bool)

(declare-fun array_inv!24265 (array!65156) Bool)

(declare-fun array_inv!24266 (array!65158) Bool)

(assert (=> b!1034923 (= e!585094 (and tp!73557 tp_is_empty!24535 (array_inv!24265 (_keys!11423 thiss!1427)) (array_inv!24266 (_values!6262 thiss!1427)) e!585097))))

(declare-fun mapIsEmpty!38298 () Bool)

(declare-fun mapRes!38298 () Bool)

(assert (=> mapIsEmpty!38298 mapRes!38298))

(declare-fun b!1034924 () Bool)

(assert (=> b!1034924 (= e!585095 (and (= (size!31895 (_values!6262 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30109 thiss!1427))) (not (= (size!31894 (_keys!11423 thiss!1427)) (size!31895 (_values!6262 thiss!1427))))))))

(declare-fun b!1034925 () Bool)

(declare-fun e!585096 () Bool)

(assert (=> b!1034925 (= e!585096 tp_is_empty!24535)))

(declare-fun b!1034926 () Bool)

(assert (=> b!1034926 (= e!585097 (and e!585096 mapRes!38298))))

(declare-fun condMapEmpty!38298 () Bool)

(declare-fun mapDefault!38298 () ValueCell!11564)

