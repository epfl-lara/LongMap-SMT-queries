; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83406 () Bool)

(assert start!83406)

(declare-fun b_free!19417 () Bool)

(declare-fun b_next!19417 () Bool)

(assert (=> start!83406 (= b_free!19417 (not b_next!19417))))

(declare-fun tp!67531 () Bool)

(declare-fun b_and!30993 () Bool)

(assert (=> start!83406 (= tp!67531 b_and!30993)))

(declare-fun res!652111 () Bool)

(declare-fun e!549033 () Bool)

(assert (=> start!83406 (=> (not res!652111) (not e!549033))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83406 (= res!652111 (validMask!0 mask!2147))))

(assert (=> start!83406 e!549033))

(assert (=> start!83406 true))

(declare-datatypes ((V!34737 0))(
  ( (V!34738 (val!11208 Int)) )
))
(declare-datatypes ((ValueCell!10676 0))(
  ( (ValueCellFull!10676 (v!13766 V!34737)) (EmptyCell!10676) )
))
(declare-datatypes ((array!60596 0))(
  ( (array!60597 (arr!29162 (Array (_ BitVec 32) ValueCell!10676)) (size!29643 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60596)

(declare-fun e!549032 () Bool)

(declare-fun array_inv!22609 (array!60596) Bool)

(assert (=> start!83406 (and (array_inv!22609 _values!1425) e!549032)))

(declare-fun tp_is_empty!22315 () Bool)

(assert (=> start!83406 tp_is_empty!22315))

(assert (=> start!83406 tp!67531))

(declare-datatypes ((array!60598 0))(
  ( (array!60599 (arr!29163 (Array (_ BitVec 32) (_ BitVec 64))) (size!29644 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60598)

(declare-fun array_inv!22610 (array!60598) Bool)

(assert (=> start!83406 (array_inv!22610 _keys!1717)))

(declare-fun mapNonEmpty!35482 () Bool)

(declare-fun mapRes!35482 () Bool)

(declare-fun tp!67530 () Bool)

(declare-fun e!549031 () Bool)

(assert (=> mapNonEmpty!35482 (= mapRes!35482 (and tp!67530 e!549031))))

(declare-fun mapKey!35482 () (_ BitVec 32))

(declare-fun mapRest!35482 () (Array (_ BitVec 32) ValueCell!10676))

(declare-fun mapValue!35482 () ValueCell!10676)

(assert (=> mapNonEmpty!35482 (= (arr!29162 _values!1425) (store mapRest!35482 mapKey!35482 mapValue!35482))))

(declare-fun b!974105 () Bool)

(declare-fun res!652114 () Bool)

(assert (=> b!974105 (=> (not res!652114) (not e!549033))))

(declare-datatypes ((List!20278 0))(
  ( (Nil!20275) (Cons!20274 (h!21436 (_ BitVec 64)) (t!28746 List!20278)) )
))
(declare-fun arrayNoDuplicates!0 (array!60598 (_ BitVec 32) List!20278) Bool)

(assert (=> b!974105 (= res!652114 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20275))))

(declare-fun b!974106 () Bool)

(declare-fun res!652117 () Bool)

(assert (=> b!974106 (=> (not res!652117) (not e!549033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60598 (_ BitVec 32)) Bool)

(assert (=> b!974106 (= res!652117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974107 () Bool)

(declare-fun res!652115 () Bool)

(assert (=> b!974107 (=> (not res!652115) (not e!549033))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974107 (= res!652115 (and (= (size!29643 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29644 _keys!1717) (size!29643 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974108 () Bool)

(declare-fun res!652116 () Bool)

(assert (=> b!974108 (=> (not res!652116) (not e!549033))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974108 (= res!652116 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29644 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29644 _keys!1717))))))

(declare-fun b!974109 () Bool)

(assert (=> b!974109 (= e!549033 false)))

(declare-datatypes ((tuple2!14474 0))(
  ( (tuple2!14475 (_1!7248 (_ BitVec 64)) (_2!7248 V!34737)) )
))
(declare-datatypes ((List!20279 0))(
  ( (Nil!20276) (Cons!20275 (h!21437 tuple2!14474) (t!28747 List!20279)) )
))
(declare-datatypes ((ListLongMap!13161 0))(
  ( (ListLongMap!13162 (toList!6596 List!20279)) )
))
(declare-fun lt!432525 () ListLongMap!13161)

(declare-fun zeroValue!1367 () V!34737)

(declare-fun minValue!1367 () V!34737)

(declare-fun defaultEntry!1428 () Int)

(declare-fun getCurrentListMap!3758 (array!60598 array!60596 (_ BitVec 32) (_ BitVec 32) V!34737 V!34737 (_ BitVec 32) Int) ListLongMap!13161)

(assert (=> b!974109 (= lt!432525 (getCurrentListMap!3758 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974110 () Bool)

(declare-fun res!652112 () Bool)

(assert (=> b!974110 (=> (not res!652112) (not e!549033))))

(declare-fun contains!5634 (ListLongMap!13161 (_ BitVec 64)) Bool)

(assert (=> b!974110 (= res!652112 (contains!5634 (getCurrentListMap!3758 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29163 _keys!1717) i!822)))))

(declare-fun b!974111 () Bool)

(declare-fun e!549030 () Bool)

(assert (=> b!974111 (= e!549032 (and e!549030 mapRes!35482))))

(declare-fun condMapEmpty!35482 () Bool)

(declare-fun mapDefault!35482 () ValueCell!10676)

(assert (=> b!974111 (= condMapEmpty!35482 (= (arr!29162 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10676)) mapDefault!35482)))))

(declare-fun mapIsEmpty!35482 () Bool)

(assert (=> mapIsEmpty!35482 mapRes!35482))

(declare-fun b!974112 () Bool)

(declare-fun res!652113 () Bool)

(assert (=> b!974112 (=> (not res!652113) (not e!549033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974112 (= res!652113 (validKeyInArray!0 (select (arr!29163 _keys!1717) i!822)))))

(declare-fun b!974113 () Bool)

(assert (=> b!974113 (= e!549031 tp_is_empty!22315)))

(declare-fun b!974114 () Bool)

(assert (=> b!974114 (= e!549030 tp_is_empty!22315)))

(assert (= (and start!83406 res!652111) b!974107))

(assert (= (and b!974107 res!652115) b!974106))

(assert (= (and b!974106 res!652117) b!974105))

(assert (= (and b!974105 res!652114) b!974108))

(assert (= (and b!974108 res!652116) b!974112))

(assert (= (and b!974112 res!652113) b!974110))

(assert (= (and b!974110 res!652112) b!974109))

(assert (= (and b!974111 condMapEmpty!35482) mapIsEmpty!35482))

(assert (= (and b!974111 (not condMapEmpty!35482)) mapNonEmpty!35482))

(get-info :version)

(assert (= (and mapNonEmpty!35482 ((_ is ValueCellFull!10676) mapValue!35482)) b!974113))

(assert (= (and b!974111 ((_ is ValueCellFull!10676) mapDefault!35482)) b!974114))

(assert (= start!83406 b!974111))

(declare-fun m!901133 () Bool)

(assert (=> b!974112 m!901133))

(assert (=> b!974112 m!901133))

(declare-fun m!901135 () Bool)

(assert (=> b!974112 m!901135))

(declare-fun m!901137 () Bool)

(assert (=> b!974110 m!901137))

(assert (=> b!974110 m!901133))

(assert (=> b!974110 m!901137))

(assert (=> b!974110 m!901133))

(declare-fun m!901139 () Bool)

(assert (=> b!974110 m!901139))

(declare-fun m!901141 () Bool)

(assert (=> b!974105 m!901141))

(declare-fun m!901143 () Bool)

(assert (=> b!974106 m!901143))

(declare-fun m!901145 () Bool)

(assert (=> b!974109 m!901145))

(declare-fun m!901147 () Bool)

(assert (=> start!83406 m!901147))

(declare-fun m!901149 () Bool)

(assert (=> start!83406 m!901149))

(declare-fun m!901151 () Bool)

(assert (=> start!83406 m!901151))

(declare-fun m!901153 () Bool)

(assert (=> mapNonEmpty!35482 m!901153))

(check-sat (not b!974110) (not b!974109) (not b!974105) tp_is_empty!22315 b_and!30993 (not mapNonEmpty!35482) (not b_next!19417) (not start!83406) (not b!974106) (not b!974112))
(check-sat b_and!30993 (not b_next!19417))
