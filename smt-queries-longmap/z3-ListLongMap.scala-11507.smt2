; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133928 () Bool)

(assert start!133928)

(declare-fun b_free!32151 () Bool)

(declare-fun b_next!32151 () Bool)

(assert (=> start!133928 (= b_free!32151 (not b_next!32151))))

(declare-fun tp!113755 () Bool)

(declare-fun b_and!51743 () Bool)

(assert (=> start!133928 (= tp!113755 b_and!51743)))

(declare-fun b!1565550 () Bool)

(declare-fun res!1070168 () Bool)

(declare-fun e!872624 () Bool)

(assert (=> b!1565550 (=> (not res!1070168) (not e!872624))))

(declare-datatypes ((array!104540 0))(
  ( (array!104541 (arr!50457 (Array (_ BitVec 32) (_ BitVec 64))) (size!51007 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104540)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565550 (= res!1070168 (validKeyInArray!0 (select (arr!50457 _keys!637) from!782)))))

(declare-fun b!1565551 () Bool)

(declare-fun res!1070171 () Bool)

(assert (=> b!1565551 (=> (not res!1070171) (not e!872624))))

(assert (=> b!1565551 (= res!1070171 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51007 _keys!637)) (bvslt from!782 (size!51007 _keys!637))))))

(declare-fun mapIsEmpty!59779 () Bool)

(declare-fun mapRes!59779 () Bool)

(assert (=> mapIsEmpty!59779 mapRes!59779))

(declare-fun res!1070173 () Bool)

(assert (=> start!133928 (=> (not res!1070173) (not e!872624))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133928 (= res!1070173 (validMask!0 mask!947))))

(assert (=> start!133928 e!872624))

(assert (=> start!133928 tp!113755))

(declare-fun tp_is_empty!38925 () Bool)

(assert (=> start!133928 tp_is_empty!38925))

(assert (=> start!133928 true))

(declare-fun array_inv!39211 (array!104540) Bool)

(assert (=> start!133928 (array_inv!39211 _keys!637)))

