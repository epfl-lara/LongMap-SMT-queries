; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4464 () Bool)

(assert start!4464)

(declare-fun b_free!1225 () Bool)

(declare-fun b_next!1225 () Bool)

(assert (=> start!4464 (= b_free!1225 (not b_next!1225))))

(declare-fun tp!5113 () Bool)

(declare-fun b_and!2047 () Bool)

(assert (=> start!4464 (= tp!5113 b_and!2047)))

(declare-fun b!34591 () Bool)

(declare-fun res!20995 () Bool)

(declare-fun e!21921 () Bool)

(assert (=> b!34591 (=> (not res!20995) (not e!21921))))

(declare-datatypes ((V!1931 0))(
  ( (V!1932 (val!816 Int)) )
))
(declare-datatypes ((ValueCell!590 0))(
  ( (ValueCellFull!590 (v!1911 V!1931)) (EmptyCell!590) )
))
(declare-datatypes ((array!2375 0))(
  ( (array!2376 (arr!1135 (Array (_ BitVec 32) ValueCell!590)) (size!1236 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2375)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2377 0))(
  ( (array!2378 (arr!1136 (Array (_ BitVec 32) (_ BitVec 64))) (size!1237 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2377)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!34591 (= res!20995 (and (= (size!1236 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1237 _keys!1833) (size!1236 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34592 () Bool)

(declare-fun e!21923 () Bool)

(declare-fun tp_is_empty!1579 () Bool)

(assert (=> b!34592 (= e!21923 tp_is_empty!1579)))

(declare-fun mapNonEmpty!1915 () Bool)

(declare-fun mapRes!1915 () Bool)

(declare-fun tp!5112 () Bool)

(assert (=> mapNonEmpty!1915 (= mapRes!1915 (and tp!5112 e!21923))))

(declare-fun mapKey!1915 () (_ BitVec 32))

(declare-fun mapValue!1915 () ValueCell!590)

(declare-fun mapRest!1915 () (Array (_ BitVec 32) ValueCell!590))

(assert (=> mapNonEmpty!1915 (= (arr!1135 _values!1501) (store mapRest!1915 mapKey!1915 mapValue!1915))))

(declare-fun b!34593 () Bool)

(declare-fun res!20997 () Bool)

(assert (=> b!34593 (=> (not res!20997) (not e!21921))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34593 (= res!20997 (validKeyInArray!0 k!1304))))

(declare-fun b!34594 () Bool)

(declare-fun res!20998 () Bool)

(assert (=> b!34594 (=> (not res!20998) (not e!21921))))

(declare-fun arrayContainsKey!0 (array!2377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34594 (= res!20998 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34595 () Bool)

(declare-fun e!21922 () Bool)

(assert (=> b!34595 (= e!21922 tp_is_empty!1579)))

(declare-fun b!34596 () Bool)

(declare-fun e!21924 () Bool)

(assert (=> b!34596 (= e!21924 (and e!21922 mapRes!1915))))

(declare-fun condMapEmpty!1915 () Bool)

(declare-fun mapDefault!1915 () ValueCell!590)

