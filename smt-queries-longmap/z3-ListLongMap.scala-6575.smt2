; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83502 () Bool)

(assert start!83502)

(declare-fun b_free!19327 () Bool)

(declare-fun b_next!19327 () Bool)

(assert (=> start!83502 (= b_free!19327 (not b_next!19327))))

(declare-fun tp!67261 () Bool)

(declare-fun b_and!30885 () Bool)

(assert (=> start!83502 (= tp!67261 b_and!30885)))

(declare-fun b!973764 () Bool)

(declare-fun e!548931 () Bool)

(declare-fun e!548926 () Bool)

(assert (=> b!973764 (= e!548931 e!548926)))

(declare-fun res!651545 () Bool)

(assert (=> b!973764 (=> (not res!651545) (not e!548926))))

(declare-datatypes ((array!60522 0))(
  ( (array!60523 (arr!29120 (Array (_ BitVec 32) (_ BitVec 64))) (size!29600 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60522)

(declare-datatypes ((V!34617 0))(
  ( (V!34618 (val!11163 Int)) )
))
(declare-datatypes ((tuple2!14330 0))(
  ( (tuple2!14331 (_1!7176 (_ BitVec 64)) (_2!7176 V!34617)) )
))
(declare-datatypes ((List!20180 0))(
  ( (Nil!20177) (Cons!20176 (h!21344 tuple2!14330) (t!28597 List!20180)) )
))
(declare-datatypes ((ListLongMap!13029 0))(
  ( (ListLongMap!13030 (toList!6530 List!20180)) )
))
(declare-fun lt!432516 () ListLongMap!13029)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5638 (ListLongMap!13029 (_ BitVec 64)) Bool)

(assert (=> b!973764 (= res!651545 (contains!5638 lt!432516 (select (arr!29120 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10631 0))(
  ( (ValueCellFull!10631 (v!13719 V!34617)) (EmptyCell!10631) )
))
(declare-datatypes ((array!60524 0))(
  ( (array!60525 (arr!29121 (Array (_ BitVec 32) ValueCell!10631)) (size!29601 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60524)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34617)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34617)

(declare-fun getCurrentListMap!3763 (array!60522 array!60524 (_ BitVec 32) (_ BitVec 32) V!34617 V!34617 (_ BitVec 32) Int) ListLongMap!13029)

(assert (=> b!973764 (= lt!432516 (getCurrentListMap!3763 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973765 () Bool)

(declare-fun res!651544 () Bool)

(assert (=> b!973765 (=> (not res!651544) (not e!548931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60522 (_ BitVec 32)) Bool)

(assert (=> b!973765 (= res!651544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35347 () Bool)

(declare-fun mapRes!35347 () Bool)

(assert (=> mapIsEmpty!35347 mapRes!35347))

(declare-fun b!973766 () Bool)

(declare-fun res!651547 () Bool)

(assert (=> b!973766 (=> (not res!651547) (not e!548931))))

(assert (=> b!973766 (= res!651547 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29600 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29600 _keys!1717))))))

(declare-fun res!651548 () Bool)

(assert (=> start!83502 (=> (not res!651548) (not e!548931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83502 (= res!651548 (validMask!0 mask!2147))))

(assert (=> start!83502 e!548931))

(assert (=> start!83502 true))

(declare-fun e!548927 () Bool)

(declare-fun array_inv!22583 (array!60524) Bool)

(assert (=> start!83502 (and (array_inv!22583 _values!1425) e!548927)))

(declare-fun tp_is_empty!22225 () Bool)

(assert (=> start!83502 tp_is_empty!22225))

(assert (=> start!83502 tp!67261))

(declare-fun array_inv!22584 (array!60522) Bool)

(assert (=> start!83502 (array_inv!22584 _keys!1717)))

(declare-fun b!973767 () Bool)

(declare-fun e!548932 () Bool)

(assert (=> b!973767 (= e!548926 e!548932)))

(declare-fun res!651542 () Bool)

(assert (=> b!973767 (=> (not res!651542) (not e!548932))))

(declare-fun lt!432518 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973767 (= res!651542 (validKeyInArray!0 lt!432518))))

(assert (=> b!973767 (= lt!432518 (select (arr!29120 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432515 () ListLongMap!13029)

(assert (=> b!973767 (= lt!432515 (getCurrentListMap!3763 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973768 () Bool)

(declare-fun res!651543 () Bool)

(assert (=> b!973768 (=> (not res!651543) (not e!548931))))

(declare-datatypes ((List!20181 0))(
  ( (Nil!20178) (Cons!20177 (h!21345 (_ BitVec 64)) (t!28598 List!20181)) )
))
(declare-fun arrayNoDuplicates!0 (array!60522 (_ BitVec 32) List!20181) Bool)

(assert (=> b!973768 (= res!651543 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20178))))

(declare-fun b!973769 () Bool)

(declare-fun res!651546 () Bool)

(assert (=> b!973769 (=> (not res!651546) (not e!548931))))

(assert (=> b!973769 (= res!651546 (and (= (size!29601 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29600 _keys!1717) (size!29601 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973770 () Bool)

(declare-fun e!548930 () Bool)

(assert (=> b!973770 (= e!548927 (and e!548930 mapRes!35347))))

(declare-fun condMapEmpty!35347 () Bool)

(declare-fun mapDefault!35347 () ValueCell!10631)

(assert (=> b!973770 (= condMapEmpty!35347 (= (arr!29121 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10631)) mapDefault!35347)))))

(declare-fun mapNonEmpty!35347 () Bool)

(declare-fun tp!67260 () Bool)

(declare-fun e!548929 () Bool)

(assert (=> mapNonEmpty!35347 (= mapRes!35347 (and tp!67260 e!548929))))

(declare-fun mapValue!35347 () ValueCell!10631)

(declare-fun mapKey!35347 () (_ BitVec 32))

(declare-fun mapRest!35347 () (Array (_ BitVec 32) ValueCell!10631))

(assert (=> mapNonEmpty!35347 (= (arr!29121 _values!1425) (store mapRest!35347 mapKey!35347 mapValue!35347))))

(declare-fun b!973771 () Bool)

(declare-fun res!651541 () Bool)

(assert (=> b!973771 (=> (not res!651541) (not e!548931))))

(assert (=> b!973771 (= res!651541 (validKeyInArray!0 (select (arr!29120 _keys!1717) i!822)))))

(declare-fun b!973772 () Bool)

(assert (=> b!973772 (= e!548929 tp_is_empty!22225)))

(declare-fun b!973773 () Bool)

(assert (=> b!973773 (= e!548932 (not true))))

(declare-fun lt!432519 () tuple2!14330)

(declare-fun +!2906 (ListLongMap!13029 tuple2!14330) ListLongMap!13029)

(assert (=> b!973773 (contains!5638 (+!2906 lt!432516 lt!432519) (select (arr!29120 _keys!1717) i!822))))

(declare-fun lt!432517 () V!34617)

(declare-datatypes ((Unit!32376 0))(
  ( (Unit!32377) )
))
(declare-fun lt!432514 () Unit!32376)

(declare-fun addStillContains!588 (ListLongMap!13029 (_ BitVec 64) V!34617 (_ BitVec 64)) Unit!32376)

(assert (=> b!973773 (= lt!432514 (addStillContains!588 lt!432516 lt!432518 lt!432517 (select (arr!29120 _keys!1717) i!822)))))

(assert (=> b!973773 (= lt!432515 (+!2906 (getCurrentListMap!3763 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432519))))

(assert (=> b!973773 (= lt!432519 (tuple2!14331 lt!432518 lt!432517))))

(declare-fun get!15107 (ValueCell!10631 V!34617) V!34617)

(declare-fun dynLambda!1703 (Int (_ BitVec 64)) V!34617)

(assert (=> b!973773 (= lt!432517 (get!15107 (select (arr!29121 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1703 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432513 () Unit!32376)

(declare-fun lemmaListMapRecursiveValidKeyArray!262 (array!60522 array!60524 (_ BitVec 32) (_ BitVec 32) V!34617 V!34617 (_ BitVec 32) Int) Unit!32376)

(assert (=> b!973773 (= lt!432513 (lemmaListMapRecursiveValidKeyArray!262 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973774 () Bool)

(assert (=> b!973774 (= e!548930 tp_is_empty!22225)))

(assert (= (and start!83502 res!651548) b!973769))

(assert (= (and b!973769 res!651546) b!973765))

(assert (= (and b!973765 res!651544) b!973768))

(assert (= (and b!973768 res!651543) b!973766))

(assert (= (and b!973766 res!651547) b!973771))

(assert (= (and b!973771 res!651541) b!973764))

(assert (= (and b!973764 res!651545) b!973767))

(assert (= (and b!973767 res!651542) b!973773))

(assert (= (and b!973770 condMapEmpty!35347) mapIsEmpty!35347))

(assert (= (and b!973770 (not condMapEmpty!35347)) mapNonEmpty!35347))

(get-info :version)

(assert (= (and mapNonEmpty!35347 ((_ is ValueCellFull!10631) mapValue!35347)) b!973772))

(assert (= (and b!973770 ((_ is ValueCellFull!10631) mapDefault!35347)) b!973774))

(assert (= start!83502 b!973770))

(declare-fun b_lambda!14505 () Bool)

(assert (=> (not b_lambda!14505) (not b!973773)))

(declare-fun t!28596 () Bool)

(declare-fun tb!6267 () Bool)

(assert (=> (and start!83502 (= defaultEntry!1428 defaultEntry!1428) t!28596) tb!6267))

(declare-fun result!12519 () Bool)

(assert (=> tb!6267 (= result!12519 tp_is_empty!22225)))

(assert (=> b!973773 t!28596))

(declare-fun b_and!30887 () Bool)

(assert (= b_and!30885 (and (=> t!28596 result!12519) b_and!30887)))

(declare-fun m!901601 () Bool)

(assert (=> b!973764 m!901601))

(assert (=> b!973764 m!901601))

(declare-fun m!901603 () Bool)

(assert (=> b!973764 m!901603))

(declare-fun m!901605 () Bool)

(assert (=> b!973764 m!901605))

(assert (=> b!973773 m!901601))

(declare-fun m!901607 () Bool)

(assert (=> b!973773 m!901607))

(declare-fun m!901609 () Bool)

(assert (=> b!973773 m!901609))

(declare-fun m!901611 () Bool)

(assert (=> b!973773 m!901611))

(assert (=> b!973773 m!901601))

(assert (=> b!973773 m!901609))

(assert (=> b!973773 m!901611))

(declare-fun m!901613 () Bool)

(assert (=> b!973773 m!901613))

(declare-fun m!901615 () Bool)

(assert (=> b!973773 m!901615))

(assert (=> b!973773 m!901601))

(declare-fun m!901617 () Bool)

(assert (=> b!973773 m!901617))

(declare-fun m!901619 () Bool)

(assert (=> b!973773 m!901619))

(declare-fun m!901621 () Bool)

(assert (=> b!973773 m!901621))

(assert (=> b!973773 m!901619))

(assert (=> b!973773 m!901615))

(declare-fun m!901623 () Bool)

(assert (=> b!973773 m!901623))

(declare-fun m!901625 () Bool)

(assert (=> start!83502 m!901625))

(declare-fun m!901627 () Bool)

(assert (=> start!83502 m!901627))

(declare-fun m!901629 () Bool)

(assert (=> start!83502 m!901629))

(declare-fun m!901631 () Bool)

(assert (=> b!973767 m!901631))

(declare-fun m!901633 () Bool)

(assert (=> b!973767 m!901633))

(declare-fun m!901635 () Bool)

(assert (=> b!973767 m!901635))

(declare-fun m!901637 () Bool)

(assert (=> b!973768 m!901637))

(declare-fun m!901639 () Bool)

(assert (=> b!973765 m!901639))

(declare-fun m!901641 () Bool)

(assert (=> mapNonEmpty!35347 m!901641))

(assert (=> b!973771 m!901601))

(assert (=> b!973771 m!901601))

(declare-fun m!901643 () Bool)

(assert (=> b!973771 m!901643))

(check-sat (not mapNonEmpty!35347) (not b_lambda!14505) (not b!973764) (not b!973771) (not b!973765) (not b!973767) b_and!30887 tp_is_empty!22225 (not start!83502) (not b!973768) (not b!973773) (not b_next!19327))
(check-sat b_and!30887 (not b_next!19327))
