; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108514 () Bool)

(assert start!108514)

(declare-fun b_free!28061 () Bool)

(declare-fun b_next!28061 () Bool)

(assert (=> start!108514 (= b_free!28061 (not b_next!28061))))

(declare-fun tp!99292 () Bool)

(declare-fun b_and!46121 () Bool)

(assert (=> start!108514 (= tp!99292 b_and!46121)))

(declare-fun b!1280815 () Bool)

(declare-fun res!850800 () Bool)

(declare-fun e!731825 () Bool)

(assert (=> b!1280815 (=> (not res!850800) (not e!731825))))

(declare-datatypes ((array!84478 0))(
  ( (array!84479 (arr!40743 (Array (_ BitVec 32) (_ BitVec 64))) (size!41293 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84478)

(declare-datatypes ((List!28863 0))(
  ( (Nil!28860) (Cons!28859 (h!30068 (_ BitVec 64)) (t!42403 List!28863)) )
))
(declare-fun arrayNoDuplicates!0 (array!84478 (_ BitVec 32) List!28863) Bool)

(assert (=> b!1280815 (= res!850800 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28860))))

(declare-fun b!1280816 () Bool)

(declare-fun res!850801 () Bool)

(assert (=> b!1280816 (=> (not res!850801) (not e!731825))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50037 0))(
  ( (V!50038 (val!16925 Int)) )
))
(declare-datatypes ((ValueCell!15952 0))(
  ( (ValueCellFull!15952 (v!19525 V!50037)) (EmptyCell!15952) )
))
(declare-datatypes ((array!84480 0))(
  ( (array!84481 (arr!40744 (Array (_ BitVec 32) ValueCell!15952)) (size!41294 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84480)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280816 (= res!850801 (and (= (size!41294 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41293 _keys!1741) (size!41294 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52103 () Bool)

(declare-fun mapRes!52103 () Bool)

(declare-fun tp!99293 () Bool)

(declare-fun e!731822 () Bool)

(assert (=> mapNonEmpty!52103 (= mapRes!52103 (and tp!99293 e!731822))))

(declare-fun mapKey!52103 () (_ BitVec 32))

(declare-fun mapRest!52103 () (Array (_ BitVec 32) ValueCell!15952))

(declare-fun mapValue!52103 () ValueCell!15952)

(assert (=> mapNonEmpty!52103 (= (arr!40744 _values!1445) (store mapRest!52103 mapKey!52103 mapValue!52103))))

(declare-fun b!1280817 () Bool)

(declare-fun e!731824 () Bool)

(declare-fun e!731821 () Bool)

(assert (=> b!1280817 (= e!731824 (and e!731821 mapRes!52103))))

(declare-fun condMapEmpty!52103 () Bool)

(declare-fun mapDefault!52103 () ValueCell!15952)

