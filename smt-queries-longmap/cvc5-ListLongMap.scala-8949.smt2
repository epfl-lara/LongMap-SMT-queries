; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108420 () Bool)

(assert start!108420)

(declare-fun b_free!27967 () Bool)

(declare-fun b_next!27967 () Bool)

(assert (=> start!108420 (= b_free!27967 (not b_next!27967))))

(declare-fun tp!99011 () Bool)

(declare-fun b_and!46027 () Bool)

(assert (=> start!108420 (= tp!99011 b_and!46027)))

(declare-fun mapNonEmpty!51962 () Bool)

(declare-fun mapRes!51962 () Bool)

(declare-fun tp!99010 () Bool)

(declare-fun e!731118 () Bool)

(assert (=> mapNonEmpty!51962 (= mapRes!51962 (and tp!99010 e!731118))))

(declare-datatypes ((V!49913 0))(
  ( (V!49914 (val!16878 Int)) )
))
(declare-datatypes ((ValueCell!15905 0))(
  ( (ValueCellFull!15905 (v!19478 V!49913)) (EmptyCell!15905) )
))
(declare-fun mapValue!51962 () ValueCell!15905)

(declare-datatypes ((array!84300 0))(
  ( (array!84301 (arr!40654 (Array (_ BitVec 32) ValueCell!15905)) (size!41204 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84300)

(declare-fun mapKey!51962 () (_ BitVec 32))

(declare-fun mapRest!51962 () (Array (_ BitVec 32) ValueCell!15905))

(assert (=> mapNonEmpty!51962 (= (arr!40654 _values!1445) (store mapRest!51962 mapKey!51962 mapValue!51962))))

(declare-fun b!1279611 () Bool)

(declare-fun e!731117 () Bool)

(declare-fun e!731119 () Bool)

(assert (=> b!1279611 (= e!731117 (and e!731119 mapRes!51962))))

(declare-fun condMapEmpty!51962 () Bool)

(declare-fun mapDefault!51962 () ValueCell!15905)

