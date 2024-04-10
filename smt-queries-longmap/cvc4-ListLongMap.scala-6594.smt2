; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83452 () Bool)

(assert start!83452)

(declare-fun b_free!19439 () Bool)

(declare-fun b_next!19439 () Bool)

(assert (=> start!83452 (= b_free!19439 (not b_next!19439))))

(declare-fun tp!67605 () Bool)

(declare-fun b_and!31041 () Bool)

(assert (=> start!83452 (= tp!67605 b_and!31041)))

(declare-fun b!974738 () Bool)

(declare-fun e!549399 () Bool)

(declare-fun tp_is_empty!22343 () Bool)

(assert (=> b!974738 (= e!549399 tp_is_empty!22343)))

(declare-fun b!974739 () Bool)

(declare-fun res!652489 () Bool)

(declare-fun e!549397 () Bool)

(assert (=> b!974739 (=> (not res!652489) (not e!549397))))

(declare-datatypes ((array!60725 0))(
  ( (array!60726 (arr!29226 (Array (_ BitVec 32) (_ BitVec 64))) (size!29705 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60725)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974739 (= res!652489 (validKeyInArray!0 (select (arr!29226 _keys!1717) i!822)))))

(declare-fun b!974740 () Bool)

(declare-fun res!652491 () Bool)

(assert (=> b!974740 (=> (not res!652491) (not e!549397))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!974740 (= res!652491 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29705 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29705 _keys!1717))))))

(declare-fun mapNonEmpty!35524 () Bool)

(declare-fun mapRes!35524 () Bool)

(declare-fun tp!67604 () Bool)

(assert (=> mapNonEmpty!35524 (= mapRes!35524 (and tp!67604 e!549399))))

(declare-datatypes ((V!34773 0))(
  ( (V!34774 (val!11222 Int)) )
))
(declare-datatypes ((ValueCell!10690 0))(
  ( (ValueCellFull!10690 (v!13781 V!34773)) (EmptyCell!10690) )
))
(declare-datatypes ((array!60727 0))(
  ( (array!60728 (arr!29227 (Array (_ BitVec 32) ValueCell!10690)) (size!29706 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60727)

(declare-fun mapKey!35524 () (_ BitVec 32))

(declare-fun mapValue!35524 () ValueCell!10690)

(declare-fun mapRest!35524 () (Array (_ BitVec 32) ValueCell!10690))

(assert (=> mapNonEmpty!35524 (= (arr!29227 _values!1425) (store mapRest!35524 mapKey!35524 mapValue!35524))))

(declare-fun b!974741 () Bool)

(declare-fun res!652493 () Bool)

(assert (=> b!974741 (=> (not res!652493) (not e!549397))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974741 (= res!652493 (and (= (size!29706 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29705 _keys!1717) (size!29706 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!652494 () Bool)

(assert (=> start!83452 (=> (not res!652494) (not e!549397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83452 (= res!652494 (validMask!0 mask!2147))))

(assert (=> start!83452 e!549397))

(assert (=> start!83452 true))

(declare-fun e!549396 () Bool)

(declare-fun array_inv!22605 (array!60727) Bool)

(assert (=> start!83452 (and (array_inv!22605 _values!1425) e!549396)))

(assert (=> start!83452 tp_is_empty!22343))

(assert (=> start!83452 tp!67605))

(declare-fun array_inv!22606 (array!60725) Bool)

(assert (=> start!83452 (array_inv!22606 _keys!1717)))

(declare-fun b!974742 () Bool)

(assert (=> b!974742 (= e!549397 (bvslt i!822 #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!14424 0))(
  ( (tuple2!14425 (_1!7223 (_ BitVec 64)) (_2!7223 V!34773)) )
))
(declare-datatypes ((List!20279 0))(
  ( (Nil!20276) (Cons!20275 (h!21437 tuple2!14424) (t!28756 List!20279)) )
))
(declare-datatypes ((ListLongMap!13121 0))(
  ( (ListLongMap!13122 (toList!6576 List!20279)) )
))
(declare-fun lt!432794 () ListLongMap!13121)

(declare-fun zeroValue!1367 () V!34773)

(declare-fun minValue!1367 () V!34773)

(declare-fun defaultEntry!1428 () Int)

(declare-fun getCurrentListMap!3809 (array!60725 array!60727 (_ BitVec 32) (_ BitVec 32) V!34773 V!34773 (_ BitVec 32) Int) ListLongMap!13121)

(assert (=> b!974742 (= lt!432794 (getCurrentListMap!3809 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun mapIsEmpty!35524 () Bool)

(assert (=> mapIsEmpty!35524 mapRes!35524))

(declare-fun b!974743 () Bool)

(declare-fun res!652490 () Bool)

(assert (=> b!974743 (=> (not res!652490) (not e!549397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60725 (_ BitVec 32)) Bool)

(assert (=> b!974743 (= res!652490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974744 () Bool)

(declare-fun res!652492 () Bool)

(assert (=> b!974744 (=> (not res!652492) (not e!549397))))

(declare-datatypes ((List!20280 0))(
  ( (Nil!20277) (Cons!20276 (h!21438 (_ BitVec 64)) (t!28757 List!20280)) )
))
(declare-fun arrayNoDuplicates!0 (array!60725 (_ BitVec 32) List!20280) Bool)

(assert (=> b!974744 (= res!652492 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20277))))

(declare-fun b!974745 () Bool)

(declare-fun e!549400 () Bool)

(assert (=> b!974745 (= e!549400 tp_is_empty!22343)))

(declare-fun b!974746 () Bool)

(assert (=> b!974746 (= e!549396 (and e!549400 mapRes!35524))))

(declare-fun condMapEmpty!35524 () Bool)

(declare-fun mapDefault!35524 () ValueCell!10690)

