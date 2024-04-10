; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100760 () Bool)

(assert start!100760)

(declare-fun b_free!25931 () Bool)

(declare-fun b_next!25931 () Bool)

(assert (=> start!100760 (= b_free!25931 (not b_next!25931))))

(declare-fun tp!90796 () Bool)

(declare-fun b_and!42845 () Bool)

(assert (=> start!100760 (= tp!90796 b_and!42845)))

(declare-fun b!1205607 () Bool)

(declare-fun res!801891 () Bool)

(declare-fun e!684658 () Bool)

(assert (=> b!1205607 (=> (not res!801891) (not e!684658))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((array!78051 0))(
  ( (array!78052 (arr!37666 (Array (_ BitVec 32) (_ BitVec 64))) (size!38202 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78051)

(assert (=> b!1205607 (= res!801891 (= (select (arr!37666 _keys!1208) i!673) k!934))))

(declare-fun b!1205608 () Bool)

(declare-datatypes ((Unit!39969 0))(
  ( (Unit!39970) )
))
(declare-fun e!684657 () Unit!39969)

(declare-fun Unit!39971 () Unit!39969)

(assert (=> b!1205608 (= e!684657 Unit!39971)))

(declare-fun b!1205609 () Bool)

(declare-fun e!684647 () Bool)

(declare-fun tp_is_empty!30635 () Bool)

(assert (=> b!1205609 (= e!684647 tp_is_empty!30635)))

(declare-fun b!1205610 () Bool)

(declare-fun res!801883 () Bool)

(assert (=> b!1205610 (=> (not res!801883) (not e!684658))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205610 (= res!801883 (validMask!0 mask!1564))))

(declare-fun bm!58497 () Bool)

(declare-fun c!118311 () Bool)

(declare-datatypes ((V!45973 0))(
  ( (V!45974 (val!15374 Int)) )
))
(declare-datatypes ((tuple2!19720 0))(
  ( (tuple2!19721 (_1!9871 (_ BitVec 64)) (_2!9871 V!45973)) )
))
(declare-datatypes ((List!26526 0))(
  ( (Nil!26523) (Cons!26522 (h!27731 tuple2!19720) (t!39437 List!26526)) )
))
(declare-datatypes ((ListLongMap!17689 0))(
  ( (ListLongMap!17690 (toList!8860 List!26526)) )
))
(declare-fun lt!546832 () ListLongMap!17689)

(declare-fun call!58507 () Bool)

(declare-fun call!58504 () ListLongMap!17689)

(declare-fun contains!6920 (ListLongMap!17689 (_ BitVec 64)) Bool)

(assert (=> bm!58497 (= call!58507 (contains!6920 (ite c!118311 lt!546832 call!58504) k!934))))

(declare-fun zeroValue!944 () V!45973)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun call!58500 () ListLongMap!17689)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14608 0))(
  ( (ValueCellFull!14608 (v!18018 V!45973)) (EmptyCell!14608) )
))
(declare-datatypes ((array!78053 0))(
  ( (array!78054 (arr!37667 (Array (_ BitVec 32) ValueCell!14608)) (size!38203 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78053)

(declare-fun minValue!944 () V!45973)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!58498 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5295 (array!78051 array!78053 (_ BitVec 32) (_ BitVec 32) V!45973 V!45973 (_ BitVec 32) Int) ListLongMap!17689)

(assert (=> bm!58498 (= call!58500 (getCurrentListMapNoExtraKeys!5295 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205611 () Bool)

(declare-fun e!684653 () Bool)

(declare-fun e!684662 () Bool)

(assert (=> b!1205611 (= e!684653 (not e!684662))))

(declare-fun res!801881 () Bool)

(assert (=> b!1205611 (=> res!801881 e!684662)))

(assert (=> b!1205611 (= res!801881 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205611 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!546830 () Unit!39969)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78051 (_ BitVec 64) (_ BitVec 32)) Unit!39969)

(assert (=> b!1205611 (= lt!546830 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!801892 () Bool)

(assert (=> start!100760 (=> (not res!801892) (not e!684658))))

(assert (=> start!100760 (= res!801892 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38202 _keys!1208))))))

(assert (=> start!100760 e!684658))

(assert (=> start!100760 tp_is_empty!30635))

(declare-fun array_inv!28696 (array!78051) Bool)

(assert (=> start!100760 (array_inv!28696 _keys!1208)))

(assert (=> start!100760 true))

(assert (=> start!100760 tp!90796))

(declare-fun e!684648 () Bool)

(declare-fun array_inv!28697 (array!78053) Bool)

(assert (=> start!100760 (and (array_inv!28697 _values!996) e!684648)))

(declare-fun b!1205612 () Bool)

(declare-fun res!801879 () Bool)

(assert (=> b!1205612 (=> (not res!801879) (not e!684658))))

(assert (=> b!1205612 (= res!801879 (and (= (size!38203 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38202 _keys!1208) (size!38203 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!58499 () Bool)

(declare-fun call!58501 () Bool)

(assert (=> bm!58499 (= call!58501 call!58507)))

(declare-fun lt!546843 () Bool)

(declare-fun e!684649 () Bool)

(declare-fun b!1205613 () Bool)

(assert (=> b!1205613 (= e!684649 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546843) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1205614 () Bool)

(declare-fun res!801884 () Bool)

(assert (=> b!1205614 (=> (not res!801884) (not e!684658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78051 (_ BitVec 32)) Bool)

(assert (=> b!1205614 (= res!801884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1205615 () Bool)

(declare-fun e!684656 () Bool)

(declare-fun e!684655 () Bool)

(assert (=> b!1205615 (= e!684656 e!684655)))

(declare-fun res!801878 () Bool)

(assert (=> b!1205615 (=> res!801878 e!684655)))

(assert (=> b!1205615 (= res!801878 (not (= (select (arr!37666 _keys!1208) from!1455) k!934)))))

(declare-fun e!684651 () Bool)

(assert (=> b!1205615 e!684651))

(declare-fun c!118310 () Bool)

(assert (=> b!1205615 (= c!118310 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546831 () Unit!39969)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1028 (array!78051 array!78053 (_ BitVec 32) (_ BitVec 32) V!45973 V!45973 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39969)

(assert (=> b!1205615 (= lt!546831 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1028 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205616 () Bool)

(declare-fun res!801885 () Bool)

(assert (=> b!1205616 (=> (not res!801885) (not e!684658))))

(assert (=> b!1205616 (= res!801885 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38202 _keys!1208))))))

(declare-fun b!1205617 () Bool)

(declare-fun lt!546835 () Unit!39969)

(assert (=> b!1205617 (= e!684657 lt!546835)))

(declare-fun call!58506 () Unit!39969)

(assert (=> b!1205617 (= lt!546835 call!58506)))

(assert (=> b!1205617 call!58501))

(declare-fun b!1205618 () Bool)

(declare-fun c!118314 () Bool)

(assert (=> b!1205618 (= c!118314 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546843))))

(declare-fun e!684654 () Unit!39969)

(assert (=> b!1205618 (= e!684654 e!684657)))

(declare-fun mapIsEmpty!47808 () Bool)

(declare-fun mapRes!47808 () Bool)

(assert (=> mapIsEmpty!47808 mapRes!47808))

(declare-fun lt!546841 () array!78051)

(declare-fun call!58505 () ListLongMap!17689)

(declare-fun lt!546837 () array!78053)

(declare-fun bm!58500 () Bool)

(assert (=> bm!58500 (= call!58505 (getCurrentListMapNoExtraKeys!5295 lt!546841 lt!546837 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205619 () Bool)

(declare-fun res!801888 () Bool)

(assert (=> b!1205619 (=> (not res!801888) (not e!684658))))

(declare-datatypes ((List!26527 0))(
  ( (Nil!26524) (Cons!26523 (h!27732 (_ BitVec 64)) (t!39438 List!26527)) )
))
(declare-fun arrayNoDuplicates!0 (array!78051 (_ BitVec 32) List!26527) Bool)

(assert (=> b!1205619 (= res!801888 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26524))))

(declare-fun bm!58501 () Bool)

(declare-fun call!58503 () ListLongMap!17689)

(assert (=> bm!58501 (= call!58504 call!58503)))

(declare-fun b!1205620 () Bool)

(assert (=> b!1205620 call!58501))

(declare-fun lt!546836 () Unit!39969)

(assert (=> b!1205620 (= lt!546836 call!58506)))

(assert (=> b!1205620 (= e!684654 lt!546836)))

(declare-fun b!1205621 () Bool)

(assert (=> b!1205621 (= e!684648 (and e!684647 mapRes!47808))))

(declare-fun condMapEmpty!47808 () Bool)

(declare-fun mapDefault!47808 () ValueCell!14608)

