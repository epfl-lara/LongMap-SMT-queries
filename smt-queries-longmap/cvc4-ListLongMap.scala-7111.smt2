; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90116 () Bool)

(assert start!90116)

(declare-fun b!1032336 () Bool)

(declare-fun b_free!20723 () Bool)

(declare-fun b_next!20723 () Bool)

(assert (=> b!1032336 (= b_free!20723 (not b_next!20723))))

(declare-fun tp!73239 () Bool)

(declare-fun b_and!33191 () Bool)

(assert (=> b!1032336 (= tp!73239 b_and!33191)))

(declare-fun e!583292 () Bool)

(declare-fun e!583291 () Bool)

(declare-datatypes ((V!37463 0))(
  ( (V!37464 (val!12272 Int)) )
))
(declare-datatypes ((ValueCell!11518 0))(
  ( (ValueCellFull!11518 (v!14849 V!37463)) (EmptyCell!11518) )
))
(declare-datatypes ((array!64950 0))(
  ( (array!64951 (arr!31277 (Array (_ BitVec 32) (_ BitVec 64))) (size!31794 (_ BitVec 32))) )
))
(declare-datatypes ((array!64952 0))(
  ( (array!64953 (arr!31278 (Array (_ BitVec 32) ValueCell!11518)) (size!31795 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5630 0))(
  ( (LongMapFixedSize!5631 (defaultEntry!6189 Int) (mask!30005 (_ BitVec 32)) (extraKeys!5921 (_ BitVec 32)) (zeroValue!6025 V!37463) (minValue!6025 V!37463) (_size!2870 (_ BitVec 32)) (_keys!11362 array!64950) (_values!6212 array!64952) (_vacant!2870 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5630)

(declare-fun tp_is_empty!24443 () Bool)

(declare-fun array_inv!24209 (array!64950) Bool)

(declare-fun array_inv!24210 (array!64952) Bool)

(assert (=> b!1032336 (= e!583291 (and tp!73239 tp_is_empty!24443 (array_inv!24209 (_keys!11362 thiss!1427)) (array_inv!24210 (_values!6212 thiss!1427)) e!583292))))

(declare-fun b!1032337 () Bool)

(declare-fun e!583288 () Bool)

(assert (=> b!1032337 (= e!583288 tp_is_empty!24443)))

(declare-fun b!1032338 () Bool)

(declare-fun mapRes!38118 () Bool)

(assert (=> b!1032338 (= e!583292 (and e!583288 mapRes!38118))))

(declare-fun condMapEmpty!38118 () Bool)

(declare-fun mapDefault!38118 () ValueCell!11518)

