; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133922 () Bool)

(assert start!133922)

(declare-fun b_free!32145 () Bool)

(declare-fun b_next!32145 () Bool)

(assert (=> start!133922 (= b_free!32145 (not b_next!32145))))

(declare-fun tp!113737 () Bool)

(declare-fun b_and!51731 () Bool)

(assert (=> start!133922 (= tp!113737 b_and!51731)))

(declare-fun b!1565463 () Bool)

(declare-fun res!1070114 () Bool)

(declare-fun e!872580 () Bool)

(assert (=> b!1565463 (=> (not res!1070114) (not e!872580))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104528 0))(
  ( (array!104529 (arr!50451 (Array (_ BitVec 32) (_ BitVec 64))) (size!51001 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104528)

(assert (=> b!1565463 (= res!1070114 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51001 _keys!637)) (bvslt from!782 (size!51001 _keys!637))))))

(declare-fun mapIsEmpty!59770 () Bool)

(declare-fun mapRes!59770 () Bool)

(assert (=> mapIsEmpty!59770 mapRes!59770))

(declare-fun b!1565464 () Bool)

(declare-fun res!1070118 () Bool)

(assert (=> b!1565464 (=> (not res!1070118) (not e!872580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565464 (= res!1070118 (validKeyInArray!0 (select (arr!50451 _keys!637) from!782)))))

(declare-fun b!1565465 () Bool)

(declare-fun res!1070115 () Bool)

(assert (=> b!1565465 (=> (not res!1070115) (not e!872580))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60099 0))(
  ( (V!60100 (val!19543 Int)) )
))
(declare-datatypes ((ValueCell!18429 0))(
  ( (ValueCellFull!18429 (v!22299 V!60099)) (EmptyCell!18429) )
))
(declare-datatypes ((array!104530 0))(
  ( (array!104531 (arr!50452 (Array (_ BitVec 32) ValueCell!18429)) (size!51002 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104530)

(assert (=> b!1565465 (= res!1070115 (and (= (size!51002 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51001 _keys!637) (size!51002 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565466 () Bool)

(declare-fun e!872579 () Bool)

(declare-fun e!872581 () Bool)

(assert (=> b!1565466 (= e!872579 (and e!872581 mapRes!59770))))

(declare-fun condMapEmpty!59770 () Bool)

(declare-fun mapDefault!59770 () ValueCell!18429)

(assert (=> b!1565466 (= condMapEmpty!59770 (= (arr!50452 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18429)) mapDefault!59770)))))

(declare-fun b!1565467 () Bool)

(declare-fun tp_is_empty!38919 () Bool)

(assert (=> b!1565467 (= e!872581 tp_is_empty!38919)))

(declare-fun b!1565468 () Bool)

(declare-fun res!1070116 () Bool)

(assert (=> b!1565468 (=> (not res!1070116) (not e!872580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104528 (_ BitVec 32)) Bool)

(assert (=> b!1565468 (= res!1070116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565469 () Bool)

(assert (=> b!1565469 (= e!872580 (not true))))

(declare-datatypes ((tuple2!25214 0))(
  ( (tuple2!25215 (_1!12618 (_ BitVec 64)) (_2!12618 V!60099)) )
))
(declare-datatypes ((List!36601 0))(
  ( (Nil!36598) (Cons!36597 (h!38043 tuple2!25214) (t!51460 List!36601)) )
))
(declare-datatypes ((ListLongMap!22649 0))(
  ( (ListLongMap!22650 (toList!11340 List!36601)) )
))
(declare-fun lt!672278 () ListLongMap!22649)

(declare-fun lt!672277 () V!60099)

(declare-fun contains!10331 (ListLongMap!22649 (_ BitVec 64)) Bool)

(declare-fun +!5070 (ListLongMap!22649 tuple2!25214) ListLongMap!22649)

(assert (=> b!1565469 (not (contains!10331 (+!5070 lt!672278 (tuple2!25215 (select (arr!50451 _keys!637) from!782) lt!672277)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!52004 0))(
  ( (Unit!52005) )
))
(declare-fun lt!672276 () Unit!52004)

(declare-fun addStillNotContains!560 (ListLongMap!22649 (_ BitVec 64) V!60099 (_ BitVec 64)) Unit!52004)

(assert (=> b!1565469 (= lt!672276 (addStillNotContains!560 lt!672278 (select (arr!50451 _keys!637) from!782) lt!672277 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26333 (ValueCell!18429 V!60099) V!60099)

(declare-fun dynLambda!3854 (Int (_ BitVec 64)) V!60099)

(assert (=> b!1565469 (= lt!672277 (get!26333 (select (arr!50452 _values!487) from!782) (dynLambda!3854 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!453 () V!60099)

(declare-fun zeroValue!453 () V!60099)

(declare-fun getCurrentListMapNoExtraKeys!6705 (array!104528 array!104530 (_ BitVec 32) (_ BitVec 32) V!60099 V!60099 (_ BitVec 32) Int) ListLongMap!22649)

(assert (=> b!1565469 (= lt!672278 (getCurrentListMapNoExtraKeys!6705 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1070119 () Bool)

(assert (=> start!133922 (=> (not res!1070119) (not e!872580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133922 (= res!1070119 (validMask!0 mask!947))))

(assert (=> start!133922 e!872580))

(assert (=> start!133922 tp!113737))

(assert (=> start!133922 tp_is_empty!38919))

(assert (=> start!133922 true))

(declare-fun array_inv!39205 (array!104528) Bool)

(assert (=> start!133922 (array_inv!39205 _keys!637)))

(declare-fun array_inv!39206 (array!104530) Bool)

(assert (=> start!133922 (and (array_inv!39206 _values!487) e!872579)))

(declare-fun mapNonEmpty!59770 () Bool)

(declare-fun tp!113736 () Bool)

(declare-fun e!872578 () Bool)

(assert (=> mapNonEmpty!59770 (= mapRes!59770 (and tp!113736 e!872578))))

(declare-fun mapValue!59770 () ValueCell!18429)

(declare-fun mapKey!59770 () (_ BitVec 32))

(declare-fun mapRest!59770 () (Array (_ BitVec 32) ValueCell!18429))

(assert (=> mapNonEmpty!59770 (= (arr!50452 _values!487) (store mapRest!59770 mapKey!59770 mapValue!59770))))

(declare-fun b!1565470 () Bool)

(declare-fun res!1070117 () Bool)

(assert (=> b!1565470 (=> (not res!1070117) (not e!872580))))

(declare-datatypes ((List!36602 0))(
  ( (Nil!36599) (Cons!36598 (h!38044 (_ BitVec 64)) (t!51461 List!36602)) )
))
(declare-fun arrayNoDuplicates!0 (array!104528 (_ BitVec 32) List!36602) Bool)

(assert (=> b!1565470 (= res!1070117 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36599))))

(declare-fun b!1565471 () Bool)

(assert (=> b!1565471 (= e!872578 tp_is_empty!38919)))

(assert (= (and start!133922 res!1070119) b!1565465))

(assert (= (and b!1565465 res!1070115) b!1565468))

(assert (= (and b!1565468 res!1070116) b!1565470))

(assert (= (and b!1565470 res!1070117) b!1565463))

(assert (= (and b!1565463 res!1070114) b!1565464))

(assert (= (and b!1565464 res!1070118) b!1565469))

(assert (= (and b!1565466 condMapEmpty!59770) mapIsEmpty!59770))

(assert (= (and b!1565466 (not condMapEmpty!59770)) mapNonEmpty!59770))

(get-info :version)

(assert (= (and mapNonEmpty!59770 ((_ is ValueCellFull!18429) mapValue!59770)) b!1565471))

(assert (= (and b!1565466 ((_ is ValueCellFull!18429) mapDefault!59770)) b!1565467))

(assert (= start!133922 b!1565466))

(declare-fun b_lambda!24959 () Bool)

(assert (=> (not b_lambda!24959) (not b!1565469)))

(declare-fun t!51459 () Bool)

(declare-fun tb!12613 () Bool)

(assert (=> (and start!133922 (= defaultEntry!495 defaultEntry!495) t!51459) tb!12613))

(declare-fun result!26517 () Bool)

(assert (=> tb!12613 (= result!26517 tp_is_empty!38919)))

(assert (=> b!1565469 t!51459))

(declare-fun b_and!51733 () Bool)

(assert (= b_and!51731 (and (=> t!51459 result!26517) b_and!51733)))

(declare-fun m!1440365 () Bool)

(assert (=> b!1565468 m!1440365))

(declare-fun m!1440367 () Bool)

(assert (=> b!1565469 m!1440367))

(declare-fun m!1440369 () Bool)

(assert (=> b!1565469 m!1440369))

(declare-fun m!1440371 () Bool)

(assert (=> b!1565469 m!1440371))

(declare-fun m!1440373 () Bool)

(assert (=> b!1565469 m!1440373))

(declare-fun m!1440375 () Bool)

(assert (=> b!1565469 m!1440375))

(assert (=> b!1565469 m!1440367))

(declare-fun m!1440377 () Bool)

(assert (=> b!1565469 m!1440377))

(assert (=> b!1565469 m!1440369))

(assert (=> b!1565469 m!1440377))

(declare-fun m!1440379 () Bool)

(assert (=> b!1565469 m!1440379))

(declare-fun m!1440381 () Bool)

(assert (=> b!1565469 m!1440381))

(assert (=> b!1565469 m!1440373))

(declare-fun m!1440383 () Bool)

(assert (=> start!133922 m!1440383))

(declare-fun m!1440385 () Bool)

(assert (=> start!133922 m!1440385))

(declare-fun m!1440387 () Bool)

(assert (=> start!133922 m!1440387))

(declare-fun m!1440389 () Bool)

(assert (=> b!1565470 m!1440389))

(declare-fun m!1440391 () Bool)

(assert (=> mapNonEmpty!59770 m!1440391))

(assert (=> b!1565464 m!1440377))

(assert (=> b!1565464 m!1440377))

(declare-fun m!1440393 () Bool)

(assert (=> b!1565464 m!1440393))

(check-sat (not mapNonEmpty!59770) (not b!1565469) b_and!51733 (not b_lambda!24959) tp_is_empty!38919 (not b!1565470) (not b!1565464) (not start!133922) (not b!1565468) (not b_next!32145))
(check-sat b_and!51733 (not b_next!32145))
