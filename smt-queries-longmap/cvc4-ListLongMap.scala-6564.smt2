; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83272 () Bool)

(assert start!83272)

(declare-fun b_free!19265 () Bool)

(declare-fun b_next!19265 () Bool)

(assert (=> start!83272 (= b_free!19265 (not b_next!19265))))

(declare-fun tp!67073 () Bool)

(declare-fun b_and!30753 () Bool)

(assert (=> start!83272 (= tp!67073 b_and!30753)))

(declare-fun b!971779 () Bool)

(declare-fun e!547785 () Bool)

(assert (=> b!971779 (= e!547785 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34533 0))(
  ( (V!34534 (val!11132 Int)) )
))
(declare-datatypes ((tuple2!14270 0))(
  ( (tuple2!14271 (_1!7146 (_ BitVec 64)) (_2!7146 V!34533)) )
))
(declare-datatypes ((List!20136 0))(
  ( (Nil!20133) (Cons!20132 (h!21294 tuple2!14270) (t!28499 List!20136)) )
))
(declare-datatypes ((ListLongMap!12967 0))(
  ( (ListLongMap!12968 (toList!6499 List!20136)) )
))
(declare-fun lt!431867 () ListLongMap!12967)

(declare-datatypes ((ValueCell!10600 0))(
  ( (ValueCellFull!10600 (v!13691 V!34533)) (EmptyCell!10600) )
))
(declare-datatypes ((array!60373 0))(
  ( (array!60374 (arr!29050 (Array (_ BitVec 32) ValueCell!10600)) (size!29529 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60373)

(declare-fun zeroValue!1367 () V!34533)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34533)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60375 0))(
  ( (array!60376 (arr!29051 (Array (_ BitVec 32) (_ BitVec 64))) (size!29530 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60375)

(declare-fun getCurrentListMap!3732 (array!60375 array!60373 (_ BitVec 32) (_ BitVec 32) V!34533 V!34533 (_ BitVec 32) Int) ListLongMap!12967)

(assert (=> b!971779 (= lt!431867 (getCurrentListMap!3732 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35254 () Bool)

(declare-fun mapRes!35254 () Bool)

(assert (=> mapIsEmpty!35254 mapRes!35254))

(declare-fun b!971780 () Bool)

(declare-fun res!650460 () Bool)

(assert (=> b!971780 (=> (not res!650460) (not e!547785))))

(assert (=> b!971780 (= res!650460 (and (= (size!29529 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29530 _keys!1717) (size!29529 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971781 () Bool)

(declare-fun res!650457 () Bool)

(assert (=> b!971781 (=> (not res!650457) (not e!547785))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971781 (= res!650457 (validKeyInArray!0 (select (arr!29051 _keys!1717) i!822)))))

(declare-fun b!971782 () Bool)

(declare-fun e!547789 () Bool)

(declare-fun e!547788 () Bool)

(assert (=> b!971782 (= e!547789 (and e!547788 mapRes!35254))))

(declare-fun condMapEmpty!35254 () Bool)

(declare-fun mapDefault!35254 () ValueCell!10600)

