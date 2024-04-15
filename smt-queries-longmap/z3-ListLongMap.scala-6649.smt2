; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83848 () Bool)

(assert start!83848)

(declare-fun b_free!19675 () Bool)

(declare-fun b_next!19675 () Bool)

(assert (=> start!83848 (= b_free!19675 (not b_next!19675))))

(declare-fun tp!68467 () Bool)

(declare-fun b_and!31413 () Bool)

(assert (=> start!83848 (= tp!68467 b_and!31413)))

(declare-fun b!979617 () Bool)

(declare-fun e!552181 () Bool)

(declare-fun e!552182 () Bool)

(assert (=> b!979617 (= e!552181 (not e!552182))))

(declare-fun res!655645 () Bool)

(assert (=> b!979617 (=> res!655645 e!552182)))

(declare-datatypes ((array!61274 0))(
  ( (array!61275 (arr!29495 (Array (_ BitVec 32) (_ BitVec 64))) (size!29976 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61274)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979617 (= res!655645 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29495 _keys!1544) from!1932)))))

(declare-datatypes ((V!35209 0))(
  ( (V!35210 (val!11385 Int)) )
))
(declare-datatypes ((tuple2!14670 0))(
  ( (tuple2!14671 (_1!7346 (_ BitVec 64)) (_2!7346 V!35209)) )
))
(declare-datatypes ((List!20495 0))(
  ( (Nil!20492) (Cons!20491 (h!21653 tuple2!14670) (t!29117 List!20495)) )
))
(declare-datatypes ((ListLongMap!13357 0))(
  ( (ListLongMap!13358 (toList!6694 List!20495)) )
))
(declare-fun lt!434582 () ListLongMap!13357)

(declare-fun lt!434575 () tuple2!14670)

(declare-fun lt!434574 () ListLongMap!13357)

(declare-fun lt!434577 () tuple2!14670)

(declare-fun +!2994 (ListLongMap!13357 tuple2!14670) ListLongMap!13357)

(assert (=> b!979617 (= (+!2994 lt!434574 lt!434577) (+!2994 lt!434582 lt!434575))))

(declare-fun lt!434576 () ListLongMap!13357)

(assert (=> b!979617 (= lt!434582 (+!2994 lt!434576 lt!434577))))

(declare-fun lt!434583 () V!35209)

(assert (=> b!979617 (= lt!434577 (tuple2!14671 (select (arr!29495 _keys!1544) from!1932) lt!434583))))

(assert (=> b!979617 (= lt!434574 (+!2994 lt!434576 lt!434575))))

(declare-fun minValue!1220 () V!35209)

(assert (=> b!979617 (= lt!434575 (tuple2!14671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32454 0))(
  ( (Unit!32455) )
))
(declare-fun lt!434580 () Unit!32454)

(declare-fun addCommutativeForDiffKeys!598 (ListLongMap!13357 (_ BitVec 64) V!35209 (_ BitVec 64) V!35209) Unit!32454)

(assert (=> b!979617 (= lt!434580 (addCommutativeForDiffKeys!598 lt!434576 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29495 _keys!1544) from!1932) lt!434583))))

