; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113360 () Bool)

(assert start!113360)

(declare-fun b_free!31411 () Bool)

(declare-fun b_next!31411 () Bool)

(assert (=> start!113360 (= b_free!31411 (not b_next!31411))))

(declare-fun tp!110038 () Bool)

(declare-fun b_and!50657 () Bool)

(assert (=> start!113360 (= tp!110038 b_and!50657)))

(declare-fun b!1345376 () Bool)

(declare-fun res!892716 () Bool)

(declare-fun e!765577 () Bool)

(assert (=> b!1345376 (=> (not res!892716) (not e!765577))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91605 0))(
  ( (array!91606 (arr!44259 (Array (_ BitVec 32) (_ BitVec 64))) (size!44811 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91605)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345376 (= res!892716 (not (= (select (arr!44259 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345377 () Bool)

(declare-fun res!892720 () Bool)

(assert (=> b!1345377 (=> (not res!892720) (not e!765577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345377 (= res!892720 (validKeyInArray!0 (select (arr!44259 _keys!1571) from!1960)))))

(declare-fun b!1345378 () Bool)

(declare-fun res!892718 () Bool)

(assert (=> b!1345378 (=> (not res!892718) (not e!765577))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345378 (= res!892718 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345379 () Bool)

(declare-fun e!765574 () Bool)

(declare-fun e!765573 () Bool)

(declare-fun mapRes!57823 () Bool)

(assert (=> b!1345379 (= e!765574 (and e!765573 mapRes!57823))))

(declare-fun condMapEmpty!57823 () Bool)

(declare-datatypes ((V!54985 0))(
  ( (V!54986 (val!18780 Int)) )
))
(declare-datatypes ((ValueCell!17807 0))(
  ( (ValueCellFull!17807 (v!21427 V!54985)) (EmptyCell!17807) )
))
(declare-datatypes ((array!91607 0))(
  ( (array!91608 (arr!44260 (Array (_ BitVec 32) ValueCell!17807)) (size!44812 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91607)

(declare-fun mapDefault!57823 () ValueCell!17807)

(assert (=> b!1345379 (= condMapEmpty!57823 (= (arr!44260 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17807)) mapDefault!57823)))))

(declare-fun b!1345380 () Bool)

(declare-fun res!892723 () Bool)

(assert (=> b!1345380 (=> (not res!892723) (not e!765577))))

(declare-datatypes ((List!31408 0))(
  ( (Nil!31405) (Cons!31404 (h!32613 (_ BitVec 64)) (t!45968 List!31408)) )
))
(declare-fun arrayNoDuplicates!0 (array!91605 (_ BitVec 32) List!31408) Bool)

(assert (=> b!1345380 (= res!892723 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31405))))

(declare-fun mapNonEmpty!57823 () Bool)

(declare-fun tp!110039 () Bool)

(declare-fun e!765578 () Bool)

(assert (=> mapNonEmpty!57823 (= mapRes!57823 (and tp!110039 e!765578))))

(declare-fun mapValue!57823 () ValueCell!17807)

(declare-fun mapRest!57823 () (Array (_ BitVec 32) ValueCell!17807))

(declare-fun mapKey!57823 () (_ BitVec 32))

(assert (=> mapNonEmpty!57823 (= (arr!44260 _values!1303) (store mapRest!57823 mapKey!57823 mapValue!57823))))

(declare-fun b!1345381 () Bool)

(declare-fun tp_is_empty!37411 () Bool)

(assert (=> b!1345381 (= e!765573 tp_is_empty!37411)))

(declare-fun b!1345382 () Bool)

(declare-fun e!765575 () Bool)

(assert (=> b!1345382 (= e!765575 (not true))))

(declare-datatypes ((tuple2!24272 0))(
  ( (tuple2!24273 (_1!12147 (_ BitVec 64)) (_2!12147 V!54985)) )
))
(declare-datatypes ((List!31409 0))(
  ( (Nil!31406) (Cons!31405 (h!32614 tuple2!24272) (t!45969 List!31409)) )
))
(declare-datatypes ((ListLongMap!21929 0))(
  ( (ListLongMap!21930 (toList!10980 List!31409)) )
))
(declare-fun lt!595166 () ListLongMap!21929)

(declare-fun contains!9085 (ListLongMap!21929 (_ BitVec 64)) Bool)

(assert (=> b!1345382 (contains!9085 lt!595166 k0!1142)))

(declare-fun lt!595165 () V!54985)

(declare-datatypes ((Unit!43950 0))(
  ( (Unit!43951) )
))
(declare-fun lt!595167 () Unit!43950)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!393 ((_ BitVec 64) (_ BitVec 64) V!54985 ListLongMap!21929) Unit!43950)

(assert (=> b!1345382 (= lt!595167 (lemmaInListMapAfterAddingDiffThenInBefore!393 k0!1142 (select (arr!44259 _keys!1571) from!1960) lt!595165 lt!595166))))

(declare-fun res!892717 () Bool)

(assert (=> start!113360 (=> (not res!892717) (not e!765577))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113360 (= res!892717 (validMask!0 mask!1977))))

(assert (=> start!113360 e!765577))

(assert (=> start!113360 tp_is_empty!37411))

(assert (=> start!113360 true))

(declare-fun array_inv!33549 (array!91605) Bool)

(assert (=> start!113360 (array_inv!33549 _keys!1571)))

(declare-fun array_inv!33550 (array!91607) Bool)

(assert (=> start!113360 (and (array_inv!33550 _values!1303) e!765574)))

(assert (=> start!113360 tp!110038))

(declare-fun b!1345383 () Bool)

(assert (=> b!1345383 (= e!765577 e!765575)))

(declare-fun res!892719 () Bool)

(assert (=> b!1345383 (=> (not res!892719) (not e!765575))))

(declare-fun +!4857 (ListLongMap!21929 tuple2!24272) ListLongMap!21929)

(assert (=> b!1345383 (= res!892719 (contains!9085 (+!4857 lt!595166 (tuple2!24273 (select (arr!44259 _keys!1571) from!1960) lt!595165)) k0!1142))))

(declare-fun minValue!1245 () V!54985)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!54985)

(declare-fun getCurrentListMapNoExtraKeys!6500 (array!91605 array!91607 (_ BitVec 32) (_ BitVec 32) V!54985 V!54985 (_ BitVec 32) Int) ListLongMap!21929)

(assert (=> b!1345383 (= lt!595166 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22367 (ValueCell!17807 V!54985) V!54985)

(declare-fun dynLambda!3787 (Int (_ BitVec 64)) V!54985)

(assert (=> b!1345383 (= lt!595165 (get!22367 (select (arr!44260 _values!1303) from!1960) (dynLambda!3787 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57823 () Bool)

(assert (=> mapIsEmpty!57823 mapRes!57823))

(declare-fun b!1345384 () Bool)

(assert (=> b!1345384 (= e!765578 tp_is_empty!37411)))

(declare-fun b!1345385 () Bool)

(declare-fun res!892721 () Bool)

(assert (=> b!1345385 (=> (not res!892721) (not e!765577))))

(declare-fun getCurrentListMap!5822 (array!91605 array!91607 (_ BitVec 32) (_ BitVec 32) V!54985 V!54985 (_ BitVec 32) Int) ListLongMap!21929)

(assert (=> b!1345385 (= res!892721 (contains!9085 (getCurrentListMap!5822 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345386 () Bool)

(declare-fun res!892714 () Bool)

(assert (=> b!1345386 (=> (not res!892714) (not e!765577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91605 (_ BitVec 32)) Bool)

(assert (=> b!1345386 (= res!892714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345387 () Bool)

(declare-fun res!892715 () Bool)

(assert (=> b!1345387 (=> (not res!892715) (not e!765577))))

(assert (=> b!1345387 (= res!892715 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44811 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345388 () Bool)

(declare-fun res!892722 () Bool)

(assert (=> b!1345388 (=> (not res!892722) (not e!765575))))

(assert (=> b!1345388 (= res!892722 (not (= k0!1142 (select (arr!44259 _keys!1571) from!1960))))))

(declare-fun b!1345389 () Bool)

(declare-fun res!892713 () Bool)

(assert (=> b!1345389 (=> (not res!892713) (not e!765577))))

(assert (=> b!1345389 (= res!892713 (and (= (size!44812 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44811 _keys!1571) (size!44812 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113360 res!892717) b!1345389))

(assert (= (and b!1345389 res!892713) b!1345386))

(assert (= (and b!1345386 res!892714) b!1345380))

(assert (= (and b!1345380 res!892723) b!1345387))

(assert (= (and b!1345387 res!892715) b!1345385))

(assert (= (and b!1345385 res!892721) b!1345376))

(assert (= (and b!1345376 res!892716) b!1345377))

(assert (= (and b!1345377 res!892720) b!1345378))

(assert (= (and b!1345378 res!892718) b!1345383))

(assert (= (and b!1345383 res!892719) b!1345388))

(assert (= (and b!1345388 res!892722) b!1345382))

(assert (= (and b!1345379 condMapEmpty!57823) mapIsEmpty!57823))

(assert (= (and b!1345379 (not condMapEmpty!57823)) mapNonEmpty!57823))

(get-info :version)

(assert (= (and mapNonEmpty!57823 ((_ is ValueCellFull!17807) mapValue!57823)) b!1345384))

(assert (= (and b!1345379 ((_ is ValueCellFull!17807) mapDefault!57823)) b!1345381))

(assert (= start!113360 b!1345379))

(declare-fun b_lambda!24523 () Bool)

(assert (=> (not b_lambda!24523) (not b!1345383)))

(declare-fun t!45967 () Bool)

(declare-fun tb!12363 () Bool)

(assert (=> (and start!113360 (= defaultEntry!1306 defaultEntry!1306) t!45967) tb!12363))

(declare-fun result!25825 () Bool)

(assert (=> tb!12363 (= result!25825 tp_is_empty!37411)))

(assert (=> b!1345383 t!45967))

(declare-fun b_and!50659 () Bool)

(assert (= b_and!50657 (and (=> t!45967 result!25825) b_and!50659)))

(declare-fun m!1232323 () Bool)

(assert (=> b!1345376 m!1232323))

(declare-fun m!1232325 () Bool)

(assert (=> start!113360 m!1232325))

(declare-fun m!1232327 () Bool)

(assert (=> start!113360 m!1232327))

(declare-fun m!1232329 () Bool)

(assert (=> start!113360 m!1232329))

(declare-fun m!1232331 () Bool)

(assert (=> b!1345383 m!1232331))

(declare-fun m!1232333 () Bool)

(assert (=> b!1345383 m!1232333))

(declare-fun m!1232335 () Bool)

(assert (=> b!1345383 m!1232335))

(declare-fun m!1232337 () Bool)

(assert (=> b!1345383 m!1232337))

(declare-fun m!1232339 () Bool)

(assert (=> b!1345383 m!1232339))

(declare-fun m!1232341 () Bool)

(assert (=> b!1345383 m!1232341))

(assert (=> b!1345383 m!1232337))

(assert (=> b!1345383 m!1232339))

(assert (=> b!1345383 m!1232323))

(assert (=> b!1345383 m!1232331))

(declare-fun m!1232343 () Bool)

(assert (=> b!1345380 m!1232343))

(declare-fun m!1232345 () Bool)

(assert (=> b!1345386 m!1232345))

(declare-fun m!1232347 () Bool)

(assert (=> mapNonEmpty!57823 m!1232347))

(assert (=> b!1345388 m!1232323))

(declare-fun m!1232349 () Bool)

(assert (=> b!1345385 m!1232349))

(assert (=> b!1345385 m!1232349))

(declare-fun m!1232351 () Bool)

(assert (=> b!1345385 m!1232351))

(assert (=> b!1345377 m!1232323))

(assert (=> b!1345377 m!1232323))

(declare-fun m!1232353 () Bool)

(assert (=> b!1345377 m!1232353))

(declare-fun m!1232355 () Bool)

(assert (=> b!1345382 m!1232355))

(assert (=> b!1345382 m!1232323))

(assert (=> b!1345382 m!1232323))

(declare-fun m!1232357 () Bool)

(assert (=> b!1345382 m!1232357))

(check-sat (not b!1345383) (not start!113360) (not b!1345382) (not b!1345380) (not b_next!31411) (not b!1345385) tp_is_empty!37411 (not mapNonEmpty!57823) (not b!1345377) (not b_lambda!24523) (not b!1345386) b_and!50659)
(check-sat b_and!50659 (not b_next!31411))
