; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89966 () Bool)

(assert start!89966)

(declare-fun b!1030254 () Bool)

(declare-fun b_free!20605 () Bool)

(declare-fun b_next!20605 () Bool)

(assert (=> b!1030254 (= b_free!20605 (not b_next!20605))))

(declare-fun tp!72882 () Bool)

(declare-fun b_and!32971 () Bool)

(assert (=> b!1030254 (= tp!72882 b_and!32971)))

(declare-fun e!581741 () Bool)

(declare-fun tp_is_empty!24325 () Bool)

(declare-fun e!581746 () Bool)

(declare-datatypes ((V!37307 0))(
  ( (V!37308 (val!12213 Int)) )
))
(declare-datatypes ((ValueCell!11459 0))(
  ( (ValueCellFull!11459 (v!14790 V!37307)) (EmptyCell!11459) )
))
(declare-datatypes ((array!64712 0))(
  ( (array!64713 (arr!31159 (Array (_ BitVec 32) (_ BitVec 64))) (size!31676 (_ BitVec 32))) )
))
(declare-datatypes ((array!64714 0))(
  ( (array!64715 (arr!31160 (Array (_ BitVec 32) ValueCell!11459)) (size!31677 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5512 0))(
  ( (LongMapFixedSize!5513 (defaultEntry!6128 Int) (mask!29902 (_ BitVec 32)) (extraKeys!5860 (_ BitVec 32)) (zeroValue!5964 V!37307) (minValue!5964 V!37307) (_size!2811 (_ BitVec 32)) (_keys!11299 array!64712) (_values!6151 array!64714) (_vacant!2811 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5512)

(declare-fun array_inv!24121 (array!64712) Bool)

(declare-fun array_inv!24122 (array!64714) Bool)

(assert (=> b!1030254 (= e!581746 (and tp!72882 tp_is_empty!24325 (array_inv!24121 (_keys!11299 thiss!1427)) (array_inv!24122 (_values!6151 thiss!1427)) e!581741))))

(declare-fun b!1030255 () Bool)

(declare-fun e!581745 () Bool)

(declare-fun mapRes!37938 () Bool)

(assert (=> b!1030255 (= e!581741 (and e!581745 mapRes!37938))))

(declare-fun condMapEmpty!37938 () Bool)

(declare-fun mapDefault!37938 () ValueCell!11459)

