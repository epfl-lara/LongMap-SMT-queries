; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105668 () Bool)

(assert start!105668)

(declare-fun b_free!27269 () Bool)

(declare-fun b_next!27269 () Bool)

(assert (=> start!105668 (= b_free!27269 (not b_next!27269))))

(declare-fun tp!95330 () Bool)

(declare-fun b_and!45143 () Bool)

(assert (=> start!105668 (= tp!95330 b_and!45143)))

(declare-fun mapIsEmpty!50050 () Bool)

(declare-fun mapRes!50050 () Bool)

(assert (=> mapIsEmpty!50050 mapRes!50050))

(declare-fun b!1258705 () Bool)

(declare-fun e!715935 () Bool)

(declare-fun tp_is_empty!32171 () Bool)

(assert (=> b!1258705 (= e!715935 tp_is_empty!32171)))

(declare-fun b!1258706 () Bool)

(declare-fun e!715934 () Bool)

(declare-fun e!715936 () Bool)

(assert (=> b!1258706 (= e!715934 (and e!715936 mapRes!50050))))

(declare-fun condMapEmpty!50050 () Bool)

(declare-datatypes ((V!48259 0))(
  ( (V!48260 (val!16148 Int)) )
))
(declare-datatypes ((ValueCell!15322 0))(
  ( (ValueCellFull!15322 (v!18850 V!48259)) (EmptyCell!15322) )
))
(declare-datatypes ((array!81962 0))(
  ( (array!81963 (arr!39537 (Array (_ BitVec 32) ValueCell!15322)) (size!40073 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81962)

(declare-fun mapDefault!50050 () ValueCell!15322)

