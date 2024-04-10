; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107588 () Bool)

(assert start!107588)

(declare-fun b!1273590 () Bool)

(declare-fun b_free!27733 () Bool)

(declare-fun b_next!27733 () Bool)

(assert (=> b!1273590 (= b_free!27733 (not b_next!27733))))

(declare-fun tp!97753 () Bool)

(declare-fun b_and!45789 () Bool)

(assert (=> b!1273590 (= tp!97753 b_and!45789)))

(declare-fun b!1273584 () Bool)

(declare-fun e!726668 () Bool)

(declare-datatypes ((V!49331 0))(
  ( (V!49332 (val!16626 Int)) )
))
(declare-datatypes ((ValueCell!15698 0))(
  ( (ValueCellFull!15698 (v!19263 V!49331)) (EmptyCell!15698) )
))
(declare-datatypes ((array!83482 0))(
  ( (array!83483 (arr!40264 (Array (_ BitVec 32) ValueCell!15698)) (size!40808 (_ BitVec 32))) )
))
(declare-datatypes ((array!83484 0))(
  ( (array!83485 (arr!40265 (Array (_ BitVec 32) (_ BitVec 64))) (size!40809 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6160 0))(
  ( (LongMapFixedSize!6161 (defaultEntry!6726 Int) (mask!34513 (_ BitVec 32)) (extraKeys!6405 (_ BitVec 32)) (zeroValue!6511 V!49331) (minValue!6511 V!49331) (_size!3135 (_ BitVec 32)) (_keys!12140 array!83484) (_values!6749 array!83482) (_vacant!3135 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6160)

(assert (=> b!1273584 (= e!726668 (not (= (size!40809 (_keys!12140 thiss!1551)) (bvadd #b00000000000000000000000000000001 (mask!34513 thiss!1551)))))))

(declare-fun b!1273585 () Bool)

(declare-fun res!846898 () Bool)

(assert (=> b!1273585 (=> (not res!846898) (not e!726668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273585 (= res!846898 (validMask!0 (mask!34513 thiss!1551)))))

(declare-fun res!846900 () Bool)

(assert (=> start!107588 (=> (not res!846900) (not e!726668))))

(declare-fun simpleValid!469 (LongMapFixedSize!6160) Bool)

(assert (=> start!107588 (= res!846900 (simpleValid!469 thiss!1551))))

(assert (=> start!107588 e!726668))

(declare-fun e!726666 () Bool)

(assert (=> start!107588 e!726666))

(declare-fun b!1273586 () Bool)

(declare-fun res!846899 () Bool)

(assert (=> b!1273586 (=> (not res!846899) (not e!726668))))

(declare-fun arrayCountValidKeys!0 (array!83484 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273586 (= res!846899 (= (arrayCountValidKeys!0 (_keys!12140 thiss!1551) #b00000000000000000000000000000000 (size!40809 (_keys!12140 thiss!1551))) (_size!3135 thiss!1551)))))

(declare-fun b!1273587 () Bool)

(declare-fun e!726665 () Bool)

(declare-fun e!726670 () Bool)

(declare-fun mapRes!51283 () Bool)

(assert (=> b!1273587 (= e!726665 (and e!726670 mapRes!51283))))

(declare-fun condMapEmpty!51283 () Bool)

(declare-fun mapDefault!51283 () ValueCell!15698)

