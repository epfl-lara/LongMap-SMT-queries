; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113458 () Bool)

(assert start!113458)

(declare-fun b_free!31285 () Bool)

(declare-fun b_next!31285 () Bool)

(assert (=> start!113458 (= b_free!31285 (not b_next!31285))))

(declare-fun tp!109659 () Bool)

(declare-fun b_and!50479 () Bool)

(assert (=> start!113458 (= tp!109659 b_and!50479)))

(declare-fun b!1344608 () Bool)

(declare-fun res!891767 () Bool)

(declare-fun e!765461 () Bool)

(assert (=> b!1344608 (=> (not res!891767) (not e!765461))))

(declare-datatypes ((array!91527 0))(
  ( (array!91528 (arr!44215 (Array (_ BitVec 32) (_ BitVec 64))) (size!44766 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91527)

(declare-datatypes ((List!31304 0))(
  ( (Nil!31301) (Cons!31300 (h!32518 (_ BitVec 64)) (t!45792 List!31304)) )
))
(declare-fun arrayNoDuplicates!0 (array!91527 (_ BitVec 32) List!31304) Bool)

(assert (=> b!1344608 (= res!891767 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31301))))

(declare-fun b!1344609 () Bool)

(declare-fun res!891762 () Bool)

(assert (=> b!1344609 (=> (not res!891762) (not e!765461))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91527 (_ BitVec 32)) Bool)

(assert (=> b!1344609 (= res!891762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344610 () Bool)

(declare-fun res!891765 () Bool)

(assert (=> b!1344610 (=> (not res!891765) (not e!765461))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1344610 (= res!891765 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1344611 () Bool)

(declare-fun e!765458 () Bool)

(declare-fun e!765457 () Bool)

(declare-fun mapRes!57634 () Bool)

(assert (=> b!1344611 (= e!765458 (and e!765457 mapRes!57634))))

(declare-fun condMapEmpty!57634 () Bool)

(declare-datatypes ((V!54817 0))(
  ( (V!54818 (val!18717 Int)) )
))
(declare-datatypes ((ValueCell!17744 0))(
  ( (ValueCellFull!17744 (v!21360 V!54817)) (EmptyCell!17744) )
))
(declare-datatypes ((array!91529 0))(
  ( (array!91530 (arr!44216 (Array (_ BitVec 32) ValueCell!17744)) (size!44767 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91529)

(declare-fun mapDefault!57634 () ValueCell!17744)

(assert (=> b!1344611 (= condMapEmpty!57634 (= (arr!44216 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17744)) mapDefault!57634)))))

(declare-fun mapNonEmpty!57634 () Bool)

(declare-fun tp!109660 () Bool)

(declare-fun e!765460 () Bool)

(assert (=> mapNonEmpty!57634 (= mapRes!57634 (and tp!109660 e!765460))))

(declare-fun mapValue!57634 () ValueCell!17744)

(declare-fun mapKey!57634 () (_ BitVec 32))

(declare-fun mapRest!57634 () (Array (_ BitVec 32) ValueCell!17744))

(assert (=> mapNonEmpty!57634 (= (arr!44216 _values!1303) (store mapRest!57634 mapKey!57634 mapValue!57634))))

(declare-fun b!1344612 () Bool)

(declare-fun res!891763 () Bool)

(assert (=> b!1344612 (=> (not res!891763) (not e!765461))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344612 (= res!891763 (not (= (select (arr!44215 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1344613 () Bool)

(declare-fun tp_is_empty!37285 () Bool)

(assert (=> b!1344613 (= e!765457 tp_is_empty!37285)))

(declare-fun mapIsEmpty!57634 () Bool)

(assert (=> mapIsEmpty!57634 mapRes!57634))

(declare-fun b!1344614 () Bool)

(assert (=> b!1344614 (= e!765461 (not true))))

(declare-datatypes ((tuple2!24158 0))(
  ( (tuple2!24159 (_1!12090 (_ BitVec 64)) (_2!12090 V!54817)) )
))
(declare-datatypes ((List!31305 0))(
  ( (Nil!31302) (Cons!31301 (h!32519 tuple2!24158) (t!45793 List!31305)) )
))
(declare-datatypes ((ListLongMap!21823 0))(
  ( (ListLongMap!21824 (toList!10927 List!31305)) )
))
(declare-fun lt!595343 () ListLongMap!21823)

(declare-fun zeroValue!1245 () V!54817)

(declare-fun contains!9115 (ListLongMap!21823 (_ BitVec 64)) Bool)

(declare-fun +!4841 (ListLongMap!21823 tuple2!24158) ListLongMap!21823)

(assert (=> b!1344614 (contains!9115 (+!4841 lt!595343 (tuple2!24159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44022 0))(
  ( (Unit!44023) )
))
(declare-fun lt!595338 () Unit!44022)

(declare-fun addStillContains!1203 (ListLongMap!21823 (_ BitVec 64) V!54817 (_ BitVec 64)) Unit!44022)

(assert (=> b!1344614 (= lt!595338 (addStillContains!1203 lt!595343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1344614 (contains!9115 lt!595343 k0!1142)))

(declare-fun lt!595339 () Unit!44022)

(declare-fun lt!595342 () V!54817)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!367 ((_ BitVec 64) (_ BitVec 64) V!54817 ListLongMap!21823) Unit!44022)

(assert (=> b!1344614 (= lt!595339 (lemmaInListMapAfterAddingDiffThenInBefore!367 k0!1142 (select (arr!44215 _keys!1571) from!1960) lt!595342 lt!595343))))

(declare-fun lt!595341 () ListLongMap!21823)

(assert (=> b!1344614 (contains!9115 lt!595341 k0!1142)))

(declare-fun lt!595340 () Unit!44022)

(assert (=> b!1344614 (= lt!595340 (lemmaInListMapAfterAddingDiffThenInBefore!367 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595341))))

(assert (=> b!1344614 (= lt!595341 (+!4841 lt!595343 (tuple2!24159 (select (arr!44215 _keys!1571) from!1960) lt!595342)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22345 (ValueCell!17744 V!54817) V!54817)

(declare-fun dynLambda!3795 (Int (_ BitVec 64)) V!54817)

(assert (=> b!1344614 (= lt!595342 (get!22345 (select (arr!44216 _values!1303) from!1960) (dynLambda!3795 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54817)

(declare-fun getCurrentListMapNoExtraKeys!6490 (array!91527 array!91529 (_ BitVec 32) (_ BitVec 32) V!54817 V!54817 (_ BitVec 32) Int) ListLongMap!21823)

(assert (=> b!1344614 (= lt!595343 (getCurrentListMapNoExtraKeys!6490 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1344615 () Bool)

(declare-fun res!891768 () Bool)

(assert (=> b!1344615 (=> (not res!891768) (not e!765461))))

(assert (=> b!1344615 (= res!891768 (and (= (size!44767 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44766 _keys!1571) (size!44767 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!891769 () Bool)

(assert (=> start!113458 (=> (not res!891769) (not e!765461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113458 (= res!891769 (validMask!0 mask!1977))))

(assert (=> start!113458 e!765461))

(assert (=> start!113458 tp_is_empty!37285))

(assert (=> start!113458 true))

(declare-fun array_inv!33597 (array!91527) Bool)

(assert (=> start!113458 (array_inv!33597 _keys!1571)))

(declare-fun array_inv!33598 (array!91529) Bool)

(assert (=> start!113458 (and (array_inv!33598 _values!1303) e!765458)))

(assert (=> start!113458 tp!109659))

(declare-fun b!1344616 () Bool)

(declare-fun res!891766 () Bool)

(assert (=> b!1344616 (=> (not res!891766) (not e!765461))))

(assert (=> b!1344616 (= res!891766 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44766 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344617 () Bool)

(declare-fun res!891764 () Bool)

(assert (=> b!1344617 (=> (not res!891764) (not e!765461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344617 (= res!891764 (validKeyInArray!0 (select (arr!44215 _keys!1571) from!1960)))))

(declare-fun b!1344618 () Bool)

(assert (=> b!1344618 (= e!765460 tp_is_empty!37285)))

(declare-fun b!1344619 () Bool)

(declare-fun res!891770 () Bool)

(assert (=> b!1344619 (=> (not res!891770) (not e!765461))))

(declare-fun getCurrentListMap!5873 (array!91527 array!91529 (_ BitVec 32) (_ BitVec 32) V!54817 V!54817 (_ BitVec 32) Int) ListLongMap!21823)

(assert (=> b!1344619 (= res!891770 (contains!9115 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113458 res!891769) b!1344615))

(assert (= (and b!1344615 res!891768) b!1344609))

(assert (= (and b!1344609 res!891762) b!1344608))

(assert (= (and b!1344608 res!891767) b!1344616))

(assert (= (and b!1344616 res!891766) b!1344619))

(assert (= (and b!1344619 res!891770) b!1344612))

(assert (= (and b!1344612 res!891763) b!1344617))

(assert (= (and b!1344617 res!891764) b!1344610))

(assert (= (and b!1344610 res!891765) b!1344614))

(assert (= (and b!1344611 condMapEmpty!57634) mapIsEmpty!57634))

(assert (= (and b!1344611 (not condMapEmpty!57634)) mapNonEmpty!57634))

(get-info :version)

(assert (= (and mapNonEmpty!57634 ((_ is ValueCellFull!17744) mapValue!57634)) b!1344618))

(assert (= (and b!1344611 ((_ is ValueCellFull!17744) mapDefault!57634)) b!1344613))

(assert (= start!113458 b!1344611))

(declare-fun b_lambda!24455 () Bool)

(assert (=> (not b_lambda!24455) (not b!1344614)))

(declare-fun t!45791 () Bool)

(declare-fun tb!12291 () Bool)

(assert (=> (and start!113458 (= defaultEntry!1306 defaultEntry!1306) t!45791) tb!12291))

(declare-fun result!25681 () Bool)

(assert (=> tb!12291 (= result!25681 tp_is_empty!37285)))

(assert (=> b!1344614 t!45791))

(declare-fun b_and!50481 () Bool)

(assert (= b_and!50479 (and (=> t!45791 result!25681) b_and!50481)))

(declare-fun m!1232601 () Bool)

(assert (=> b!1344609 m!1232601))

(declare-fun m!1232603 () Bool)

(assert (=> b!1344617 m!1232603))

(assert (=> b!1344617 m!1232603))

(declare-fun m!1232605 () Bool)

(assert (=> b!1344617 m!1232605))

(declare-fun m!1232607 () Bool)

(assert (=> b!1344608 m!1232607))

(assert (=> b!1344612 m!1232603))

(assert (=> b!1344614 m!1232603))

(declare-fun m!1232609 () Bool)

(assert (=> b!1344614 m!1232609))

(declare-fun m!1232611 () Bool)

(assert (=> b!1344614 m!1232611))

(declare-fun m!1232613 () Bool)

(assert (=> b!1344614 m!1232613))

(declare-fun m!1232615 () Bool)

(assert (=> b!1344614 m!1232615))

(declare-fun m!1232617 () Bool)

(assert (=> b!1344614 m!1232617))

(assert (=> b!1344614 m!1232613))

(declare-fun m!1232619 () Bool)

(assert (=> b!1344614 m!1232619))

(assert (=> b!1344614 m!1232615))

(declare-fun m!1232621 () Bool)

(assert (=> b!1344614 m!1232621))

(declare-fun m!1232623 () Bool)

(assert (=> b!1344614 m!1232623))

(declare-fun m!1232625 () Bool)

(assert (=> b!1344614 m!1232625))

(assert (=> b!1344614 m!1232621))

(assert (=> b!1344614 m!1232603))

(declare-fun m!1232627 () Bool)

(assert (=> b!1344614 m!1232627))

(declare-fun m!1232629 () Bool)

(assert (=> b!1344614 m!1232629))

(declare-fun m!1232631 () Bool)

(assert (=> b!1344614 m!1232631))

(declare-fun m!1232633 () Bool)

(assert (=> start!113458 m!1232633))

(declare-fun m!1232635 () Bool)

(assert (=> start!113458 m!1232635))

(declare-fun m!1232637 () Bool)

(assert (=> start!113458 m!1232637))

(declare-fun m!1232639 () Bool)

(assert (=> mapNonEmpty!57634 m!1232639))

(declare-fun m!1232641 () Bool)

(assert (=> b!1344619 m!1232641))

(assert (=> b!1344619 m!1232641))

(declare-fun m!1232643 () Bool)

(assert (=> b!1344619 m!1232643))

(check-sat (not b!1344608) (not b_next!31285) (not b_lambda!24455) (not mapNonEmpty!57634) (not b!1344619) (not start!113458) tp_is_empty!37285 b_and!50481 (not b!1344617) (not b!1344609) (not b!1344614))
(check-sat b_and!50481 (not b_next!31285))
