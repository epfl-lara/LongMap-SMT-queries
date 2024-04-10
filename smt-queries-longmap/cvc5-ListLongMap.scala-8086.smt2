; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99382 () Bool)

(assert start!99382)

(declare-fun b_free!24961 () Bool)

(declare-fun b_next!24961 () Bool)

(assert (=> start!99382 (= b_free!24961 (not b_next!24961))))

(declare-fun tp!87597 () Bool)

(declare-fun b_and!40789 () Bool)

(assert (=> start!99382 (= tp!87597 b_and!40789)))

(declare-fun mapNonEmpty!46064 () Bool)

(declare-fun mapRes!46064 () Bool)

(declare-fun tp!87596 () Bool)

(declare-fun e!666577 () Bool)

(assert (=> mapNonEmpty!46064 (= mapRes!46064 (and tp!87596 e!666577))))

(declare-datatypes ((V!44449 0))(
  ( (V!44450 (val!14802 Int)) )
))
(declare-datatypes ((ValueCell!14036 0))(
  ( (ValueCellFull!14036 (v!17440 V!44449)) (EmptyCell!14036) )
))
(declare-fun mapRest!46064 () (Array (_ BitVec 32) ValueCell!14036))

(declare-fun mapKey!46064 () (_ BitVec 32))

