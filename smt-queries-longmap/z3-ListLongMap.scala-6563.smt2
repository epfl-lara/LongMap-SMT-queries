; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83430 () Bool)

(assert start!83430)

(declare-fun b_free!19255 () Bool)

(declare-fun b_next!19255 () Bool)

(assert (=> start!83430 (= b_free!19255 (not b_next!19255))))

(declare-fun tp!67045 () Bool)

(declare-fun b_and!30753 () Bool)

(assert (=> start!83430 (= tp!67045 b_and!30753)))

(declare-fun mapIsEmpty!35239 () Bool)

(declare-fun mapRes!35239 () Bool)

(assert (=> mapIsEmpty!35239 mapRes!35239))

(declare-fun b!972532 () Bool)

(declare-fun e!548296 () Bool)

(declare-fun tp_is_empty!22153 () Bool)

(assert (=> b!972532 (= e!548296 tp_is_empty!22153)))

(declare-fun b!972533 () Bool)

(declare-fun res!650695 () Bool)

(declare-fun e!548292 () Bool)

(assert (=> b!972533 (=> (not res!650695) (not e!548292))))

(declare-datatypes ((array!60378 0))(
  ( (array!60379 (arr!29048 (Array (_ BitVec 32) (_ BitVec 64))) (size!29528 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60378)

(declare-datatypes ((List!20119 0))(
  ( (Nil!20116) (Cons!20115 (h!21283 (_ BitVec 64)) (t!28474 List!20119)) )
))
(declare-fun arrayNoDuplicates!0 (array!60378 (_ BitVec 32) List!20119) Bool)

(assert (=> b!972533 (= res!650695 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20116))))

(declare-fun b!972534 () Bool)

(declare-fun res!650697 () Bool)

(assert (=> b!972534 (=> (not res!650697) (not e!548292))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34521 0))(
  ( (V!34522 (val!11127 Int)) )
))
(declare-datatypes ((ValueCell!10595 0))(
  ( (ValueCellFull!10595 (v!13683 V!34521)) (EmptyCell!10595) )
))
(declare-datatypes ((array!60380 0))(
  ( (array!60381 (arr!29049 (Array (_ BitVec 32) ValueCell!10595)) (size!29529 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60380)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!972534 (= res!650697 (and (= (size!29529 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29528 _keys!1717) (size!29529 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972535 () Bool)

(declare-fun e!548295 () Bool)

(assert (=> b!972535 (= e!548295 tp_is_empty!22153)))

(declare-fun b!972536 () Bool)

(assert (=> b!972536 (= e!548292 false)))

(declare-datatypes ((tuple2!14266 0))(
  ( (tuple2!14267 (_1!7144 (_ BitVec 64)) (_2!7144 V!34521)) )
))
(declare-datatypes ((List!20120 0))(
  ( (Nil!20117) (Cons!20116 (h!21284 tuple2!14266) (t!28475 List!20120)) )
))
(declare-datatypes ((ListLongMap!12965 0))(
  ( (ListLongMap!12966 (toList!6498 List!20120)) )
))
(declare-fun lt!432213 () ListLongMap!12965)

(declare-fun zeroValue!1367 () V!34521)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34521)

(declare-fun getCurrentListMap!3731 (array!60378 array!60380 (_ BitVec 32) (_ BitVec 32) V!34521 V!34521 (_ BitVec 32) Int) ListLongMap!12965)

(assert (=> b!972536 (= lt!432213 (getCurrentListMap!3731 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35239 () Bool)

(declare-fun tp!67044 () Bool)

(assert (=> mapNonEmpty!35239 (= mapRes!35239 (and tp!67044 e!548296))))

(declare-fun mapRest!35239 () (Array (_ BitVec 32) ValueCell!10595))

(declare-fun mapKey!35239 () (_ BitVec 32))

(declare-fun mapValue!35239 () ValueCell!10595)

(assert (=> mapNonEmpty!35239 (= (arr!29049 _values!1425) (store mapRest!35239 mapKey!35239 mapValue!35239))))

(declare-fun b!972537 () Bool)

(declare-fun e!548294 () Bool)

(assert (=> b!972537 (= e!548294 (and e!548295 mapRes!35239))))

(declare-fun condMapEmpty!35239 () Bool)

(declare-fun mapDefault!35239 () ValueCell!10595)

(assert (=> b!972537 (= condMapEmpty!35239 (= (arr!29049 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10595)) mapDefault!35239)))))

(declare-fun b!972538 () Bool)

(declare-fun res!650696 () Bool)

(assert (=> b!972538 (=> (not res!650696) (not e!548292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60378 (_ BitVec 32)) Bool)

(assert (=> b!972538 (= res!650696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972539 () Bool)

(declare-fun res!650698 () Bool)

(assert (=> b!972539 (=> (not res!650698) (not e!548292))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972539 (= res!650698 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29528 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29528 _keys!1717))))))

(declare-fun res!650699 () Bool)

(assert (=> start!83430 (=> (not res!650699) (not e!548292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83430 (= res!650699 (validMask!0 mask!2147))))

(assert (=> start!83430 e!548292))

(assert (=> start!83430 true))

(declare-fun array_inv!22525 (array!60380) Bool)

(assert (=> start!83430 (and (array_inv!22525 _values!1425) e!548294)))

(assert (=> start!83430 tp_is_empty!22153))

(assert (=> start!83430 tp!67045))

(declare-fun array_inv!22526 (array!60378) Bool)

(assert (=> start!83430 (array_inv!22526 _keys!1717)))

(declare-fun b!972540 () Bool)

(declare-fun res!650693 () Bool)

(assert (=> b!972540 (=> (not res!650693) (not e!548292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972540 (= res!650693 (validKeyInArray!0 (select (arr!29048 _keys!1717) i!822)))))

(declare-fun b!972541 () Bool)

(declare-fun res!650694 () Bool)

(assert (=> b!972541 (=> (not res!650694) (not e!548292))))

(declare-fun contains!5612 (ListLongMap!12965 (_ BitVec 64)) Bool)

(assert (=> b!972541 (= res!650694 (contains!5612 (getCurrentListMap!3731 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29048 _keys!1717) i!822)))))

(assert (= (and start!83430 res!650699) b!972534))

(assert (= (and b!972534 res!650697) b!972538))

(assert (= (and b!972538 res!650696) b!972533))

(assert (= (and b!972533 res!650695) b!972539))

(assert (= (and b!972539 res!650698) b!972540))

(assert (= (and b!972540 res!650693) b!972541))

(assert (= (and b!972541 res!650694) b!972536))

(assert (= (and b!972537 condMapEmpty!35239) mapIsEmpty!35239))

(assert (= (and b!972537 (not condMapEmpty!35239)) mapNonEmpty!35239))

(get-info :version)

(assert (= (and mapNonEmpty!35239 ((_ is ValueCellFull!10595) mapValue!35239)) b!972532))

(assert (= (and b!972537 ((_ is ValueCellFull!10595) mapDefault!35239)) b!972535))

(assert (= start!83430 b!972537))

(declare-fun m!900329 () Bool)

(assert (=> b!972536 m!900329))

(declare-fun m!900331 () Bool)

(assert (=> b!972538 m!900331))

(declare-fun m!900333 () Bool)

(assert (=> b!972540 m!900333))

(assert (=> b!972540 m!900333))

(declare-fun m!900335 () Bool)

(assert (=> b!972540 m!900335))

(declare-fun m!900337 () Bool)

(assert (=> start!83430 m!900337))

(declare-fun m!900339 () Bool)

(assert (=> start!83430 m!900339))

(declare-fun m!900341 () Bool)

(assert (=> start!83430 m!900341))

(declare-fun m!900343 () Bool)

(assert (=> b!972541 m!900343))

(assert (=> b!972541 m!900333))

(assert (=> b!972541 m!900343))

(assert (=> b!972541 m!900333))

(declare-fun m!900345 () Bool)

(assert (=> b!972541 m!900345))

(declare-fun m!900347 () Bool)

(assert (=> b!972533 m!900347))

(declare-fun m!900349 () Bool)

(assert (=> mapNonEmpty!35239 m!900349))

(check-sat b_and!30753 (not b!972538) (not b!972540) (not b!972533) (not start!83430) (not b!972536) (not b!972541) (not mapNonEmpty!35239) tp_is_empty!22153 (not b_next!19255))
(check-sat b_and!30753 (not b_next!19255))
