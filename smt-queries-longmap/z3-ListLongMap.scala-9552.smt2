; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113398 () Bool)

(assert start!113398)

(declare-fun b_free!31225 () Bool)

(declare-fun b_next!31225 () Bool)

(assert (=> start!113398 (= b_free!31225 (not b_next!31225))))

(declare-fun tp!109480 () Bool)

(declare-fun b_and!50359 () Bool)

(assert (=> start!113398 (= tp!109480 b_and!50359)))

(declare-fun b!1343468 () Bool)

(declare-fun res!890952 () Bool)

(declare-fun e!765011 () Bool)

(assert (=> b!1343468 (=> (not res!890952) (not e!765011))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54737 0))(
  ( (V!54738 (val!18687 Int)) )
))
(declare-datatypes ((ValueCell!17714 0))(
  ( (ValueCellFull!17714 (v!21330 V!54737)) (EmptyCell!17714) )
))
(declare-datatypes ((array!91419 0))(
  ( (array!91420 (arr!44161 (Array (_ BitVec 32) ValueCell!17714)) (size!44712 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91419)

(declare-datatypes ((array!91421 0))(
  ( (array!91422 (arr!44162 (Array (_ BitVec 32) (_ BitVec 64))) (size!44713 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91421)

(assert (=> b!1343468 (= res!890952 (and (= (size!44712 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44713 _keys!1571) (size!44712 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343470 () Bool)

(declare-fun e!765008 () Bool)

(declare-fun tp_is_empty!37225 () Bool)

(assert (=> b!1343470 (= e!765008 tp_is_empty!37225)))

(declare-fun b!1343471 () Bool)

(declare-fun res!890955 () Bool)

(assert (=> b!1343471 (=> (not res!890955) (not e!765011))))

(assert (=> b!1343471 (= res!890955 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343472 () Bool)

(declare-fun res!890957 () Bool)

(assert (=> b!1343472 (=> (not res!890957) (not e!765011))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343472 (= res!890957 (validKeyInArray!0 (select (arr!44162 _keys!1571) from!1960)))))

(declare-fun b!1343473 () Bool)

(declare-fun res!890960 () Bool)

(assert (=> b!1343473 (=> (not res!890960) (not e!765011))))

(declare-fun minValue!1245 () V!54737)

(declare-fun zeroValue!1245 () V!54737)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24120 0))(
  ( (tuple2!24121 (_1!12071 (_ BitVec 64)) (_2!12071 V!54737)) )
))
(declare-datatypes ((List!31270 0))(
  ( (Nil!31267) (Cons!31266 (h!32484 tuple2!24120) (t!45698 List!31270)) )
))
(declare-datatypes ((ListLongMap!21785 0))(
  ( (ListLongMap!21786 (toList!10908 List!31270)) )
))
(declare-fun contains!9096 (ListLongMap!21785 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5856 (array!91421 array!91419 (_ BitVec 32) (_ BitVec 32) V!54737 V!54737 (_ BitVec 32) Int) ListLongMap!21785)

(assert (=> b!1343473 (= res!890960 (contains!9096 (getCurrentListMap!5856 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343474 () Bool)

(declare-fun e!765007 () Bool)

(declare-fun e!765009 () Bool)

(declare-fun mapRes!57544 () Bool)

(assert (=> b!1343474 (= e!765007 (and e!765009 mapRes!57544))))

(declare-fun condMapEmpty!57544 () Bool)

(declare-fun mapDefault!57544 () ValueCell!17714)

(assert (=> b!1343474 (= condMapEmpty!57544 (= (arr!44161 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17714)) mapDefault!57544)))))

(declare-fun b!1343475 () Bool)

(declare-fun res!890953 () Bool)

(assert (=> b!1343475 (=> (not res!890953) (not e!765011))))

(declare-datatypes ((List!31271 0))(
  ( (Nil!31268) (Cons!31267 (h!32485 (_ BitVec 64)) (t!45699 List!31271)) )
))
(declare-fun arrayNoDuplicates!0 (array!91421 (_ BitVec 32) List!31271) Bool)

(assert (=> b!1343475 (= res!890953 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31268))))

(declare-fun res!890958 () Bool)

(assert (=> start!113398 (=> (not res!890958) (not e!765011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113398 (= res!890958 (validMask!0 mask!1977))))

(assert (=> start!113398 e!765011))

(assert (=> start!113398 tp_is_empty!37225))

(assert (=> start!113398 true))

(declare-fun array_inv!33561 (array!91421) Bool)

(assert (=> start!113398 (array_inv!33561 _keys!1571)))

(declare-fun array_inv!33562 (array!91419) Bool)

(assert (=> start!113398 (and (array_inv!33562 _values!1303) e!765007)))

(assert (=> start!113398 tp!109480))

(declare-fun b!1343469 () Bool)

(declare-fun res!890959 () Bool)

(assert (=> b!1343469 (=> (not res!890959) (not e!765011))))

(assert (=> b!1343469 (= res!890959 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44713 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343476 () Bool)

(declare-fun res!890954 () Bool)

(assert (=> b!1343476 (=> (not res!890954) (not e!765011))))

(assert (=> b!1343476 (= res!890954 (not (= (select (arr!44162 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57544 () Bool)

(assert (=> mapIsEmpty!57544 mapRes!57544))

(declare-fun b!1343477 () Bool)

(assert (=> b!1343477 (= e!765011 (not true))))

(declare-fun lt!594853 () ListLongMap!21785)

(assert (=> b!1343477 (contains!9096 lt!594853 k0!1142)))

(declare-datatypes ((Unit!43990 0))(
  ( (Unit!43991) )
))
(declare-fun lt!594854 () Unit!43990)

(declare-fun lt!594850 () V!54737)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!351 ((_ BitVec 64) (_ BitVec 64) V!54737 ListLongMap!21785) Unit!43990)

(assert (=> b!1343477 (= lt!594854 (lemmaInListMapAfterAddingDiffThenInBefore!351 k0!1142 (select (arr!44162 _keys!1571) from!1960) lt!594850 lt!594853))))

(declare-fun lt!594852 () ListLongMap!21785)

(assert (=> b!1343477 (contains!9096 lt!594852 k0!1142)))

(declare-fun lt!594851 () Unit!43990)

(assert (=> b!1343477 (= lt!594851 (lemmaInListMapAfterAddingDiffThenInBefore!351 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594852))))

(declare-fun +!4825 (ListLongMap!21785 tuple2!24120) ListLongMap!21785)

(assert (=> b!1343477 (= lt!594852 (+!4825 lt!594853 (tuple2!24121 (select (arr!44162 _keys!1571) from!1960) lt!594850)))))

(declare-fun get!22309 (ValueCell!17714 V!54737) V!54737)

(declare-fun dynLambda!3779 (Int (_ BitVec 64)) V!54737)

(assert (=> b!1343477 (= lt!594850 (get!22309 (select (arr!44161 _values!1303) from!1960) (dynLambda!3779 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6474 (array!91421 array!91419 (_ BitVec 32) (_ BitVec 32) V!54737 V!54737 (_ BitVec 32) Int) ListLongMap!21785)

(assert (=> b!1343477 (= lt!594853 (getCurrentListMapNoExtraKeys!6474 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343478 () Bool)

(declare-fun res!890956 () Bool)

(assert (=> b!1343478 (=> (not res!890956) (not e!765011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91421 (_ BitVec 32)) Bool)

(assert (=> b!1343478 (= res!890956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57544 () Bool)

(declare-fun tp!109479 () Bool)

(assert (=> mapNonEmpty!57544 (= mapRes!57544 (and tp!109479 e!765008))))

(declare-fun mapRest!57544 () (Array (_ BitVec 32) ValueCell!17714))

(declare-fun mapKey!57544 () (_ BitVec 32))

(declare-fun mapValue!57544 () ValueCell!17714)

(assert (=> mapNonEmpty!57544 (= (arr!44161 _values!1303) (store mapRest!57544 mapKey!57544 mapValue!57544))))

(declare-fun b!1343479 () Bool)

(assert (=> b!1343479 (= e!765009 tp_is_empty!37225)))

(assert (= (and start!113398 res!890958) b!1343468))

(assert (= (and b!1343468 res!890952) b!1343478))

(assert (= (and b!1343478 res!890956) b!1343475))

(assert (= (and b!1343475 res!890953) b!1343469))

(assert (= (and b!1343469 res!890959) b!1343473))

(assert (= (and b!1343473 res!890960) b!1343476))

(assert (= (and b!1343476 res!890954) b!1343472))

(assert (= (and b!1343472 res!890957) b!1343471))

(assert (= (and b!1343471 res!890955) b!1343477))

(assert (= (and b!1343474 condMapEmpty!57544) mapIsEmpty!57544))

(assert (= (and b!1343474 (not condMapEmpty!57544)) mapNonEmpty!57544))

(get-info :version)

(assert (= (and mapNonEmpty!57544 ((_ is ValueCellFull!17714) mapValue!57544)) b!1343470))

(assert (= (and b!1343474 ((_ is ValueCellFull!17714) mapDefault!57544)) b!1343479))

(assert (= start!113398 b!1343474))

(declare-fun b_lambda!24395 () Bool)

(assert (=> (not b_lambda!24395) (not b!1343477)))

(declare-fun t!45697 () Bool)

(declare-fun tb!12231 () Bool)

(assert (=> (and start!113398 (= defaultEntry!1306 defaultEntry!1306) t!45697) tb!12231))

(declare-fun result!25561 () Bool)

(assert (=> tb!12231 (= result!25561 tp_is_empty!37225)))

(assert (=> b!1343477 t!45697))

(declare-fun b_and!50361 () Bool)

(assert (= b_and!50359 (and (=> t!45697 result!25561) b_and!50361)))

(declare-fun m!1231389 () Bool)

(assert (=> start!113398 m!1231389))

(declare-fun m!1231391 () Bool)

(assert (=> start!113398 m!1231391))

(declare-fun m!1231393 () Bool)

(assert (=> start!113398 m!1231393))

(declare-fun m!1231395 () Bool)

(assert (=> b!1343478 m!1231395))

(declare-fun m!1231397 () Bool)

(assert (=> b!1343473 m!1231397))

(assert (=> b!1343473 m!1231397))

(declare-fun m!1231399 () Bool)

(assert (=> b!1343473 m!1231399))

(declare-fun m!1231401 () Bool)

(assert (=> b!1343476 m!1231401))

(declare-fun m!1231403 () Bool)

(assert (=> b!1343475 m!1231403))

(declare-fun m!1231405 () Bool)

(assert (=> mapNonEmpty!57544 m!1231405))

(declare-fun m!1231407 () Bool)

(assert (=> b!1343477 m!1231407))

(declare-fun m!1231409 () Bool)

(assert (=> b!1343477 m!1231409))

(declare-fun m!1231411 () Bool)

(assert (=> b!1343477 m!1231411))

(declare-fun m!1231413 () Bool)

(assert (=> b!1343477 m!1231413))

(assert (=> b!1343477 m!1231401))

(assert (=> b!1343477 m!1231409))

(assert (=> b!1343477 m!1231411))

(declare-fun m!1231415 () Bool)

(assert (=> b!1343477 m!1231415))

(declare-fun m!1231417 () Bool)

(assert (=> b!1343477 m!1231417))

(declare-fun m!1231419 () Bool)

(assert (=> b!1343477 m!1231419))

(assert (=> b!1343477 m!1231401))

(declare-fun m!1231421 () Bool)

(assert (=> b!1343477 m!1231421))

(declare-fun m!1231423 () Bool)

(assert (=> b!1343477 m!1231423))

(assert (=> b!1343472 m!1231401))

(assert (=> b!1343472 m!1231401))

(declare-fun m!1231425 () Bool)

(assert (=> b!1343472 m!1231425))

(check-sat (not b!1343475) (not b_next!31225) b_and!50361 tp_is_empty!37225 (not b!1343472) (not start!113398) (not b_lambda!24395) (not b!1343473) (not b!1343478) (not mapNonEmpty!57544) (not b!1343477))
(check-sat b_and!50361 (not b_next!31225))
