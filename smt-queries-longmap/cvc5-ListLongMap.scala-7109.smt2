; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90100 () Bool)

(assert start!90100)

(declare-fun b!1032196 () Bool)

(declare-fun b_free!20707 () Bool)

(declare-fun b_next!20707 () Bool)

(assert (=> b!1032196 (= b_free!20707 (not b_next!20707))))

(declare-fun tp!73192 () Bool)

(declare-fun b_and!33175 () Bool)

(assert (=> b!1032196 (= tp!73192 b_and!33175)))

(declare-fun b!1032192 () Bool)

(declare-fun e!583144 () Bool)

(declare-fun tp_is_empty!24427 () Bool)

(assert (=> b!1032192 (= e!583144 tp_is_empty!24427)))

(declare-fun b!1032193 () Bool)

(declare-fun e!583149 () Bool)

(declare-fun e!583148 () Bool)

(declare-fun mapRes!38094 () Bool)

(assert (=> b!1032193 (= e!583149 (and e!583148 mapRes!38094))))

(declare-fun condMapEmpty!38094 () Bool)

(declare-datatypes ((V!37443 0))(
  ( (V!37444 (val!12264 Int)) )
))
(declare-datatypes ((ValueCell!11510 0))(
  ( (ValueCellFull!11510 (v!14841 V!37443)) (EmptyCell!11510) )
))
(declare-datatypes ((array!64918 0))(
  ( (array!64919 (arr!31261 (Array (_ BitVec 32) (_ BitVec 64))) (size!31778 (_ BitVec 32))) )
))
(declare-datatypes ((array!64920 0))(
  ( (array!64921 (arr!31262 (Array (_ BitVec 32) ValueCell!11510)) (size!31779 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5614 0))(
  ( (LongMapFixedSize!5615 (defaultEntry!6181 Int) (mask!29993 (_ BitVec 32)) (extraKeys!5913 (_ BitVec 32)) (zeroValue!6017 V!37443) (minValue!6017 V!37443) (_size!2862 (_ BitVec 32)) (_keys!11354 array!64918) (_values!6204 array!64920) (_vacant!2862 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5614)

(declare-fun mapDefault!38094 () ValueCell!11510)

