; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133584 () Bool)

(assert start!133584)

(declare-fun b_free!32001 () Bool)

(declare-fun b_next!32001 () Bool)

(assert (=> start!133584 (= b_free!32001 (not b_next!32001))))

(declare-fun tp!113127 () Bool)

(declare-fun b_and!51513 () Bool)

(assert (=> start!133584 (= tp!113127 b_and!51513)))

(declare-fun b!1561795 () Bool)

(declare-fun e!870338 () Bool)

(declare-fun e!870335 () Bool)

(assert (=> b!1561795 (= e!870338 (not e!870335))))

(declare-fun res!1067849 () Bool)

(assert (=> b!1561795 (=> res!1067849 e!870335)))

(declare-datatypes ((V!59763 0))(
  ( (V!59764 (val!19417 Int)) )
))
(declare-datatypes ((tuple2!25084 0))(
  ( (tuple2!25085 (_1!12553 (_ BitVec 64)) (_2!12553 V!59763)) )
))
(declare-datatypes ((List!36455 0))(
  ( (Nil!36452) (Cons!36451 (h!37897 tuple2!25084) (t!51246 List!36455)) )
))
(declare-datatypes ((ListLongMap!22519 0))(
  ( (ListLongMap!22520 (toList!11275 List!36455)) )
))
(declare-fun lt!671333 () ListLongMap!22519)

(declare-fun contains!10265 (ListLongMap!22519 (_ BitVec 64)) Bool)

