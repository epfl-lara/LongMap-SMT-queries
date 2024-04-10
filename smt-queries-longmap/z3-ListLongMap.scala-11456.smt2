; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133536 () Bool)

(assert start!133536)

(declare-fun b_free!31953 () Bool)

(declare-fun b_next!31953 () Bool)

(assert (=> start!133536 (= b_free!31953 (not b_next!31953))))

(declare-fun tp!112983 () Bool)

(declare-fun b_and!51417 () Bool)

(assert (=> start!133536 (= tp!112983 b_and!51417)))

(declare-fun b!1561094 () Bool)

(declare-fun res!1067415 () Bool)

(declare-fun e!869972 () Bool)

(assert (=> b!1561094 (=> (not res!1067415) (not e!869972))))

(declare-datatypes ((array!103956 0))(
  ( (array!103957 (arr!50170 (Array (_ BitVec 32) (_ BitVec 64))) (size!50720 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103956)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561094 (= res!1067415 (validKeyInArray!0 (select (arr!50170 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59304 () Bool)

(declare-fun mapRes!59304 () Bool)

(assert (=> mapIsEmpty!59304 mapRes!59304))

(declare-fun res!1067412 () Bool)

(assert (=> start!133536 (=> (not res!1067412) (not e!869972))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133536 (= res!1067412 (validMask!0 mask!947))))

(assert (=> start!133536 e!869972))

(assert (=> start!133536 tp!112983))

(declare-fun tp_is_empty!38619 () Bool)

(assert (=> start!133536 tp_is_empty!38619))

(assert (=> start!133536 true))

(declare-fun array_inv!38999 (array!103956) Bool)

(assert (=> start!133536 (array_inv!38999 _keys!637)))

(declare-datatypes ((V!59699 0))(
  ( (V!59700 (val!19393 Int)) )
))
(declare-datatypes ((ValueCell!18279 0))(
  ( (ValueCellFull!18279 (v!22145 V!59699)) (EmptyCell!18279) )
))
(declare-datatypes ((array!103958 0))(
  ( (array!103959 (arr!50171 (Array (_ BitVec 32) ValueCell!18279)) (size!50721 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103958)

(declare-fun e!869970 () Bool)

(declare-fun array_inv!39000 (array!103958) Bool)

(assert (=> start!133536 (and (array_inv!39000 _values!487) e!869970)))

(declare-fun b!1561095 () Bool)

(declare-fun res!1067410 () Bool)

(assert (=> b!1561095 (=> (not res!1067410) (not e!869972))))

(assert (=> b!1561095 (= res!1067410 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50720 _keys!637)) (bvslt from!782 (size!50720 _keys!637))))))

(declare-fun b!1561096 () Bool)

(assert (=> b!1561096 (= e!869972 (not true))))

(declare-datatypes ((tuple2!25048 0))(
  ( (tuple2!25049 (_1!12535 (_ BitVec 64)) (_2!12535 V!59699)) )
))
(declare-datatypes ((List!36421 0))(
  ( (Nil!36418) (Cons!36417 (h!37863 tuple2!25048) (t!51164 List!36421)) )
))
(declare-datatypes ((ListLongMap!22483 0))(
  ( (ListLongMap!22484 (toList!11257 List!36421)) )
))
(declare-fun lt!671106 () ListLongMap!22483)

(declare-fun lt!671105 () V!59699)

(declare-fun contains!10247 (ListLongMap!22483 (_ BitVec 64)) Bool)

(declare-fun +!5027 (ListLongMap!22483 tuple2!25048) ListLongMap!22483)

(assert (=> b!1561096 (not (contains!10247 (+!5027 lt!671106 (tuple2!25049 (select (arr!50170 _keys!637) from!782) lt!671105)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51908 0))(
  ( (Unit!51909) )
))
(declare-fun lt!671104 () Unit!51908)

(declare-fun addStillNotContains!517 (ListLongMap!22483 (_ BitVec 64) V!59699 (_ BitVec 64)) Unit!51908)

(assert (=> b!1561096 (= lt!671104 (addStillNotContains!517 lt!671106 (select (arr!50170 _keys!637) from!782) lt!671105 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26188 (ValueCell!18279 V!59699) V!59699)

(declare-fun dynLambda!3811 (Int (_ BitVec 64)) V!59699)

(assert (=> b!1561096 (= lt!671105 (get!26188 (select (arr!50171 _values!487) from!782) (dynLambda!3811 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59699)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59699)

(declare-fun getCurrentListMapNoExtraKeys!6641 (array!103956 array!103958 (_ BitVec 32) (_ BitVec 32) V!59699 V!59699 (_ BitVec 32) Int) ListLongMap!22483)

(assert (=> b!1561096 (= lt!671106 (getCurrentListMapNoExtraKeys!6641 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561097 () Bool)

(declare-fun res!1067414 () Bool)

(assert (=> b!1561097 (=> (not res!1067414) (not e!869972))))

(assert (=> b!1561097 (= res!1067414 (and (= (size!50721 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50720 _keys!637) (size!50721 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561098 () Bool)

(declare-fun res!1067411 () Bool)

(assert (=> b!1561098 (=> (not res!1067411) (not e!869972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103956 (_ BitVec 32)) Bool)

(assert (=> b!1561098 (= res!1067411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561099 () Bool)

(declare-fun e!869974 () Bool)

(assert (=> b!1561099 (= e!869970 (and e!869974 mapRes!59304))))

(declare-fun condMapEmpty!59304 () Bool)

(declare-fun mapDefault!59304 () ValueCell!18279)

(assert (=> b!1561099 (= condMapEmpty!59304 (= (arr!50171 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18279)) mapDefault!59304)))))

(declare-fun b!1561100 () Bool)

(assert (=> b!1561100 (= e!869974 tp_is_empty!38619)))

(declare-fun b!1561101 () Bool)

(declare-fun e!869973 () Bool)

(assert (=> b!1561101 (= e!869973 tp_is_empty!38619)))

(declare-fun b!1561102 () Bool)

(declare-fun res!1067413 () Bool)

(assert (=> b!1561102 (=> (not res!1067413) (not e!869972))))

(declare-datatypes ((List!36422 0))(
  ( (Nil!36419) (Cons!36418 (h!37864 (_ BitVec 64)) (t!51165 List!36422)) )
))
(declare-fun arrayNoDuplicates!0 (array!103956 (_ BitVec 32) List!36422) Bool)

(assert (=> b!1561102 (= res!1067413 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36419))))

(declare-fun mapNonEmpty!59304 () Bool)

(declare-fun tp!112982 () Bool)

(assert (=> mapNonEmpty!59304 (= mapRes!59304 (and tp!112982 e!869973))))

(declare-fun mapRest!59304 () (Array (_ BitVec 32) ValueCell!18279))

(declare-fun mapValue!59304 () ValueCell!18279)

(declare-fun mapKey!59304 () (_ BitVec 32))

(assert (=> mapNonEmpty!59304 (= (arr!50171 _values!487) (store mapRest!59304 mapKey!59304 mapValue!59304))))

(assert (= (and start!133536 res!1067412) b!1561097))

(assert (= (and b!1561097 res!1067414) b!1561098))

(assert (= (and b!1561098 res!1067411) b!1561102))

(assert (= (and b!1561102 res!1067413) b!1561095))

(assert (= (and b!1561095 res!1067410) b!1561094))

(assert (= (and b!1561094 res!1067415) b!1561096))

(assert (= (and b!1561099 condMapEmpty!59304) mapIsEmpty!59304))

(assert (= (and b!1561099 (not condMapEmpty!59304)) mapNonEmpty!59304))

(get-info :version)

(assert (= (and mapNonEmpty!59304 ((_ is ValueCellFull!18279) mapValue!59304)) b!1561101))

(assert (= (and b!1561099 ((_ is ValueCellFull!18279) mapDefault!59304)) b!1561100))

(assert (= start!133536 b!1561099))

(declare-fun b_lambda!24827 () Bool)

(assert (=> (not b_lambda!24827) (not b!1561096)))

(declare-fun t!51163 () Bool)

(declare-fun tb!12497 () Bool)

(assert (=> (and start!133536 (= defaultEntry!495 defaultEntry!495) t!51163) tb!12497))

(declare-fun result!26275 () Bool)

(assert (=> tb!12497 (= result!26275 tp_is_empty!38619)))

(assert (=> b!1561096 t!51163))

(declare-fun b_and!51419 () Bool)

(assert (= b_and!51417 (and (=> t!51163 result!26275) b_and!51419)))

(declare-fun m!1436761 () Bool)

(assert (=> b!1561096 m!1436761))

(declare-fun m!1436763 () Bool)

(assert (=> b!1561096 m!1436763))

(declare-fun m!1436765 () Bool)

(assert (=> b!1561096 m!1436765))

(declare-fun m!1436767 () Bool)

(assert (=> b!1561096 m!1436767))

(declare-fun m!1436769 () Bool)

(assert (=> b!1561096 m!1436769))

(assert (=> b!1561096 m!1436767))

(assert (=> b!1561096 m!1436761))

(declare-fun m!1436771 () Bool)

(assert (=> b!1561096 m!1436771))

(assert (=> b!1561096 m!1436771))

(declare-fun m!1436773 () Bool)

(assert (=> b!1561096 m!1436773))

(assert (=> b!1561096 m!1436763))

(declare-fun m!1436775 () Bool)

(assert (=> b!1561096 m!1436775))

(declare-fun m!1436777 () Bool)

(assert (=> b!1561098 m!1436777))

(declare-fun m!1436779 () Bool)

(assert (=> mapNonEmpty!59304 m!1436779))

(assert (=> b!1561094 m!1436771))

(assert (=> b!1561094 m!1436771))

(declare-fun m!1436781 () Bool)

(assert (=> b!1561094 m!1436781))

(declare-fun m!1436783 () Bool)

(assert (=> start!133536 m!1436783))

(declare-fun m!1436785 () Bool)

(assert (=> start!133536 m!1436785))

(declare-fun m!1436787 () Bool)

(assert (=> start!133536 m!1436787))

(declare-fun m!1436789 () Bool)

(assert (=> b!1561102 m!1436789))

(check-sat (not mapNonEmpty!59304) (not b_lambda!24827) (not b!1561096) (not start!133536) b_and!51419 tp_is_empty!38619 (not b!1561098) (not b_next!31953) (not b!1561094) (not b!1561102))
(check-sat b_and!51419 (not b_next!31953))
