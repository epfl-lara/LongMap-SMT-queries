; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73566 () Bool)

(assert start!73566)

(declare-fun b_free!14481 () Bool)

(declare-fun b_next!14481 () Bool)

(assert (=> start!73566 (= b_free!14481 (not b_next!14481))))

(declare-fun tp!50946 () Bool)

(declare-fun b_and!23941 () Bool)

(assert (=> start!73566 (= tp!50946 b_and!23941)))

(declare-fun b!860343 () Bool)

(declare-fun e!479412 () Bool)

(declare-fun e!479415 () Bool)

(assert (=> b!860343 (= e!479412 (not e!479415))))

(declare-fun res!584669 () Bool)

(assert (=> b!860343 (=> res!584669 e!479415)))

(declare-datatypes ((array!49410 0))(
  ( (array!49411 (arr!23736 (Array (_ BitVec 32) (_ BitVec 64))) (size!24176 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49410)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860343 (= res!584669 (not (validKeyInArray!0 (select (arr!23736 _keys!868) from!1053))))))

(declare-datatypes ((V!27203 0))(
  ( (V!27204 (val!8356 Int)) )
))
(declare-datatypes ((tuple2!11042 0))(
  ( (tuple2!11043 (_1!5532 (_ BitVec 64)) (_2!5532 V!27203)) )
))
(declare-datatypes ((List!16850 0))(
  ( (Nil!16847) (Cons!16846 (h!17977 tuple2!11042) (t!23597 List!16850)) )
))
(declare-datatypes ((ListLongMap!9811 0))(
  ( (ListLongMap!9812 (toList!4921 List!16850)) )
))
(declare-fun lt!387779 () ListLongMap!9811)

(declare-fun lt!387775 () ListLongMap!9811)

(assert (=> b!860343 (= lt!387779 lt!387775)))

(declare-fun v!557 () V!27203)

(declare-fun lt!387776 () ListLongMap!9811)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2273 (ListLongMap!9811 tuple2!11042) ListLongMap!9811)

(assert (=> b!860343 (= lt!387775 (+!2273 lt!387776 (tuple2!11043 k0!854 v!557)))))

(declare-datatypes ((ValueCell!7869 0))(
  ( (ValueCellFull!7869 (v!10781 V!27203)) (EmptyCell!7869) )
))
(declare-datatypes ((array!49412 0))(
  ( (array!49413 (arr!23737 (Array (_ BitVec 32) ValueCell!7869)) (size!24177 (_ BitVec 32))) )
))
(declare-fun lt!387784 () array!49412)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27203)

(declare-fun zeroValue!654 () V!27203)

(declare-fun getCurrentListMapNoExtraKeys!2898 (array!49410 array!49412 (_ BitVec 32) (_ BitVec 32) V!27203 V!27203 (_ BitVec 32) Int) ListLongMap!9811)

