; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113206 () Bool)

(assert start!113206)

(declare-fun b_free!31257 () Bool)

(declare-fun b_next!31257 () Bool)

(assert (=> start!113206 (= b_free!31257 (not b_next!31257))))

(declare-fun tp!109576 () Bool)

(declare-fun b_and!50421 () Bool)

(assert (=> start!113206 (= tp!109576 b_and!50421)))

(declare-fun b!1342777 () Bool)

(declare-fun e!764404 () Bool)

(declare-fun e!764406 () Bool)

(declare-fun mapRes!57592 () Bool)

(assert (=> b!1342777 (= e!764404 (and e!764406 mapRes!57592))))

(declare-fun condMapEmpty!57592 () Bool)

(declare-datatypes ((V!54779 0))(
  ( (V!54780 (val!18703 Int)) )
))
(declare-datatypes ((ValueCell!17730 0))(
  ( (ValueCellFull!17730 (v!21351 V!54779)) (EmptyCell!17730) )
))
(declare-datatypes ((array!91362 0))(
  ( (array!91363 (arr!44137 (Array (_ BitVec 32) ValueCell!17730)) (size!44687 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91362)

(declare-fun mapDefault!57592 () ValueCell!17730)

(assert (=> b!1342777 (= condMapEmpty!57592 (= (arr!44137 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17730)) mapDefault!57592)))))

(declare-fun b!1342779 () Bool)

(declare-fun res!890873 () Bool)

(declare-fun e!764407 () Bool)

(assert (=> b!1342779 (=> (not res!890873) (not e!764407))))

(declare-datatypes ((array!91364 0))(
  ( (array!91365 (arr!44138 (Array (_ BitVec 32) (_ BitVec 64))) (size!44688 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91364)

(declare-datatypes ((List!31249 0))(
  ( (Nil!31246) (Cons!31245 (h!32454 (_ BitVec 64)) (t!45717 List!31249)) )
))
(declare-fun arrayNoDuplicates!0 (array!91364 (_ BitVec 32) List!31249) Bool)

(assert (=> b!1342779 (= res!890873 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31246))))

(declare-fun b!1342780 () Bool)

(declare-fun res!890867 () Bool)

(assert (=> b!1342780 (=> (not res!890867) (not e!764407))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342780 (= res!890867 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44688 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342781 () Bool)

(declare-fun res!890869 () Bool)

(assert (=> b!1342781 (=> (not res!890869) (not e!764407))))

(assert (=> b!1342781 (= res!890869 (not (= (select (arr!44138 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342782 () Bool)

(assert (=> b!1342782 (= e!764407 (not true))))

(declare-datatypes ((tuple2!24092 0))(
  ( (tuple2!24093 (_1!12057 (_ BitVec 64)) (_2!12057 V!54779)) )
))
(declare-datatypes ((List!31250 0))(
  ( (Nil!31247) (Cons!31246 (h!32455 tuple2!24092) (t!45718 List!31250)) )
))
(declare-datatypes ((ListLongMap!21749 0))(
  ( (ListLongMap!21750 (toList!10890 List!31250)) )
))
(declare-fun lt!594616 () ListLongMap!21749)

(declare-fun contains!9066 (ListLongMap!21749 (_ BitVec 64)) Bool)

(assert (=> b!1342782 (contains!9066 lt!594616 k0!1142)))

(declare-fun lt!594617 () V!54779)

(declare-datatypes ((Unit!44073 0))(
  ( (Unit!44074) )
))
(declare-fun lt!594615 () Unit!44073)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!367 ((_ BitVec 64) (_ BitVec 64) V!54779 ListLongMap!21749) Unit!44073)

(assert (=> b!1342782 (= lt!594615 (lemmaInListMapAfterAddingDiffThenInBefore!367 k0!1142 (select (arr!44138 _keys!1571) from!1960) lt!594617 lt!594616))))

(declare-fun lt!594614 () ListLongMap!21749)

(assert (=> b!1342782 (contains!9066 lt!594614 k0!1142)))

(declare-fun lt!594618 () Unit!44073)

(declare-fun zeroValue!1245 () V!54779)

(assert (=> b!1342782 (= lt!594618 (lemmaInListMapAfterAddingDiffThenInBefore!367 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594614))))

(declare-fun +!4798 (ListLongMap!21749 tuple2!24092) ListLongMap!21749)

(assert (=> b!1342782 (= lt!594614 (+!4798 lt!594616 (tuple2!24093 (select (arr!44138 _keys!1571) from!1960) lt!594617)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22289 (ValueCell!17730 V!54779) V!54779)

(declare-fun dynLambda!3737 (Int (_ BitVec 64)) V!54779)

(assert (=> b!1342782 (= lt!594617 (get!22289 (select (arr!44137 _values!1303) from!1960) (dynLambda!3737 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54779)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6440 (array!91364 array!91362 (_ BitVec 32) (_ BitVec 32) V!54779 V!54779 (_ BitVec 32) Int) ListLongMap!21749)

(assert (=> b!1342782 (= lt!594616 (getCurrentListMapNoExtraKeys!6440 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapNonEmpty!57592 () Bool)

(declare-fun tp!109575 () Bool)

(declare-fun e!764405 () Bool)

(assert (=> mapNonEmpty!57592 (= mapRes!57592 (and tp!109575 e!764405))))

(declare-fun mapValue!57592 () ValueCell!17730)

(declare-fun mapKey!57592 () (_ BitVec 32))

(declare-fun mapRest!57592 () (Array (_ BitVec 32) ValueCell!17730))

(assert (=> mapNonEmpty!57592 (= (arr!44137 _values!1303) (store mapRest!57592 mapKey!57592 mapValue!57592))))

(declare-fun b!1342783 () Bool)

(declare-fun res!890868 () Bool)

(assert (=> b!1342783 (=> (not res!890868) (not e!764407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342783 (= res!890868 (validKeyInArray!0 (select (arr!44138 _keys!1571) from!1960)))))

(declare-fun b!1342784 () Bool)

(declare-fun res!890874 () Bool)

(assert (=> b!1342784 (=> (not res!890874) (not e!764407))))

(declare-fun getCurrentListMap!5853 (array!91364 array!91362 (_ BitVec 32) (_ BitVec 32) V!54779 V!54779 (_ BitVec 32) Int) ListLongMap!21749)

(assert (=> b!1342784 (= res!890874 (contains!9066 (getCurrentListMap!5853 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342785 () Bool)

(declare-fun res!890870 () Bool)

(assert (=> b!1342785 (=> (not res!890870) (not e!764407))))

(assert (=> b!1342785 (= res!890870 (and (= (size!44687 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44688 _keys!1571) (size!44687 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342786 () Bool)

(declare-fun tp_is_empty!37257 () Bool)

(assert (=> b!1342786 (= e!764406 tp_is_empty!37257)))

(declare-fun mapIsEmpty!57592 () Bool)

(assert (=> mapIsEmpty!57592 mapRes!57592))

(declare-fun b!1342787 () Bool)

(assert (=> b!1342787 (= e!764405 tp_is_empty!37257)))

(declare-fun b!1342788 () Bool)

(declare-fun res!890871 () Bool)

(assert (=> b!1342788 (=> (not res!890871) (not e!764407))))

(assert (=> b!1342788 (= res!890871 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!890866 () Bool)

(assert (=> start!113206 (=> (not res!890866) (not e!764407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113206 (= res!890866 (validMask!0 mask!1977))))

(assert (=> start!113206 e!764407))

(assert (=> start!113206 tp_is_empty!37257))

(assert (=> start!113206 true))

(declare-fun array_inv!33269 (array!91364) Bool)

(assert (=> start!113206 (array_inv!33269 _keys!1571)))

(declare-fun array_inv!33270 (array!91362) Bool)

(assert (=> start!113206 (and (array_inv!33270 _values!1303) e!764404)))

(assert (=> start!113206 tp!109576))

(declare-fun b!1342778 () Bool)

(declare-fun res!890872 () Bool)

(assert (=> b!1342778 (=> (not res!890872) (not e!764407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91364 (_ BitVec 32)) Bool)

(assert (=> b!1342778 (= res!890872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113206 res!890866) b!1342785))

(assert (= (and b!1342785 res!890870) b!1342778))

(assert (= (and b!1342778 res!890872) b!1342779))

(assert (= (and b!1342779 res!890873) b!1342780))

(assert (= (and b!1342780 res!890867) b!1342784))

(assert (= (and b!1342784 res!890874) b!1342781))

(assert (= (and b!1342781 res!890869) b!1342783))

(assert (= (and b!1342783 res!890868) b!1342788))

(assert (= (and b!1342788 res!890871) b!1342782))

(assert (= (and b!1342777 condMapEmpty!57592) mapIsEmpty!57592))

(assert (= (and b!1342777 (not condMapEmpty!57592)) mapNonEmpty!57592))

(get-info :version)

(assert (= (and mapNonEmpty!57592 ((_ is ValueCellFull!17730) mapValue!57592)) b!1342787))

(assert (= (and b!1342777 ((_ is ValueCellFull!17730) mapDefault!57592)) b!1342786))

(assert (= start!113206 b!1342777))

(declare-fun b_lambda!24433 () Bool)

(assert (=> (not b_lambda!24433) (not b!1342782)))

(declare-fun t!45716 () Bool)

(declare-fun tb!12271 () Bool)

(assert (=> (and start!113206 (= defaultEntry!1306 defaultEntry!1306) t!45716) tb!12271))

(declare-fun result!25633 () Bool)

(assert (=> tb!12271 (= result!25633 tp_is_empty!37257)))

(assert (=> b!1342782 t!45716))

(declare-fun b_and!50423 () Bool)

(assert (= b_and!50421 (and (=> t!45716 result!25633) b_and!50423)))

(declare-fun m!1230399 () Bool)

(assert (=> b!1342783 m!1230399))

(assert (=> b!1342783 m!1230399))

(declare-fun m!1230401 () Bool)

(assert (=> b!1342783 m!1230401))

(declare-fun m!1230403 () Bool)

(assert (=> b!1342782 m!1230403))

(declare-fun m!1230405 () Bool)

(assert (=> b!1342782 m!1230405))

(declare-fun m!1230407 () Bool)

(assert (=> b!1342782 m!1230407))

(declare-fun m!1230409 () Bool)

(assert (=> b!1342782 m!1230409))

(declare-fun m!1230411 () Bool)

(assert (=> b!1342782 m!1230411))

(assert (=> b!1342782 m!1230407))

(assert (=> b!1342782 m!1230409))

(declare-fun m!1230413 () Bool)

(assert (=> b!1342782 m!1230413))

(declare-fun m!1230415 () Bool)

(assert (=> b!1342782 m!1230415))

(assert (=> b!1342782 m!1230399))

(declare-fun m!1230417 () Bool)

(assert (=> b!1342782 m!1230417))

(declare-fun m!1230419 () Bool)

(assert (=> b!1342782 m!1230419))

(assert (=> b!1342782 m!1230399))

(declare-fun m!1230421 () Bool)

(assert (=> start!113206 m!1230421))

(declare-fun m!1230423 () Bool)

(assert (=> start!113206 m!1230423))

(declare-fun m!1230425 () Bool)

(assert (=> start!113206 m!1230425))

(declare-fun m!1230427 () Bool)

(assert (=> mapNonEmpty!57592 m!1230427))

(assert (=> b!1342781 m!1230399))

(declare-fun m!1230429 () Bool)

(assert (=> b!1342779 m!1230429))

(declare-fun m!1230431 () Bool)

(assert (=> b!1342784 m!1230431))

(assert (=> b!1342784 m!1230431))

(declare-fun m!1230433 () Bool)

(assert (=> b!1342784 m!1230433))

(declare-fun m!1230435 () Bool)

(assert (=> b!1342778 m!1230435))

(check-sat b_and!50423 (not b!1342778) tp_is_empty!37257 (not b!1342779) (not b!1342783) (not mapNonEmpty!57592) (not b_next!31257) (not b!1342784) (not start!113206) (not b!1342782) (not b_lambda!24433))
(check-sat b_and!50423 (not b_next!31257))
