; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113200 () Bool)

(assert start!113200)

(declare-fun b_free!31251 () Bool)

(declare-fun b_next!31251 () Bool)

(assert (=> start!113200 (= b_free!31251 (not b_next!31251))))

(declare-fun tp!109557 () Bool)

(declare-fun b_and!50409 () Bool)

(assert (=> start!113200 (= tp!109557 b_and!50409)))

(declare-fun b!1342663 () Bool)

(declare-fun e!764359 () Bool)

(declare-fun tp_is_empty!37251 () Bool)

(assert (=> b!1342663 (= e!764359 tp_is_empty!37251)))

(declare-fun mapNonEmpty!57583 () Bool)

(declare-fun mapRes!57583 () Bool)

(declare-fun tp!109558 () Bool)

(assert (=> mapNonEmpty!57583 (= mapRes!57583 (and tp!109558 e!764359))))

(declare-datatypes ((V!54771 0))(
  ( (V!54772 (val!18700 Int)) )
))
(declare-datatypes ((ValueCell!17727 0))(
  ( (ValueCellFull!17727 (v!21348 V!54771)) (EmptyCell!17727) )
))
(declare-fun mapRest!57583 () (Array (_ BitVec 32) ValueCell!17727))

(declare-fun mapValue!57583 () ValueCell!17727)

(declare-fun mapKey!57583 () (_ BitVec 32))

