; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108534 () Bool)

(assert start!108534)

(declare-fun b_free!28081 () Bool)

(declare-fun b_next!28081 () Bool)

(assert (=> start!108534 (= b_free!28081 (not b_next!28081))))

(declare-fun tp!99353 () Bool)

(declare-fun b_and!46141 () Bool)

(assert (=> start!108534 (= tp!99353 b_and!46141)))

(declare-fun b!1281115 () Bool)

(declare-fun e!731975 () Bool)

(declare-fun tp_is_empty!33721 () Bool)

(assert (=> b!1281115 (= e!731975 tp_is_empty!33721)))

(declare-fun b!1281116 () Bool)

(declare-fun e!731971 () Bool)

(declare-fun e!731973 () Bool)

(declare-fun mapRes!52133 () Bool)

(assert (=> b!1281116 (= e!731971 (and e!731973 mapRes!52133))))

(declare-fun condMapEmpty!52133 () Bool)

(declare-datatypes ((V!50065 0))(
  ( (V!50066 (val!16935 Int)) )
))
(declare-datatypes ((ValueCell!15962 0))(
  ( (ValueCellFull!15962 (v!19535 V!50065)) (EmptyCell!15962) )
))
(declare-datatypes ((array!84514 0))(
  ( (array!84515 (arr!40761 (Array (_ BitVec 32) ValueCell!15962)) (size!41311 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84514)

(declare-fun mapDefault!52133 () ValueCell!15962)

