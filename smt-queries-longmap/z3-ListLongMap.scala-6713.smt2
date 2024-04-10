; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84252 () Bool)

(assert start!84252)

(declare-fun b_free!19953 () Bool)

(declare-fun b_next!19953 () Bool)

(assert (=> start!84252 (= b_free!19953 (not b_next!19953))))

(declare-fun tp!69462 () Bool)

(declare-fun b_and!31983 () Bool)

(assert (=> start!84252 (= tp!69462 b_and!31983)))

(declare-fun b!985717 () Bool)

(declare-fun res!659613 () Bool)

(declare-fun e!555620 () Bool)

(assert (=> b!985717 (=> (not res!659613) (not e!555620))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985717 (= res!659613 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985718 () Bool)

(declare-fun e!555623 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985718 (= e!555623 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!35723 0))(
  ( (V!35724 (val!11578 Int)) )
))
(declare-datatypes ((tuple2!14822 0))(
  ( (tuple2!14823 (_1!7422 (_ BitVec 64)) (_2!7422 V!35723)) )
))
(declare-datatypes ((List!20711 0))(
  ( (Nil!20708) (Cons!20707 (h!21869 tuple2!14822) (t!29608 List!20711)) )
))
(declare-datatypes ((ListLongMap!13519 0))(
  ( (ListLongMap!13520 (toList!6775 List!20711)) )
))
(declare-fun lt!437364 () ListLongMap!13519)

(declare-fun lt!437365 () tuple2!14822)

(declare-fun lt!437362 () tuple2!14822)

(declare-fun +!3060 (ListLongMap!13519 tuple2!14822) ListLongMap!13519)

(assert (=> b!985718 (= (+!3060 (+!3060 lt!437364 lt!437365) lt!437362) (+!3060 (+!3060 lt!437364 lt!437362) lt!437365))))

(declare-fun lt!437363 () V!35723)

(declare-datatypes ((array!62085 0))(
  ( (array!62086 (arr!29900 (Array (_ BitVec 32) (_ BitVec 64))) (size!30379 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62085)

(assert (=> b!985718 (= lt!437362 (tuple2!14823 (select (arr!29900 _keys!1544) from!1932) lt!437363))))

(declare-fun minValue!1220 () V!35723)

(assert (=> b!985718 (= lt!437365 (tuple2!14823 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32759 0))(
  ( (Unit!32760) )
))
(declare-fun lt!437366 () Unit!32759)

(declare-fun addCommutativeForDiffKeys!688 (ListLongMap!13519 (_ BitVec 64) V!35723 (_ BitVec 64) V!35723) Unit!32759)

(assert (=> b!985718 (= lt!437366 (addCommutativeForDiffKeys!688 lt!437364 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29900 _keys!1544) from!1932) lt!437363))))

(declare-fun b!985719 () Bool)

(assert (=> b!985719 (= e!555620 e!555623)))

(declare-fun res!659614 () Bool)

(assert (=> b!985719 (=> (not res!659614) (not e!555623))))

(assert (=> b!985719 (= res!659614 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29900 _keys!1544) from!1932))))))

