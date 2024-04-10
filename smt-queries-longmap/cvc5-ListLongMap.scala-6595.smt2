; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83454 () Bool)

(assert start!83454)

(declare-fun b_free!19441 () Bool)

(declare-fun b_next!19441 () Bool)

(assert (=> start!83454 (= b_free!19441 (not b_next!19441))))

(declare-fun tp!67610 () Bool)

(declare-fun b_and!31043 () Bool)

(assert (=> start!83454 (= tp!67610 b_and!31043)))

(declare-fun b!974767 () Bool)

(declare-fun e!549412 () Bool)

(declare-fun tp_is_empty!22345 () Bool)

(assert (=> b!974767 (= e!549412 tp_is_empty!22345)))

(declare-fun b!974768 () Bool)

(declare-fun res!652511 () Bool)

(declare-fun e!549413 () Bool)

(assert (=> b!974768 (=> (not res!652511) (not e!549413))))

(declare-datatypes ((array!60729 0))(
  ( (array!60730 (arr!29228 (Array (_ BitVec 32) (_ BitVec 64))) (size!29707 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60729)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!974768 (= res!652511 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29707 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29707 _keys!1717))))))

(declare-fun b!974769 () Bool)

(assert (=> b!974769 (= e!549413 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29707 _keys!1717)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34777 0))(
  ( (V!34778 (val!11223 Int)) )
))
(declare-datatypes ((ValueCell!10691 0))(
  ( (ValueCellFull!10691 (v!13782 V!34777)) (EmptyCell!10691) )
))
(declare-datatypes ((array!60731 0))(
  ( (array!60732 (arr!29229 (Array (_ BitVec 32) ValueCell!10691)) (size!29708 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60731)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34777)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14426 0))(
  ( (tuple2!14427 (_1!7224 (_ BitVec 64)) (_2!7224 V!34777)) )
))
(declare-datatypes ((List!20281 0))(
  ( (Nil!20278) (Cons!20277 (h!21439 tuple2!14426) (t!28758 List!20281)) )
))
(declare-datatypes ((ListLongMap!13123 0))(
  ( (ListLongMap!13124 (toList!6577 List!20281)) )
))
(declare-fun lt!432797 () ListLongMap!13123)

(declare-fun zeroValue!1367 () V!34777)

(declare-fun getCurrentListMap!3810 (array!60729 array!60731 (_ BitVec 32) (_ BitVec 32) V!34777 V!34777 (_ BitVec 32) Int) ListLongMap!13123)

(assert (=> b!974769 (= lt!432797 (getCurrentListMap!3810 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35527 () Bool)

(declare-fun mapRes!35527 () Bool)

(declare-fun tp!67611 () Bool)

(assert (=> mapNonEmpty!35527 (= mapRes!35527 (and tp!67611 e!549412))))

(declare-fun mapRest!35527 () (Array (_ BitVec 32) ValueCell!10691))

(declare-fun mapKey!35527 () (_ BitVec 32))

(declare-fun mapValue!35527 () ValueCell!10691)

(assert (=> mapNonEmpty!35527 (= (arr!29229 _values!1425) (store mapRest!35527 mapKey!35527 mapValue!35527))))

(declare-fun res!652513 () Bool)

(assert (=> start!83454 (=> (not res!652513) (not e!549413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83454 (= res!652513 (validMask!0 mask!2147))))

(assert (=> start!83454 e!549413))

(assert (=> start!83454 true))

(declare-fun e!549414 () Bool)

(declare-fun array_inv!22607 (array!60731) Bool)

(assert (=> start!83454 (and (array_inv!22607 _values!1425) e!549414)))

(assert (=> start!83454 tp_is_empty!22345))

(assert (=> start!83454 tp!67610))

(declare-fun array_inv!22608 (array!60729) Bool)

(assert (=> start!83454 (array_inv!22608 _keys!1717)))

(declare-fun b!974770 () Bool)

(declare-fun res!652514 () Bool)

(assert (=> b!974770 (=> (not res!652514) (not e!549413))))

(declare-fun contains!5661 (ListLongMap!13123 (_ BitVec 64)) Bool)

(assert (=> b!974770 (= res!652514 (contains!5661 (getCurrentListMap!3810 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29228 _keys!1717) i!822)))))

(declare-fun b!974771 () Bool)

(declare-fun e!549415 () Bool)

(assert (=> b!974771 (= e!549415 tp_is_empty!22345)))

(declare-fun b!974772 () Bool)

(declare-fun res!652515 () Bool)

(assert (=> b!974772 (=> (not res!652515) (not e!549413))))

(assert (=> b!974772 (= res!652515 (and (= (size!29708 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29707 _keys!1717) (size!29708 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974773 () Bool)

(assert (=> b!974773 (= e!549414 (and e!549415 mapRes!35527))))

(declare-fun condMapEmpty!35527 () Bool)

(declare-fun mapDefault!35527 () ValueCell!10691)

