; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107604 () Bool)

(assert start!107604)

(declare-fun b!1273678 () Bool)

(declare-fun b_free!27739 () Bool)

(declare-fun b_next!27739 () Bool)

(assert (=> b!1273678 (= b_free!27739 (not b_next!27739))))

(declare-fun tp!97773 () Bool)

(declare-fun b_and!45795 () Bool)

(assert (=> b!1273678 (= tp!97773 b_and!45795)))

(declare-fun res!846933 () Bool)

(declare-fun e!726739 () Bool)

(assert (=> start!107604 (=> (not res!846933) (not e!726739))))

(declare-datatypes ((V!49339 0))(
  ( (V!49340 (val!16629 Int)) )
))
(declare-datatypes ((ValueCell!15701 0))(
  ( (ValueCellFull!15701 (v!19266 V!49339)) (EmptyCell!15701) )
))
(declare-datatypes ((array!83496 0))(
  ( (array!83497 (arr!40270 (Array (_ BitVec 32) ValueCell!15701)) (size!40815 (_ BitVec 32))) )
))
(declare-datatypes ((array!83498 0))(
  ( (array!83499 (arr!40271 (Array (_ BitVec 32) (_ BitVec 64))) (size!40816 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6166 0))(
  ( (LongMapFixedSize!6167 (defaultEntry!6729 Int) (mask!34519 (_ BitVec 32)) (extraKeys!6408 (_ BitVec 32)) (zeroValue!6514 V!49339) (minValue!6514 V!49339) (_size!3138 (_ BitVec 32)) (_keys!12143 array!83498) (_values!6752 array!83496) (_vacant!3138 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6166)

(declare-fun simpleValid!472 (LongMapFixedSize!6166) Bool)

(assert (=> start!107604 (= res!846933 (simpleValid!472 thiss!1551))))

(assert (=> start!107604 e!726739))

(declare-fun e!726737 () Bool)

(assert (=> start!107604 e!726737))

(declare-fun b!1273675 () Bool)

(assert (=> b!1273675 (= e!726739 false)))

(declare-fun lt!575140 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!83498 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273675 (= lt!575140 (arrayCountValidKeys!0 (_keys!12143 thiss!1551) #b00000000000000000000000000000000 (size!40816 (_keys!12143 thiss!1551))))))

(declare-fun b!1273676 () Bool)

(declare-fun e!726734 () Bool)

(declare-fun tp_is_empty!33109 () Bool)

(assert (=> b!1273676 (= e!726734 tp_is_empty!33109)))

(declare-fun b!1273677 () Bool)

(declare-fun e!726736 () Bool)

(declare-fun e!726738 () Bool)

(declare-fun mapRes!51295 () Bool)

(assert (=> b!1273677 (= e!726736 (and e!726738 mapRes!51295))))

(declare-fun condMapEmpty!51295 () Bool)

(declare-fun mapDefault!51295 () ValueCell!15701)

