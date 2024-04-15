; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83286 () Bool)

(assert start!83286)

(declare-fun b_free!19297 () Bool)

(declare-fun b_next!19297 () Bool)

(assert (=> start!83286 (= b_free!19297 (not b_next!19297))))

(declare-fun tp!67170 () Bool)

(declare-fun b_and!30789 () Bool)

(assert (=> start!83286 (= tp!67170 b_and!30789)))

(declare-fun b!972097 () Bool)

(declare-fun e!547925 () Bool)

(assert (=> b!972097 (= e!547925 (not true))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun lt!431774 () (_ BitVec 64))

(declare-datatypes ((V!34577 0))(
  ( (V!34578 (val!11148 Int)) )
))
(declare-datatypes ((ValueCell!10616 0))(
  ( (ValueCellFull!10616 (v!13706 V!34577)) (EmptyCell!10616) )
))
(declare-datatypes ((array!60370 0))(
  ( (array!60371 (arr!29049 (Array (_ BitVec 32) ValueCell!10616)) (size!29530 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60370)

(declare-datatypes ((tuple2!14380 0))(
  ( (tuple2!14381 (_1!7201 (_ BitVec 64)) (_2!7201 V!34577)) )
))
(declare-datatypes ((List!20191 0))(
  ( (Nil!20188) (Cons!20187 (h!21349 tuple2!14380) (t!28577 List!20191)) )
))
(declare-datatypes ((ListLongMap!13067 0))(
  ( (ListLongMap!13068 (toList!6549 List!20191)) )
))
(declare-fun lt!431775 () ListLongMap!13067)

(declare-fun zeroValue!1367 () V!34577)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34577)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60372 0))(
  ( (array!60373 (arr!29050 (Array (_ BitVec 32) (_ BitVec 64))) (size!29531 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60372)

(declare-fun +!2903 (ListLongMap!13067 tuple2!14380) ListLongMap!13067)

(declare-fun getCurrentListMap!3711 (array!60372 array!60370 (_ BitVec 32) (_ BitVec 32) V!34577 V!34577 (_ BitVec 32) Int) ListLongMap!13067)

(declare-fun get!15054 (ValueCell!10616 V!34577) V!34577)

(declare-fun dynLambda!1659 (Int (_ BitVec 64)) V!34577)

(assert (=> b!972097 (= lt!431775 (+!2903 (getCurrentListMap!3711 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14381 lt!431774 (get!15054 (select (arr!29049 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1659 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32258 0))(
  ( (Unit!32259) )
))
(declare-fun lt!431773 () Unit!32258)

(declare-fun lemmaListMapRecursiveValidKeyArray!243 (array!60372 array!60370 (_ BitVec 32) (_ BitVec 32) V!34577 V!34577 (_ BitVec 32) Int) Unit!32258)

(assert (=> b!972097 (= lt!431773 (lemmaListMapRecursiveValidKeyArray!243 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972098 () Bool)

(declare-fun res!650728 () Bool)

(declare-fun e!547929 () Bool)

(assert (=> b!972098 (=> (not res!650728) (not e!547929))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972098 (= res!650728 (validKeyInArray!0 (select (arr!29050 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35302 () Bool)

(declare-fun mapRes!35302 () Bool)

(assert (=> mapIsEmpty!35302 mapRes!35302))

(declare-fun b!972099 () Bool)

(declare-fun e!547926 () Bool)

(declare-fun e!547927 () Bool)

(assert (=> b!972099 (= e!547926 (and e!547927 mapRes!35302))))

(declare-fun condMapEmpty!35302 () Bool)

(declare-fun mapDefault!35302 () ValueCell!10616)

(assert (=> b!972099 (= condMapEmpty!35302 (= (arr!29049 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10616)) mapDefault!35302)))))

(declare-fun b!972100 () Bool)

(declare-fun res!650730 () Bool)

(assert (=> b!972100 (=> (not res!650730) (not e!547929))))

(assert (=> b!972100 (= res!650730 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29531 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29531 _keys!1717))))))

(declare-fun mapNonEmpty!35302 () Bool)

(declare-fun tp!67171 () Bool)

(declare-fun e!547928 () Bool)

(assert (=> mapNonEmpty!35302 (= mapRes!35302 (and tp!67171 e!547928))))

(declare-fun mapRest!35302 () (Array (_ BitVec 32) ValueCell!10616))

(declare-fun mapValue!35302 () ValueCell!10616)

(declare-fun mapKey!35302 () (_ BitVec 32))

(assert (=> mapNonEmpty!35302 (= (arr!29049 _values!1425) (store mapRest!35302 mapKey!35302 mapValue!35302))))

(declare-fun b!972101 () Bool)

(declare-fun tp_is_empty!22195 () Bool)

(assert (=> b!972101 (= e!547927 tp_is_empty!22195)))

(declare-fun b!972102 () Bool)

(declare-fun res!650733 () Bool)

(assert (=> b!972102 (=> (not res!650733) (not e!547929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60372 (_ BitVec 32)) Bool)

(assert (=> b!972102 (= res!650733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972103 () Bool)

(declare-fun res!650731 () Bool)

(assert (=> b!972103 (=> (not res!650731) (not e!547929))))

(declare-fun contains!5590 (ListLongMap!13067 (_ BitVec 64)) Bool)

(assert (=> b!972103 (= res!650731 (contains!5590 (getCurrentListMap!3711 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29050 _keys!1717) i!822)))))

(declare-fun res!650732 () Bool)

(assert (=> start!83286 (=> (not res!650732) (not e!547929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83286 (= res!650732 (validMask!0 mask!2147))))

(assert (=> start!83286 e!547929))

(assert (=> start!83286 true))

(declare-fun array_inv!22537 (array!60370) Bool)

(assert (=> start!83286 (and (array_inv!22537 _values!1425) e!547926)))

(assert (=> start!83286 tp_is_empty!22195))

(assert (=> start!83286 tp!67170))

(declare-fun array_inv!22538 (array!60372) Bool)

(assert (=> start!83286 (array_inv!22538 _keys!1717)))

(declare-fun b!972104 () Bool)

(declare-fun res!650734 () Bool)

(assert (=> b!972104 (=> (not res!650734) (not e!547929))))

(assert (=> b!972104 (= res!650734 (and (= (size!29530 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29531 _keys!1717) (size!29530 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972105 () Bool)

(assert (=> b!972105 (= e!547928 tp_is_empty!22195)))

(declare-fun b!972106 () Bool)

(declare-fun res!650727 () Bool)

(assert (=> b!972106 (=> (not res!650727) (not e!547929))))

(declare-datatypes ((List!20192 0))(
  ( (Nil!20189) (Cons!20188 (h!21350 (_ BitVec 64)) (t!28578 List!20192)) )
))
(declare-fun arrayNoDuplicates!0 (array!60372 (_ BitVec 32) List!20192) Bool)

(assert (=> b!972106 (= res!650727 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20189))))

(declare-fun b!972107 () Bool)

(assert (=> b!972107 (= e!547929 e!547925)))

(declare-fun res!650729 () Bool)

(assert (=> b!972107 (=> (not res!650729) (not e!547925))))

(assert (=> b!972107 (= res!650729 (validKeyInArray!0 lt!431774))))

(assert (=> b!972107 (= lt!431774 (select (arr!29050 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972107 (= lt!431775 (getCurrentListMap!3711 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83286 res!650732) b!972104))

(assert (= (and b!972104 res!650734) b!972102))

(assert (= (and b!972102 res!650733) b!972106))

(assert (= (and b!972106 res!650727) b!972100))

(assert (= (and b!972100 res!650730) b!972098))

(assert (= (and b!972098 res!650728) b!972103))

(assert (= (and b!972103 res!650731) b!972107))

(assert (= (and b!972107 res!650729) b!972097))

(assert (= (and b!972099 condMapEmpty!35302) mapIsEmpty!35302))

(assert (= (and b!972099 (not condMapEmpty!35302)) mapNonEmpty!35302))

(get-info :version)

(assert (= (and mapNonEmpty!35302 ((_ is ValueCellFull!10616) mapValue!35302)) b!972105))

(assert (= (and b!972099 ((_ is ValueCellFull!10616) mapDefault!35302)) b!972101))

(assert (= start!83286 b!972099))

(declare-fun b_lambda!14443 () Bool)

(assert (=> (not b_lambda!14443) (not b!972097)))

(declare-fun t!28576 () Bool)

(declare-fun tb!6237 () Bool)

(assert (=> (and start!83286 (= defaultEntry!1428 defaultEntry!1428) t!28576) tb!6237))

(declare-fun result!12459 () Bool)

(assert (=> tb!6237 (= result!12459 tp_is_empty!22195)))

(assert (=> b!972097 t!28576))

(declare-fun b_and!30791 () Bool)

(assert (= b_and!30789 (and (=> t!28576 result!12459) b_and!30791)))

(declare-fun m!898979 () Bool)

(assert (=> b!972103 m!898979))

(declare-fun m!898981 () Bool)

(assert (=> b!972103 m!898981))

(assert (=> b!972103 m!898979))

(assert (=> b!972103 m!898981))

(declare-fun m!898983 () Bool)

(assert (=> b!972103 m!898983))

(declare-fun m!898985 () Bool)

(assert (=> start!83286 m!898985))

(declare-fun m!898987 () Bool)

(assert (=> start!83286 m!898987))

(declare-fun m!898989 () Bool)

(assert (=> start!83286 m!898989))

(assert (=> b!972098 m!898981))

(assert (=> b!972098 m!898981))

(declare-fun m!898991 () Bool)

(assert (=> b!972098 m!898991))

(declare-fun m!898993 () Bool)

(assert (=> b!972102 m!898993))

(declare-fun m!898995 () Bool)

(assert (=> b!972106 m!898995))

(declare-fun m!898997 () Bool)

(assert (=> b!972097 m!898997))

(declare-fun m!898999 () Bool)

(assert (=> b!972097 m!898999))

(declare-fun m!899001 () Bool)

(assert (=> b!972097 m!899001))

(assert (=> b!972097 m!898999))

(declare-fun m!899003 () Bool)

(assert (=> b!972097 m!899003))

(assert (=> b!972097 m!898997))

(assert (=> b!972097 m!899001))

(declare-fun m!899005 () Bool)

(assert (=> b!972097 m!899005))

(declare-fun m!899007 () Bool)

(assert (=> b!972097 m!899007))

(declare-fun m!899009 () Bool)

(assert (=> b!972107 m!899009))

(declare-fun m!899011 () Bool)

(assert (=> b!972107 m!899011))

(declare-fun m!899013 () Bool)

(assert (=> b!972107 m!899013))

(declare-fun m!899015 () Bool)

(assert (=> mapNonEmpty!35302 m!899015))

(check-sat (not b_next!19297) (not b!972106) (not b!972103) (not b_lambda!14443) (not mapNonEmpty!35302) (not start!83286) tp_is_empty!22195 (not b!972098) (not b!972102) (not b!972097) (not b!972107) b_and!30791)
(check-sat b_and!30791 (not b_next!19297))
