; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83256 () Bool)

(assert start!83256)

(declare-fun b_free!19267 () Bool)

(declare-fun b_next!19267 () Bool)

(assert (=> start!83256 (= b_free!19267 (not b_next!19267))))

(declare-fun tp!67080 () Bool)

(declare-fun b_and!30729 () Bool)

(assert (=> start!83256 (= tp!67080 b_and!30729)))

(declare-fun mapNonEmpty!35257 () Bool)

(declare-fun mapRes!35257 () Bool)

(declare-fun tp!67081 () Bool)

(declare-fun e!547655 () Bool)

(assert (=> mapNonEmpty!35257 (= mapRes!35257 (and tp!67081 e!547655))))

(declare-datatypes ((V!34537 0))(
  ( (V!34538 (val!11133 Int)) )
))
(declare-datatypes ((ValueCell!10601 0))(
  ( (ValueCellFull!10601 (v!13691 V!34537)) (EmptyCell!10601) )
))
(declare-datatypes ((array!60312 0))(
  ( (array!60313 (arr!29020 (Array (_ BitVec 32) ValueCell!10601)) (size!29501 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60312)

(declare-fun mapKey!35257 () (_ BitVec 32))

(declare-fun mapRest!35257 () (Array (_ BitVec 32) ValueCell!10601))

(declare-fun mapValue!35257 () ValueCell!10601)

(assert (=> mapNonEmpty!35257 (= (arr!29020 _values!1425) (store mapRest!35257 mapKey!35257 mapValue!35257))))

(declare-fun b!971572 () Bool)

(declare-fun res!650374 () Bool)

(declare-fun e!547654 () Bool)

(assert (=> b!971572 (=> (not res!650374) (not e!547654))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60314 0))(
  ( (array!60315 (arr!29021 (Array (_ BitVec 32) (_ BitVec 64))) (size!29502 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60314)

(assert (=> b!971572 (= res!650374 (and (= (size!29501 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29502 _keys!1717) (size!29501 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971573 () Bool)

(declare-fun res!650373 () Bool)

(assert (=> b!971573 (=> (not res!650373) (not e!547654))))

(declare-datatypes ((List!20171 0))(
  ( (Nil!20168) (Cons!20167 (h!21329 (_ BitVec 64)) (t!28527 List!20171)) )
))
(declare-fun arrayNoDuplicates!0 (array!60314 (_ BitVec 32) List!20171) Bool)

(assert (=> b!971573 (= res!650373 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20168))))

(declare-fun b!971574 () Bool)

(declare-fun e!547658 () Bool)

(assert (=> b!971574 (= e!547654 e!547658)))

(declare-fun res!650369 () Bool)

(assert (=> b!971574 (=> (not res!650369) (not e!547658))))

(declare-fun lt!431640 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971574 (= res!650369 (validKeyInArray!0 lt!431640))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!971574 (= lt!431640 (select (arr!29021 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun zeroValue!1367 () V!34537)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34537)

(declare-datatypes ((tuple2!14356 0))(
  ( (tuple2!14357 (_1!7189 (_ BitVec 64)) (_2!7189 V!34537)) )
))
(declare-datatypes ((List!20172 0))(
  ( (Nil!20169) (Cons!20168 (h!21330 tuple2!14356) (t!28528 List!20172)) )
))
(declare-datatypes ((ListLongMap!13043 0))(
  ( (ListLongMap!13044 (toList!6537 List!20172)) )
))
(declare-fun lt!431638 () ListLongMap!13043)

(declare-fun getCurrentListMap!3699 (array!60314 array!60312 (_ BitVec 32) (_ BitVec 32) V!34537 V!34537 (_ BitVec 32) Int) ListLongMap!13043)

(assert (=> b!971574 (= lt!431638 (getCurrentListMap!3699 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971575 () Bool)

(declare-fun tp_is_empty!22165 () Bool)

(assert (=> b!971575 (= e!547655 tp_is_empty!22165)))

(declare-fun b!971576 () Bool)

(declare-fun e!547659 () Bool)

(declare-fun e!547657 () Bool)

(assert (=> b!971576 (= e!547659 (and e!547657 mapRes!35257))))

(declare-fun condMapEmpty!35257 () Bool)

(declare-fun mapDefault!35257 () ValueCell!10601)

(assert (=> b!971576 (= condMapEmpty!35257 (= (arr!29020 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10601)) mapDefault!35257)))))

(declare-fun b!971577 () Bool)

(assert (=> b!971577 (= e!547657 tp_is_empty!22165)))

(declare-fun b!971578 () Bool)

(assert (=> b!971578 (= e!547658 (not true))))

(declare-fun +!2893 (ListLongMap!13043 tuple2!14356) ListLongMap!13043)

(declare-fun get!15034 (ValueCell!10601 V!34537) V!34537)

(declare-fun dynLambda!1649 (Int (_ BitVec 64)) V!34537)

(assert (=> b!971578 (= lt!431638 (+!2893 (getCurrentListMap!3699 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14357 lt!431640 (get!15034 (select (arr!29020 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1649 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32238 0))(
  ( (Unit!32239) )
))
(declare-fun lt!431639 () Unit!32238)

(declare-fun lemmaListMapRecursiveValidKeyArray!233 (array!60314 array!60312 (_ BitVec 32) (_ BitVec 32) V!34537 V!34537 (_ BitVec 32) Int) Unit!32238)

(assert (=> b!971578 (= lt!431639 (lemmaListMapRecursiveValidKeyArray!233 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971579 () Bool)

(declare-fun res!650367 () Bool)

(assert (=> b!971579 (=> (not res!650367) (not e!547654))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971579 (= res!650367 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29502 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29502 _keys!1717))))))

(declare-fun res!650368 () Bool)

(assert (=> start!83256 (=> (not res!650368) (not e!547654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83256 (= res!650368 (validMask!0 mask!2147))))

(assert (=> start!83256 e!547654))

(assert (=> start!83256 true))

(declare-fun array_inv!22517 (array!60312) Bool)

(assert (=> start!83256 (and (array_inv!22517 _values!1425) e!547659)))

(assert (=> start!83256 tp_is_empty!22165))

(assert (=> start!83256 tp!67080))

(declare-fun array_inv!22518 (array!60314) Bool)

(assert (=> start!83256 (array_inv!22518 _keys!1717)))

(declare-fun b!971580 () Bool)

(declare-fun res!650370 () Bool)

(assert (=> b!971580 (=> (not res!650370) (not e!547654))))

(assert (=> b!971580 (= res!650370 (validKeyInArray!0 (select (arr!29021 _keys!1717) i!822)))))

(declare-fun b!971581 () Bool)

(declare-fun res!650372 () Bool)

(assert (=> b!971581 (=> (not res!650372) (not e!547654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60314 (_ BitVec 32)) Bool)

(assert (=> b!971581 (= res!650372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35257 () Bool)

(assert (=> mapIsEmpty!35257 mapRes!35257))

(declare-fun b!971582 () Bool)

(declare-fun res!650371 () Bool)

(assert (=> b!971582 (=> (not res!650371) (not e!547654))))

(declare-fun contains!5580 (ListLongMap!13043 (_ BitVec 64)) Bool)

(assert (=> b!971582 (= res!650371 (contains!5580 (getCurrentListMap!3699 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29021 _keys!1717) i!822)))))

(assert (= (and start!83256 res!650368) b!971572))

(assert (= (and b!971572 res!650374) b!971581))

(assert (= (and b!971581 res!650372) b!971573))

(assert (= (and b!971573 res!650373) b!971579))

(assert (= (and b!971579 res!650367) b!971580))

(assert (= (and b!971580 res!650370) b!971582))

(assert (= (and b!971582 res!650371) b!971574))

(assert (= (and b!971574 res!650369) b!971578))

(assert (= (and b!971576 condMapEmpty!35257) mapIsEmpty!35257))

(assert (= (and b!971576 (not condMapEmpty!35257)) mapNonEmpty!35257))

(get-info :version)

(assert (= (and mapNonEmpty!35257 ((_ is ValueCellFull!10601) mapValue!35257)) b!971575))

(assert (= (and b!971576 ((_ is ValueCellFull!10601) mapDefault!35257)) b!971577))

(assert (= start!83256 b!971576))

(declare-fun b_lambda!14413 () Bool)

(assert (=> (not b_lambda!14413) (not b!971578)))

(declare-fun t!28526 () Bool)

(declare-fun tb!6207 () Bool)

(assert (=> (and start!83256 (= defaultEntry!1428 defaultEntry!1428) t!28526) tb!6207))

(declare-fun result!12399 () Bool)

(assert (=> tb!6207 (= result!12399 tp_is_empty!22165)))

(assert (=> b!971578 t!28526))

(declare-fun b_and!30731 () Bool)

(assert (= b_and!30729 (and (=> t!28526 result!12399) b_and!30731)))

(declare-fun m!898409 () Bool)

(assert (=> b!971578 m!898409))

(declare-fun m!898411 () Bool)

(assert (=> b!971578 m!898411))

(declare-fun m!898413 () Bool)

(assert (=> b!971578 m!898413))

(assert (=> b!971578 m!898411))

(declare-fun m!898415 () Bool)

(assert (=> b!971578 m!898415))

(assert (=> b!971578 m!898409))

(assert (=> b!971578 m!898413))

(declare-fun m!898417 () Bool)

(assert (=> b!971578 m!898417))

(declare-fun m!898419 () Bool)

(assert (=> b!971578 m!898419))

(declare-fun m!898421 () Bool)

(assert (=> b!971574 m!898421))

(declare-fun m!898423 () Bool)

(assert (=> b!971574 m!898423))

(declare-fun m!898425 () Bool)

(assert (=> b!971574 m!898425))

(declare-fun m!898427 () Bool)

(assert (=> mapNonEmpty!35257 m!898427))

(declare-fun m!898429 () Bool)

(assert (=> b!971580 m!898429))

(assert (=> b!971580 m!898429))

(declare-fun m!898431 () Bool)

(assert (=> b!971580 m!898431))

(declare-fun m!898433 () Bool)

(assert (=> b!971581 m!898433))

(declare-fun m!898435 () Bool)

(assert (=> start!83256 m!898435))

(declare-fun m!898437 () Bool)

(assert (=> start!83256 m!898437))

(declare-fun m!898439 () Bool)

(assert (=> start!83256 m!898439))

(declare-fun m!898441 () Bool)

(assert (=> b!971582 m!898441))

(assert (=> b!971582 m!898429))

(assert (=> b!971582 m!898441))

(assert (=> b!971582 m!898429))

(declare-fun m!898443 () Bool)

(assert (=> b!971582 m!898443))

(declare-fun m!898445 () Bool)

(assert (=> b!971573 m!898445))

(check-sat (not b!971581) (not b!971582) (not start!83256) (not b_next!19267) (not b_lambda!14413) (not b!971578) tp_is_empty!22165 b_and!30731 (not b!971573) (not b!971580) (not mapNonEmpty!35257) (not b!971574))
(check-sat b_and!30731 (not b_next!19267))