(assert (=> b!1561795 (= res!1067849 (contains!10265 lt!671333 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561795 (not (contains!10265 lt!671333 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!104052 0))(
  ( (array!104053 (arr!50218 (Array (_ BitVec 32) (_ BitVec 64))) (size!50768 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104052)

(declare-fun lt!671331 () V!59763)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!671330 () ListLongMap!22519)

(declare-fun +!5045 (ListLongMap!22519 tuple2!25084) ListLongMap!22519)

(assert (=> b!1561795 (= lt!671333 (+!5045 lt!671330 (tuple2!25085 (select (arr!50218 _keys!637) from!782) lt!671331)))))

(declare-datatypes ((Unit!51944 0))(
  ( (Unit!51945) )
))
(declare-fun lt!671334 () Unit!51944)

(declare-fun addStillNotContains!535 (ListLongMap!22519 (_ BitVec 64) V!59763 (_ BitVec 64)) Unit!51944)

(assert (=> b!1561795 (= lt!671334 (addStillNotContains!535 lt!671330 (select (arr!50218 _keys!637) from!782) lt!671331 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18303 0))(
  ( (ValueCellFull!18303 (v!22169 V!59763)) (EmptyCell!18303) )
))
(declare-datatypes ((array!104054 0))(
  ( (array!104055 (arr!50219 (Array (_ BitVec 32) ValueCell!18303)) (size!50769 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104054)

(declare-fun get!26222 (ValueCell!18303 V!59763) V!59763)

(declare-fun dynLambda!3829 (Int (_ BitVec 64)) V!59763)

(assert (=> b!1561795 (= lt!671331 (get!26222 (select (arr!50219 _values!487) from!782) (dynLambda!3829 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59763)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59763)

(declare-fun getCurrentListMapNoExtraKeys!6659 (array!104052 array!104054 (_ BitVec 32) (_ BitVec 32) V!59763 V!59763 (_ BitVec 32) Int) ListLongMap!22519)

(assert (=> b!1561795 (= lt!671330 (getCurrentListMapNoExtraKeys!6659 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561796 () Bool)

(declare-fun res!1067853 () Bool)

(assert (=> b!1561796 (=> (not res!1067853) (not e!870338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104052 (_ BitVec 32)) Bool)

(assert (=> b!1561796 (= res!1067853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561797 () Bool)

(declare-fun res!1067850 () Bool)

(assert (=> b!1561797 (=> (not res!1067850) (not e!870338))))

(assert (=> b!1561797 (= res!1067850 (and (= (size!50769 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50768 _keys!637) (size!50769 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561798 () Bool)

(declare-fun e!870340 () Bool)

(declare-fun tp_is_empty!38667 () Bool)

(assert (=> b!1561798 (= e!870340 tp_is_empty!38667)))

(declare-fun mapNonEmpty!59376 () Bool)

(declare-fun mapRes!59376 () Bool)

(declare-fun tp!113126 () Bool)

(declare-fun e!870339 () Bool)

(assert (=> mapNonEmpty!59376 (= mapRes!59376 (and tp!113126 e!870339))))

(declare-fun mapKey!59376 () (_ BitVec 32))

(declare-fun mapValue!59376 () ValueCell!18303)

(declare-fun mapRest!59376 () (Array (_ BitVec 32) ValueCell!18303))

(assert (=> mapNonEmpty!59376 (= (arr!50219 _values!487) (store mapRest!59376 mapKey!59376 mapValue!59376))))

(declare-fun b!1561799 () Bool)

(declare-fun res!1067847 () Bool)

(assert (=> b!1561799 (=> (not res!1067847) (not e!870338))))

(assert (=> b!1561799 (= res!1067847 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50768 _keys!637)) (bvslt from!782 (size!50768 _keys!637))))))

(declare-fun b!1561800 () Bool)

(declare-fun res!1067851 () Bool)

(assert (=> b!1561800 (=> (not res!1067851) (not e!870338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561800 (= res!1067851 (validKeyInArray!0 (select (arr!50218 _keys!637) from!782)))))

(declare-fun b!1561801 () Bool)

(assert (=> b!1561801 (= e!870335 true)))

(declare-fun lt!671332 () Bool)

(assert (=> b!1561801 (= lt!671332 (contains!10265 lt!671333 (select (arr!50218 _keys!637) from!782)))))

(declare-fun res!1067848 () Bool)

(assert (=> start!133584 (=> (not res!1067848) (not e!870338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133584 (= res!1067848 (validMask!0 mask!947))))

(assert (=> start!133584 e!870338))

(assert (=> start!133584 tp!113127))

(assert (=> start!133584 tp_is_empty!38667))

(assert (=> start!133584 true))

(declare-fun array_inv!39035 (array!104052) Bool)

(assert (=> start!133584 (array_inv!39035 _keys!637)))

(declare-fun e!870336 () Bool)

(declare-fun array_inv!39036 (array!104054) Bool)

(assert (=> start!133584 (and (array_inv!39036 _values!487) e!870336)))

(declare-fun b!1561802 () Bool)

(assert (=> b!1561802 (= e!870336 (and e!870340 mapRes!59376))))

(declare-fun condMapEmpty!59376 () Bool)

(declare-fun mapDefault!59376 () ValueCell!18303)

(assert (=> b!1561802 (= condMapEmpty!59376 (= (arr!50219 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18303)) mapDefault!59376)))))

(declare-fun b!1561803 () Bool)

(declare-fun res!1067852 () Bool)

(assert (=> b!1561803 (=> (not res!1067852) (not e!870338))))

(declare-datatypes ((List!36456 0))(
  ( (Nil!36453) (Cons!36452 (h!37898 (_ BitVec 64)) (t!51247 List!36456)) )
))
(declare-fun arrayNoDuplicates!0 (array!104052 (_ BitVec 32) List!36456) Bool)

(assert (=> b!1561803 (= res!1067852 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36453))))

(declare-fun b!1561804 () Bool)

(assert (=> b!1561804 (= e!870339 tp_is_empty!38667)))

(declare-fun mapIsEmpty!59376 () Bool)

(assert (=> mapIsEmpty!59376 mapRes!59376))

(assert (= (and start!133584 res!1067848) b!1561797))

(assert (= (and b!1561797 res!1067850) b!1561796))

(assert (= (and b!1561796 res!1067853) b!1561803))

(assert (= (and b!1561803 res!1067852) b!1561799))

(assert (= (and b!1561799 res!1067847) b!1561800))

(assert (= (and b!1561800 res!1067851) b!1561795))

(assert (= (and b!1561795 (not res!1067849)) b!1561801))

(assert (= (and b!1561802 condMapEmpty!59376) mapIsEmpty!59376))

(assert (= (and b!1561802 (not condMapEmpty!59376)) mapNonEmpty!59376))

(get-info :version)

(assert (= (and mapNonEmpty!59376 ((_ is ValueCellFull!18303) mapValue!59376)) b!1561804))

(assert (= (and b!1561802 ((_ is ValueCellFull!18303) mapDefault!59376)) b!1561798))

(assert (= start!133584 b!1561802))

(declare-fun b_lambda!24875 () Bool)

(assert (=> (not b_lambda!24875) (not b!1561795)))

(declare-fun t!51245 () Bool)

(declare-fun tb!12545 () Bool)

(assert (=> (and start!133584 (= defaultEntry!495 defaultEntry!495) t!51245) tb!12545))

(declare-fun result!26371 () Bool)

(assert (=> tb!12545 (= result!26371 tp_is_empty!38667)))

(assert (=> b!1561795 t!51245))

(declare-fun b_and!51515 () Bool)

(assert (= b_and!51513 (and (=> t!51245 result!26371) b_and!51515)))

(declare-fun m!1437485 () Bool)

(assert (=> mapNonEmpty!59376 m!1437485))

(declare-fun m!1437487 () Bool)

(assert (=> start!133584 m!1437487))

(declare-fun m!1437489 () Bool)

(assert (=> start!133584 m!1437489))

(declare-fun m!1437491 () Bool)

(assert (=> start!133584 m!1437491))

(declare-fun m!1437493 () Bool)

(assert (=> b!1561795 m!1437493))

(declare-fun m!1437495 () Bool)

(assert (=> b!1561795 m!1437495))

(declare-fun m!1437497 () Bool)

(assert (=> b!1561795 m!1437497))

(assert (=> b!1561795 m!1437493))

(declare-fun m!1437499 () Bool)

(assert (=> b!1561795 m!1437499))

(declare-fun m!1437501 () Bool)

(assert (=> b!1561795 m!1437501))

(assert (=> b!1561795 m!1437495))

(declare-fun m!1437503 () Bool)

(assert (=> b!1561795 m!1437503))

(declare-fun m!1437505 () Bool)

(assert (=> b!1561795 m!1437505))

(declare-fun m!1437507 () Bool)

(assert (=> b!1561795 m!1437507))

(declare-fun m!1437509 () Bool)

(assert (=> b!1561795 m!1437509))

(assert (=> b!1561795 m!1437503))

(assert (=> b!1561800 m!1437503))

(assert (=> b!1561800 m!1437503))

(declare-fun m!1437511 () Bool)

(assert (=> b!1561800 m!1437511))

(declare-fun m!1437513 () Bool)

(assert (=> b!1561803 m!1437513))

(declare-fun m!1437515 () Bool)

(assert (=> b!1561796 m!1437515))

(assert (=> b!1561801 m!1437503))

(assert (=> b!1561801 m!1437503))

(declare-fun m!1437517 () Bool)

(assert (=> b!1561801 m!1437517))

(check-sat (not b!1561801) (not b!1561796) (not b!1561795) (not b_next!32001) (not b!1561800) (not b_lambda!24875) b_and!51515 (not b!1561803) (not start!133584) (not mapNonEmpty!59376) tp_is_empty!38667)
(check-sat b_and!51515 (not b_next!32001))
