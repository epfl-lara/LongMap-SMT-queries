; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74904 () Bool)

(assert start!74904)

(declare-fun b_free!15423 () Bool)

(declare-fun b_next!15423 () Bool)

(assert (=> start!74904 (= b_free!15423 (not b_next!15423))))

(declare-fun tp!53972 () Bool)

(declare-fun b_and!25545 () Bool)

(assert (=> start!74904 (= tp!53972 b_and!25545)))

(declare-fun b!883136 () Bool)

(declare-fun e!491512 () Bool)

(declare-fun tp_is_empty!17667 () Bool)

(assert (=> b!883136 (= e!491512 tp_is_empty!17667)))

(declare-fun b!883137 () Bool)

(declare-fun e!491508 () Bool)

(assert (=> b!883137 (= e!491508 true)))

(assert (=> b!883137 false))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51460 0))(
  ( (array!51461 (arr!24749 (Array (_ BitVec 32) (_ BitVec 64))) (size!25189 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51460)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((Unit!30118 0))(
  ( (Unit!30119) )
))
(declare-fun lt!399634 () Unit!30118)

(declare-datatypes ((List!17573 0))(
  ( (Nil!17570) (Cons!17569 (h!18700 (_ BitVec 64)) (t!24798 List!17573)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51460 (_ BitVec 64) (_ BitVec 32) List!17573) Unit!30118)

(assert (=> b!883137 (= lt!399634 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17570))))

(declare-fun arrayContainsKey!0 (array!51460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883137 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!399640 () Unit!30118)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30118)

(assert (=> b!883137 (= lt!399640 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!51460 (_ BitVec 32) List!17573) Bool)

(assert (=> b!883137 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17570)))

(declare-fun lt!399632 () Unit!30118)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51460 (_ BitVec 32) (_ BitVec 32)) Unit!30118)

(assert (=> b!883137 (= lt!399632 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!883138 () Bool)

(declare-fun res!599996 () Bool)

(declare-fun e!491510 () Bool)

(assert (=> b!883138 (=> (not res!599996) (not e!491510))))

(assert (=> b!883138 (= res!599996 (and (= (select (arr!24749 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883139 () Bool)

(declare-fun e!491514 () Bool)

(assert (=> b!883139 (= e!491514 e!491508)))

(declare-fun res!599998 () Bool)

(assert (=> b!883139 (=> res!599998 e!491508)))

(assert (=> b!883139 (= res!599998 (not (= (select (arr!24749 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((V!28603 0))(
  ( (V!28604 (val!8881 Int)) )
))
(declare-datatypes ((tuple2!11764 0))(
  ( (tuple2!11765 (_1!5893 (_ BitVec 64)) (_2!5893 V!28603)) )
))
(declare-datatypes ((List!17574 0))(
  ( (Nil!17571) (Cons!17570 (h!18701 tuple2!11764) (t!24799 List!17574)) )
))
(declare-datatypes ((ListLongMap!10533 0))(
  ( (ListLongMap!10534 (toList!5282 List!17574)) )
))
(declare-fun lt!399636 () ListLongMap!10533)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!399641 () ListLongMap!10533)

(declare-datatypes ((ValueCell!8394 0))(
  ( (ValueCellFull!8394 (v!11350 V!28603)) (EmptyCell!8394) )
))
(declare-datatypes ((array!51462 0))(
  ( (array!51463 (arr!24750 (Array (_ BitVec 32) ValueCell!8394)) (size!25190 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51462)

(declare-fun +!2551 (ListLongMap!10533 tuple2!11764) ListLongMap!10533)

(declare-fun get!13037 (ValueCell!8394 V!28603) V!28603)

(declare-fun dynLambda!1264 (Int (_ BitVec 64)) V!28603)

(assert (=> b!883139 (= lt!399636 (+!2551 lt!399641 (tuple2!11765 (select (arr!24749 _keys!868) from!1053) (get!13037 (select (arr!24750 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883141 () Bool)

(declare-fun e!491507 () Bool)

(assert (=> b!883141 (= e!491507 (not e!491514))))

(declare-fun res!599991 () Bool)

(assert (=> b!883141 (=> res!599991 e!491514)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883141 (= res!599991 (not (validKeyInArray!0 (select (arr!24749 _keys!868) from!1053))))))

(declare-fun lt!399635 () ListLongMap!10533)

(assert (=> b!883141 (= lt!399635 lt!399641)))

(declare-fun v!557 () V!28603)

(declare-fun lt!399637 () ListLongMap!10533)

(assert (=> b!883141 (= lt!399641 (+!2551 lt!399637 (tuple2!11765 k0!854 v!557)))))

(declare-fun lt!399639 () array!51462)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28603)

(declare-fun zeroValue!654 () V!28603)

(declare-fun getCurrentListMapNoExtraKeys!3242 (array!51460 array!51462 (_ BitVec 32) (_ BitVec 32) V!28603 V!28603 (_ BitVec 32) Int) ListLongMap!10533)

(assert (=> b!883141 (= lt!399635 (getCurrentListMapNoExtraKeys!3242 _keys!868 lt!399639 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883141 (= lt!399637 (getCurrentListMapNoExtraKeys!3242 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399638 () Unit!30118)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!737 (array!51460 array!51462 (_ BitVec 32) (_ BitVec 32) V!28603 V!28603 (_ BitVec 32) (_ BitVec 64) V!28603 (_ BitVec 32) Int) Unit!30118)

(assert (=> b!883141 (= lt!399638 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!737 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!28137 () Bool)

(declare-fun mapRes!28137 () Bool)

(assert (=> mapIsEmpty!28137 mapRes!28137))

(declare-fun b!883142 () Bool)

(declare-fun res!599993 () Bool)

(assert (=> b!883142 (=> (not res!599993) (not e!491510))))

(assert (=> b!883142 (= res!599993 (and (= (size!25190 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25189 _keys!868) (size!25190 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28137 () Bool)

(declare-fun tp!53971 () Bool)

(declare-fun e!491513 () Bool)

(assert (=> mapNonEmpty!28137 (= mapRes!28137 (and tp!53971 e!491513))))

(declare-fun mapValue!28137 () ValueCell!8394)

(declare-fun mapKey!28137 () (_ BitVec 32))

(declare-fun mapRest!28137 () (Array (_ BitVec 32) ValueCell!8394))

(assert (=> mapNonEmpty!28137 (= (arr!24750 _values!688) (store mapRest!28137 mapKey!28137 mapValue!28137))))

(declare-fun b!883143 () Bool)

(declare-fun res!599990 () Bool)

(assert (=> b!883143 (=> (not res!599990) (not e!491510))))

(assert (=> b!883143 (= res!599990 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17570))))

(declare-fun b!883140 () Bool)

(assert (=> b!883140 (= e!491510 e!491507)))

(declare-fun res!599995 () Bool)

(assert (=> b!883140 (=> (not res!599995) (not e!491507))))

(assert (=> b!883140 (= res!599995 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!883140 (= lt!399636 (getCurrentListMapNoExtraKeys!3242 _keys!868 lt!399639 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883140 (= lt!399639 (array!51463 (store (arr!24750 _values!688) i!612 (ValueCellFull!8394 v!557)) (size!25190 _values!688)))))

(declare-fun lt!399633 () ListLongMap!10533)

(assert (=> b!883140 (= lt!399633 (getCurrentListMapNoExtraKeys!3242 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!599994 () Bool)

(assert (=> start!74904 (=> (not res!599994) (not e!491510))))

(assert (=> start!74904 (= res!599994 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25189 _keys!868))))))

(assert (=> start!74904 e!491510))

(assert (=> start!74904 tp_is_empty!17667))

(assert (=> start!74904 true))

(assert (=> start!74904 tp!53972))

(declare-fun array_inv!19486 (array!51460) Bool)

(assert (=> start!74904 (array_inv!19486 _keys!868)))

(declare-fun e!491509 () Bool)

(declare-fun array_inv!19487 (array!51462) Bool)

(assert (=> start!74904 (and (array_inv!19487 _values!688) e!491509)))

(declare-fun b!883144 () Bool)

(assert (=> b!883144 (= e!491513 tp_is_empty!17667)))

(declare-fun b!883145 () Bool)

(declare-fun res!600000 () Bool)

(assert (=> b!883145 (=> (not res!600000) (not e!491510))))

(assert (=> b!883145 (= res!600000 (validKeyInArray!0 k0!854))))

(declare-fun b!883146 () Bool)

(declare-fun res!599999 () Bool)

(assert (=> b!883146 (=> (not res!599999) (not e!491510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883146 (= res!599999 (validMask!0 mask!1196))))

(declare-fun b!883147 () Bool)

(declare-fun res!599992 () Bool)

(assert (=> b!883147 (=> (not res!599992) (not e!491510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51460 (_ BitVec 32)) Bool)

(assert (=> b!883147 (= res!599992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883148 () Bool)

(assert (=> b!883148 (= e!491509 (and e!491512 mapRes!28137))))

(declare-fun condMapEmpty!28137 () Bool)

(declare-fun mapDefault!28137 () ValueCell!8394)

(assert (=> b!883148 (= condMapEmpty!28137 (= (arr!24750 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8394)) mapDefault!28137)))))

(declare-fun b!883149 () Bool)

(declare-fun res!599997 () Bool)

(assert (=> b!883149 (=> (not res!599997) (not e!491510))))

(assert (=> b!883149 (= res!599997 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25189 _keys!868))))))

(assert (= (and start!74904 res!599994) b!883146))

(assert (= (and b!883146 res!599999) b!883142))

(assert (= (and b!883142 res!599993) b!883147))

(assert (= (and b!883147 res!599992) b!883143))

(assert (= (and b!883143 res!599990) b!883149))

(assert (= (and b!883149 res!599997) b!883145))

(assert (= (and b!883145 res!600000) b!883138))

(assert (= (and b!883138 res!599996) b!883140))

(assert (= (and b!883140 res!599995) b!883141))

(assert (= (and b!883141 (not res!599991)) b!883139))

(assert (= (and b!883139 (not res!599998)) b!883137))

(assert (= (and b!883148 condMapEmpty!28137) mapIsEmpty!28137))

(assert (= (and b!883148 (not condMapEmpty!28137)) mapNonEmpty!28137))

(get-info :version)

(assert (= (and mapNonEmpty!28137 ((_ is ValueCellFull!8394) mapValue!28137)) b!883144))

(assert (= (and b!883148 ((_ is ValueCellFull!8394) mapDefault!28137)) b!883136))

(assert (= start!74904 b!883148))

(declare-fun b_lambda!12701 () Bool)

(assert (=> (not b_lambda!12701) (not b!883139)))

(declare-fun t!24797 () Bool)

(declare-fun tb!5081 () Bool)

(assert (=> (and start!74904 (= defaultEntry!696 defaultEntry!696) t!24797) tb!5081))

(declare-fun result!9797 () Bool)

(assert (=> tb!5081 (= result!9797 tp_is_empty!17667)))

(assert (=> b!883139 t!24797))

(declare-fun b_and!25547 () Bool)

(assert (= b_and!25545 (and (=> t!24797 result!9797) b_and!25547)))

(declare-fun m!823161 () Bool)

(assert (=> b!883141 m!823161))

(declare-fun m!823163 () Bool)

(assert (=> b!883141 m!823163))

(declare-fun m!823165 () Bool)

(assert (=> b!883141 m!823165))

(declare-fun m!823167 () Bool)

(assert (=> b!883141 m!823167))

(assert (=> b!883141 m!823165))

(declare-fun m!823169 () Bool)

(assert (=> b!883141 m!823169))

(declare-fun m!823171 () Bool)

(assert (=> b!883141 m!823171))

(declare-fun m!823173 () Bool)

(assert (=> b!883139 m!823173))

(declare-fun m!823175 () Bool)

(assert (=> b!883139 m!823175))

(declare-fun m!823177 () Bool)

(assert (=> b!883139 m!823177))

(declare-fun m!823179 () Bool)

(assert (=> b!883139 m!823179))

(assert (=> b!883139 m!823175))

(assert (=> b!883139 m!823165))

(assert (=> b!883139 m!823177))

(declare-fun m!823181 () Bool)

(assert (=> mapNonEmpty!28137 m!823181))

(declare-fun m!823183 () Bool)

(assert (=> start!74904 m!823183))

(declare-fun m!823185 () Bool)

(assert (=> start!74904 m!823185))

(declare-fun m!823187 () Bool)

(assert (=> b!883147 m!823187))

(declare-fun m!823189 () Bool)

(assert (=> b!883143 m!823189))

(declare-fun m!823191 () Bool)

(assert (=> b!883138 m!823191))

(declare-fun m!823193 () Bool)

(assert (=> b!883137 m!823193))

(declare-fun m!823195 () Bool)

(assert (=> b!883137 m!823195))

(declare-fun m!823197 () Bool)

(assert (=> b!883137 m!823197))

(declare-fun m!823199 () Bool)

(assert (=> b!883137 m!823199))

(declare-fun m!823201 () Bool)

(assert (=> b!883137 m!823201))

(declare-fun m!823203 () Bool)

(assert (=> b!883146 m!823203))

(declare-fun m!823205 () Bool)

(assert (=> b!883140 m!823205))

(declare-fun m!823207 () Bool)

(assert (=> b!883140 m!823207))

(declare-fun m!823209 () Bool)

(assert (=> b!883140 m!823209))

(declare-fun m!823211 () Bool)

(assert (=> b!883145 m!823211))

(check-sat (not b!883147) (not start!74904) (not b_lambda!12701) (not b!883146) (not b!883141) (not b!883143) tp_is_empty!17667 (not b!883140) (not b_next!15423) (not mapNonEmpty!28137) (not b!883137) b_and!25547 (not b!883145) (not b!883139))
(check-sat b_and!25547 (not b_next!15423))
