; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105640 () Bool)

(assert start!105640)

(declare-fun b_free!27241 () Bool)

(declare-fun b_next!27241 () Bool)

(assert (=> start!105640 (= b_free!27241 (not b_next!27241))))

(declare-fun tp!95246 () Bool)

(declare-fun b_and!45115 () Bool)

(assert (=> start!105640 (= tp!95246 b_and!45115)))

(declare-fun mapIsEmpty!50008 () Bool)

(declare-fun mapRes!50008 () Bool)

(assert (=> mapIsEmpty!50008 mapRes!50008))

(declare-fun b!1258369 () Bool)

(declare-fun e!715681 () Bool)

(declare-fun e!715683 () Bool)

(assert (=> b!1258369 (= e!715681 (and e!715683 mapRes!50008))))

(declare-fun condMapEmpty!50008 () Bool)

(declare-datatypes ((V!48223 0))(
  ( (V!48224 (val!16134 Int)) )
))
(declare-datatypes ((ValueCell!15308 0))(
  ( (ValueCellFull!15308 (v!18836 V!48223)) (EmptyCell!15308) )
))
(declare-datatypes ((array!81910 0))(
  ( (array!81911 (arr!39511 (Array (_ BitVec 32) ValueCell!15308)) (size!40047 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81910)

(declare-fun mapDefault!50008 () ValueCell!15308)

