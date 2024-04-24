; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83286 () Bool)

(assert start!83286)

(declare-fun b_free!19111 () Bool)

(declare-fun b_next!19111 () Bool)

(assert (=> start!83286 (= b_free!19111 (not b_next!19111))))

(declare-fun tp!66612 () Bool)

(declare-fun b_and!30609 () Bool)

(assert (=> start!83286 (= tp!66612 b_and!30609)))

(declare-fun mapNonEmpty!35023 () Bool)

(declare-fun mapRes!35023 () Bool)

(declare-fun tp!66613 () Bool)

(declare-fun e!547216 () Bool)

(assert (=> mapNonEmpty!35023 (= mapRes!35023 (and tp!66613 e!547216))))

(declare-datatypes ((V!34329 0))(
  ( (V!34330 (val!11055 Int)) )
))
(declare-datatypes ((ValueCell!10523 0))(
  ( (ValueCellFull!10523 (v!13611 V!34329)) (EmptyCell!10523) )
))
(declare-datatypes ((array!60098 0))(
  ( (array!60099 (arr!28908 (Array (_ BitVec 32) ValueCell!10523)) (size!29388 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60098)

(declare-fun mapValue!35023 () ValueCell!10523)

(declare-fun mapKey!35023 () (_ BitVec 32))

(declare-fun mapRest!35023 () (Array (_ BitVec 32) ValueCell!10523))

(assert (=> mapNonEmpty!35023 (= (arr!28908 _values!1425) (store mapRest!35023 mapKey!35023 mapValue!35023))))

(declare-fun b!970496 () Bool)

(declare-fun tp_is_empty!22009 () Bool)

(assert (=> b!970496 (= e!547216 tp_is_empty!22009)))

(declare-fun b!970497 () Bool)

(declare-fun res!649310 () Bool)

(declare-fun e!547215 () Bool)

(assert (=> b!970497 (=> (not res!649310) (not e!547215))))

(declare-datatypes ((array!60100 0))(
  ( (array!60101 (arr!28909 (Array (_ BitVec 32) (_ BitVec 64))) (size!29389 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60100)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970497 (= res!649310 (validKeyInArray!0 (select (arr!28909 _keys!1717) i!822)))))

(declare-fun b!970498 () Bool)

(declare-fun res!649309 () Bool)

(assert (=> b!970498 (=> (not res!649309) (not e!547215))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60100 (_ BitVec 32)) Bool)

(assert (=> b!970498 (= res!649309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970499 () Bool)

(declare-fun res!649308 () Bool)

(assert (=> b!970499 (=> (not res!649308) (not e!547215))))

(declare-datatypes ((List!20022 0))(
  ( (Nil!20019) (Cons!20018 (h!21186 (_ BitVec 64)) (t!28377 List!20022)) )
))
(declare-fun arrayNoDuplicates!0 (array!60100 (_ BitVec 32) List!20022) Bool)

(assert (=> b!970499 (= res!649308 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20019))))

(declare-fun b!970500 () Bool)

(declare-fun res!649307 () Bool)

(assert (=> b!970500 (=> (not res!649307) (not e!547215))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970500 (= res!649307 (and (= (size!29388 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29389 _keys!1717) (size!29388 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!649305 () Bool)

(assert (=> start!83286 (=> (not res!649305) (not e!547215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83286 (= res!649305 (validMask!0 mask!2147))))

(assert (=> start!83286 e!547215))

(assert (=> start!83286 true))

(declare-fun e!547214 () Bool)

(declare-fun array_inv!22429 (array!60098) Bool)

(assert (=> start!83286 (and (array_inv!22429 _values!1425) e!547214)))

(assert (=> start!83286 tp_is_empty!22009))

(assert (=> start!83286 tp!66612))

(declare-fun array_inv!22430 (array!60100) Bool)

(assert (=> start!83286 (array_inv!22430 _keys!1717)))

(declare-fun b!970501 () Bool)

(assert (=> b!970501 (= e!547215 false)))

(declare-fun zeroValue!1367 () V!34329)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34329)

(declare-fun lt!432015 () Bool)

(declare-datatypes ((tuple2!14160 0))(
  ( (tuple2!14161 (_1!7091 (_ BitVec 64)) (_2!7091 V!34329)) )
))
(declare-datatypes ((List!20023 0))(
  ( (Nil!20020) (Cons!20019 (h!21187 tuple2!14160) (t!28378 List!20023)) )
))
(declare-datatypes ((ListLongMap!12859 0))(
  ( (ListLongMap!12860 (toList!6445 List!20023)) )
))
(declare-fun contains!5560 (ListLongMap!12859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3678 (array!60100 array!60098 (_ BitVec 32) (_ BitVec 32) V!34329 V!34329 (_ BitVec 32) Int) ListLongMap!12859)

(assert (=> b!970501 (= lt!432015 (contains!5560 (getCurrentListMap!3678 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28909 _keys!1717) i!822)))))

(declare-fun b!970502 () Bool)

(declare-fun e!547212 () Bool)

(assert (=> b!970502 (= e!547214 (and e!547212 mapRes!35023))))

(declare-fun condMapEmpty!35023 () Bool)

(declare-fun mapDefault!35023 () ValueCell!10523)

(assert (=> b!970502 (= condMapEmpty!35023 (= (arr!28908 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10523)) mapDefault!35023)))))

(declare-fun mapIsEmpty!35023 () Bool)

(assert (=> mapIsEmpty!35023 mapRes!35023))

(declare-fun b!970503 () Bool)

(declare-fun res!649306 () Bool)

(assert (=> b!970503 (=> (not res!649306) (not e!547215))))

(assert (=> b!970503 (= res!649306 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29389 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29389 _keys!1717))))))

(declare-fun b!970504 () Bool)

(assert (=> b!970504 (= e!547212 tp_is_empty!22009)))

(assert (= (and start!83286 res!649305) b!970500))

(assert (= (and b!970500 res!649307) b!970498))

(assert (= (and b!970498 res!649309) b!970499))

(assert (= (and b!970499 res!649308) b!970503))

(assert (= (and b!970503 res!649306) b!970497))

(assert (= (and b!970497 res!649310) b!970501))

(assert (= (and b!970502 condMapEmpty!35023) mapIsEmpty!35023))

(assert (= (and b!970502 (not condMapEmpty!35023)) mapNonEmpty!35023))

(get-info :version)

(assert (= (and mapNonEmpty!35023 ((_ is ValueCellFull!10523) mapValue!35023)) b!970496))

(assert (= (and b!970502 ((_ is ValueCellFull!10523) mapDefault!35023)) b!970504))

(assert (= start!83286 b!970502))

(declare-fun m!898841 () Bool)

(assert (=> b!970497 m!898841))

(assert (=> b!970497 m!898841))

(declare-fun m!898843 () Bool)

(assert (=> b!970497 m!898843))

(declare-fun m!898845 () Bool)

(assert (=> start!83286 m!898845))

(declare-fun m!898847 () Bool)

(assert (=> start!83286 m!898847))

(declare-fun m!898849 () Bool)

(assert (=> start!83286 m!898849))

(declare-fun m!898851 () Bool)

(assert (=> b!970498 m!898851))

(declare-fun m!898853 () Bool)

(assert (=> mapNonEmpty!35023 m!898853))

(declare-fun m!898855 () Bool)

(assert (=> b!970501 m!898855))

(assert (=> b!970501 m!898841))

(assert (=> b!970501 m!898855))

(assert (=> b!970501 m!898841))

(declare-fun m!898857 () Bool)

(assert (=> b!970501 m!898857))

(declare-fun m!898859 () Bool)

(assert (=> b!970499 m!898859))

(check-sat (not b!970499) (not mapNonEmpty!35023) (not b!970497) (not b_next!19111) (not b!970501) (not b!970498) (not start!83286) tp_is_empty!22009 b_and!30609)
(check-sat b_and!30609 (not b_next!19111))
