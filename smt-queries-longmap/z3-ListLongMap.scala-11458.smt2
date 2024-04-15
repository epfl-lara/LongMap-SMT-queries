; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133496 () Bool)

(assert start!133496)

(declare-fun b_free!31963 () Bool)

(declare-fun b_next!31963 () Bool)

(assert (=> start!133496 (= b_free!31963 (not b_next!31963))))

(declare-fun tp!113014 () Bool)

(declare-fun b_and!51419 () Bool)

(assert (=> start!133496 (= tp!113014 b_and!51419)))

(declare-fun b!1560926 () Bool)

(declare-fun e!869847 () Bool)

(declare-fun tp_is_empty!38629 () Bool)

(assert (=> b!1560926 (= e!869847 tp_is_empty!38629)))

(declare-fun res!1067374 () Bool)

(declare-fun e!869848 () Bool)

(assert (=> start!133496 (=> (not res!1067374) (not e!869848))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133496 (= res!1067374 (validMask!0 mask!947))))

(assert (=> start!133496 e!869848))

(assert (=> start!133496 tp!113014))

(assert (=> start!133496 tp_is_empty!38629))

(assert (=> start!133496 true))

(declare-datatypes ((array!103890 0))(
  ( (array!103891 (arr!50138 (Array (_ BitVec 32) (_ BitVec 64))) (size!50690 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103890)

(declare-fun array_inv!39161 (array!103890) Bool)

(assert (=> start!133496 (array_inv!39161 _keys!637)))

(declare-datatypes ((V!59713 0))(
  ( (V!59714 (val!19398 Int)) )
))
(declare-datatypes ((ValueCell!18284 0))(
  ( (ValueCellFull!18284 (v!22146 V!59713)) (EmptyCell!18284) )
))
(declare-datatypes ((array!103892 0))(
  ( (array!103893 (arr!50139 (Array (_ BitVec 32) ValueCell!18284)) (size!50691 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103892)

(declare-fun e!869849 () Bool)

(declare-fun array_inv!39162 (array!103892) Bool)

(assert (=> start!133496 (and (array_inv!39162 _values!487) e!869849)))

(declare-fun b!1560927 () Bool)

(declare-fun res!1067375 () Bool)

(assert (=> b!1560927 (=> (not res!1067375) (not e!869848))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1560927 (= res!1067375 (validKeyInArray!0 (select (arr!50138 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59319 () Bool)

(declare-fun mapRes!59319 () Bool)

(declare-fun tp!113013 () Bool)

(assert (=> mapNonEmpty!59319 (= mapRes!59319 (and tp!113013 e!869847))))

(declare-fun mapValue!59319 () ValueCell!18284)

(declare-fun mapRest!59319 () (Array (_ BitVec 32) ValueCell!18284))

(declare-fun mapKey!59319 () (_ BitVec 32))

(assert (=> mapNonEmpty!59319 (= (arr!50139 _values!487) (store mapRest!59319 mapKey!59319 mapValue!59319))))

(declare-fun b!1560928 () Bool)

(declare-fun res!1067376 () Bool)

(assert (=> b!1560928 (=> (not res!1067376) (not e!869848))))

(assert (=> b!1560928 (= res!1067376 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50690 _keys!637)) (bvslt from!782 (size!50690 _keys!637))))))

(declare-fun mapIsEmpty!59319 () Bool)

(assert (=> mapIsEmpty!59319 mapRes!59319))

(declare-fun b!1560929 () Bool)

(assert (=> b!1560929 (= e!869848 (not true))))

(declare-fun lt!670865 () V!59713)

(declare-datatypes ((tuple2!25126 0))(
  ( (tuple2!25127 (_1!12574 (_ BitVec 64)) (_2!12574 V!59713)) )
))
(declare-datatypes ((List!36463 0))(
  ( (Nil!36460) (Cons!36459 (h!37906 tuple2!25126) (t!51208 List!36463)) )
))
(declare-datatypes ((ListLongMap!22561 0))(
  ( (ListLongMap!22562 (toList!11296 List!36463)) )
))
(declare-fun lt!670863 () ListLongMap!22561)

(declare-fun contains!10206 (ListLongMap!22561 (_ BitVec 64)) Bool)

(declare-fun +!5061 (ListLongMap!22561 tuple2!25126) ListLongMap!22561)

(assert (=> b!1560929 (not (contains!10206 (+!5061 lt!670863 (tuple2!25127 (select (arr!50138 _keys!637) from!782) lt!670865)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51730 0))(
  ( (Unit!51731) )
))
(declare-fun lt!670864 () Unit!51730)

(declare-fun addStillNotContains!508 (ListLongMap!22561 (_ BitVec 64) V!59713 (_ BitVec 64)) Unit!51730)

(assert (=> b!1560929 (= lt!670864 (addStillNotContains!508 lt!670863 (select (arr!50138 _keys!637) from!782) lt!670865 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26194 (ValueCell!18284 V!59713) V!59713)

(declare-fun dynLambda!3837 (Int (_ BitVec 64)) V!59713)

(assert (=> b!1560929 (= lt!670865 (get!26194 (select (arr!50139 _values!487) from!782) (dynLambda!3837 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59713)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59713)

(declare-fun getCurrentListMapNoExtraKeys!6670 (array!103890 array!103892 (_ BitVec 32) (_ BitVec 32) V!59713 V!59713 (_ BitVec 32) Int) ListLongMap!22561)

(assert (=> b!1560929 (= lt!670863 (getCurrentListMapNoExtraKeys!6670 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1560930 () Bool)

(declare-fun e!869851 () Bool)

(assert (=> b!1560930 (= e!869849 (and e!869851 mapRes!59319))))

(declare-fun condMapEmpty!59319 () Bool)

(declare-fun mapDefault!59319 () ValueCell!18284)

(assert (=> b!1560930 (= condMapEmpty!59319 (= (arr!50139 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18284)) mapDefault!59319)))))

(declare-fun b!1560931 () Bool)

(declare-fun res!1067371 () Bool)

(assert (=> b!1560931 (=> (not res!1067371) (not e!869848))))

(declare-datatypes ((List!36464 0))(
  ( (Nil!36461) (Cons!36460 (h!37907 (_ BitVec 64)) (t!51209 List!36464)) )
))
(declare-fun arrayNoDuplicates!0 (array!103890 (_ BitVec 32) List!36464) Bool)

(assert (=> b!1560931 (= res!1067371 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36461))))

(declare-fun b!1560932 () Bool)

(declare-fun res!1067372 () Bool)

(assert (=> b!1560932 (=> (not res!1067372) (not e!869848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103890 (_ BitVec 32)) Bool)

(assert (=> b!1560932 (= res!1067372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560933 () Bool)

(declare-fun res!1067373 () Bool)

(assert (=> b!1560933 (=> (not res!1067373) (not e!869848))))

(assert (=> b!1560933 (= res!1067373 (and (= (size!50691 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50690 _keys!637) (size!50691 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560934 () Bool)

(assert (=> b!1560934 (= e!869851 tp_is_empty!38629)))

(assert (= (and start!133496 res!1067374) b!1560933))

(assert (= (and b!1560933 res!1067373) b!1560932))

(assert (= (and b!1560932 res!1067372) b!1560931))

(assert (= (and b!1560931 res!1067371) b!1560928))

(assert (= (and b!1560928 res!1067376) b!1560927))

(assert (= (and b!1560927 res!1067375) b!1560929))

(assert (= (and b!1560930 condMapEmpty!59319) mapIsEmpty!59319))

(assert (= (and b!1560930 (not condMapEmpty!59319)) mapNonEmpty!59319))

(get-info :version)

(assert (= (and mapNonEmpty!59319 ((_ is ValueCellFull!18284) mapValue!59319)) b!1560926))

(assert (= (and b!1560930 ((_ is ValueCellFull!18284) mapDefault!59319)) b!1560934))

(assert (= start!133496 b!1560930))

(declare-fun b_lambda!24827 () Bool)

(assert (=> (not b_lambda!24827) (not b!1560929)))

(declare-fun t!51207 () Bool)

(declare-fun tb!12499 () Bool)

(assert (=> (and start!133496 (= defaultEntry!495 defaultEntry!495) t!51207) tb!12499))

(declare-fun result!26287 () Bool)

(assert (=> tb!12499 (= result!26287 tp_is_empty!38629)))

(assert (=> b!1560929 t!51207))

(declare-fun b_and!51421 () Bool)

(assert (= b_and!51419 (and (=> t!51207 result!26287) b_and!51421)))

(declare-fun m!1436019 () Bool)

(assert (=> start!133496 m!1436019))

(declare-fun m!1436021 () Bool)

(assert (=> start!133496 m!1436021))

(declare-fun m!1436023 () Bool)

(assert (=> start!133496 m!1436023))

(declare-fun m!1436025 () Bool)

(assert (=> b!1560931 m!1436025))

(declare-fun m!1436027 () Bool)

(assert (=> mapNonEmpty!59319 m!1436027))

(declare-fun m!1436029 () Bool)

(assert (=> b!1560932 m!1436029))

(declare-fun m!1436031 () Bool)

(assert (=> b!1560927 m!1436031))

(assert (=> b!1560927 m!1436031))

(declare-fun m!1436033 () Bool)

(assert (=> b!1560927 m!1436033))

(declare-fun m!1436035 () Bool)

(assert (=> b!1560929 m!1436035))

(declare-fun m!1436037 () Bool)

(assert (=> b!1560929 m!1436037))

(declare-fun m!1436039 () Bool)

(assert (=> b!1560929 m!1436039))

(declare-fun m!1436041 () Bool)

(assert (=> b!1560929 m!1436041))

(declare-fun m!1436043 () Bool)

(assert (=> b!1560929 m!1436043))

(assert (=> b!1560929 m!1436035))

(assert (=> b!1560929 m!1436031))

(assert (=> b!1560929 m!1436031))

(declare-fun m!1436045 () Bool)

(assert (=> b!1560929 m!1436045))

(assert (=> b!1560929 m!1436037))

(declare-fun m!1436047 () Bool)

(assert (=> b!1560929 m!1436047))

(assert (=> b!1560929 m!1436041))

(check-sat (not b!1560929) (not b_next!31963) (not mapNonEmpty!59319) (not b!1560927) (not start!133496) tp_is_empty!38629 (not b_lambda!24827) (not b!1560931) (not b!1560932) b_and!51421)
(check-sat b_and!51421 (not b_next!31963))
