; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112730 () Bool)

(assert start!112730)

(declare-fun b_free!30901 () Bool)

(declare-fun b_next!30901 () Bool)

(assert (=> start!112730 (= b_free!30901 (not b_next!30901))))

(declare-fun tp!108340 () Bool)

(declare-fun b_and!49805 () Bool)

(assert (=> start!112730 (= tp!108340 b_and!49805)))

(declare-fun b!1335777 () Bool)

(declare-fun e!760874 () Bool)

(declare-fun tp_is_empty!36811 () Bool)

(assert (=> b!1335777 (= e!760874 tp_is_empty!36811)))

(declare-fun b!1335778 () Bool)

(declare-fun res!886189 () Bool)

(declare-fun e!760878 () Bool)

(assert (=> b!1335778 (=> (not res!886189) (not e!760878))))

(declare-datatypes ((array!90595 0))(
  ( (array!90596 (arr!43759 (Array (_ BitVec 32) (_ BitVec 64))) (size!44310 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90595)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90595 (_ BitVec 32)) Bool)

(assert (=> b!1335778 (= res!886189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56890 () Bool)

(declare-fun mapRes!56890 () Bool)

(assert (=> mapIsEmpty!56890 mapRes!56890))

(declare-fun b!1335779 () Bool)

(declare-fun e!760876 () Bool)

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1335779 (= e!760876 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!54185 0))(
  ( (V!54186 (val!18480 Int)) )
))
(declare-datatypes ((tuple2!23850 0))(
  ( (tuple2!23851 (_1!11936 (_ BitVec 64)) (_2!11936 V!54185)) )
))
(declare-datatypes ((List!31003 0))(
  ( (Nil!31000) (Cons!30999 (h!32217 tuple2!23850) (t!45255 List!31003)) )
))
(declare-datatypes ((ListLongMap!21515 0))(
  ( (ListLongMap!21516 (toList!10773 List!31003)) )
))
(declare-fun lt!592820 () ListLongMap!21515)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8949 (ListLongMap!21515 (_ BitVec 64)) Bool)

(assert (=> b!1335779 (contains!8949 lt!592820 k0!1153)))

(declare-fun lt!592821 () V!54185)

(declare-datatypes ((Unit!43826 0))(
  ( (Unit!43827) )
))
(declare-fun lt!592819 () Unit!43826)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!301 ((_ BitVec 64) (_ BitVec 64) V!54185 ListLongMap!21515) Unit!43826)

(assert (=> b!1335779 (= lt!592819 (lemmaInListMapAfterAddingDiffThenInBefore!301 k0!1153 (select (arr!43759 _keys!1590) from!1980) lt!592821 lt!592820))))

(declare-fun b!1335780 () Bool)

(declare-fun res!886199 () Bool)

