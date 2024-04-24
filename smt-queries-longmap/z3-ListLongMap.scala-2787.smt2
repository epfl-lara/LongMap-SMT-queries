; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40596 () Bool)

(assert start!40596)

(declare-fun b_free!10621 () Bool)

(declare-fun b_next!10621 () Bool)

(assert (=> start!40596 (= b_free!10621 (not b_next!10621))))

(declare-fun tp!37683 () Bool)

(declare-fun b_and!18643 () Bool)

(assert (=> start!40596 (= tp!37683 b_and!18643)))

(declare-fun b!448093 () Bool)

(declare-fun res!266302 () Bool)

(declare-fun e!262979 () Bool)

(assert (=> b!448093 (=> (not res!266302) (not e!262979))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17051 0))(
  ( (V!17052 (val!6024 Int)) )
))
(declare-datatypes ((ValueCell!5636 0))(
  ( (ValueCellFull!5636 (v!8280 V!17051)) (EmptyCell!5636) )
))
(declare-datatypes ((array!27724 0))(
  ( (array!27725 (arr!13307 (Array (_ BitVec 32) ValueCell!5636)) (size!13659 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27724)

(declare-datatypes ((array!27726 0))(
  ( (array!27727 (arr!13308 (Array (_ BitVec 32) (_ BitVec 64))) (size!13660 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27726)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!448093 (= res!266302 (and (= (size!13659 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13660 _keys!709) (size!13659 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448094 () Bool)

(declare-fun e!262976 () Bool)

(assert (=> b!448094 (= e!262979 e!262976)))

(declare-fun res!266303 () Bool)

(assert (=> b!448094 (=> (not res!266303) (not e!262976))))

(declare-fun lt!204125 () array!27726)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27726 (_ BitVec 32)) Bool)

(assert (=> b!448094 (= res!266303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204125 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448094 (= lt!204125 (array!27727 (store (arr!13308 _keys!709) i!563 k0!794) (size!13660 _keys!709)))))

(declare-fun mapNonEmpty!19572 () Bool)

(declare-fun mapRes!19572 () Bool)

(declare-fun tp!37682 () Bool)

(declare-fun e!262975 () Bool)

(assert (=> mapNonEmpty!19572 (= mapRes!19572 (and tp!37682 e!262975))))

(declare-fun mapRest!19572 () (Array (_ BitVec 32) ValueCell!5636))

(declare-fun mapValue!19572 () ValueCell!5636)

(declare-fun mapKey!19572 () (_ BitVec 32))

(assert (=> mapNonEmpty!19572 (= (arr!13307 _values!549) (store mapRest!19572 mapKey!19572 mapValue!19572))))

(declare-fun b!448095 () Bool)

(declare-fun res!266297 () Bool)

(assert (=> b!448095 (=> (not res!266297) (not e!262979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448095 (= res!266297 (validMask!0 mask!1025))))

(declare-fun b!448096 () Bool)

(declare-fun e!262980 () Bool)

(declare-fun e!262977 () Bool)

(assert (=> b!448096 (= e!262980 (and e!262977 mapRes!19572))))

(declare-fun condMapEmpty!19572 () Bool)

(declare-fun mapDefault!19572 () ValueCell!5636)

(assert (=> b!448096 (= condMapEmpty!19572 (= (arr!13307 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5636)) mapDefault!19572)))))

(declare-fun b!448097 () Bool)

(declare-fun res!266296 () Bool)

(assert (=> b!448097 (=> (not res!266296) (not e!262979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448097 (= res!266296 (validKeyInArray!0 k0!794))))

(declare-fun b!448098 () Bool)

(declare-fun res!266294 () Bool)

(assert (=> b!448098 (=> (not res!266294) (not e!262979))))

(declare-datatypes ((List!7881 0))(
  ( (Nil!7878) (Cons!7877 (h!8733 (_ BitVec 64)) (t!13635 List!7881)) )
))
(declare-fun arrayNoDuplicates!0 (array!27726 (_ BitVec 32) List!7881) Bool)

(assert (=> b!448098 (= res!266294 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7878))))

(declare-fun b!448099 () Bool)

(declare-fun res!266304 () Bool)

(assert (=> b!448099 (=> (not res!266304) (not e!262979))))

(assert (=> b!448099 (= res!266304 (or (= (select (arr!13308 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13308 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448100 () Bool)

(declare-fun res!266300 () Bool)

(assert (=> b!448100 (=> (not res!266300) (not e!262979))))

(assert (=> b!448100 (= res!266300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448101 () Bool)

(declare-fun tp_is_empty!11959 () Bool)

(assert (=> b!448101 (= e!262977 tp_is_empty!11959)))

(declare-fun mapIsEmpty!19572 () Bool)

(assert (=> mapIsEmpty!19572 mapRes!19572))

(declare-fun b!448103 () Bool)

(assert (=> b!448103 (= e!262976 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17051)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17051)

(declare-datatypes ((tuple2!7810 0))(
  ( (tuple2!7811 (_1!3916 (_ BitVec 64)) (_2!3916 V!17051)) )
))
(declare-datatypes ((List!7882 0))(
  ( (Nil!7879) (Cons!7878 (h!8734 tuple2!7810) (t!13636 List!7882)) )
))
(declare-datatypes ((ListLongMap!6725 0))(
  ( (ListLongMap!6726 (toList!3378 List!7882)) )
))
(declare-fun lt!204127 () ListLongMap!6725)

(declare-fun v!412 () V!17051)

(declare-fun getCurrentListMapNoExtraKeys!1608 (array!27726 array!27724 (_ BitVec 32) (_ BitVec 32) V!17051 V!17051 (_ BitVec 32) Int) ListLongMap!6725)

(assert (=> b!448103 (= lt!204127 (getCurrentListMapNoExtraKeys!1608 lt!204125 (array!27725 (store (arr!13307 _values!549) i!563 (ValueCellFull!5636 v!412)) (size!13659 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204126 () ListLongMap!6725)

(assert (=> b!448103 (= lt!204126 (getCurrentListMapNoExtraKeys!1608 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448104 () Bool)

(declare-fun res!266293 () Bool)

(assert (=> b!448104 (=> (not res!266293) (not e!262976))))

(assert (=> b!448104 (= res!266293 (bvsle from!863 i!563))))

(declare-fun b!448105 () Bool)

(declare-fun res!266295 () Bool)

(assert (=> b!448105 (=> (not res!266295) (not e!262979))))

(assert (=> b!448105 (= res!266295 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13660 _keys!709))))))

(declare-fun b!448106 () Bool)

(declare-fun res!266298 () Bool)

(assert (=> b!448106 (=> (not res!266298) (not e!262976))))

(assert (=> b!448106 (= res!266298 (arrayNoDuplicates!0 lt!204125 #b00000000000000000000000000000000 Nil!7878))))

(declare-fun b!448107 () Bool)

(assert (=> b!448107 (= e!262975 tp_is_empty!11959)))

(declare-fun res!266301 () Bool)

(assert (=> start!40596 (=> (not res!266301) (not e!262979))))

(assert (=> start!40596 (= res!266301 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13660 _keys!709))))))

(assert (=> start!40596 e!262979))

(assert (=> start!40596 tp_is_empty!11959))

(assert (=> start!40596 tp!37683))

(assert (=> start!40596 true))

(declare-fun array_inv!9722 (array!27724) Bool)

(assert (=> start!40596 (and (array_inv!9722 _values!549) e!262980)))

(declare-fun array_inv!9723 (array!27726) Bool)

(assert (=> start!40596 (array_inv!9723 _keys!709)))

(declare-fun b!448102 () Bool)

(declare-fun res!266299 () Bool)

(assert (=> b!448102 (=> (not res!266299) (not e!262979))))

(declare-fun arrayContainsKey!0 (array!27726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448102 (= res!266299 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40596 res!266301) b!448095))

(assert (= (and b!448095 res!266297) b!448093))

(assert (= (and b!448093 res!266302) b!448100))

(assert (= (and b!448100 res!266300) b!448098))

(assert (= (and b!448098 res!266294) b!448105))

(assert (= (and b!448105 res!266295) b!448097))

(assert (= (and b!448097 res!266296) b!448099))

(assert (= (and b!448099 res!266304) b!448102))

(assert (= (and b!448102 res!266299) b!448094))

(assert (= (and b!448094 res!266303) b!448106))

(assert (= (and b!448106 res!266298) b!448104))

(assert (= (and b!448104 res!266293) b!448103))

(assert (= (and b!448096 condMapEmpty!19572) mapIsEmpty!19572))

(assert (= (and b!448096 (not condMapEmpty!19572)) mapNonEmpty!19572))

(get-info :version)

(assert (= (and mapNonEmpty!19572 ((_ is ValueCellFull!5636) mapValue!19572)) b!448107))

(assert (= (and b!448096 ((_ is ValueCellFull!5636) mapDefault!19572)) b!448101))

(assert (= start!40596 b!448096))

(declare-fun m!433011 () Bool)

(assert (=> b!448094 m!433011))

(declare-fun m!433013 () Bool)

(assert (=> b!448094 m!433013))

(declare-fun m!433015 () Bool)

(assert (=> b!448103 m!433015))

(declare-fun m!433017 () Bool)

(assert (=> b!448103 m!433017))

(declare-fun m!433019 () Bool)

(assert (=> b!448103 m!433019))

(declare-fun m!433021 () Bool)

(assert (=> start!40596 m!433021))

(declare-fun m!433023 () Bool)

(assert (=> start!40596 m!433023))

(declare-fun m!433025 () Bool)

(assert (=> b!448099 m!433025))

(declare-fun m!433027 () Bool)

(assert (=> b!448098 m!433027))

(declare-fun m!433029 () Bool)

(assert (=> b!448100 m!433029))

(declare-fun m!433031 () Bool)

(assert (=> b!448102 m!433031))

(declare-fun m!433033 () Bool)

(assert (=> b!448097 m!433033))

(declare-fun m!433035 () Bool)

(assert (=> b!448095 m!433035))

(declare-fun m!433037 () Bool)

(assert (=> mapNonEmpty!19572 m!433037))

(declare-fun m!433039 () Bool)

(assert (=> b!448106 m!433039))

(check-sat (not b!448094) (not b_next!10621) (not b!448098) (not b!448103) b_and!18643 (not b!448102) (not mapNonEmpty!19572) (not b!448100) (not start!40596) (not b!448106) (not b!448095) (not b!448097) tp_is_empty!11959)
(check-sat b_and!18643 (not b_next!10621))
