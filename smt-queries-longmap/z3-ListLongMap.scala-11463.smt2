; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133526 () Bool)

(assert start!133526)

(declare-fun b_free!31993 () Bool)

(declare-fun b_next!31993 () Bool)

(assert (=> start!133526 (= b_free!31993 (not b_next!31993))))

(declare-fun tp!113104 () Bool)

(declare-fun b_and!51479 () Bool)

(assert (=> start!133526 (= tp!113104 b_and!51479)))

(declare-fun b!1561361 () Bool)

(declare-fun res!1067646 () Bool)

(declare-fun e!870075 () Bool)

(assert (=> b!1561361 (=> (not res!1067646) (not e!870075))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103948 0))(
  ( (array!103949 (arr!50167 (Array (_ BitVec 32) (_ BitVec 64))) (size!50719 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103948)

(assert (=> b!1561361 (= res!1067646 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50719 _keys!637)) (bvslt from!782 (size!50719 _keys!637))))))

(declare-fun b!1561362 () Bool)

(declare-fun res!1067644 () Bool)

(assert (=> b!1561362 (=> (not res!1067644) (not e!870075))))

(declare-datatypes ((List!36483 0))(
  ( (Nil!36480) (Cons!36479 (h!37926 (_ BitVec 64)) (t!51258 List!36483)) )
))
(declare-fun arrayNoDuplicates!0 (array!103948 (_ BitVec 32) List!36483) Bool)

(assert (=> b!1561362 (= res!1067644 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36480))))

(declare-fun res!1067645 () Bool)

(assert (=> start!133526 (=> (not res!1067645) (not e!870075))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133526 (= res!1067645 (validMask!0 mask!947))))

(assert (=> start!133526 e!870075))

(assert (=> start!133526 tp!113104))

(declare-fun tp_is_empty!38659 () Bool)

(assert (=> start!133526 tp_is_empty!38659))

(assert (=> start!133526 true))

(declare-fun array_inv!39177 (array!103948) Bool)

(assert (=> start!133526 (array_inv!39177 _keys!637)))

