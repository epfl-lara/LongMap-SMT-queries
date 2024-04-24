; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112724 () Bool)

(assert start!112724)

(declare-fun b_free!30895 () Bool)

(declare-fun b_next!30895 () Bool)

(assert (=> start!112724 (= b_free!30895 (not b_next!30895))))

(declare-fun tp!108322 () Bool)

(declare-fun b_and!49793 () Bool)

(assert (=> start!112724 (= tp!108322 b_and!49793)))

(declare-fun b!1335645 () Bool)

(declare-fun res!886098 () Bool)

(declare-fun e!760824 () Bool)

(assert (=> b!1335645 (=> (not res!886098) (not e!760824))))

(declare-datatypes ((array!90583 0))(
  ( (array!90584 (arr!43753 (Array (_ BitVec 32) (_ BitVec 64))) (size!44304 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90583)

(declare-datatypes ((List!30999 0))(
  ( (Nil!30996) (Cons!30995 (h!32213 (_ BitVec 64)) (t!45245 List!30999)) )
))
(declare-fun arrayNoDuplicates!0 (array!90583 (_ BitVec 32) List!30999) Bool)

(assert (=> b!1335645 (= res!886098 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30996))))

(declare-fun b!1335646 () Bool)

(declare-fun res!886097 () Bool)

(assert (=> b!1335646 (=> (not res!886097) (not e!760824))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335646 (= res!886097 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44304 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335647 () Bool)

(declare-fun res!886091 () Bool)

(assert (=> b!1335647 (=> (not res!886091) (not e!760824))))

(declare-datatypes ((V!54177 0))(
  ( (V!54178 (val!18477 Int)) )
))
(declare-datatypes ((ValueCell!17504 0))(
  ( (ValueCellFull!17504 (v!21109 V!54177)) (EmptyCell!17504) )
))
(declare-datatypes ((array!90585 0))(
  ( (array!90586 (arr!43754 (Array (_ BitVec 32) ValueCell!17504)) (size!44305 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90585)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1335647 (= res!886091 (and (= (size!44305 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44304 _keys!1590) (size!44305 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335648 () Bool)

(declare-fun e!760821 () Bool)

(assert (=> b!1335648 (= e!760821 (not true))))

(declare-datatypes ((tuple2!23848 0))(
  ( (tuple2!23849 (_1!11935 (_ BitVec 64)) (_2!11935 V!54177)) )
))
(declare-datatypes ((List!31000 0))(
  ( (Nil!30997) (Cons!30996 (h!32214 tuple2!23848) (t!45246 List!31000)) )
))
(declare-datatypes ((ListLongMap!21513 0))(
  ( (ListLongMap!21514 (toList!10772 List!31000)) )
))
(declare-fun lt!592794 () ListLongMap!21513)

(declare-fun contains!8948 (ListLongMap!21513 (_ BitVec 64)) Bool)

(assert (=> b!1335648 (contains!8948 lt!592794 k0!1153)))

(declare-datatypes ((Unit!43824 0))(
  ( (Unit!43825) )
))
(declare-fun lt!592792 () Unit!43824)

(declare-fun lt!592793 () V!54177)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!300 ((_ BitVec 64) (_ BitVec 64) V!54177 ListLongMap!21513) Unit!43824)

(assert (=> b!1335648 (= lt!592792 (lemmaInListMapAfterAddingDiffThenInBefore!300 k0!1153 (select (arr!43753 _keys!1590) from!1980) lt!592793 lt!592794))))

(declare-fun b!1335649 () Bool)

(declare-fun res!886094 () Bool)

(assert (=> b!1335649 (=> (not res!886094) (not e!760824))))

(assert (=> b!1335649 (= res!886094 (not (= (select (arr!43753 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335650 () Bool)

(assert (=> b!1335650 (= e!760824 e!760821)))

(declare-fun res!886090 () Bool)

(assert (=> b!1335650 (=> (not res!886090) (not e!760821))))

(declare-fun +!4759 (ListLongMap!21513 tuple2!23848) ListLongMap!21513)

(assert (=> b!1335650 (= res!886090 (contains!8948 (+!4759 lt!592794 (tuple2!23849 (select (arr!43753 _keys!1590) from!1980) lt!592793)) k0!1153))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54177)

(declare-fun zeroValue!1262 () V!54177)

(declare-fun getCurrentListMapNoExtraKeys!6403 (array!90583 array!90585 (_ BitVec 32) (_ BitVec 32) V!54177 V!54177 (_ BitVec 32) Int) ListLongMap!21513)

(assert (=> b!1335650 (= lt!592794 (getCurrentListMapNoExtraKeys!6403 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22090 (ValueCell!17504 V!54177) V!54177)

(declare-fun dynLambda!3713 (Int (_ BitVec 64)) V!54177)

(assert (=> b!1335650 (= lt!592793 (get!22090 (select (arr!43754 _values!1320) from!1980) (dynLambda!3713 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335651 () Bool)

(declare-fun e!760822 () Bool)

(declare-fun e!760823 () Bool)

(declare-fun mapRes!56881 () Bool)

(assert (=> b!1335651 (= e!760822 (and e!760823 mapRes!56881))))

(declare-fun condMapEmpty!56881 () Bool)

(declare-fun mapDefault!56881 () ValueCell!17504)

(assert (=> b!1335651 (= condMapEmpty!56881 (= (arr!43754 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17504)) mapDefault!56881)))))

(declare-fun mapNonEmpty!56881 () Bool)

(declare-fun tp!108321 () Bool)

(declare-fun e!760820 () Bool)

(assert (=> mapNonEmpty!56881 (= mapRes!56881 (and tp!108321 e!760820))))

(declare-fun mapRest!56881 () (Array (_ BitVec 32) ValueCell!17504))

(declare-fun mapValue!56881 () ValueCell!17504)

(declare-fun mapKey!56881 () (_ BitVec 32))

(assert (=> mapNonEmpty!56881 (= (arr!43754 _values!1320) (store mapRest!56881 mapKey!56881 mapValue!56881))))

(declare-fun b!1335652 () Bool)

(declare-fun res!886093 () Bool)

(assert (=> b!1335652 (=> (not res!886093) (not e!760824))))

(declare-fun getCurrentListMap!5732 (array!90583 array!90585 (_ BitVec 32) (_ BitVec 32) V!54177 V!54177 (_ BitVec 32) Int) ListLongMap!21513)

(assert (=> b!1335652 (= res!886093 (contains!8948 (getCurrentListMap!5732 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335653 () Bool)

(declare-fun res!886100 () Bool)

(assert (=> b!1335653 (=> (not res!886100) (not e!760824))))

(assert (=> b!1335653 (= res!886100 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun res!886099 () Bool)

(assert (=> start!112724 (=> (not res!886099) (not e!760824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112724 (= res!886099 (validMask!0 mask!1998))))

(assert (=> start!112724 e!760824))

(declare-fun array_inv!33267 (array!90585) Bool)

(assert (=> start!112724 (and (array_inv!33267 _values!1320) e!760822)))

(assert (=> start!112724 true))

(declare-fun array_inv!33268 (array!90583) Bool)

(assert (=> start!112724 (array_inv!33268 _keys!1590)))

(assert (=> start!112724 tp!108322))

(declare-fun tp_is_empty!36805 () Bool)

(assert (=> start!112724 tp_is_empty!36805))

(declare-fun b!1335654 () Bool)

(assert (=> b!1335654 (= e!760820 tp_is_empty!36805)))

(declare-fun b!1335655 () Bool)

(declare-fun res!886095 () Bool)

(assert (=> b!1335655 (=> (not res!886095) (not e!760824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90583 (_ BitVec 32)) Bool)

(assert (=> b!1335655 (= res!886095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335656 () Bool)

(declare-fun res!886096 () Bool)

(assert (=> b!1335656 (=> (not res!886096) (not e!760824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335656 (= res!886096 (validKeyInArray!0 (select (arr!43753 _keys!1590) from!1980)))))

(declare-fun b!1335657 () Bool)

(assert (=> b!1335657 (= e!760823 tp_is_empty!36805)))

(declare-fun b!1335658 () Bool)

(declare-fun res!886092 () Bool)

(assert (=> b!1335658 (=> (not res!886092) (not e!760821))))

(assert (=> b!1335658 (= res!886092 (not (= k0!1153 (select (arr!43753 _keys!1590) from!1980))))))

(declare-fun mapIsEmpty!56881 () Bool)

(assert (=> mapIsEmpty!56881 mapRes!56881))

(assert (= (and start!112724 res!886099) b!1335647))

(assert (= (and b!1335647 res!886091) b!1335655))

(assert (= (and b!1335655 res!886095) b!1335645))

(assert (= (and b!1335645 res!886098) b!1335646))

(assert (= (and b!1335646 res!886097) b!1335652))

(assert (= (and b!1335652 res!886093) b!1335649))

(assert (= (and b!1335649 res!886094) b!1335656))

(assert (= (and b!1335656 res!886096) b!1335653))

(assert (= (and b!1335653 res!886100) b!1335650))

(assert (= (and b!1335650 res!886090) b!1335658))

(assert (= (and b!1335658 res!886092) b!1335648))

(assert (= (and b!1335651 condMapEmpty!56881) mapIsEmpty!56881))

(assert (= (and b!1335651 (not condMapEmpty!56881)) mapNonEmpty!56881))

(get-info :version)

(assert (= (and mapNonEmpty!56881 ((_ is ValueCellFull!17504) mapValue!56881)) b!1335654))

(assert (= (and b!1335651 ((_ is ValueCellFull!17504) mapDefault!56881)) b!1335657))

(assert (= start!112724 b!1335651))

(declare-fun b_lambda!24095 () Bool)

(assert (=> (not b_lambda!24095) (not b!1335650)))

(declare-fun t!45244 () Bool)

(declare-fun tb!12049 () Bool)

(assert (=> (and start!112724 (= defaultEntry!1323 defaultEntry!1323) t!45244) tb!12049))

(declare-fun result!25177 () Bool)

(assert (=> tb!12049 (= result!25177 tp_is_empty!36805)))

(assert (=> b!1335650 t!45244))

(declare-fun b_and!49795 () Bool)

(assert (= b_and!49793 (and (=> t!45244 result!25177) b_and!49795)))

(declare-fun m!1224329 () Bool)

(assert (=> b!1335645 m!1224329))

(declare-fun m!1224331 () Bool)

(assert (=> b!1335656 m!1224331))

(assert (=> b!1335656 m!1224331))

(declare-fun m!1224333 () Bool)

(assert (=> b!1335656 m!1224333))

(declare-fun m!1224335 () Bool)

(assert (=> b!1335648 m!1224335))

(assert (=> b!1335648 m!1224331))

(assert (=> b!1335648 m!1224331))

(declare-fun m!1224337 () Bool)

(assert (=> b!1335648 m!1224337))

(assert (=> b!1335649 m!1224331))

(assert (=> b!1335658 m!1224331))

(declare-fun m!1224339 () Bool)

(assert (=> b!1335650 m!1224339))

(declare-fun m!1224341 () Bool)

(assert (=> b!1335650 m!1224341))

(assert (=> b!1335650 m!1224339))

(declare-fun m!1224343 () Bool)

(assert (=> b!1335650 m!1224343))

(declare-fun m!1224345 () Bool)

(assert (=> b!1335650 m!1224345))

(declare-fun m!1224347 () Bool)

(assert (=> b!1335650 m!1224347))

(assert (=> b!1335650 m!1224341))

(assert (=> b!1335650 m!1224345))

(declare-fun m!1224349 () Bool)

(assert (=> b!1335650 m!1224349))

(assert (=> b!1335650 m!1224331))

(declare-fun m!1224351 () Bool)

(assert (=> b!1335655 m!1224351))

(declare-fun m!1224353 () Bool)

(assert (=> b!1335652 m!1224353))

(assert (=> b!1335652 m!1224353))

(declare-fun m!1224355 () Bool)

(assert (=> b!1335652 m!1224355))

(declare-fun m!1224357 () Bool)

(assert (=> start!112724 m!1224357))

(declare-fun m!1224359 () Bool)

(assert (=> start!112724 m!1224359))

(declare-fun m!1224361 () Bool)

(assert (=> start!112724 m!1224361))

(declare-fun m!1224363 () Bool)

(assert (=> mapNonEmpty!56881 m!1224363))

(check-sat (not b!1335652) (not mapNonEmpty!56881) (not b_next!30895) tp_is_empty!36805 (not b!1335648) (not b!1335656) (not b!1335650) (not start!112724) (not b!1335655) (not b_lambda!24095) (not b!1335645) b_and!49795)
(check-sat b_and!49795 (not b_next!30895))
