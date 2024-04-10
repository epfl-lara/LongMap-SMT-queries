; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107610 () Bool)

(assert start!107610)

(declare-fun b!1273730 () Bool)

(declare-fun b_free!27745 () Bool)

(declare-fun b_next!27745 () Bool)

(assert (=> b!1273730 (= b_free!27745 (not b_next!27745))))

(declare-fun tp!97791 () Bool)

(declare-fun b_and!45801 () Bool)

(assert (=> b!1273730 (= tp!97791 b_and!45801)))

(declare-fun b!1273724 () Bool)

(declare-fun res!846947 () Bool)

(declare-fun e!726792 () Bool)

(assert (=> b!1273724 (=> (not res!846947) (not e!726792))))

(declare-datatypes ((V!49347 0))(
  ( (V!49348 (val!16632 Int)) )
))
(declare-datatypes ((ValueCell!15704 0))(
  ( (ValueCellFull!15704 (v!19269 V!49347)) (EmptyCell!15704) )
))
(declare-datatypes ((array!83508 0))(
  ( (array!83509 (arr!40276 (Array (_ BitVec 32) ValueCell!15704)) (size!40821 (_ BitVec 32))) )
))
(declare-datatypes ((array!83510 0))(
  ( (array!83511 (arr!40277 (Array (_ BitVec 32) (_ BitVec 64))) (size!40822 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6172 0))(
  ( (LongMapFixedSize!6173 (defaultEntry!6732 Int) (mask!34524 (_ BitVec 32)) (extraKeys!6411 (_ BitVec 32)) (zeroValue!6517 V!49347) (minValue!6517 V!49347) (_size!3141 (_ BitVec 32)) (_keys!12146 array!83510) (_values!6755 array!83508) (_vacant!3141 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6172)

(declare-fun arrayCountValidKeys!0 (array!83510 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273724 (= res!846947 (= (arrayCountValidKeys!0 (_keys!12146 thiss!1551) #b00000000000000000000000000000000 (size!40822 (_keys!12146 thiss!1551))) (_size!3141 thiss!1551)))))

(declare-fun b!1273725 () Bool)

(assert (=> b!1273725 (= e!726792 (and (= (size!40822 (_keys!12146 thiss!1551)) (bvadd #b00000000000000000000000000000001 (mask!34524 thiss!1551))) (bvsgt #b00000000000000000000000000000000 (size!40822 (_keys!12146 thiss!1551)))))))

(declare-fun b!1273726 () Bool)

(declare-fun res!846946 () Bool)

(assert (=> b!1273726 (=> (not res!846946) (not e!726792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273726 (= res!846946 (validMask!0 (mask!34524 thiss!1551)))))

(declare-fun res!846948 () Bool)

(assert (=> start!107610 (=> (not res!846948) (not e!726792))))

(declare-fun simpleValid!474 (LongMapFixedSize!6172) Bool)

(assert (=> start!107610 (= res!846948 (simpleValid!474 thiss!1551))))

(assert (=> start!107610 e!726792))

(declare-fun e!726788 () Bool)

(assert (=> start!107610 e!726788))

(declare-fun b!1273727 () Bool)

(declare-fun e!726789 () Bool)

(declare-fun e!726791 () Bool)

(declare-fun mapRes!51304 () Bool)

(assert (=> b!1273727 (= e!726789 (and e!726791 mapRes!51304))))

(declare-fun condMapEmpty!51304 () Bool)

(declare-fun mapDefault!51304 () ValueCell!15704)

