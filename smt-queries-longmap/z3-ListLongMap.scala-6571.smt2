; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83478 () Bool)

(assert start!83478)

(declare-fun b_free!19303 () Bool)

(declare-fun b_next!19303 () Bool)

(assert (=> start!83478 (= b_free!19303 (not b_next!19303))))

(declare-fun tp!67188 () Bool)

(declare-fun b_and!30837 () Bool)

(assert (=> start!83478 (= tp!67188 b_and!30837)))

(declare-fun b!973344 () Bool)

(declare-fun res!651255 () Bool)

(declare-fun e!548709 () Bool)

(assert (=> b!973344 (=> (not res!651255) (not e!548709))))

(declare-datatypes ((array!60474 0))(
  ( (array!60475 (arr!29096 (Array (_ BitVec 32) (_ BitVec 64))) (size!29576 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60474)

(declare-datatypes ((List!20161 0))(
  ( (Nil!20158) (Cons!20157 (h!21325 (_ BitVec 64)) (t!28554 List!20161)) )
))
(declare-fun arrayNoDuplicates!0 (array!60474 (_ BitVec 32) List!20161) Bool)

(assert (=> b!973344 (= res!651255 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20158))))

(declare-fun b!973346 () Bool)

(declare-fun e!548713 () Bool)

(declare-fun e!548711 () Bool)

(declare-fun mapRes!35311 () Bool)

(assert (=> b!973346 (= e!548713 (and e!548711 mapRes!35311))))

(declare-fun condMapEmpty!35311 () Bool)

(declare-datatypes ((V!34585 0))(
  ( (V!34586 (val!11151 Int)) )
))
(declare-datatypes ((ValueCell!10619 0))(
  ( (ValueCellFull!10619 (v!13707 V!34585)) (EmptyCell!10619) )
))
(declare-datatypes ((array!60476 0))(
  ( (array!60477 (arr!29097 (Array (_ BitVec 32) ValueCell!10619)) (size!29577 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60476)

(declare-fun mapDefault!35311 () ValueCell!10619)

(assert (=> b!973346 (= condMapEmpty!35311 (= (arr!29097 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10619)) mapDefault!35311)))))

(declare-fun b!973347 () Bool)

(declare-fun res!651260 () Bool)

(assert (=> b!973347 (=> (not res!651260) (not e!548709))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973347 (= res!651260 (validKeyInArray!0 (select (arr!29096 _keys!1717) i!822)))))

(declare-fun b!973348 () Bool)

(declare-fun e!548710 () Bool)

(declare-fun tp_is_empty!22201 () Bool)

(assert (=> b!973348 (= e!548710 tp_is_empty!22201)))

(declare-fun mapIsEmpty!35311 () Bool)

(assert (=> mapIsEmpty!35311 mapRes!35311))

(declare-fun b!973349 () Bool)

(declare-fun res!651258 () Bool)

(assert (=> b!973349 (=> (not res!651258) (not e!548709))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60474 (_ BitVec 32)) Bool)

(assert (=> b!973349 (= res!651258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973350 () Bool)

(declare-fun res!651257 () Bool)

(assert (=> b!973350 (=> (not res!651257) (not e!548709))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973350 (= res!651257 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29576 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29576 _keys!1717))))))

(declare-fun b!973351 () Bool)

(declare-fun res!651254 () Bool)

(assert (=> b!973351 (=> (not res!651254) (not e!548709))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!973351 (= res!651254 (and (= (size!29577 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29576 _keys!1717) (size!29577 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973345 () Bool)

(declare-fun e!548708 () Bool)

(assert (=> b!973345 (= e!548708 (not true))))

(declare-datatypes ((tuple2!14312 0))(
  ( (tuple2!14313 (_1!7167 (_ BitVec 64)) (_2!7167 V!34585)) )
))
(declare-datatypes ((List!20162 0))(
  ( (Nil!20159) (Cons!20158 (h!21326 tuple2!14312) (t!28555 List!20162)) )
))
(declare-datatypes ((ListLongMap!13011 0))(
  ( (ListLongMap!13012 (toList!6521 List!20162)) )
))
(declare-fun lt!432397 () ListLongMap!13011)

(declare-fun zeroValue!1367 () V!34585)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34585)

(declare-fun lt!432398 () (_ BitVec 64))

(declare-fun +!2898 (ListLongMap!13011 tuple2!14312) ListLongMap!13011)

(declare-fun getCurrentListMap!3754 (array!60474 array!60476 (_ BitVec 32) (_ BitVec 32) V!34585 V!34585 (_ BitVec 32) Int) ListLongMap!13011)

(declare-fun get!15091 (ValueCell!10619 V!34585) V!34585)

(declare-fun dynLambda!1695 (Int (_ BitVec 64)) V!34585)

(assert (=> b!973345 (= lt!432397 (+!2898 (getCurrentListMap!3754 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14313 lt!432398 (get!15091 (select (arr!29097 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1695 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32360 0))(
  ( (Unit!32361) )
))
(declare-fun lt!432399 () Unit!32360)

(declare-fun lemmaListMapRecursiveValidKeyArray!254 (array!60474 array!60476 (_ BitVec 32) (_ BitVec 32) V!34585 V!34585 (_ BitVec 32) Int) Unit!32360)

(assert (=> b!973345 (= lt!432399 (lemmaListMapRecursiveValidKeyArray!254 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!651256 () Bool)

(assert (=> start!83478 (=> (not res!651256) (not e!548709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83478 (= res!651256 (validMask!0 mask!2147))))

(assert (=> start!83478 e!548709))

(assert (=> start!83478 true))

(declare-fun array_inv!22567 (array!60476) Bool)

(assert (=> start!83478 (and (array_inv!22567 _values!1425) e!548713)))

(assert (=> start!83478 tp_is_empty!22201))

(assert (=> start!83478 tp!67188))

(declare-fun array_inv!22568 (array!60474) Bool)

(assert (=> start!83478 (array_inv!22568 _keys!1717)))

(declare-fun b!973352 () Bool)

(assert (=> b!973352 (= e!548711 tp_is_empty!22201)))

(declare-fun b!973353 () Bool)

(assert (=> b!973353 (= e!548709 e!548708)))

(declare-fun res!651253 () Bool)

(assert (=> b!973353 (=> (not res!651253) (not e!548708))))

(assert (=> b!973353 (= res!651253 (validKeyInArray!0 lt!432398))))

(assert (=> b!973353 (= lt!432398 (select (arr!29096 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973353 (= lt!432397 (getCurrentListMap!3754 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973354 () Bool)

(declare-fun res!651259 () Bool)

(assert (=> b!973354 (=> (not res!651259) (not e!548709))))

(declare-fun contains!5632 (ListLongMap!13011 (_ BitVec 64)) Bool)

(assert (=> b!973354 (= res!651259 (contains!5632 (getCurrentListMap!3754 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29096 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35311 () Bool)

(declare-fun tp!67189 () Bool)

(assert (=> mapNonEmpty!35311 (= mapRes!35311 (and tp!67189 e!548710))))

(declare-fun mapValue!35311 () ValueCell!10619)

(declare-fun mapKey!35311 () (_ BitVec 32))

(declare-fun mapRest!35311 () (Array (_ BitVec 32) ValueCell!10619))

(assert (=> mapNonEmpty!35311 (= (arr!29097 _values!1425) (store mapRest!35311 mapKey!35311 mapValue!35311))))

(assert (= (and start!83478 res!651256) b!973351))

(assert (= (and b!973351 res!651254) b!973349))

(assert (= (and b!973349 res!651258) b!973344))

(assert (= (and b!973344 res!651255) b!973350))

(assert (= (and b!973350 res!651257) b!973347))

(assert (= (and b!973347 res!651260) b!973354))

(assert (= (and b!973354 res!651259) b!973353))

(assert (= (and b!973353 res!651253) b!973345))

(assert (= (and b!973346 condMapEmpty!35311) mapIsEmpty!35311))

(assert (= (and b!973346 (not condMapEmpty!35311)) mapNonEmpty!35311))

(get-info :version)

(assert (= (and mapNonEmpty!35311 ((_ is ValueCellFull!10619) mapValue!35311)) b!973348))

(assert (= (and b!973346 ((_ is ValueCellFull!10619) mapDefault!35311)) b!973352))

(assert (= start!83478 b!973346))

(declare-fun b_lambda!14481 () Bool)

(assert (=> (not b_lambda!14481) (not b!973345)))

(declare-fun t!28553 () Bool)

(declare-fun tb!6243 () Bool)

(assert (=> (and start!83478 (= defaultEntry!1428 defaultEntry!1428) t!28553) tb!6243))

(declare-fun result!12471 () Bool)

(assert (=> tb!6243 (= result!12471 tp_is_empty!22201)))

(assert (=> b!973345 t!28553))

(declare-fun b_and!30839 () Bool)

(assert (= b_and!30837 (and (=> t!28553 result!12471) b_and!30839)))

(declare-fun m!901145 () Bool)

(assert (=> start!83478 m!901145))

(declare-fun m!901147 () Bool)

(assert (=> start!83478 m!901147))

(declare-fun m!901149 () Bool)

(assert (=> start!83478 m!901149))

(declare-fun m!901151 () Bool)

(assert (=> mapNonEmpty!35311 m!901151))

(declare-fun m!901153 () Bool)

(assert (=> b!973354 m!901153))

(declare-fun m!901155 () Bool)

(assert (=> b!973354 m!901155))

(assert (=> b!973354 m!901153))

(assert (=> b!973354 m!901155))

(declare-fun m!901157 () Bool)

(assert (=> b!973354 m!901157))

(declare-fun m!901159 () Bool)

(assert (=> b!973345 m!901159))

(declare-fun m!901161 () Bool)

(assert (=> b!973345 m!901161))

(declare-fun m!901163 () Bool)

(assert (=> b!973345 m!901163))

(assert (=> b!973345 m!901159))

(assert (=> b!973345 m!901163))

(declare-fun m!901165 () Bool)

(assert (=> b!973345 m!901165))

(assert (=> b!973345 m!901161))

(declare-fun m!901167 () Bool)

(assert (=> b!973345 m!901167))

(declare-fun m!901169 () Bool)

(assert (=> b!973345 m!901169))

(declare-fun m!901171 () Bool)

(assert (=> b!973344 m!901171))

(declare-fun m!901173 () Bool)

(assert (=> b!973353 m!901173))

(declare-fun m!901175 () Bool)

(assert (=> b!973353 m!901175))

(declare-fun m!901177 () Bool)

(assert (=> b!973353 m!901177))

(declare-fun m!901179 () Bool)

(assert (=> b!973349 m!901179))

(assert (=> b!973347 m!901155))

(assert (=> b!973347 m!901155))

(declare-fun m!901181 () Bool)

(assert (=> b!973347 m!901181))

(check-sat (not mapNonEmpty!35311) (not b_next!19303) (not b!973353) b_and!30839 tp_is_empty!22201 (not b_lambda!14481) (not b!973349) (not b!973347) (not start!83478) (not b!973344) (not b!973345) (not b!973354))
(check-sat b_and!30839 (not b_next!19303))