(declare-datatypes ((ValueCell!10853 0))(
  ( (ValueCellFull!10853 (v!13946 V!35209)) (EmptyCell!10853) )
))
(declare-datatypes ((array!61276 0))(
  ( (array!61277 (arr!29496 (Array (_ BitVec 32) ValueCell!10853)) (size!29977 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61276)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15300 (ValueCell!10853 V!35209) V!35209)

(declare-fun dynLambda!1744 (Int (_ BitVec 64)) V!35209)

(assert (=> b!979617 (= lt!434583 (get!15300 (select (arr!29496 _values!1278) from!1932) (dynLambda!1744 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434581 () ListLongMap!13357)

(declare-fun lt!434578 () tuple2!14670)

(assert (=> b!979617 (= lt!434576 (+!2994 lt!434581 lt!434578))))

(declare-fun zeroValue!1220 () V!35209)

(assert (=> b!979617 (= lt!434578 (tuple2!14671 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3411 (array!61274 array!61276 (_ BitVec 32) (_ BitVec 32) V!35209 V!35209 (_ BitVec 32) Int) ListLongMap!13357)

(assert (=> b!979617 (= lt!434581 (getCurrentListMapNoExtraKeys!3411 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36032 () Bool)

(declare-fun mapRes!36032 () Bool)

(assert (=> mapIsEmpty!36032 mapRes!36032))

(declare-fun mapNonEmpty!36032 () Bool)

(declare-fun tp!68468 () Bool)

(declare-fun e!552179 () Bool)

(assert (=> mapNonEmpty!36032 (= mapRes!36032 (and tp!68468 e!552179))))

(declare-fun mapRest!36032 () (Array (_ BitVec 32) ValueCell!10853))

(declare-fun mapValue!36032 () ValueCell!10853)

(declare-fun mapKey!36032 () (_ BitVec 32))

(assert (=> mapNonEmpty!36032 (= (arr!29496 _values!1278) (store mapRest!36032 mapKey!36032 mapValue!36032))))

(declare-fun b!979619 () Bool)

(declare-fun res!655647 () Bool)

(assert (=> b!979619 (=> (not res!655647) (not e!552181))))

(assert (=> b!979619 (= res!655647 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29976 _keys!1544))))))

(declare-fun b!979620 () Bool)

(declare-fun res!655646 () Bool)

(assert (=> b!979620 (=> (not res!655646) (not e!552181))))

(assert (=> b!979620 (= res!655646 (and (= (size!29977 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29976 _keys!1544) (size!29977 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979621 () Bool)

(declare-fun e!552178 () Bool)

(declare-fun e!552180 () Bool)

(assert (=> b!979621 (= e!552178 (and e!552180 mapRes!36032))))

(declare-fun condMapEmpty!36032 () Bool)

(declare-fun mapDefault!36032 () ValueCell!10853)

(assert (=> b!979621 (= condMapEmpty!36032 (= (arr!29496 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10853)) mapDefault!36032)))))

(declare-fun b!979622 () Bool)

(declare-fun res!655642 () Bool)

(assert (=> b!979622 (=> (not res!655642) (not e!552181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61274 (_ BitVec 32)) Bool)

(assert (=> b!979622 (= res!655642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979623 () Bool)

(declare-fun res!655643 () Bool)

(assert (=> b!979623 (=> (not res!655643) (not e!552181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979623 (= res!655643 (validKeyInArray!0 (select (arr!29495 _keys!1544) from!1932)))))

(declare-fun b!979618 () Bool)

(assert (=> b!979618 (= e!552182 true)))

(assert (=> b!979618 (= lt!434582 (+!2994 (+!2994 lt!434581 lt!434577) lt!434578))))

(declare-fun lt!434579 () Unit!32454)

(assert (=> b!979618 (= lt!434579 (addCommutativeForDiffKeys!598 lt!434581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29495 _keys!1544) from!1932) lt!434583))))

(declare-fun res!655641 () Bool)

(assert (=> start!83848 (=> (not res!655641) (not e!552181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83848 (= res!655641 (validMask!0 mask!1948))))

(assert (=> start!83848 e!552181))

(assert (=> start!83848 true))

(declare-fun tp_is_empty!22669 () Bool)

(assert (=> start!83848 tp_is_empty!22669))

(declare-fun array_inv!22833 (array!61276) Bool)

(assert (=> start!83848 (and (array_inv!22833 _values!1278) e!552178)))

(assert (=> start!83848 tp!68467))

(declare-fun array_inv!22834 (array!61274) Bool)

(assert (=> start!83848 (array_inv!22834 _keys!1544)))

(declare-fun b!979624 () Bool)

(assert (=> b!979624 (= e!552180 tp_is_empty!22669)))

(declare-fun b!979625 () Bool)

(declare-fun res!655640 () Bool)

(assert (=> b!979625 (=> (not res!655640) (not e!552181))))

(declare-datatypes ((List!20496 0))(
  ( (Nil!20493) (Cons!20492 (h!21654 (_ BitVec 64)) (t!29118 List!20496)) )
))
(declare-fun arrayNoDuplicates!0 (array!61274 (_ BitVec 32) List!20496) Bool)

(assert (=> b!979625 (= res!655640 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20493))))

(declare-fun b!979626 () Bool)

(assert (=> b!979626 (= e!552179 tp_is_empty!22669)))

(declare-fun b!979627 () Bool)

(declare-fun res!655644 () Bool)

(assert (=> b!979627 (=> (not res!655644) (not e!552181))))

(assert (=> b!979627 (= res!655644 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!83848 res!655641) b!979620))

(assert (= (and b!979620 res!655646) b!979622))

(assert (= (and b!979622 res!655642) b!979625))

(assert (= (and b!979625 res!655640) b!979619))

(assert (= (and b!979619 res!655647) b!979623))

(assert (= (and b!979623 res!655643) b!979627))

(assert (= (and b!979627 res!655644) b!979617))

(assert (= (and b!979617 (not res!655645)) b!979618))

(assert (= (and b!979621 condMapEmpty!36032) mapIsEmpty!36032))

(assert (= (and b!979621 (not condMapEmpty!36032)) mapNonEmpty!36032))

(get-info :version)

(assert (= (and mapNonEmpty!36032 ((_ is ValueCellFull!10853) mapValue!36032)) b!979626))

(assert (= (and b!979621 ((_ is ValueCellFull!10853) mapDefault!36032)) b!979624))

(assert (= start!83848 b!979621))

(declare-fun b_lambda!14701 () Bool)

(assert (=> (not b_lambda!14701) (not b!979617)))

(declare-fun t!29116 () Bool)

(declare-fun tb!6473 () Bool)

(assert (=> (and start!83848 (= defaultEntry!1281 defaultEntry!1281) t!29116) tb!6473))

(declare-fun result!12943 () Bool)

(assert (=> tb!6473 (= result!12943 tp_is_empty!22669)))

(assert (=> b!979617 t!29116))

(declare-fun b_and!31415 () Bool)

(assert (= b_and!31413 (and (=> t!29116 result!12943) b_and!31415)))

(declare-fun m!906491 () Bool)

(assert (=> b!979618 m!906491))

(assert (=> b!979618 m!906491))

(declare-fun m!906493 () Bool)

(assert (=> b!979618 m!906493))

(declare-fun m!906495 () Bool)

(assert (=> b!979618 m!906495))

(assert (=> b!979618 m!906495))

(declare-fun m!906497 () Bool)

(assert (=> b!979618 m!906497))

(declare-fun m!906499 () Bool)

(assert (=> b!979625 m!906499))

(assert (=> b!979623 m!906495))

(assert (=> b!979623 m!906495))

(declare-fun m!906501 () Bool)

(assert (=> b!979623 m!906501))

(declare-fun m!906503 () Bool)

(assert (=> mapNonEmpty!36032 m!906503))

(assert (=> b!979617 m!906495))

(declare-fun m!906505 () Bool)

(assert (=> b!979617 m!906505))

(declare-fun m!906507 () Bool)

(assert (=> b!979617 m!906507))

(declare-fun m!906509 () Bool)

(assert (=> b!979617 m!906509))

(declare-fun m!906511 () Bool)

(assert (=> b!979617 m!906511))

(declare-fun m!906513 () Bool)

(assert (=> b!979617 m!906513))

(declare-fun m!906515 () Bool)

(assert (=> b!979617 m!906515))

(declare-fun m!906517 () Bool)

(assert (=> b!979617 m!906517))

(assert (=> b!979617 m!906495))

(declare-fun m!906519 () Bool)

(assert (=> b!979617 m!906519))

(declare-fun m!906521 () Bool)

(assert (=> b!979617 m!906521))

(assert (=> b!979617 m!906505))

(assert (=> b!979617 m!906521))

(declare-fun m!906523 () Bool)

(assert (=> b!979617 m!906523))

(declare-fun m!906525 () Bool)

(assert (=> b!979622 m!906525))

(declare-fun m!906527 () Bool)

(assert (=> start!83848 m!906527))

(declare-fun m!906529 () Bool)

(assert (=> start!83848 m!906529))

(declare-fun m!906531 () Bool)

(assert (=> start!83848 m!906531))

(check-sat (not b_next!19675) (not mapNonEmpty!36032) (not b!979618) (not b_lambda!14701) b_and!31415 (not b!979617) (not b!979623) (not b!979622) (not start!83848) tp_is_empty!22669 (not b!979625))
(check-sat b_and!31415 (not b_next!19675))
