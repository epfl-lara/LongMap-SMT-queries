; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82218 () Bool)

(assert start!82218)

(declare-fun b_free!18491 () Bool)

(declare-fun b_next!18491 () Bool)

(assert (=> start!82218 (= b_free!18491 (not b_next!18491))))

(declare-fun tp!64433 () Bool)

(declare-fun b_and!29979 () Bool)

(assert (=> start!82218 (= tp!64433 b_and!29979)))

(declare-fun mapNonEmpty!33775 () Bool)

(declare-fun mapRes!33775 () Bool)

(declare-fun tp!64434 () Bool)

(declare-fun e!540251 () Bool)

(assert (=> mapNonEmpty!33775 (= mapRes!33775 (and tp!64434 e!540251))))

(declare-datatypes ((V!33245 0))(
  ( (V!33246 (val!10649 Int)) )
))
(declare-datatypes ((ValueCell!10117 0))(
  ( (ValueCellFull!10117 (v!13206 V!33245)) (EmptyCell!10117) )
))
(declare-fun mapRest!33775 () (Array (_ BitVec 32) ValueCell!10117))

(declare-fun mapValue!33775 () ValueCell!10117)

(declare-fun mapKey!33775 () (_ BitVec 32))

(declare-datatypes ((array!58495 0))(
  ( (array!58496 (arr!28121 (Array (_ BitVec 32) ValueCell!10117)) (size!28600 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58495)

(assert (=> mapNonEmpty!33775 (= (arr!28121 _values!1386) (store mapRest!33775 mapKey!33775 mapValue!33775))))

(declare-fun b!958307 () Bool)

(declare-fun res!641460 () Bool)

(declare-fun e!540252 () Bool)

(assert (=> b!958307 (=> (not res!641460) (not e!540252))))

(declare-datatypes ((array!58497 0))(
  ( (array!58498 (arr!28122 (Array (_ BitVec 32) (_ BitVec 64))) (size!28601 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58497)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958307 (= res!641460 (validKeyInArray!0 (select (arr!28122 _keys!1668) i!793)))))

(declare-fun b!958308 () Bool)

(declare-fun res!641459 () Bool)

(assert (=> b!958308 (=> (not res!641459) (not e!540252))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958308 (= res!641459 (and (= (size!28600 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28601 _keys!1668) (size!28600 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958309 () Bool)

(assert (=> b!958309 (= e!540252 false)))

(declare-fun minValue!1328 () V!33245)

(declare-fun zeroValue!1328 () V!33245)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lt!430428 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-datatypes ((tuple2!13728 0))(
  ( (tuple2!13729 (_1!6875 (_ BitVec 64)) (_2!6875 V!33245)) )
))
(declare-datatypes ((List!19549 0))(
  ( (Nil!19546) (Cons!19545 (h!20707 tuple2!13728) (t!27912 List!19549)) )
))
(declare-datatypes ((ListLongMap!12425 0))(
  ( (ListLongMap!12426 (toList!6228 List!19549)) )
))
(declare-fun contains!5329 (ListLongMap!12425 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3461 (array!58497 array!58495 (_ BitVec 32) (_ BitVec 32) V!33245 V!33245 (_ BitVec 32) Int) ListLongMap!12425)

(assert (=> b!958309 (= lt!430428 (contains!5329 (getCurrentListMap!3461 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28122 _keys!1668) i!793)))))

(declare-fun b!958310 () Bool)

(declare-fun res!641457 () Bool)

(assert (=> b!958310 (=> (not res!641457) (not e!540252))))

(declare-datatypes ((List!19550 0))(
  ( (Nil!19547) (Cons!19546 (h!20708 (_ BitVec 64)) (t!27913 List!19550)) )
))
(declare-fun arrayNoDuplicates!0 (array!58497 (_ BitVec 32) List!19550) Bool)

(assert (=> b!958310 (= res!641457 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19547))))

(declare-fun res!641458 () Bool)

(assert (=> start!82218 (=> (not res!641458) (not e!540252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82218 (= res!641458 (validMask!0 mask!2088))))

(assert (=> start!82218 e!540252))

(assert (=> start!82218 true))

(declare-fun tp_is_empty!21197 () Bool)

(assert (=> start!82218 tp_is_empty!21197))

(declare-fun array_inv!21813 (array!58497) Bool)

(assert (=> start!82218 (array_inv!21813 _keys!1668)))

(declare-fun e!540253 () Bool)

(declare-fun array_inv!21814 (array!58495) Bool)

(assert (=> start!82218 (and (array_inv!21814 _values!1386) e!540253)))

(assert (=> start!82218 tp!64433))

(declare-fun b!958311 () Bool)

(declare-fun res!641462 () Bool)

(assert (=> b!958311 (=> (not res!641462) (not e!540252))))

(assert (=> b!958311 (= res!641462 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28601 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28601 _keys!1668))))))

(declare-fun b!958312 () Bool)

(declare-fun e!540254 () Bool)

(assert (=> b!958312 (= e!540253 (and e!540254 mapRes!33775))))

(declare-fun condMapEmpty!33775 () Bool)

(declare-fun mapDefault!33775 () ValueCell!10117)

