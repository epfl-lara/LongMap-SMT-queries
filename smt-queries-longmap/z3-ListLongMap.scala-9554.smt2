; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113188 () Bool)

(assert start!113188)

(declare-fun b_free!31239 () Bool)

(declare-fun b_next!31239 () Bool)

(assert (=> start!113188 (= b_free!31239 (not b_next!31239))))

(declare-fun tp!109522 () Bool)

(declare-fun b_and!50385 () Bool)

(assert (=> start!113188 (= tp!109522 b_and!50385)))

(declare-fun b!1342435 () Bool)

(declare-fun res!890629 () Bool)

(declare-fun e!764273 () Bool)

(assert (=> b!1342435 (=> (not res!890629) (not e!764273))))

(declare-datatypes ((array!91328 0))(
  ( (array!91329 (arr!44120 (Array (_ BitVec 32) (_ BitVec 64))) (size!44670 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91328)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91328 (_ BitVec 32)) Bool)

(assert (=> b!1342435 (= res!890629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342436 () Bool)

(declare-fun e!764269 () Bool)

(declare-fun e!764271 () Bool)

(declare-fun mapRes!57565 () Bool)

(assert (=> b!1342436 (= e!764269 (and e!764271 mapRes!57565))))

(declare-fun condMapEmpty!57565 () Bool)

(declare-datatypes ((V!54755 0))(
  ( (V!54756 (val!18694 Int)) )
))
(declare-datatypes ((ValueCell!17721 0))(
  ( (ValueCellFull!17721 (v!21342 V!54755)) (EmptyCell!17721) )
))
(declare-datatypes ((array!91330 0))(
  ( (array!91331 (arr!44121 (Array (_ BitVec 32) ValueCell!17721)) (size!44671 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91330)

(declare-fun mapDefault!57565 () ValueCell!17721)

(assert (=> b!1342436 (= condMapEmpty!57565 (= (arr!44121 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17721)) mapDefault!57565)))))

(declare-fun b!1342437 () Bool)

(declare-fun res!890628 () Bool)

(assert (=> b!1342437 (=> (not res!890628) (not e!764273))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342437 (= res!890628 (and (= (size!44671 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44670 _keys!1571) (size!44671 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!890625 () Bool)

(assert (=> start!113188 (=> (not res!890625) (not e!764273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113188 (= res!890625 (validMask!0 mask!1977))))

(assert (=> start!113188 e!764273))

(declare-fun tp_is_empty!37239 () Bool)

(assert (=> start!113188 tp_is_empty!37239))

(assert (=> start!113188 true))

(declare-fun array_inv!33253 (array!91328) Bool)

(assert (=> start!113188 (array_inv!33253 _keys!1571)))

(declare-fun array_inv!33254 (array!91330) Bool)

(assert (=> start!113188 (and (array_inv!33254 _values!1303) e!764269)))

(assert (=> start!113188 tp!109522))

(declare-fun mapIsEmpty!57565 () Bool)

(assert (=> mapIsEmpty!57565 mapRes!57565))

(declare-fun b!1342438 () Bool)

(declare-fun res!890630 () Bool)

(assert (=> b!1342438 (=> (not res!890630) (not e!764273))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342438 (= res!890630 (validKeyInArray!0 (select (arr!44120 _keys!1571) from!1960)))))

(declare-fun b!1342439 () Bool)

(assert (=> b!1342439 (= e!764271 tp_is_empty!37239)))

(declare-fun b!1342440 () Bool)

(declare-fun res!890623 () Bool)

(assert (=> b!1342440 (=> (not res!890623) (not e!764273))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1342440 (= res!890623 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44670 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342441 () Bool)

(declare-fun res!890626 () Bool)

(assert (=> b!1342441 (=> (not res!890626) (not e!764273))))

(assert (=> b!1342441 (= res!890626 (not (= (select (arr!44120 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342442 () Bool)

(declare-fun res!890627 () Bool)

(assert (=> b!1342442 (=> (not res!890627) (not e!764273))))

(declare-fun minValue!1245 () V!54755)

(declare-fun zeroValue!1245 () V!54755)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24076 0))(
  ( (tuple2!24077 (_1!12049 (_ BitVec 64)) (_2!12049 V!54755)) )
))
(declare-datatypes ((List!31233 0))(
  ( (Nil!31230) (Cons!31229 (h!32438 tuple2!24076) (t!45683 List!31233)) )
))
(declare-datatypes ((ListLongMap!21733 0))(
  ( (ListLongMap!21734 (toList!10882 List!31233)) )
))
(declare-fun contains!9058 (ListLongMap!21733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5846 (array!91328 array!91330 (_ BitVec 32) (_ BitVec 32) V!54755 V!54755 (_ BitVec 32) Int) ListLongMap!21733)

(assert (=> b!1342442 (= res!890627 (contains!9058 (getCurrentListMap!5846 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342443 () Bool)

(assert (=> b!1342443 (= e!764273 (not true))))

(declare-fun lt!594481 () ListLongMap!21733)

(assert (=> b!1342443 (contains!9058 lt!594481 k0!1142)))

(declare-datatypes ((Unit!44063 0))(
  ( (Unit!44064) )
))
(declare-fun lt!594482 () Unit!44063)

(declare-fun lt!594480 () V!54755)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!362 ((_ BitVec 64) (_ BitVec 64) V!54755 ListLongMap!21733) Unit!44063)

(assert (=> b!1342443 (= lt!594482 (lemmaInListMapAfterAddingDiffThenInBefore!362 k0!1142 (select (arr!44120 _keys!1571) from!1960) lt!594480 lt!594481))))

(declare-fun lt!594483 () ListLongMap!21733)

(assert (=> b!1342443 (contains!9058 lt!594483 k0!1142)))

(declare-fun lt!594479 () Unit!44063)

(assert (=> b!1342443 (= lt!594479 (lemmaInListMapAfterAddingDiffThenInBefore!362 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594483))))

(declare-fun +!4793 (ListLongMap!21733 tuple2!24076) ListLongMap!21733)

(assert (=> b!1342443 (= lt!594483 (+!4793 lt!594481 (tuple2!24077 (select (arr!44120 _keys!1571) from!1960) lt!594480)))))

(declare-fun get!22278 (ValueCell!17721 V!54755) V!54755)

(declare-fun dynLambda!3732 (Int (_ BitVec 64)) V!54755)

(assert (=> b!1342443 (= lt!594480 (get!22278 (select (arr!44121 _values!1303) from!1960) (dynLambda!3732 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6435 (array!91328 array!91330 (_ BitVec 32) (_ BitVec 32) V!54755 V!54755 (_ BitVec 32) Int) ListLongMap!21733)

(assert (=> b!1342443 (= lt!594481 (getCurrentListMapNoExtraKeys!6435 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342444 () Bool)

(declare-fun res!890631 () Bool)

(assert (=> b!1342444 (=> (not res!890631) (not e!764273))))

(declare-datatypes ((List!31234 0))(
  ( (Nil!31231) (Cons!31230 (h!32439 (_ BitVec 64)) (t!45684 List!31234)) )
))
(declare-fun arrayNoDuplicates!0 (array!91328 (_ BitVec 32) List!31234) Bool)

(assert (=> b!1342444 (= res!890631 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31231))))

(declare-fun b!1342445 () Bool)

(declare-fun e!764272 () Bool)

(assert (=> b!1342445 (= e!764272 tp_is_empty!37239)))

(declare-fun mapNonEmpty!57565 () Bool)

(declare-fun tp!109521 () Bool)

(assert (=> mapNonEmpty!57565 (= mapRes!57565 (and tp!109521 e!764272))))

(declare-fun mapRest!57565 () (Array (_ BitVec 32) ValueCell!17721))

(declare-fun mapValue!57565 () ValueCell!17721)

(declare-fun mapKey!57565 () (_ BitVec 32))

(assert (=> mapNonEmpty!57565 (= (arr!44121 _values!1303) (store mapRest!57565 mapKey!57565 mapValue!57565))))

(declare-fun b!1342446 () Bool)

(declare-fun res!890624 () Bool)

(assert (=> b!1342446 (=> (not res!890624) (not e!764273))))

(assert (=> b!1342446 (= res!890624 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!113188 res!890625) b!1342437))

(assert (= (and b!1342437 res!890628) b!1342435))

(assert (= (and b!1342435 res!890629) b!1342444))

(assert (= (and b!1342444 res!890631) b!1342440))

(assert (= (and b!1342440 res!890623) b!1342442))

(assert (= (and b!1342442 res!890627) b!1342441))

(assert (= (and b!1342441 res!890626) b!1342438))

(assert (= (and b!1342438 res!890630) b!1342446))

(assert (= (and b!1342446 res!890624) b!1342443))

(assert (= (and b!1342436 condMapEmpty!57565) mapIsEmpty!57565))

(assert (= (and b!1342436 (not condMapEmpty!57565)) mapNonEmpty!57565))

(get-info :version)

(assert (= (and mapNonEmpty!57565 ((_ is ValueCellFull!17721) mapValue!57565)) b!1342445))

(assert (= (and b!1342436 ((_ is ValueCellFull!17721) mapDefault!57565)) b!1342439))

(assert (= start!113188 b!1342436))

(declare-fun b_lambda!24415 () Bool)

(assert (=> (not b_lambda!24415) (not b!1342443)))

(declare-fun t!45682 () Bool)

(declare-fun tb!12253 () Bool)

(assert (=> (and start!113188 (= defaultEntry!1306 defaultEntry!1306) t!45682) tb!12253))

(declare-fun result!25597 () Bool)

(assert (=> tb!12253 (= result!25597 tp_is_empty!37239)))

(assert (=> b!1342443 t!45682))

(declare-fun b_and!50387 () Bool)

(assert (= b_and!50385 (and (=> t!45682 result!25597) b_and!50387)))

(declare-fun m!1230057 () Bool)

(assert (=> b!1342435 m!1230057))

(declare-fun m!1230059 () Bool)

(assert (=> start!113188 m!1230059))

(declare-fun m!1230061 () Bool)

(assert (=> start!113188 m!1230061))

(declare-fun m!1230063 () Bool)

(assert (=> start!113188 m!1230063))

(declare-fun m!1230065 () Bool)

(assert (=> b!1342438 m!1230065))

(assert (=> b!1342438 m!1230065))

(declare-fun m!1230067 () Bool)

(assert (=> b!1342438 m!1230067))

(declare-fun m!1230069 () Bool)

(assert (=> mapNonEmpty!57565 m!1230069))

(declare-fun m!1230071 () Bool)

(assert (=> b!1342444 m!1230071))

(assert (=> b!1342441 m!1230065))

(declare-fun m!1230073 () Bool)

(assert (=> b!1342442 m!1230073))

(assert (=> b!1342442 m!1230073))

(declare-fun m!1230075 () Bool)

(assert (=> b!1342442 m!1230075))

(declare-fun m!1230077 () Bool)

(assert (=> b!1342443 m!1230077))

(declare-fun m!1230079 () Bool)

(assert (=> b!1342443 m!1230079))

(declare-fun m!1230081 () Bool)

(assert (=> b!1342443 m!1230081))

(declare-fun m!1230083 () Bool)

(assert (=> b!1342443 m!1230083))

(assert (=> b!1342443 m!1230065))

(declare-fun m!1230085 () Bool)

(assert (=> b!1342443 m!1230085))

(assert (=> b!1342443 m!1230079))

(assert (=> b!1342443 m!1230081))

(declare-fun m!1230087 () Bool)

(assert (=> b!1342443 m!1230087))

(declare-fun m!1230089 () Bool)

(assert (=> b!1342443 m!1230089))

(declare-fun m!1230091 () Bool)

(assert (=> b!1342443 m!1230091))

(assert (=> b!1342443 m!1230065))

(declare-fun m!1230093 () Bool)

(assert (=> b!1342443 m!1230093))

(check-sat (not b!1342438) (not b!1342442) (not b_next!31239) (not b!1342435) (not mapNonEmpty!57565) (not b_lambda!24415) (not start!113188) (not b!1342444) tp_is_empty!37239 (not b!1342443) b_and!50387)
(check-sat b_and!50387 (not b_next!31239))
