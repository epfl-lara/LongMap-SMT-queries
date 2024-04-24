; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113452 () Bool)

(assert start!113452)

(declare-fun b_free!31279 () Bool)

(declare-fun b_next!31279 () Bool)

(assert (=> start!113452 (= b_free!31279 (not b_next!31279))))

(declare-fun tp!109641 () Bool)

(declare-fun b_and!50467 () Bool)

(assert (=> start!113452 (= tp!109641 b_and!50467)))

(declare-fun b!1344494 () Bool)

(declare-fun e!765415 () Bool)

(assert (=> b!1344494 (= e!765415 (not true))))

(declare-datatypes ((V!54809 0))(
  ( (V!54810 (val!18714 Int)) )
))
(declare-datatypes ((tuple2!24156 0))(
  ( (tuple2!24157 (_1!12089 (_ BitVec 64)) (_2!12089 V!54809)) )
))
(declare-datatypes ((List!31302 0))(
  ( (Nil!31299) (Cons!31298 (h!32516 tuple2!24156) (t!45784 List!31302)) )
))
(declare-datatypes ((ListLongMap!21821 0))(
  ( (ListLongMap!21822 (toList!10926 List!31302)) )
))
(declare-fun lt!595286 () ListLongMap!21821)

(declare-fun zeroValue!1245 () V!54809)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9114 (ListLongMap!21821 (_ BitVec 64)) Bool)

(declare-fun +!4840 (ListLongMap!21821 tuple2!24156) ListLongMap!21821)

