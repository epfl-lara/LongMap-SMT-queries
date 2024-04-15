; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133894 () Bool)

(assert start!133894)

(declare-fun b_free!32167 () Bool)

(declare-fun b_next!32167 () Bool)

(assert (=> start!133894 (= b_free!32167 (not b_next!32167))))

(declare-fun tp!113804 () Bool)

(declare-fun b_and!51757 () Bool)

(assert (=> start!133894 (= tp!113804 b_and!51757)))

(declare-fun mapNonEmpty!59803 () Bool)

(declare-fun mapRes!59803 () Bool)

(declare-fun tp!113803 () Bool)

(declare-fun e!872549 () Bool)

(assert (=> mapNonEmpty!59803 (= mapRes!59803 (and tp!113803 e!872549))))

(declare-datatypes ((V!60129 0))(
  ( (V!60130 (val!19554 Int)) )
))
(declare-datatypes ((ValueCell!18440 0))(
  ( (ValueCellFull!18440 (v!22306 V!60129)) (EmptyCell!18440) )
))
(declare-fun mapRest!59803 () (Array (_ BitVec 32) ValueCell!18440))

(declare-fun mapValue!59803 () ValueCell!18440)

(declare-fun mapKey!59803 () (_ BitVec 32))

(declare-datatypes ((array!104500 0))(
  ( (array!104501 (arr!50438 (Array (_ BitVec 32) ValueCell!18440)) (size!50990 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104500)

(assert (=> mapNonEmpty!59803 (= (arr!50438 _values!487) (store mapRest!59803 mapKey!59803 mapValue!59803))))

(declare-fun b!1565471 () Bool)

(declare-fun res!1070188 () Bool)

(declare-fun e!872551 () Bool)

(assert (=> b!1565471 (=> (not res!1070188) (not e!872551))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104502 0))(
  ( (array!104503 (arr!50439 (Array (_ BitVec 32) (_ BitVec 64))) (size!50991 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104502)

(assert (=> b!1565471 (= res!1070188 (and (= (size!50990 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50991 _keys!637) (size!50990 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565472 () Bool)

(declare-fun res!1070190 () Bool)

(assert (=> b!1565472 (=> (not res!1070190) (not e!872551))))

(declare-datatypes ((List!36663 0))(
  ( (Nil!36660) (Cons!36659 (h!38106 (_ BitVec 64)) (t!51536 List!36663)) )
))
(declare-fun arrayNoDuplicates!0 (array!104502 (_ BitVec 32) List!36663) Bool)

(assert (=> b!1565472 (= res!1070190 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36660))))

(declare-fun b!1565473 () Bool)

(declare-fun e!872546 () Bool)

(declare-fun tp_is_empty!38941 () Bool)

(assert (=> b!1565473 (= e!872546 tp_is_empty!38941)))

(declare-fun b!1565474 () Bool)

(declare-fun res!1070189 () Bool)

(assert (=> b!1565474 (=> (not res!1070189) (not e!872551))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565474 (= res!1070189 (validKeyInArray!0 (select (arr!50439 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59803 () Bool)

(assert (=> mapIsEmpty!59803 mapRes!59803))

(declare-fun b!1565475 () Bool)

(declare-fun e!872550 () Bool)

(assert (=> b!1565475 (= e!872550 true)))

(declare-fun lt!672133 () Bool)

(declare-datatypes ((tuple2!25304 0))(
  ( (tuple2!25305 (_1!12663 (_ BitVec 64)) (_2!12663 V!60129)) )
))
(declare-datatypes ((List!36664 0))(
  ( (Nil!36661) (Cons!36660 (h!38107 tuple2!25304) (t!51537 List!36664)) )
))
(declare-datatypes ((ListLongMap!22739 0))(
  ( (ListLongMap!22740 (toList!11385 List!36664)) )
))
(declare-fun lt!672132 () ListLongMap!22739)

(declare-fun contains!10298 (ListLongMap!22739 (_ BitVec 64)) Bool)

(assert (=> b!1565475 (= lt!672133 (contains!10298 lt!672132 (select (arr!50439 _keys!637) from!782)))))

(declare-fun res!1070191 () Bool)

(assert (=> start!133894 (=> (not res!1070191) (not e!872551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133894 (= res!1070191 (validMask!0 mask!947))))

(assert (=> start!133894 e!872551))

(assert (=> start!133894 tp!113804))

(assert (=> start!133894 tp_is_empty!38941))

(assert (=> start!133894 true))

(declare-fun array_inv!39393 (array!104502) Bool)

(assert (=> start!133894 (array_inv!39393 _keys!637)))

(declare-fun e!872547 () Bool)

(declare-fun array_inv!39394 (array!104500) Bool)

(assert (=> start!133894 (and (array_inv!39394 _values!487) e!872547)))

(declare-fun b!1565476 () Bool)

(assert (=> b!1565476 (= e!872551 (not e!872550))))

(declare-fun res!1070185 () Bool)

(assert (=> b!1565476 (=> res!1070185 e!872550)))

(assert (=> b!1565476 (= res!1070185 (contains!10298 lt!672132 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565476 (not (contains!10298 lt!672132 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672131 () V!60129)

(declare-fun lt!672130 () ListLongMap!22739)

(declare-fun +!5106 (ListLongMap!22739 tuple2!25304) ListLongMap!22739)

(assert (=> b!1565476 (= lt!672132 (+!5106 lt!672130 (tuple2!25305 (select (arr!50439 _keys!637) from!782) lt!672131)))))

(declare-datatypes ((Unit!51830 0))(
  ( (Unit!51831) )
))
(declare-fun lt!672129 () Unit!51830)

(declare-fun addStillNotContains!553 (ListLongMap!22739 (_ BitVec 64) V!60129 (_ BitVec 64)) Unit!51830)

(assert (=> b!1565476 (= lt!672129 (addStillNotContains!553 lt!672130 (select (arr!50439 _keys!637) from!782) lt!672131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26345 (ValueCell!18440 V!60129) V!60129)

(declare-fun dynLambda!3882 (Int (_ BitVec 64)) V!60129)

(assert (=> b!1565476 (= lt!672131 (get!26345 (select (arr!50438 _values!487) from!782) (dynLambda!3882 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60129)

(declare-fun minValue!453 () V!60129)

(declare-fun getCurrentListMapNoExtraKeys!6737 (array!104502 array!104500 (_ BitVec 32) (_ BitVec 32) V!60129 V!60129 (_ BitVec 32) Int) ListLongMap!22739)

(assert (=> b!1565476 (= lt!672130 (getCurrentListMapNoExtraKeys!6737 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565477 () Bool)

(assert (=> b!1565477 (= e!872549 tp_is_empty!38941)))

(declare-fun b!1565478 () Bool)

(declare-fun res!1070186 () Bool)

(assert (=> b!1565478 (=> (not res!1070186) (not e!872551))))

(assert (=> b!1565478 (= res!1070186 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50991 _keys!637)) (bvslt from!782 (size!50991 _keys!637))))))

(declare-fun b!1565479 () Bool)

(declare-fun res!1070187 () Bool)

(assert (=> b!1565479 (=> (not res!1070187) (not e!872551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104502 (_ BitVec 32)) Bool)

(assert (=> b!1565479 (= res!1070187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565480 () Bool)

(assert (=> b!1565480 (= e!872547 (and e!872546 mapRes!59803))))

(declare-fun condMapEmpty!59803 () Bool)

(declare-fun mapDefault!59803 () ValueCell!18440)

(assert (=> b!1565480 (= condMapEmpty!59803 (= (arr!50438 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18440)) mapDefault!59803)))))

(assert (= (and start!133894 res!1070191) b!1565471))

(assert (= (and b!1565471 res!1070188) b!1565479))

(assert (= (and b!1565479 res!1070187) b!1565472))

(assert (= (and b!1565472 res!1070190) b!1565478))

(assert (= (and b!1565478 res!1070186) b!1565474))

(assert (= (and b!1565474 res!1070189) b!1565476))

(assert (= (and b!1565476 (not res!1070185)) b!1565475))

(assert (= (and b!1565480 condMapEmpty!59803) mapIsEmpty!59803))

(assert (= (and b!1565480 (not condMapEmpty!59803)) mapNonEmpty!59803))

(get-info :version)

(assert (= (and mapNonEmpty!59803 ((_ is ValueCellFull!18440) mapValue!59803)) b!1565477))

(assert (= (and b!1565480 ((_ is ValueCellFull!18440) mapDefault!59803)) b!1565473))

(assert (= start!133894 b!1565480))

(declare-fun b_lambda!24971 () Bool)

(assert (=> (not b_lambda!24971) (not b!1565476)))

(declare-fun t!51535 () Bool)

(declare-fun tb!12627 () Bool)

(assert (=> (and start!133894 (= defaultEntry!495 defaultEntry!495) t!51535) tb!12627))

(declare-fun result!26553 () Bool)

(assert (=> tb!12627 (= result!26553 tp_is_empty!38941)))

(assert (=> b!1565476 t!51535))

(declare-fun b_and!51759 () Bool)

(assert (= b_and!51757 (and (=> t!51535 result!26553) b_and!51759)))

(declare-fun m!1439815 () Bool)

(assert (=> start!133894 m!1439815))

(declare-fun m!1439817 () Bool)

(assert (=> start!133894 m!1439817))

(declare-fun m!1439819 () Bool)

(assert (=> start!133894 m!1439819))

(declare-fun m!1439821 () Bool)

(assert (=> b!1565476 m!1439821))

(declare-fun m!1439823 () Bool)

(assert (=> b!1565476 m!1439823))

(declare-fun m!1439825 () Bool)

(assert (=> b!1565476 m!1439825))

(declare-fun m!1439827 () Bool)

(assert (=> b!1565476 m!1439827))

(assert (=> b!1565476 m!1439821))

(declare-fun m!1439829 () Bool)

(assert (=> b!1565476 m!1439829))

(assert (=> b!1565476 m!1439823))

(declare-fun m!1439831 () Bool)

(assert (=> b!1565476 m!1439831))

(assert (=> b!1565476 m!1439829))

(declare-fun m!1439833 () Bool)

(assert (=> b!1565476 m!1439833))

(declare-fun m!1439835 () Bool)

(assert (=> b!1565476 m!1439835))

(declare-fun m!1439837 () Bool)

(assert (=> b!1565476 m!1439837))

(declare-fun m!1439839 () Bool)

(assert (=> mapNonEmpty!59803 m!1439839))

(declare-fun m!1439841 () Bool)

(assert (=> b!1565479 m!1439841))

(assert (=> b!1565474 m!1439829))

(assert (=> b!1565474 m!1439829))

(declare-fun m!1439843 () Bool)

(assert (=> b!1565474 m!1439843))

(declare-fun m!1439845 () Bool)

(assert (=> b!1565472 m!1439845))

(assert (=> b!1565475 m!1439829))

(assert (=> b!1565475 m!1439829))

(declare-fun m!1439847 () Bool)

(assert (=> b!1565475 m!1439847))

(check-sat (not b!1565479) (not start!133894) (not b_lambda!24971) tp_is_empty!38941 (not mapNonEmpty!59803) (not b!1565472) (not b!1565474) (not b_next!32167) (not b!1565475) (not b!1565476) b_and!51759)
(check-sat b_and!51759 (not b_next!32167))