(declare-datatypes ((array!91350 0))(
  ( (array!91351 (arr!44131 (Array (_ BitVec 32) ValueCell!17727)) (size!44681 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91350)

(assert (=> mapNonEmpty!57583 (= (arr!44131 _values!1303) (store mapRest!57583 mapKey!57583 mapValue!57583))))

(declare-fun b!1342664 () Bool)

(declare-fun res!890791 () Bool)

(declare-fun e!764360 () Bool)

(assert (=> b!1342664 (=> (not res!890791) (not e!764360))))

(declare-datatypes ((array!91352 0))(
  ( (array!91353 (arr!44132 (Array (_ BitVec 32) (_ BitVec 64))) (size!44682 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91352)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91352 (_ BitVec 32)) Bool)

(assert (=> b!1342664 (= res!890791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342665 () Bool)

(declare-fun res!890789 () Bool)

(assert (=> b!1342665 (=> (not res!890789) (not e!764360))))

(declare-fun minValue!1245 () V!54771)

(declare-fun zeroValue!1245 () V!54771)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24086 0))(
  ( (tuple2!24087 (_1!12054 (_ BitVec 64)) (_2!12054 V!54771)) )
))
(declare-datatypes ((List!31243 0))(
  ( (Nil!31240) (Cons!31239 (h!32448 tuple2!24086) (t!45705 List!31243)) )
))
(declare-datatypes ((ListLongMap!21743 0))(
  ( (ListLongMap!21744 (toList!10887 List!31243)) )
))
(declare-fun contains!9063 (ListLongMap!21743 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5850 (array!91352 array!91350 (_ BitVec 32) (_ BitVec 32) V!54771 V!54771 (_ BitVec 32) Int) ListLongMap!21743)

(assert (=> b!1342665 (= res!890789 (contains!9063 (getCurrentListMap!5850 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342666 () Bool)

(declare-fun res!890787 () Bool)

(assert (=> b!1342666 (=> (not res!890787) (not e!764360))))

(assert (=> b!1342666 (= res!890787 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57583 () Bool)

(assert (=> mapIsEmpty!57583 mapRes!57583))

(declare-fun b!1342667 () Bool)

(declare-fun e!764363 () Bool)

(declare-fun e!764361 () Bool)

(assert (=> b!1342667 (= e!764363 (and e!764361 mapRes!57583))))

(declare-fun condMapEmpty!57583 () Bool)

(declare-fun mapDefault!57583 () ValueCell!17727)

(assert (=> b!1342667 (= condMapEmpty!57583 (= (arr!44131 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17727)) mapDefault!57583)))))

(declare-fun res!890792 () Bool)

(assert (=> start!113200 (=> (not res!890792) (not e!764360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113200 (= res!890792 (validMask!0 mask!1977))))

(assert (=> start!113200 e!764360))

(assert (=> start!113200 tp_is_empty!37251))

(assert (=> start!113200 true))

(declare-fun array_inv!33263 (array!91352) Bool)

(assert (=> start!113200 (array_inv!33263 _keys!1571)))

(declare-fun array_inv!33264 (array!91350) Bool)

(assert (=> start!113200 (and (array_inv!33264 _values!1303) e!764363)))

(assert (=> start!113200 tp!109557))

(declare-fun b!1342668 () Bool)

(declare-fun res!890788 () Bool)

(assert (=> b!1342668 (=> (not res!890788) (not e!764360))))

(assert (=> b!1342668 (= res!890788 (and (= (size!44681 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44682 _keys!1571) (size!44681 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342669 () Bool)

(declare-fun res!890786 () Bool)

(assert (=> b!1342669 (=> (not res!890786) (not e!764360))))

(declare-datatypes ((List!31244 0))(
  ( (Nil!31241) (Cons!31240 (h!32449 (_ BitVec 64)) (t!45706 List!31244)) )
))
(declare-fun arrayNoDuplicates!0 (array!91352 (_ BitVec 32) List!31244) Bool)

(assert (=> b!1342669 (= res!890786 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31241))))

(declare-fun b!1342670 () Bool)

(declare-fun res!890785 () Bool)

(assert (=> b!1342670 (=> (not res!890785) (not e!764360))))

(assert (=> b!1342670 (= res!890785 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44682 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342671 () Bool)

(declare-fun res!890790 () Bool)

(assert (=> b!1342671 (=> (not res!890790) (not e!764360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342671 (= res!890790 (validKeyInArray!0 (select (arr!44132 _keys!1571) from!1960)))))

(declare-fun b!1342672 () Bool)

(assert (=> b!1342672 (= e!764360 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-fun lt!594571 () ListLongMap!21743)

(assert (=> b!1342672 (contains!9063 lt!594571 k0!1142)))

(declare-datatypes ((Unit!44069 0))(
  ( (Unit!44070) )
))
(declare-fun lt!594572 () Unit!44069)

(declare-fun lt!594570 () V!54771)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!365 ((_ BitVec 64) (_ BitVec 64) V!54771 ListLongMap!21743) Unit!44069)

(assert (=> b!1342672 (= lt!594572 (lemmaInListMapAfterAddingDiffThenInBefore!365 k0!1142 (select (arr!44132 _keys!1571) from!1960) lt!594570 lt!594571))))

(declare-fun lt!594569 () ListLongMap!21743)

(assert (=> b!1342672 (contains!9063 lt!594569 k0!1142)))

(declare-fun lt!594573 () Unit!44069)

(assert (=> b!1342672 (= lt!594573 (lemmaInListMapAfterAddingDiffThenInBefore!365 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594569))))

(declare-fun +!4796 (ListLongMap!21743 tuple2!24086) ListLongMap!21743)

(assert (=> b!1342672 (= lt!594569 (+!4796 lt!594571 (tuple2!24087 (select (arr!44132 _keys!1571) from!1960) lt!594570)))))

(declare-fun get!22285 (ValueCell!17727 V!54771) V!54771)

(declare-fun dynLambda!3735 (Int (_ BitVec 64)) V!54771)

(assert (=> b!1342672 (= lt!594570 (get!22285 (select (arr!44131 _values!1303) from!1960) (dynLambda!3735 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6438 (array!91352 array!91350 (_ BitVec 32) (_ BitVec 32) V!54771 V!54771 (_ BitVec 32) Int) ListLongMap!21743)

(assert (=> b!1342672 (= lt!594571 (getCurrentListMapNoExtraKeys!6438 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342673 () Bool)

(declare-fun res!890793 () Bool)

(assert (=> b!1342673 (=> (not res!890793) (not e!764360))))

(assert (=> b!1342673 (= res!890793 (not (= (select (arr!44132 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342674 () Bool)

(assert (=> b!1342674 (= e!764361 tp_is_empty!37251)))

(assert (= (and start!113200 res!890792) b!1342668))

(assert (= (and b!1342668 res!890788) b!1342664))

(assert (= (and b!1342664 res!890791) b!1342669))

(assert (= (and b!1342669 res!890786) b!1342670))

(assert (= (and b!1342670 res!890785) b!1342665))

(assert (= (and b!1342665 res!890789) b!1342673))

(assert (= (and b!1342673 res!890793) b!1342671))

(assert (= (and b!1342671 res!890790) b!1342666))

(assert (= (and b!1342666 res!890787) b!1342672))

(assert (= (and b!1342667 condMapEmpty!57583) mapIsEmpty!57583))

(assert (= (and b!1342667 (not condMapEmpty!57583)) mapNonEmpty!57583))

(get-info :version)

(assert (= (and mapNonEmpty!57583 ((_ is ValueCellFull!17727) mapValue!57583)) b!1342663))

(assert (= (and b!1342667 ((_ is ValueCellFull!17727) mapDefault!57583)) b!1342674))

(assert (= start!113200 b!1342667))

(declare-fun b_lambda!24427 () Bool)

(assert (=> (not b_lambda!24427) (not b!1342672)))

(declare-fun t!45704 () Bool)

(declare-fun tb!12265 () Bool)

(assert (=> (and start!113200 (= defaultEntry!1306 defaultEntry!1306) t!45704) tb!12265))

(declare-fun result!25621 () Bool)

(assert (=> tb!12265 (= result!25621 tp_is_empty!37251)))

(assert (=> b!1342672 t!45704))

(declare-fun b_and!50411 () Bool)

(assert (= b_and!50409 (and (=> t!45704 result!25621) b_and!50411)))

(declare-fun m!1230285 () Bool)

(assert (=> b!1342665 m!1230285))

(assert (=> b!1342665 m!1230285))

(declare-fun m!1230287 () Bool)

(assert (=> b!1342665 m!1230287))

(declare-fun m!1230289 () Bool)

(assert (=> mapNonEmpty!57583 m!1230289))

(declare-fun m!1230291 () Bool)

(assert (=> b!1342669 m!1230291))

(declare-fun m!1230293 () Bool)

(assert (=> b!1342664 m!1230293))

(declare-fun m!1230295 () Bool)

(assert (=> b!1342671 m!1230295))

(assert (=> b!1342671 m!1230295))

(declare-fun m!1230297 () Bool)

(assert (=> b!1342671 m!1230297))

(declare-fun m!1230299 () Bool)

(assert (=> b!1342672 m!1230299))

(declare-fun m!1230301 () Bool)

(assert (=> b!1342672 m!1230301))

(declare-fun m!1230303 () Bool)

(assert (=> b!1342672 m!1230303))

(declare-fun m!1230305 () Bool)

(assert (=> b!1342672 m!1230305))

(declare-fun m!1230307 () Bool)

(assert (=> b!1342672 m!1230307))

(declare-fun m!1230309 () Bool)

(assert (=> b!1342672 m!1230309))

(declare-fun m!1230311 () Bool)

(assert (=> b!1342672 m!1230311))

(assert (=> b!1342672 m!1230305))

(assert (=> b!1342672 m!1230307))

(assert (=> b!1342672 m!1230295))

(declare-fun m!1230313 () Bool)

(assert (=> b!1342672 m!1230313))

(assert (=> b!1342672 m!1230295))

(declare-fun m!1230315 () Bool)

(assert (=> b!1342672 m!1230315))

(declare-fun m!1230317 () Bool)

(assert (=> start!113200 m!1230317))

(declare-fun m!1230319 () Bool)

(assert (=> start!113200 m!1230319))

(declare-fun m!1230321 () Bool)

(assert (=> start!113200 m!1230321))

(assert (=> b!1342673 m!1230295))

(check-sat (not b!1342669) (not b_lambda!24427) (not b!1342665) (not b_next!31251) b_and!50411 (not b!1342671) (not mapNonEmpty!57583) tp_is_empty!37251 (not b!1342664) (not start!113200) (not b!1342672))
(check-sat b_and!50411 (not b_next!31251))
