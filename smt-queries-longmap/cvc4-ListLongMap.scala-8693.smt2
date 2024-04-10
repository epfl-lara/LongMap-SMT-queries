; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105582 () Bool)

(assert start!105582)

(declare-fun b_free!27197 () Bool)

(declare-fun b_next!27197 () Bool)

(assert (=> start!105582 (= b_free!27197 (not b_next!27197))))

(declare-fun tp!95111 () Bool)

(declare-fun b_and!45063 () Bool)

(assert (=> start!105582 (= tp!95111 b_and!45063)))

(declare-fun b!1257784 () Bool)

(declare-fun e!715258 () Bool)

(declare-fun e!715257 () Bool)

(declare-fun mapRes!49939 () Bool)

(assert (=> b!1257784 (= e!715258 (and e!715257 mapRes!49939))))

(declare-fun condMapEmpty!49939 () Bool)

(declare-datatypes ((V!48163 0))(
  ( (V!48164 (val!16112 Int)) )
))
(declare-datatypes ((ValueCell!15286 0))(
  ( (ValueCellFull!15286 (v!18814 V!48163)) (EmptyCell!15286) )
))
(declare-datatypes ((array!81830 0))(
  ( (array!81831 (arr!39472 (Array (_ BitVec 32) ValueCell!15286)) (size!40008 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81830)

(declare-fun mapDefault!49939 () ValueCell!15286)

