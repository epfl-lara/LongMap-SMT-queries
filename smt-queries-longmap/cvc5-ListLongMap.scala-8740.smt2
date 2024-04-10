; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106004 () Bool)

(assert start!106004)

(declare-fun b_free!27475 () Bool)

(declare-fun b_next!27475 () Bool)

(assert (=> start!106004 (= b_free!27475 (not b_next!27475))))

(declare-fun tp!95969 () Bool)

(declare-fun b_and!45425 () Bool)

(assert (=> start!106004 (= tp!95969 b_and!45425)))

(declare-fun b!1262373 () Bool)

(declare-fun e!718582 () Bool)

(declare-fun tp_is_empty!32377 () Bool)

(assert (=> b!1262373 (= e!718582 tp_is_empty!32377)))

(declare-fun b!1262374 () Bool)

(declare-fun e!718580 () Bool)

(declare-fun e!718577 () Bool)

(declare-fun mapRes!50380 () Bool)

(assert (=> b!1262374 (= e!718580 (and e!718577 mapRes!50380))))

(declare-fun condMapEmpty!50380 () Bool)

(declare-datatypes ((V!48535 0))(
  ( (V!48536 (val!16251 Int)) )
))
(declare-datatypes ((ValueCell!15425 0))(
  ( (ValueCellFull!15425 (v!18958 V!48535)) (EmptyCell!15425) )
))
(declare-datatypes ((array!82372 0))(
  ( (array!82373 (arr!39735 (Array (_ BitVec 32) ValueCell!15425)) (size!40271 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82372)

(declare-fun mapDefault!50380 () ValueCell!15425)

