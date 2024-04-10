; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113254 () Bool)

(assert start!113254)

(declare-fun b_free!31305 () Bool)

(declare-fun b_next!31305 () Bool)

(assert (=> start!113254 (= b_free!31305 (not b_next!31305))))

(declare-fun tp!109720 () Bool)

(declare-fun b_and!50517 () Bool)

(assert (=> start!113254 (= tp!109720 b_and!50517)))

(declare-fun b!1343689 () Bool)

(declare-fun e!764764 () Bool)

(declare-fun tp_is_empty!37305 () Bool)

(assert (=> b!1343689 (= e!764764 tp_is_empty!37305)))

(declare-fun b!1343690 () Bool)

(declare-fun e!764767 () Bool)

(assert (=> b!1343690 (= e!764767 (not true))))

(declare-datatypes ((V!54843 0))(
  ( (V!54844 (val!18727 Int)) )
))
(declare-datatypes ((tuple2!24128 0))(
  ( (tuple2!24129 (_1!12075 (_ BitVec 64)) (_2!12075 V!54843)) )
))
(declare-datatypes ((List!31284 0))(
  ( (Nil!31281) (Cons!31280 (h!32489 tuple2!24128) (t!45800 List!31284)) )
))
(declare-datatypes ((ListLongMap!21785 0))(
  ( (ListLongMap!21786 (toList!10908 List!31284)) )
))
(declare-fun lt!595045 () ListLongMap!21785)

(declare-fun zeroValue!1245 () V!54843)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9084 (ListLongMap!21785 (_ BitVec 64)) Bool)

(declare-fun +!4815 (ListLongMap!21785 tuple2!24128) ListLongMap!21785)

