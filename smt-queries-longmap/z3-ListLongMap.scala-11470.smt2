; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133620 () Bool)

(assert start!133620)

(declare-fun b_free!32037 () Bool)

(declare-fun b_next!32037 () Bool)

(assert (=> start!133620 (= b_free!32037 (not b_next!32037))))

(declare-fun tp!113234 () Bool)

(declare-fun b_and!51585 () Bool)

(assert (=> start!133620 (= tp!113234 b_and!51585)))

(declare-fun b!1562321 () Bool)

(declare-fun e!870612 () Bool)

(declare-fun tp_is_empty!38703 () Bool)

(assert (=> b!1562321 (= e!870612 tp_is_empty!38703)))

(declare-fun b!1562322 () Bool)

(declare-fun res!1068176 () Bool)

(declare-fun e!870611 () Bool)

(assert (=> b!1562322 (=> (not res!1068176) (not e!870611))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104122 0))(
  ( (array!104123 (arr!50253 (Array (_ BitVec 32) (_ BitVec 64))) (size!50803 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104122)

(declare-datatypes ((V!59811 0))(
  ( (V!59812 (val!19435 Int)) )
))
(declare-datatypes ((ValueCell!18321 0))(
  ( (ValueCellFull!18321 (v!22187 V!59811)) (EmptyCell!18321) )
))
(declare-datatypes ((array!104124 0))(
  ( (array!104125 (arr!50254 (Array (_ BitVec 32) ValueCell!18321)) (size!50804 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104124)

(assert (=> b!1562322 (= res!1068176 (and (= (size!50804 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50803 _keys!637) (size!50804 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562323 () Bool)

(declare-fun res!1068178 () Bool)

(assert (=> b!1562323 (=> (not res!1068178) (not e!870611))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562323 (= res!1068178 (validKeyInArray!0 (select (arr!50253 _keys!637) from!782)))))

(declare-fun b!1562324 () Bool)

(assert (=> b!1562324 (= e!870611 (not true))))

(declare-fun lt!671603 () Bool)

(declare-datatypes ((tuple2!25106 0))(
  ( (tuple2!25107 (_1!12564 (_ BitVec 64)) (_2!12564 V!59811)) )
))
(declare-datatypes ((List!36477 0))(
  ( (Nil!36474) (Cons!36473 (h!37919 tuple2!25106) (t!51304 List!36477)) )
))
(declare-datatypes ((ListLongMap!22541 0))(
  ( (ListLongMap!22542 (toList!11286 List!36477)) )
))
(declare-fun lt!671600 () ListLongMap!22541)

(declare-fun contains!10276 (ListLongMap!22541 (_ BitVec 64)) Bool)

(assert (=> b!1562324 (= lt!671603 (contains!10276 lt!671600 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562324 (not (contains!10276 lt!671600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671601 () V!59811)

(declare-fun lt!671604 () ListLongMap!22541)

(declare-fun +!5056 (ListLongMap!22541 tuple2!25106) ListLongMap!22541)

(assert (=> b!1562324 (= lt!671600 (+!5056 lt!671604 (tuple2!25107 (select (arr!50253 _keys!637) from!782) lt!671601)))))

(declare-datatypes ((Unit!51966 0))(
  ( (Unit!51967) )
))
(declare-fun lt!671602 () Unit!51966)

(declare-fun addStillNotContains!546 (ListLongMap!22541 (_ BitVec 64) V!59811 (_ BitVec 64)) Unit!51966)

(assert (=> b!1562324 (= lt!671602 (addStillNotContains!546 lt!671604 (select (arr!50253 _keys!637) from!782) lt!671601 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26245 (ValueCell!18321 V!59811) V!59811)

(declare-fun dynLambda!3840 (Int (_ BitVec 64)) V!59811)

(assert (=> b!1562324 (= lt!671601 (get!26245 (select (arr!50254 _values!487) from!782) (dynLambda!3840 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59811)

(declare-fun minValue!453 () V!59811)

(declare-fun getCurrentListMapNoExtraKeys!6670 (array!104122 array!104124 (_ BitVec 32) (_ BitVec 32) V!59811 V!59811 (_ BitVec 32) Int) ListLongMap!22541)

(assert (=> b!1562324 (= lt!671604 (getCurrentListMapNoExtraKeys!6670 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562325 () Bool)

(declare-fun e!870609 () Bool)

(assert (=> b!1562325 (= e!870609 tp_is_empty!38703)))

(declare-fun res!1068180 () Bool)

(assert (=> start!133620 (=> (not res!1068180) (not e!870611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133620 (= res!1068180 (validMask!0 mask!947))))

(assert (=> start!133620 e!870611))

(assert (=> start!133620 tp!113234))

(assert (=> start!133620 tp_is_empty!38703))

(assert (=> start!133620 true))

(declare-fun array_inv!39059 (array!104122) Bool)

(assert (=> start!133620 (array_inv!39059 _keys!637)))

(declare-fun e!870610 () Bool)

(declare-fun array_inv!39060 (array!104124) Bool)

(assert (=> start!133620 (and (array_inv!39060 _values!487) e!870610)))

(declare-fun mapIsEmpty!59430 () Bool)

(declare-fun mapRes!59430 () Bool)

(assert (=> mapIsEmpty!59430 mapRes!59430))

(declare-fun b!1562326 () Bool)

(declare-fun res!1068175 () Bool)

(assert (=> b!1562326 (=> (not res!1068175) (not e!870611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104122 (_ BitVec 32)) Bool)

(assert (=> b!1562326 (= res!1068175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562327 () Bool)

(assert (=> b!1562327 (= e!870610 (and e!870612 mapRes!59430))))

(declare-fun condMapEmpty!59430 () Bool)

(declare-fun mapDefault!59430 () ValueCell!18321)

(assert (=> b!1562327 (= condMapEmpty!59430 (= (arr!50254 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18321)) mapDefault!59430)))))

(declare-fun b!1562328 () Bool)

(declare-fun res!1068177 () Bool)

(assert (=> b!1562328 (=> (not res!1068177) (not e!870611))))

(declare-datatypes ((List!36478 0))(
  ( (Nil!36475) (Cons!36474 (h!37920 (_ BitVec 64)) (t!51305 List!36478)) )
))
(declare-fun arrayNoDuplicates!0 (array!104122 (_ BitVec 32) List!36478) Bool)

(assert (=> b!1562328 (= res!1068177 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36475))))

(declare-fun b!1562329 () Bool)

(declare-fun res!1068179 () Bool)

(assert (=> b!1562329 (=> (not res!1068179) (not e!870611))))

(assert (=> b!1562329 (= res!1068179 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50803 _keys!637)) (bvslt from!782 (size!50803 _keys!637))))))

(declare-fun mapNonEmpty!59430 () Bool)

(declare-fun tp!113235 () Bool)

(assert (=> mapNonEmpty!59430 (= mapRes!59430 (and tp!113235 e!870609))))

(declare-fun mapValue!59430 () ValueCell!18321)

(declare-fun mapKey!59430 () (_ BitVec 32))

(declare-fun mapRest!59430 () (Array (_ BitVec 32) ValueCell!18321))

(assert (=> mapNonEmpty!59430 (= (arr!50254 _values!487) (store mapRest!59430 mapKey!59430 mapValue!59430))))

(assert (= (and start!133620 res!1068180) b!1562322))

(assert (= (and b!1562322 res!1068176) b!1562326))

(assert (= (and b!1562326 res!1068175) b!1562328))

(assert (= (and b!1562328 res!1068177) b!1562329))

(assert (= (and b!1562329 res!1068179) b!1562323))

(assert (= (and b!1562323 res!1068178) b!1562324))

(assert (= (and b!1562327 condMapEmpty!59430) mapIsEmpty!59430))

(assert (= (and b!1562327 (not condMapEmpty!59430)) mapNonEmpty!59430))

(get-info :version)

(assert (= (and mapNonEmpty!59430 ((_ is ValueCellFull!18321) mapValue!59430)) b!1562325))

(assert (= (and b!1562327 ((_ is ValueCellFull!18321) mapDefault!59430)) b!1562321))

(assert (= start!133620 b!1562327))

(declare-fun b_lambda!24911 () Bool)

(assert (=> (not b_lambda!24911) (not b!1562324)))

(declare-fun t!51303 () Bool)

(declare-fun tb!12581 () Bool)

(assert (=> (and start!133620 (= defaultEntry!495 defaultEntry!495) t!51303) tb!12581))

(declare-fun result!26443 () Bool)

(assert (=> tb!12581 (= result!26443 tp_is_empty!38703)))

(assert (=> b!1562324 t!51303))

(declare-fun b_and!51587 () Bool)

(assert (= b_and!51585 (and (=> t!51303 result!26443) b_and!51587)))

(declare-fun m!1438065 () Bool)

(assert (=> b!1562328 m!1438065))

(declare-fun m!1438067 () Bool)

(assert (=> mapNonEmpty!59430 m!1438067))

(declare-fun m!1438069 () Bool)

(assert (=> b!1562324 m!1438069))

(declare-fun m!1438071 () Bool)

(assert (=> b!1562324 m!1438071))

(declare-fun m!1438073 () Bool)

(assert (=> b!1562324 m!1438073))

(declare-fun m!1438075 () Bool)

(assert (=> b!1562324 m!1438075))

(declare-fun m!1438077 () Bool)

(assert (=> b!1562324 m!1438077))

(assert (=> b!1562324 m!1438075))

(declare-fun m!1438079 () Bool)

(assert (=> b!1562324 m!1438079))

(assert (=> b!1562324 m!1438073))

(declare-fun m!1438081 () Bool)

(assert (=> b!1562324 m!1438081))

(declare-fun m!1438083 () Bool)

(assert (=> b!1562324 m!1438083))

(assert (=> b!1562324 m!1438081))

(declare-fun m!1438085 () Bool)

(assert (=> b!1562324 m!1438085))

(assert (=> b!1562323 m!1438075))

(assert (=> b!1562323 m!1438075))

(declare-fun m!1438087 () Bool)

(assert (=> b!1562323 m!1438087))

(declare-fun m!1438089 () Bool)

(assert (=> start!133620 m!1438089))

(declare-fun m!1438091 () Bool)

(assert (=> start!133620 m!1438091))

(declare-fun m!1438093 () Bool)

(assert (=> start!133620 m!1438093))

(declare-fun m!1438095 () Bool)

(assert (=> b!1562326 m!1438095))

(check-sat (not b!1562323) (not b_lambda!24911) (not b!1562326) (not b!1562328) tp_is_empty!38703 (not start!133620) (not b!1562324) (not b_next!32037) b_and!51587 (not mapNonEmpty!59430))
(check-sat b_and!51587 (not b_next!32037))
