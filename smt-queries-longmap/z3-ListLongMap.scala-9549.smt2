; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113158 () Bool)

(assert start!113158)

(declare-fun b_free!31209 () Bool)

(declare-fun b_next!31209 () Bool)

(assert (=> start!113158 (= b_free!31209 (not b_next!31209))))

(declare-fun tp!109431 () Bool)

(declare-fun b_and!50325 () Bool)

(assert (=> start!113158 (= tp!109431 b_and!50325)))

(declare-fun b!1341865 () Bool)

(declare-fun res!890226 () Bool)

(declare-fun e!764046 () Bool)

(assert (=> b!1341865 (=> (not res!890226) (not e!764046))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91270 0))(
  ( (array!91271 (arr!44091 (Array (_ BitVec 32) (_ BitVec 64))) (size!44641 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91270)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54715 0))(
  ( (V!54716 (val!18679 Int)) )
))
(declare-datatypes ((ValueCell!17706 0))(
  ( (ValueCellFull!17706 (v!21327 V!54715)) (EmptyCell!17706) )
))
(declare-datatypes ((array!91272 0))(
  ( (array!91273 (arr!44092 (Array (_ BitVec 32) ValueCell!17706)) (size!44642 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91272)

(assert (=> b!1341865 (= res!890226 (and (= (size!44642 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44641 _keys!1571) (size!44642 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341866 () Bool)

(declare-fun res!890224 () Bool)

(assert (=> b!1341866 (=> (not res!890224) (not e!764046))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341866 (= res!890224 (not (= (select (arr!44091 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341867 () Bool)

(declare-fun res!890219 () Bool)

(assert (=> b!1341867 (=> (not res!890219) (not e!764046))))

(declare-fun minValue!1245 () V!54715)

(declare-fun zeroValue!1245 () V!54715)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24056 0))(
  ( (tuple2!24057 (_1!12039 (_ BitVec 64)) (_2!12039 V!54715)) )
))
(declare-datatypes ((List!31213 0))(
  ( (Nil!31210) (Cons!31209 (h!32418 tuple2!24056) (t!45633 List!31213)) )
))
(declare-datatypes ((ListLongMap!21713 0))(
  ( (ListLongMap!21714 (toList!10872 List!31213)) )
))
(declare-fun contains!9048 (ListLongMap!21713 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5836 (array!91270 array!91272 (_ BitVec 32) (_ BitVec 32) V!54715 V!54715 (_ BitVec 32) Int) ListLongMap!21713)

(assert (=> b!1341867 (= res!890219 (contains!9048 (getCurrentListMap!5836 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341868 () Bool)

(declare-fun res!890220 () Bool)

(assert (=> b!1341868 (=> (not res!890220) (not e!764046))))

(assert (=> b!1341868 (= res!890220 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57520 () Bool)

(declare-fun mapRes!57520 () Bool)

(declare-fun tp!109432 () Bool)

(declare-fun e!764047 () Bool)

(assert (=> mapNonEmpty!57520 (= mapRes!57520 (and tp!109432 e!764047))))

(declare-fun mapValue!57520 () ValueCell!17706)

(declare-fun mapKey!57520 () (_ BitVec 32))

(declare-fun mapRest!57520 () (Array (_ BitVec 32) ValueCell!17706))

(assert (=> mapNonEmpty!57520 (= (arr!44092 _values!1303) (store mapRest!57520 mapKey!57520 mapValue!57520))))

(declare-fun b!1341869 () Bool)

(declare-fun e!764045 () Bool)

(declare-fun e!764044 () Bool)

(assert (=> b!1341869 (= e!764045 (and e!764044 mapRes!57520))))

(declare-fun condMapEmpty!57520 () Bool)

(declare-fun mapDefault!57520 () ValueCell!17706)

(assert (=> b!1341869 (= condMapEmpty!57520 (= (arr!44092 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17706)) mapDefault!57520)))))

(declare-fun b!1341870 () Bool)

(declare-fun res!890222 () Bool)

(assert (=> b!1341870 (=> (not res!890222) (not e!764046))))

(assert (=> b!1341870 (= res!890222 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44641 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341871 () Bool)

(declare-fun res!890225 () Bool)

(assert (=> b!1341871 (=> (not res!890225) (not e!764046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341871 (= res!890225 (validKeyInArray!0 (select (arr!44091 _keys!1571) from!1960)))))

(declare-fun b!1341872 () Bool)

(declare-fun tp_is_empty!37209 () Bool)

(assert (=> b!1341872 (= e!764047 tp_is_empty!37209)))

(declare-fun b!1341873 () Bool)

(declare-fun res!890223 () Bool)

(assert (=> b!1341873 (=> (not res!890223) (not e!764046))))

(declare-datatypes ((List!31214 0))(
  ( (Nil!31211) (Cons!31210 (h!32419 (_ BitVec 64)) (t!45634 List!31214)) )
))
(declare-fun arrayNoDuplicates!0 (array!91270 (_ BitVec 32) List!31214) Bool)

(assert (=> b!1341873 (= res!890223 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31211))))

(declare-fun b!1341874 () Bool)

(declare-fun res!890221 () Bool)

(assert (=> b!1341874 (=> (not res!890221) (not e!764046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91270 (_ BitVec 32)) Bool)

(assert (=> b!1341874 (= res!890221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341875 () Bool)

(assert (=> b!1341875 (= e!764046 (not true))))

(declare-fun lt!594254 () ListLongMap!21713)

(assert (=> b!1341875 (contains!9048 lt!594254 k0!1142)))

(declare-fun lt!594256 () V!54715)

(declare-datatypes ((Unit!44045 0))(
  ( (Unit!44046) )
))
(declare-fun lt!594257 () Unit!44045)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!353 ((_ BitVec 64) (_ BitVec 64) V!54715 ListLongMap!21713) Unit!44045)

(assert (=> b!1341875 (= lt!594257 (lemmaInListMapAfterAddingDiffThenInBefore!353 k0!1142 (select (arr!44091 _keys!1571) from!1960) lt!594256 lt!594254))))

(declare-fun lt!594255 () ListLongMap!21713)

(assert (=> b!1341875 (contains!9048 lt!594255 k0!1142)))

(declare-fun lt!594258 () Unit!44045)

(assert (=> b!1341875 (= lt!594258 (lemmaInListMapAfterAddingDiffThenInBefore!353 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594255))))

(declare-fun +!4784 (ListLongMap!21713 tuple2!24056) ListLongMap!21713)

(assert (=> b!1341875 (= lt!594255 (+!4784 lt!594254 (tuple2!24057 (select (arr!44091 _keys!1571) from!1960) lt!594256)))))

(declare-fun get!22259 (ValueCell!17706 V!54715) V!54715)

(declare-fun dynLambda!3723 (Int (_ BitVec 64)) V!54715)

(assert (=> b!1341875 (= lt!594256 (get!22259 (select (arr!44092 _values!1303) from!1960) (dynLambda!3723 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6426 (array!91270 array!91272 (_ BitVec 32) (_ BitVec 32) V!54715 V!54715 (_ BitVec 32) Int) ListLongMap!21713)

(assert (=> b!1341875 (= lt!594254 (getCurrentListMapNoExtraKeys!6426 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1341876 () Bool)

(assert (=> b!1341876 (= e!764044 tp_is_empty!37209)))

(declare-fun mapIsEmpty!57520 () Bool)

(assert (=> mapIsEmpty!57520 mapRes!57520))

(declare-fun res!890218 () Bool)

(assert (=> start!113158 (=> (not res!890218) (not e!764046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113158 (= res!890218 (validMask!0 mask!1977))))

(assert (=> start!113158 e!764046))

(assert (=> start!113158 tp_is_empty!37209))

(assert (=> start!113158 true))

(declare-fun array_inv!33235 (array!91270) Bool)

(assert (=> start!113158 (array_inv!33235 _keys!1571)))

(declare-fun array_inv!33236 (array!91272) Bool)

(assert (=> start!113158 (and (array_inv!33236 _values!1303) e!764045)))

(assert (=> start!113158 tp!109431))

(assert (= (and start!113158 res!890218) b!1341865))

(assert (= (and b!1341865 res!890226) b!1341874))

(assert (= (and b!1341874 res!890221) b!1341873))

(assert (= (and b!1341873 res!890223) b!1341870))

(assert (= (and b!1341870 res!890222) b!1341867))

(assert (= (and b!1341867 res!890219) b!1341866))

(assert (= (and b!1341866 res!890224) b!1341871))

(assert (= (and b!1341871 res!890225) b!1341868))

(assert (= (and b!1341868 res!890220) b!1341875))

(assert (= (and b!1341869 condMapEmpty!57520) mapIsEmpty!57520))

(assert (= (and b!1341869 (not condMapEmpty!57520)) mapNonEmpty!57520))

(get-info :version)

(assert (= (and mapNonEmpty!57520 ((_ is ValueCellFull!17706) mapValue!57520)) b!1341872))

(assert (= (and b!1341869 ((_ is ValueCellFull!17706) mapDefault!57520)) b!1341876))

(assert (= start!113158 b!1341869))

(declare-fun b_lambda!24385 () Bool)

(assert (=> (not b_lambda!24385) (not b!1341875)))

(declare-fun t!45632 () Bool)

(declare-fun tb!12223 () Bool)

(assert (=> (and start!113158 (= defaultEntry!1306 defaultEntry!1306) t!45632) tb!12223))

(declare-fun result!25537 () Bool)

(assert (=> tb!12223 (= result!25537 tp_is_empty!37209)))

(assert (=> b!1341875 t!45632))

(declare-fun b_and!50327 () Bool)

(assert (= b_and!50325 (and (=> t!45632 result!25537) b_and!50327)))

(declare-fun m!1229487 () Bool)

(assert (=> b!1341871 m!1229487))

(assert (=> b!1341871 m!1229487))

(declare-fun m!1229489 () Bool)

(assert (=> b!1341871 m!1229489))

(declare-fun m!1229491 () Bool)

(assert (=> b!1341867 m!1229491))

(assert (=> b!1341867 m!1229491))

(declare-fun m!1229493 () Bool)

(assert (=> b!1341867 m!1229493))

(declare-fun m!1229495 () Bool)

(assert (=> start!113158 m!1229495))

(declare-fun m!1229497 () Bool)

(assert (=> start!113158 m!1229497))

(declare-fun m!1229499 () Bool)

(assert (=> start!113158 m!1229499))

(declare-fun m!1229501 () Bool)

(assert (=> b!1341873 m!1229501))

(assert (=> b!1341866 m!1229487))

(declare-fun m!1229503 () Bool)

(assert (=> b!1341874 m!1229503))

(assert (=> b!1341875 m!1229487))

(declare-fun m!1229505 () Bool)

(assert (=> b!1341875 m!1229505))

(declare-fun m!1229507 () Bool)

(assert (=> b!1341875 m!1229507))

(declare-fun m!1229509 () Bool)

(assert (=> b!1341875 m!1229509))

(declare-fun m!1229511 () Bool)

(assert (=> b!1341875 m!1229511))

(declare-fun m!1229513 () Bool)

(assert (=> b!1341875 m!1229513))

(declare-fun m!1229515 () Bool)

(assert (=> b!1341875 m!1229515))

(assert (=> b!1341875 m!1229511))

(declare-fun m!1229517 () Bool)

(assert (=> b!1341875 m!1229517))

(declare-fun m!1229519 () Bool)

(assert (=> b!1341875 m!1229519))

(assert (=> b!1341875 m!1229487))

(assert (=> b!1341875 m!1229513))

(declare-fun m!1229521 () Bool)

(assert (=> b!1341875 m!1229521))

(declare-fun m!1229523 () Bool)

(assert (=> mapNonEmpty!57520 m!1229523))

(check-sat (not b!1341871) (not mapNonEmpty!57520) (not b!1341874) tp_is_empty!37209 (not b!1341873) (not b_next!31209) (not b!1341867) (not start!113158) (not b!1341875) b_and!50327 (not b_lambda!24385))
(check-sat b_and!50327 (not b_next!31209))
