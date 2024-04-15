; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83526 () Bool)

(assert start!83526)

(declare-fun b_free!19531 () Bool)

(declare-fun b_next!19531 () Bool)

(assert (=> start!83526 (= b_free!19531 (not b_next!19531))))

(declare-fun tp!67881 () Bool)

(declare-fun b_and!31131 () Bool)

(assert (=> start!83526 (= tp!67881 b_and!31131)))

(declare-fun b!975949 () Bool)

(declare-fun e!549993 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975949 (= e!549993 (not (bvsge i!822 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!60830 0))(
  ( (array!60831 (arr!29279 (Array (_ BitVec 32) (_ BitVec 64))) (size!29760 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60830)

(declare-datatypes ((V!34897 0))(
  ( (V!34898 (val!11268 Int)) )
))
(declare-datatypes ((tuple2!14558 0))(
  ( (tuple2!14559 (_1!7290 (_ BitVec 64)) (_2!7290 V!34897)) )
))
(declare-fun lt!432780 () tuple2!14558)

(declare-datatypes ((List!20364 0))(
  ( (Nil!20361) (Cons!20360 (h!21522 tuple2!14558) (t!28858 List!20364)) )
))
(declare-datatypes ((ListLongMap!13245 0))(
  ( (ListLongMap!13246 (toList!6638 List!20364)) )
))
(declare-fun lt!432782 () ListLongMap!13245)

(declare-fun contains!5665 (ListLongMap!13245 (_ BitVec 64)) Bool)

(declare-fun +!2941 (ListLongMap!13245 tuple2!14558) ListLongMap!13245)

(assert (=> b!975949 (contains!5665 (+!2941 lt!432782 lt!432780) (select (arr!29279 _keys!1717) i!822))))

(declare-fun lt!432781 () V!34897)

(declare-datatypes ((Unit!32334 0))(
  ( (Unit!32335) )
))
(declare-fun lt!432785 () Unit!32334)

(declare-fun lt!432783 () (_ BitVec 64))

(declare-fun addStillContains!602 (ListLongMap!13245 (_ BitVec 64) V!34897 (_ BitVec 64)) Unit!32334)

(assert (=> b!975949 (= lt!432785 (addStillContains!602 lt!432782 lt!432783 lt!432781 (select (arr!29279 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun lt!432784 () ListLongMap!13245)

(declare-datatypes ((ValueCell!10736 0))(
  ( (ValueCellFull!10736 (v!13826 V!34897)) (EmptyCell!10736) )
))
(declare-datatypes ((array!60832 0))(
  ( (array!60833 (arr!29280 (Array (_ BitVec 32) ValueCell!10736)) (size!29761 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60832)

(declare-fun zeroValue!1367 () V!34897)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34897)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3800 (array!60830 array!60832 (_ BitVec 32) (_ BitVec 32) V!34897 V!34897 (_ BitVec 32) Int) ListLongMap!13245)

(assert (=> b!975949 (= lt!432784 (+!2941 (getCurrentListMap!3800 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432780))))

(assert (=> b!975949 (= lt!432780 (tuple2!14559 lt!432783 lt!432781))))

(declare-fun get!15172 (ValueCell!10736 V!34897) V!34897)

(declare-fun dynLambda!1697 (Int (_ BitVec 64)) V!34897)

(assert (=> b!975949 (= lt!432781 (get!15172 (select (arr!29280 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1697 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432786 () Unit!32334)

(declare-fun lemmaListMapRecursiveValidKeyArray!281 (array!60830 array!60832 (_ BitVec 32) (_ BitVec 32) V!34897 V!34897 (_ BitVec 32) Int) Unit!32334)

(assert (=> b!975949 (= lt!432786 (lemmaListMapRecursiveValidKeyArray!281 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975950 () Bool)

(declare-fun res!653392 () Bool)

(declare-fun e!549992 () Bool)

(assert (=> b!975950 (=> (not res!653392) (not e!549992))))

(assert (=> b!975950 (= res!653392 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29760 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29760 _keys!1717))))))

(declare-fun b!975951 () Bool)

(declare-fun res!653391 () Bool)

(assert (=> b!975951 (=> (not res!653391) (not e!549992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60830 (_ BitVec 32)) Bool)

(assert (=> b!975951 (= res!653391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975952 () Bool)

(declare-fun res!653395 () Bool)

(assert (=> b!975952 (=> (not res!653395) (not e!549992))))

(assert (=> b!975952 (= res!653395 (and (= (size!29761 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29760 _keys!1717) (size!29761 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!653394 () Bool)

(assert (=> start!83526 (=> (not res!653394) (not e!549992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83526 (= res!653394 (validMask!0 mask!2147))))

(assert (=> start!83526 e!549992))

(assert (=> start!83526 true))

(declare-fun e!549987 () Bool)

(declare-fun array_inv!22683 (array!60832) Bool)

(assert (=> start!83526 (and (array_inv!22683 _values!1425) e!549987)))

(declare-fun tp_is_empty!22435 () Bool)

(assert (=> start!83526 tp_is_empty!22435))

(assert (=> start!83526 tp!67881))

(declare-fun array_inv!22684 (array!60830) Bool)

(assert (=> start!83526 (array_inv!22684 _keys!1717)))

(declare-fun b!975953 () Bool)

(declare-fun res!653398 () Bool)

(assert (=> b!975953 (=> (not res!653398) (not e!549992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975953 (= res!653398 (validKeyInArray!0 (select (arr!29279 _keys!1717) i!822)))))

(declare-fun b!975954 () Bool)

(declare-fun e!549988 () Bool)

(assert (=> b!975954 (= e!549992 e!549988)))

(declare-fun res!653397 () Bool)

(assert (=> b!975954 (=> (not res!653397) (not e!549988))))

(assert (=> b!975954 (= res!653397 (contains!5665 lt!432782 (select (arr!29279 _keys!1717) i!822)))))

(assert (=> b!975954 (= lt!432782 (getCurrentListMap!3800 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!975955 () Bool)

(declare-fun res!653393 () Bool)

(assert (=> b!975955 (=> (not res!653393) (not e!549992))))

(declare-datatypes ((List!20365 0))(
  ( (Nil!20362) (Cons!20361 (h!21523 (_ BitVec 64)) (t!28859 List!20365)) )
))
(declare-fun arrayNoDuplicates!0 (array!60830 (_ BitVec 32) List!20365) Bool)

(assert (=> b!975955 (= res!653393 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20362))))

(declare-fun b!975956 () Bool)

(declare-fun e!549990 () Bool)

(assert (=> b!975956 (= e!549990 tp_is_empty!22435)))

(declare-fun b!975957 () Bool)

(declare-fun e!549991 () Bool)

(assert (=> b!975957 (= e!549991 tp_is_empty!22435)))

(declare-fun b!975958 () Bool)

(declare-fun mapRes!35662 () Bool)

(assert (=> b!975958 (= e!549987 (and e!549990 mapRes!35662))))

(declare-fun condMapEmpty!35662 () Bool)

(declare-fun mapDefault!35662 () ValueCell!10736)

(assert (=> b!975958 (= condMapEmpty!35662 (= (arr!29280 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10736)) mapDefault!35662)))))

(declare-fun mapIsEmpty!35662 () Bool)

(assert (=> mapIsEmpty!35662 mapRes!35662))

(declare-fun mapNonEmpty!35662 () Bool)

(declare-fun tp!67882 () Bool)

(assert (=> mapNonEmpty!35662 (= mapRes!35662 (and tp!67882 e!549991))))

(declare-fun mapRest!35662 () (Array (_ BitVec 32) ValueCell!10736))

(declare-fun mapKey!35662 () (_ BitVec 32))

(declare-fun mapValue!35662 () ValueCell!10736)

(assert (=> mapNonEmpty!35662 (= (arr!29280 _values!1425) (store mapRest!35662 mapKey!35662 mapValue!35662))))

(declare-fun b!975959 () Bool)

(assert (=> b!975959 (= e!549988 e!549993)))

(declare-fun res!653396 () Bool)

(assert (=> b!975959 (=> (not res!653396) (not e!549993))))

(assert (=> b!975959 (= res!653396 (validKeyInArray!0 lt!432783))))

(assert (=> b!975959 (= lt!432783 (select (arr!29279 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!975959 (= lt!432784 (getCurrentListMap!3800 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83526 res!653394) b!975952))

(assert (= (and b!975952 res!653395) b!975951))

(assert (= (and b!975951 res!653391) b!975955))

(assert (= (and b!975955 res!653393) b!975950))

(assert (= (and b!975950 res!653392) b!975953))

(assert (= (and b!975953 res!653398) b!975954))

(assert (= (and b!975954 res!653397) b!975959))

(assert (= (and b!975959 res!653396) b!975949))

(assert (= (and b!975958 condMapEmpty!35662) mapIsEmpty!35662))

(assert (= (and b!975958 (not condMapEmpty!35662)) mapNonEmpty!35662))

(get-info :version)

(assert (= (and mapNonEmpty!35662 ((_ is ValueCellFull!10736) mapValue!35662)) b!975957))

(assert (= (and b!975958 ((_ is ValueCellFull!10736) mapDefault!35662)) b!975956))

(assert (= start!83526 b!975958))

(declare-fun b_lambda!14551 () Bool)

(assert (=> (not b_lambda!14551) (not b!975949)))

(declare-fun t!28857 () Bool)

(declare-fun tb!6345 () Bool)

(assert (=> (and start!83526 (= defaultEntry!1428 defaultEntry!1428) t!28857) tb!6345))

(declare-fun result!12675 () Bool)

(assert (=> tb!6345 (= result!12675 tp_is_empty!22435)))

(assert (=> b!975949 t!28857))

(declare-fun b_and!31133 () Bool)

(assert (= b_and!31131 (and (=> t!28857 result!12675) b_and!31133)))

(declare-fun m!902627 () Bool)

(assert (=> b!975949 m!902627))

(declare-fun m!902629 () Bool)

(assert (=> b!975949 m!902629))

(declare-fun m!902631 () Bool)

(assert (=> b!975949 m!902631))

(declare-fun m!902633 () Bool)

(assert (=> b!975949 m!902633))

(assert (=> b!975949 m!902631))

(declare-fun m!902635 () Bool)

(assert (=> b!975949 m!902635))

(assert (=> b!975949 m!902627))

(declare-fun m!902637 () Bool)

(assert (=> b!975949 m!902637))

(declare-fun m!902639 () Bool)

(assert (=> b!975949 m!902639))

(assert (=> b!975949 m!902637))

(assert (=> b!975949 m!902629))

(assert (=> b!975949 m!902635))

(declare-fun m!902641 () Bool)

(assert (=> b!975949 m!902641))

(assert (=> b!975949 m!902637))

(declare-fun m!902643 () Bool)

(assert (=> b!975949 m!902643))

(declare-fun m!902645 () Bool)

(assert (=> b!975949 m!902645))

(assert (=> b!975954 m!902637))

(assert (=> b!975954 m!902637))

(declare-fun m!902647 () Bool)

(assert (=> b!975954 m!902647))

(declare-fun m!902649 () Bool)

(assert (=> b!975954 m!902649))

(declare-fun m!902651 () Bool)

(assert (=> b!975955 m!902651))

(declare-fun m!902653 () Bool)

(assert (=> start!83526 m!902653))

(declare-fun m!902655 () Bool)

(assert (=> start!83526 m!902655))

(declare-fun m!902657 () Bool)

(assert (=> start!83526 m!902657))

(declare-fun m!902659 () Bool)

(assert (=> b!975951 m!902659))

(declare-fun m!902661 () Bool)

(assert (=> mapNonEmpty!35662 m!902661))

(assert (=> b!975953 m!902637))

(assert (=> b!975953 m!902637))

(declare-fun m!902663 () Bool)

(assert (=> b!975953 m!902663))

(declare-fun m!902665 () Bool)

(assert (=> b!975959 m!902665))

(declare-fun m!902667 () Bool)

(assert (=> b!975959 m!902667))

(declare-fun m!902669 () Bool)

(assert (=> b!975959 m!902669))

(check-sat (not mapNonEmpty!35662) b_and!31133 (not b_lambda!14551) tp_is_empty!22435 (not b!975959) (not b!975955) (not b!975953) (not b!975951) (not b_next!19531) (not b!975954) (not start!83526) (not b!975949))
(check-sat b_and!31133 (not b_next!19531))
