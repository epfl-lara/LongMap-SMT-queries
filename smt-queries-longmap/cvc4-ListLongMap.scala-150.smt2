; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2944 () Bool)

(assert start!2944)

(declare-fun b!16790 () Bool)

(declare-fun b_free!581 () Bool)

(declare-fun b_next!581 () Bool)

(assert (=> b!16790 (= b_free!581 (not b_next!581))))

(declare-fun tp!2929 () Bool)

(declare-fun b_and!1223 () Bool)

(assert (=> b!16790 (= tp!2929 b_and!1223)))

(declare-fun lt!4138 () Bool)

(declare-datatypes ((V!951 0))(
  ( (V!952 (val!449 Int)) )
))
(declare-datatypes ((ValueCell!223 0))(
  ( (ValueCellFull!223 (v!1398 V!951)) (EmptyCell!223) )
))
(declare-datatypes ((array!893 0))(
  ( (array!894 (arr!429 (Array (_ BitVec 32) ValueCell!223)) (size!518 (_ BitVec 32))) )
))
(declare-datatypes ((array!895 0))(
  ( (array!896 (arr!430 (Array (_ BitVec 32) (_ BitVec 64))) (size!519 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!32 0))(
  ( (LongMapFixedSize!33 (defaultEntry!1626 Int) (mask!4534 (_ BitVec 32)) (extraKeys!1540 (_ BitVec 32)) (zeroValue!1563 V!951) (minValue!1563 V!951) (_size!47 (_ BitVec 32)) (_keys!3051 array!895) (_values!1624 array!893) (_vacant!47 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!32 0))(
  ( (Cell!33 (v!1399 LongMapFixedSize!32)) )
))
(declare-datatypes ((LongMap!32 0))(
  ( (LongMap!33 (underlying!27 Cell!32)) )
))
(declare-fun thiss!848 () LongMap!32)

(declare-fun valid!19 (LongMap!32) Bool)

(assert (=> start!2944 (= lt!4138 (valid!19 thiss!848))))

(assert (=> start!2944 false))

(declare-fun e!10434 () Bool)

(assert (=> start!2944 e!10434))

(declare-fun b!16785 () Bool)

(declare-fun e!10437 () Bool)

(declare-fun tp_is_empty!845 () Bool)

(assert (=> b!16785 (= e!10437 tp_is_empty!845)))

(declare-fun b!16786 () Bool)

(declare-fun e!10438 () Bool)

(declare-fun e!10432 () Bool)

(assert (=> b!16786 (= e!10438 e!10432)))

(declare-fun b!16787 () Bool)

(declare-fun e!10436 () Bool)

(declare-fun mapRes!698 () Bool)

(assert (=> b!16787 (= e!10436 (and e!10437 mapRes!698))))

(declare-fun condMapEmpty!698 () Bool)

(declare-fun mapDefault!698 () ValueCell!223)

