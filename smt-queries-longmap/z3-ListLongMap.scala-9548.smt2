; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113152 () Bool)

(assert start!113152)

(declare-fun b_free!31203 () Bool)

(declare-fun b_next!31203 () Bool)

(assert (=> start!113152 (= b_free!31203 (not b_next!31203))))

(declare-fun tp!109413 () Bool)

(declare-fun b_and!50313 () Bool)

(assert (=> start!113152 (= tp!109413 b_and!50313)))

(declare-fun b!1341751 () Bool)

(declare-fun e!764001 () Bool)

(declare-fun tp_is_empty!37203 () Bool)

(assert (=> b!1341751 (= e!764001 tp_is_empty!37203)))

(declare-fun b!1341752 () Bool)

(declare-fun res!890137 () Bool)

(declare-fun e!764002 () Bool)

(assert (=> b!1341752 (=> (not res!890137) (not e!764002))))

(declare-datatypes ((array!91258 0))(
  ( (array!91259 (arr!44085 (Array (_ BitVec 32) (_ BitVec 64))) (size!44635 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91258)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91258 (_ BitVec 32)) Bool)

(assert (=> b!1341752 (= res!890137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57511 () Bool)

(declare-fun mapRes!57511 () Bool)

(declare-fun tp!109414 () Bool)

(assert (=> mapNonEmpty!57511 (= mapRes!57511 (and tp!109414 e!764001))))

(declare-datatypes ((V!54707 0))(
  ( (V!54708 (val!18676 Int)) )
))
(declare-datatypes ((ValueCell!17703 0))(
  ( (ValueCellFull!17703 (v!21324 V!54707)) (EmptyCell!17703) )
))
(declare-fun mapRest!57511 () (Array (_ BitVec 32) ValueCell!17703))

(declare-fun mapValue!57511 () ValueCell!17703)

(declare-fun mapKey!57511 () (_ BitVec 32))

(declare-datatypes ((array!91260 0))(
  ( (array!91261 (arr!44086 (Array (_ BitVec 32) ValueCell!17703)) (size!44636 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91260)

(assert (=> mapNonEmpty!57511 (= (arr!44086 _values!1303) (store mapRest!57511 mapKey!57511 mapValue!57511))))

(declare-fun b!1341753 () Bool)

(declare-fun res!890145 () Bool)

(assert (=> b!1341753 (=> (not res!890145) (not e!764002))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341753 (= res!890145 (validKeyInArray!0 (select (arr!44085 _keys!1571) from!1960)))))

(declare-fun b!1341754 () Bool)

(assert (=> b!1341754 (= e!764002 (not true))))

(declare-datatypes ((tuple2!24052 0))(
  ( (tuple2!24053 (_1!12037 (_ BitVec 64)) (_2!12037 V!54707)) )
))
(declare-datatypes ((List!31209 0))(
  ( (Nil!31206) (Cons!31205 (h!32414 tuple2!24052) (t!45623 List!31209)) )
))
(declare-datatypes ((ListLongMap!21709 0))(
  ( (ListLongMap!21710 (toList!10870 List!31209)) )
))
(declare-fun lt!594210 () ListLongMap!21709)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9046 (ListLongMap!21709 (_ BitVec 64)) Bool)

(assert (=> b!1341754 (contains!9046 lt!594210 k0!1142)))

(declare-fun lt!594209 () V!54707)

(declare-datatypes ((Unit!44041 0))(
  ( (Unit!44042) )
))
(declare-fun lt!594212 () Unit!44041)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!351 ((_ BitVec 64) (_ BitVec 64) V!54707 ListLongMap!21709) Unit!44041)

(assert (=> b!1341754 (= lt!594212 (lemmaInListMapAfterAddingDiffThenInBefore!351 k0!1142 (select (arr!44085 _keys!1571) from!1960) lt!594209 lt!594210))))

(declare-fun lt!594211 () ListLongMap!21709)

(assert (=> b!1341754 (contains!9046 lt!594211 k0!1142)))

(declare-fun lt!594213 () Unit!44041)

(declare-fun zeroValue!1245 () V!54707)

(assert (=> b!1341754 (= lt!594213 (lemmaInListMapAfterAddingDiffThenInBefore!351 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594211))))

(declare-fun +!4782 (ListLongMap!21709 tuple2!24052) ListLongMap!21709)

(assert (=> b!1341754 (= lt!594211 (+!4782 lt!594210 (tuple2!24053 (select (arr!44085 _keys!1571) from!1960) lt!594209)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22255 (ValueCell!17703 V!54707) V!54707)

(declare-fun dynLambda!3721 (Int (_ BitVec 64)) V!54707)

(assert (=> b!1341754 (= lt!594209 (get!22255 (select (arr!44086 _values!1303) from!1960) (dynLambda!3721 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54707)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6424 (array!91258 array!91260 (_ BitVec 32) (_ BitVec 32) V!54707 V!54707 (_ BitVec 32) Int) ListLongMap!21709)

(assert (=> b!1341754 (= lt!594210 (getCurrentListMapNoExtraKeys!6424 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1341755 () Bool)

(declare-fun res!890141 () Bool)

(assert (=> b!1341755 (=> (not res!890141) (not e!764002))))

(assert (=> b!1341755 (= res!890141 (not (= (select (arr!44085 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57511 () Bool)

(assert (=> mapIsEmpty!57511 mapRes!57511))

(declare-fun b!1341756 () Bool)

(declare-fun res!890144 () Bool)

(assert (=> b!1341756 (=> (not res!890144) (not e!764002))))

(assert (=> b!1341756 (= res!890144 (and (= (size!44636 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44635 _keys!1571) (size!44636 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!890138 () Bool)

(assert (=> start!113152 (=> (not res!890138) (not e!764002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113152 (= res!890138 (validMask!0 mask!1977))))

(assert (=> start!113152 e!764002))

(assert (=> start!113152 tp_is_empty!37203))

(assert (=> start!113152 true))

(declare-fun array_inv!33231 (array!91258) Bool)

(assert (=> start!113152 (array_inv!33231 _keys!1571)))

(declare-fun e!764003 () Bool)

(declare-fun array_inv!33232 (array!91260) Bool)

(assert (=> start!113152 (and (array_inv!33232 _values!1303) e!764003)))

(assert (=> start!113152 tp!109413))

(declare-fun b!1341757 () Bool)

(declare-fun res!890143 () Bool)

(assert (=> b!1341757 (=> (not res!890143) (not e!764002))))

(assert (=> b!1341757 (= res!890143 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44635 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341758 () Bool)

(declare-fun e!764000 () Bool)

(assert (=> b!1341758 (= e!764000 tp_is_empty!37203)))

(declare-fun b!1341759 () Bool)

(declare-fun res!890139 () Bool)

(assert (=> b!1341759 (=> (not res!890139) (not e!764002))))

(assert (=> b!1341759 (= res!890139 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341760 () Bool)

(declare-fun res!890140 () Bool)

(assert (=> b!1341760 (=> (not res!890140) (not e!764002))))

(declare-datatypes ((List!31210 0))(
  ( (Nil!31207) (Cons!31206 (h!32415 (_ BitVec 64)) (t!45624 List!31210)) )
))
(declare-fun arrayNoDuplicates!0 (array!91258 (_ BitVec 32) List!31210) Bool)

(assert (=> b!1341760 (= res!890140 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31207))))

(declare-fun b!1341761 () Bool)

(declare-fun res!890142 () Bool)

(assert (=> b!1341761 (=> (not res!890142) (not e!764002))))

(declare-fun getCurrentListMap!5834 (array!91258 array!91260 (_ BitVec 32) (_ BitVec 32) V!54707 V!54707 (_ BitVec 32) Int) ListLongMap!21709)

(assert (=> b!1341761 (= res!890142 (contains!9046 (getCurrentListMap!5834 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341762 () Bool)

(assert (=> b!1341762 (= e!764003 (and e!764000 mapRes!57511))))

(declare-fun condMapEmpty!57511 () Bool)

(declare-fun mapDefault!57511 () ValueCell!17703)

(assert (=> b!1341762 (= condMapEmpty!57511 (= (arr!44086 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17703)) mapDefault!57511)))))

(assert (= (and start!113152 res!890138) b!1341756))

(assert (= (and b!1341756 res!890144) b!1341752))

(assert (= (and b!1341752 res!890137) b!1341760))

(assert (= (and b!1341760 res!890140) b!1341757))

(assert (= (and b!1341757 res!890143) b!1341761))

(assert (= (and b!1341761 res!890142) b!1341755))

(assert (= (and b!1341755 res!890141) b!1341753))

(assert (= (and b!1341753 res!890145) b!1341759))

(assert (= (and b!1341759 res!890139) b!1341754))

(assert (= (and b!1341762 condMapEmpty!57511) mapIsEmpty!57511))

(assert (= (and b!1341762 (not condMapEmpty!57511)) mapNonEmpty!57511))

(get-info :version)

(assert (= (and mapNonEmpty!57511 ((_ is ValueCellFull!17703) mapValue!57511)) b!1341751))

(assert (= (and b!1341762 ((_ is ValueCellFull!17703) mapDefault!57511)) b!1341758))

(assert (= start!113152 b!1341762))

(declare-fun b_lambda!24379 () Bool)

(assert (=> (not b_lambda!24379) (not b!1341754)))

(declare-fun t!45622 () Bool)

(declare-fun tb!12217 () Bool)

(assert (=> (and start!113152 (= defaultEntry!1306 defaultEntry!1306) t!45622) tb!12217))

(declare-fun result!25525 () Bool)

(assert (=> tb!12217 (= result!25525 tp_is_empty!37203)))

(assert (=> b!1341754 t!45622))

(declare-fun b_and!50315 () Bool)

(assert (= b_and!50313 (and (=> t!45622 result!25525) b_and!50315)))

(declare-fun m!1229373 () Bool)

(assert (=> b!1341761 m!1229373))

(assert (=> b!1341761 m!1229373))

(declare-fun m!1229375 () Bool)

(assert (=> b!1341761 m!1229375))

(declare-fun m!1229377 () Bool)

(assert (=> b!1341755 m!1229377))

(declare-fun m!1229379 () Bool)

(assert (=> b!1341754 m!1229379))

(declare-fun m!1229381 () Bool)

(assert (=> b!1341754 m!1229381))

(declare-fun m!1229383 () Bool)

(assert (=> b!1341754 m!1229383))

(declare-fun m!1229385 () Bool)

(assert (=> b!1341754 m!1229385))

(declare-fun m!1229387 () Bool)

(assert (=> b!1341754 m!1229387))

(assert (=> b!1341754 m!1229383))

(assert (=> b!1341754 m!1229385))

(assert (=> b!1341754 m!1229377))

(declare-fun m!1229389 () Bool)

(assert (=> b!1341754 m!1229389))

(assert (=> b!1341754 m!1229377))

(declare-fun m!1229391 () Bool)

(assert (=> b!1341754 m!1229391))

(declare-fun m!1229393 () Bool)

(assert (=> b!1341754 m!1229393))

(declare-fun m!1229395 () Bool)

(assert (=> b!1341754 m!1229395))

(declare-fun m!1229397 () Bool)

(assert (=> mapNonEmpty!57511 m!1229397))

(declare-fun m!1229399 () Bool)

(assert (=> b!1341752 m!1229399))

(declare-fun m!1229401 () Bool)

(assert (=> b!1341760 m!1229401))

(assert (=> b!1341753 m!1229377))

(assert (=> b!1341753 m!1229377))

(declare-fun m!1229403 () Bool)

(assert (=> b!1341753 m!1229403))

(declare-fun m!1229405 () Bool)

(assert (=> start!113152 m!1229405))

(declare-fun m!1229407 () Bool)

(assert (=> start!113152 m!1229407))

(declare-fun m!1229409 () Bool)

(assert (=> start!113152 m!1229409))

(check-sat (not b!1341760) tp_is_empty!37203 (not b!1341752) (not start!113152) (not b!1341761) b_and!50315 (not b_next!31203) (not b!1341754) (not mapNonEmpty!57511) (not b_lambda!24379) (not b!1341753))
(check-sat b_and!50315 (not b_next!31203))
