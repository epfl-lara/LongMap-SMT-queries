; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83424 () Bool)

(assert start!83424)

(declare-fun b_free!19249 () Bool)

(declare-fun b_next!19249 () Bool)

(assert (=> start!83424 (= b_free!19249 (not b_next!19249))))

(declare-fun tp!67027 () Bool)

(declare-fun b_and!30747 () Bool)

(assert (=> start!83424 (= tp!67027 b_and!30747)))

(declare-fun b!972442 () Bool)

(declare-fun e!548251 () Bool)

(declare-fun tp_is_empty!22147 () Bool)

(assert (=> b!972442 (= e!548251 tp_is_empty!22147)))

(declare-fun b!972443 () Bool)

(declare-fun e!548249 () Bool)

(declare-fun e!548250 () Bool)

(declare-fun mapRes!35230 () Bool)

(assert (=> b!972443 (= e!548249 (and e!548250 mapRes!35230))))

(declare-fun condMapEmpty!35230 () Bool)

(declare-datatypes ((V!34513 0))(
  ( (V!34514 (val!11124 Int)) )
))
(declare-datatypes ((ValueCell!10592 0))(
  ( (ValueCellFull!10592 (v!13680 V!34513)) (EmptyCell!10592) )
))
(declare-datatypes ((array!60368 0))(
  ( (array!60369 (arr!29043 (Array (_ BitVec 32) ValueCell!10592)) (size!29523 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60368)

(declare-fun mapDefault!35230 () ValueCell!10592)

(assert (=> b!972443 (= condMapEmpty!35230 (= (arr!29043 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10592)) mapDefault!35230)))))

(declare-fun b!972444 () Bool)

(declare-fun res!650631 () Bool)

(declare-fun e!548247 () Bool)

(assert (=> b!972444 (=> (not res!650631) (not e!548247))))

(declare-datatypes ((array!60370 0))(
  ( (array!60371 (arr!29044 (Array (_ BitVec 32) (_ BitVec 64))) (size!29524 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60370)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972444 (= res!650631 (validKeyInArray!0 (select (arr!29044 _keys!1717) i!822)))))

(declare-fun b!972445 () Bool)

(declare-fun res!650632 () Bool)

(assert (=> b!972445 (=> (not res!650632) (not e!548247))))

(declare-datatypes ((List!20117 0))(
  ( (Nil!20114) (Cons!20113 (h!21281 (_ BitVec 64)) (t!28472 List!20117)) )
))
(declare-fun arrayNoDuplicates!0 (array!60370 (_ BitVec 32) List!20117) Bool)

(assert (=> b!972445 (= res!650632 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20114))))

(declare-fun b!972446 () Bool)

(declare-fun res!650635 () Bool)

(assert (=> b!972446 (=> (not res!650635) (not e!548247))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972446 (= res!650635 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29524 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29524 _keys!1717))))))

(declare-fun b!972447 () Bool)

(declare-fun res!650633 () Bool)