(assert (=> b!1344494 (contains!9114 (+!4840 lt!595286 (tuple2!24157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44020 0))(
  ( (Unit!44021) )
))
(declare-fun lt!595284 () Unit!44020)

(declare-fun addStillContains!1202 (ListLongMap!21821 (_ BitVec 64) V!54809 (_ BitVec 64)) Unit!44020)

(assert (=> b!1344494 (= lt!595284 (addStillContains!1202 lt!595286 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1344494 (contains!9114 lt!595286 k0!1142)))

(declare-fun lt!595289 () Unit!44020)

(declare-datatypes ((array!91519 0))(
  ( (array!91520 (arr!44211 (Array (_ BitVec 32) (_ BitVec 64))) (size!44762 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91519)

(declare-fun lt!595285 () V!54809)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!366 ((_ BitVec 64) (_ BitVec 64) V!54809 ListLongMap!21821) Unit!44020)

(assert (=> b!1344494 (= lt!595289 (lemmaInListMapAfterAddingDiffThenInBefore!366 k0!1142 (select (arr!44211 _keys!1571) from!1960) lt!595285 lt!595286))))

(declare-fun lt!595287 () ListLongMap!21821)

(assert (=> b!1344494 (contains!9114 lt!595287 k0!1142)))

(declare-fun lt!595288 () Unit!44020)

(assert (=> b!1344494 (= lt!595288 (lemmaInListMapAfterAddingDiffThenInBefore!366 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595287))))

(assert (=> b!1344494 (= lt!595287 (+!4840 lt!595286 (tuple2!24157 (select (arr!44211 _keys!1571) from!1960) lt!595285)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17741 0))(
  ( (ValueCellFull!17741 (v!21357 V!54809)) (EmptyCell!17741) )
))
(declare-datatypes ((array!91521 0))(
  ( (array!91522 (arr!44212 (Array (_ BitVec 32) ValueCell!17741)) (size!44763 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91521)

(declare-fun get!22342 (ValueCell!17741 V!54809) V!54809)

(declare-fun dynLambda!3794 (Int (_ BitVec 64)) V!54809)

(assert (=> b!1344494 (= lt!595285 (get!22342 (select (arr!44212 _values!1303) from!1960) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54809)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6489 (array!91519 array!91521 (_ BitVec 32) (_ BitVec 32) V!54809 V!54809 (_ BitVec 32) Int) ListLongMap!21821)

(assert (=> b!1344494 (= lt!595286 (getCurrentListMapNoExtraKeys!6489 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapIsEmpty!57625 () Bool)

(declare-fun mapRes!57625 () Bool)

(assert (=> mapIsEmpty!57625 mapRes!57625))

(declare-fun b!1344495 () Bool)

(declare-fun res!891682 () Bool)

(assert (=> b!1344495 (=> (not res!891682) (not e!765415))))

(declare-fun getCurrentListMap!5872 (array!91519 array!91521 (_ BitVec 32) (_ BitVec 32) V!54809 V!54809 (_ BitVec 32) Int) ListLongMap!21821)

(assert (=> b!1344495 (= res!891682 (contains!9114 (getCurrentListMap!5872 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344496 () Bool)

(declare-fun res!891689 () Bool)

(assert (=> b!1344496 (=> (not res!891689) (not e!765415))))

(assert (=> b!1344496 (= res!891689 (and (= (size!44763 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44762 _keys!1571) (size!44763 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344497 () Bool)

(declare-fun e!765416 () Bool)

(declare-fun tp_is_empty!37279 () Bool)

(assert (=> b!1344497 (= e!765416 tp_is_empty!37279)))

(declare-fun b!1344498 () Bool)

(declare-fun res!891688 () Bool)

(assert (=> b!1344498 (=> (not res!891688) (not e!765415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91519 (_ BitVec 32)) Bool)

(assert (=> b!1344498 (= res!891688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!891683 () Bool)

(assert (=> start!113452 (=> (not res!891683) (not e!765415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113452 (= res!891683 (validMask!0 mask!1977))))

(assert (=> start!113452 e!765415))

(assert (=> start!113452 tp_is_empty!37279))

(assert (=> start!113452 true))

(declare-fun array_inv!33595 (array!91519) Bool)

(assert (=> start!113452 (array_inv!33595 _keys!1571)))

(declare-fun e!765413 () Bool)

(declare-fun array_inv!33596 (array!91521) Bool)

(assert (=> start!113452 (and (array_inv!33596 _values!1303) e!765413)))

(assert (=> start!113452 tp!109641))

(declare-fun b!1344499 () Bool)

(assert (=> b!1344499 (= e!765413 (and e!765416 mapRes!57625))))

(declare-fun condMapEmpty!57625 () Bool)

(declare-fun mapDefault!57625 () ValueCell!17741)

(assert (=> b!1344499 (= condMapEmpty!57625 (= (arr!44212 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17741)) mapDefault!57625)))))

(declare-fun b!1344500 () Bool)

(declare-fun e!765414 () Bool)

(assert (=> b!1344500 (= e!765414 tp_is_empty!37279)))

(declare-fun b!1344501 () Bool)

(declare-fun res!891681 () Bool)

(assert (=> b!1344501 (=> (not res!891681) (not e!765415))))

(declare-datatypes ((List!31303 0))(
  ( (Nil!31300) (Cons!31299 (h!32517 (_ BitVec 64)) (t!45785 List!31303)) )
))
(declare-fun arrayNoDuplicates!0 (array!91519 (_ BitVec 32) List!31303) Bool)

(assert (=> b!1344501 (= res!891681 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31300))))

(declare-fun mapNonEmpty!57625 () Bool)

(declare-fun tp!109642 () Bool)

(assert (=> mapNonEmpty!57625 (= mapRes!57625 (and tp!109642 e!765414))))

(declare-fun mapRest!57625 () (Array (_ BitVec 32) ValueCell!17741))

(declare-fun mapKey!57625 () (_ BitVec 32))

(declare-fun mapValue!57625 () ValueCell!17741)

(assert (=> mapNonEmpty!57625 (= (arr!44212 _values!1303) (store mapRest!57625 mapKey!57625 mapValue!57625))))

(declare-fun b!1344502 () Bool)

(declare-fun res!891687 () Bool)

(assert (=> b!1344502 (=> (not res!891687) (not e!765415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344502 (= res!891687 (validKeyInArray!0 (select (arr!44211 _keys!1571) from!1960)))))

(declare-fun b!1344503 () Bool)

(declare-fun res!891685 () Bool)

(assert (=> b!1344503 (=> (not res!891685) (not e!765415))))

(assert (=> b!1344503 (= res!891685 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44762 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344504 () Bool)

(declare-fun res!891684 () Bool)

(assert (=> b!1344504 (=> (not res!891684) (not e!765415))))

(assert (=> b!1344504 (= res!891684 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1344505 () Bool)

(declare-fun res!891686 () Bool)

(assert (=> b!1344505 (=> (not res!891686) (not e!765415))))

(assert (=> b!1344505 (= res!891686 (not (= (select (arr!44211 _keys!1571) from!1960) k0!1142)))))

(assert (= (and start!113452 res!891683) b!1344496))

(assert (= (and b!1344496 res!891689) b!1344498))

(assert (= (and b!1344498 res!891688) b!1344501))

(assert (= (and b!1344501 res!891681) b!1344503))

(assert (= (and b!1344503 res!891685) b!1344495))

(assert (= (and b!1344495 res!891682) b!1344505))

(assert (= (and b!1344505 res!891686) b!1344502))

(assert (= (and b!1344502 res!891687) b!1344504))

(assert (= (and b!1344504 res!891684) b!1344494))

(assert (= (and b!1344499 condMapEmpty!57625) mapIsEmpty!57625))

(assert (= (and b!1344499 (not condMapEmpty!57625)) mapNonEmpty!57625))

(get-info :version)

(assert (= (and mapNonEmpty!57625 ((_ is ValueCellFull!17741) mapValue!57625)) b!1344500))

(assert (= (and b!1344499 ((_ is ValueCellFull!17741) mapDefault!57625)) b!1344497))

(assert (= start!113452 b!1344499))

(declare-fun b_lambda!24449 () Bool)

(assert (=> (not b_lambda!24449) (not b!1344494)))

(declare-fun t!45783 () Bool)

(declare-fun tb!12285 () Bool)

(assert (=> (and start!113452 (= defaultEntry!1306 defaultEntry!1306) t!45783) tb!12285))

(declare-fun result!25669 () Bool)

(assert (=> tb!12285 (= result!25669 tp_is_empty!37279)))

(assert (=> b!1344494 t!45783))

(declare-fun b_and!50469 () Bool)

(assert (= b_and!50467 (and (=> t!45783 result!25669) b_and!50469)))

(declare-fun m!1232469 () Bool)

(assert (=> b!1344505 m!1232469))

(declare-fun m!1232471 () Bool)

(assert (=> b!1344501 m!1232471))

(assert (=> b!1344502 m!1232469))

(assert (=> b!1344502 m!1232469))

(declare-fun m!1232473 () Bool)

(assert (=> b!1344502 m!1232473))

(declare-fun m!1232475 () Bool)

(assert (=> b!1344498 m!1232475))

(declare-fun m!1232477 () Bool)

(assert (=> start!113452 m!1232477))

(declare-fun m!1232479 () Bool)

(assert (=> start!113452 m!1232479))

(declare-fun m!1232481 () Bool)

(assert (=> start!113452 m!1232481))

(declare-fun m!1232483 () Bool)

(assert (=> mapNonEmpty!57625 m!1232483))

(declare-fun m!1232485 () Bool)

(assert (=> b!1344494 m!1232485))

(declare-fun m!1232487 () Bool)

(assert (=> b!1344494 m!1232487))

(declare-fun m!1232489 () Bool)

(assert (=> b!1344494 m!1232489))

(declare-fun m!1232491 () Bool)

(assert (=> b!1344494 m!1232491))

(assert (=> b!1344494 m!1232487))

(declare-fun m!1232493 () Bool)

(assert (=> b!1344494 m!1232493))

(declare-fun m!1232495 () Bool)

(assert (=> b!1344494 m!1232495))

(declare-fun m!1232497 () Bool)

(assert (=> b!1344494 m!1232497))

(assert (=> b!1344494 m!1232469))

(declare-fun m!1232499 () Bool)

(assert (=> b!1344494 m!1232499))

(declare-fun m!1232501 () Bool)

(assert (=> b!1344494 m!1232501))

(assert (=> b!1344494 m!1232489))

(assert (=> b!1344494 m!1232497))

(declare-fun m!1232503 () Bool)

(assert (=> b!1344494 m!1232503))

(declare-fun m!1232505 () Bool)

(assert (=> b!1344494 m!1232505))

(assert (=> b!1344494 m!1232469))

(declare-fun m!1232507 () Bool)

(assert (=> b!1344494 m!1232507))

(declare-fun m!1232509 () Bool)

(assert (=> b!1344495 m!1232509))

(assert (=> b!1344495 m!1232509))

(declare-fun m!1232511 () Bool)

(assert (=> b!1344495 m!1232511))

(check-sat (not b!1344502) (not mapNonEmpty!57625) (not b_lambda!24449) (not b!1344498) (not b_next!31279) (not b!1344501) (not b!1344495) (not start!113452) (not b!1344494) tp_is_empty!37279 b_and!50469)
(check-sat b_and!50469 (not b_next!31279))
