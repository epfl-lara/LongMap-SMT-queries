; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83598 () Bool)

(assert start!83598)

(declare-fun b_free!19423 () Bool)

(declare-fun b_next!19423 () Bool)

(assert (=> start!83598 (= b_free!19423 (not b_next!19423))))

(declare-fun tp!67548 () Bool)

(declare-fun b_and!31035 () Bool)

(assert (=> start!83598 (= tp!67548 b_and!31035)))

(declare-fun b!975337 () Bool)

(declare-fun e!549808 () Bool)

(assert (=> b!975337 (= e!549808 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34745 0))(
  ( (V!34746 (val!11211 Int)) )
))
(declare-datatypes ((ValueCell!10679 0))(
  ( (ValueCellFull!10679 (v!13767 V!34745)) (EmptyCell!10679) )
))
(declare-datatypes ((array!60712 0))(
  ( (array!60713 (arr!29215 (Array (_ BitVec 32) ValueCell!10679)) (size!29695 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60712)

(declare-datatypes ((tuple2!14418 0))(
  ( (tuple2!14419 (_1!7220 (_ BitVec 64)) (_2!7220 V!34745)) )
))
(declare-datatypes ((List!20262 0))(
  ( (Nil!20259) (Cons!20258 (h!21426 tuple2!14418) (t!28731 List!20262)) )
))
(declare-datatypes ((ListLongMap!13117 0))(
  ( (ListLongMap!13118 (toList!6574 List!20262)) )
))
(declare-fun lt!433131 () ListLongMap!13117)

(declare-fun zeroValue!1367 () V!34745)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34745)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60714 0))(
  ( (array!60715 (arr!29216 (Array (_ BitVec 32) (_ BitVec 64))) (size!29696 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60714)

(declare-fun getCurrentListMap!3807 (array!60714 array!60712 (_ BitVec 32) (_ BitVec 32) V!34745 V!34745 (_ BitVec 32) Int) ListLongMap!13117)

(assert (=> b!975337 (= lt!433131 (getCurrentListMap!3807 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975338 () Bool)

(declare-fun e!549805 () Bool)

(declare-fun e!549806 () Bool)

(declare-fun mapRes!35491 () Bool)

(assert (=> b!975338 (= e!549805 (and e!549806 mapRes!35491))))

(declare-fun condMapEmpty!35491 () Bool)

(declare-fun mapDefault!35491 () ValueCell!10679)

(assert (=> b!975338 (= condMapEmpty!35491 (= (arr!29215 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10679)) mapDefault!35491)))))

(declare-fun res!652628 () Bool)

(assert (=> start!83598 (=> (not res!652628) (not e!549808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83598 (= res!652628 (validMask!0 mask!2147))))

(assert (=> start!83598 e!549808))

(assert (=> start!83598 true))

(declare-fun array_inv!22645 (array!60712) Bool)

(assert (=> start!83598 (and (array_inv!22645 _values!1425) e!549805)))

(declare-fun tp_is_empty!22321 () Bool)

(assert (=> start!83598 tp_is_empty!22321))

(assert (=> start!83598 tp!67548))

(declare-fun array_inv!22646 (array!60714) Bool)

(assert (=> start!83598 (array_inv!22646 _keys!1717)))

(declare-fun mapNonEmpty!35491 () Bool)

(declare-fun tp!67549 () Bool)

(declare-fun e!549804 () Bool)

(assert (=> mapNonEmpty!35491 (= mapRes!35491 (and tp!67549 e!549804))))

(declare-fun mapValue!35491 () ValueCell!10679)

(declare-fun mapKey!35491 () (_ BitVec 32))

(declare-fun mapRest!35491 () (Array (_ BitVec 32) ValueCell!10679))

(assert (=> mapNonEmpty!35491 (= (arr!29215 _values!1425) (store mapRest!35491 mapKey!35491 mapValue!35491))))

(declare-fun b!975339 () Bool)

(declare-fun res!652629 () Bool)

(assert (=> b!975339 (=> (not res!652629) (not e!549808))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975339 (= res!652629 (validKeyInArray!0 (select (arr!29216 _keys!1717) i!822)))))

(declare-fun b!975340 () Bool)

(declare-fun res!652632 () Bool)

(assert (=> b!975340 (=> (not res!652632) (not e!549808))))

(declare-fun contains!5679 (ListLongMap!13117 (_ BitVec 64)) Bool)

(assert (=> b!975340 (= res!652632 (contains!5679 (getCurrentListMap!3807 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29216 _keys!1717) i!822)))))

(declare-fun b!975341 () Bool)

(declare-fun res!652630 () Bool)

(assert (=> b!975341 (=> (not res!652630) (not e!549808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60714 (_ BitVec 32)) Bool)

(assert (=> b!975341 (= res!652630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975342 () Bool)

(declare-fun res!652634 () Bool)

(assert (=> b!975342 (=> (not res!652634) (not e!549808))))

(assert (=> b!975342 (= res!652634 (and (= (size!29695 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29696 _keys!1717) (size!29695 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975343 () Bool)

(declare-fun res!652631 () Bool)

(assert (=> b!975343 (=> (not res!652631) (not e!549808))))

(declare-datatypes ((List!20263 0))(
  ( (Nil!20260) (Cons!20259 (h!21427 (_ BitVec 64)) (t!28732 List!20263)) )
))
(declare-fun arrayNoDuplicates!0 (array!60714 (_ BitVec 32) List!20263) Bool)

(assert (=> b!975343 (= res!652631 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20260))))

(declare-fun mapIsEmpty!35491 () Bool)

(assert (=> mapIsEmpty!35491 mapRes!35491))

(declare-fun b!975344 () Bool)

(assert (=> b!975344 (= e!549804 tp_is_empty!22321)))

(declare-fun b!975345 () Bool)

(assert (=> b!975345 (= e!549806 tp_is_empty!22321)))

(declare-fun b!975346 () Bool)

(declare-fun res!652633 () Bool)

(assert (=> b!975346 (=> (not res!652633) (not e!549808))))

(assert (=> b!975346 (= res!652633 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29696 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29696 _keys!1717))))))

(assert (= (and start!83598 res!652628) b!975342))

(assert (= (and b!975342 res!652634) b!975341))

(assert (= (and b!975341 res!652630) b!975343))

(assert (= (and b!975343 res!652631) b!975346))

(assert (= (and b!975346 res!652633) b!975339))

(assert (= (and b!975339 res!652629) b!975340))

(assert (= (and b!975340 res!652632) b!975337))

(assert (= (and b!975338 condMapEmpty!35491) mapIsEmpty!35491))

(assert (= (and b!975338 (not condMapEmpty!35491)) mapNonEmpty!35491))

(get-info :version)

(assert (= (and mapNonEmpty!35491 ((_ is ValueCellFull!10679) mapValue!35491)) b!975344))

(assert (= (and b!975338 ((_ is ValueCellFull!10679) mapDefault!35491)) b!975345))

(assert (= start!83598 b!975338))

(declare-fun m!903251 () Bool)

(assert (=> b!975339 m!903251))

(assert (=> b!975339 m!903251))

(declare-fun m!903253 () Bool)

(assert (=> b!975339 m!903253))

(declare-fun m!903255 () Bool)

(assert (=> b!975340 m!903255))

(assert (=> b!975340 m!903251))

(assert (=> b!975340 m!903255))

(assert (=> b!975340 m!903251))

(declare-fun m!903257 () Bool)

(assert (=> b!975340 m!903257))

(declare-fun m!903259 () Bool)

(assert (=> b!975337 m!903259))

(declare-fun m!903261 () Bool)

(assert (=> b!975343 m!903261))

(declare-fun m!903263 () Bool)

(assert (=> b!975341 m!903263))

(declare-fun m!903265 () Bool)

(assert (=> mapNonEmpty!35491 m!903265))

(declare-fun m!903267 () Bool)

(assert (=> start!83598 m!903267))

(declare-fun m!903269 () Bool)

(assert (=> start!83598 m!903269))

(declare-fun m!903271 () Bool)

(assert (=> start!83598 m!903271))

(check-sat (not b!975341) b_and!31035 (not b!975337) (not mapNonEmpty!35491) (not b!975339) tp_is_empty!22321 (not b!975343) (not start!83598) (not b!975340) (not b_next!19423))
(check-sat b_and!31035 (not b_next!19423))
