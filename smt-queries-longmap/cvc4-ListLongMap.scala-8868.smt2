; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107630 () Bool)

(assert start!107630)

(declare-fun b!1273862 () Bool)

(declare-fun b_free!27755 () Bool)

(declare-fun b_next!27755 () Bool)

(assert (=> b!1273862 (= b_free!27755 (not b_next!27755))))

(declare-fun tp!97825 () Bool)

(declare-fun b_and!45811 () Bool)

(assert (=> b!1273862 (= tp!97825 b_and!45811)))

(declare-fun mapIsEmpty!51322 () Bool)

(declare-fun mapRes!51322 () Bool)

(assert (=> mapIsEmpty!51322 mapRes!51322))

(declare-fun res!847004 () Bool)

(declare-fun e!726896 () Bool)

(assert (=> start!107630 (=> (not res!847004) (not e!726896))))

(declare-datatypes ((V!49359 0))(
  ( (V!49360 (val!16637 Int)) )
))
(declare-datatypes ((ValueCell!15709 0))(
  ( (ValueCellFull!15709 (v!19274 V!49359)) (EmptyCell!15709) )
))
(declare-datatypes ((array!83530 0))(
  ( (array!83531 (arr!40286 (Array (_ BitVec 32) ValueCell!15709)) (size!40832 (_ BitVec 32))) )
))
(declare-datatypes ((array!83532 0))(
  ( (array!83533 (arr!40287 (Array (_ BitVec 32) (_ BitVec 64))) (size!40833 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6182 0))(
  ( (LongMapFixedSize!6183 (defaultEntry!6737 Int) (mask!34532 (_ BitVec 32)) (extraKeys!6416 (_ BitVec 32)) (zeroValue!6522 V!49359) (minValue!6522 V!49359) (_size!3146 (_ BitVec 32)) (_keys!12151 array!83532) (_values!6760 array!83530) (_vacant!3146 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6182)

(declare-fun simpleValid!478 (LongMapFixedSize!6182) Bool)

(assert (=> start!107630 (= res!847004 (simpleValid!478 thiss!1551))))

(assert (=> start!107630 e!726896))

(declare-fun e!726898 () Bool)

(assert (=> start!107630 e!726898))

(declare-fun b!1273861 () Bool)

(declare-fun e!726893 () Bool)

(declare-fun e!726894 () Bool)

(assert (=> b!1273861 (= e!726893 (and e!726894 mapRes!51322))))

(declare-fun condMapEmpty!51322 () Bool)

(declare-fun mapDefault!51322 () ValueCell!15709)