(declare-datatypes ((V!60107 0))(
  ( (V!60108 (val!19546 Int)) )
))
(declare-datatypes ((ValueCell!18432 0))(
  ( (ValueCellFull!18432 (v!22302 V!60107)) (EmptyCell!18432) )
))
(declare-datatypes ((array!104542 0))(
  ( (array!104543 (arr!50458 (Array (_ BitVec 32) ValueCell!18432)) (size!51008 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104542)

(declare-fun e!872622 () Bool)

(declare-fun array_inv!39212 (array!104542) Bool)

(assert (=> start!133928 (and (array_inv!39212 _values!487) e!872622)))

(declare-fun mapNonEmpty!59779 () Bool)

(declare-fun tp!113754 () Bool)

(declare-fun e!872626 () Bool)

(assert (=> mapNonEmpty!59779 (= mapRes!59779 (and tp!113754 e!872626))))

(declare-fun mapRest!59779 () (Array (_ BitVec 32) ValueCell!18432))

(declare-fun mapValue!59779 () ValueCell!18432)

(declare-fun mapKey!59779 () (_ BitVec 32))

(assert (=> mapNonEmpty!59779 (= (arr!50458 _values!487) (store mapRest!59779 mapKey!59779 mapValue!59779))))

(declare-fun b!1565552 () Bool)

(assert (=> b!1565552 (= e!872626 tp_is_empty!38925)))

(declare-fun b!1565553 () Bool)

(declare-fun res!1070170 () Bool)

(assert (=> b!1565553 (=> (not res!1070170) (not e!872624))))

(declare-datatypes ((List!36606 0))(
  ( (Nil!36603) (Cons!36602 (h!38048 (_ BitVec 64)) (t!51471 List!36606)) )
))
(declare-fun arrayNoDuplicates!0 (array!104540 (_ BitVec 32) List!36606) Bool)

(assert (=> b!1565553 (= res!1070170 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36603))))

(declare-fun b!1565554 () Bool)

(assert (=> b!1565554 (= e!872624 (not (bvslt from!782 (size!51008 _values!487))))))

(declare-datatypes ((tuple2!25218 0))(
  ( (tuple2!25219 (_1!12620 (_ BitVec 64)) (_2!12620 V!60107)) )
))
(declare-datatypes ((List!36607 0))(
  ( (Nil!36604) (Cons!36603 (h!38049 tuple2!25218) (t!51472 List!36607)) )
))
(declare-datatypes ((ListLongMap!22653 0))(
  ( (ListLongMap!22654 (toList!11342 List!36607)) )
))
(declare-fun lt!672303 () ListLongMap!22653)

(declare-fun lt!672304 () V!60107)

(declare-fun contains!10333 (ListLongMap!22653 (_ BitVec 64)) Bool)

(declare-fun +!5072 (ListLongMap!22653 tuple2!25218) ListLongMap!22653)

(assert (=> b!1565554 (not (contains!10333 (+!5072 lt!672303 (tuple2!25219 (select (arr!50457 _keys!637) from!782) lt!672304)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!52008 0))(
  ( (Unit!52009) )
))
(declare-fun lt!672305 () Unit!52008)

(declare-fun addStillNotContains!562 (ListLongMap!22653 (_ BitVec 64) V!60107 (_ BitVec 64)) Unit!52008)

(assert (=> b!1565554 (= lt!672305 (addStillNotContains!562 lt!672303 (select (arr!50457 _keys!637) from!782) lt!672304 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26337 (ValueCell!18432 V!60107) V!60107)

(declare-fun dynLambda!3856 (Int (_ BitVec 64)) V!60107)

(assert (=> b!1565554 (= lt!672304 (get!26337 (select (arr!50458 _values!487) from!782) (dynLambda!3856 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60107)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60107)

(declare-fun getCurrentListMapNoExtraKeys!6707 (array!104540 array!104542 (_ BitVec 32) (_ BitVec 32) V!60107 V!60107 (_ BitVec 32) Int) ListLongMap!22653)

(assert (=> b!1565554 (= lt!672303 (getCurrentListMapNoExtraKeys!6707 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565555 () Bool)

(declare-fun e!872625 () Bool)

(assert (=> b!1565555 (= e!872622 (and e!872625 mapRes!59779))))

(declare-fun condMapEmpty!59779 () Bool)

(declare-fun mapDefault!59779 () ValueCell!18432)

(assert (=> b!1565555 (= condMapEmpty!59779 (= (arr!50458 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18432)) mapDefault!59779)))))

(declare-fun b!1565556 () Bool)

(assert (=> b!1565556 (= e!872625 tp_is_empty!38925)))

(declare-fun b!1565557 () Bool)

(declare-fun res!1070172 () Bool)

(assert (=> b!1565557 (=> (not res!1070172) (not e!872624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104540 (_ BitVec 32)) Bool)

(assert (=> b!1565557 (= res!1070172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565558 () Bool)

(declare-fun res!1070169 () Bool)

(assert (=> b!1565558 (=> (not res!1070169) (not e!872624))))

(assert (=> b!1565558 (= res!1070169 (and (= (size!51008 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51007 _keys!637) (size!51008 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133928 res!1070173) b!1565558))

(assert (= (and b!1565558 res!1070169) b!1565557))

(assert (= (and b!1565557 res!1070172) b!1565553))

(assert (= (and b!1565553 res!1070170) b!1565551))

(assert (= (and b!1565551 res!1070171) b!1565550))

(assert (= (and b!1565550 res!1070168) b!1565554))

(assert (= (and b!1565555 condMapEmpty!59779) mapIsEmpty!59779))

(assert (= (and b!1565555 (not condMapEmpty!59779)) mapNonEmpty!59779))

(get-info :version)

(assert (= (and mapNonEmpty!59779 ((_ is ValueCellFull!18432) mapValue!59779)) b!1565552))

(assert (= (and b!1565555 ((_ is ValueCellFull!18432) mapDefault!59779)) b!1565556))

(assert (= start!133928 b!1565555))

(declare-fun b_lambda!24965 () Bool)

(assert (=> (not b_lambda!24965) (not b!1565554)))

(declare-fun t!51470 () Bool)

(declare-fun tb!12619 () Bool)

(assert (=> (and start!133928 (= defaultEntry!495 defaultEntry!495) t!51470) tb!12619))

(declare-fun result!26529 () Bool)

(assert (=> tb!12619 (= result!26529 tp_is_empty!38925)))

(assert (=> b!1565554 t!51470))

(declare-fun b_and!51745 () Bool)

(assert (= b_and!51743 (and (=> t!51470 result!26529) b_and!51745)))

(declare-fun m!1440455 () Bool)

(assert (=> b!1565550 m!1440455))

(assert (=> b!1565550 m!1440455))

(declare-fun m!1440457 () Bool)

(assert (=> b!1565550 m!1440457))

(declare-fun m!1440459 () Bool)

(assert (=> b!1565554 m!1440459))

(declare-fun m!1440461 () Bool)

(assert (=> b!1565554 m!1440461))

(declare-fun m!1440463 () Bool)

(assert (=> b!1565554 m!1440463))

(assert (=> b!1565554 m!1440455))

(declare-fun m!1440465 () Bool)

(assert (=> b!1565554 m!1440465))

(assert (=> b!1565554 m!1440459))

(declare-fun m!1440467 () Bool)

(assert (=> b!1565554 m!1440467))

(assert (=> b!1565554 m!1440461))

(declare-fun m!1440469 () Bool)

(assert (=> b!1565554 m!1440469))

(assert (=> b!1565554 m!1440467))

(declare-fun m!1440471 () Bool)

(assert (=> b!1565554 m!1440471))

(assert (=> b!1565554 m!1440455))

(declare-fun m!1440473 () Bool)

(assert (=> mapNonEmpty!59779 m!1440473))

(declare-fun m!1440475 () Bool)

(assert (=> b!1565557 m!1440475))

(declare-fun m!1440477 () Bool)

(assert (=> start!133928 m!1440477))

(declare-fun m!1440479 () Bool)

(assert (=> start!133928 m!1440479))

(declare-fun m!1440481 () Bool)

(assert (=> start!133928 m!1440481))

(declare-fun m!1440483 () Bool)

(assert (=> b!1565553 m!1440483))

(check-sat tp_is_empty!38925 (not b_next!32151) (not b!1565557) (not b_lambda!24965) (not b!1565550) (not start!133928) (not b!1565553) (not mapNonEmpty!59779) (not b!1565554) b_and!51745)
(check-sat b_and!51745 (not b_next!32151))
