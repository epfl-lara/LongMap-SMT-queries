; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83430 () Bool)

(assert start!83430)

(declare-fun b_free!19435 () Bool)

(declare-fun b_next!19435 () Bool)

(assert (=> start!83430 (= b_free!19435 (not b_next!19435))))

(declare-fun tp!67594 () Bool)

(declare-fun b_and!31011 () Bool)

(assert (=> start!83430 (= tp!67594 b_and!31011)))

(declare-fun b!974445 () Bool)

(declare-fun res!652343 () Bool)

(declare-fun e!549221 () Bool)

(assert (=> b!974445 (=> (not res!652343) (not e!549221))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34769 0))(
  ( (V!34770 (val!11220 Int)) )
))
(declare-datatypes ((ValueCell!10688 0))(
  ( (ValueCellFull!10688 (v!13778 V!34769)) (EmptyCell!10688) )
))
(declare-datatypes ((array!60642 0))(
  ( (array!60643 (arr!29185 (Array (_ BitVec 32) ValueCell!10688)) (size!29666 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60642)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60644 0))(
  ( (array!60645 (arr!29186 (Array (_ BitVec 32) (_ BitVec 64))) (size!29667 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60644)

(assert (=> b!974445 (= res!652343 (and (= (size!29666 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29667 _keys!1717) (size!29666 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974446 () Bool)

(declare-fun e!549219 () Bool)

(declare-fun tp_is_empty!22339 () Bool)

(assert (=> b!974446 (= e!549219 tp_is_empty!22339)))

(declare-fun b!974447 () Bool)

(declare-fun e!549222 () Bool)

(declare-fun e!549218 () Bool)

(declare-fun mapRes!35518 () Bool)

(assert (=> b!974447 (= e!549222 (and e!549218 mapRes!35518))))

(declare-fun condMapEmpty!35518 () Bool)

(declare-fun mapDefault!35518 () ValueCell!10688)

(assert (=> b!974447 (= condMapEmpty!35518 (= (arr!29185 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10688)) mapDefault!35518)))))

(declare-fun b!974448 () Bool)

(declare-fun res!652345 () Bool)

(assert (=> b!974448 (=> (not res!652345) (not e!549221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60644 (_ BitVec 32)) Bool)

(assert (=> b!974448 (= res!652345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974449 () Bool)

(declare-fun res!652348 () Bool)

(assert (=> b!974449 (=> (not res!652348) (not e!549221))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974449 (= res!652348 (validKeyInArray!0 (select (arr!29186 _keys!1717) i!822)))))

(declare-fun b!974450 () Bool)

(declare-fun res!652347 () Bool)

(assert (=> b!974450 (=> (not res!652347) (not e!549221))))

(declare-datatypes ((List!20295 0))(
  ( (Nil!20292) (Cons!20291 (h!21453 (_ BitVec 64)) (t!28763 List!20295)) )
))
(declare-fun arrayNoDuplicates!0 (array!60644 (_ BitVec 32) List!20295) Bool)

(assert (=> b!974450 (= res!652347 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20292))))

(declare-fun mapIsEmpty!35518 () Bool)

(assert (=> mapIsEmpty!35518 mapRes!35518))

(declare-fun res!652344 () Bool)

(assert (=> start!83430 (=> (not res!652344) (not e!549221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83430 (= res!652344 (validMask!0 mask!2147))))

(assert (=> start!83430 e!549221))

(assert (=> start!83430 true))

(declare-fun array_inv!22627 (array!60642) Bool)

(assert (=> start!83430 (and (array_inv!22627 _values!1425) e!549222)))

(assert (=> start!83430 tp_is_empty!22339))

(assert (=> start!83430 tp!67594))

(declare-fun array_inv!22628 (array!60644) Bool)

(assert (=> start!83430 (array_inv!22628 _keys!1717)))

(declare-fun b!974451 () Bool)

(assert (=> b!974451 (= e!549218 tp_is_empty!22339)))

(declare-fun mapNonEmpty!35518 () Bool)

(declare-fun tp!67593 () Bool)

(assert (=> mapNonEmpty!35518 (= mapRes!35518 (and tp!67593 e!549219))))

(declare-fun mapRest!35518 () (Array (_ BitVec 32) ValueCell!10688))

(declare-fun mapValue!35518 () ValueCell!10688)

(declare-fun mapKey!35518 () (_ BitVec 32))

(assert (=> mapNonEmpty!35518 (= (arr!29185 _values!1425) (store mapRest!35518 mapKey!35518 mapValue!35518))))

(declare-fun b!974452 () Bool)

(assert (=> b!974452 (= e!549221 (bvslt i!822 #b00000000000000000000000000000000))))

(declare-fun zeroValue!1367 () V!34769)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34769)

(declare-datatypes ((tuple2!14488 0))(
  ( (tuple2!14489 (_1!7255 (_ BitVec 64)) (_2!7255 V!34769)) )
))
(declare-datatypes ((List!20296 0))(
  ( (Nil!20293) (Cons!20292 (h!21454 tuple2!14488) (t!28764 List!20296)) )
))
(declare-datatypes ((ListLongMap!13175 0))(
  ( (ListLongMap!13176 (toList!6603 List!20296)) )
))
(declare-fun lt!432552 () ListLongMap!13175)

(declare-fun getCurrentListMap!3765 (array!60644 array!60642 (_ BitVec 32) (_ BitVec 32) V!34769 V!34769 (_ BitVec 32) Int) ListLongMap!13175)

(assert (=> b!974452 (= lt!432552 (getCurrentListMap!3765 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!974453 () Bool)

(declare-fun res!652346 () Bool)

(assert (=> b!974453 (=> (not res!652346) (not e!549221))))

(assert (=> b!974453 (= res!652346 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29667 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29667 _keys!1717))))))

(assert (= (and start!83430 res!652344) b!974445))

(assert (= (and b!974445 res!652343) b!974448))

(assert (= (and b!974448 res!652345) b!974450))

(assert (= (and b!974450 res!652347) b!974453))

(assert (= (and b!974453 res!652346) b!974449))

(assert (= (and b!974449 res!652348) b!974452))

(assert (= (and b!974447 condMapEmpty!35518) mapIsEmpty!35518))

(assert (= (and b!974447 (not condMapEmpty!35518)) mapNonEmpty!35518))

(get-info :version)

(assert (= (and mapNonEmpty!35518 ((_ is ValueCellFull!10688) mapValue!35518)) b!974446))

(assert (= (and b!974447 ((_ is ValueCellFull!10688) mapDefault!35518)) b!974451))

(assert (= start!83430 b!974447))

(declare-fun m!901379 () Bool)

(assert (=> b!974450 m!901379))

(declare-fun m!901381 () Bool)

(assert (=> mapNonEmpty!35518 m!901381))

(declare-fun m!901383 () Bool)

(assert (=> b!974452 m!901383))

(declare-fun m!901385 () Bool)

(assert (=> b!974448 m!901385))

(declare-fun m!901387 () Bool)

(assert (=> b!974449 m!901387))

(assert (=> b!974449 m!901387))

(declare-fun m!901389 () Bool)

(assert (=> b!974449 m!901389))

(declare-fun m!901391 () Bool)

(assert (=> start!83430 m!901391))

(declare-fun m!901393 () Bool)

(assert (=> start!83430 m!901393))

(declare-fun m!901395 () Bool)

(assert (=> start!83430 m!901395))

(check-sat (not b!974452) tp_is_empty!22339 (not b_next!19435) (not b!974450) b_and!31011 (not start!83430) (not mapNonEmpty!35518) (not b!974449) (not b!974448))
(check-sat b_and!31011 (not b_next!19435))
