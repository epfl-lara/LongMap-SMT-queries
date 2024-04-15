; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133508 () Bool)

(assert start!133508)

(declare-fun b_free!31975 () Bool)

(declare-fun b_next!31975 () Bool)

(assert (=> start!133508 (= b_free!31975 (not b_next!31975))))

(declare-fun tp!113049 () Bool)

(declare-fun b_and!51443 () Bool)

(assert (=> start!133508 (= tp!113049 b_and!51443)))

(declare-fun b!1561100 () Bool)

(declare-fun e!869941 () Bool)

(assert (=> b!1561100 (= e!869941 (not true))))

(declare-datatypes ((V!59729 0))(
  ( (V!59730 (val!19404 Int)) )
))
(declare-fun lt!670918 () V!59729)

(declare-datatypes ((tuple2!25132 0))(
  ( (tuple2!25133 (_1!12577 (_ BitVec 64)) (_2!12577 V!59729)) )
))
(declare-datatypes ((List!36470 0))(
  ( (Nil!36467) (Cons!36466 (h!37913 tuple2!25132) (t!51227 List!36470)) )
))
(declare-datatypes ((ListLongMap!22567 0))(
  ( (ListLongMap!22568 (toList!11299 List!36470)) )
))
(declare-fun lt!670917 () ListLongMap!22567)

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103912 0))(
  ( (array!103913 (arr!50149 (Array (_ BitVec 32) (_ BitVec 64))) (size!50701 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103912)

(declare-fun contains!10209 (ListLongMap!22567 (_ BitVec 64)) Bool)

(declare-fun +!5064 (ListLongMap!22567 tuple2!25132) ListLongMap!22567)

(assert (=> b!1561100 (not (contains!10209 (+!5064 lt!670917 (tuple2!25133 (select (arr!50149 _keys!637) from!782) lt!670918)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51736 0))(
  ( (Unit!51737) )
))
(declare-fun lt!670919 () Unit!51736)

(declare-fun addStillNotContains!511 (ListLongMap!22567 (_ BitVec 64) V!59729 (_ BitVec 64)) Unit!51736)

(assert (=> b!1561100 (= lt!670919 (addStillNotContains!511 lt!670917 (select (arr!50149 _keys!637) from!782) lt!670918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18290 0))(
  ( (ValueCellFull!18290 (v!22152 V!59729)) (EmptyCell!18290) )
))
(declare-datatypes ((array!103914 0))(
  ( (array!103915 (arr!50150 (Array (_ BitVec 32) ValueCell!18290)) (size!50702 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103914)

(declare-fun get!26201 (ValueCell!18290 V!59729) V!59729)

(declare-fun dynLambda!3840 (Int (_ BitVec 64)) V!59729)

(assert (=> b!1561100 (= lt!670918 (get!26201 (select (arr!50150 _values!487) from!782) (dynLambda!3840 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59729)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59729)

(declare-fun getCurrentListMapNoExtraKeys!6673 (array!103912 array!103914 (_ BitVec 32) (_ BitVec 32) V!59729 V!59729 (_ BitVec 32) Int) ListLongMap!22567)

(assert (=> b!1561100 (= lt!670917 (getCurrentListMapNoExtraKeys!6673 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561101 () Bool)

(declare-fun res!1067480 () Bool)

(assert (=> b!1561101 (=> (not res!1067480) (not e!869941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103912 (_ BitVec 32)) Bool)

(assert (=> b!1561101 (= res!1067480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561102 () Bool)

(declare-fun e!869939 () Bool)

(declare-fun tp_is_empty!38641 () Bool)

(assert (=> b!1561102 (= e!869939 tp_is_empty!38641)))

(declare-fun b!1561103 () Bool)

(declare-fun res!1067479 () Bool)

(assert (=> b!1561103 (=> (not res!1067479) (not e!869941))))

(assert (=> b!1561103 (= res!1067479 (and (= (size!50702 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50701 _keys!637) (size!50702 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561104 () Bool)

(declare-fun e!869937 () Bool)

(declare-fun e!869940 () Bool)

(declare-fun mapRes!59337 () Bool)

(assert (=> b!1561104 (= e!869937 (and e!869940 mapRes!59337))))

(declare-fun condMapEmpty!59337 () Bool)

(declare-fun mapDefault!59337 () ValueCell!18290)

(assert (=> b!1561104 (= condMapEmpty!59337 (= (arr!50150 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18290)) mapDefault!59337)))))

(declare-fun mapIsEmpty!59337 () Bool)

(assert (=> mapIsEmpty!59337 mapRes!59337))

(declare-fun res!1067481 () Bool)

(assert (=> start!133508 (=> (not res!1067481) (not e!869941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133508 (= res!1067481 (validMask!0 mask!947))))

(assert (=> start!133508 e!869941))

(assert (=> start!133508 tp!113049))

(assert (=> start!133508 tp_is_empty!38641))

(assert (=> start!133508 true))

(declare-fun array_inv!39167 (array!103912) Bool)

(assert (=> start!133508 (array_inv!39167 _keys!637)))

(declare-fun array_inv!39168 (array!103914) Bool)

(assert (=> start!133508 (and (array_inv!39168 _values!487) e!869937)))

(declare-fun b!1561105 () Bool)

(assert (=> b!1561105 (= e!869940 tp_is_empty!38641)))

(declare-fun mapNonEmpty!59337 () Bool)

(declare-fun tp!113050 () Bool)

(assert (=> mapNonEmpty!59337 (= mapRes!59337 (and tp!113050 e!869939))))

(declare-fun mapKey!59337 () (_ BitVec 32))

(declare-fun mapRest!59337 () (Array (_ BitVec 32) ValueCell!18290))

(declare-fun mapValue!59337 () ValueCell!18290)

(assert (=> mapNonEmpty!59337 (= (arr!50150 _values!487) (store mapRest!59337 mapKey!59337 mapValue!59337))))

(declare-fun b!1561106 () Bool)

(declare-fun res!1067484 () Bool)

(assert (=> b!1561106 (=> (not res!1067484) (not e!869941))))

(assert (=> b!1561106 (= res!1067484 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50701 _keys!637)) (bvslt from!782 (size!50701 _keys!637))))))

(declare-fun b!1561107 () Bool)

(declare-fun res!1067482 () Bool)

(assert (=> b!1561107 (=> (not res!1067482) (not e!869941))))

(declare-datatypes ((List!36471 0))(
  ( (Nil!36468) (Cons!36467 (h!37914 (_ BitVec 64)) (t!51228 List!36471)) )
))
(declare-fun arrayNoDuplicates!0 (array!103912 (_ BitVec 32) List!36471) Bool)

(assert (=> b!1561107 (= res!1067482 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36468))))

(declare-fun b!1561108 () Bool)

(declare-fun res!1067483 () Bool)

(assert (=> b!1561108 (=> (not res!1067483) (not e!869941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561108 (= res!1067483 (validKeyInArray!0 (select (arr!50149 _keys!637) from!782)))))

(assert (= (and start!133508 res!1067481) b!1561103))

(assert (= (and b!1561103 res!1067479) b!1561101))

(assert (= (and b!1561101 res!1067480) b!1561107))

(assert (= (and b!1561107 res!1067482) b!1561106))

(assert (= (and b!1561106 res!1067484) b!1561108))

(assert (= (and b!1561108 res!1067483) b!1561100))

(assert (= (and b!1561104 condMapEmpty!59337) mapIsEmpty!59337))

(assert (= (and b!1561104 (not condMapEmpty!59337)) mapNonEmpty!59337))

(get-info :version)

(assert (= (and mapNonEmpty!59337 ((_ is ValueCellFull!18290) mapValue!59337)) b!1561102))

(assert (= (and b!1561104 ((_ is ValueCellFull!18290) mapDefault!59337)) b!1561105))

(assert (= start!133508 b!1561104))

(declare-fun b_lambda!24839 () Bool)

(assert (=> (not b_lambda!24839) (not b!1561100)))

(declare-fun t!51226 () Bool)

(declare-fun tb!12511 () Bool)

(assert (=> (and start!133508 (= defaultEntry!495 defaultEntry!495) t!51226) tb!12511))

(declare-fun result!26311 () Bool)

(assert (=> tb!12511 (= result!26311 tp_is_empty!38641)))

(assert (=> b!1561100 t!51226))

(declare-fun b_and!51445 () Bool)

(assert (= b_and!51443 (and (=> t!51226 result!26311) b_and!51445)))

(declare-fun m!1436199 () Bool)

(assert (=> mapNonEmpty!59337 m!1436199))

(declare-fun m!1436201 () Bool)

(assert (=> b!1561100 m!1436201))

(declare-fun m!1436203 () Bool)

(assert (=> b!1561100 m!1436203))

(declare-fun m!1436205 () Bool)

(assert (=> b!1561100 m!1436205))

(declare-fun m!1436207 () Bool)

(assert (=> b!1561100 m!1436207))

(assert (=> b!1561100 m!1436207))

(declare-fun m!1436209 () Bool)

(assert (=> b!1561100 m!1436209))

(declare-fun m!1436211 () Bool)

(assert (=> b!1561100 m!1436211))

(assert (=> b!1561100 m!1436203))

(declare-fun m!1436213 () Bool)

(assert (=> b!1561100 m!1436213))

(assert (=> b!1561100 m!1436201))

(assert (=> b!1561100 m!1436211))

(declare-fun m!1436215 () Bool)

(assert (=> b!1561100 m!1436215))

(declare-fun m!1436217 () Bool)

(assert (=> start!133508 m!1436217))

(declare-fun m!1436219 () Bool)

(assert (=> start!133508 m!1436219))

(declare-fun m!1436221 () Bool)

(assert (=> start!133508 m!1436221))

(declare-fun m!1436223 () Bool)

(assert (=> b!1561107 m!1436223))

(declare-fun m!1436225 () Bool)

(assert (=> b!1561101 m!1436225))

(assert (=> b!1561108 m!1436211))

(assert (=> b!1561108 m!1436211))

(declare-fun m!1436227 () Bool)

(assert (=> b!1561108 m!1436227))

(check-sat (not b!1561108) (not mapNonEmpty!59337) (not b_next!31975) (not b!1561107) (not b!1561100) b_and!51445 (not b!1561101) (not b_lambda!24839) (not start!133508) tp_is_empty!38641)
(check-sat b_and!51445 (not b_next!31975))