(assert (=> b!972447 (=> (not res!650633) (not e!548247))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!972447 (= res!650633 (and (= (size!29523 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29524 _keys!1717) (size!29523 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972448 () Bool)

(assert (=> b!972448 (= e!548250 tp_is_empty!22147)))

(declare-fun res!650630 () Bool)

(assert (=> start!83424 (=> (not res!650630) (not e!548247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83424 (= res!650630 (validMask!0 mask!2147))))

(assert (=> start!83424 e!548247))

(assert (=> start!83424 true))

(declare-fun array_inv!22523 (array!60368) Bool)

(assert (=> start!83424 (and (array_inv!22523 _values!1425) e!548249)))

(assert (=> start!83424 tp_is_empty!22147))

(assert (=> start!83424 tp!67027))

(declare-fun array_inv!22524 (array!60370) Bool)

(assert (=> start!83424 (array_inv!22524 _keys!1717)))

(declare-fun b!972449 () Bool)

(assert (=> b!972449 (= e!548247 false)))

(declare-fun zeroValue!1367 () V!34513)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34513)

(declare-datatypes ((tuple2!14264 0))(
  ( (tuple2!14265 (_1!7143 (_ BitVec 64)) (_2!7143 V!34513)) )
))
(declare-datatypes ((List!20118 0))(
  ( (Nil!20115) (Cons!20114 (h!21282 tuple2!14264) (t!28473 List!20118)) )
))
(declare-datatypes ((ListLongMap!12963 0))(
  ( (ListLongMap!12964 (toList!6497 List!20118)) )
))
(declare-fun lt!432204 () ListLongMap!12963)

(declare-fun getCurrentListMap!3730 (array!60370 array!60368 (_ BitVec 32) (_ BitVec 32) V!34513 V!34513 (_ BitVec 32) Int) ListLongMap!12963)

(assert (=> b!972449 (= lt!432204 (getCurrentListMap!3730 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35230 () Bool)

(declare-fun tp!67026 () Bool)

(assert (=> mapNonEmpty!35230 (= mapRes!35230 (and tp!67026 e!548251))))

(declare-fun mapRest!35230 () (Array (_ BitVec 32) ValueCell!10592))

(declare-fun mapKey!35230 () (_ BitVec 32))

(declare-fun mapValue!35230 () ValueCell!10592)

(assert (=> mapNonEmpty!35230 (= (arr!29043 _values!1425) (store mapRest!35230 mapKey!35230 mapValue!35230))))

(declare-fun b!972450 () Bool)

(declare-fun res!650636 () Bool)

(assert (=> b!972450 (=> (not res!650636) (not e!548247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60370 (_ BitVec 32)) Bool)

(assert (=> b!972450 (= res!650636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35230 () Bool)

(assert (=> mapIsEmpty!35230 mapRes!35230))

(declare-fun b!972451 () Bool)

(declare-fun res!650634 () Bool)

(assert (=> b!972451 (=> (not res!650634) (not e!548247))))

(declare-fun contains!5611 (ListLongMap!12963 (_ BitVec 64)) Bool)

(assert (=> b!972451 (= res!650634 (contains!5611 (getCurrentListMap!3730 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29044 _keys!1717) i!822)))))

(assert (= (and start!83424 res!650630) b!972447))

(assert (= (and b!972447 res!650633) b!972450))

(assert (= (and b!972450 res!650636) b!972445))

(assert (= (and b!972445 res!650632) b!972446))

(assert (= (and b!972446 res!650635) b!972444))

(assert (= (and b!972444 res!650631) b!972451))

(assert (= (and b!972451 res!650634) b!972449))

(assert (= (and b!972443 condMapEmpty!35230) mapIsEmpty!35230))

(assert (= (and b!972443 (not condMapEmpty!35230)) mapNonEmpty!35230))

(get-info :version)

(assert (= (and mapNonEmpty!35230 ((_ is ValueCellFull!10592) mapValue!35230)) b!972442))

(assert (= (and b!972443 ((_ is ValueCellFull!10592) mapDefault!35230)) b!972448))

(assert (= start!83424 b!972443))

(declare-fun m!900263 () Bool)

(assert (=> b!972450 m!900263))

(declare-fun m!900265 () Bool)

(assert (=> mapNonEmpty!35230 m!900265))

(declare-fun m!900267 () Bool)

(assert (=> b!972445 m!900267))

(declare-fun m!900269 () Bool)

(assert (=> b!972451 m!900269))

(declare-fun m!900271 () Bool)

(assert (=> b!972451 m!900271))

(assert (=> b!972451 m!900269))

(assert (=> b!972451 m!900271))

(declare-fun m!900273 () Bool)

(assert (=> b!972451 m!900273))

(assert (=> b!972444 m!900271))

(assert (=> b!972444 m!900271))

(declare-fun m!900275 () Bool)

(assert (=> b!972444 m!900275))

(declare-fun m!900277 () Bool)

(assert (=> start!83424 m!900277))

(declare-fun m!900279 () Bool)

(assert (=> start!83424 m!900279))

(declare-fun m!900281 () Bool)

(assert (=> start!83424 m!900281))

(declare-fun m!900283 () Bool)

(assert (=> b!972449 m!900283))

(check-sat (not b!972451) (not mapNonEmpty!35230) (not start!83424) (not b!972450) (not b_next!19249) (not b!972445) (not b!972444) b_and!30747 (not b!972449) tp_is_empty!22147)
(check-sat b_and!30747 (not b_next!19249))
