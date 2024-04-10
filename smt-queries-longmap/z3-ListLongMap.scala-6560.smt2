; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83246 () Bool)

(assert start!83246)

(declare-fun b_free!19239 () Bool)

(declare-fun b_next!19239 () Bool)

(assert (=> start!83246 (= b_free!19239 (not b_next!19239))))

(declare-fun tp!66996 () Bool)

(declare-fun b_and!30727 () Bool)

(assert (=> start!83246 (= tp!66996 b_and!30727)))

(declare-fun b!971389 () Bool)

(declare-fun res!650183 () Bool)

(declare-fun e!547593 () Bool)

(assert (=> b!971389 (=> (not res!650183) (not e!547593))))

(declare-datatypes ((array!60321 0))(
  ( (array!60322 (arr!29024 (Array (_ BitVec 32) (_ BitVec 64))) (size!29503 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60321)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971389 (= res!650183 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29503 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29503 _keys!1717))))))

(declare-fun b!971390 () Bool)

(declare-fun res!650182 () Bool)

(assert (=> b!971390 (=> (not res!650182) (not e!547593))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60321 (_ BitVec 32)) Bool)

(assert (=> b!971390 (= res!650182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971391 () Bool)

(declare-fun res!650181 () Bool)

(assert (=> b!971391 (=> (not res!650181) (not e!547593))))

(declare-datatypes ((V!34499 0))(
  ( (V!34500 (val!11119 Int)) )
))
(declare-datatypes ((ValueCell!10587 0))(
  ( (ValueCellFull!10587 (v!13678 V!34499)) (EmptyCell!10587) )
))
(declare-datatypes ((array!60323 0))(
  ( (array!60324 (arr!29025 (Array (_ BitVec 32) ValueCell!10587)) (size!29504 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60323)

(declare-fun zeroValue!1367 () V!34499)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34499)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14250 0))(
  ( (tuple2!14251 (_1!7136 (_ BitVec 64)) (_2!7136 V!34499)) )
))
(declare-datatypes ((List!20118 0))(
  ( (Nil!20115) (Cons!20114 (h!21276 tuple2!14250) (t!28481 List!20118)) )
))
(declare-datatypes ((ListLongMap!12947 0))(
  ( (ListLongMap!12948 (toList!6489 List!20118)) )
))
(declare-fun contains!5590 (ListLongMap!12947 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3722 (array!60321 array!60323 (_ BitVec 32) (_ BitVec 32) V!34499 V!34499 (_ BitVec 32) Int) ListLongMap!12947)

(assert (=> b!971391 (= res!650181 (contains!5590 (getCurrentListMap!3722 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29024 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35215 () Bool)

(declare-fun mapRes!35215 () Bool)

(assert (=> mapIsEmpty!35215 mapRes!35215))

(declare-fun b!971392 () Bool)

(declare-fun res!650184 () Bool)

(assert (=> b!971392 (=> (not res!650184) (not e!547593))))

(assert (=> b!971392 (= res!650184 (and (= (size!29504 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29503 _keys!1717) (size!29504 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971393 () Bool)

(declare-fun e!547594 () Bool)

(declare-fun tp_is_empty!22137 () Bool)

(assert (=> b!971393 (= e!547594 tp_is_empty!22137)))

(declare-fun b!971394 () Bool)

(assert (=> b!971394 (= e!547593 false)))

(declare-fun lt!431828 () ListLongMap!12947)

(assert (=> b!971394 (= lt!431828 (getCurrentListMap!3722 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!650186 () Bool)

(assert (=> start!83246 (=> (not res!650186) (not e!547593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83246 (= res!650186 (validMask!0 mask!2147))))

(assert (=> start!83246 e!547593))

(assert (=> start!83246 true))

(declare-fun e!547590 () Bool)

(declare-fun array_inv!22461 (array!60323) Bool)

(assert (=> start!83246 (and (array_inv!22461 _values!1425) e!547590)))

(assert (=> start!83246 tp_is_empty!22137))

(assert (=> start!83246 tp!66996))

(declare-fun array_inv!22462 (array!60321) Bool)

(assert (=> start!83246 (array_inv!22462 _keys!1717)))

(declare-fun b!971395 () Bool)

(declare-fun res!650187 () Bool)

(assert (=> b!971395 (=> (not res!650187) (not e!547593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971395 (= res!650187 (validKeyInArray!0 (select (arr!29024 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35215 () Bool)

(declare-fun tp!66995 () Bool)

(declare-fun e!547591 () Bool)

(assert (=> mapNonEmpty!35215 (= mapRes!35215 (and tp!66995 e!547591))))

(declare-fun mapValue!35215 () ValueCell!10587)

(declare-fun mapRest!35215 () (Array (_ BitVec 32) ValueCell!10587))

(declare-fun mapKey!35215 () (_ BitVec 32))

(assert (=> mapNonEmpty!35215 (= (arr!29025 _values!1425) (store mapRest!35215 mapKey!35215 mapValue!35215))))

(declare-fun b!971396 () Bool)

(declare-fun res!650185 () Bool)

(assert (=> b!971396 (=> (not res!650185) (not e!547593))))

(declare-datatypes ((List!20119 0))(
  ( (Nil!20116) (Cons!20115 (h!21277 (_ BitVec 64)) (t!28482 List!20119)) )
))
(declare-fun arrayNoDuplicates!0 (array!60321 (_ BitVec 32) List!20119) Bool)

(assert (=> b!971396 (= res!650185 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20116))))

(declare-fun b!971397 () Bool)

(assert (=> b!971397 (= e!547590 (and e!547594 mapRes!35215))))

(declare-fun condMapEmpty!35215 () Bool)

(declare-fun mapDefault!35215 () ValueCell!10587)

(assert (=> b!971397 (= condMapEmpty!35215 (= (arr!29025 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10587)) mapDefault!35215)))))

(declare-fun b!971398 () Bool)

(assert (=> b!971398 (= e!547591 tp_is_empty!22137)))

(assert (= (and start!83246 res!650186) b!971392))

(assert (= (and b!971392 res!650184) b!971390))

(assert (= (and b!971390 res!650182) b!971396))

(assert (= (and b!971396 res!650185) b!971389))

(assert (= (and b!971389 res!650183) b!971395))

(assert (= (and b!971395 res!650187) b!971391))

(assert (= (and b!971391 res!650181) b!971394))

(assert (= (and b!971397 condMapEmpty!35215) mapIsEmpty!35215))

(assert (= (and b!971397 (not condMapEmpty!35215)) mapNonEmpty!35215))

(get-info :version)

(assert (= (and mapNonEmpty!35215 ((_ is ValueCellFull!10587) mapValue!35215)) b!971398))

(assert (= (and b!971397 ((_ is ValueCellFull!10587) mapDefault!35215)) b!971393))

(assert (= start!83246 b!971397))

(declare-fun m!898859 () Bool)

(assert (=> start!83246 m!898859))

(declare-fun m!898861 () Bool)

(assert (=> start!83246 m!898861))

(declare-fun m!898863 () Bool)

(assert (=> start!83246 m!898863))

(declare-fun m!898865 () Bool)

(assert (=> mapNonEmpty!35215 m!898865))

(declare-fun m!898867 () Bool)

(assert (=> b!971395 m!898867))

(assert (=> b!971395 m!898867))

(declare-fun m!898869 () Bool)

(assert (=> b!971395 m!898869))

(declare-fun m!898871 () Bool)

(assert (=> b!971390 m!898871))

(declare-fun m!898873 () Bool)

(assert (=> b!971396 m!898873))

(declare-fun m!898875 () Bool)

(assert (=> b!971391 m!898875))

(assert (=> b!971391 m!898867))

(assert (=> b!971391 m!898875))

(assert (=> b!971391 m!898867))

(declare-fun m!898877 () Bool)

(assert (=> b!971391 m!898877))

(declare-fun m!898879 () Bool)

(assert (=> b!971394 m!898879))

(check-sat (not mapNonEmpty!35215) (not b_next!19239) (not b!971395) (not b!971391) (not b!971396) b_and!30727 (not b!971390) tp_is_empty!22137 (not start!83246) (not b!971394))
(check-sat b_and!30727 (not b_next!19239))
