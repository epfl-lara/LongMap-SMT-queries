; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83322 () Bool)

(assert start!83322)

(declare-fun b_free!19315 () Bool)

(declare-fun b_next!19315 () Bool)

(assert (=> start!83322 (= b_free!19315 (not b_next!19315))))

(declare-fun tp!67223 () Bool)

(declare-fun b_and!30851 () Bool)

(assert (=> start!83322 (= tp!67223 b_and!30851)))

(declare-fun res!651055 () Bool)

(declare-fun e!548236 () Bool)

(assert (=> start!83322 (=> (not res!651055) (not e!548236))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83322 (= res!651055 (validMask!0 mask!2147))))

(assert (=> start!83322 e!548236))

(assert (=> start!83322 true))

(declare-datatypes ((V!34601 0))(
  ( (V!34602 (val!11157 Int)) )
))
(declare-datatypes ((ValueCell!10625 0))(
  ( (ValueCellFull!10625 (v!13716 V!34601)) (EmptyCell!10625) )
))
(declare-datatypes ((array!60473 0))(
  ( (array!60474 (arr!29100 (Array (_ BitVec 32) ValueCell!10625)) (size!29579 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60473)

(declare-fun e!548235 () Bool)

(declare-fun array_inv!22511 (array!60473) Bool)

(assert (=> start!83322 (and (array_inv!22511 _values!1425) e!548235)))

(declare-fun tp_is_empty!22213 () Bool)

(assert (=> start!83322 tp_is_empty!22213))

(assert (=> start!83322 tp!67223))

(declare-datatypes ((array!60475 0))(
  ( (array!60476 (arr!29101 (Array (_ BitVec 32) (_ BitVec 64))) (size!29580 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60475)

(declare-fun array_inv!22512 (array!60475) Bool)

(assert (=> start!83322 (array_inv!22512 _keys!1717)))

(declare-fun b!972651 () Bool)

(declare-fun res!651058 () Bool)

(assert (=> b!972651 (=> (not res!651058) (not e!548236))))

(declare-fun zeroValue!1367 () V!34601)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34601)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14314 0))(
  ( (tuple2!14315 (_1!7168 (_ BitVec 64)) (_2!7168 V!34601)) )
))
(declare-datatypes ((List!20178 0))(
  ( (Nil!20175) (Cons!20174 (h!21336 tuple2!14314) (t!28591 List!20178)) )
))
(declare-datatypes ((ListLongMap!13011 0))(
  ( (ListLongMap!13012 (toList!6521 List!20178)) )
))
(declare-fun contains!5614 (ListLongMap!13011 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3754 (array!60475 array!60473 (_ BitVec 32) (_ BitVec 32) V!34601 V!34601 (_ BitVec 32) Int) ListLongMap!13011)

(assert (=> b!972651 (= res!651058 (contains!5614 (getCurrentListMap!3754 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29101 _keys!1717) i!822)))))

(declare-fun b!972652 () Bool)

(declare-fun res!651053 () Bool)

(assert (=> b!972652 (=> (not res!651053) (not e!548236))))

(assert (=> b!972652 (= res!651053 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29580 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29580 _keys!1717))))))

(declare-fun b!972653 () Bool)

(declare-fun e!548239 () Bool)

(declare-fun mapRes!35329 () Bool)

(assert (=> b!972653 (= e!548235 (and e!548239 mapRes!35329))))

(declare-fun condMapEmpty!35329 () Bool)

(declare-fun mapDefault!35329 () ValueCell!10625)