(declare-datatypes ((ValueCell!11046 0))(
  ( (ValueCellFull!11046 (v!14140 V!35723)) (EmptyCell!11046) )
))
(declare-datatypes ((array!62087 0))(
  ( (array!62088 (arr!29901 (Array (_ BitVec 32) ValueCell!11046)) (size!30380 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62087)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15525 (ValueCell!11046 V!35723) V!35723)

(declare-fun dynLambda!1846 (Int (_ BitVec 64)) V!35723)

(assert (=> b!985719 (= lt!437363 (get!15525 (select (arr!29901 _values!1278) from!1932) (dynLambda!1846 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35723)

(declare-fun getCurrentListMapNoExtraKeys!3466 (array!62085 array!62087 (_ BitVec 32) (_ BitVec 32) V!35723 V!35723 (_ BitVec 32) Int) ListLongMap!13519)

(assert (=> b!985719 (= lt!437364 (getCurrentListMapNoExtraKeys!3466 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985720 () Bool)

(declare-fun res!659615 () Bool)

(assert (=> b!985720 (=> (not res!659615) (not e!555620))))

(declare-datatypes ((List!20712 0))(
  ( (Nil!20709) (Cons!20708 (h!21870 (_ BitVec 64)) (t!29609 List!20712)) )
))
(declare-fun arrayNoDuplicates!0 (array!62085 (_ BitVec 32) List!20712) Bool)

(assert (=> b!985720 (= res!659615 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20709))))

(declare-fun mapIsEmpty!36611 () Bool)

(declare-fun mapRes!36611 () Bool)

(assert (=> mapIsEmpty!36611 mapRes!36611))

(declare-fun b!985721 () Bool)

(declare-fun res!659608 () Bool)

(assert (=> b!985721 (=> (not res!659608) (not e!555620))))

(assert (=> b!985721 (= res!659608 (and (= (size!30380 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30379 _keys!1544) (size!30380 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985722 () Bool)

(declare-fun e!555621 () Bool)

(declare-fun e!555624 () Bool)

(assert (=> b!985722 (= e!555621 (and e!555624 mapRes!36611))))

(declare-fun condMapEmpty!36611 () Bool)

(declare-fun mapDefault!36611 () ValueCell!11046)

(assert (=> b!985722 (= condMapEmpty!36611 (= (arr!29901 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11046)) mapDefault!36611)))))

(declare-fun mapNonEmpty!36611 () Bool)

(declare-fun tp!69463 () Bool)

(declare-fun e!555622 () Bool)

(assert (=> mapNonEmpty!36611 (= mapRes!36611 (and tp!69463 e!555622))))

(declare-fun mapRest!36611 () (Array (_ BitVec 32) ValueCell!11046))

(declare-fun mapKey!36611 () (_ BitVec 32))

(declare-fun mapValue!36611 () ValueCell!11046)

(assert (=> mapNonEmpty!36611 (= (arr!29901 _values!1278) (store mapRest!36611 mapKey!36611 mapValue!36611))))

(declare-fun b!985723 () Bool)

(declare-fun res!659612 () Bool)

(assert (=> b!985723 (=> (not res!659612) (not e!555620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985723 (= res!659612 (validKeyInArray!0 (select (arr!29900 _keys!1544) from!1932)))))

(declare-fun b!985724 () Bool)

(declare-fun res!659609 () Bool)

(assert (=> b!985724 (=> (not res!659609) (not e!555620))))

(assert (=> b!985724 (= res!659609 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30379 _keys!1544))))))

(declare-fun b!985725 () Bool)

(declare-fun res!659611 () Bool)

(assert (=> b!985725 (=> (not res!659611) (not e!555620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62085 (_ BitVec 32)) Bool)

(assert (=> b!985725 (= res!659611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!659610 () Bool)

(assert (=> start!84252 (=> (not res!659610) (not e!555620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84252 (= res!659610 (validMask!0 mask!1948))))

(assert (=> start!84252 e!555620))

(assert (=> start!84252 true))

(declare-fun tp_is_empty!23055 () Bool)

(assert (=> start!84252 tp_is_empty!23055))

(declare-fun array_inv!23111 (array!62087) Bool)

(assert (=> start!84252 (and (array_inv!23111 _values!1278) e!555621)))

(assert (=> start!84252 tp!69462))

(declare-fun array_inv!23112 (array!62085) Bool)

(assert (=> start!84252 (array_inv!23112 _keys!1544)))

(declare-fun b!985726 () Bool)

(assert (=> b!985726 (= e!555622 tp_is_empty!23055)))

(declare-fun b!985727 () Bool)

(assert (=> b!985727 (= e!555624 tp_is_empty!23055)))

(assert (= (and start!84252 res!659610) b!985721))

(assert (= (and b!985721 res!659608) b!985725))

(assert (= (and b!985725 res!659611) b!985720))

(assert (= (and b!985720 res!659615) b!985724))

(assert (= (and b!985724 res!659609) b!985723))

(assert (= (and b!985723 res!659612) b!985717))

(assert (= (and b!985717 res!659613) b!985719))

(assert (= (and b!985719 res!659614) b!985718))

(assert (= (and b!985722 condMapEmpty!36611) mapIsEmpty!36611))

(assert (= (and b!985722 (not condMapEmpty!36611)) mapNonEmpty!36611))

(get-info :version)

(assert (= (and mapNonEmpty!36611 ((_ is ValueCellFull!11046) mapValue!36611)) b!985726))

(assert (= (and b!985722 ((_ is ValueCellFull!11046) mapDefault!36611)) b!985727))

(assert (= start!84252 b!985722))

(declare-fun b_lambda!14985 () Bool)

(assert (=> (not b_lambda!14985) (not b!985719)))

(declare-fun t!29607 () Bool)

(declare-fun tb!6747 () Bool)

(assert (=> (and start!84252 (= defaultEntry!1281 defaultEntry!1281) t!29607) tb!6747))

(declare-fun result!13483 () Bool)

(assert (=> tb!6747 (= result!13483 tp_is_empty!23055)))

(assert (=> b!985719 t!29607))

(declare-fun b_and!31985 () Bool)

(assert (= b_and!31983 (and (=> t!29607 result!13483) b_and!31985)))

(declare-fun m!912767 () Bool)

(assert (=> b!985718 m!912767))

(declare-fun m!912769 () Bool)

(assert (=> b!985718 m!912769))

(declare-fun m!912771 () Bool)

(assert (=> b!985718 m!912771))

(declare-fun m!912773 () Bool)

(assert (=> b!985718 m!912773))

(declare-fun m!912775 () Bool)

(assert (=> b!985718 m!912775))

(assert (=> b!985718 m!912771))

(declare-fun m!912777 () Bool)

(assert (=> b!985718 m!912777))

(assert (=> b!985718 m!912773))

(assert (=> b!985718 m!912767))

(declare-fun m!912779 () Bool)

(assert (=> b!985720 m!912779))

(assert (=> b!985719 m!912771))

(declare-fun m!912781 () Bool)

(assert (=> b!985719 m!912781))

(declare-fun m!912783 () Bool)

(assert (=> b!985719 m!912783))

(declare-fun m!912785 () Bool)

(assert (=> b!985719 m!912785))

(assert (=> b!985719 m!912781))

(assert (=> b!985719 m!912785))

(declare-fun m!912787 () Bool)

(assert (=> b!985719 m!912787))

(assert (=> b!985723 m!912771))

(assert (=> b!985723 m!912771))

(declare-fun m!912789 () Bool)

(assert (=> b!985723 m!912789))

(declare-fun m!912791 () Bool)

(assert (=> mapNonEmpty!36611 m!912791))

(declare-fun m!912793 () Bool)

(assert (=> b!985725 m!912793))

(declare-fun m!912795 () Bool)

(assert (=> start!84252 m!912795))

(declare-fun m!912797 () Bool)

(assert (=> start!84252 m!912797))

(declare-fun m!912799 () Bool)

(assert (=> start!84252 m!912799))

(check-sat (not b!985720) (not b!985718) (not b!985723) (not b!985725) tp_is_empty!23055 (not b_next!19953) (not mapNonEmpty!36611) (not b_lambda!14985) (not b!985719) (not start!84252) b_and!31985)
(check-sat b_and!31985 (not b_next!19953))
