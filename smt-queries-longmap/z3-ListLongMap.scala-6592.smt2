; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83418 () Bool)

(assert start!83418)

(declare-fun b_free!19429 () Bool)

(declare-fun b_next!19429 () Bool)

(assert (=> start!83418 (= b_free!19429 (not b_next!19429))))

(declare-fun tp!67566 () Bool)

(declare-fun b_and!31005 () Bool)

(assert (=> start!83418 (= tp!67566 b_and!31005)))

(declare-fun b!974287 () Bool)

(declare-fun res!652246 () Bool)

(declare-fun e!549123 () Bool)

(assert (=> b!974287 (=> (not res!652246) (not e!549123))))

(declare-datatypes ((array!60618 0))(
  ( (array!60619 (arr!29173 (Array (_ BitVec 32) (_ BitVec 64))) (size!29654 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60618)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974287 (= res!652246 (validKeyInArray!0 (select (arr!29173 _keys!1717) i!822)))))

(declare-fun b!974288 () Bool)

(declare-fun res!652245 () Bool)

(assert (=> b!974288 (=> (not res!652245) (not e!549123))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!974288 (= res!652245 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29654 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29654 _keys!1717))))))

(declare-fun mapIsEmpty!35500 () Bool)

(declare-fun mapRes!35500 () Bool)

(assert (=> mapIsEmpty!35500 mapRes!35500))

(declare-fun b!974289 () Bool)

(declare-fun e!549121 () Bool)

(declare-fun e!549125 () Bool)

(assert (=> b!974289 (= e!549121 (and e!549125 mapRes!35500))))

(declare-fun condMapEmpty!35500 () Bool)

(declare-datatypes ((V!34753 0))(
  ( (V!34754 (val!11214 Int)) )
))
(declare-datatypes ((ValueCell!10682 0))(
  ( (ValueCellFull!10682 (v!13772 V!34753)) (EmptyCell!10682) )
))
(declare-datatypes ((array!60620 0))(
  ( (array!60621 (arr!29174 (Array (_ BitVec 32) ValueCell!10682)) (size!29655 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60620)

(declare-fun mapDefault!35500 () ValueCell!10682)

(assert (=> b!974289 (= condMapEmpty!35500 (= (arr!29174 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10682)) mapDefault!35500)))))

(declare-fun b!974290 () Bool)

(declare-fun res!652243 () Bool)

(assert (=> b!974290 (=> (not res!652243) (not e!549123))))

(declare-datatypes ((List!20286 0))(
  ( (Nil!20283) (Cons!20282 (h!21444 (_ BitVec 64)) (t!28754 List!20286)) )
))
(declare-fun arrayNoDuplicates!0 (array!60618 (_ BitVec 32) List!20286) Bool)

(assert (=> b!974290 (= res!652243 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20283))))

(declare-fun b!974291 () Bool)

(declare-fun res!652240 () Bool)

(assert (=> b!974291 (=> (not res!652240) (not e!549123))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60618 (_ BitVec 32)) Bool)

(assert (=> b!974291 (= res!652240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974292 () Bool)

(declare-fun res!652242 () Bool)

(assert (=> b!974292 (=> (not res!652242) (not e!549123))))

(declare-fun zeroValue!1367 () V!34753)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34753)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14482 0))(
  ( (tuple2!14483 (_1!7252 (_ BitVec 64)) (_2!7252 V!34753)) )
))
(declare-datatypes ((List!20287 0))(
  ( (Nil!20284) (Cons!20283 (h!21445 tuple2!14482) (t!28755 List!20287)) )
))
(declare-datatypes ((ListLongMap!13169 0))(
  ( (ListLongMap!13170 (toList!6600 List!20287)) )
))
(declare-fun contains!5637 (ListLongMap!13169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3762 (array!60618 array!60620 (_ BitVec 32) (_ BitVec 32) V!34753 V!34753 (_ BitVec 32) Int) ListLongMap!13169)

(assert (=> b!974292 (= res!652242 (contains!5637 (getCurrentListMap!3762 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29173 _keys!1717) i!822)))))

(declare-fun b!974293 () Bool)

(declare-fun e!549124 () Bool)

(declare-fun tp_is_empty!22327 () Bool)

(assert (=> b!974293 (= e!549124 tp_is_empty!22327)))

(declare-fun res!652239 () Bool)

