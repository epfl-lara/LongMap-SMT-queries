; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3636 () Bool)

(assert start!3636)

(declare-fun b!25129 () Bool)

(declare-fun b_free!767 () Bool)

(declare-fun b_next!767 () Bool)

(assert (=> b!25129 (= b_free!767 (not b_next!767))))

(declare-fun tp!3552 () Bool)

(declare-fun b_and!1561 () Bool)

(assert (=> b!25129 (= tp!3552 b_and!1561)))

(declare-fun res!15196 () Bool)

(declare-fun e!16264 () Bool)

(assert (=> start!3636 (=> (not res!15196) (not e!16264))))

(declare-datatypes ((V!1199 0))(
  ( (V!1200 (val!542 Int)) )
))
(declare-datatypes ((ValueCell!316 0))(
  ( (ValueCellFull!316 (v!1621 V!1199)) (EmptyCell!316) )
))
(declare-datatypes ((array!1301 0))(
  ( (array!1302 (arr!615 (Array (_ BitVec 32) ValueCell!316)) (size!716 (_ BitVec 32))) )
))
(declare-datatypes ((array!1303 0))(
  ( (array!1304 (arr!616 (Array (_ BitVec 32) (_ BitVec 64))) (size!717 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!218 0))(
  ( (LongMapFixedSize!219 (defaultEntry!1766 Int) (mask!4765 (_ BitVec 32)) (extraKeys!1659 (_ BitVec 32)) (zeroValue!1686 V!1199) (minValue!1686 V!1199) (_size!156 (_ BitVec 32)) (_keys!3192 array!1303) (_values!1751 array!1301) (_vacant!156 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!218 0))(
  ( (Cell!219 (v!1622 LongMapFixedSize!218)) )
))
(declare-datatypes ((LongMap!218 0))(
  ( (LongMap!219 (underlying!120 Cell!218)) )
))
(declare-fun thiss!938 () LongMap!218)

(declare-fun valid!106 (LongMap!218) Bool)

(assert (=> start!3636 (= res!15196 (valid!106 thiss!938))))

(assert (=> start!3636 e!16264))

(declare-fun e!16259 () Bool)

(assert (=> start!3636 e!16259))

(declare-fun b!25125 () Bool)

(declare-fun e!16267 () Bool)

(declare-fun e!16265 () Bool)

(assert (=> b!25125 (= e!16267 e!16265)))

(declare-fun b!25126 () Bool)

(declare-datatypes ((tuple2!972 0))(
  ( (tuple2!973 (_1!495 Bool) (_2!495 Cell!218)) )
))
(declare-fun e!16270 () tuple2!972)

(declare-datatypes ((tuple2!974 0))(
  ( (tuple2!975 (_1!496 Bool) (_2!496 LongMapFixedSize!218)) )
))
(declare-fun lt!9727 () tuple2!974)

(assert (=> b!25126 (= e!16270 (tuple2!973 (_1!496 lt!9727) (Cell!219 (_2!496 lt!9727))))))

(declare-fun call!2240 () tuple2!974)

(assert (=> b!25126 (= lt!9727 call!2240)))

(declare-fun b!25127 () Bool)

(declare-fun c!3453 () Bool)

(declare-fun lt!9726 () Bool)

(assert (=> b!25127 (= c!3453 (and (not (= (bvand (extraKeys!1659 (v!1622 (underlying!120 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!9726))))

(declare-fun e!16266 () tuple2!972)

(assert (=> b!25127 (= e!16266 e!16270)))

(declare-fun mapIsEmpty!1042 () Bool)

(declare-fun mapRes!1042 () Bool)

(assert (=> mapIsEmpty!1042 mapRes!1042))

(declare-fun b!25128 () Bool)

(declare-fun e!16260 () Bool)

(declare-fun e!16261 () Bool)

(assert (=> b!25128 (= e!16260 (and e!16261 mapRes!1042))))

(declare-fun condMapEmpty!1042 () Bool)

(declare-fun mapDefault!1042 () ValueCell!316)

