; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109718 () Bool)

(assert start!109718)

(declare-fun b_free!29151 () Bool)

(declare-fun b_next!29151 () Bool)

(assert (=> start!109718 (= b_free!29151 (not b_next!29151))))

(declare-fun tp!102581 () Bool)

(declare-fun b_and!47253 () Bool)

(assert (=> start!109718 (= tp!102581 b_and!47253)))

(declare-fun b!1299564 () Bool)

(declare-fun res!863605 () Bool)

(declare-fun e!741389 () Bool)

(assert (=> b!1299564 (=> (not res!863605) (not e!741389))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86590 0))(
  ( (array!86591 (arr!41793 (Array (_ BitVec 32) (_ BitVec 64))) (size!42343 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86590)

(assert (=> b!1299564 (= res!863605 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42343 _keys!1741))))))

(declare-fun b!1299565 () Bool)

(declare-fun res!863603 () Bool)

(assert (=> b!1299565 (=> (not res!863603) (not e!741389))))

(declare-datatypes ((V!51491 0))(
  ( (V!51492 (val!17470 Int)) )
))
(declare-fun minValue!1387 () V!51491)

(declare-fun zeroValue!1387 () V!51491)

(declare-datatypes ((ValueCell!16497 0))(
  ( (ValueCellFull!16497 (v!20076 V!51491)) (EmptyCell!16497) )
))
(declare-datatypes ((array!86592 0))(
  ( (array!86593 (arr!41794 (Array (_ BitVec 32) ValueCell!16497)) (size!42344 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86592)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22532 0))(
  ( (tuple2!22533 (_1!11277 (_ BitVec 64)) (_2!11277 V!51491)) )
))
(declare-datatypes ((List!29663 0))(
  ( (Nil!29660) (Cons!29659 (h!30868 tuple2!22532) (t!43233 List!29663)) )
))
(declare-datatypes ((ListLongMap!20189 0))(
  ( (ListLongMap!20190 (toList!10110 List!29663)) )
))
(declare-fun contains!8232 (ListLongMap!20189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5138 (array!86590 array!86592 (_ BitVec 32) (_ BitVec 32) V!51491 V!51491 (_ BitVec 32) Int) ListLongMap!20189)

(assert (=> b!1299565 (= res!863603 (contains!8232 (getCurrentListMap!5138 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299566 () Bool)

(declare-fun res!863604 () Bool)

(assert (=> b!1299566 (=> (not res!863604) (not e!741389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299566 (= res!863604 (validKeyInArray!0 (select (arr!41793 _keys!1741) from!2144)))))

(declare-fun res!863606 () Bool)

(assert (=> start!109718 (=> (not res!863606) (not e!741389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109718 (= res!863606 (validMask!0 mask!2175))))

(assert (=> start!109718 e!741389))

(declare-fun tp_is_empty!34791 () Bool)

(assert (=> start!109718 tp_is_empty!34791))

(assert (=> start!109718 true))

(declare-fun e!741391 () Bool)

(declare-fun array_inv!31629 (array!86592) Bool)

(assert (=> start!109718 (and (array_inv!31629 _values!1445) e!741391)))

(declare-fun array_inv!31630 (array!86590) Bool)

(assert (=> start!109718 (array_inv!31630 _keys!1741)))

(assert (=> start!109718 tp!102581))

(declare-fun b!1299567 () Bool)

(declare-fun res!863609 () Bool)

(assert (=> b!1299567 (=> (not res!863609) (not e!741389))))

(declare-datatypes ((List!29664 0))(
  ( (Nil!29661) (Cons!29660 (h!30869 (_ BitVec 64)) (t!43234 List!29664)) )
))
(declare-fun arrayNoDuplicates!0 (array!86590 (_ BitVec 32) List!29664) Bool)

(assert (=> b!1299567 (= res!863609 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29661))))

(declare-fun b!1299568 () Bool)

(declare-fun res!863610 () Bool)

(assert (=> b!1299568 (=> (not res!863610) (not e!741389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86590 (_ BitVec 32)) Bool)

(assert (=> b!1299568 (= res!863610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299569 () Bool)

(declare-fun e!741387 () Bool)

(assert (=> b!1299569 (= e!741387 tp_is_empty!34791)))

(declare-fun b!1299570 () Bool)

(declare-fun res!863607 () Bool)

(assert (=> b!1299570 (=> (not res!863607) (not e!741389))))

(assert (=> b!1299570 (= res!863607 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1299571 () Bool)

(declare-fun mapRes!53756 () Bool)

(assert (=> b!1299571 (= e!741391 (and e!741387 mapRes!53756))))

(declare-fun condMapEmpty!53756 () Bool)

(declare-fun mapDefault!53756 () ValueCell!16497)

(assert (=> b!1299571 (= condMapEmpty!53756 (= (arr!41794 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16497)) mapDefault!53756)))))

(declare-fun b!1299572 () Bool)

(declare-fun res!863608 () Bool)

(assert (=> b!1299572 (=> (not res!863608) (not e!741389))))

(assert (=> b!1299572 (= res!863608 (and (= (size!42344 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42343 _keys!1741) (size!42344 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53756 () Bool)

(assert (=> mapIsEmpty!53756 mapRes!53756))

(declare-fun b!1299573 () Bool)

(declare-fun e!741390 () Bool)

(assert (=> b!1299573 (= e!741390 tp_is_empty!34791)))

(declare-fun b!1299574 () Bool)

(assert (=> b!1299574 (= e!741389 false)))

(declare-fun lt!581097 () Bool)

(declare-fun +!4443 (ListLongMap!20189 tuple2!22532) ListLongMap!20189)

(declare-fun getCurrentListMapNoExtraKeys!6074 (array!86590 array!86592 (_ BitVec 32) (_ BitVec 32) V!51491 V!51491 (_ BitVec 32) Int) ListLongMap!20189)

(assert (=> b!1299574 (= lt!581097 (contains!8232 (+!4443 (+!4443 (getCurrentListMapNoExtraKeys!6074 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1299575 () Bool)

(declare-fun res!863602 () Bool)

(assert (=> b!1299575 (=> (not res!863602) (not e!741389))))

(assert (=> b!1299575 (= res!863602 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42343 _keys!1741))))))

(declare-fun mapNonEmpty!53756 () Bool)

(declare-fun tp!102580 () Bool)

(assert (=> mapNonEmpty!53756 (= mapRes!53756 (and tp!102580 e!741390))))

(declare-fun mapRest!53756 () (Array (_ BitVec 32) ValueCell!16497))

(declare-fun mapKey!53756 () (_ BitVec 32))

(declare-fun mapValue!53756 () ValueCell!16497)

(assert (=> mapNonEmpty!53756 (= (arr!41794 _values!1445) (store mapRest!53756 mapKey!53756 mapValue!53756))))

(assert (= (and start!109718 res!863606) b!1299572))

(assert (= (and b!1299572 res!863608) b!1299568))

(assert (= (and b!1299568 res!863610) b!1299567))

(assert (= (and b!1299567 res!863609) b!1299564))

(assert (= (and b!1299564 res!863605) b!1299565))

(assert (= (and b!1299565 res!863603) b!1299575))

(assert (= (and b!1299575 res!863602) b!1299566))

(assert (= (and b!1299566 res!863604) b!1299570))

(assert (= (and b!1299570 res!863607) b!1299574))

(assert (= (and b!1299571 condMapEmpty!53756) mapIsEmpty!53756))

(assert (= (and b!1299571 (not condMapEmpty!53756)) mapNonEmpty!53756))

(get-info :version)

(assert (= (and mapNonEmpty!53756 ((_ is ValueCellFull!16497) mapValue!53756)) b!1299573))

(assert (= (and b!1299571 ((_ is ValueCellFull!16497) mapDefault!53756)) b!1299569))

(assert (= start!109718 b!1299571))

(declare-fun m!1190709 () Bool)

(assert (=> b!1299568 m!1190709))

(declare-fun m!1190711 () Bool)

(assert (=> b!1299567 m!1190711))

(declare-fun m!1190713 () Bool)

(assert (=> mapNonEmpty!53756 m!1190713))

(declare-fun m!1190715 () Bool)

(assert (=> b!1299574 m!1190715))

(assert (=> b!1299574 m!1190715))

(declare-fun m!1190717 () Bool)

(assert (=> b!1299574 m!1190717))

(assert (=> b!1299574 m!1190717))

(declare-fun m!1190719 () Bool)

(assert (=> b!1299574 m!1190719))

(assert (=> b!1299574 m!1190719))

(declare-fun m!1190721 () Bool)

(assert (=> b!1299574 m!1190721))

(declare-fun m!1190723 () Bool)

(assert (=> b!1299566 m!1190723))

(assert (=> b!1299566 m!1190723))

(declare-fun m!1190725 () Bool)

(assert (=> b!1299566 m!1190725))

(declare-fun m!1190727 () Bool)

(assert (=> b!1299565 m!1190727))

(assert (=> b!1299565 m!1190727))

(declare-fun m!1190729 () Bool)

(assert (=> b!1299565 m!1190729))

(declare-fun m!1190731 () Bool)

(assert (=> start!109718 m!1190731))

(declare-fun m!1190733 () Bool)

(assert (=> start!109718 m!1190733))

(declare-fun m!1190735 () Bool)

(assert (=> start!109718 m!1190735))

(check-sat (not mapNonEmpty!53756) (not b!1299574) tp_is_empty!34791 (not b!1299568) (not b_next!29151) (not start!109718) (not b!1299565) b_and!47253 (not b!1299567) (not b!1299566))
(check-sat b_and!47253 (not b_next!29151))