(assert (=> b!1335780 (=> (not res!886199) (not e!760878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335780 (= res!886199 (validKeyInArray!0 (select (arr!43759 _keys!1590) from!1980)))))

(declare-fun b!1335781 () Bool)

(declare-fun res!886194 () Bool)

(assert (=> b!1335781 (=> (not res!886194) (not e!760878))))

(assert (=> b!1335781 (= res!886194 (not (= (select (arr!43759 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!886190 () Bool)

(assert (=> start!112730 (=> (not res!886190) (not e!760878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112730 (= res!886190 (validMask!0 mask!1998))))

(assert (=> start!112730 e!760878))

(declare-datatypes ((ValueCell!17507 0))(
  ( (ValueCellFull!17507 (v!21112 V!54185)) (EmptyCell!17507) )
))
(declare-datatypes ((array!90597 0))(
  ( (array!90598 (arr!43760 (Array (_ BitVec 32) ValueCell!17507)) (size!44311 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90597)

(declare-fun e!760877 () Bool)

(declare-fun array_inv!33269 (array!90597) Bool)

(assert (=> start!112730 (and (array_inv!33269 _values!1320) e!760877)))

(assert (=> start!112730 true))

(declare-fun array_inv!33270 (array!90595) Bool)

(assert (=> start!112730 (array_inv!33270 _keys!1590)))

(assert (=> start!112730 tp!108340))

(assert (=> start!112730 tp_is_empty!36811))

(declare-fun b!1335782 () Bool)

(declare-fun e!760879 () Bool)

(assert (=> b!1335782 (= e!760879 tp_is_empty!36811)))

(declare-fun b!1335783 () Bool)

(declare-fun res!886191 () Bool)

(assert (=> b!1335783 (=> (not res!886191) (not e!760878))))

(declare-datatypes ((List!31004 0))(
  ( (Nil!31001) (Cons!31000 (h!32218 (_ BitVec 64)) (t!45256 List!31004)) )
))
(declare-fun arrayNoDuplicates!0 (array!90595 (_ BitVec 32) List!31004) Bool)

(assert (=> b!1335783 (= res!886191 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31001))))

(declare-fun b!1335784 () Bool)

(declare-fun res!886195 () Bool)

(assert (=> b!1335784 (=> (not res!886195) (not e!760878))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1335784 (= res!886195 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44310 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56890 () Bool)

(declare-fun tp!108339 () Bool)

(assert (=> mapNonEmpty!56890 (= mapRes!56890 (and tp!108339 e!760879))))

(declare-fun mapKey!56890 () (_ BitVec 32))

(declare-fun mapRest!56890 () (Array (_ BitVec 32) ValueCell!17507))

(declare-fun mapValue!56890 () ValueCell!17507)

(assert (=> mapNonEmpty!56890 (= (arr!43760 _values!1320) (store mapRest!56890 mapKey!56890 mapValue!56890))))

(declare-fun b!1335785 () Bool)

(declare-fun res!886196 () Bool)

(assert (=> b!1335785 (=> (not res!886196) (not e!760876))))

(assert (=> b!1335785 (= res!886196 (not (= k0!1153 (select (arr!43759 _keys!1590) from!1980))))))

(declare-fun b!1335786 () Bool)

(declare-fun res!886198 () Bool)

(assert (=> b!1335786 (=> (not res!886198) (not e!760878))))

(assert (=> b!1335786 (= res!886198 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1335787 () Bool)

(assert (=> b!1335787 (= e!760877 (and e!760874 mapRes!56890))))

(declare-fun condMapEmpty!56890 () Bool)

(declare-fun mapDefault!56890 () ValueCell!17507)

(assert (=> b!1335787 (= condMapEmpty!56890 (= (arr!43760 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17507)) mapDefault!56890)))))

(declare-fun b!1335788 () Bool)

(declare-fun res!886197 () Bool)

(assert (=> b!1335788 (=> (not res!886197) (not e!760878))))

(assert (=> b!1335788 (= res!886197 (and (= (size!44311 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44310 _keys!1590) (size!44311 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335789 () Bool)

(declare-fun res!886192 () Bool)

(assert (=> b!1335789 (=> (not res!886192) (not e!760878))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54185)

(declare-fun zeroValue!1262 () V!54185)

(declare-fun getCurrentListMap!5733 (array!90595 array!90597 (_ BitVec 32) (_ BitVec 32) V!54185 V!54185 (_ BitVec 32) Int) ListLongMap!21515)

(assert (=> b!1335789 (= res!886192 (contains!8949 (getCurrentListMap!5733 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335790 () Bool)

(assert (=> b!1335790 (= e!760878 e!760876)))

(declare-fun res!886193 () Bool)

(assert (=> b!1335790 (=> (not res!886193) (not e!760876))))

(declare-fun +!4760 (ListLongMap!21515 tuple2!23850) ListLongMap!21515)

(assert (=> b!1335790 (= res!886193 (contains!8949 (+!4760 lt!592820 (tuple2!23851 (select (arr!43759 _keys!1590) from!1980) lt!592821)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6404 (array!90595 array!90597 (_ BitVec 32) (_ BitVec 32) V!54185 V!54185 (_ BitVec 32) Int) ListLongMap!21515)

(assert (=> b!1335790 (= lt!592820 (getCurrentListMapNoExtraKeys!6404 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22093 (ValueCell!17507 V!54185) V!54185)

(declare-fun dynLambda!3714 (Int (_ BitVec 64)) V!54185)

(assert (=> b!1335790 (= lt!592821 (get!22093 (select (arr!43760 _values!1320) from!1980) (dynLambda!3714 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!112730 res!886190) b!1335788))

(assert (= (and b!1335788 res!886197) b!1335778))

(assert (= (and b!1335778 res!886189) b!1335783))

(assert (= (and b!1335783 res!886191) b!1335784))

(assert (= (and b!1335784 res!886195) b!1335789))

(assert (= (and b!1335789 res!886192) b!1335781))

(assert (= (and b!1335781 res!886194) b!1335780))

(assert (= (and b!1335780 res!886199) b!1335786))

(assert (= (and b!1335786 res!886198) b!1335790))

(assert (= (and b!1335790 res!886193) b!1335785))

(assert (= (and b!1335785 res!886196) b!1335779))

(assert (= (and b!1335787 condMapEmpty!56890) mapIsEmpty!56890))

(assert (= (and b!1335787 (not condMapEmpty!56890)) mapNonEmpty!56890))

(get-info :version)

(assert (= (and mapNonEmpty!56890 ((_ is ValueCellFull!17507) mapValue!56890)) b!1335782))

(assert (= (and b!1335787 ((_ is ValueCellFull!17507) mapDefault!56890)) b!1335777))

(assert (= start!112730 b!1335787))

(declare-fun b_lambda!24101 () Bool)

(assert (=> (not b_lambda!24101) (not b!1335790)))

(declare-fun t!45254 () Bool)

(declare-fun tb!12055 () Bool)

(assert (=> (and start!112730 (= defaultEntry!1323 defaultEntry!1323) t!45254) tb!12055))

(declare-fun result!25189 () Bool)

(assert (=> tb!12055 (= result!25189 tp_is_empty!36811)))

(assert (=> b!1335790 t!45254))

(declare-fun b_and!49807 () Bool)

(assert (= b_and!49805 (and (=> t!45254 result!25189) b_and!49807)))

(declare-fun m!1224437 () Bool)

(assert (=> start!112730 m!1224437))

(declare-fun m!1224439 () Bool)

(assert (=> start!112730 m!1224439))

(declare-fun m!1224441 () Bool)

(assert (=> start!112730 m!1224441))

(declare-fun m!1224443 () Bool)

(assert (=> mapNonEmpty!56890 m!1224443))

(declare-fun m!1224445 () Bool)

(assert (=> b!1335781 m!1224445))

(declare-fun m!1224447 () Bool)

(assert (=> b!1335779 m!1224447))

(assert (=> b!1335779 m!1224445))

(assert (=> b!1335779 m!1224445))

(declare-fun m!1224449 () Bool)

(assert (=> b!1335779 m!1224449))

(declare-fun m!1224451 () Bool)

(assert (=> b!1335778 m!1224451))

(declare-fun m!1224453 () Bool)

(assert (=> b!1335790 m!1224453))

(declare-fun m!1224455 () Bool)

(assert (=> b!1335790 m!1224455))

(assert (=> b!1335790 m!1224453))

(declare-fun m!1224457 () Bool)

(assert (=> b!1335790 m!1224457))

(declare-fun m!1224459 () Bool)

(assert (=> b!1335790 m!1224459))

(declare-fun m!1224461 () Bool)

(assert (=> b!1335790 m!1224461))

(declare-fun m!1224463 () Bool)

(assert (=> b!1335790 m!1224463))

(assert (=> b!1335790 m!1224455))

(assert (=> b!1335790 m!1224459))

(assert (=> b!1335790 m!1224445))

(assert (=> b!1335780 m!1224445))

(assert (=> b!1335780 m!1224445))

(declare-fun m!1224465 () Bool)

(assert (=> b!1335780 m!1224465))

(declare-fun m!1224467 () Bool)

(assert (=> b!1335789 m!1224467))

(assert (=> b!1335789 m!1224467))

(declare-fun m!1224469 () Bool)

(assert (=> b!1335789 m!1224469))

(declare-fun m!1224471 () Bool)

(assert (=> b!1335783 m!1224471))

(assert (=> b!1335785 m!1224445))

(check-sat (not b!1335778) (not b_lambda!24101) (not mapNonEmpty!56890) b_and!49807 tp_is_empty!36811 (not b!1335789) (not b!1335790) (not b_next!30901) (not b!1335783) (not b!1335780) (not b!1335779) (not start!112730))
(check-sat b_and!49807 (not b_next!30901))
