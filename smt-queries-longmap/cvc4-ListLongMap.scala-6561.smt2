; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83254 () Bool)

(assert start!83254)

(declare-fun b_free!19247 () Bool)

(declare-fun b_next!19247 () Bool)

(assert (=> start!83254 (= b_free!19247 (not b_next!19247))))

(declare-fun tp!67020 () Bool)

(declare-fun b_and!30735 () Bool)

(assert (=> start!83254 (= tp!67020 b_and!30735)))

(declare-fun b!971509 () Bool)

(declare-fun res!650267 () Bool)

(declare-fun e!547654 () Bool)

(assert (=> b!971509 (=> (not res!650267) (not e!547654))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34509 0))(
  ( (V!34510 (val!11123 Int)) )
))
(declare-datatypes ((ValueCell!10591 0))(
  ( (ValueCellFull!10591 (v!13682 V!34509)) (EmptyCell!10591) )
))
(declare-datatypes ((array!60337 0))(
  ( (array!60338 (arr!29032 (Array (_ BitVec 32) ValueCell!10591)) (size!29511 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60337)

(declare-fun zeroValue!1367 () V!34509)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34509)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60339 0))(
  ( (array!60340 (arr!29033 (Array (_ BitVec 32) (_ BitVec 64))) (size!29512 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60339)

(declare-datatypes ((tuple2!14256 0))(
  ( (tuple2!14257 (_1!7139 (_ BitVec 64)) (_2!7139 V!34509)) )
))
(declare-datatypes ((List!20123 0))(
  ( (Nil!20120) (Cons!20119 (h!21281 tuple2!14256) (t!28486 List!20123)) )
))
(declare-datatypes ((ListLongMap!12953 0))(
  ( (ListLongMap!12954 (toList!6492 List!20123)) )
))
(declare-fun contains!5592 (ListLongMap!12953 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3725 (array!60339 array!60337 (_ BitVec 32) (_ BitVec 32) V!34509 V!34509 (_ BitVec 32) Int) ListLongMap!12953)

(assert (=> b!971509 (= res!650267 (contains!5592 (getCurrentListMap!3725 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29033 _keys!1717) i!822)))))

(declare-fun b!971510 () Bool)

(declare-fun res!650268 () Bool)

(assert (=> b!971510 (=> (not res!650268) (not e!547654))))

(declare-datatypes ((List!20124 0))(
  ( (Nil!20121) (Cons!20120 (h!21282 (_ BitVec 64)) (t!28487 List!20124)) )
))
(declare-fun arrayNoDuplicates!0 (array!60339 (_ BitVec 32) List!20124) Bool)

(assert (=> b!971510 (= res!650268 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20121))))

(declare-fun b!971511 () Bool)

(declare-fun e!547650 () Bool)

(declare-fun tp_is_empty!22145 () Bool)

(assert (=> b!971511 (= e!547650 tp_is_empty!22145)))

(declare-fun b!971512 () Bool)

(declare-fun res!650265 () Bool)

(assert (=> b!971512 (=> (not res!650265) (not e!547654))))

(assert (=> b!971512 (= res!650265 (and (= (size!29511 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29512 _keys!1717) (size!29511 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971513 () Bool)

(declare-fun e!547651 () Bool)

(declare-fun e!547653 () Bool)

(declare-fun mapRes!35227 () Bool)

(assert (=> b!971513 (= e!547651 (and e!547653 mapRes!35227))))

(declare-fun condMapEmpty!35227 () Bool)

(declare-fun mapDefault!35227 () ValueCell!10591)