(declare-datatypes ((V!59753 0))(
  ( (V!59754 (val!19413 Int)) )
))
(declare-datatypes ((ValueCell!18299 0))(
  ( (ValueCellFull!18299 (v!22161 V!59753)) (EmptyCell!18299) )
))
(declare-datatypes ((array!103950 0))(
  ( (array!103951 (arr!50168 (Array (_ BitVec 32) ValueCell!18299)) (size!50720 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103950)

(declare-fun e!870072 () Bool)

(declare-fun array_inv!39178 (array!103950) Bool)

(assert (=> start!133526 (and (array_inv!39178 _values!487) e!870072)))

(declare-fun b!1561363 () Bool)

(declare-fun res!1067641 () Bool)

(assert (=> b!1561363 (=> (not res!1067641) (not e!870075))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561363 (= res!1067641 (and (= (size!50720 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50719 _keys!637) (size!50720 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561364 () Bool)

(assert (=> b!1561364 (= e!870075 (not (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))))

(declare-fun lt!670999 () V!59753)

(declare-datatypes ((tuple2!25144 0))(
  ( (tuple2!25145 (_1!12583 (_ BitVec 64)) (_2!12583 V!59753)) )
))
(declare-datatypes ((List!36484 0))(
  ( (Nil!36481) (Cons!36480 (h!37927 tuple2!25144) (t!51259 List!36484)) )
))
(declare-datatypes ((ListLongMap!22579 0))(
  ( (ListLongMap!22580 (toList!11305 List!36484)) )
))
(declare-fun lt!671000 () ListLongMap!22579)

(declare-fun contains!10215 (ListLongMap!22579 (_ BitVec 64)) Bool)

(declare-fun +!5070 (ListLongMap!22579 tuple2!25144) ListLongMap!22579)

(assert (=> b!1561364 (not (contains!10215 (+!5070 lt!671000 (tuple2!25145 (select (arr!50167 _keys!637) from!782) lt!670999)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51748 0))(
  ( (Unit!51749) )
))
(declare-fun lt!670998 () Unit!51748)

(declare-fun addStillNotContains!517 (ListLongMap!22579 (_ BitVec 64) V!59753 (_ BitVec 64)) Unit!51748)

(assert (=> b!1561364 (= lt!670998 (addStillNotContains!517 lt!671000 (select (arr!50167 _keys!637) from!782) lt!670999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26213 (ValueCell!18299 V!59753) V!59753)

(declare-fun dynLambda!3846 (Int (_ BitVec 64)) V!59753)

(assert (=> b!1561364 (= lt!670999 (get!26213 (select (arr!50168 _values!487) from!782) (dynLambda!3846 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59753)

(declare-fun minValue!453 () V!59753)

(declare-fun getCurrentListMapNoExtraKeys!6679 (array!103948 array!103950 (_ BitVec 32) (_ BitVec 32) V!59753 V!59753 (_ BitVec 32) Int) ListLongMap!22579)

(assert (=> b!1561364 (= lt!671000 (getCurrentListMapNoExtraKeys!6679 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561365 () Bool)

(declare-fun e!870073 () Bool)

(assert (=> b!1561365 (= e!870073 tp_is_empty!38659)))

(declare-fun b!1561366 () Bool)

(declare-fun res!1067643 () Bool)

(assert (=> b!1561366 (=> (not res!1067643) (not e!870075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103948 (_ BitVec 32)) Bool)

(assert (=> b!1561366 (= res!1067643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59364 () Bool)

(declare-fun mapRes!59364 () Bool)

(declare-fun tp!113103 () Bool)

(declare-fun e!870074 () Bool)

(assert (=> mapNonEmpty!59364 (= mapRes!59364 (and tp!113103 e!870074))))

(declare-fun mapKey!59364 () (_ BitVec 32))

(declare-fun mapValue!59364 () ValueCell!18299)

(declare-fun mapRest!59364 () (Array (_ BitVec 32) ValueCell!18299))

(assert (=> mapNonEmpty!59364 (= (arr!50168 _values!487) (store mapRest!59364 mapKey!59364 mapValue!59364))))

(declare-fun mapIsEmpty!59364 () Bool)

(assert (=> mapIsEmpty!59364 mapRes!59364))

(declare-fun b!1561367 () Bool)

(assert (=> b!1561367 (= e!870072 (and e!870073 mapRes!59364))))

(declare-fun condMapEmpty!59364 () Bool)

(declare-fun mapDefault!59364 () ValueCell!18299)

(assert (=> b!1561367 (= condMapEmpty!59364 (= (arr!50168 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18299)) mapDefault!59364)))))

(declare-fun b!1561368 () Bool)

(declare-fun res!1067642 () Bool)

(assert (=> b!1561368 (=> (not res!1067642) (not e!870075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561368 (= res!1067642 (validKeyInArray!0 (select (arr!50167 _keys!637) from!782)))))

(declare-fun b!1561369 () Bool)

(assert (=> b!1561369 (= e!870074 tp_is_empty!38659)))

(assert (= (and start!133526 res!1067645) b!1561363))

(assert (= (and b!1561363 res!1067641) b!1561366))

(assert (= (and b!1561366 res!1067643) b!1561362))

(assert (= (and b!1561362 res!1067644) b!1561361))

(assert (= (and b!1561361 res!1067646) b!1561368))

(assert (= (and b!1561368 res!1067642) b!1561364))

(assert (= (and b!1561367 condMapEmpty!59364) mapIsEmpty!59364))

(assert (= (and b!1561367 (not condMapEmpty!59364)) mapNonEmpty!59364))

(get-info :version)

(assert (= (and mapNonEmpty!59364 ((_ is ValueCellFull!18299) mapValue!59364)) b!1561369))

(assert (= (and b!1561367 ((_ is ValueCellFull!18299) mapDefault!59364)) b!1561365))

(assert (= start!133526 b!1561367))

(declare-fun b_lambda!24857 () Bool)

(assert (=> (not b_lambda!24857) (not b!1561364)))

(declare-fun t!51257 () Bool)

(declare-fun tb!12529 () Bool)

(assert (=> (and start!133526 (= defaultEntry!495 defaultEntry!495) t!51257) tb!12529))

(declare-fun result!26347 () Bool)

(assert (=> tb!12529 (= result!26347 tp_is_empty!38659)))

(assert (=> b!1561364 t!51257))

(declare-fun b_and!51481 () Bool)

(assert (= b_and!51479 (and (=> t!51257 result!26347) b_and!51481)))

(declare-fun m!1436469 () Bool)

(assert (=> b!1561368 m!1436469))

(assert (=> b!1561368 m!1436469))

(declare-fun m!1436471 () Bool)

(assert (=> b!1561368 m!1436471))

(declare-fun m!1436473 () Bool)

(assert (=> mapNonEmpty!59364 m!1436473))

(declare-fun m!1436475 () Bool)

(assert (=> b!1561364 m!1436475))

(declare-fun m!1436477 () Bool)

(assert (=> b!1561364 m!1436477))

(declare-fun m!1436479 () Bool)

(assert (=> b!1561364 m!1436479))

(declare-fun m!1436481 () Bool)

(assert (=> b!1561364 m!1436481))

(assert (=> b!1561364 m!1436481))

(declare-fun m!1436483 () Bool)

(assert (=> b!1561364 m!1436483))

(assert (=> b!1561364 m!1436475))

(assert (=> b!1561364 m!1436477))

(declare-fun m!1436485 () Bool)

(assert (=> b!1561364 m!1436485))

(assert (=> b!1561364 m!1436469))

(declare-fun m!1436487 () Bool)

(assert (=> b!1561364 m!1436487))

(assert (=> b!1561364 m!1436469))

(declare-fun m!1436489 () Bool)

(assert (=> b!1561362 m!1436489))

(declare-fun m!1436491 () Bool)

(assert (=> b!1561366 m!1436491))

(declare-fun m!1436493 () Bool)

(assert (=> start!133526 m!1436493))

(declare-fun m!1436495 () Bool)

(assert (=> start!133526 m!1436495))

(declare-fun m!1436497 () Bool)

(assert (=> start!133526 m!1436497))

(check-sat (not b_next!31993) (not b!1561368) (not mapNonEmpty!59364) (not b!1561362) (not b!1561364) tp_is_empty!38659 (not start!133526) (not b_lambda!24857) (not b!1561366) b_and!51481)
(check-sat b_and!51481 (not b_next!31993))
