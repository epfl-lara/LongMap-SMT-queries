; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108198 () Bool)

(assert start!108198)

(declare-fun b_free!27893 () Bool)

(declare-fun b_next!27893 () Bool)

(assert (=> start!108198 (= b_free!27893 (not b_next!27893))))

(declare-fun tp!98636 () Bool)

(declare-fun b_and!45951 () Bool)

(assert (=> start!108198 (= tp!98636 b_and!45951)))

(declare-fun b!1277676 () Bool)

(declare-fun e!729713 () Bool)

(declare-fun tp_is_empty!33443 () Bool)

(assert (=> b!1277676 (= e!729713 tp_is_empty!33443)))

(declare-fun b!1277677 () Bool)

(declare-fun e!729712 () Bool)

(declare-fun mapRes!51698 () Bool)

(assert (=> b!1277677 (= e!729712 (and e!729713 mapRes!51698))))

(declare-fun condMapEmpty!51698 () Bool)

(declare-datatypes ((V!49693 0))(
  ( (V!49694 (val!16796 Int)) )
))
(declare-datatypes ((ValueCell!15823 0))(
  ( (ValueCellFull!15823 (v!19394 V!49693)) (EmptyCell!15823) )
))
(declare-datatypes ((array!83980 0))(
  ( (array!83981 (arr!40500 (Array (_ BitVec 32) ValueCell!15823)) (size!41050 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83980)

(declare-fun mapDefault!51698 () ValueCell!15823)

