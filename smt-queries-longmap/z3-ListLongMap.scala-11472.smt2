; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134042 () Bool)

(assert start!134042)

(declare-fun b_free!32047 () Bool)

(declare-fun b_next!32047 () Bool)

(assert (=> start!134042 (= b_free!32047 (not b_next!32047))))

(declare-fun tp!113265 () Bool)

(declare-fun b_and!51607 () Bool)

(assert (=> start!134042 (= tp!113265 b_and!51607)))

(declare-fun b!1564902 () Bool)

(declare-fun e!872193 () Bool)

(declare-fun tp_is_empty!38713 () Bool)

(assert (=> b!1564902 (= e!872193 tp_is_empty!38713)))

(declare-fun b!1564903 () Bool)

(declare-fun res!1069128 () Bool)

(declare-fun e!872197 () Bool)

(assert (=> b!1564903 (=> (not res!1069128) (not e!872197))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104254 0))(
  ( (array!104255 (arr!50312 (Array (_ BitVec 32) (_ BitVec 64))) (size!50863 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104254)

(declare-datatypes ((V!59825 0))(
  ( (V!59826 (val!19440 Int)) )
))
(declare-datatypes ((ValueCell!18326 0))(
  ( (ValueCellFull!18326 (v!22184 V!59825)) (EmptyCell!18326) )
))
(declare-datatypes ((array!104256 0))(
  ( (array!104257 (arr!50313 (Array (_ BitVec 32) ValueCell!18326)) (size!50864 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104256)

(assert (=> b!1564903 (= res!1069128 (and (= (size!50864 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50863 _keys!637) (size!50864 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564904 () Bool)

(declare-fun e!872194 () Bool)

(declare-fun mapRes!59445 () Bool)

(assert (=> b!1564904 (= e!872194 (and e!872193 mapRes!59445))))

(declare-fun condMapEmpty!59445 () Bool)

(declare-fun mapDefault!59445 () ValueCell!18326)

(assert (=> b!1564904 (= condMapEmpty!59445 (= (arr!50313 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18326)) mapDefault!59445)))))

(declare-fun b!1564905 () Bool)

(declare-fun e!872195 () Bool)

(assert (=> b!1564905 (= e!872195 tp_is_empty!38713)))

(declare-fun mapNonEmpty!59445 () Bool)

(declare-fun tp!113264 () Bool)

(assert (=> mapNonEmpty!59445 (= mapRes!59445 (and tp!113264 e!872195))))

(declare-fun mapRest!59445 () (Array (_ BitVec 32) ValueCell!18326))

(declare-fun mapValue!59445 () ValueCell!18326)

(declare-fun mapKey!59445 () (_ BitVec 32))

(assert (=> mapNonEmpty!59445 (= (arr!50313 _values!487) (store mapRest!59445 mapKey!59445 mapValue!59445))))

(declare-fun b!1564906 () Bool)

(declare-fun res!1069126 () Bool)

(assert (=> b!1564906 (=> (not res!1069126) (not e!872197))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564906 (= res!1069126 (validKeyInArray!0 (select (arr!50312 _keys!637) from!782)))))

(declare-fun b!1564907 () Bool)

(assert (=> b!1564907 (= e!872197 (not true))))

(declare-fun lt!672584 () Bool)

(declare-datatypes ((tuple2!25176 0))(
  ( (tuple2!25177 (_1!12599 (_ BitVec 64)) (_2!12599 V!59825)) )
))
(declare-datatypes ((List!36517 0))(
  ( (Nil!36514) (Cons!36513 (h!37977 tuple2!25176) (t!51346 List!36517)) )
))
(declare-datatypes ((ListLongMap!22619 0))(
  ( (ListLongMap!22620 (toList!11325 List!36517)) )
))
(declare-fun lt!672583 () ListLongMap!22619)

(declare-fun contains!10326 (ListLongMap!22619 (_ BitVec 64)) Bool)

(assert (=> b!1564907 (= lt!672584 (contains!10326 lt!672583 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564907 (not (contains!10326 lt!672583 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672587 () ListLongMap!22619)

(declare-fun lt!672585 () V!59825)

(declare-fun +!5101 (ListLongMap!22619 tuple2!25176) ListLongMap!22619)

(assert (=> b!1564907 (= lt!672583 (+!5101 lt!672587 (tuple2!25177 (select (arr!50312 _keys!637) from!782) lt!672585)))))

(declare-datatypes ((Unit!51887 0))(
  ( (Unit!51888) )
))
(declare-fun lt!672586 () Unit!51887)

(declare-fun addStillNotContains!552 (ListLongMap!22619 (_ BitVec 64) V!59825 (_ BitVec 64)) Unit!51887)

(assert (=> b!1564907 (= lt!672586 (addStillNotContains!552 lt!672587 (select (arr!50312 _keys!637) from!782) lt!672585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26295 (ValueCell!18326 V!59825) V!59825)

(declare-fun dynLambda!3899 (Int (_ BitVec 64)) V!59825)

(assert (=> b!1564907 (= lt!672585 (get!26295 (select (arr!50313 _values!487) from!782) (dynLambda!3899 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59825)

(declare-fun minValue!453 () V!59825)

(declare-fun getCurrentListMapNoExtraKeys!6724 (array!104254 array!104256 (_ BitVec 32) (_ BitVec 32) V!59825 V!59825 (_ BitVec 32) Int) ListLongMap!22619)

(assert (=> b!1564907 (= lt!672587 (getCurrentListMapNoExtraKeys!6724 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564908 () Bool)

(declare-fun res!1069125 () Bool)

(assert (=> b!1564908 (=> (not res!1069125) (not e!872197))))

(assert (=> b!1564908 (= res!1069125 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50863 _keys!637)) (bvslt from!782 (size!50863 _keys!637))))))

(declare-fun b!1564909 () Bool)

(declare-fun res!1069129 () Bool)

(assert (=> b!1564909 (=> (not res!1069129) (not e!872197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104254 (_ BitVec 32)) Bool)

(assert (=> b!1564909 (= res!1069129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564910 () Bool)

(declare-fun res!1069127 () Bool)

(assert (=> b!1564910 (=> (not res!1069127) (not e!872197))))

(declare-datatypes ((List!36518 0))(
  ( (Nil!36515) (Cons!36514 (h!37978 (_ BitVec 64)) (t!51347 List!36518)) )
))
(declare-fun arrayNoDuplicates!0 (array!104254 (_ BitVec 32) List!36518) Bool)

(assert (=> b!1564910 (= res!1069127 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36515))))

(declare-fun res!1069130 () Bool)

(assert (=> start!134042 (=> (not res!1069130) (not e!872197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134042 (= res!1069130 (validMask!0 mask!947))))

(assert (=> start!134042 e!872197))

(assert (=> start!134042 tp!113265))

(assert (=> start!134042 tp_is_empty!38713))

(assert (=> start!134042 true))

(declare-fun array_inv!39355 (array!104254) Bool)

(assert (=> start!134042 (array_inv!39355 _keys!637)))

(declare-fun array_inv!39356 (array!104256) Bool)

(assert (=> start!134042 (and (array_inv!39356 _values!487) e!872194)))

(declare-fun mapIsEmpty!59445 () Bool)

(assert (=> mapIsEmpty!59445 mapRes!59445))

(assert (= (and start!134042 res!1069130) b!1564903))

(assert (= (and b!1564903 res!1069128) b!1564909))

(assert (= (and b!1564909 res!1069129) b!1564910))

(assert (= (and b!1564910 res!1069127) b!1564908))

(assert (= (and b!1564908 res!1069125) b!1564906))

(assert (= (and b!1564906 res!1069126) b!1564907))

(assert (= (and b!1564904 condMapEmpty!59445) mapIsEmpty!59445))

(assert (= (and b!1564904 (not condMapEmpty!59445)) mapNonEmpty!59445))

(get-info :version)

(assert (= (and mapNonEmpty!59445 ((_ is ValueCellFull!18326) mapValue!59445)) b!1564905))

(assert (= (and b!1564904 ((_ is ValueCellFull!18326) mapDefault!59445)) b!1564902))

(assert (= start!134042 b!1564904))

(declare-fun b_lambda!24915 () Bool)

(assert (=> (not b_lambda!24915) (not b!1564907)))

(declare-fun t!51345 () Bool)

(declare-fun tb!12583 () Bool)

(assert (=> (and start!134042 (= defaultEntry!495 defaultEntry!495) t!51345) tb!12583))

(declare-fun result!26455 () Bool)

(assert (=> tb!12583 (= result!26455 tp_is_empty!38713)))

(assert (=> b!1564907 t!51345))

(declare-fun b_and!51609 () Bool)

(assert (= b_and!51607 (and (=> t!51345 result!26455) b_and!51609)))

(declare-fun m!1440483 () Bool)

(assert (=> start!134042 m!1440483))

(declare-fun m!1440485 () Bool)

(assert (=> start!134042 m!1440485))

(declare-fun m!1440487 () Bool)

(assert (=> start!134042 m!1440487))

(declare-fun m!1440489 () Bool)

(assert (=> b!1564906 m!1440489))

(assert (=> b!1564906 m!1440489))

(declare-fun m!1440491 () Bool)

(assert (=> b!1564906 m!1440491))

(declare-fun m!1440493 () Bool)

(assert (=> b!1564907 m!1440493))

(declare-fun m!1440495 () Bool)

(assert (=> b!1564907 m!1440495))

(declare-fun m!1440497 () Bool)

(assert (=> b!1564907 m!1440497))

(assert (=> b!1564907 m!1440493))

(declare-fun m!1440499 () Bool)

(assert (=> b!1564907 m!1440499))

(assert (=> b!1564907 m!1440495))

(declare-fun m!1440501 () Bool)

(assert (=> b!1564907 m!1440501))

(declare-fun m!1440503 () Bool)

(assert (=> b!1564907 m!1440503))

(assert (=> b!1564907 m!1440489))

(declare-fun m!1440505 () Bool)

(assert (=> b!1564907 m!1440505))

(assert (=> b!1564907 m!1440489))

(declare-fun m!1440507 () Bool)

(assert (=> b!1564907 m!1440507))

(declare-fun m!1440509 () Bool)

(assert (=> b!1564909 m!1440509))

(declare-fun m!1440511 () Bool)

(assert (=> b!1564910 m!1440511))

(declare-fun m!1440513 () Bool)

(assert (=> mapNonEmpty!59445 m!1440513))

(check-sat b_and!51609 (not b_lambda!24915) tp_is_empty!38713 (not b!1564907) (not start!134042) (not b!1564910) (not mapNonEmpty!59445) (not b_next!32047) (not b!1564906) (not b!1564909))
(check-sat b_and!51609 (not b_next!32047))
