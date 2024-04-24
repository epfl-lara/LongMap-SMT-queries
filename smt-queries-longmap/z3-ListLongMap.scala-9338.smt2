; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111688 () Bool)

(assert start!111688)

(declare-fun b_free!30121 () Bool)

(declare-fun b_next!30121 () Bool)

(assert (=> start!111688 (= b_free!30121 (not b_next!30121))))

(declare-fun tp!105839 () Bool)

(declare-fun b_and!48403 () Bool)

(assert (=> start!111688 (= tp!105839 b_and!48403)))

(declare-fun b!1320634 () Bool)

(declare-fun res!876152 () Bool)

(declare-fun e!753589 () Bool)

(assert (=> b!1320634 (=> (not res!876152) (not e!753589))))

(declare-datatypes ((array!88895 0))(
  ( (array!88896 (arr!42917 (Array (_ BitVec 32) (_ BitVec 64))) (size!43468 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88895)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53025 0))(
  ( (V!53026 (val!18045 Int)) )
))
(declare-datatypes ((ValueCell!17072 0))(
  ( (ValueCellFull!17072 (v!20670 V!53025)) (EmptyCell!17072) )
))
(declare-datatypes ((array!88897 0))(
  ( (array!88898 (arr!42918 (Array (_ BitVec 32) ValueCell!17072)) (size!43469 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88897)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1320634 (= res!876152 (and (= (size!43469 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43468 _keys!1609) (size!43469 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320635 () Bool)

(declare-fun e!753588 () Bool)

(declare-fun e!753592 () Bool)

(declare-fun mapRes!55559 () Bool)

(assert (=> b!1320635 (= e!753588 (and e!753592 mapRes!55559))))

(declare-fun condMapEmpty!55559 () Bool)

(declare-fun mapDefault!55559 () ValueCell!17072)

(assert (=> b!1320635 (= condMapEmpty!55559 (= (arr!42918 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17072)) mapDefault!55559)))))

(declare-fun b!1320636 () Bool)

(declare-fun e!753591 () Bool)

(declare-fun tp_is_empty!35941 () Bool)

(assert (=> b!1320636 (= e!753591 tp_is_empty!35941)))

(declare-fun b!1320637 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1320637 (= e!753589 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23262 0))(
  ( (tuple2!23263 (_1!11642 (_ BitVec 64)) (_2!11642 V!53025)) )
))
(declare-datatypes ((List!30419 0))(
  ( (Nil!30416) (Cons!30415 (h!31633 tuple2!23262) (t!44081 List!30419)) )
))
(declare-datatypes ((ListLongMap!20927 0))(
  ( (ListLongMap!20928 (toList!10479 List!30419)) )
))
(declare-fun lt!587098 () ListLongMap!20927)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8646 (ListLongMap!20927 (_ BitVec 64)) Bool)

(assert (=> b!1320637 (contains!8646 lt!587098 k0!1164)))

(declare-fun minValue!1279 () V!53025)

(declare-datatypes ((Unit!43421 0))(
  ( (Unit!43422) )
))
(declare-fun lt!587099 () Unit!43421)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!122 ((_ BitVec 64) (_ BitVec 64) V!53025 ListLongMap!20927) Unit!43421)

(assert (=> b!1320637 (= lt!587099 (lemmaInListMapAfterAddingDiffThenInBefore!122 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587098))))

(declare-fun zeroValue!1279 () V!53025)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4567 (ListLongMap!20927 tuple2!23262) ListLongMap!20927)

(declare-fun getCurrentListMapNoExtraKeys!6206 (array!88895 array!88897 (_ BitVec 32) (_ BitVec 32) V!53025 V!53025 (_ BitVec 32) Int) ListLongMap!20927)

(declare-fun get!21602 (ValueCell!17072 V!53025) V!53025)

(declare-fun dynLambda!3521 (Int (_ BitVec 64)) V!53025)

(assert (=> b!1320637 (= lt!587098 (+!4567 (+!4567 (getCurrentListMapNoExtraKeys!6206 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23263 (select (arr!42917 _keys!1609) from!2000) (get!21602 (select (arr!42918 _values!1337) from!2000) (dynLambda!3521 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23263 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1320638 () Bool)

(declare-fun res!876153 () Bool)

(assert (=> b!1320638 (=> (not res!876153) (not e!753589))))

(declare-datatypes ((List!30420 0))(
  ( (Nil!30417) (Cons!30416 (h!31634 (_ BitVec 64)) (t!44082 List!30420)) )
))
(declare-fun arrayNoDuplicates!0 (array!88895 (_ BitVec 32) List!30420) Bool)

(assert (=> b!1320638 (= res!876153 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30417))))

(declare-fun b!1320640 () Bool)

(declare-fun res!876151 () Bool)

(assert (=> b!1320640 (=> (not res!876151) (not e!753589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320640 (= res!876151 (validKeyInArray!0 (select (arr!42917 _keys!1609) from!2000)))))

(declare-fun b!1320641 () Bool)

(declare-fun res!876147 () Bool)

(assert (=> b!1320641 (=> (not res!876147) (not e!753589))))

(assert (=> b!1320641 (= res!876147 (not (= (select (arr!42917 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55559 () Bool)

(declare-fun tp!105838 () Bool)

(assert (=> mapNonEmpty!55559 (= mapRes!55559 (and tp!105838 e!753591))))

(declare-fun mapValue!55559 () ValueCell!17072)

(declare-fun mapKey!55559 () (_ BitVec 32))

(declare-fun mapRest!55559 () (Array (_ BitVec 32) ValueCell!17072))

(assert (=> mapNonEmpty!55559 (= (arr!42918 _values!1337) (store mapRest!55559 mapKey!55559 mapValue!55559))))

(declare-fun b!1320642 () Bool)

(assert (=> b!1320642 (= e!753592 tp_is_empty!35941)))

(declare-fun b!1320643 () Bool)

(declare-fun res!876154 () Bool)

(assert (=> b!1320643 (=> (not res!876154) (not e!753589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88895 (_ BitVec 32)) Bool)

(assert (=> b!1320643 (= res!876154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55559 () Bool)

(assert (=> mapIsEmpty!55559 mapRes!55559))

(declare-fun b!1320644 () Bool)

(declare-fun res!876149 () Bool)

(assert (=> b!1320644 (=> (not res!876149) (not e!753589))))

(assert (=> b!1320644 (= res!876149 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43468 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!876148 () Bool)

(assert (=> start!111688 (=> (not res!876148) (not e!753589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111688 (= res!876148 (validMask!0 mask!2019))))

(assert (=> start!111688 e!753589))

(declare-fun array_inv!32675 (array!88895) Bool)

(assert (=> start!111688 (array_inv!32675 _keys!1609)))

(assert (=> start!111688 true))

(assert (=> start!111688 tp_is_empty!35941))

(declare-fun array_inv!32676 (array!88897) Bool)

(assert (=> start!111688 (and (array_inv!32676 _values!1337) e!753588)))

(assert (=> start!111688 tp!105839))

(declare-fun b!1320639 () Bool)

(declare-fun res!876150 () Bool)

(assert (=> b!1320639 (=> (not res!876150) (not e!753589))))

(declare-fun getCurrentListMap!5477 (array!88895 array!88897 (_ BitVec 32) (_ BitVec 32) V!53025 V!53025 (_ BitVec 32) Int) ListLongMap!20927)

(assert (=> b!1320639 (= res!876150 (contains!8646 (getCurrentListMap!5477 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111688 res!876148) b!1320634))

(assert (= (and b!1320634 res!876152) b!1320643))

(assert (= (and b!1320643 res!876154) b!1320638))

(assert (= (and b!1320638 res!876153) b!1320644))

(assert (= (and b!1320644 res!876149) b!1320639))

(assert (= (and b!1320639 res!876150) b!1320641))

(assert (= (and b!1320641 res!876147) b!1320640))

(assert (= (and b!1320640 res!876151) b!1320637))

(assert (= (and b!1320635 condMapEmpty!55559) mapIsEmpty!55559))

(assert (= (and b!1320635 (not condMapEmpty!55559)) mapNonEmpty!55559))

(get-info :version)

(assert (= (and mapNonEmpty!55559 ((_ is ValueCellFull!17072) mapValue!55559)) b!1320636))

(assert (= (and b!1320635 ((_ is ValueCellFull!17072) mapDefault!55559)) b!1320642))

(assert (= start!111688 b!1320635))

(declare-fun b_lambda!23441 () Bool)

(assert (=> (not b_lambda!23441) (not b!1320637)))

(declare-fun t!44080 () Bool)

(declare-fun tb!11465 () Bool)

(assert (=> (and start!111688 (= defaultEntry!1340 defaultEntry!1340) t!44080) tb!11465))

(declare-fun result!23993 () Bool)

(assert (=> tb!11465 (= result!23993 tp_is_empty!35941)))

(assert (=> b!1320637 t!44080))

(declare-fun b_and!48405 () Bool)

(assert (= b_and!48403 (and (=> t!44080 result!23993) b_and!48405)))

(declare-fun m!1208525 () Bool)

(assert (=> b!1320641 m!1208525))

(declare-fun m!1208527 () Bool)

(assert (=> b!1320643 m!1208527))

(assert (=> b!1320640 m!1208525))

(assert (=> b!1320640 m!1208525))

(declare-fun m!1208529 () Bool)

(assert (=> b!1320640 m!1208529))

(declare-fun m!1208531 () Bool)

(assert (=> mapNonEmpty!55559 m!1208531))

(declare-fun m!1208533 () Bool)

(assert (=> b!1320639 m!1208533))

(assert (=> b!1320639 m!1208533))

(declare-fun m!1208535 () Bool)

(assert (=> b!1320639 m!1208535))

(declare-fun m!1208537 () Bool)

(assert (=> start!111688 m!1208537))

(declare-fun m!1208539 () Bool)

(assert (=> start!111688 m!1208539))

(declare-fun m!1208541 () Bool)

(assert (=> start!111688 m!1208541))

(declare-fun m!1208543 () Bool)

(assert (=> b!1320638 m!1208543))

(declare-fun m!1208545 () Bool)

(assert (=> b!1320637 m!1208545))

(declare-fun m!1208547 () Bool)

(assert (=> b!1320637 m!1208547))

(assert (=> b!1320637 m!1208545))

(declare-fun m!1208549 () Bool)

(assert (=> b!1320637 m!1208549))

(declare-fun m!1208551 () Bool)

(assert (=> b!1320637 m!1208551))

(declare-fun m!1208553 () Bool)

(assert (=> b!1320637 m!1208553))

(assert (=> b!1320637 m!1208553))

(assert (=> b!1320637 m!1208547))

(declare-fun m!1208555 () Bool)

(assert (=> b!1320637 m!1208555))

(assert (=> b!1320637 m!1208525))

(declare-fun m!1208557 () Bool)

(assert (=> b!1320637 m!1208557))

(assert (=> b!1320637 m!1208549))

(declare-fun m!1208559 () Bool)

(assert (=> b!1320637 m!1208559))

(check-sat (not b!1320637) (not b!1320638) (not b!1320639) (not mapNonEmpty!55559) (not b_lambda!23441) (not b!1320643) tp_is_empty!35941 (not b_next!30121) (not b!1320640) (not start!111688) b_and!48405)
(check-sat b_and!48405 (not b_next!30121))
