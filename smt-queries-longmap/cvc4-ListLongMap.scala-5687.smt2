; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73910 () Bool)

(assert start!73910)

(declare-fun b_free!14825 () Bool)

(declare-fun b_next!14825 () Bool)

(assert (=> start!73910 (= b_free!14825 (not b_next!14825))))

(declare-fun tp!51978 () Bool)

(declare-fun b_and!24577 () Bool)

(assert (=> start!73910 (= tp!51978 b_and!24577)))

(declare-fun b!868503 () Bool)

(declare-fun e!483723 () Bool)

(declare-fun e!483727 () Bool)

(declare-fun mapRes!27041 () Bool)

(assert (=> b!868503 (= e!483723 (and e!483727 mapRes!27041))))

(declare-fun condMapEmpty!27041 () Bool)

(declare-datatypes ((V!27661 0))(
  ( (V!27662 (val!8528 Int)) )
))
(declare-datatypes ((ValueCell!8041 0))(
  ( (ValueCellFull!8041 (v!10953 V!27661)) (EmptyCell!8041) )
))
(declare-datatypes ((array!50076 0))(
  ( (array!50077 (arr!24069 (Array (_ BitVec 32) ValueCell!8041)) (size!24509 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50076)

(declare-fun mapDefault!27041 () ValueCell!8041)

