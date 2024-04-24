; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78954 () Bool)

(assert start!78954)

(declare-fun b_free!16999 () Bool)

(declare-fun b_next!16999 () Bool)

(assert (=> start!78954 (= b_free!16999 (not b_next!16999))))

(declare-fun tp!59438 () Bool)

(declare-fun b_and!27745 () Bool)

(assert (=> start!78954 (= tp!59438 b_and!27745)))

(declare-fun mapNonEmpty!31017 () Bool)

(declare-fun mapRes!31017 () Bool)

(declare-fun tp!59439 () Bool)

(declare-fun e!516735 () Bool)

(assert (=> mapNonEmpty!31017 (= mapRes!31017 (and tp!59439 e!516735))))

(declare-fun mapKey!31017 () (_ BitVec 32))

(declare-datatypes ((V!30975 0))(
  ( (V!30976 (val!9804 Int)) )
))
(declare-datatypes ((ValueCell!9272 0))(
  ( (ValueCellFull!9272 (v!12319 V!30975)) (EmptyCell!9272) )
))
(declare-fun mapValue!31017 () ValueCell!9272)

(declare-datatypes ((array!55043 0))(
  ( (array!55044 (arr!26462 (Array (_ BitVec 32) ValueCell!9272)) (size!26922 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55043)

(declare-fun mapRest!31017 () (Array (_ BitVec 32) ValueCell!9272))

(assert (=> mapNonEmpty!31017 (= (arr!26462 _values!1231) (store mapRest!31017 mapKey!31017 mapValue!31017))))

(declare-fun mapIsEmpty!31017 () Bool)

(assert (=> mapIsEmpty!31017 mapRes!31017))

(declare-fun b!920462 () Bool)

(declare-fun res!620400 () Bool)

(declare-fun e!516730 () Bool)

(assert (=> b!920462 (=> (not res!620400) (not e!516730))))

(declare-datatypes ((array!55045 0))(
  ( (array!55046 (arr!26463 (Array (_ BitVec 32) (_ BitVec 64))) (size!26923 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55045)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55045 (_ BitVec 32)) Bool)

(assert (=> b!920462 (= res!620400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920463 () Bool)

(declare-fun res!620395 () Bool)

(declare-fun e!516733 () Bool)

(assert (=> b!920463 (=> (not res!620395) (not e!516733))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30975)

(declare-datatypes ((tuple2!12722 0))(
  ( (tuple2!12723 (_1!6372 (_ BitVec 64)) (_2!6372 V!30975)) )
))
(declare-datatypes ((List!18540 0))(
  ( (Nil!18537) (Cons!18536 (h!19688 tuple2!12722) (t!26261 List!18540)) )
))
(declare-datatypes ((ListLongMap!11421 0))(
  ( (ListLongMap!11422 (toList!5726 List!18540)) )
))
(declare-fun lt!413130 () ListLongMap!11421)

(declare-fun apply!596 (ListLongMap!11421 (_ BitVec 64)) V!30975)

(assert (=> b!920463 (= res!620395 (= (apply!596 lt!413130 k0!1099) v!791))))

(declare-fun b!920464 () Bool)

(declare-fun res!620396 () Bool)

(assert (=> b!920464 (=> (not res!620396) (not e!516733))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!920464 (= res!620396 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!920465 () Bool)

(declare-fun res!620401 () Bool)

(assert (=> b!920465 (=> (not res!620401) (not e!516730))))

(assert (=> b!920465 (= res!620401 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26923 _keys!1487))))))

(declare-fun b!920466 () Bool)

(declare-fun e!516732 () Bool)

(assert (=> b!920466 (= e!516733 e!516732)))

(declare-fun res!620398 () Bool)

(assert (=> b!920466 (=> (not res!620398) (not e!516732))))

(declare-fun lt!413131 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920466 (= res!620398 (validKeyInArray!0 lt!413131))))

(assert (=> b!920466 (= lt!413131 (select (arr!26463 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920467 () Bool)

(declare-fun res!620397 () Bool)

(assert (=> b!920467 (=> (not res!620397) (not e!516730))))

(declare-datatypes ((List!18541 0))(
  ( (Nil!18538) (Cons!18537 (h!19689 (_ BitVec 64)) (t!26262 List!18541)) )
))
(declare-fun arrayNoDuplicates!0 (array!55045 (_ BitVec 32) List!18541) Bool)

(assert (=> b!920467 (= res!620397 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18538))))

(declare-fun b!920468 () Bool)

(declare-fun tp_is_empty!19507 () Bool)

(assert (=> b!920468 (= e!516735 tp_is_empty!19507)))

(declare-fun b!920469 () Bool)

(declare-fun res!620402 () Bool)

(assert (=> b!920469 (=> (not res!620402) (not e!516730))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!920469 (= res!620402 (and (= (size!26922 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26923 _keys!1487) (size!26922 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920470 () Bool)

(declare-fun e!516734 () Bool)

(declare-fun e!516736 () Bool)

(assert (=> b!920470 (= e!516734 (and e!516736 mapRes!31017))))

(declare-fun condMapEmpty!31017 () Bool)

(declare-fun mapDefault!31017 () ValueCell!9272)

(assert (=> b!920470 (= condMapEmpty!31017 (= (arr!26462 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9272)) mapDefault!31017)))))

(declare-fun b!920472 () Bool)

(declare-fun res!620394 () Bool)

(assert (=> b!920472 (=> (not res!620394) (not e!516733))))

(assert (=> b!920472 (= res!620394 (validKeyInArray!0 k0!1099))))

(declare-fun b!920473 () Bool)

(assert (=> b!920473 (= e!516730 e!516733)))

(declare-fun res!620403 () Bool)

(assert (=> b!920473 (=> (not res!620403) (not e!516733))))

(declare-fun contains!4780 (ListLongMap!11421 (_ BitVec 64)) Bool)

(assert (=> b!920473 (= res!620403 (contains!4780 lt!413130 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30975)

(declare-fun minValue!1173 () V!30975)

(declare-fun getCurrentListMap!2980 (array!55045 array!55043 (_ BitVec 32) (_ BitVec 32) V!30975 V!30975 (_ BitVec 32) Int) ListLongMap!11421)

(assert (=> b!920473 (= lt!413130 (getCurrentListMap!2980 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920474 () Bool)

(assert (=> b!920474 (= e!516732 (not true))))

(assert (=> b!920474 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18538)))

(declare-datatypes ((Unit!31040 0))(
  ( (Unit!31041) )
))
(declare-fun lt!413129 () Unit!31040)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55045 (_ BitVec 32) (_ BitVec 32)) Unit!31040)

(assert (=> b!920474 (= lt!413129 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413128 () tuple2!12722)

(declare-fun +!2664 (ListLongMap!11421 tuple2!12722) ListLongMap!11421)

(assert (=> b!920474 (contains!4780 (+!2664 lt!413130 lt!413128) k0!1099)))

(declare-fun lt!413132 () Unit!31040)

(declare-fun lt!413127 () V!30975)

(declare-fun addStillContains!373 (ListLongMap!11421 (_ BitVec 64) V!30975 (_ BitVec 64)) Unit!31040)

(assert (=> b!920474 (= lt!413132 (addStillContains!373 lt!413130 lt!413131 lt!413127 k0!1099))))

(assert (=> b!920474 (= (getCurrentListMap!2980 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2664 (getCurrentListMap!2980 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413128))))

(assert (=> b!920474 (= lt!413128 (tuple2!12723 lt!413131 lt!413127))))

(declare-fun get!13899 (ValueCell!9272 V!30975) V!30975)

(declare-fun dynLambda!1461 (Int (_ BitVec 64)) V!30975)

(assert (=> b!920474 (= lt!413127 (get!13899 (select (arr!26462 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1461 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413126 () Unit!31040)

(declare-fun lemmaListMapRecursiveValidKeyArray!44 (array!55045 array!55043 (_ BitVec 32) (_ BitVec 32) V!30975 V!30975 (_ BitVec 32) Int) Unit!31040)

(assert (=> b!920474 (= lt!413126 (lemmaListMapRecursiveValidKeyArray!44 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920471 () Bool)

(assert (=> b!920471 (= e!516736 tp_is_empty!19507)))

(declare-fun res!620399 () Bool)

(assert (=> start!78954 (=> (not res!620399) (not e!516730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78954 (= res!620399 (validMask!0 mask!1881))))

(assert (=> start!78954 e!516730))

(assert (=> start!78954 true))

(assert (=> start!78954 tp_is_empty!19507))

(declare-fun array_inv!20718 (array!55043) Bool)

(assert (=> start!78954 (and (array_inv!20718 _values!1231) e!516734)))

(assert (=> start!78954 tp!59438))

(declare-fun array_inv!20719 (array!55045) Bool)

(assert (=> start!78954 (array_inv!20719 _keys!1487)))

(assert (= (and start!78954 res!620399) b!920469))

(assert (= (and b!920469 res!620402) b!920462))

(assert (= (and b!920462 res!620400) b!920467))

(assert (= (and b!920467 res!620397) b!920465))

(assert (= (and b!920465 res!620401) b!920473))

(assert (= (and b!920473 res!620403) b!920463))

(assert (= (and b!920463 res!620395) b!920464))

(assert (= (and b!920464 res!620396) b!920472))

(assert (= (and b!920472 res!620394) b!920466))

(assert (= (and b!920466 res!620398) b!920474))

(assert (= (and b!920470 condMapEmpty!31017) mapIsEmpty!31017))

(assert (= (and b!920470 (not condMapEmpty!31017)) mapNonEmpty!31017))

(get-info :version)

(assert (= (and mapNonEmpty!31017 ((_ is ValueCellFull!9272) mapValue!31017)) b!920468))

(assert (= (and b!920470 ((_ is ValueCellFull!9272) mapDefault!31017)) b!920471))

(assert (= start!78954 b!920470))

(declare-fun b_lambda!13515 () Bool)

(assert (=> (not b_lambda!13515) (not b!920474)))

(declare-fun t!26260 () Bool)

(declare-fun tb!5571 () Bool)

(assert (=> (and start!78954 (= defaultEntry!1235 defaultEntry!1235) t!26260) tb!5571))

(declare-fun result!10973 () Bool)

(assert (=> tb!5571 (= result!10973 tp_is_empty!19507)))

(assert (=> b!920474 t!26260))

(declare-fun b_and!27747 () Bool)

(assert (= b_and!27745 (and (=> t!26260 result!10973) b_and!27747)))

(declare-fun m!854653 () Bool)

(assert (=> b!920463 m!854653))

(declare-fun m!854655 () Bool)

(assert (=> b!920472 m!854655))

(declare-fun m!854657 () Bool)

(assert (=> start!78954 m!854657))

(declare-fun m!854659 () Bool)

(assert (=> start!78954 m!854659))

(declare-fun m!854661 () Bool)

(assert (=> start!78954 m!854661))

(declare-fun m!854663 () Bool)

(assert (=> mapNonEmpty!31017 m!854663))

(declare-fun m!854665 () Bool)

(assert (=> b!920462 m!854665))

(declare-fun m!854667 () Bool)

(assert (=> b!920466 m!854667))

(declare-fun m!854669 () Bool)

(assert (=> b!920466 m!854669))

(declare-fun m!854671 () Bool)

(assert (=> b!920474 m!854671))

(declare-fun m!854673 () Bool)

(assert (=> b!920474 m!854673))

(declare-fun m!854675 () Bool)

(assert (=> b!920474 m!854675))

(declare-fun m!854677 () Bool)

(assert (=> b!920474 m!854677))

(declare-fun m!854679 () Bool)

(assert (=> b!920474 m!854679))

(declare-fun m!854681 () Bool)

(assert (=> b!920474 m!854681))

(assert (=> b!920474 m!854677))

(assert (=> b!920474 m!854679))

(declare-fun m!854683 () Bool)

(assert (=> b!920474 m!854683))

(declare-fun m!854685 () Bool)

(assert (=> b!920474 m!854685))

(declare-fun m!854687 () Bool)

(assert (=> b!920474 m!854687))

(declare-fun m!854689 () Bool)

(assert (=> b!920474 m!854689))

(assert (=> b!920474 m!854671))

(declare-fun m!854691 () Bool)

(assert (=> b!920474 m!854691))

(assert (=> b!920474 m!854673))

(declare-fun m!854693 () Bool)

(assert (=> b!920474 m!854693))

(declare-fun m!854695 () Bool)

(assert (=> b!920467 m!854695))

(declare-fun m!854697 () Bool)

(assert (=> b!920473 m!854697))

(declare-fun m!854699 () Bool)

(assert (=> b!920473 m!854699))

(check-sat (not b!920462) b_and!27747 (not mapNonEmpty!31017) tp_is_empty!19507 (not b!920473) (not b_lambda!13515) (not b_next!16999) (not b!920474) (not b!920463) (not b!920467) (not b!920466) (not start!78954) (not b!920472))
(check-sat b_and!27747 (not b_next!16999))
