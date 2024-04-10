; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90106 () Bool)

(assert start!90106)

(declare-fun b!1032247 () Bool)

(declare-fun b_free!20713 () Bool)

(declare-fun b_next!20713 () Bool)

(assert (=> b!1032247 (= b_free!20713 (not b_next!20713))))

(declare-fun tp!73210 () Bool)

(declare-fun b_and!33181 () Bool)

(assert (=> b!1032247 (= tp!73210 b_and!33181)))

(declare-fun b!1032246 () Bool)

(declare-fun e!583199 () Bool)

(declare-fun tp_is_empty!24433 () Bool)

(assert (=> b!1032246 (= e!583199 tp_is_empty!24433)))

(declare-fun e!583200 () Bool)

(declare-datatypes ((V!37451 0))(
  ( (V!37452 (val!12267 Int)) )
))
(declare-datatypes ((ValueCell!11513 0))(
  ( (ValueCellFull!11513 (v!14844 V!37451)) (EmptyCell!11513) )
))
(declare-datatypes ((array!64930 0))(
  ( (array!64931 (arr!31267 (Array (_ BitVec 32) (_ BitVec 64))) (size!31784 (_ BitVec 32))) )
))
(declare-datatypes ((array!64932 0))(
  ( (array!64933 (arr!31268 (Array (_ BitVec 32) ValueCell!11513)) (size!31785 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5620 0))(
  ( (LongMapFixedSize!5621 (defaultEntry!6184 Int) (mask!29998 (_ BitVec 32)) (extraKeys!5916 (_ BitVec 32)) (zeroValue!6020 V!37451) (minValue!6020 V!37451) (_size!2865 (_ BitVec 32)) (_keys!11357 array!64930) (_values!6207 array!64932) (_vacant!2865 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5620)

(declare-fun e!583202 () Bool)

(declare-fun array_inv!24201 (array!64930) Bool)

(declare-fun array_inv!24202 (array!64932) Bool)

(assert (=> b!1032247 (= e!583202 (and tp!73210 tp_is_empty!24433 (array_inv!24201 (_keys!11357 thiss!1427)) (array_inv!24202 (_values!6207 thiss!1427)) e!583200))))

(declare-fun b!1032248 () Bool)

(declare-fun e!583201 () Bool)

(assert (=> b!1032248 (= e!583201 tp_is_empty!24433)))

(declare-fun res!689968 () Bool)

(declare-fun e!583203 () Bool)

(assert (=> start!90106 (=> (not res!689968) (not e!583203))))

(declare-fun valid!2127 (LongMapFixedSize!5620) Bool)

(assert (=> start!90106 (= res!689968 (valid!2127 thiss!1427))))

(assert (=> start!90106 e!583203))

(assert (=> start!90106 e!583202))

(assert (=> start!90106 true))

(declare-fun b!1032249 () Bool)

(declare-fun mapRes!38103 () Bool)

(assert (=> b!1032249 (= e!583200 (and e!583199 mapRes!38103))))

(declare-fun condMapEmpty!38103 () Bool)

(declare-fun mapDefault!38103 () ValueCell!11513)

