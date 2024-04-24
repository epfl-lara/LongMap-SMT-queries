; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113344 () Bool)

(assert start!113344)

(declare-fun b_free!31171 () Bool)

(declare-fun b_next!31171 () Bool)

(assert (=> start!113344 (= b_free!31171 (not b_next!31171))))

(declare-fun tp!109317 () Bool)

(declare-fun b_and!50251 () Bool)

(assert (=> start!113344 (= tp!109317 b_and!50251)))

(declare-fun b!1342442 () Bool)

(declare-fun res!890226 () Bool)

(declare-fun e!764605 () Bool)

(assert (=> b!1342442 (=> (not res!890226) (not e!764605))))

(declare-datatypes ((array!91315 0))(
  ( (array!91316 (arr!44109 (Array (_ BitVec 32) (_ BitVec 64))) (size!44660 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91315)

(declare-datatypes ((List!31235 0))(
  ( (Nil!31232) (Cons!31231 (h!32449 (_ BitVec 64)) (t!45609 List!31235)) )
))
(declare-fun arrayNoDuplicates!0 (array!91315 (_ BitVec 32) List!31235) Bool)

(assert (=> b!1342442 (= res!890226 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31232))))

(declare-fun b!1342443 () Bool)

(assert (=> b!1342443 (= e!764605 (not true))))

(declare-datatypes ((V!54665 0))(
  ( (V!54666 (val!18660 Int)) )
))
(declare-datatypes ((tuple2!24080 0))(
  ( (tuple2!24081 (_1!12051 (_ BitVec 64)) (_2!12051 V!54665)) )
))
(declare-datatypes ((List!31236 0))(
  ( (Nil!31233) (Cons!31232 (h!32450 tuple2!24080) (t!45610 List!31236)) )
))
(declare-datatypes ((ListLongMap!21745 0))(
  ( (ListLongMap!21746 (toList!10888 List!31236)) )
))
(declare-fun lt!594574 () ListLongMap!21745)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9076 (ListLongMap!21745 (_ BitVec 64)) Bool)

(assert (=> b!1342443 (contains!9076 lt!594574 k0!1142)))

(declare-datatypes ((Unit!43952 0))(
  ( (Unit!43953) )
))
(declare-fun lt!594575 () Unit!43952)

(declare-fun zeroValue!1245 () V!54665)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!332 ((_ BitVec 64) (_ BitVec 64) V!54665 ListLongMap!21745) Unit!43952)

(assert (=> b!1342443 (= lt!594575 (lemmaInListMapAfterAddingDiffThenInBefore!332 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594574))))

(declare-fun minValue!1245 () V!54665)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17687 0))(
  ( (ValueCellFull!17687 (v!21303 V!54665)) (EmptyCell!17687) )
))
(declare-datatypes ((array!91317 0))(
  ( (array!91318 (arr!44110 (Array (_ BitVec 32) ValueCell!17687)) (size!44661 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91317)

(declare-fun +!4806 (ListLongMap!21745 tuple2!24080) ListLongMap!21745)

(declare-fun getCurrentListMapNoExtraKeys!6455 (array!91315 array!91317 (_ BitVec 32) (_ BitVec 32) V!54665 V!54665 (_ BitVec 32) Int) ListLongMap!21745)

(declare-fun get!22272 (ValueCell!17687 V!54665) V!54665)

(declare-fun dynLambda!3760 (Int (_ BitVec 64)) V!54665)

(assert (=> b!1342443 (= lt!594574 (+!4806 (getCurrentListMapNoExtraKeys!6455 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24081 (select (arr!44109 _keys!1571) from!1960) (get!22272 (select (arr!44110 _values!1303) from!1960) (dynLambda!3760 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1342444 () Bool)

(declare-fun e!764604 () Bool)

(declare-fun tp_is_empty!37171 () Bool)

(assert (=> b!1342444 (= e!764604 tp_is_empty!37171)))

(declare-fun b!1342445 () Bool)

(declare-fun e!764606 () Bool)

(assert (=> b!1342445 (= e!764606 tp_is_empty!37171)))

(declare-fun res!890223 () Bool)

(assert (=> start!113344 (=> (not res!890223) (not e!764605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113344 (= res!890223 (validMask!0 mask!1977))))

(assert (=> start!113344 e!764605))

(assert (=> start!113344 tp_is_empty!37171))

(assert (=> start!113344 true))

(declare-fun array_inv!33521 (array!91315) Bool)

(assert (=> start!113344 (array_inv!33521 _keys!1571)))

(declare-fun e!764603 () Bool)

(declare-fun array_inv!33522 (array!91317) Bool)

(assert (=> start!113344 (and (array_inv!33522 _values!1303) e!764603)))

(assert (=> start!113344 tp!109317))

(declare-fun mapIsEmpty!57463 () Bool)

(declare-fun mapRes!57463 () Bool)

(assert (=> mapIsEmpty!57463 mapRes!57463))

(declare-fun b!1342446 () Bool)

(declare-fun res!890225 () Bool)

(assert (=> b!1342446 (=> (not res!890225) (not e!764605))))

(assert (=> b!1342446 (= res!890225 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44660 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342447 () Bool)

(declare-fun res!890228 () Bool)

(assert (=> b!1342447 (=> (not res!890228) (not e!764605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91315 (_ BitVec 32)) Bool)

(assert (=> b!1342447 (= res!890228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342448 () Bool)

(declare-fun res!890229 () Bool)

(assert (=> b!1342448 (=> (not res!890229) (not e!764605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342448 (= res!890229 (validKeyInArray!0 (select (arr!44109 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!57463 () Bool)

(declare-fun tp!109318 () Bool)

(assert (=> mapNonEmpty!57463 (= mapRes!57463 (and tp!109318 e!764604))))

(declare-fun mapRest!57463 () (Array (_ BitVec 32) ValueCell!17687))

(declare-fun mapValue!57463 () ValueCell!17687)

(declare-fun mapKey!57463 () (_ BitVec 32))

(assert (=> mapNonEmpty!57463 (= (arr!44110 _values!1303) (store mapRest!57463 mapKey!57463 mapValue!57463))))

(declare-fun b!1342449 () Bool)

(declare-fun res!890227 () Bool)

(assert (=> b!1342449 (=> (not res!890227) (not e!764605))))

(assert (=> b!1342449 (= res!890227 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342450 () Bool)

(declare-fun res!890230 () Bool)

(assert (=> b!1342450 (=> (not res!890230) (not e!764605))))

(declare-fun getCurrentListMap!5839 (array!91315 array!91317 (_ BitVec 32) (_ BitVec 32) V!54665 V!54665 (_ BitVec 32) Int) ListLongMap!21745)

(assert (=> b!1342450 (= res!890230 (contains!9076 (getCurrentListMap!5839 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342451 () Bool)

(declare-fun res!890231 () Bool)

(assert (=> b!1342451 (=> (not res!890231) (not e!764605))))

(assert (=> b!1342451 (= res!890231 (not (= (select (arr!44109 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342452 () Bool)

(assert (=> b!1342452 (= e!764603 (and e!764606 mapRes!57463))))

(declare-fun condMapEmpty!57463 () Bool)

(declare-fun mapDefault!57463 () ValueCell!17687)

(assert (=> b!1342452 (= condMapEmpty!57463 (= (arr!44110 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17687)) mapDefault!57463)))))

(declare-fun b!1342453 () Bool)

(declare-fun res!890224 () Bool)

(assert (=> b!1342453 (=> (not res!890224) (not e!764605))))

(assert (=> b!1342453 (= res!890224 (and (= (size!44661 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44660 _keys!1571) (size!44661 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113344 res!890223) b!1342453))

(assert (= (and b!1342453 res!890224) b!1342447))

(assert (= (and b!1342447 res!890228) b!1342442))

(assert (= (and b!1342442 res!890226) b!1342446))

(assert (= (and b!1342446 res!890225) b!1342450))

(assert (= (and b!1342450 res!890230) b!1342451))

(assert (= (and b!1342451 res!890231) b!1342448))

(assert (= (and b!1342448 res!890229) b!1342449))

(assert (= (and b!1342449 res!890227) b!1342443))

(assert (= (and b!1342452 condMapEmpty!57463) mapIsEmpty!57463))

(assert (= (and b!1342452 (not condMapEmpty!57463)) mapNonEmpty!57463))

(get-info :version)

(assert (= (and mapNonEmpty!57463 ((_ is ValueCellFull!17687) mapValue!57463)) b!1342444))

(assert (= (and b!1342452 ((_ is ValueCellFull!17687) mapDefault!57463)) b!1342445))

(assert (= start!113344 b!1342452))

(declare-fun b_lambda!24341 () Bool)

(assert (=> (not b_lambda!24341) (not b!1342443)))

(declare-fun t!45608 () Bool)

(declare-fun tb!12177 () Bool)

(assert (=> (and start!113344 (= defaultEntry!1306 defaultEntry!1306) t!45608) tb!12177))

(declare-fun result!25453 () Bool)

(assert (=> tb!12177 (= result!25453 tp_is_empty!37171)))

(assert (=> b!1342443 t!45608))

(declare-fun b_and!50253 () Bool)

(assert (= b_and!50251 (and (=> t!45608 result!25453) b_and!50253)))

(declare-fun m!1230423 () Bool)

(assert (=> b!1342448 m!1230423))

(assert (=> b!1342448 m!1230423))

(declare-fun m!1230425 () Bool)

(assert (=> b!1342448 m!1230425))

(declare-fun m!1230427 () Bool)

(assert (=> b!1342442 m!1230427))

(declare-fun m!1230429 () Bool)

(assert (=> b!1342450 m!1230429))

(assert (=> b!1342450 m!1230429))

(declare-fun m!1230431 () Bool)

(assert (=> b!1342450 m!1230431))

(declare-fun m!1230433 () Bool)

(assert (=> b!1342443 m!1230433))

(declare-fun m!1230435 () Bool)

(assert (=> b!1342443 m!1230435))

(declare-fun m!1230437 () Bool)

(assert (=> b!1342443 m!1230437))

(declare-fun m!1230439 () Bool)

(assert (=> b!1342443 m!1230439))

(declare-fun m!1230441 () Bool)

(assert (=> b!1342443 m!1230441))

(assert (=> b!1342443 m!1230433))

(declare-fun m!1230443 () Bool)

(assert (=> b!1342443 m!1230443))

(assert (=> b!1342443 m!1230435))

(assert (=> b!1342443 m!1230423))

(assert (=> b!1342443 m!1230439))

(declare-fun m!1230445 () Bool)

(assert (=> b!1342443 m!1230445))

(declare-fun m!1230447 () Bool)

(assert (=> start!113344 m!1230447))

(declare-fun m!1230449 () Bool)

(assert (=> start!113344 m!1230449))

(declare-fun m!1230451 () Bool)

(assert (=> start!113344 m!1230451))

(declare-fun m!1230453 () Bool)

(assert (=> mapNonEmpty!57463 m!1230453))

(declare-fun m!1230455 () Bool)

(assert (=> b!1342447 m!1230455))

(assert (=> b!1342451 m!1230423))

(check-sat tp_is_empty!37171 (not b_next!31171) (not b!1342450) (not start!113344) (not b!1342443) (not b!1342442) (not b!1342447) b_and!50253 (not b!1342448) (not b_lambda!24341) (not mapNonEmpty!57463))
(check-sat b_and!50253 (not b_next!31171))
