; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83234 () Bool)

(assert start!83234)

(declare-fun b_free!19227 () Bool)

(declare-fun b_next!19227 () Bool)

(assert (=> start!83234 (= b_free!19227 (not b_next!19227))))

(declare-fun tp!66959 () Bool)

(declare-fun b_and!30715 () Bool)

(assert (=> start!83234 (= tp!66959 b_and!30715)))

(declare-fun b!971209 () Bool)

(declare-fun e!547501 () Bool)

(assert (=> b!971209 (= e!547501 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34483 0))(
  ( (V!34484 (val!11113 Int)) )
))
(declare-datatypes ((tuple2!14244 0))(
  ( (tuple2!14245 (_1!7133 (_ BitVec 64)) (_2!7133 V!34483)) )
))
(declare-datatypes ((List!20112 0))(
  ( (Nil!20109) (Cons!20108 (h!21270 tuple2!14244) (t!28475 List!20112)) )
))
(declare-datatypes ((ListLongMap!12941 0))(
  ( (ListLongMap!12942 (toList!6486 List!20112)) )
))
(declare-fun lt!431810 () ListLongMap!12941)

(declare-datatypes ((ValueCell!10581 0))(
  ( (ValueCellFull!10581 (v!13672 V!34483)) (EmptyCell!10581) )
))
(declare-datatypes ((array!60303 0))(
  ( (array!60304 (arr!29015 (Array (_ BitVec 32) ValueCell!10581)) (size!29494 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60303)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34483)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60305 0))(
  ( (array!60306 (arr!29016 (Array (_ BitVec 32) (_ BitVec 64))) (size!29495 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60305)

(declare-fun zeroValue!1367 () V!34483)

(declare-fun getCurrentListMap!3719 (array!60305 array!60303 (_ BitVec 32) (_ BitVec 32) V!34483 V!34483 (_ BitVec 32) Int) ListLongMap!12941)

(assert (=> b!971209 (= lt!431810 (getCurrentListMap!3719 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!650059 () Bool)

(assert (=> start!83234 (=> (not res!650059) (not e!547501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83234 (= res!650059 (validMask!0 mask!2147))))

(assert (=> start!83234 e!547501))

(assert (=> start!83234 true))

(declare-fun e!547500 () Bool)

(declare-fun array_inv!22455 (array!60303) Bool)

(assert (=> start!83234 (and (array_inv!22455 _values!1425) e!547500)))

(declare-fun tp_is_empty!22125 () Bool)

(assert (=> start!83234 tp_is_empty!22125))

(assert (=> start!83234 tp!66959))

(declare-fun array_inv!22456 (array!60305) Bool)

(assert (=> start!83234 (array_inv!22456 _keys!1717)))

(declare-fun b!971210 () Bool)

(declare-fun e!547503 () Bool)

(assert (=> b!971210 (= e!547503 tp_is_empty!22125)))

(declare-fun b!971211 () Bool)

(declare-fun res!650055 () Bool)

(assert (=> b!971211 (=> (not res!650055) (not e!547501))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971211 (= res!650055 (validKeyInArray!0 (select (arr!29016 _keys!1717) i!822)))))

(declare-fun b!971212 () Bool)

(declare-fun res!650060 () Bool)

(assert (=> b!971212 (=> (not res!650060) (not e!547501))))

(assert (=> b!971212 (= res!650060 (and (= (size!29494 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29495 _keys!1717) (size!29494 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971213 () Bool)

(declare-fun e!547502 () Bool)

(assert (=> b!971213 (= e!547502 tp_is_empty!22125)))

(declare-fun b!971214 () Bool)

(declare-fun res!650057 () Bool)

(assert (=> b!971214 (=> (not res!650057) (not e!547501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60305 (_ BitVec 32)) Bool)

(assert (=> b!971214 (= res!650057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35197 () Bool)

(declare-fun mapRes!35197 () Bool)

(assert (=> mapIsEmpty!35197 mapRes!35197))

(declare-fun b!971215 () Bool)

(assert (=> b!971215 (= e!547500 (and e!547502 mapRes!35197))))

(declare-fun condMapEmpty!35197 () Bool)

(declare-fun mapDefault!35197 () ValueCell!10581)

(assert (=> b!971215 (= condMapEmpty!35197 (= (arr!29015 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10581)) mapDefault!35197)))))

(declare-fun mapNonEmpty!35197 () Bool)

(declare-fun tp!66960 () Bool)

(assert (=> mapNonEmpty!35197 (= mapRes!35197 (and tp!66960 e!547503))))

(declare-fun mapValue!35197 () ValueCell!10581)

(declare-fun mapKey!35197 () (_ BitVec 32))

(declare-fun mapRest!35197 () (Array (_ BitVec 32) ValueCell!10581))

(assert (=> mapNonEmpty!35197 (= (arr!29015 _values!1425) (store mapRest!35197 mapKey!35197 mapValue!35197))))

(declare-fun b!971216 () Bool)

(declare-fun res!650058 () Bool)

(assert (=> b!971216 (=> (not res!650058) (not e!547501))))

(declare-fun contains!5587 (ListLongMap!12941 (_ BitVec 64)) Bool)

(assert (=> b!971216 (= res!650058 (contains!5587 (getCurrentListMap!3719 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29016 _keys!1717) i!822)))))

(declare-fun b!971217 () Bool)

(declare-fun res!650061 () Bool)

(assert (=> b!971217 (=> (not res!650061) (not e!547501))))

(assert (=> b!971217 (= res!650061 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29495 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29495 _keys!1717))))))

(declare-fun b!971218 () Bool)

(declare-fun res!650056 () Bool)

(assert (=> b!971218 (=> (not res!650056) (not e!547501))))

(declare-datatypes ((List!20113 0))(
  ( (Nil!20110) (Cons!20109 (h!21271 (_ BitVec 64)) (t!28476 List!20113)) )
))
(declare-fun arrayNoDuplicates!0 (array!60305 (_ BitVec 32) List!20113) Bool)

(assert (=> b!971218 (= res!650056 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20110))))

(assert (= (and start!83234 res!650059) b!971212))

(assert (= (and b!971212 res!650060) b!971214))

(assert (= (and b!971214 res!650057) b!971218))

(assert (= (and b!971218 res!650056) b!971217))

(assert (= (and b!971217 res!650061) b!971211))

(assert (= (and b!971211 res!650055) b!971216))

(assert (= (and b!971216 res!650058) b!971209))

(assert (= (and b!971215 condMapEmpty!35197) mapIsEmpty!35197))

(assert (= (and b!971215 (not condMapEmpty!35197)) mapNonEmpty!35197))

(get-info :version)

(assert (= (and mapNonEmpty!35197 ((_ is ValueCellFull!10581) mapValue!35197)) b!971210))

(assert (= (and b!971215 ((_ is ValueCellFull!10581) mapDefault!35197)) b!971213))

(assert (= start!83234 b!971215))

(declare-fun m!898727 () Bool)

(assert (=> start!83234 m!898727))

(declare-fun m!898729 () Bool)

(assert (=> start!83234 m!898729))

(declare-fun m!898731 () Bool)

(assert (=> start!83234 m!898731))

(declare-fun m!898733 () Bool)

(assert (=> b!971214 m!898733))

(declare-fun m!898735 () Bool)

(assert (=> b!971211 m!898735))

(assert (=> b!971211 m!898735))

(declare-fun m!898737 () Bool)

(assert (=> b!971211 m!898737))

(declare-fun m!898739 () Bool)

(assert (=> mapNonEmpty!35197 m!898739))

(declare-fun m!898741 () Bool)

(assert (=> b!971216 m!898741))

(assert (=> b!971216 m!898735))

(assert (=> b!971216 m!898741))

(assert (=> b!971216 m!898735))

(declare-fun m!898743 () Bool)

(assert (=> b!971216 m!898743))

(declare-fun m!898745 () Bool)

(assert (=> b!971218 m!898745))

(declare-fun m!898747 () Bool)

(assert (=> b!971209 m!898747))

(check-sat (not mapNonEmpty!35197) (not start!83234) (not b!971218) tp_is_empty!22125 (not b!971214) (not b!971209) b_and!30715 (not b!971216) (not b_next!19227) (not b!971211))
(check-sat b_and!30715 (not b_next!19227))
