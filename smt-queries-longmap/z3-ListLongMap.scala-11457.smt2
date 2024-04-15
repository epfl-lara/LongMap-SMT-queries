; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133490 () Bool)

(assert start!133490)

(declare-fun b_free!31957 () Bool)

(declare-fun b_next!31957 () Bool)

(assert (=> start!133490 (= b_free!31957 (not b_next!31957))))

(declare-fun tp!112996 () Bool)

(declare-fun b_and!51407 () Bool)

(assert (=> start!133490 (= tp!112996 b_and!51407)))

(declare-fun res!1067317 () Bool)

(declare-fun e!869802 () Bool)

(assert (=> start!133490 (=> (not res!1067317) (not e!869802))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133490 (= res!1067317 (validMask!0 mask!947))))

(assert (=> start!133490 e!869802))

(assert (=> start!133490 tp!112996))

(declare-fun tp_is_empty!38623 () Bool)

(assert (=> start!133490 tp_is_empty!38623))

(assert (=> start!133490 true))

(declare-datatypes ((array!103880 0))(
  ( (array!103881 (arr!50133 (Array (_ BitVec 32) (_ BitVec 64))) (size!50685 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103880)

(declare-fun array_inv!39159 (array!103880) Bool)

(assert (=> start!133490 (array_inv!39159 _keys!637)))

(declare-datatypes ((V!59705 0))(
  ( (V!59706 (val!19395 Int)) )
))
(declare-datatypes ((ValueCell!18281 0))(
  ( (ValueCellFull!18281 (v!22143 V!59705)) (EmptyCell!18281) )
))
(declare-datatypes ((array!103882 0))(
  ( (array!103883 (arr!50134 (Array (_ BitVec 32) ValueCell!18281)) (size!50686 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103882)

(declare-fun e!869806 () Bool)

(declare-fun array_inv!39160 (array!103882) Bool)

(assert (=> start!133490 (and (array_inv!39160 _values!487) e!869806)))

(declare-fun b!1560839 () Bool)

(declare-fun res!1067319 () Bool)

(assert (=> b!1560839 (=> (not res!1067319) (not e!869802))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1560839 (= res!1067319 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50685 _keys!637)) (bvslt from!782 (size!50685 _keys!637))))))

(declare-fun b!1560840 () Bool)

(declare-fun res!1067318 () Bool)

(assert (=> b!1560840 (=> (not res!1067318) (not e!869802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1560840 (= res!1067318 (validKeyInArray!0 (select (arr!50133 _keys!637) from!782)))))

(declare-fun b!1560841 () Bool)

(assert (=> b!1560841 (= e!869802 (not true))))

(declare-datatypes ((tuple2!25122 0))(
  ( (tuple2!25123 (_1!12572 (_ BitVec 64)) (_2!12572 V!59705)) )
))
(declare-datatypes ((List!36460 0))(
  ( (Nil!36457) (Cons!36456 (h!37903 tuple2!25122) (t!51199 List!36460)) )
))
(declare-datatypes ((ListLongMap!22557 0))(
  ( (ListLongMap!22558 (toList!11294 List!36460)) )
))
(declare-fun lt!670836 () ListLongMap!22557)

(declare-fun lt!670837 () V!59705)

(declare-fun contains!10204 (ListLongMap!22557 (_ BitVec 64)) Bool)

(declare-fun +!5059 (ListLongMap!22557 tuple2!25122) ListLongMap!22557)

(assert (=> b!1560841 (not (contains!10204 (+!5059 lt!670836 (tuple2!25123 (select (arr!50133 _keys!637) from!782) lt!670837)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51726 0))(
  ( (Unit!51727) )
))
(declare-fun lt!670838 () Unit!51726)

(declare-fun addStillNotContains!506 (ListLongMap!22557 (_ BitVec 64) V!59705 (_ BitVec 64)) Unit!51726)

(assert (=> b!1560841 (= lt!670838 (addStillNotContains!506 lt!670836 (select (arr!50133 _keys!637) from!782) lt!670837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26190 (ValueCell!18281 V!59705) V!59705)

(declare-fun dynLambda!3835 (Int (_ BitVec 64)) V!59705)

(assert (=> b!1560841 (= lt!670837 (get!26190 (select (arr!50134 _values!487) from!782) (dynLambda!3835 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59705)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59705)

(declare-fun getCurrentListMapNoExtraKeys!6668 (array!103880 array!103882 (_ BitVec 32) (_ BitVec 32) V!59705 V!59705 (_ BitVec 32) Int) ListLongMap!22557)

(assert (=> b!1560841 (= lt!670836 (getCurrentListMapNoExtraKeys!6668 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59310 () Bool)

(declare-fun mapRes!59310 () Bool)

(declare-fun tp!112995 () Bool)

(declare-fun e!869803 () Bool)

(assert (=> mapNonEmpty!59310 (= mapRes!59310 (and tp!112995 e!869803))))

(declare-fun mapValue!59310 () ValueCell!18281)

(declare-fun mapKey!59310 () (_ BitVec 32))

(declare-fun mapRest!59310 () (Array (_ BitVec 32) ValueCell!18281))

(assert (=> mapNonEmpty!59310 (= (arr!50134 _values!487) (store mapRest!59310 mapKey!59310 mapValue!59310))))

(declare-fun b!1560842 () Bool)

(declare-fun res!1067321 () Bool)

(assert (=> b!1560842 (=> (not res!1067321) (not e!869802))))

(declare-datatypes ((List!36461 0))(
  ( (Nil!36458) (Cons!36457 (h!37904 (_ BitVec 64)) (t!51200 List!36461)) )
))
(declare-fun arrayNoDuplicates!0 (array!103880 (_ BitVec 32) List!36461) Bool)

(assert (=> b!1560842 (= res!1067321 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36458))))

(declare-fun b!1560843 () Bool)

(assert (=> b!1560843 (= e!869803 tp_is_empty!38623)))

(declare-fun b!1560844 () Bool)

(declare-fun res!1067320 () Bool)

(assert (=> b!1560844 (=> (not res!1067320) (not e!869802))))

(assert (=> b!1560844 (= res!1067320 (and (= (size!50686 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50685 _keys!637) (size!50686 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560845 () Bool)

(declare-fun e!869804 () Bool)

(assert (=> b!1560845 (= e!869806 (and e!869804 mapRes!59310))))

(declare-fun condMapEmpty!59310 () Bool)

(declare-fun mapDefault!59310 () ValueCell!18281)

(assert (=> b!1560845 (= condMapEmpty!59310 (= (arr!50134 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18281)) mapDefault!59310)))))

(declare-fun b!1560846 () Bool)

(assert (=> b!1560846 (= e!869804 tp_is_empty!38623)))

(declare-fun b!1560847 () Bool)

(declare-fun res!1067322 () Bool)

(assert (=> b!1560847 (=> (not res!1067322) (not e!869802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103880 (_ BitVec 32)) Bool)

(assert (=> b!1560847 (= res!1067322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59310 () Bool)

(assert (=> mapIsEmpty!59310 mapRes!59310))

(assert (= (and start!133490 res!1067317) b!1560844))

(assert (= (and b!1560844 res!1067320) b!1560847))

(assert (= (and b!1560847 res!1067322) b!1560842))

(assert (= (and b!1560842 res!1067321) b!1560839))

(assert (= (and b!1560839 res!1067319) b!1560840))

(assert (= (and b!1560840 res!1067318) b!1560841))

(assert (= (and b!1560845 condMapEmpty!59310) mapIsEmpty!59310))

(assert (= (and b!1560845 (not condMapEmpty!59310)) mapNonEmpty!59310))

(get-info :version)

(assert (= (and mapNonEmpty!59310 ((_ is ValueCellFull!18281) mapValue!59310)) b!1560843))

(assert (= (and b!1560845 ((_ is ValueCellFull!18281) mapDefault!59310)) b!1560846))

(assert (= start!133490 b!1560845))

(declare-fun b_lambda!24821 () Bool)

(assert (=> (not b_lambda!24821) (not b!1560841)))

(declare-fun t!51198 () Bool)

(declare-fun tb!12493 () Bool)

(assert (=> (and start!133490 (= defaultEntry!495 defaultEntry!495) t!51198) tb!12493))

(declare-fun result!26275 () Bool)

(assert (=> tb!12493 (= result!26275 tp_is_empty!38623)))

(assert (=> b!1560841 t!51198))

(declare-fun b_and!51409 () Bool)

(assert (= b_and!51407 (and (=> t!51198 result!26275) b_and!51409)))

(declare-fun m!1435929 () Bool)

(assert (=> b!1560841 m!1435929))

(declare-fun m!1435931 () Bool)

(assert (=> b!1560841 m!1435931))

(declare-fun m!1435933 () Bool)

(assert (=> b!1560841 m!1435933))

(declare-fun m!1435935 () Bool)

(assert (=> b!1560841 m!1435935))

(assert (=> b!1560841 m!1435935))

(declare-fun m!1435937 () Bool)

(assert (=> b!1560841 m!1435937))

(assert (=> b!1560841 m!1435931))

(declare-fun m!1435939 () Bool)

(assert (=> b!1560841 m!1435939))

(assert (=> b!1560841 m!1435929))

(declare-fun m!1435941 () Bool)

(assert (=> b!1560841 m!1435941))

(assert (=> b!1560841 m!1435941))

(declare-fun m!1435943 () Bool)

(assert (=> b!1560841 m!1435943))

(assert (=> b!1560840 m!1435935))

(assert (=> b!1560840 m!1435935))

(declare-fun m!1435945 () Bool)

(assert (=> b!1560840 m!1435945))

(declare-fun m!1435947 () Bool)

(assert (=> start!133490 m!1435947))

(declare-fun m!1435949 () Bool)

(assert (=> start!133490 m!1435949))

(declare-fun m!1435951 () Bool)

(assert (=> start!133490 m!1435951))

(declare-fun m!1435953 () Bool)

(assert (=> b!1560842 m!1435953))

(declare-fun m!1435955 () Bool)

(assert (=> b!1560847 m!1435955))

(declare-fun m!1435957 () Bool)

(assert (=> mapNonEmpty!59310 m!1435957))

(check-sat (not b!1560847) (not b_lambda!24821) (not mapNonEmpty!59310) tp_is_empty!38623 b_and!51409 (not b!1560840) (not start!133490) (not b!1560841) (not b_next!31957) (not b!1560842))
(check-sat b_and!51409 (not b_next!31957))
