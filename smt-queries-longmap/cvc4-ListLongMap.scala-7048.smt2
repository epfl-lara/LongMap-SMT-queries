; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89320 () Bool)

(assert start!89320)

(declare-fun b!1024060 () Bool)

(declare-fun b_free!20345 () Bool)

(declare-fun b_next!20345 () Bool)

(assert (=> b!1024060 (= b_free!20345 (not b_next!20345))))

(declare-fun tp!72074 () Bool)

(declare-fun b_and!32591 () Bool)

(assert (=> b!1024060 (= tp!72074 b_and!32591)))

(declare-fun b!1024055 () Bool)

(declare-fun e!577182 () Bool)

(declare-fun e!577180 () Bool)

(declare-fun mapRes!37519 () Bool)

(assert (=> b!1024055 (= e!577182 (and e!577180 mapRes!37519))))

(declare-fun condMapEmpty!37519 () Bool)

(declare-datatypes ((V!36959 0))(
  ( (V!36960 (val!12083 Int)) )
))
(declare-datatypes ((ValueCell!11329 0))(
  ( (ValueCellFull!11329 (v!14652 V!36959)) (EmptyCell!11329) )
))
(declare-datatypes ((array!64176 0))(
  ( (array!64177 (arr!30899 (Array (_ BitVec 32) (_ BitVec 64))) (size!31411 (_ BitVec 32))) )
))
(declare-datatypes ((array!64178 0))(
  ( (array!64179 (arr!30900 (Array (_ BitVec 32) ValueCell!11329)) (size!31412 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5252 0))(
  ( (LongMapFixedSize!5253 (defaultEntry!5978 Int) (mask!29617 (_ BitVec 32)) (extraKeys!5710 (_ BitVec 32)) (zeroValue!5814 V!36959) (minValue!5814 V!36959) (_size!2681 (_ BitVec 32)) (_keys!11124 array!64176) (_values!6001 array!64178) (_vacant!2681 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5252)

(declare-fun mapDefault!37519 () ValueCell!11329)