(assert (=> b!860343 (= lt!387779 (getCurrentListMapNoExtraKeys!2898 _keys!868 lt!387784 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49412)

(assert (=> b!860343 (= lt!387776 (getCurrentListMapNoExtraKeys!2898 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29329 0))(
  ( (Unit!29330) )
))
(declare-fun lt!387782 () Unit!29329)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!486 (array!49410 array!49412 (_ BitVec 32) (_ BitVec 32) V!27203 V!27203 (_ BitVec 32) (_ BitVec 64) V!27203 (_ BitVec 32) Int) Unit!29329)

(assert (=> b!860343 (= lt!387782 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!486 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860344 () Bool)

(declare-fun res!584662 () Bool)

(declare-fun e!479408 () Bool)

(assert (=> b!860344 (=> res!584662 e!479408)))

(declare-datatypes ((List!16851 0))(
  ( (Nil!16848) (Cons!16847 (h!17978 (_ BitVec 64)) (t!23598 List!16851)) )
))
(declare-fun contains!4233 (List!16851 (_ BitVec 64)) Bool)

(assert (=> b!860344 (= res!584662 (contains!4233 Nil!16848 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860345 () Bool)

(declare-fun res!584659 () Bool)

(declare-fun e!479416 () Bool)

(assert (=> b!860345 (=> (not res!584659) (not e!479416))))

(declare-fun arrayNoDuplicates!0 (array!49410 (_ BitVec 32) List!16851) Bool)

(assert (=> b!860345 (= res!584659 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16848))))

(declare-fun b!860346 () Bool)

(declare-fun res!584661 () Bool)

(assert (=> b!860346 (=> (not res!584661) (not e!479416))))

(assert (=> b!860346 (= res!584661 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24176 _keys!868))))))

(declare-fun b!860347 () Bool)

(declare-fun res!584672 () Bool)

(assert (=> b!860347 (=> res!584672 e!479408)))

(declare-fun noDuplicate!1314 (List!16851) Bool)

(assert (=> b!860347 (= res!584672 (not (noDuplicate!1314 Nil!16848)))))

(declare-fun b!860348 () Bool)

(assert (=> b!860348 (= e!479416 e!479412)))

(declare-fun res!584668 () Bool)

(assert (=> b!860348 (=> (not res!584668) (not e!479412))))

(assert (=> b!860348 (= res!584668 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387783 () ListLongMap!9811)

(assert (=> b!860348 (= lt!387783 (getCurrentListMapNoExtraKeys!2898 _keys!868 lt!387784 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!860348 (= lt!387784 (array!49413 (store (arr!23737 _values!688) i!612 (ValueCellFull!7869 v!557)) (size!24177 _values!688)))))

(declare-fun lt!387781 () ListLongMap!9811)

(assert (=> b!860348 (= lt!387781 (getCurrentListMapNoExtraKeys!2898 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!584663 () Bool)

(assert (=> start!73566 (=> (not res!584663) (not e!479416))))

(assert (=> start!73566 (= res!584663 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24176 _keys!868))))))

(assert (=> start!73566 e!479416))

(declare-fun tp_is_empty!16617 () Bool)

(assert (=> start!73566 tp_is_empty!16617))

(assert (=> start!73566 true))

(assert (=> start!73566 tp!50946))

(declare-fun array_inv!18790 (array!49410) Bool)

(assert (=> start!73566 (array_inv!18790 _keys!868)))

(declare-fun e!479409 () Bool)

(declare-fun array_inv!18791 (array!49412) Bool)

(assert (=> start!73566 (and (array_inv!18791 _values!688) e!479409)))

(declare-fun b!860349 () Bool)

(declare-fun e!479411 () Bool)

(assert (=> b!860349 (= e!479415 e!479411)))

(declare-fun res!584664 () Bool)

(assert (=> b!860349 (=> res!584664 e!479411)))

(assert (=> b!860349 (= res!584664 (not (= (select (arr!23736 _keys!868) from!1053) k0!854)))))

(declare-fun get!12513 (ValueCell!7869 V!27203) V!27203)

(declare-fun dynLambda!1109 (Int (_ BitVec 64)) V!27203)

(assert (=> b!860349 (= lt!387783 (+!2273 lt!387775 (tuple2!11043 (select (arr!23736 _keys!868) from!1053) (get!12513 (select (arr!23737 _values!688) from!1053) (dynLambda!1109 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860350 () Bool)

(declare-fun res!584670 () Bool)

(assert (=> b!860350 (=> (not res!584670) (not e!479416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49410 (_ BitVec 32)) Bool)

(assert (=> b!860350 (= res!584670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860351 () Bool)

(declare-fun e!479414 () Bool)

(declare-fun mapRes!26525 () Bool)

(assert (=> b!860351 (= e!479409 (and e!479414 mapRes!26525))))

(declare-fun condMapEmpty!26525 () Bool)

(declare-fun mapDefault!26525 () ValueCell!7869)

(assert (=> b!860351 (= condMapEmpty!26525 (= (arr!23737 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7869)) mapDefault!26525)))))

(declare-fun b!860352 () Bool)

(declare-fun e!479413 () Bool)

(assert (=> b!860352 (= e!479413 tp_is_empty!16617)))

(declare-fun b!860353 () Bool)

(declare-fun res!584667 () Bool)

(assert (=> b!860353 (=> (not res!584667) (not e!479416))))

(assert (=> b!860353 (= res!584667 (and (= (select (arr!23736 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860354 () Bool)

(declare-fun res!584666 () Bool)

(assert (=> b!860354 (=> (not res!584666) (not e!479416))))

(assert (=> b!860354 (= res!584666 (and (= (size!24177 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24176 _keys!868) (size!24177 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860355 () Bool)

(assert (=> b!860355 (= e!479414 tp_is_empty!16617)))

(declare-fun mapNonEmpty!26525 () Bool)

(declare-fun tp!50947 () Bool)

(assert (=> mapNonEmpty!26525 (= mapRes!26525 (and tp!50947 e!479413))))

(declare-fun mapRest!26525 () (Array (_ BitVec 32) ValueCell!7869))

(declare-fun mapValue!26525 () ValueCell!7869)

(declare-fun mapKey!26525 () (_ BitVec 32))

(assert (=> mapNonEmpty!26525 (= (arr!23737 _values!688) (store mapRest!26525 mapKey!26525 mapValue!26525))))

(declare-fun b!860356 () Bool)

(declare-fun res!584671 () Bool)

(assert (=> b!860356 (=> (not res!584671) (not e!479416))))

(assert (=> b!860356 (= res!584671 (validKeyInArray!0 k0!854))))

(declare-fun b!860357 () Bool)

(assert (=> b!860357 (= e!479408 true)))

(declare-fun lt!387780 () Bool)

(assert (=> b!860357 (= lt!387780 (contains!4233 Nil!16848 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860358 () Bool)

(declare-fun res!584665 () Bool)

(assert (=> b!860358 (=> (not res!584665) (not e!479416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860358 (= res!584665 (validMask!0 mask!1196))))

(declare-fun b!860359 () Bool)

(assert (=> b!860359 (= e!479411 e!479408)))

(declare-fun res!584660 () Bool)

(assert (=> b!860359 (=> res!584660 e!479408)))

(assert (=> b!860359 (= res!584660 (or (bvsge (size!24176 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24176 _keys!868)) (bvsge from!1053 (size!24176 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860359 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387778 () Unit!29329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49410 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29329)

(assert (=> b!860359 (= lt!387778 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!860359 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16848)))

(declare-fun lt!387777 () Unit!29329)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49410 (_ BitVec 32) (_ BitVec 32)) Unit!29329)

(assert (=> b!860359 (= lt!387777 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapIsEmpty!26525 () Bool)

(assert (=> mapIsEmpty!26525 mapRes!26525))

(assert (= (and start!73566 res!584663) b!860358))

(assert (= (and b!860358 res!584665) b!860354))

(assert (= (and b!860354 res!584666) b!860350))

(assert (= (and b!860350 res!584670) b!860345))

(assert (= (and b!860345 res!584659) b!860346))

(assert (= (and b!860346 res!584661) b!860356))

(assert (= (and b!860356 res!584671) b!860353))

(assert (= (and b!860353 res!584667) b!860348))

(assert (= (and b!860348 res!584668) b!860343))

(assert (= (and b!860343 (not res!584669)) b!860349))

(assert (= (and b!860349 (not res!584664)) b!860359))

(assert (= (and b!860359 (not res!584660)) b!860347))

(assert (= (and b!860347 (not res!584672)) b!860344))

(assert (= (and b!860344 (not res!584662)) b!860357))

(assert (= (and b!860351 condMapEmpty!26525) mapIsEmpty!26525))

(assert (= (and b!860351 (not condMapEmpty!26525)) mapNonEmpty!26525))

(get-info :version)

(assert (= (and mapNonEmpty!26525 ((_ is ValueCellFull!7869) mapValue!26525)) b!860352))

(assert (= (and b!860351 ((_ is ValueCellFull!7869) mapDefault!26525)) b!860355))

(assert (= start!73566 b!860351))

(declare-fun b_lambda!11833 () Bool)

(assert (=> (not b_lambda!11833) (not b!860349)))

(declare-fun t!23596 () Bool)

(declare-fun tb!4603 () Bool)

(assert (=> (and start!73566 (= defaultEntry!696 defaultEntry!696) t!23596) tb!4603))

(declare-fun result!8817 () Bool)

(assert (=> tb!4603 (= result!8817 tp_is_empty!16617)))

(assert (=> b!860349 t!23596))

(declare-fun b_and!23943 () Bool)

(assert (= b_and!23941 (and (=> t!23596 result!8817) b_and!23943)))

(declare-fun m!801145 () Bool)

(assert (=> b!860350 m!801145))

(declare-fun m!801147 () Bool)

(assert (=> b!860348 m!801147))

(declare-fun m!801149 () Bool)

(assert (=> b!860348 m!801149))

(declare-fun m!801151 () Bool)

(assert (=> b!860348 m!801151))

(declare-fun m!801153 () Bool)

(assert (=> b!860344 m!801153))

(declare-fun m!801155 () Bool)

(assert (=> mapNonEmpty!26525 m!801155))

(declare-fun m!801157 () Bool)

(assert (=> b!860347 m!801157))

(declare-fun m!801159 () Bool)

(assert (=> b!860353 m!801159))

(declare-fun m!801161 () Bool)

(assert (=> b!860358 m!801161))

(declare-fun m!801163 () Bool)

(assert (=> b!860345 m!801163))

(declare-fun m!801165 () Bool)

(assert (=> b!860357 m!801165))

(declare-fun m!801167 () Bool)

(assert (=> b!860349 m!801167))

(declare-fun m!801169 () Bool)

(assert (=> b!860349 m!801169))

(declare-fun m!801171 () Bool)

(assert (=> b!860349 m!801171))

(declare-fun m!801173 () Bool)

(assert (=> b!860349 m!801173))

(assert (=> b!860349 m!801169))

(declare-fun m!801175 () Bool)

(assert (=> b!860349 m!801175))

(assert (=> b!860349 m!801171))

(declare-fun m!801177 () Bool)

(assert (=> b!860356 m!801177))

(declare-fun m!801179 () Bool)

(assert (=> b!860359 m!801179))

(declare-fun m!801181 () Bool)

(assert (=> b!860359 m!801181))

(declare-fun m!801183 () Bool)

(assert (=> b!860359 m!801183))

(declare-fun m!801185 () Bool)

(assert (=> b!860359 m!801185))

(declare-fun m!801187 () Bool)

(assert (=> b!860343 m!801187))

(declare-fun m!801189 () Bool)

(assert (=> b!860343 m!801189))

(declare-fun m!801191 () Bool)

(assert (=> b!860343 m!801191))

(assert (=> b!860343 m!801175))

(declare-fun m!801193 () Bool)

(assert (=> b!860343 m!801193))

(assert (=> b!860343 m!801175))

(declare-fun m!801195 () Bool)

(assert (=> b!860343 m!801195))

(declare-fun m!801197 () Bool)

(assert (=> start!73566 m!801197))

(declare-fun m!801199 () Bool)

(assert (=> start!73566 m!801199))

(check-sat (not start!73566) (not b!860356) (not b!860358) (not b!860348) (not b!860344) (not b!860347) (not b!860359) b_and!23943 (not b!860349) (not b!860357) (not b!860345) (not b!860350) (not mapNonEmpty!26525) (not b_lambda!11833) (not b!860343) (not b_next!14481) tp_is_empty!16617)
(check-sat b_and!23943 (not b_next!14481))
