; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107674 () Bool)

(assert start!107674)

(declare-fun b!1274123 () Bool)

(declare-fun b_free!27767 () Bool)

(declare-fun b_next!27767 () Bool)

(assert (=> b!1274123 (= b_free!27767 (not b_next!27767))))

(declare-fun tp!97868 () Bool)

(declare-fun b_and!45823 () Bool)

(assert (=> b!1274123 (= tp!97868 b_and!45823)))

(declare-fun b!1274117 () Bool)

(declare-fun e!727076 () Bool)

(declare-fun e!727073 () Bool)

(declare-fun mapRes!51347 () Bool)

(assert (=> b!1274117 (= e!727076 (and e!727073 mapRes!51347))))

(declare-fun condMapEmpty!51347 () Bool)

(declare-datatypes ((V!49375 0))(
  ( (V!49376 (val!16643 Int)) )
))
(declare-datatypes ((ValueCell!15715 0))(
  ( (ValueCellFull!15715 (v!19280 V!49375)) (EmptyCell!15715) )
))
(declare-datatypes ((array!83558 0))(
  ( (array!83559 (arr!40298 (Array (_ BitVec 32) ValueCell!15715)) (size!40846 (_ BitVec 32))) )
))
(declare-datatypes ((array!83560 0))(
  ( (array!83561 (arr!40299 (Array (_ BitVec 32) (_ BitVec 64))) (size!40847 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6194 0))(
  ( (LongMapFixedSize!6195 (defaultEntry!6743 Int) (mask!34546 (_ BitVec 32)) (extraKeys!6422 (_ BitVec 32)) (zeroValue!6528 V!49375) (minValue!6528 V!49375) (_size!3152 (_ BitVec 32)) (_keys!12160 array!83560) (_values!6766 array!83558) (_vacant!3152 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6194)

(declare-fun mapDefault!51347 () ValueCell!15715)

