; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83472 () Bool)

(assert start!83472)

(declare-fun b_free!19297 () Bool)

(declare-fun b_next!19297 () Bool)

(assert (=> start!83472 (= b_free!19297 (not b_next!19297))))

(declare-fun tp!67171 () Bool)

(declare-fun b_and!30825 () Bool)

(assert (=> start!83472 (= tp!67171 b_and!30825)))

(declare-fun b!973239 () Bool)

(declare-fun res!651181 () Bool)

(declare-fun e!548656 () Bool)

(assert (=> b!973239 (=> (not res!651181) (not e!548656))))

(declare-datatypes ((array!60462 0))(
  ( (array!60463 (arr!29090 (Array (_ BitVec 32) (_ BitVec 64))) (size!29570 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60462)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973239 (= res!651181 (validKeyInArray!0 (select (arr!29090 _keys!1717) i!822)))))

(declare-fun b!973240 () Bool)

(declare-fun res!651185 () Bool)

(assert (=> b!973240 (=> (not res!651185) (not e!548656))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60462 (_ BitVec 32)) Bool)

(assert (=> b!973240 (= res!651185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973241 () Bool)

(declare-fun res!651183 () Bool)

(assert (=> b!973241 (=> (not res!651183) (not e!548656))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973241 (= res!651183 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29570 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29570 _keys!1717))))))

(declare-fun b!973242 () Bool)

(declare-fun res!651186 () Bool)

(assert (=> b!973242 (=> (not res!651186) (not e!548656))))

(declare-datatypes ((V!34577 0))(
  ( (V!34578 (val!11148 Int)) )
))
(declare-datatypes ((ValueCell!10616 0))(
  ( (ValueCellFull!10616 (v!13704 V!34577)) (EmptyCell!10616) )
))
(declare-datatypes ((array!60464 0))(
  ( (array!60465 (arr!29091 (Array (_ BitVec 32) ValueCell!10616)) (size!29571 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60464)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!973242 (= res!651186 (and (= (size!29571 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29570 _keys!1717) (size!29571 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!651184 () Bool)

(assert (=> start!83472 (=> (not res!651184) (not e!548656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83472 (= res!651184 (validMask!0 mask!2147))))

(assert (=> start!83472 e!548656))

(assert (=> start!83472 true))

(declare-fun e!548657 () Bool)

(declare-fun array_inv!22563 (array!60464) Bool)

(assert (=> start!83472 (and (array_inv!22563 _values!1425) e!548657)))

(declare-fun tp_is_empty!22195 () Bool)

(assert (=> start!83472 tp_is_empty!22195))

(assert (=> start!83472 tp!67171))

(declare-fun array_inv!22564 (array!60462) Bool)

(assert (=> start!83472 (array_inv!22564 _keys!1717)))

(declare-fun mapIsEmpty!35302 () Bool)

(declare-fun mapRes!35302 () Bool)

(assert (=> mapIsEmpty!35302 mapRes!35302))

(declare-fun b!973243 () Bool)

(declare-fun e!548659 () Bool)

(assert (=> b!973243 (= e!548659 (not true))))

(declare-fun lt!432371 () (_ BitVec 64))

(declare-fun zeroValue!1367 () V!34577)

(declare-datatypes ((tuple2!14306 0))(
  ( (tuple2!14307 (_1!7164 (_ BitVec 64)) (_2!7164 V!34577)) )
))
(declare-datatypes ((List!20156 0))(
  ( (Nil!20153) (Cons!20152 (h!21320 tuple2!14306) (t!28543 List!20156)) )
))
(declare-datatypes ((ListLongMap!13005 0))(
  ( (ListLongMap!13006 (toList!6518 List!20156)) )
))
(declare-fun lt!432370 () ListLongMap!13005)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34577)

(declare-fun +!2897 (ListLongMap!13005 tuple2!14306) ListLongMap!13005)

(declare-fun getCurrentListMap!3751 (array!60462 array!60464 (_ BitVec 32) (_ BitVec 32) V!34577 V!34577 (_ BitVec 32) Int) ListLongMap!13005)

(declare-fun get!15088 (ValueCell!10616 V!34577) V!34577)

(declare-fun dynLambda!1694 (Int (_ BitVec 64)) V!34577)

(assert (=> b!973243 (= lt!432370 (+!2897 (getCurrentListMap!3751 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14307 lt!432371 (get!15088 (select (arr!29091 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1694 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32358 0))(
  ( (Unit!32359) )
))
(declare-fun lt!432372 () Unit!32358)

(declare-fun lemmaListMapRecursiveValidKeyArray!253 (array!60462 array!60464 (_ BitVec 32) (_ BitVec 32) V!34577 V!34577 (_ BitVec 32) Int) Unit!32358)

(assert (=> b!973243 (= lt!432372 (lemmaListMapRecursiveValidKeyArray!253 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973244 () Bool)

(declare-fun res!651187 () Bool)

(assert (=> b!973244 (=> (not res!651187) (not e!548656))))

(declare-datatypes ((List!20157 0))(
  ( (Nil!20154) (Cons!20153 (h!21321 (_ BitVec 64)) (t!28544 List!20157)) )
))
(declare-fun arrayNoDuplicates!0 (array!60462 (_ BitVec 32) List!20157) Bool)

(assert (=> b!973244 (= res!651187 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20154))))

(declare-fun b!973245 () Bool)

(declare-fun e!548658 () Bool)

(assert (=> b!973245 (= e!548657 (and e!548658 mapRes!35302))))

(declare-fun condMapEmpty!35302 () Bool)

(declare-fun mapDefault!35302 () ValueCell!10616)

(assert (=> b!973245 (= condMapEmpty!35302 (= (arr!29091 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10616)) mapDefault!35302)))))

(declare-fun b!973246 () Bool)

(assert (=> b!973246 (= e!548656 e!548659)))

(declare-fun res!651188 () Bool)

(assert (=> b!973246 (=> (not res!651188) (not e!548659))))

(assert (=> b!973246 (= res!651188 (validKeyInArray!0 lt!432371))))

(assert (=> b!973246 (= lt!432371 (select (arr!29090 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973246 (= lt!432370 (getCurrentListMap!3751 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973247 () Bool)

(declare-fun res!651182 () Bool)

(assert (=> b!973247 (=> (not res!651182) (not e!548656))))

(declare-fun contains!5629 (ListLongMap!13005 (_ BitVec 64)) Bool)

(assert (=> b!973247 (= res!651182 (contains!5629 (getCurrentListMap!3751 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29090 _keys!1717) i!822)))))

(declare-fun b!973248 () Bool)

(declare-fun e!548655 () Bool)

(assert (=> b!973248 (= e!548655 tp_is_empty!22195)))

(declare-fun b!973249 () Bool)

(assert (=> b!973249 (= e!548658 tp_is_empty!22195)))

(declare-fun mapNonEmpty!35302 () Bool)

(declare-fun tp!67170 () Bool)

(assert (=> mapNonEmpty!35302 (= mapRes!35302 (and tp!67170 e!548655))))

(declare-fun mapKey!35302 () (_ BitVec 32))

(declare-fun mapValue!35302 () ValueCell!10616)

(declare-fun mapRest!35302 () (Array (_ BitVec 32) ValueCell!10616))

(assert (=> mapNonEmpty!35302 (= (arr!29091 _values!1425) (store mapRest!35302 mapKey!35302 mapValue!35302))))

(assert (= (and start!83472 res!651184) b!973242))

(assert (= (and b!973242 res!651186) b!973240))

(assert (= (and b!973240 res!651185) b!973244))

(assert (= (and b!973244 res!651187) b!973241))

(assert (= (and b!973241 res!651183) b!973239))

(assert (= (and b!973239 res!651181) b!973247))

(assert (= (and b!973247 res!651182) b!973246))

(assert (= (and b!973246 res!651188) b!973243))

(assert (= (and b!973245 condMapEmpty!35302) mapIsEmpty!35302))

(assert (= (and b!973245 (not condMapEmpty!35302)) mapNonEmpty!35302))

(get-info :version)

(assert (= (and mapNonEmpty!35302 ((_ is ValueCellFull!10616) mapValue!35302)) b!973248))

(assert (= (and b!973245 ((_ is ValueCellFull!10616) mapDefault!35302)) b!973249))

(assert (= start!83472 b!973245))

(declare-fun b_lambda!14475 () Bool)

(assert (=> (not b_lambda!14475) (not b!973243)))

(declare-fun t!28542 () Bool)

(declare-fun tb!6237 () Bool)

(assert (=> (and start!83472 (= defaultEntry!1428 defaultEntry!1428) t!28542) tb!6237))

(declare-fun result!12459 () Bool)

(assert (=> tb!6237 (= result!12459 tp_is_empty!22195)))

(assert (=> b!973243 t!28542))

(declare-fun b_and!30827 () Bool)

(assert (= b_and!30825 (and (=> t!28542 result!12459) b_and!30827)))

(declare-fun m!901031 () Bool)

(assert (=> b!973240 m!901031))

(declare-fun m!901033 () Bool)

(assert (=> b!973247 m!901033))

(declare-fun m!901035 () Bool)

(assert (=> b!973247 m!901035))

(assert (=> b!973247 m!901033))

(assert (=> b!973247 m!901035))

(declare-fun m!901037 () Bool)

(assert (=> b!973247 m!901037))

(declare-fun m!901039 () Bool)

(assert (=> b!973246 m!901039))

(declare-fun m!901041 () Bool)

(assert (=> b!973246 m!901041))

(declare-fun m!901043 () Bool)

(assert (=> b!973246 m!901043))

(assert (=> b!973239 m!901035))

(assert (=> b!973239 m!901035))

(declare-fun m!901045 () Bool)

(assert (=> b!973239 m!901045))

(declare-fun m!901047 () Bool)

(assert (=> start!83472 m!901047))

(declare-fun m!901049 () Bool)

(assert (=> start!83472 m!901049))

(declare-fun m!901051 () Bool)

(assert (=> start!83472 m!901051))

(declare-fun m!901053 () Bool)

(assert (=> mapNonEmpty!35302 m!901053))

(declare-fun m!901055 () Bool)

(assert (=> b!973243 m!901055))

(declare-fun m!901057 () Bool)

(assert (=> b!973243 m!901057))

(declare-fun m!901059 () Bool)

(assert (=> b!973243 m!901059))

(assert (=> b!973243 m!901055))

(assert (=> b!973243 m!901059))

(declare-fun m!901061 () Bool)

(assert (=> b!973243 m!901061))

(assert (=> b!973243 m!901057))

(declare-fun m!901063 () Bool)

(assert (=> b!973243 m!901063))

(declare-fun m!901065 () Bool)

(assert (=> b!973243 m!901065))

(declare-fun m!901067 () Bool)

(assert (=> b!973244 m!901067))

(check-sat (not start!83472) (not b!973240) (not b_next!19297) (not b!973244) (not b!973247) (not b!973246) tp_is_empty!22195 (not mapNonEmpty!35302) (not b!973239) b_and!30827 (not b_lambda!14475) (not b!973243))
(check-sat b_and!30827 (not b_next!19297))
