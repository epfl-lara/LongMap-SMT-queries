; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133562 () Bool)

(assert start!133562)

(declare-fun b_free!32029 () Bool)

(declare-fun b_next!32029 () Bool)

(assert (=> start!133562 (= b_free!32029 (not b_next!32029))))

(declare-fun tp!113211 () Bool)

(declare-fun b_and!51551 () Bool)

(assert (=> start!133562 (= tp!113211 b_and!51551)))

(declare-fun b!1561893 () Bool)

(declare-fun e!870355 () Bool)

(declare-fun tp_is_empty!38695 () Bool)

(assert (=> b!1561893 (= e!870355 tp_is_empty!38695)))

(declare-fun b!1561894 () Bool)

(declare-fun e!870352 () Bool)

(declare-fun mapRes!59418 () Bool)

(assert (=> b!1561894 (= e!870352 (and e!870355 mapRes!59418))))

(declare-fun condMapEmpty!59418 () Bool)

(declare-datatypes ((V!59801 0))(
  ( (V!59802 (val!19431 Int)) )
))
(declare-datatypes ((ValueCell!18317 0))(
  ( (ValueCellFull!18317 (v!22179 V!59801)) (EmptyCell!18317) )
))
(declare-datatypes ((array!104018 0))(
  ( (array!104019 (arr!50202 (Array (_ BitVec 32) ValueCell!18317)) (size!50754 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104018)

(declare-fun mapDefault!59418 () ValueCell!18317)

(assert (=> b!1561894 (= condMapEmpty!59418 (= (arr!50202 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18317)) mapDefault!59418)))))

(declare-fun b!1561895 () Bool)

(declare-fun res!1067976 () Bool)

(declare-fun e!870353 () Bool)

(assert (=> b!1561895 (=> (not res!1067976) (not e!870353))))

(declare-datatypes ((array!104020 0))(
  ( (array!104021 (arr!50203 (Array (_ BitVec 32) (_ BitVec 64))) (size!50755 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104020)

(declare-datatypes ((List!36512 0))(
  ( (Nil!36509) (Cons!36508 (h!37955 (_ BitVec 64)) (t!51323 List!36512)) )
))
(declare-fun arrayNoDuplicates!0 (array!104020 (_ BitVec 32) List!36512) Bool)

(assert (=> b!1561895 (= res!1067976 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36509))))

(declare-fun mapNonEmpty!59418 () Bool)

(declare-fun tp!113212 () Bool)

(declare-fun e!870351 () Bool)

(assert (=> mapNonEmpty!59418 (= mapRes!59418 (and tp!113212 e!870351))))

(declare-fun mapRest!59418 () (Array (_ BitVec 32) ValueCell!18317))

(declare-fun mapValue!59418 () ValueCell!18317)

(declare-fun mapKey!59418 () (_ BitVec 32))

(assert (=> mapNonEmpty!59418 (= (arr!50202 _values!487) (store mapRest!59418 mapKey!59418 mapValue!59418))))

(declare-fun b!1561896 () Bool)

(declare-fun res!1067979 () Bool)

(assert (=> b!1561896 (=> (not res!1067979) (not e!870353))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104020 (_ BitVec 32)) Bool)

(assert (=> b!1561896 (= res!1067979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561897 () Bool)

(assert (=> b!1561897 (= e!870351 tp_is_empty!38695)))

(declare-fun res!1067977 () Bool)

(assert (=> start!133562 (=> (not res!1067977) (not e!870353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133562 (= res!1067977 (validMask!0 mask!947))))

(assert (=> start!133562 e!870353))

(assert (=> start!133562 tp!113211))

(assert (=> start!133562 tp_is_empty!38695))

(assert (=> start!133562 true))

(declare-fun array_inv!39207 (array!104020) Bool)

(assert (=> start!133562 (array_inv!39207 _keys!637)))

(declare-fun array_inv!39208 (array!104018) Bool)

(assert (=> start!133562 (and (array_inv!39208 _values!487) e!870352)))

(declare-fun b!1561892 () Bool)

(declare-fun res!1067975 () Bool)

(assert (=> b!1561892 (=> (not res!1067975) (not e!870353))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561892 (= res!1067975 (validKeyInArray!0 (select (arr!50203 _keys!637) from!782)))))

(declare-fun b!1561898 () Bool)

(declare-fun res!1067978 () Bool)

(assert (=> b!1561898 (=> (not res!1067978) (not e!870353))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561898 (= res!1067978 (and (= (size!50754 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50755 _keys!637) (size!50754 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561899 () Bool)

(declare-fun res!1067974 () Bool)

(assert (=> b!1561899 (=> (not res!1067974) (not e!870353))))

(assert (=> b!1561899 (= res!1067974 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50755 _keys!637)) (bvslt from!782 (size!50755 _keys!637))))))

(declare-fun mapIsEmpty!59418 () Bool)

(assert (=> mapIsEmpty!59418 mapRes!59418))

(declare-fun b!1561900 () Bool)

(assert (=> b!1561900 (= e!870353 (not true))))

(declare-fun lt!671254 () Bool)

(declare-datatypes ((tuple2!25172 0))(
  ( (tuple2!25173 (_1!12597 (_ BitVec 64)) (_2!12597 V!59801)) )
))
(declare-datatypes ((List!36513 0))(
  ( (Nil!36510) (Cons!36509 (h!37956 tuple2!25172) (t!51324 List!36513)) )
))
(declare-datatypes ((ListLongMap!22607 0))(
  ( (ListLongMap!22608 (toList!11319 List!36513)) )
))
(declare-fun lt!671255 () ListLongMap!22607)

(declare-fun contains!10229 (ListLongMap!22607 (_ BitVec 64)) Bool)

(assert (=> b!1561900 (= lt!671254 (contains!10229 lt!671255 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561900 (not (contains!10229 lt!671255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671258 () V!59801)

(declare-fun lt!671257 () ListLongMap!22607)

(declare-fun +!5084 (ListLongMap!22607 tuple2!25172) ListLongMap!22607)

(assert (=> b!1561900 (= lt!671255 (+!5084 lt!671257 (tuple2!25173 (select (arr!50203 _keys!637) from!782) lt!671258)))))

(declare-datatypes ((Unit!51776 0))(
  ( (Unit!51777) )
))
(declare-fun lt!671256 () Unit!51776)

(declare-fun addStillNotContains!531 (ListLongMap!22607 (_ BitVec 64) V!59801 (_ BitVec 64)) Unit!51776)

(assert (=> b!1561900 (= lt!671256 (addStillNotContains!531 lt!671257 (select (arr!50203 _keys!637) from!782) lt!671258 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26239 (ValueCell!18317 V!59801) V!59801)

(declare-fun dynLambda!3860 (Int (_ BitVec 64)) V!59801)

(assert (=> b!1561900 (= lt!671258 (get!26239 (select (arr!50202 _values!487) from!782) (dynLambda!3860 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59801)

(declare-fun minValue!453 () V!59801)

(declare-fun getCurrentListMapNoExtraKeys!6693 (array!104020 array!104018 (_ BitVec 32) (_ BitVec 32) V!59801 V!59801 (_ BitVec 32) Int) ListLongMap!22607)

(assert (=> b!1561900 (= lt!671257 (getCurrentListMapNoExtraKeys!6693 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!133562 res!1067977) b!1561898))

(assert (= (and b!1561898 res!1067978) b!1561896))

(assert (= (and b!1561896 res!1067979) b!1561895))

(assert (= (and b!1561895 res!1067976) b!1561899))

(assert (= (and b!1561899 res!1067974) b!1561892))

(assert (= (and b!1561892 res!1067975) b!1561900))

(assert (= (and b!1561894 condMapEmpty!59418) mapIsEmpty!59418))

(assert (= (and b!1561894 (not condMapEmpty!59418)) mapNonEmpty!59418))

(get-info :version)

(assert (= (and mapNonEmpty!59418 ((_ is ValueCellFull!18317) mapValue!59418)) b!1561897))

(assert (= (and b!1561894 ((_ is ValueCellFull!18317) mapDefault!59418)) b!1561893))

(assert (= start!133562 b!1561894))

(declare-fun b_lambda!24893 () Bool)

(assert (=> (not b_lambda!24893) (not b!1561900)))

(declare-fun t!51322 () Bool)

(declare-fun tb!12565 () Bool)

(assert (=> (and start!133562 (= defaultEntry!495 defaultEntry!495) t!51322) tb!12565))

(declare-fun result!26419 () Bool)

(assert (=> tb!12565 (= result!26419 tp_is_empty!38695)))

(assert (=> b!1561900 t!51322))

(declare-fun b_and!51553 () Bool)

(assert (= b_and!51551 (and (=> t!51322 result!26419) b_and!51553)))

(declare-fun m!1437045 () Bool)

(assert (=> b!1561895 m!1437045))

(declare-fun m!1437047 () Bool)

(assert (=> mapNonEmpty!59418 m!1437047))

(declare-fun m!1437049 () Bool)

(assert (=> b!1561900 m!1437049))

(declare-fun m!1437051 () Bool)

(assert (=> b!1561900 m!1437051))

(declare-fun m!1437053 () Bool)

(assert (=> b!1561900 m!1437053))

(declare-fun m!1437055 () Bool)

(assert (=> b!1561900 m!1437055))

(assert (=> b!1561900 m!1437049))

(declare-fun m!1437057 () Bool)

(assert (=> b!1561900 m!1437057))

(declare-fun m!1437059 () Bool)

(assert (=> b!1561900 m!1437059))

(assert (=> b!1561900 m!1437051))

(assert (=> b!1561900 m!1437059))

(declare-fun m!1437061 () Bool)

(assert (=> b!1561900 m!1437061))

(declare-fun m!1437063 () Bool)

(assert (=> b!1561900 m!1437063))

(declare-fun m!1437065 () Bool)

(assert (=> b!1561900 m!1437065))

(declare-fun m!1437067 () Bool)

(assert (=> start!133562 m!1437067))

(declare-fun m!1437069 () Bool)

(assert (=> start!133562 m!1437069))

(declare-fun m!1437071 () Bool)

(assert (=> start!133562 m!1437071))

(declare-fun m!1437073 () Bool)

(assert (=> b!1561896 m!1437073))

(assert (=> b!1561892 m!1437059))

(assert (=> b!1561892 m!1437059))

(declare-fun m!1437075 () Bool)

(assert (=> b!1561892 m!1437075))

(check-sat (not b!1561900) (not mapNonEmpty!59418) tp_is_empty!38695 (not b!1561892) (not start!133562) b_and!51553 (not b!1561896) (not b_next!32029) (not b!1561895) (not b_lambda!24893))
(check-sat b_and!51553 (not b_next!32029))
