; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107492 () Bool)

(assert start!107492)

(declare-fun b!1273039 () Bool)

(declare-fun b_free!27697 () Bool)

(declare-fun b_next!27697 () Bool)

(assert (=> b!1273039 (= b_free!27697 (not b_next!27697))))

(declare-fun tp!97626 () Bool)

(declare-fun b_and!45753 () Bool)

(assert (=> b!1273039 (= tp!97626 b_and!45753)))

(declare-fun b!1273033 () Bool)

(declare-fun e!726230 () Bool)

(declare-fun tp_is_empty!33067 () Bool)

(assert (=> b!1273033 (= e!726230 tp_is_empty!33067)))

(declare-fun b!1273034 () Bool)

(declare-fun e!726229 () Bool)

(assert (=> b!1273034 (= e!726229 tp_is_empty!33067)))

(declare-fun mapIsEmpty!51210 () Bool)

(declare-fun mapRes!51210 () Bool)

(assert (=> mapIsEmpty!51210 mapRes!51210))

(declare-fun mapNonEmpty!51210 () Bool)

(declare-fun tp!97625 () Bool)

(assert (=> mapNonEmpty!51210 (= mapRes!51210 (and tp!97625 e!726229))))

(declare-datatypes ((V!49283 0))(
  ( (V!49284 (val!16608 Int)) )
))
(declare-datatypes ((ValueCell!15680 0))(
  ( (ValueCellFull!15680 (v!19245 V!49283)) (EmptyCell!15680) )
))
(declare-fun mapValue!51210 () ValueCell!15680)

(declare-datatypes ((array!83398 0))(
  ( (array!83399 (arr!40228 (Array (_ BitVec 32) ValueCell!15680)) (size!40769 (_ BitVec 32))) )
))
(declare-datatypes ((array!83400 0))(
  ( (array!83401 (arr!40229 (Array (_ BitVec 32) (_ BitVec 64))) (size!40770 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6124 0))(
  ( (LongMapFixedSize!6125 (defaultEntry!6708 Int) (mask!34475 (_ BitVec 32)) (extraKeys!6387 (_ BitVec 32)) (zeroValue!6493 V!49283) (minValue!6493 V!49283) (_size!3117 (_ BitVec 32)) (_keys!12119 array!83400) (_values!6731 array!83398) (_vacant!3117 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6124)

(declare-fun mapRest!51210 () (Array (_ BitVec 32) ValueCell!15680))

(declare-fun mapKey!51210 () (_ BitVec 32))

(assert (=> mapNonEmpty!51210 (= (arr!40228 (_values!6731 thiss!1559)) (store mapRest!51210 mapKey!51210 mapValue!51210))))

(declare-fun b!1273035 () Bool)

(declare-fun res!846657 () Bool)

(declare-fun e!726228 () Bool)

(assert (=> b!1273035 (=> (not res!846657) (not e!726228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273035 (= res!846657 (validMask!0 (mask!34475 thiss!1559)))))

(declare-fun b!1273036 () Bool)

(declare-fun e!726232 () Bool)

(assert (=> b!1273036 (= e!726232 (and e!726230 mapRes!51210))))

(declare-fun condMapEmpty!51210 () Bool)

(declare-fun mapDefault!51210 () ValueCell!15680)

