; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83408 () Bool)

(assert start!83408)

(declare-fun b_free!19401 () Bool)

(declare-fun b_next!19401 () Bool)

(assert (=> start!83408 (= b_free!19401 (not b_next!19401))))

(declare-fun tp!67481 () Bool)

(declare-fun b_and!31003 () Bool)

(assert (=> start!83408 (= tp!67481 b_and!31003)))

(declare-fun b!974104 () Bool)

(declare-fun e!549058 () Bool)

(declare-fun tp_is_empty!22299 () Bool)

(assert (=> b!974104 (= e!549058 tp_is_empty!22299)))

(declare-fun b!974105 () Bool)

(declare-fun res!652054 () Bool)

(declare-fun e!549057 () Bool)

(assert (=> b!974105 (=> (not res!652054) (not e!549057))))

(declare-datatypes ((array!60639 0))(
  ( (array!60640 (arr!29183 (Array (_ BitVec 32) (_ BitVec 64))) (size!29662 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60639)

(declare-datatypes ((List!20249 0))(
  ( (Nil!20246) (Cons!20245 (h!21407 (_ BitVec 64)) (t!28726 List!20249)) )
))
(declare-fun arrayNoDuplicates!0 (array!60639 (_ BitVec 32) List!20249) Bool)

(assert (=> b!974105 (= res!652054 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20246))))

(declare-fun res!652059 () Bool)

(assert (=> start!83408 (=> (not res!652059) (not e!549057))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83408 (= res!652059 (validMask!0 mask!2147))))

(assert (=> start!83408 e!549057))

(assert (=> start!83408 true))

(declare-datatypes ((V!34715 0))(
  ( (V!34716 (val!11200 Int)) )
))
(declare-datatypes ((ValueCell!10668 0))(
  ( (ValueCellFull!10668 (v!13759 V!34715)) (EmptyCell!10668) )
))
(declare-datatypes ((array!60641 0))(
  ( (array!60642 (arr!29184 (Array (_ BitVec 32) ValueCell!10668)) (size!29663 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60641)

(declare-fun e!549060 () Bool)

(declare-fun array_inv!22571 (array!60641) Bool)

(assert (=> start!83408 (and (array_inv!22571 _values!1425) e!549060)))

(assert (=> start!83408 tp_is_empty!22299))

(assert (=> start!83408 tp!67481))

(declare-fun array_inv!22572 (array!60639) Bool)

(assert (=> start!83408 (array_inv!22572 _keys!1717)))

(declare-fun b!974106 () Bool)

(declare-fun res!652057 () Bool)

(assert (=> b!974106 (=> (not res!652057) (not e!549057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60639 (_ BitVec 32)) Bool)

(assert (=> b!974106 (= res!652057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974107 () Bool)

(declare-fun res!652055 () Bool)

(assert (=> b!974107 (=> (not res!652055) (not e!549057))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974107 (= res!652055 (and (= (size!29663 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29662 _keys!1717) (size!29663 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974108 () Bool)

(declare-fun e!549059 () Bool)

(declare-fun mapRes!35458 () Bool)

(assert (=> b!974108 (= e!549060 (and e!549059 mapRes!35458))))

(declare-fun condMapEmpty!35458 () Bool)

(declare-fun mapDefault!35458 () ValueCell!10668)

(assert (=> b!974108 (= condMapEmpty!35458 (= (arr!29184 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10668)) mapDefault!35458)))))

(declare-fun b!974109 () Bool)

(assert (=> b!974109 (= e!549057 false)))

(declare-datatypes ((tuple2!14392 0))(
  ( (tuple2!14393 (_1!7207 (_ BitVec 64)) (_2!7207 V!34715)) )
))
(declare-datatypes ((List!20250 0))(
  ( (Nil!20247) (Cons!20246 (h!21408 tuple2!14392) (t!28727 List!20250)) )
))
(declare-datatypes ((ListLongMap!13089 0))(
  ( (ListLongMap!13090 (toList!6560 List!20250)) )
))
(declare-fun lt!432737 () ListLongMap!13089)

(declare-fun zeroValue!1367 () V!34715)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34715)

(declare-fun getCurrentListMap!3793 (array!60639 array!60641 (_ BitVec 32) (_ BitVec 32) V!34715 V!34715 (_ BitVec 32) Int) ListLongMap!13089)

(assert (=> b!974109 (= lt!432737 (getCurrentListMap!3793 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974110 () Bool)

(declare-fun res!652058 () Bool)

(assert (=> b!974110 (=> (not res!652058) (not e!549057))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5649 (ListLongMap!13089 (_ BitVec 64)) Bool)

(assert (=> b!974110 (= res!652058 (contains!5649 (getCurrentListMap!3793 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29183 _keys!1717) i!822)))))

(declare-fun b!974111 () Bool)

(declare-fun res!652053 () Bool)

(assert (=> b!974111 (=> (not res!652053) (not e!549057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974111 (= res!652053 (validKeyInArray!0 (select (arr!29183 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35458 () Bool)

(declare-fun tp!67482 () Bool)

(assert (=> mapNonEmpty!35458 (= mapRes!35458 (and tp!67482 e!549058))))

(declare-fun mapKey!35458 () (_ BitVec 32))

(declare-fun mapRest!35458 () (Array (_ BitVec 32) ValueCell!10668))

(declare-fun mapValue!35458 () ValueCell!10668)

(assert (=> mapNonEmpty!35458 (= (arr!29184 _values!1425) (store mapRest!35458 mapKey!35458 mapValue!35458))))

(declare-fun mapIsEmpty!35458 () Bool)

(assert (=> mapIsEmpty!35458 mapRes!35458))

(declare-fun b!974112 () Bool)

(declare-fun res!652056 () Bool)

(assert (=> b!974112 (=> (not res!652056) (not e!549057))))

(assert (=> b!974112 (= res!652056 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29662 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29662 _keys!1717))))))

(declare-fun b!974113 () Bool)

(assert (=> b!974113 (= e!549059 tp_is_empty!22299)))

(assert (= (and start!83408 res!652059) b!974107))

(assert (= (and b!974107 res!652055) b!974106))

(assert (= (and b!974106 res!652057) b!974105))

(assert (= (and b!974105 res!652054) b!974112))

(assert (= (and b!974112 res!652056) b!974111))

(assert (= (and b!974111 res!652053) b!974110))

(assert (= (and b!974110 res!652058) b!974109))

(assert (= (and b!974108 condMapEmpty!35458) mapIsEmpty!35458))

(assert (= (and b!974108 (not condMapEmpty!35458)) mapNonEmpty!35458))

(get-info :version)

(assert (= (and mapNonEmpty!35458 ((_ is ValueCellFull!10668) mapValue!35458)) b!974104))

(assert (= (and b!974108 ((_ is ValueCellFull!10668) mapDefault!35458)) b!974113))

(assert (= start!83408 b!974108))

(declare-fun m!901715 () Bool)

(assert (=> b!974105 m!901715))

(declare-fun m!901717 () Bool)

(assert (=> start!83408 m!901717))

(declare-fun m!901719 () Bool)

(assert (=> start!83408 m!901719))

(declare-fun m!901721 () Bool)

(assert (=> start!83408 m!901721))

(declare-fun m!901723 () Bool)

(assert (=> b!974106 m!901723))

(declare-fun m!901725 () Bool)

(assert (=> b!974109 m!901725))

(declare-fun m!901727 () Bool)

(assert (=> b!974111 m!901727))

(assert (=> b!974111 m!901727))

(declare-fun m!901729 () Bool)

(assert (=> b!974111 m!901729))

(declare-fun m!901731 () Bool)

(assert (=> b!974110 m!901731))

(assert (=> b!974110 m!901727))

(assert (=> b!974110 m!901731))

(assert (=> b!974110 m!901727))

(declare-fun m!901733 () Bool)

(assert (=> b!974110 m!901733))

(declare-fun m!901735 () Bool)

(assert (=> mapNonEmpty!35458 m!901735))

(check-sat (not b!974106) (not mapNonEmpty!35458) (not b!974110) (not b!974105) tp_is_empty!22299 b_and!31003 (not b!974109) (not b_next!19401) (not b!974111) (not start!83408))
(check-sat b_and!31003 (not b_next!19401))
