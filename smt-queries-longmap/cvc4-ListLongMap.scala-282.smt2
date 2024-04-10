; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4584 () Bool)

(assert start!4584)

(declare-fun b_free!1283 () Bool)

(declare-fun b_next!1283 () Bool)

(assert (=> start!4584 (= b_free!1283 (not b_next!1283))))

(declare-fun tp!5296 () Bool)

(declare-fun b_and!2111 () Bool)

(assert (=> start!4584 (= tp!5296 b_and!2111)))

(declare-fun b!35893 () Bool)

(declare-fun res!21791 () Bool)

(declare-fun e!22670 () Bool)

(assert (=> b!35893 (=> (not res!21791) (not e!22670))))

(declare-datatypes ((array!2489 0))(
  ( (array!2490 (arr!1189 (Array (_ BitVec 32) (_ BitVec 64))) (size!1290 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2489)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2489 (_ BitVec 32)) Bool)

(assert (=> b!35893 (= res!21791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!2011 () Bool)

(declare-fun mapRes!2011 () Bool)

(declare-fun tp!5295 () Bool)

(declare-fun e!22669 () Bool)

(assert (=> mapNonEmpty!2011 (= mapRes!2011 (and tp!5295 e!22669))))

(declare-fun mapKey!2011 () (_ BitVec 32))

(declare-datatypes ((V!2007 0))(
  ( (V!2008 (val!845 Int)) )
))
(declare-datatypes ((ValueCell!619 0))(
  ( (ValueCellFull!619 (v!1943 V!2007)) (EmptyCell!619) )
))
(declare-datatypes ((array!2491 0))(
  ( (array!2492 (arr!1190 (Array (_ BitVec 32) ValueCell!619)) (size!1291 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2491)

(declare-fun mapRest!2011 () (Array (_ BitVec 32) ValueCell!619))

(declare-fun mapValue!2011 () ValueCell!619)

(assert (=> mapNonEmpty!2011 (= (arr!1190 _values!1501) (store mapRest!2011 mapKey!2011 mapValue!2011))))

(declare-fun b!35894 () Bool)

(declare-fun tp_is_empty!1637 () Bool)

(assert (=> b!35894 (= e!22669 tp_is_empty!1637)))

(declare-fun b!35895 () Bool)

(declare-fun e!22667 () Bool)

(assert (=> b!35895 (= e!22667 tp_is_empty!1637)))

(declare-fun b!35896 () Bool)

(declare-fun e!22671 () Bool)

(assert (=> b!35896 (= e!22671 (and e!22667 mapRes!2011))))

(declare-fun condMapEmpty!2011 () Bool)

(declare-fun mapDefault!2011 () ValueCell!619)

