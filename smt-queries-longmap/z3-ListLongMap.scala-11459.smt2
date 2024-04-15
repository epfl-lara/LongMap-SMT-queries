; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133502 () Bool)

(assert start!133502)

(declare-fun b_free!31969 () Bool)

(declare-fun b_next!31969 () Bool)

(assert (=> start!133502 (= b_free!31969 (not b_next!31969))))

(declare-fun tp!113031 () Bool)

(declare-fun b_and!51431 () Bool)

(assert (=> start!133502 (= tp!113031 b_and!51431)))

(declare-fun res!1067430 () Bool)

(declare-fun e!869892 () Bool)

(assert (=> start!133502 (=> (not res!1067430) (not e!869892))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133502 (= res!1067430 (validMask!0 mask!947))))

(assert (=> start!133502 e!869892))

(assert (=> start!133502 tp!113031))

(declare-fun tp_is_empty!38635 () Bool)

(assert (=> start!133502 tp_is_empty!38635))

(assert (=> start!133502 true))

(declare-datatypes ((array!103900 0))(
  ( (array!103901 (arr!50143 (Array (_ BitVec 32) (_ BitVec 64))) (size!50695 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103900)

(declare-fun array_inv!39163 (array!103900) Bool)

(assert (=> start!133502 (array_inv!39163 _keys!637)))

(declare-datatypes ((V!59721 0))(
  ( (V!59722 (val!19401 Int)) )
))
(declare-datatypes ((ValueCell!18287 0))(
  ( (ValueCellFull!18287 (v!22149 V!59721)) (EmptyCell!18287) )
))
(declare-datatypes ((array!103902 0))(
  ( (array!103903 (arr!50144 (Array (_ BitVec 32) ValueCell!18287)) (size!50696 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103902)

(declare-fun e!869895 () Bool)

(declare-fun array_inv!39164 (array!103902) Bool)

(assert (=> start!133502 (and (array_inv!39164 _values!487) e!869895)))

(declare-fun b!1561013 () Bool)

(declare-fun res!1067426 () Bool)

(assert (=> b!1561013 (=> (not res!1067426) (not e!869892))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561013 (= res!1067426 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50695 _keys!637)) (bvslt from!782 (size!50695 _keys!637))))))

(declare-fun b!1561014 () Bool)

(declare-fun res!1067427 () Bool)

(assert (=> b!1561014 (=> (not res!1067427) (not e!869892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561014 (= res!1067427 (validKeyInArray!0 (select (arr!50143 _keys!637) from!782)))))

(declare-fun b!1561015 () Bool)

(declare-fun e!869896 () Bool)

(assert (=> b!1561015 (= e!869896 tp_is_empty!38635)))

(declare-fun b!1561016 () Bool)

(declare-fun e!869893 () Bool)

(assert (=> b!1561016 (= e!869893 tp_is_empty!38635)))

(declare-fun b!1561017 () Bool)

(declare-fun res!1067429 () Bool)

(assert (=> b!1561017 (=> (not res!1067429) (not e!869892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103900 (_ BitVec 32)) Bool)

(assert (=> b!1561017 (= res!1067429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561018 () Bool)

(assert (=> b!1561018 (= e!869892 (not true))))

(declare-fun lt!670891 () V!59721)

(declare-datatypes ((tuple2!25128 0))(
  ( (tuple2!25129 (_1!12575 (_ BitVec 64)) (_2!12575 V!59721)) )
))
(declare-datatypes ((List!36465 0))(
  ( (Nil!36462) (Cons!36461 (h!37908 tuple2!25128) (t!51216 List!36465)) )
))
(declare-datatypes ((ListLongMap!22563 0))(
  ( (ListLongMap!22564 (toList!11297 List!36465)) )
))
(declare-fun lt!670890 () ListLongMap!22563)

(declare-fun contains!10207 (ListLongMap!22563 (_ BitVec 64)) Bool)

(declare-fun +!5062 (ListLongMap!22563 tuple2!25128) ListLongMap!22563)

(assert (=> b!1561018 (not (contains!10207 (+!5062 lt!670890 (tuple2!25129 (select (arr!50143 _keys!637) from!782) lt!670891)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51732 0))(
  ( (Unit!51733) )
))
(declare-fun lt!670892 () Unit!51732)

(declare-fun addStillNotContains!509 (ListLongMap!22563 (_ BitVec 64) V!59721 (_ BitVec 64)) Unit!51732)

(assert (=> b!1561018 (= lt!670892 (addStillNotContains!509 lt!670890 (select (arr!50143 _keys!637) from!782) lt!670891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26197 (ValueCell!18287 V!59721) V!59721)

(declare-fun dynLambda!3838 (Int (_ BitVec 64)) V!59721)

(assert (=> b!1561018 (= lt!670891 (get!26197 (select (arr!50144 _values!487) from!782) (dynLambda!3838 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59721)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59721)

(declare-fun getCurrentListMapNoExtraKeys!6671 (array!103900 array!103902 (_ BitVec 32) (_ BitVec 32) V!59721 V!59721 (_ BitVec 32) Int) ListLongMap!22563)

(assert (=> b!1561018 (= lt!670890 (getCurrentListMapNoExtraKeys!6671 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561019 () Bool)

(declare-fun res!1067425 () Bool)

(assert (=> b!1561019 (=> (not res!1067425) (not e!869892))))

(assert (=> b!1561019 (= res!1067425 (and (= (size!50696 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50695 _keys!637) (size!50696 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561020 () Bool)

(declare-fun res!1067428 () Bool)

(assert (=> b!1561020 (=> (not res!1067428) (not e!869892))))

(declare-datatypes ((List!36466 0))(
  ( (Nil!36463) (Cons!36462 (h!37909 (_ BitVec 64)) (t!51217 List!36466)) )
))
(declare-fun arrayNoDuplicates!0 (array!103900 (_ BitVec 32) List!36466) Bool)

(assert (=> b!1561020 (= res!1067428 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36463))))

(declare-fun mapIsEmpty!59328 () Bool)

(declare-fun mapRes!59328 () Bool)

(assert (=> mapIsEmpty!59328 mapRes!59328))

(declare-fun b!1561021 () Bool)

(assert (=> b!1561021 (= e!869895 (and e!869896 mapRes!59328))))

(declare-fun condMapEmpty!59328 () Bool)

(declare-fun mapDefault!59328 () ValueCell!18287)

(assert (=> b!1561021 (= condMapEmpty!59328 (= (arr!50144 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18287)) mapDefault!59328)))))

(declare-fun mapNonEmpty!59328 () Bool)

(declare-fun tp!113032 () Bool)

(assert (=> mapNonEmpty!59328 (= mapRes!59328 (and tp!113032 e!869893))))

(declare-fun mapRest!59328 () (Array (_ BitVec 32) ValueCell!18287))

(declare-fun mapKey!59328 () (_ BitVec 32))

(declare-fun mapValue!59328 () ValueCell!18287)

(assert (=> mapNonEmpty!59328 (= (arr!50144 _values!487) (store mapRest!59328 mapKey!59328 mapValue!59328))))

(assert (= (and start!133502 res!1067430) b!1561019))

(assert (= (and b!1561019 res!1067425) b!1561017))

(assert (= (and b!1561017 res!1067429) b!1561020))

(assert (= (and b!1561020 res!1067428) b!1561013))

(assert (= (and b!1561013 res!1067426) b!1561014))

(assert (= (and b!1561014 res!1067427) b!1561018))

(assert (= (and b!1561021 condMapEmpty!59328) mapIsEmpty!59328))

(assert (= (and b!1561021 (not condMapEmpty!59328)) mapNonEmpty!59328))

(get-info :version)

(assert (= (and mapNonEmpty!59328 ((_ is ValueCellFull!18287) mapValue!59328)) b!1561016))

(assert (= (and b!1561021 ((_ is ValueCellFull!18287) mapDefault!59328)) b!1561015))

(assert (= start!133502 b!1561021))

(declare-fun b_lambda!24833 () Bool)

(assert (=> (not b_lambda!24833) (not b!1561018)))

(declare-fun t!51215 () Bool)

(declare-fun tb!12505 () Bool)

(assert (=> (and start!133502 (= defaultEntry!495 defaultEntry!495) t!51215) tb!12505))

(declare-fun result!26299 () Bool)

(assert (=> tb!12505 (= result!26299 tp_is_empty!38635)))

(assert (=> b!1561018 t!51215))

(declare-fun b_and!51433 () Bool)

(assert (= b_and!51431 (and (=> t!51215 result!26299) b_and!51433)))

(declare-fun m!1436109 () Bool)

(assert (=> b!1561017 m!1436109))

(declare-fun m!1436111 () Bool)

(assert (=> mapNonEmpty!59328 m!1436111))

(declare-fun m!1436113 () Bool)

(assert (=> b!1561020 m!1436113))

(declare-fun m!1436115 () Bool)

(assert (=> b!1561014 m!1436115))

(assert (=> b!1561014 m!1436115))

(declare-fun m!1436117 () Bool)

(assert (=> b!1561014 m!1436117))

(declare-fun m!1436119 () Bool)

(assert (=> start!133502 m!1436119))

(declare-fun m!1436121 () Bool)

(assert (=> start!133502 m!1436121))

(declare-fun m!1436123 () Bool)

(assert (=> start!133502 m!1436123))

(declare-fun m!1436125 () Bool)

(assert (=> b!1561018 m!1436125))

(declare-fun m!1436127 () Bool)

(assert (=> b!1561018 m!1436127))

(declare-fun m!1436129 () Bool)

(assert (=> b!1561018 m!1436129))

(declare-fun m!1436131 () Bool)

(assert (=> b!1561018 m!1436131))

(declare-fun m!1436133 () Bool)

(assert (=> b!1561018 m!1436133))

(assert (=> b!1561018 m!1436125))

(assert (=> b!1561018 m!1436115))

(assert (=> b!1561018 m!1436115))

(declare-fun m!1436135 () Bool)

(assert (=> b!1561018 m!1436135))

(assert (=> b!1561018 m!1436127))

(assert (=> b!1561018 m!1436131))

(declare-fun m!1436137 () Bool)

(assert (=> b!1561018 m!1436137))

(check-sat tp_is_empty!38635 (not mapNonEmpty!59328) (not b!1561018) (not start!133502) (not b!1561017) (not b!1561020) (not b_next!31969) (not b_lambda!24833) b_and!51433 (not b!1561014))
(check-sat b_and!51433 (not b_next!31969))
