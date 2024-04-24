; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113338 () Bool)

(assert start!113338)

(declare-fun b_free!31165 () Bool)

(declare-fun b_next!31165 () Bool)

(assert (=> start!113338 (= b_free!31165 (not b_next!31165))))

(declare-fun tp!109299 () Bool)

(declare-fun b_and!50239 () Bool)

(assert (=> start!113338 (= tp!109299 b_and!50239)))

(declare-fun b!1342328 () Bool)

(declare-fun e!764561 () Bool)

(declare-fun tp_is_empty!37165 () Bool)

(assert (=> b!1342328 (= e!764561 tp_is_empty!37165)))

(declare-fun mapIsEmpty!57454 () Bool)

(declare-fun mapRes!57454 () Bool)

(assert (=> mapIsEmpty!57454 mapRes!57454))

(declare-fun b!1342329 () Bool)

(declare-fun res!890143 () Bool)

(declare-fun e!764560 () Bool)

(assert (=> b!1342329 (=> (not res!890143) (not e!764560))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((array!91303 0))(
  ( (array!91304 (arr!44103 (Array (_ BitVec 32) (_ BitVec 64))) (size!44654 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91303)

(assert (=> b!1342329 (= res!890143 (not (= (select (arr!44103 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!890144 () Bool)

(assert (=> start!113338 (=> (not res!890144) (not e!764560))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113338 (= res!890144 (validMask!0 mask!1977))))

(assert (=> start!113338 e!764560))

(assert (=> start!113338 tp_is_empty!37165))

(assert (=> start!113338 true))

(declare-fun array_inv!33515 (array!91303) Bool)

(assert (=> start!113338 (array_inv!33515 _keys!1571)))

(declare-datatypes ((V!54657 0))(
  ( (V!54658 (val!18657 Int)) )
))
(declare-datatypes ((ValueCell!17684 0))(
  ( (ValueCellFull!17684 (v!21300 V!54657)) (EmptyCell!17684) )
))
(declare-datatypes ((array!91305 0))(
  ( (array!91306 (arr!44104 (Array (_ BitVec 32) ValueCell!17684)) (size!44655 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91305)

(declare-fun e!764559 () Bool)

(declare-fun array_inv!33516 (array!91305) Bool)

(assert (=> start!113338 (and (array_inv!33516 _values!1303) e!764559)))

(assert (=> start!113338 tp!109299))

(declare-fun b!1342330 () Bool)

(declare-fun res!890149 () Bool)

(assert (=> b!1342330 (=> (not res!890149) (not e!764560))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342330 (= res!890149 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342331 () Bool)

(declare-fun res!890147 () Bool)

(assert (=> b!1342331 (=> (not res!890147) (not e!764560))))

(assert (=> b!1342331 (= res!890147 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44654 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342332 () Bool)

(assert (=> b!1342332 (= e!764559 (and e!764561 mapRes!57454))))

(declare-fun condMapEmpty!57454 () Bool)

(declare-fun mapDefault!57454 () ValueCell!17684)

(assert (=> b!1342332 (= condMapEmpty!57454 (= (arr!44104 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17684)) mapDefault!57454)))))

(declare-fun b!1342333 () Bool)

(declare-fun res!890145 () Bool)

(assert (=> b!1342333 (=> (not res!890145) (not e!764560))))

(assert (=> b!1342333 (= res!890145 (and (= (size!44655 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44654 _keys!1571) (size!44655 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342334 () Bool)

(declare-fun res!890146 () Bool)

(assert (=> b!1342334 (=> (not res!890146) (not e!764560))))

(declare-datatypes ((List!31230 0))(
  ( (Nil!31227) (Cons!31226 (h!32444 (_ BitVec 64)) (t!45598 List!31230)) )
))
(declare-fun arrayNoDuplicates!0 (array!91303 (_ BitVec 32) List!31230) Bool)

(assert (=> b!1342334 (= res!890146 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31227))))

(declare-fun b!1342335 () Bool)

(declare-fun res!890142 () Bool)

(assert (=> b!1342335 (=> (not res!890142) (not e!764560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342335 (= res!890142 (validKeyInArray!0 (select (arr!44103 _keys!1571) from!1960)))))

(declare-fun b!1342336 () Bool)

(declare-fun e!764558 () Bool)

(assert (=> b!1342336 (= e!764558 tp_is_empty!37165)))

(declare-fun b!1342337 () Bool)

(assert (=> b!1342337 (= e!764560 (not true))))

(declare-datatypes ((tuple2!24076 0))(
  ( (tuple2!24077 (_1!12049 (_ BitVec 64)) (_2!12049 V!54657)) )
))
(declare-datatypes ((List!31231 0))(
  ( (Nil!31228) (Cons!31227 (h!32445 tuple2!24076) (t!45599 List!31231)) )
))
(declare-datatypes ((ListLongMap!21741 0))(
  ( (ListLongMap!21742 (toList!10886 List!31231)) )
))
(declare-fun lt!594556 () ListLongMap!21741)

(declare-fun contains!9074 (ListLongMap!21741 (_ BitVec 64)) Bool)

(assert (=> b!1342337 (contains!9074 lt!594556 k0!1142)))

(declare-fun zeroValue!1245 () V!54657)

(declare-datatypes ((Unit!43948 0))(
  ( (Unit!43949) )
))
(declare-fun lt!594557 () Unit!43948)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!330 ((_ BitVec 64) (_ BitVec 64) V!54657 ListLongMap!21741) Unit!43948)

(assert (=> b!1342337 (= lt!594557 (lemmaInListMapAfterAddingDiffThenInBefore!330 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594556))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun minValue!1245 () V!54657)

(declare-fun +!4804 (ListLongMap!21741 tuple2!24076) ListLongMap!21741)

(declare-fun getCurrentListMapNoExtraKeys!6453 (array!91303 array!91305 (_ BitVec 32) (_ BitVec 32) V!54657 V!54657 (_ BitVec 32) Int) ListLongMap!21741)

(declare-fun get!22268 (ValueCell!17684 V!54657) V!54657)

(declare-fun dynLambda!3758 (Int (_ BitVec 64)) V!54657)

(assert (=> b!1342337 (= lt!594556 (+!4804 (getCurrentListMapNoExtraKeys!6453 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24077 (select (arr!44103 _keys!1571) from!1960) (get!22268 (select (arr!44104 _values!1303) from!1960) (dynLambda!3758 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1342338 () Bool)

(declare-fun res!890150 () Bool)

(assert (=> b!1342338 (=> (not res!890150) (not e!764560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91303 (_ BitVec 32)) Bool)

(assert (=> b!1342338 (= res!890150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342339 () Bool)

(declare-fun res!890148 () Bool)

(assert (=> b!1342339 (=> (not res!890148) (not e!764560))))

(declare-fun getCurrentListMap!5837 (array!91303 array!91305 (_ BitVec 32) (_ BitVec 32) V!54657 V!54657 (_ BitVec 32) Int) ListLongMap!21741)

(assert (=> b!1342339 (= res!890148 (contains!9074 (getCurrentListMap!5837 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57454 () Bool)

(declare-fun tp!109300 () Bool)

(assert (=> mapNonEmpty!57454 (= mapRes!57454 (and tp!109300 e!764558))))

(declare-fun mapRest!57454 () (Array (_ BitVec 32) ValueCell!17684))

(declare-fun mapKey!57454 () (_ BitVec 32))

(declare-fun mapValue!57454 () ValueCell!17684)

(assert (=> mapNonEmpty!57454 (= (arr!44104 _values!1303) (store mapRest!57454 mapKey!57454 mapValue!57454))))

(assert (= (and start!113338 res!890144) b!1342333))

(assert (= (and b!1342333 res!890145) b!1342338))

(assert (= (and b!1342338 res!890150) b!1342334))

(assert (= (and b!1342334 res!890146) b!1342331))

(assert (= (and b!1342331 res!890147) b!1342339))

(assert (= (and b!1342339 res!890148) b!1342329))

(assert (= (and b!1342329 res!890143) b!1342335))

(assert (= (and b!1342335 res!890142) b!1342330))

(assert (= (and b!1342330 res!890149) b!1342337))

(assert (= (and b!1342332 condMapEmpty!57454) mapIsEmpty!57454))

(assert (= (and b!1342332 (not condMapEmpty!57454)) mapNonEmpty!57454))

(get-info :version)

(assert (= (and mapNonEmpty!57454 ((_ is ValueCellFull!17684) mapValue!57454)) b!1342336))

(assert (= (and b!1342332 ((_ is ValueCellFull!17684) mapDefault!57454)) b!1342328))

(assert (= start!113338 b!1342332))

(declare-fun b_lambda!24335 () Bool)

(assert (=> (not b_lambda!24335) (not b!1342337)))

(declare-fun t!45597 () Bool)

(declare-fun tb!12171 () Bool)

(assert (=> (and start!113338 (= defaultEntry!1306 defaultEntry!1306) t!45597) tb!12171))

(declare-fun result!25441 () Bool)

(assert (=> tb!12171 (= result!25441 tp_is_empty!37165)))

(assert (=> b!1342337 t!45597))

(declare-fun b_and!50241 () Bool)

(assert (= b_and!50239 (and (=> t!45597 result!25441) b_and!50241)))

(declare-fun m!1230321 () Bool)

(assert (=> b!1342335 m!1230321))

(assert (=> b!1342335 m!1230321))

(declare-fun m!1230323 () Bool)

(assert (=> b!1342335 m!1230323))

(declare-fun m!1230325 () Bool)

(assert (=> b!1342339 m!1230325))

(assert (=> b!1342339 m!1230325))

(declare-fun m!1230327 () Bool)

(assert (=> b!1342339 m!1230327))

(declare-fun m!1230329 () Bool)

(assert (=> b!1342337 m!1230329))

(declare-fun m!1230331 () Bool)

(assert (=> b!1342337 m!1230331))

(declare-fun m!1230333 () Bool)

(assert (=> b!1342337 m!1230333))

(declare-fun m!1230335 () Bool)

(assert (=> b!1342337 m!1230335))

(declare-fun m!1230337 () Bool)

(assert (=> b!1342337 m!1230337))

(assert (=> b!1342337 m!1230331))

(declare-fun m!1230339 () Bool)

(assert (=> b!1342337 m!1230339))

(assert (=> b!1342337 m!1230333))

(assert (=> b!1342337 m!1230335))

(declare-fun m!1230341 () Bool)

(assert (=> b!1342337 m!1230341))

(assert (=> b!1342337 m!1230321))

(declare-fun m!1230343 () Bool)

(assert (=> b!1342334 m!1230343))

(declare-fun m!1230345 () Bool)

(assert (=> start!113338 m!1230345))

(declare-fun m!1230347 () Bool)

(assert (=> start!113338 m!1230347))

(declare-fun m!1230349 () Bool)

(assert (=> start!113338 m!1230349))

(declare-fun m!1230351 () Bool)

(assert (=> b!1342338 m!1230351))

(assert (=> b!1342329 m!1230321))

(declare-fun m!1230353 () Bool)

(assert (=> mapNonEmpty!57454 m!1230353))

(check-sat b_and!50241 tp_is_empty!37165 (not b!1342339) (not b_next!31165) (not b!1342337) (not b!1342338) (not b_lambda!24335) (not b!1342335) (not b!1342334) (not mapNonEmpty!57454) (not start!113338))
(check-sat b_and!50241 (not b_next!31165))
