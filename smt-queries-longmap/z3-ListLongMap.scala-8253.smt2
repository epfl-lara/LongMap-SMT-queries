; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100468 () Bool)

(assert start!100468)

(declare-fun b_free!25791 () Bool)

(declare-fun b_next!25791 () Bool)

(assert (=> start!100468 (= b_free!25791 (not b_next!25791))))

(declare-fun tp!90362 () Bool)

(declare-fun b_and!42469 () Bool)

(assert (=> start!100468 (= tp!90362 b_and!42469)))

(declare-fun b!1199804 () Bool)

(declare-fun res!798631 () Bool)

(declare-fun e!681420 () Bool)

(assert (=> b!1199804 (=> (not res!798631) (not e!681420))))

(declare-datatypes ((array!77765 0))(
  ( (array!77766 (arr!37527 (Array (_ BitVec 32) (_ BitVec 64))) (size!38063 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77765)

(declare-datatypes ((List!26408 0))(
  ( (Nil!26405) (Cons!26404 (h!27613 (_ BitVec 64)) (t!39179 List!26408)) )
))
(declare-fun arrayNoDuplicates!0 (array!77765 (_ BitVec 32) List!26408) Bool)

(assert (=> b!1199804 (= res!798631 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26405))))

(declare-fun b!1199805 () Bool)

(declare-fun e!681423 () Bool)

(declare-fun tp_is_empty!30495 () Bool)

(assert (=> b!1199805 (= e!681423 tp_is_empty!30495)))

(declare-fun b!1199806 () Bool)

(declare-fun e!681419 () Bool)

(assert (=> b!1199806 (= e!681420 e!681419)))

(declare-fun res!798634 () Bool)

(assert (=> b!1199806 (=> (not res!798634) (not e!681419))))

(declare-fun lt!543870 () array!77765)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77765 (_ BitVec 32)) Bool)

(assert (=> b!1199806 (= res!798634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543870 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199806 (= lt!543870 (array!77766 (store (arr!37527 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38063 _keys!1208)))))

(declare-fun b!1199807 () Bool)

(declare-fun res!798629 () Bool)

(assert (=> b!1199807 (=> (not res!798629) (not e!681420))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199807 (= res!798629 (validKeyInArray!0 k0!934))))

(declare-fun b!1199808 () Bool)

(declare-fun e!681424 () Bool)

(declare-fun e!681421 () Bool)

(declare-fun mapRes!47585 () Bool)

(assert (=> b!1199808 (= e!681424 (and e!681421 mapRes!47585))))

(declare-fun condMapEmpty!47585 () Bool)

(declare-datatypes ((V!45787 0))(
  ( (V!45788 (val!15304 Int)) )
))
(declare-datatypes ((ValueCell!14538 0))(
  ( (ValueCellFull!14538 (v!17942 V!45787)) (EmptyCell!14538) )
))
(declare-datatypes ((array!77767 0))(
  ( (array!77768 (arr!37528 (Array (_ BitVec 32) ValueCell!14538)) (size!38064 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77767)

(declare-fun mapDefault!47585 () ValueCell!14538)

(assert (=> b!1199808 (= condMapEmpty!47585 (= (arr!37528 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14538)) mapDefault!47585)))))

(declare-fun mapIsEmpty!47585 () Bool)

(assert (=> mapIsEmpty!47585 mapRes!47585))

(declare-fun b!1199809 () Bool)

(declare-fun res!798630 () Bool)

(assert (=> b!1199809 (=> (not res!798630) (not e!681419))))

(assert (=> b!1199809 (= res!798630 (arrayNoDuplicates!0 lt!543870 #b00000000000000000000000000000000 Nil!26405))))

(declare-fun b!1199810 () Bool)

(declare-fun res!798639 () Bool)

(assert (=> b!1199810 (=> (not res!798639) (not e!681420))))

(assert (=> b!1199810 (= res!798639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199811 () Bool)

(declare-fun res!798636 () Bool)

(assert (=> b!1199811 (=> (not res!798636) (not e!681420))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1199811 (= res!798636 (and (= (size!38064 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38063 _keys!1208) (size!38064 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47585 () Bool)

(declare-fun tp!90363 () Bool)

(assert (=> mapNonEmpty!47585 (= mapRes!47585 (and tp!90363 e!681423))))

(declare-fun mapValue!47585 () ValueCell!14538)

(declare-fun mapRest!47585 () (Array (_ BitVec 32) ValueCell!14538))

(declare-fun mapKey!47585 () (_ BitVec 32))

(assert (=> mapNonEmpty!47585 (= (arr!37528 _values!996) (store mapRest!47585 mapKey!47585 mapValue!47585))))

(declare-fun res!798635 () Bool)

(assert (=> start!100468 (=> (not res!798635) (not e!681420))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100468 (= res!798635 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38063 _keys!1208))))))

(assert (=> start!100468 e!681420))

(assert (=> start!100468 tp_is_empty!30495))

(declare-fun array_inv!28598 (array!77765) Bool)

(assert (=> start!100468 (array_inv!28598 _keys!1208)))

(assert (=> start!100468 true))

(assert (=> start!100468 tp!90362))

(declare-fun array_inv!28599 (array!77767) Bool)

(assert (=> start!100468 (and (array_inv!28599 _values!996) e!681424)))

(declare-fun b!1199812 () Bool)

(declare-fun res!798633 () Bool)

(assert (=> b!1199812 (=> (not res!798633) (not e!681420))))

(assert (=> b!1199812 (= res!798633 (= (select (arr!37527 _keys!1208) i!673) k0!934))))

(declare-fun b!1199813 () Bool)

(declare-fun res!798632 () Bool)

(assert (=> b!1199813 (=> (not res!798632) (not e!681420))))

(assert (=> b!1199813 (= res!798632 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38063 _keys!1208))))))

(declare-fun b!1199814 () Bool)

(assert (=> b!1199814 (= e!681421 tp_is_empty!30495)))

(declare-fun b!1199815 () Bool)

(declare-fun e!681418 () Bool)

(assert (=> b!1199815 (= e!681419 (not e!681418))))

(declare-fun res!798637 () Bool)

(assert (=> b!1199815 (=> res!798637 e!681418)))

(assert (=> b!1199815 (= res!798637 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199815 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39778 0))(
  ( (Unit!39779) )
))
(declare-fun lt!543868 () Unit!39778)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77765 (_ BitVec 64) (_ BitVec 32)) Unit!39778)

(assert (=> b!1199815 (= lt!543868 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199816 () Bool)

(declare-fun res!798638 () Bool)

(assert (=> b!1199816 (=> (not res!798638) (not e!681420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199816 (= res!798638 (validMask!0 mask!1564))))

(declare-fun b!1199817 () Bool)

(assert (=> b!1199817 (= e!681418 true)))

(declare-fun zeroValue!944 () V!45787)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19590 0))(
  ( (tuple2!19591 (_1!9806 (_ BitVec 64)) (_2!9806 V!45787)) )
))
(declare-datatypes ((List!26409 0))(
  ( (Nil!26406) (Cons!26405 (h!27614 tuple2!19590) (t!39180 List!26409)) )
))
(declare-datatypes ((ListLongMap!17559 0))(
  ( (ListLongMap!17560 (toList!8795 List!26409)) )
))
(declare-fun lt!543871 () ListLongMap!17559)

(declare-fun minValue!944 () V!45787)

(declare-fun getCurrentListMapNoExtraKeys!5234 (array!77765 array!77767 (_ BitVec 32) (_ BitVec 32) V!45787 V!45787 (_ BitVec 32) Int) ListLongMap!17559)

(declare-fun dynLambda!3154 (Int (_ BitVec 64)) V!45787)

(assert (=> b!1199817 (= lt!543871 (getCurrentListMapNoExtraKeys!5234 lt!543870 (array!77768 (store (arr!37528 _values!996) i!673 (ValueCellFull!14538 (dynLambda!3154 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38064 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543869 () ListLongMap!17559)

(assert (=> b!1199817 (= lt!543869 (getCurrentListMapNoExtraKeys!5234 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100468 res!798635) b!1199816))

(assert (= (and b!1199816 res!798638) b!1199811))

(assert (= (and b!1199811 res!798636) b!1199810))

(assert (= (and b!1199810 res!798639) b!1199804))

(assert (= (and b!1199804 res!798631) b!1199813))

(assert (= (and b!1199813 res!798632) b!1199807))

(assert (= (and b!1199807 res!798629) b!1199812))

(assert (= (and b!1199812 res!798633) b!1199806))

(assert (= (and b!1199806 res!798634) b!1199809))

(assert (= (and b!1199809 res!798630) b!1199815))

(assert (= (and b!1199815 (not res!798637)) b!1199817))

(assert (= (and b!1199808 condMapEmpty!47585) mapIsEmpty!47585))

(assert (= (and b!1199808 (not condMapEmpty!47585)) mapNonEmpty!47585))

(get-info :version)

(assert (= (and mapNonEmpty!47585 ((_ is ValueCellFull!14538) mapValue!47585)) b!1199805))

(assert (= (and b!1199808 ((_ is ValueCellFull!14538) mapDefault!47585)) b!1199814))

(assert (= start!100468 b!1199808))

(declare-fun b_lambda!20987 () Bool)

(assert (=> (not b_lambda!20987) (not b!1199817)))

(declare-fun t!39178 () Bool)

(declare-fun tb!10591 () Bool)

(assert (=> (and start!100468 (= defaultEntry!1004 defaultEntry!1004) t!39178) tb!10591))

(declare-fun result!21759 () Bool)

(assert (=> tb!10591 (= result!21759 tp_is_empty!30495)))

(assert (=> b!1199817 t!39178))

(declare-fun b_and!42471 () Bool)

(assert (= b_and!42469 (and (=> t!39178 result!21759) b_and!42471)))

(declare-fun m!1106259 () Bool)

(assert (=> b!1199817 m!1106259))

(declare-fun m!1106261 () Bool)

(assert (=> b!1199817 m!1106261))

(declare-fun m!1106263 () Bool)

(assert (=> b!1199817 m!1106263))

(declare-fun m!1106265 () Bool)

(assert (=> b!1199817 m!1106265))

(declare-fun m!1106267 () Bool)

(assert (=> b!1199806 m!1106267))

(declare-fun m!1106269 () Bool)

(assert (=> b!1199806 m!1106269))

(declare-fun m!1106271 () Bool)

(assert (=> b!1199804 m!1106271))

(declare-fun m!1106273 () Bool)

(assert (=> b!1199809 m!1106273))

(declare-fun m!1106275 () Bool)

(assert (=> b!1199807 m!1106275))

(declare-fun m!1106277 () Bool)

(assert (=> b!1199815 m!1106277))

(declare-fun m!1106279 () Bool)

(assert (=> b!1199815 m!1106279))

(declare-fun m!1106281 () Bool)

(assert (=> b!1199816 m!1106281))

(declare-fun m!1106283 () Bool)

(assert (=> b!1199812 m!1106283))

(declare-fun m!1106285 () Bool)

(assert (=> mapNonEmpty!47585 m!1106285))

(declare-fun m!1106287 () Bool)

(assert (=> b!1199810 m!1106287))

(declare-fun m!1106289 () Bool)

(assert (=> start!100468 m!1106289))

(declare-fun m!1106291 () Bool)

(assert (=> start!100468 m!1106291))

(check-sat (not b!1199809) (not b!1199816) (not b!1199806) (not b!1199810) b_and!42471 (not b!1199804) (not mapNonEmpty!47585) (not start!100468) (not b!1199807) (not b!1199817) (not b_lambda!20987) (not b!1199815) tp_is_empty!30495 (not b_next!25791))
(check-sat b_and!42471 (not b_next!25791))
