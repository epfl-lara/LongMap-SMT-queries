; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83430 () Bool)

(assert start!83430)

(declare-fun b_free!19423 () Bool)

(declare-fun b_next!19423 () Bool)

(assert (=> start!83430 (= b_free!19423 (not b_next!19423))))

(declare-fun tp!67548 () Bool)

(declare-fun b_and!31025 () Bool)

(assert (=> start!83430 (= tp!67548 b_and!31025)))

(declare-fun b!974434 () Bool)

(declare-fun res!652288 () Bool)

(declare-fun e!549224 () Bool)

(assert (=> b!974434 (=> (not res!652288) (not e!549224))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34745 0))(
  ( (V!34746 (val!11211 Int)) )
))
(declare-datatypes ((ValueCell!10679 0))(
  ( (ValueCellFull!10679 (v!13770 V!34745)) (EmptyCell!10679) )
))
(declare-datatypes ((array!60683 0))(
  ( (array!60684 (arr!29205 (Array (_ BitVec 32) ValueCell!10679)) (size!29684 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60683)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60685 0))(
  ( (array!60686 (arr!29206 (Array (_ BitVec 32) (_ BitVec 64))) (size!29685 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60685)

(assert (=> b!974434 (= res!652288 (and (= (size!29684 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29685 _keys!1717) (size!29684 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974435 () Bool)

(declare-fun res!652285 () Bool)

(assert (=> b!974435 (=> (not res!652285) (not e!549224))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974435 (= res!652285 (validKeyInArray!0 (select (arr!29206 _keys!1717) i!822)))))

(declare-fun res!652287 () Bool)

(assert (=> start!83430 (=> (not res!652287) (not e!549224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83430 (= res!652287 (validMask!0 mask!2147))))

(assert (=> start!83430 e!549224))

(assert (=> start!83430 true))

(declare-fun e!549222 () Bool)

(declare-fun array_inv!22587 (array!60683) Bool)

(assert (=> start!83430 (and (array_inv!22587 _values!1425) e!549222)))

(declare-fun tp_is_empty!22321 () Bool)

(assert (=> start!83430 tp_is_empty!22321))

(assert (=> start!83430 tp!67548))

(declare-fun array_inv!22588 (array!60685) Bool)

(assert (=> start!83430 (array_inv!22588 _keys!1717)))

(declare-fun b!974436 () Bool)

(declare-fun res!652289 () Bool)

(assert (=> b!974436 (=> (not res!652289) (not e!549224))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!974436 (= res!652289 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29685 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29685 _keys!1717))))))

(declare-fun b!974437 () Bool)

(declare-fun res!652284 () Bool)

(assert (=> b!974437 (=> (not res!652284) (not e!549224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60685 (_ BitVec 32)) Bool)

(assert (=> b!974437 (= res!652284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974438 () Bool)

(assert (=> b!974438 (= e!549224 false)))

(declare-datatypes ((tuple2!14412 0))(
  ( (tuple2!14413 (_1!7217 (_ BitVec 64)) (_2!7217 V!34745)) )
))
(declare-datatypes ((List!20265 0))(
  ( (Nil!20262) (Cons!20261 (h!21423 tuple2!14412) (t!28742 List!20265)) )
))
(declare-datatypes ((ListLongMap!13109 0))(
  ( (ListLongMap!13110 (toList!6570 List!20265)) )
))
(declare-fun lt!432770 () ListLongMap!13109)

(declare-fun zeroValue!1367 () V!34745)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34745)

(declare-fun getCurrentListMap!3803 (array!60685 array!60683 (_ BitVec 32) (_ BitVec 32) V!34745 V!34745 (_ BitVec 32) Int) ListLongMap!13109)

(assert (=> b!974438 (= lt!432770 (getCurrentListMap!3803 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974439 () Bool)

(declare-fun e!549226 () Bool)

(assert (=> b!974439 (= e!549226 tp_is_empty!22321)))

(declare-fun mapIsEmpty!35491 () Bool)

(declare-fun mapRes!35491 () Bool)

(assert (=> mapIsEmpty!35491 mapRes!35491))

(declare-fun b!974440 () Bool)

(declare-fun e!549225 () Bool)

(assert (=> b!974440 (= e!549225 tp_is_empty!22321)))

(declare-fun mapNonEmpty!35491 () Bool)

(declare-fun tp!67547 () Bool)

(assert (=> mapNonEmpty!35491 (= mapRes!35491 (and tp!67547 e!549226))))

(declare-fun mapValue!35491 () ValueCell!10679)

(declare-fun mapRest!35491 () (Array (_ BitVec 32) ValueCell!10679))

(declare-fun mapKey!35491 () (_ BitVec 32))

(assert (=> mapNonEmpty!35491 (= (arr!29205 _values!1425) (store mapRest!35491 mapKey!35491 mapValue!35491))))

(declare-fun b!974441 () Bool)

(assert (=> b!974441 (= e!549222 (and e!549225 mapRes!35491))))

(declare-fun condMapEmpty!35491 () Bool)

(declare-fun mapDefault!35491 () ValueCell!10679)