(assert (=> start!83418 (=> (not res!652239) (not e!549123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83418 (= res!652239 (validMask!0 mask!2147))))

(assert (=> start!83418 e!549123))

(assert (=> start!83418 true))

(declare-fun array_inv!22617 (array!60620) Bool)

(assert (=> start!83418 (and (array_inv!22617 _values!1425) e!549121)))

(assert (=> start!83418 tp_is_empty!22327))

(assert (=> start!83418 tp!67566))

(declare-fun array_inv!22618 (array!60618) Bool)

(assert (=> start!83418 (array_inv!22618 _keys!1717)))

(declare-fun mapNonEmpty!35500 () Bool)

(declare-fun tp!67567 () Bool)

(assert (=> mapNonEmpty!35500 (= mapRes!35500 (and tp!67567 e!549124))))

(declare-fun mapValue!35500 () ValueCell!10682)

(declare-fun mapRest!35500 () (Array (_ BitVec 32) ValueCell!10682))

(declare-fun mapKey!35500 () (_ BitVec 32))

(assert (=> mapNonEmpty!35500 (= (arr!29174 _values!1425) (store mapRest!35500 mapKey!35500 mapValue!35500))))

(declare-fun b!974294 () Bool)

(assert (=> b!974294 (= e!549125 tp_is_empty!22327)))

(declare-fun b!974295 () Bool)

(declare-fun e!549126 () Bool)

(assert (=> b!974295 (= e!549123 e!549126)))

(declare-fun res!652241 () Bool)

(assert (=> b!974295 (=> (not res!652241) (not e!549126))))

(assert (=> b!974295 (= res!652241 (not (validKeyInArray!0 (select (arr!29173 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun lt!432543 () ListLongMap!13169)

(assert (=> b!974295 (= lt!432543 (getCurrentListMap!3762 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974296 () Bool)

(declare-fun res!652244 () Bool)

(assert (=> b!974296 (=> (not res!652244) (not e!549123))))

(assert (=> b!974296 (= res!652244 (and (= (size!29655 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29654 _keys!1717) (size!29655 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974297 () Bool)

(assert (=> b!974297 (= e!549126 (bvsgt (bvsub from!2118 #b00000000000000000000000000000001) (size!29654 _keys!1717)))))

(assert (= (and start!83418 res!652239) b!974296))

(assert (= (and b!974296 res!652244) b!974291))

(assert (= (and b!974291 res!652240) b!974290))

(assert (= (and b!974290 res!652243) b!974288))

(assert (= (and b!974288 res!652245) b!974287))

(assert (= (and b!974287 res!652246) b!974292))

(assert (= (and b!974292 res!652242) b!974295))

(assert (= (and b!974295 res!652241) b!974297))

(assert (= (and b!974289 condMapEmpty!35500) mapIsEmpty!35500))

(assert (= (and b!974289 (not condMapEmpty!35500)) mapNonEmpty!35500))

(get-info :version)

(assert (= (and mapNonEmpty!35500 ((_ is ValueCellFull!10682) mapValue!35500)) b!974293))

(assert (= (and b!974289 ((_ is ValueCellFull!10682) mapDefault!35500)) b!974294))

(assert (= start!83418 b!974289))

(declare-fun m!901265 () Bool)

(assert (=> start!83418 m!901265))

(declare-fun m!901267 () Bool)

(assert (=> start!83418 m!901267))

(declare-fun m!901269 () Bool)

(assert (=> start!83418 m!901269))

(declare-fun m!901271 () Bool)

(assert (=> b!974287 m!901271))

(assert (=> b!974287 m!901271))

(declare-fun m!901273 () Bool)

(assert (=> b!974287 m!901273))

(declare-fun m!901275 () Bool)

(assert (=> b!974292 m!901275))

(assert (=> b!974292 m!901271))

(assert (=> b!974292 m!901275))

(assert (=> b!974292 m!901271))

(declare-fun m!901277 () Bool)

(assert (=> b!974292 m!901277))

(declare-fun m!901279 () Bool)

(assert (=> b!974295 m!901279))

(assert (=> b!974295 m!901279))

(declare-fun m!901281 () Bool)

(assert (=> b!974295 m!901281))

(declare-fun m!901283 () Bool)

(assert (=> b!974295 m!901283))

(declare-fun m!901285 () Bool)

(assert (=> b!974290 m!901285))

(declare-fun m!901287 () Bool)

(assert (=> mapNonEmpty!35500 m!901287))

(declare-fun m!901289 () Bool)

(assert (=> b!974291 m!901289))

(check-sat (not b!974290) (not b!974287) (not start!83418) (not b!974295) (not b!974291) b_and!31005 (not b!974292) tp_is_empty!22327 (not b_next!19429) (not mapNonEmpty!35500))
(check-sat b_and!31005 (not b_next!19429))
