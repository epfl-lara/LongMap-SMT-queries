; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9216 () Bool)

(assert start!9216)

(declare-fun b!65756 () Bool)

(declare-fun b_free!2049 () Bool)

(declare-fun b_next!2049 () Bool)

(assert (=> b!65756 (= b_free!2049 (not b_next!2049))))

(declare-fun tp!8295 () Bool)

(declare-fun b_and!4051 () Bool)

(assert (=> b!65756 (= tp!8295 b_and!4051)))

(declare-fun b!65769 () Bool)

(declare-fun b_free!2051 () Bool)

(declare-fun b_next!2051 () Bool)

(assert (=> b!65769 (= b_free!2051 (not b_next!2051))))

(declare-fun tp!8296 () Bool)

(declare-fun b_and!4053 () Bool)

(assert (=> b!65769 (= tp!8296 b_and!4053)))

(declare-fun mapIsEmpty!3041 () Bool)

(declare-fun mapRes!3042 () Bool)

(assert (=> mapIsEmpty!3041 mapRes!3042))

(declare-fun b!65752 () Bool)

(declare-fun e!43113 () Bool)

(declare-fun tp_is_empty!2441 () Bool)

(assert (=> b!65752 (= e!43113 tp_is_empty!2441)))

(declare-fun b!65754 () Bool)

(declare-fun e!43115 () Bool)

(declare-fun e!43108 () Bool)

(assert (=> b!65754 (= e!43115 (and e!43108 mapRes!3042))))

(declare-fun condMapEmpty!3041 () Bool)

(declare-datatypes ((V!2901 0))(
  ( (V!2902 (val!1265 Int)) )
))
(declare-datatypes ((array!3819 0))(
  ( (array!3820 (arr!1825 (Array (_ BitVec 32) (_ BitVec 64))) (size!2060 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!877 0))(
  ( (ValueCellFull!877 (v!2466 V!2901)) (EmptyCell!877) )
))
(declare-datatypes ((array!3821 0))(
  ( (array!3822 (arr!1826 (Array (_ BitVec 32) ValueCell!877)) (size!2061 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!662 0))(
  ( (LongMapFixedSize!663 (defaultEntry!2139 Int) (mask!6069 (_ BitVec 32)) (extraKeys!2010 (_ BitVec 32)) (zeroValue!2047 V!2901) (minValue!2047 V!2901) (_size!380 (_ BitVec 32)) (_keys!3779 array!3819) (_values!2122 array!3821) (_vacant!380 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!662)

(declare-fun mapDefault!3042 () ValueCell!877)

