; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83496 () Bool)

(assert start!83496)

(declare-fun b_free!19321 () Bool)

(declare-fun b_next!19321 () Bool)

(assert (=> start!83496 (= b_free!19321 (not b_next!19321))))

(declare-fun tp!67243 () Bool)

(declare-fun b_and!30873 () Bool)

(assert (=> start!83496 (= tp!67243 b_and!30873)))

(declare-fun res!651472 () Bool)

(declare-fun e!548870 () Bool)

(assert (=> start!83496 (=> (not res!651472) (not e!548870))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83496 (= res!651472 (validMask!0 mask!2147))))

(assert (=> start!83496 e!548870))

(assert (=> start!83496 true))

(declare-datatypes ((V!34609 0))(
  ( (V!34610 (val!11160 Int)) )
))
(declare-datatypes ((ValueCell!10628 0))(
  ( (ValueCellFull!10628 (v!13716 V!34609)) (EmptyCell!10628) )
))
(declare-datatypes ((array!60510 0))(
  ( (array!60511 (arr!29114 (Array (_ BitVec 32) ValueCell!10628)) (size!29594 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60510)

(declare-fun e!548871 () Bool)

(declare-fun array_inv!22579 (array!60510) Bool)

(assert (=> start!83496 (and (array_inv!22579 _values!1425) e!548871)))

(declare-fun tp_is_empty!22219 () Bool)

(assert (=> start!83496 tp_is_empty!22219))

(assert (=> start!83496 tp!67243))

(declare-datatypes ((array!60512 0))(
  ( (array!60513 (arr!29115 (Array (_ BitVec 32) (_ BitVec 64))) (size!29595 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60512)

(declare-fun array_inv!22580 (array!60512) Bool)

(assert (=> start!83496 (array_inv!22580 _keys!1717)))

(declare-fun b!973659 () Bool)

(declare-fun e!548874 () Bool)

(declare-fun mapRes!35338 () Bool)

(assert (=> b!973659 (= e!548871 (and e!548874 mapRes!35338))))

(declare-fun condMapEmpty!35338 () Bool)

(declare-fun mapDefault!35338 () ValueCell!10628)

(assert (=> b!973659 (= condMapEmpty!35338 (= (arr!29114 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10628)) mapDefault!35338)))))

(declare-fun b!973660 () Bool)

(declare-fun res!651475 () Bool)

(assert (=> b!973660 (=> (not res!651475) (not e!548870))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973660 (= res!651475 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29595 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29595 _keys!1717))))))

(declare-fun mapIsEmpty!35338 () Bool)

(assert (=> mapIsEmpty!35338 mapRes!35338))

(declare-fun b!973661 () Bool)

(declare-fun res!651470 () Bool)

(assert (=> b!973661 (=> (not res!651470) (not e!548870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60512 (_ BitVec 32)) Bool)

(assert (=> b!973661 (= res!651470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973662 () Bool)

(declare-fun res!651473 () Bool)

(assert (=> b!973662 (=> (not res!651473) (not e!548870))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!973662 (= res!651473 (and (= (size!29594 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29595 _keys!1717) (size!29594 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973663 () Bool)

(declare-fun res!651476 () Bool)

(assert (=> b!973663 (=> (not res!651476) (not e!548870))))

(declare-fun zeroValue!1367 () V!34609)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34609)

(declare-datatypes ((tuple2!14326 0))(
  ( (tuple2!14327 (_1!7174 (_ BitVec 64)) (_2!7174 V!34609)) )
))
(declare-datatypes ((List!20175 0))(
  ( (Nil!20172) (Cons!20171 (h!21339 tuple2!14326) (t!28586 List!20175)) )
))
(declare-datatypes ((ListLongMap!13025 0))(
  ( (ListLongMap!13026 (toList!6528 List!20175)) )
))
(declare-fun contains!5637 (ListLongMap!13025 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3761 (array!60512 array!60510 (_ BitVec 32) (_ BitVec 32) V!34609 V!34609 (_ BitVec 32) Int) ListLongMap!13025)

(assert (=> b!973663 (= res!651476 (contains!5637 (getCurrentListMap!3761 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29115 _keys!1717) i!822)))))

(declare-fun b!973664 () Bool)

(declare-fun res!651474 () Bool)

(assert (=> b!973664 (=> (not res!651474) (not e!548870))))

(declare-datatypes ((List!20176 0))(
  ( (Nil!20173) (Cons!20172 (h!21340 (_ BitVec 64)) (t!28587 List!20176)) )
))
(declare-fun arrayNoDuplicates!0 (array!60512 (_ BitVec 32) List!20176) Bool)

(assert (=> b!973664 (= res!651474 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20173))))

(declare-fun b!973665 () Bool)

(declare-fun e!548875 () Bool)

(assert (=> b!973665 (= e!548870 e!548875)))

(declare-fun res!651471 () Bool)

(assert (=> b!973665 (=> (not res!651471) (not e!548875))))

(declare-fun lt!432478 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973665 (= res!651471 (validKeyInArray!0 lt!432478))))

(assert (=> b!973665 (= lt!432478 (select (arr!29115 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432479 () ListLongMap!13025)

(assert (=> b!973665 (= lt!432479 (getCurrentListMap!3761 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973666 () Bool)

(declare-fun res!651469 () Bool)

(assert (=> b!973666 (=> (not res!651469) (not e!548870))))

(assert (=> b!973666 (= res!651469 (validKeyInArray!0 (select (arr!29115 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35338 () Bool)

(declare-fun tp!67242 () Bool)

(declare-fun e!548873 () Bool)

(assert (=> mapNonEmpty!35338 (= mapRes!35338 (and tp!67242 e!548873))))

(declare-fun mapKey!35338 () (_ BitVec 32))

(declare-fun mapRest!35338 () (Array (_ BitVec 32) ValueCell!10628))

(declare-fun mapValue!35338 () ValueCell!10628)

(assert (=> mapNonEmpty!35338 (= (arr!29114 _values!1425) (store mapRest!35338 mapKey!35338 mapValue!35338))))

(declare-fun b!973667 () Bool)

(assert (=> b!973667 (= e!548873 tp_is_empty!22219)))

(declare-fun b!973668 () Bool)

(assert (=> b!973668 (= e!548875 (not true))))

(declare-fun +!2904 (ListLongMap!13025 tuple2!14326) ListLongMap!13025)

(declare-fun get!15103 (ValueCell!10628 V!34609) V!34609)

(declare-fun dynLambda!1701 (Int (_ BitVec 64)) V!34609)

(assert (=> b!973668 (= lt!432479 (+!2904 (getCurrentListMap!3761 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14327 lt!432478 (get!15103 (select (arr!29114 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32372 0))(
  ( (Unit!32373) )
))
(declare-fun lt!432480 () Unit!32372)

(declare-fun lemmaListMapRecursiveValidKeyArray!260 (array!60512 array!60510 (_ BitVec 32) (_ BitVec 32) V!34609 V!34609 (_ BitVec 32) Int) Unit!32372)

(assert (=> b!973668 (= lt!432480 (lemmaListMapRecursiveValidKeyArray!260 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973669 () Bool)

(assert (=> b!973669 (= e!548874 tp_is_empty!22219)))

(assert (= (and start!83496 res!651472) b!973662))

(assert (= (and b!973662 res!651473) b!973661))

(assert (= (and b!973661 res!651470) b!973664))

(assert (= (and b!973664 res!651474) b!973660))

(assert (= (and b!973660 res!651475) b!973666))

(assert (= (and b!973666 res!651469) b!973663))

(assert (= (and b!973663 res!651476) b!973665))

(assert (= (and b!973665 res!651471) b!973668))

(assert (= (and b!973659 condMapEmpty!35338) mapIsEmpty!35338))

(assert (= (and b!973659 (not condMapEmpty!35338)) mapNonEmpty!35338))

(get-info :version)

(assert (= (and mapNonEmpty!35338 ((_ is ValueCellFull!10628) mapValue!35338)) b!973667))

(assert (= (and b!973659 ((_ is ValueCellFull!10628) mapDefault!35338)) b!973669))

(assert (= start!83496 b!973659))

(declare-fun b_lambda!14499 () Bool)

(assert (=> (not b_lambda!14499) (not b!973668)))

(declare-fun t!28585 () Bool)

(declare-fun tb!6261 () Bool)

(assert (=> (and start!83496 (= defaultEntry!1428 defaultEntry!1428) t!28585) tb!6261))

(declare-fun result!12507 () Bool)

(assert (=> tb!6261 (= result!12507 tp_is_empty!22219)))

(assert (=> b!973668 t!28585))

(declare-fun b_and!30875 () Bool)

(assert (= b_and!30873 (and (=> t!28585 result!12507) b_and!30875)))

(declare-fun m!901487 () Bool)

(assert (=> start!83496 m!901487))

(declare-fun m!901489 () Bool)

(assert (=> start!83496 m!901489))

(declare-fun m!901491 () Bool)

(assert (=> start!83496 m!901491))

(declare-fun m!901493 () Bool)

(assert (=> b!973668 m!901493))

(declare-fun m!901495 () Bool)

(assert (=> b!973668 m!901495))

(declare-fun m!901497 () Bool)

(assert (=> b!973668 m!901497))

(assert (=> b!973668 m!901495))

(declare-fun m!901499 () Bool)

(assert (=> b!973668 m!901499))

(assert (=> b!973668 m!901493))

(assert (=> b!973668 m!901497))

(declare-fun m!901501 () Bool)

(assert (=> b!973668 m!901501))

(declare-fun m!901503 () Bool)

(assert (=> b!973668 m!901503))

(declare-fun m!901505 () Bool)

(assert (=> b!973663 m!901505))

(declare-fun m!901507 () Bool)

(assert (=> b!973663 m!901507))

(assert (=> b!973663 m!901505))

(assert (=> b!973663 m!901507))

(declare-fun m!901509 () Bool)

(assert (=> b!973663 m!901509))

(declare-fun m!901511 () Bool)

(assert (=> mapNonEmpty!35338 m!901511))

(declare-fun m!901513 () Bool)

(assert (=> b!973665 m!901513))

(declare-fun m!901515 () Bool)

(assert (=> b!973665 m!901515))

(declare-fun m!901517 () Bool)

(assert (=> b!973665 m!901517))

(assert (=> b!973666 m!901507))

(assert (=> b!973666 m!901507))

(declare-fun m!901519 () Bool)

(assert (=> b!973666 m!901519))

(declare-fun m!901521 () Bool)

(assert (=> b!973661 m!901521))

(declare-fun m!901523 () Bool)

(assert (=> b!973664 m!901523))

(check-sat b_and!30875 (not start!83496) (not b!973663) (not b!973665) (not b!973668) (not b_next!19321) (not b!973666) (not mapNonEmpty!35338) (not b!973664) tp_is_empty!22219 (not b!973661) (not b_lambda!14499))
(check-sat b_and!30875 (not b_next!19321))