(declare-datatypes ((array!75795 0))(
  ( (array!75796 (arr!36547 (Array (_ BitVec 32) ValueCell!14036)) (size!37083 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75795)

(declare-fun mapValue!46064 () ValueCell!14036)

(assert (=> mapNonEmpty!46064 (= (arr!36547 _values!996) (store mapRest!46064 mapKey!46064 mapValue!46064))))

(declare-fun b!1172735 () Bool)

(declare-fun res!778695 () Bool)

(declare-fun e!666584 () Bool)

(assert (=> b!1172735 (=> (not res!778695) (not e!666584))))

(declare-datatypes ((array!75797 0))(
  ( (array!75798 (arr!36548 (Array (_ BitVec 32) (_ BitVec 64))) (size!37084 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75797)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75797 (_ BitVec 32)) Bool)

(assert (=> b!1172735 (= res!778695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172736 () Bool)

(declare-fun e!666578 () Bool)

(declare-fun tp_is_empty!29491 () Bool)

(assert (=> b!1172736 (= e!666578 tp_is_empty!29491)))

(declare-fun b!1172737 () Bool)

(declare-fun res!778694 () Bool)

(assert (=> b!1172737 (=> (not res!778694) (not e!666584))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1172737 (= res!778694 (= (select (arr!36548 _keys!1208) i!673) k!934))))

(declare-fun b!1172738 () Bool)

(declare-fun res!778687 () Bool)

(declare-fun e!666579 () Bool)

(assert (=> b!1172738 (=> (not res!778687) (not e!666579))))

(declare-fun lt!528452 () array!75797)

(declare-datatypes ((List!25651 0))(
  ( (Nil!25648) (Cons!25647 (h!26856 (_ BitVec 64)) (t!37604 List!25651)) )
))
(declare-fun arrayNoDuplicates!0 (array!75797 (_ BitVec 32) List!25651) Bool)

(assert (=> b!1172738 (= res!778687 (arrayNoDuplicates!0 lt!528452 #b00000000000000000000000000000000 Nil!25648))))

(declare-fun b!1172739 () Bool)

(declare-fun res!778686 () Bool)

(assert (=> b!1172739 (=> (not res!778686) (not e!666584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172739 (= res!778686 (validKeyInArray!0 k!934))))

(declare-fun b!1172740 () Bool)

(declare-fun res!778690 () Bool)

(assert (=> b!1172740 (=> (not res!778690) (not e!666584))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1172740 (= res!778690 (and (= (size!37083 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37084 _keys!1208) (size!37083 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172741 () Bool)

(declare-fun e!666583 () Bool)

(declare-fun e!666581 () Bool)

(assert (=> b!1172741 (= e!666583 e!666581)))

(declare-fun res!778692 () Bool)

(assert (=> b!1172741 (=> res!778692 e!666581)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1172741 (= res!778692 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44449)

(declare-fun lt!528451 () array!75795)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44449)

(declare-datatypes ((tuple2!18914 0))(
  ( (tuple2!18915 (_1!9468 (_ BitVec 64)) (_2!9468 V!44449)) )
))
(declare-datatypes ((List!25652 0))(
  ( (Nil!25649) (Cons!25648 (h!26857 tuple2!18914) (t!37605 List!25652)) )
))
(declare-datatypes ((ListLongMap!16883 0))(
  ( (ListLongMap!16884 (toList!8457 List!25652)) )
))
(declare-fun lt!528459 () ListLongMap!16883)

(declare-fun getCurrentListMapNoExtraKeys!4921 (array!75797 array!75795 (_ BitVec 32) (_ BitVec 32) V!44449 V!44449 (_ BitVec 32) Int) ListLongMap!16883)

(assert (=> b!1172741 (= lt!528459 (getCurrentListMapNoExtraKeys!4921 lt!528452 lt!528451 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528458 () V!44449)

(assert (=> b!1172741 (= lt!528451 (array!75796 (store (arr!36547 _values!996) i!673 (ValueCellFull!14036 lt!528458)) (size!37083 _values!996)))))

(declare-fun dynLambda!2892 (Int (_ BitVec 64)) V!44449)

(assert (=> b!1172741 (= lt!528458 (dynLambda!2892 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528454 () ListLongMap!16883)

(assert (=> b!1172741 (= lt!528454 (getCurrentListMapNoExtraKeys!4921 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172742 () Bool)

(declare-fun res!778696 () Bool)

(assert (=> b!1172742 (=> (not res!778696) (not e!666584))))

(assert (=> b!1172742 (= res!778696 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37084 _keys!1208))))))

(declare-fun mapIsEmpty!46064 () Bool)

(assert (=> mapIsEmpty!46064 mapRes!46064))

(declare-fun b!1172743 () Bool)

(declare-fun e!666580 () Bool)

(declare-fun arrayContainsKey!0 (array!75797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172743 (= e!666580 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1172744 () Bool)

(declare-datatypes ((Unit!38668 0))(
  ( (Unit!38669) )
))
(declare-fun e!666586 () Unit!38668)

(declare-fun Unit!38670 () Unit!38668)

(assert (=> b!1172744 (= e!666586 Unit!38670)))

(declare-fun b!1172745 () Bool)

(assert (=> b!1172745 (= e!666584 e!666579)))

(declare-fun res!778688 () Bool)

(assert (=> b!1172745 (=> (not res!778688) (not e!666579))))

(assert (=> b!1172745 (= res!778688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528452 mask!1564))))

(assert (=> b!1172745 (= lt!528452 (array!75798 (store (arr!36548 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37084 _keys!1208)))))

(declare-fun b!1172746 () Bool)

(declare-fun e!666576 () Bool)

(assert (=> b!1172746 (= e!666576 true)))

(assert (=> b!1172746 (not (= (select (arr!36548 _keys!1208) from!1455) k!934))))

(declare-fun lt!528461 () Unit!38668)

(assert (=> b!1172746 (= lt!528461 e!666586)))

(declare-fun c!116565 () Bool)

(assert (=> b!1172746 (= c!116565 (= (select (arr!36548 _keys!1208) from!1455) k!934))))

(declare-fun e!666585 () Bool)

(assert (=> b!1172746 e!666585))

(declare-fun res!778693 () Bool)

(assert (=> b!1172746 (=> (not res!778693) (not e!666585))))

(declare-fun lt!528457 () ListLongMap!16883)

(declare-fun +!3777 (ListLongMap!16883 tuple2!18914) ListLongMap!16883)

(declare-fun get!18645 (ValueCell!14036 V!44449) V!44449)

(assert (=> b!1172746 (= res!778693 (= lt!528459 (+!3777 lt!528457 (tuple2!18915 (select (arr!36548 _keys!1208) from!1455) (get!18645 (select (arr!36547 _values!996) from!1455) lt!528458)))))))

(declare-fun b!1172747 () Bool)

(declare-fun e!666575 () Bool)

(assert (=> b!1172747 (= e!666575 (and e!666578 mapRes!46064))))

(declare-fun condMapEmpty!46064 () Bool)

(declare-fun mapDefault!46064 () ValueCell!14036)