(assert (=> b!1343690 (contains!9084 (+!4815 lt!595045 (tuple2!24129 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44107 0))(
  ( (Unit!44108) )
))
(declare-fun lt!595044 () Unit!44107)

(declare-fun addStillContains!1208 (ListLongMap!21785 (_ BitVec 64) V!54843 (_ BitVec 64)) Unit!44107)

(assert (=> b!1343690 (= lt!595044 (addStillContains!1208 lt!595045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343690 (contains!9084 lt!595045 k0!1142)))

(declare-fun lt!595047 () Unit!44107)

(declare-datatypes ((array!91454 0))(
  ( (array!91455 (arr!44183 (Array (_ BitVec 32) (_ BitVec 64))) (size!44733 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91454)

(declare-fun lt!595043 () V!54843)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!384 ((_ BitVec 64) (_ BitVec 64) V!54843 ListLongMap!21785) Unit!44107)

(assert (=> b!1343690 (= lt!595047 (lemmaInListMapAfterAddingDiffThenInBefore!384 k0!1142 (select (arr!44183 _keys!1571) from!1960) lt!595043 lt!595045))))

(declare-fun lt!595042 () ListLongMap!21785)

(assert (=> b!1343690 (contains!9084 lt!595042 k0!1142)))

(declare-fun lt!595046 () Unit!44107)

(assert (=> b!1343690 (= lt!595046 (lemmaInListMapAfterAddingDiffThenInBefore!384 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595042))))

(assert (=> b!1343690 (= lt!595042 (+!4815 lt!595045 (tuple2!24129 (select (arr!44183 _keys!1571) from!1960) lt!595043)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17754 0))(
  ( (ValueCellFull!17754 (v!21375 V!54843)) (EmptyCell!17754) )
))
(declare-datatypes ((array!91456 0))(
  ( (array!91457 (arr!44184 (Array (_ BitVec 32) ValueCell!17754)) (size!44734 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91456)

(declare-fun get!22322 (ValueCell!17754 V!54843) V!54843)

(declare-fun dynLambda!3754 (Int (_ BitVec 64)) V!54843)

(assert (=> b!1343690 (= lt!595043 (get!22322 (select (arr!44184 _values!1303) from!1960) (dynLambda!3754 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54843)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6457 (array!91454 array!91456 (_ BitVec 32) (_ BitVec 32) V!54843 V!54843 (_ BitVec 32) Int) ListLongMap!21785)

(assert (=> b!1343690 (= lt!595045 (getCurrentListMapNoExtraKeys!6457 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapIsEmpty!57664 () Bool)

(declare-fun mapRes!57664 () Bool)

(assert (=> mapIsEmpty!57664 mapRes!57664))

(declare-fun b!1343691 () Bool)

(declare-fun res!891521 () Bool)

(assert (=> b!1343691 (=> (not res!891521) (not e!764767))))

(declare-datatypes ((List!31285 0))(
  ( (Nil!31282) (Cons!31281 (h!32490 (_ BitVec 64)) (t!45801 List!31285)) )
))
(declare-fun arrayNoDuplicates!0 (array!91454 (_ BitVec 32) List!31285) Bool)

(assert (=> b!1343691 (= res!891521 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31282))))

(declare-fun b!1343692 () Bool)

(declare-fun res!891519 () Bool)

(assert (=> b!1343692 (=> (not res!891519) (not e!764767))))

(assert (=> b!1343692 (= res!891519 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44733 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!891518 () Bool)

(assert (=> start!113254 (=> (not res!891518) (not e!764767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113254 (= res!891518 (validMask!0 mask!1977))))

(assert (=> start!113254 e!764767))

(assert (=> start!113254 tp_is_empty!37305))

(assert (=> start!113254 true))

(declare-fun array_inv!33303 (array!91454) Bool)

(assert (=> start!113254 (array_inv!33303 _keys!1571)))

(declare-fun e!764768 () Bool)

(declare-fun array_inv!33304 (array!91456) Bool)

(assert (=> start!113254 (and (array_inv!33304 _values!1303) e!764768)))

(assert (=> start!113254 tp!109720))

(declare-fun b!1343693 () Bool)

(declare-fun res!891517 () Bool)

(assert (=> b!1343693 (=> (not res!891517) (not e!764767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91454 (_ BitVec 32)) Bool)

(assert (=> b!1343693 (= res!891517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343694 () Bool)

(declare-fun res!891516 () Bool)

(assert (=> b!1343694 (=> (not res!891516) (not e!764767))))

(assert (=> b!1343694 (= res!891516 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343695 () Bool)

(declare-fun e!764766 () Bool)

(assert (=> b!1343695 (= e!764766 tp_is_empty!37305)))

(declare-fun mapNonEmpty!57664 () Bool)

(declare-fun tp!109719 () Bool)

(assert (=> mapNonEmpty!57664 (= mapRes!57664 (and tp!109719 e!764766))))

(declare-fun mapRest!57664 () (Array (_ BitVec 32) ValueCell!17754))

(declare-fun mapValue!57664 () ValueCell!17754)

(declare-fun mapKey!57664 () (_ BitVec 32))

(assert (=> mapNonEmpty!57664 (= (arr!44184 _values!1303) (store mapRest!57664 mapKey!57664 mapValue!57664))))

(declare-fun b!1343696 () Bool)

(declare-fun res!891514 () Bool)

(assert (=> b!1343696 (=> (not res!891514) (not e!764767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343696 (= res!891514 (validKeyInArray!0 (select (arr!44183 _keys!1571) from!1960)))))

(declare-fun b!1343697 () Bool)

(declare-fun res!891520 () Bool)

(assert (=> b!1343697 (=> (not res!891520) (not e!764767))))

(assert (=> b!1343697 (= res!891520 (and (= (size!44734 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44733 _keys!1571) (size!44734 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343698 () Bool)

(assert (=> b!1343698 (= e!764768 (and e!764764 mapRes!57664))))

(declare-fun condMapEmpty!57664 () Bool)

(declare-fun mapDefault!57664 () ValueCell!17754)

(assert (=> b!1343698 (= condMapEmpty!57664 (= (arr!44184 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17754)) mapDefault!57664)))))

(declare-fun b!1343699 () Bool)

(declare-fun res!891522 () Bool)

(assert (=> b!1343699 (=> (not res!891522) (not e!764767))))

(declare-fun getCurrentListMap!5866 (array!91454 array!91456 (_ BitVec 32) (_ BitVec 32) V!54843 V!54843 (_ BitVec 32) Int) ListLongMap!21785)

(assert (=> b!1343699 (= res!891522 (contains!9084 (getCurrentListMap!5866 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343700 () Bool)

(declare-fun res!891515 () Bool)

(assert (=> b!1343700 (=> (not res!891515) (not e!764767))))

(assert (=> b!1343700 (= res!891515 (not (= (select (arr!44183 _keys!1571) from!1960) k0!1142)))))

(assert (= (and start!113254 res!891518) b!1343697))

(assert (= (and b!1343697 res!891520) b!1343693))

(assert (= (and b!1343693 res!891517) b!1343691))

(assert (= (and b!1343691 res!891521) b!1343692))

(assert (= (and b!1343692 res!891519) b!1343699))

(assert (= (and b!1343699 res!891522) b!1343700))

(assert (= (and b!1343700 res!891515) b!1343696))

(assert (= (and b!1343696 res!891514) b!1343694))

(assert (= (and b!1343694 res!891516) b!1343690))

(assert (= (and b!1343698 condMapEmpty!57664) mapIsEmpty!57664))

(assert (= (and b!1343698 (not condMapEmpty!57664)) mapNonEmpty!57664))

(get-info :version)

(assert (= (and mapNonEmpty!57664 ((_ is ValueCellFull!17754) mapValue!57664)) b!1343695))

(assert (= (and b!1343698 ((_ is ValueCellFull!17754) mapDefault!57664)) b!1343689))

(assert (= start!113254 b!1343698))

(declare-fun b_lambda!24481 () Bool)

(assert (=> (not b_lambda!24481) (not b!1343690)))

(declare-fun t!45799 () Bool)

(declare-fun tb!12319 () Bool)

(assert (=> (and start!113254 (= defaultEntry!1306 defaultEntry!1306) t!45799) tb!12319))

(declare-fun result!25729 () Bool)

(assert (=> tb!12319 (= result!25729 tp_is_empty!37305)))

(assert (=> b!1343690 t!45799))

(declare-fun b_and!50519 () Bool)

(assert (= b_and!50517 (and (=> t!45799 result!25729) b_and!50519)))

(declare-fun m!1231443 () Bool)

(assert (=> b!1343699 m!1231443))

(assert (=> b!1343699 m!1231443))

(declare-fun m!1231445 () Bool)

(assert (=> b!1343699 m!1231445))

(declare-fun m!1231447 () Bool)

(assert (=> b!1343693 m!1231447))

(declare-fun m!1231449 () Bool)

(assert (=> b!1343696 m!1231449))

(assert (=> b!1343696 m!1231449))

(declare-fun m!1231451 () Bool)

(assert (=> b!1343696 m!1231451))

(assert (=> b!1343700 m!1231449))

(declare-fun m!1231453 () Bool)

(assert (=> b!1343691 m!1231453))

(declare-fun m!1231455 () Bool)

(assert (=> mapNonEmpty!57664 m!1231455))

(declare-fun m!1231457 () Bool)

(assert (=> start!113254 m!1231457))

(declare-fun m!1231459 () Bool)

(assert (=> start!113254 m!1231459))

(declare-fun m!1231461 () Bool)

(assert (=> start!113254 m!1231461))

(declare-fun m!1231463 () Bool)

(assert (=> b!1343690 m!1231463))

(declare-fun m!1231465 () Bool)

(assert (=> b!1343690 m!1231465))

(declare-fun m!1231467 () Bool)

(assert (=> b!1343690 m!1231467))

(declare-fun m!1231469 () Bool)

(assert (=> b!1343690 m!1231469))

(declare-fun m!1231471 () Bool)

(assert (=> b!1343690 m!1231471))

(assert (=> b!1343690 m!1231467))

(declare-fun m!1231473 () Bool)

(assert (=> b!1343690 m!1231473))

(assert (=> b!1343690 m!1231463))

(declare-fun m!1231475 () Bool)

(assert (=> b!1343690 m!1231475))

(declare-fun m!1231477 () Bool)

(assert (=> b!1343690 m!1231477))

(assert (=> b!1343690 m!1231469))

(declare-fun m!1231479 () Bool)

(assert (=> b!1343690 m!1231479))

(declare-fun m!1231481 () Bool)

(assert (=> b!1343690 m!1231481))

(declare-fun m!1231483 () Bool)

(assert (=> b!1343690 m!1231483))

(assert (=> b!1343690 m!1231449))

(declare-fun m!1231485 () Bool)

(assert (=> b!1343690 m!1231485))

(assert (=> b!1343690 m!1231449))

(check-sat (not b_lambda!24481) (not b!1343696) (not b!1343693) (not b!1343691) (not mapNonEmpty!57664) (not b_next!31305) (not b!1343699) b_and!50519 (not b!1343690) (not start!113254) tp_is_empty!37305)
(check-sat b_and!50519 (not b_next!31305))
