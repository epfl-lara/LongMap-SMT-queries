; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133530 () Bool)

(assert start!133530)

(declare-fun b_free!31947 () Bool)

(declare-fun b_next!31947 () Bool)

(assert (=> start!133530 (= b_free!31947 (not b_next!31947))))

(declare-fun tp!112965 () Bool)

(declare-fun b_and!51405 () Bool)

(assert (=> start!133530 (= tp!112965 b_and!51405)))

(declare-fun b!1561007 () Bool)

(declare-fun res!1067359 () Bool)

(declare-fun e!869928 () Bool)

(assert (=> b!1561007 (=> (not res!1067359) (not e!869928))))

(declare-datatypes ((array!103944 0))(
  ( (array!103945 (arr!50164 (Array (_ BitVec 32) (_ BitVec 64))) (size!50714 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103944)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561007 (= res!1067359 (validKeyInArray!0 (select (arr!50164 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59295 () Bool)

(declare-fun mapRes!59295 () Bool)

(declare-fun tp!112964 () Bool)

(declare-fun e!869929 () Bool)

(assert (=> mapNonEmpty!59295 (= mapRes!59295 (and tp!112964 e!869929))))

(declare-datatypes ((V!59691 0))(
  ( (V!59692 (val!19390 Int)) )
))
(declare-datatypes ((ValueCell!18276 0))(
  ( (ValueCellFull!18276 (v!22142 V!59691)) (EmptyCell!18276) )
))
(declare-fun mapRest!59295 () (Array (_ BitVec 32) ValueCell!18276))

(declare-fun mapValue!59295 () ValueCell!18276)

(declare-fun mapKey!59295 () (_ BitVec 32))

(declare-datatypes ((array!103946 0))(
  ( (array!103947 (arr!50165 (Array (_ BitVec 32) ValueCell!18276)) (size!50715 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103946)

(assert (=> mapNonEmpty!59295 (= (arr!50165 _values!487) (store mapRest!59295 mapKey!59295 mapValue!59295))))

(declare-fun b!1561008 () Bool)

(declare-fun e!869926 () Bool)

(declare-fun tp_is_empty!38613 () Bool)

(assert (=> b!1561008 (= e!869926 tp_is_empty!38613)))

(declare-fun b!1561009 () Bool)

(assert (=> b!1561009 (= e!869928 (not true))))

(declare-fun lt!671077 () V!59691)

(declare-datatypes ((tuple2!25044 0))(
  ( (tuple2!25045 (_1!12533 (_ BitVec 64)) (_2!12533 V!59691)) )
))
(declare-datatypes ((List!36417 0))(
  ( (Nil!36414) (Cons!36413 (h!37859 tuple2!25044) (t!51154 List!36417)) )
))
(declare-datatypes ((ListLongMap!22479 0))(
  ( (ListLongMap!22480 (toList!11255 List!36417)) )
))
(declare-fun lt!671078 () ListLongMap!22479)

(declare-fun contains!10245 (ListLongMap!22479 (_ BitVec 64)) Bool)

(declare-fun +!5025 (ListLongMap!22479 tuple2!25044) ListLongMap!22479)

(assert (=> b!1561009 (not (contains!10245 (+!5025 lt!671078 (tuple2!25045 (select (arr!50164 _keys!637) from!782) lt!671077)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51904 0))(
  ( (Unit!51905) )
))
(declare-fun lt!671079 () Unit!51904)

(declare-fun addStillNotContains!515 (ListLongMap!22479 (_ BitVec 64) V!59691 (_ BitVec 64)) Unit!51904)

(assert (=> b!1561009 (= lt!671079 (addStillNotContains!515 lt!671078 (select (arr!50164 _keys!637) from!782) lt!671077 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26184 (ValueCell!18276 V!59691) V!59691)

(declare-fun dynLambda!3809 (Int (_ BitVec 64)) V!59691)

(assert (=> b!1561009 (= lt!671077 (get!26184 (select (arr!50165 _values!487) from!782) (dynLambda!3809 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59691)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59691)

(declare-fun getCurrentListMapNoExtraKeys!6639 (array!103944 array!103946 (_ BitVec 32) (_ BitVec 32) V!59691 V!59691 (_ BitVec 32) Int) ListLongMap!22479)

(assert (=> b!1561009 (= lt!671078 (getCurrentListMapNoExtraKeys!6639 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59295 () Bool)

(assert (=> mapIsEmpty!59295 mapRes!59295))

(declare-fun b!1561010 () Bool)

(assert (=> b!1561010 (= e!869929 tp_is_empty!38613)))

(declare-fun b!1561012 () Bool)

(declare-fun e!869925 () Bool)

(assert (=> b!1561012 (= e!869925 (and e!869926 mapRes!59295))))

(declare-fun condMapEmpty!59295 () Bool)

(declare-fun mapDefault!59295 () ValueCell!18276)

(assert (=> b!1561012 (= condMapEmpty!59295 (= (arr!50165 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18276)) mapDefault!59295)))))

(declare-fun b!1561013 () Bool)

(declare-fun res!1067357 () Bool)

(assert (=> b!1561013 (=> (not res!1067357) (not e!869928))))

(declare-datatypes ((List!36418 0))(
  ( (Nil!36415) (Cons!36414 (h!37860 (_ BitVec 64)) (t!51155 List!36418)) )
))
(declare-fun arrayNoDuplicates!0 (array!103944 (_ BitVec 32) List!36418) Bool)

(assert (=> b!1561013 (= res!1067357 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36415))))

(declare-fun b!1561014 () Bool)

(declare-fun res!1067356 () Bool)

(assert (=> b!1561014 (=> (not res!1067356) (not e!869928))))

(assert (=> b!1561014 (= res!1067356 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50714 _keys!637)) (bvslt from!782 (size!50714 _keys!637))))))

(declare-fun b!1561015 () Bool)

(declare-fun res!1067360 () Bool)

(assert (=> b!1561015 (=> (not res!1067360) (not e!869928))))

(assert (=> b!1561015 (= res!1067360 (and (= (size!50715 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50714 _keys!637) (size!50715 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561011 () Bool)

(declare-fun res!1067358 () Bool)

(assert (=> b!1561011 (=> (not res!1067358) (not e!869928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103944 (_ BitVec 32)) Bool)

(assert (=> b!1561011 (= res!1067358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1067361 () Bool)

(assert (=> start!133530 (=> (not res!1067361) (not e!869928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133530 (= res!1067361 (validMask!0 mask!947))))

(assert (=> start!133530 e!869928))

(assert (=> start!133530 tp!112965))

(assert (=> start!133530 tp_is_empty!38613))

(assert (=> start!133530 true))

(declare-fun array_inv!38995 (array!103944) Bool)

(assert (=> start!133530 (array_inv!38995 _keys!637)))

(declare-fun array_inv!38996 (array!103946) Bool)

(assert (=> start!133530 (and (array_inv!38996 _values!487) e!869925)))

(assert (= (and start!133530 res!1067361) b!1561015))

(assert (= (and b!1561015 res!1067360) b!1561011))

(assert (= (and b!1561011 res!1067358) b!1561013))

(assert (= (and b!1561013 res!1067357) b!1561014))

(assert (= (and b!1561014 res!1067356) b!1561007))

(assert (= (and b!1561007 res!1067359) b!1561009))

(assert (= (and b!1561012 condMapEmpty!59295) mapIsEmpty!59295))

(assert (= (and b!1561012 (not condMapEmpty!59295)) mapNonEmpty!59295))

(get-info :version)

(assert (= (and mapNonEmpty!59295 ((_ is ValueCellFull!18276) mapValue!59295)) b!1561010))

(assert (= (and b!1561012 ((_ is ValueCellFull!18276) mapDefault!59295)) b!1561008))

(assert (= start!133530 b!1561012))

(declare-fun b_lambda!24821 () Bool)

(assert (=> (not b_lambda!24821) (not b!1561009)))

(declare-fun t!51153 () Bool)

(declare-fun tb!12491 () Bool)

(assert (=> (and start!133530 (= defaultEntry!495 defaultEntry!495) t!51153) tb!12491))

(declare-fun result!26263 () Bool)

(assert (=> tb!12491 (= result!26263 tp_is_empty!38613)))

(assert (=> b!1561009 t!51153))

(declare-fun b_and!51407 () Bool)

(assert (= b_and!51405 (and (=> t!51153 result!26263) b_and!51407)))

(declare-fun m!1436671 () Bool)

(assert (=> start!133530 m!1436671))

(declare-fun m!1436673 () Bool)

(assert (=> start!133530 m!1436673))

(declare-fun m!1436675 () Bool)

(assert (=> start!133530 m!1436675))

(declare-fun m!1436677 () Bool)

(assert (=> b!1561009 m!1436677))

(declare-fun m!1436679 () Bool)

(assert (=> b!1561009 m!1436679))

(declare-fun m!1436681 () Bool)

(assert (=> b!1561009 m!1436681))

(declare-fun m!1436683 () Bool)

(assert (=> b!1561009 m!1436683))

(declare-fun m!1436685 () Bool)

(assert (=> b!1561009 m!1436685))

(assert (=> b!1561009 m!1436677))

(declare-fun m!1436687 () Bool)

(assert (=> b!1561009 m!1436687))

(assert (=> b!1561009 m!1436679))

(assert (=> b!1561009 m!1436687))

(declare-fun m!1436689 () Bool)

(assert (=> b!1561009 m!1436689))

(declare-fun m!1436691 () Bool)

(assert (=> b!1561009 m!1436691))

(assert (=> b!1561009 m!1436683))

(declare-fun m!1436693 () Bool)

(assert (=> b!1561013 m!1436693))

(declare-fun m!1436695 () Bool)

(assert (=> mapNonEmpty!59295 m!1436695))

(declare-fun m!1436697 () Bool)

(assert (=> b!1561011 m!1436697))

(assert (=> b!1561007 m!1436687))

(assert (=> b!1561007 m!1436687))

(declare-fun m!1436699 () Bool)

(assert (=> b!1561007 m!1436699))

(check-sat (not b!1561009) tp_is_empty!38613 b_and!51407 (not mapNonEmpty!59295) (not b!1561013) (not b!1561011) (not start!133530) (not b_lambda!24821) (not b!1561007) (not b_next!31947))
(check-sat b_and!51407 (not b_next!31947))
