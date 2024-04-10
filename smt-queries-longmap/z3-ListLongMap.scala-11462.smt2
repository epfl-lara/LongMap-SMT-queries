; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133572 () Bool)

(assert start!133572)

(declare-fun b_free!31989 () Bool)

(declare-fun b_next!31989 () Bool)

(assert (=> start!133572 (= b_free!31989 (not b_next!31989))))

(declare-fun tp!113091 () Bool)

(declare-fun b_and!51489 () Bool)

(assert (=> start!133572 (= tp!113091 b_and!51489)))

(declare-fun b!1561616 () Bool)

(declare-fun e!870241 () Bool)

(declare-fun e!870240 () Bool)

(declare-fun mapRes!59358 () Bool)

(assert (=> b!1561616 (= e!870241 (and e!870240 mapRes!59358))))

(declare-fun condMapEmpty!59358 () Bool)

(declare-datatypes ((V!59747 0))(
  ( (V!59748 (val!19411 Int)) )
))
(declare-datatypes ((ValueCell!18297 0))(
  ( (ValueCellFull!18297 (v!22163 V!59747)) (EmptyCell!18297) )
))
(declare-datatypes ((array!104028 0))(
  ( (array!104029 (arr!50206 (Array (_ BitVec 32) ValueCell!18297)) (size!50756 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104028)

(declare-fun mapDefault!59358 () ValueCell!18297)

(assert (=> b!1561616 (= condMapEmpty!59358 (= (arr!50206 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18297)) mapDefault!59358)))))

(declare-fun b!1561617 () Bool)

(declare-fun res!1067738 () Bool)

(declare-fun e!870243 () Bool)

(assert (=> b!1561617 (=> (not res!1067738) (not e!870243))))

(declare-datatypes ((array!104030 0))(
  ( (array!104031 (arr!50207 (Array (_ BitVec 32) (_ BitVec 64))) (size!50757 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104030)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104030 (_ BitVec 32)) Bool)

(assert (=> b!1561617 (= res!1067738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561618 () Bool)

(declare-fun res!1067735 () Bool)

(assert (=> b!1561618 (=> (not res!1067735) (not e!870243))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561618 (= res!1067735 (and (= (size!50756 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50757 _keys!637) (size!50756 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561619 () Bool)

(declare-fun tp_is_empty!38655 () Bool)

(assert (=> b!1561619 (= e!870240 tp_is_empty!38655)))

(declare-fun b!1561620 () Bool)

(declare-fun res!1067737 () Bool)

(assert (=> b!1561620 (=> (not res!1067737) (not e!870243))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561620 (= res!1067737 (validKeyInArray!0 (select (arr!50207 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59358 () Bool)

(declare-fun tp!113090 () Bool)

(declare-fun e!870242 () Bool)

(assert (=> mapNonEmpty!59358 (= mapRes!59358 (and tp!113090 e!870242))))

(declare-fun mapValue!59358 () ValueCell!18297)

(declare-fun mapKey!59358 () (_ BitVec 32))

(declare-fun mapRest!59358 () (Array (_ BitVec 32) ValueCell!18297))

(assert (=> mapNonEmpty!59358 (= (arr!50206 _values!487) (store mapRest!59358 mapKey!59358 mapValue!59358))))

(declare-fun b!1561621 () Bool)

(assert (=> b!1561621 (= e!870243 (not true))))

(declare-fun lt!671268 () V!59747)

(declare-datatypes ((tuple2!25078 0))(
  ( (tuple2!25079 (_1!12550 (_ BitVec 64)) (_2!12550 V!59747)) )
))
(declare-datatypes ((List!36448 0))(
  ( (Nil!36445) (Cons!36444 (h!37890 tuple2!25078) (t!51227 List!36448)) )
))
(declare-datatypes ((ListLongMap!22513 0))(
  ( (ListLongMap!22514 (toList!11272 List!36448)) )
))
(declare-fun lt!671267 () ListLongMap!22513)

(declare-fun contains!10262 (ListLongMap!22513 (_ BitVec 64)) Bool)

(declare-fun +!5042 (ListLongMap!22513 tuple2!25078) ListLongMap!22513)

(assert (=> b!1561621 (not (contains!10262 (+!5042 lt!671267 (tuple2!25079 (select (arr!50207 _keys!637) from!782) lt!671268)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51938 0))(
  ( (Unit!51939) )
))
(declare-fun lt!671266 () Unit!51938)

(declare-fun addStillNotContains!532 (ListLongMap!22513 (_ BitVec 64) V!59747 (_ BitVec 64)) Unit!51938)

(assert (=> b!1561621 (= lt!671266 (addStillNotContains!532 lt!671267 (select (arr!50207 _keys!637) from!782) lt!671268 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26215 (ValueCell!18297 V!59747) V!59747)

(declare-fun dynLambda!3826 (Int (_ BitVec 64)) V!59747)

(assert (=> b!1561621 (= lt!671268 (get!26215 (select (arr!50206 _values!487) from!782) (dynLambda!3826 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59747)

(declare-fun minValue!453 () V!59747)

(declare-fun getCurrentListMapNoExtraKeys!6656 (array!104030 array!104028 (_ BitVec 32) (_ BitVec 32) V!59747 V!59747 (_ BitVec 32) Int) ListLongMap!22513)

(assert (=> b!1561621 (= lt!671267 (getCurrentListMapNoExtraKeys!6656 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561622 () Bool)

(declare-fun res!1067736 () Bool)

(assert (=> b!1561622 (=> (not res!1067736) (not e!870243))))

(declare-datatypes ((List!36449 0))(
  ( (Nil!36446) (Cons!36445 (h!37891 (_ BitVec 64)) (t!51228 List!36449)) )
))
(declare-fun arrayNoDuplicates!0 (array!104030 (_ BitVec 32) List!36449) Bool)

(assert (=> b!1561622 (= res!1067736 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36446))))

(declare-fun b!1561623 () Bool)

(declare-fun res!1067734 () Bool)

(assert (=> b!1561623 (=> (not res!1067734) (not e!870243))))

(assert (=> b!1561623 (= res!1067734 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50757 _keys!637)) (bvslt from!782 (size!50757 _keys!637))))))

(declare-fun b!1561624 () Bool)

(assert (=> b!1561624 (= e!870242 tp_is_empty!38655)))

(declare-fun res!1067739 () Bool)

(assert (=> start!133572 (=> (not res!1067739) (not e!870243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133572 (= res!1067739 (validMask!0 mask!947))))

(assert (=> start!133572 e!870243))

(assert (=> start!133572 tp!113091))

(assert (=> start!133572 tp_is_empty!38655))

(assert (=> start!133572 true))

(declare-fun array_inv!39025 (array!104030) Bool)

(assert (=> start!133572 (array_inv!39025 _keys!637)))

(declare-fun array_inv!39026 (array!104028) Bool)

(assert (=> start!133572 (and (array_inv!39026 _values!487) e!870241)))

(declare-fun mapIsEmpty!59358 () Bool)

(assert (=> mapIsEmpty!59358 mapRes!59358))

(assert (= (and start!133572 res!1067739) b!1561618))

(assert (= (and b!1561618 res!1067735) b!1561617))

(assert (= (and b!1561617 res!1067738) b!1561622))

(assert (= (and b!1561622 res!1067736) b!1561623))

(assert (= (and b!1561623 res!1067734) b!1561620))

(assert (= (and b!1561620 res!1067737) b!1561621))

(assert (= (and b!1561616 condMapEmpty!59358) mapIsEmpty!59358))

(assert (= (and b!1561616 (not condMapEmpty!59358)) mapNonEmpty!59358))

(get-info :version)

(assert (= (and mapNonEmpty!59358 ((_ is ValueCellFull!18297) mapValue!59358)) b!1561624))

(assert (= (and b!1561616 ((_ is ValueCellFull!18297) mapDefault!59358)) b!1561619))

(assert (= start!133572 b!1561616))

(declare-fun b_lambda!24863 () Bool)

(assert (=> (not b_lambda!24863) (not b!1561621)))

(declare-fun t!51226 () Bool)

(declare-fun tb!12533 () Bool)

(assert (=> (and start!133572 (= defaultEntry!495 defaultEntry!495) t!51226) tb!12533))

(declare-fun result!26347 () Bool)

(assert (=> tb!12533 (= result!26347 tp_is_empty!38655)))

(assert (=> b!1561621 t!51226))

(declare-fun b_and!51491 () Bool)

(assert (= b_and!51489 (and (=> t!51226 result!26347) b_and!51491)))

(declare-fun m!1437301 () Bool)

(assert (=> b!1561617 m!1437301))

(declare-fun m!1437303 () Bool)

(assert (=> start!133572 m!1437303))

(declare-fun m!1437305 () Bool)

(assert (=> start!133572 m!1437305))

(declare-fun m!1437307 () Bool)

(assert (=> start!133572 m!1437307))

(declare-fun m!1437309 () Bool)

(assert (=> b!1561620 m!1437309))

(assert (=> b!1561620 m!1437309))

(declare-fun m!1437311 () Bool)

(assert (=> b!1561620 m!1437311))

(declare-fun m!1437313 () Bool)

(assert (=> b!1561621 m!1437313))

(declare-fun m!1437315 () Bool)

(assert (=> b!1561621 m!1437315))

(declare-fun m!1437317 () Bool)

(assert (=> b!1561621 m!1437317))

(assert (=> b!1561621 m!1437313))

(assert (=> b!1561621 m!1437309))

(declare-fun m!1437319 () Bool)

(assert (=> b!1561621 m!1437319))

(assert (=> b!1561621 m!1437309))

(declare-fun m!1437321 () Bool)

(assert (=> b!1561621 m!1437321))

(declare-fun m!1437323 () Bool)

(assert (=> b!1561621 m!1437323))

(assert (=> b!1561621 m!1437315))

(assert (=> b!1561621 m!1437321))

(declare-fun m!1437325 () Bool)

(assert (=> b!1561621 m!1437325))

(declare-fun m!1437327 () Bool)

(assert (=> b!1561622 m!1437327))

(declare-fun m!1437329 () Bool)

(assert (=> mapNonEmpty!59358 m!1437329))

(check-sat (not b!1561617) (not mapNonEmpty!59358) (not b!1561620) (not b_lambda!24863) (not start!133572) (not b!1561621) tp_is_empty!38655 b_and!51491 (not b!1561622) (not b_next!31989))
(check-sat b_and!51491 (not b_next!31989))
