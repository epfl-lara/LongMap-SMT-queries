; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113090 () Bool)

(assert start!113090)

(declare-fun b_free!31141 () Bool)

(declare-fun b_next!31141 () Bool)

(assert (=> start!113090 (= b_free!31141 (not b_next!31141))))

(declare-fun tp!109228 () Bool)

(declare-fun b_and!50171 () Bool)

(assert (=> start!113090 (= tp!109228 b_and!50171)))

(declare-fun mapNonEmpty!57418 () Bool)

(declare-fun mapRes!57418 () Bool)

(declare-fun tp!109229 () Bool)

(declare-fun e!763505 () Bool)

(assert (=> mapNonEmpty!57418 (= mapRes!57418 (and tp!109229 e!763505))))

(declare-datatypes ((V!54625 0))(
  ( (V!54626 (val!18645 Int)) )
))
(declare-datatypes ((ValueCell!17672 0))(
  ( (ValueCellFull!17672 (v!21292 V!54625)) (EmptyCell!17672) )
))
(declare-fun mapValue!57418 () ValueCell!17672)

(declare-fun mapKey!57418 () (_ BitVec 32))

(declare-datatypes ((array!91077 0))(
  ( (array!91078 (arr!43995 (Array (_ BitVec 32) ValueCell!17672)) (size!44547 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91077)

(declare-fun mapRest!57418 () (Array (_ BitVec 32) ValueCell!17672))

(assert (=> mapNonEmpty!57418 (= (arr!43995 _values!1303) (store mapRest!57418 mapKey!57418 mapValue!57418))))

(declare-fun b!1340503 () Bool)

(declare-fun res!889276 () Bool)

(declare-fun e!763501 () Bool)

(assert (=> b!1340503 (=> (not res!889276) (not e!763501))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91079 0))(
  ( (array!91080 (arr!43996 (Array (_ BitVec 32) (_ BitVec 64))) (size!44548 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91079)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340503 (= res!889276 (and (= (size!44547 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44548 _keys!1571) (size!44547 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340504 () Bool)

(declare-fun tp_is_empty!37141 () Bool)

(assert (=> b!1340504 (= e!763505 tp_is_empty!37141)))

(declare-fun b!1340505 () Bool)

(assert (=> b!1340505 (= e!763501 (not true))))

(declare-datatypes ((tuple2!24054 0))(
  ( (tuple2!24055 (_1!12038 (_ BitVec 64)) (_2!12038 V!54625)) )
))
(declare-datatypes ((List!31205 0))(
  ( (Nil!31202) (Cons!31201 (h!32410 tuple2!24054) (t!45549 List!31205)) )
))
(declare-datatypes ((ListLongMap!21711 0))(
  ( (ListLongMap!21712 (toList!10871 List!31205)) )
))
(declare-fun lt!593823 () ListLongMap!21711)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!8976 (ListLongMap!21711 (_ BitVec 64)) Bool)

(assert (=> b!1340505 (contains!8976 lt!593823 k0!1142)))

(declare-datatypes ((Unit!43800 0))(
  ( (Unit!43801) )
))
(declare-fun lt!593822 () Unit!43800)

(declare-fun zeroValue!1245 () V!54625)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!318 ((_ BitVec 64) (_ BitVec 64) V!54625 ListLongMap!21711) Unit!43800)

(assert (=> b!1340505 (= lt!593822 (lemmaInListMapAfterAddingDiffThenInBefore!318 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593823))))

(declare-fun minValue!1245 () V!54625)

(declare-fun defaultEntry!1306 () Int)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun +!4779 (ListLongMap!21711 tuple2!24054) ListLongMap!21711)

(declare-fun getCurrentListMapNoExtraKeys!6422 (array!91079 array!91077 (_ BitVec 32) (_ BitVec 32) V!54625 V!54625 (_ BitVec 32) Int) ListLongMap!21711)

(declare-fun get!22199 (ValueCell!17672 V!54625) V!54625)

(declare-fun dynLambda!3709 (Int (_ BitVec 64)) V!54625)

(assert (=> b!1340505 (= lt!593823 (+!4779 (getCurrentListMapNoExtraKeys!6422 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24055 (select (arr!43996 _keys!1571) from!1960) (get!22199 (select (arr!43995 _values!1303) from!1960) (dynLambda!3709 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340506 () Bool)

(declare-fun res!889273 () Bool)

(assert (=> b!1340506 (=> (not res!889273) (not e!763501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91079 (_ BitVec 32)) Bool)

(assert (=> b!1340506 (= res!889273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340507 () Bool)

(declare-fun res!889278 () Bool)

(assert (=> b!1340507 (=> (not res!889278) (not e!763501))))

(assert (=> b!1340507 (= res!889278 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44548 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340508 () Bool)

(declare-fun res!889274 () Bool)

(assert (=> b!1340508 (=> (not res!889274) (not e!763501))))

(assert (=> b!1340508 (= res!889274 (not (= (select (arr!43996 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57418 () Bool)

(assert (=> mapIsEmpty!57418 mapRes!57418))

(declare-fun res!889271 () Bool)

(assert (=> start!113090 (=> (not res!889271) (not e!763501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113090 (= res!889271 (validMask!0 mask!1977))))

(assert (=> start!113090 e!763501))

(assert (=> start!113090 tp_is_empty!37141))

(assert (=> start!113090 true))

(declare-fun array_inv!33361 (array!91079) Bool)

(assert (=> start!113090 (array_inv!33361 _keys!1571)))

(declare-fun e!763503 () Bool)

(declare-fun array_inv!33362 (array!91077) Bool)

(assert (=> start!113090 (and (array_inv!33362 _values!1303) e!763503)))

(assert (=> start!113090 tp!109228))

(declare-fun b!1340509 () Bool)

(declare-fun res!889279 () Bool)

(assert (=> b!1340509 (=> (not res!889279) (not e!763501))))

(declare-datatypes ((List!31206 0))(
  ( (Nil!31203) (Cons!31202 (h!32411 (_ BitVec 64)) (t!45550 List!31206)) )
))
(declare-fun arrayNoDuplicates!0 (array!91079 (_ BitVec 32) List!31206) Bool)

(assert (=> b!1340509 (= res!889279 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31203))))

(declare-fun b!1340510 () Bool)

(declare-fun e!763504 () Bool)

(assert (=> b!1340510 (= e!763504 tp_is_empty!37141)))

(declare-fun b!1340511 () Bool)

(declare-fun res!889275 () Bool)

(assert (=> b!1340511 (=> (not res!889275) (not e!763501))))

(assert (=> b!1340511 (= res!889275 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340512 () Bool)

(declare-fun res!889277 () Bool)

(assert (=> b!1340512 (=> (not res!889277) (not e!763501))))

(declare-fun getCurrentListMap!5724 (array!91079 array!91077 (_ BitVec 32) (_ BitVec 32) V!54625 V!54625 (_ BitVec 32) Int) ListLongMap!21711)

(assert (=> b!1340512 (= res!889277 (contains!8976 (getCurrentListMap!5724 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1340513 () Bool)

(declare-fun res!889272 () Bool)

(assert (=> b!1340513 (=> (not res!889272) (not e!763501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340513 (= res!889272 (validKeyInArray!0 (select (arr!43996 _keys!1571) from!1960)))))

(declare-fun b!1340514 () Bool)

(assert (=> b!1340514 (= e!763503 (and e!763504 mapRes!57418))))

(declare-fun condMapEmpty!57418 () Bool)

(declare-fun mapDefault!57418 () ValueCell!17672)

(assert (=> b!1340514 (= condMapEmpty!57418 (= (arr!43995 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17672)) mapDefault!57418)))))

(assert (= (and start!113090 res!889271) b!1340503))

(assert (= (and b!1340503 res!889276) b!1340506))

(assert (= (and b!1340506 res!889273) b!1340509))

(assert (= (and b!1340509 res!889279) b!1340507))

(assert (= (and b!1340507 res!889278) b!1340512))

(assert (= (and b!1340512 res!889277) b!1340508))

(assert (= (and b!1340508 res!889274) b!1340513))

(assert (= (and b!1340513 res!889272) b!1340511))

(assert (= (and b!1340511 res!889275) b!1340505))

(assert (= (and b!1340514 condMapEmpty!57418) mapIsEmpty!57418))

(assert (= (and b!1340514 (not condMapEmpty!57418)) mapNonEmpty!57418))

(get-info :version)

(assert (= (and mapNonEmpty!57418 ((_ is ValueCellFull!17672) mapValue!57418)) b!1340504))

(assert (= (and b!1340514 ((_ is ValueCellFull!17672) mapDefault!57418)) b!1340510))

(assert (= start!113090 b!1340514))

(declare-fun b_lambda!24307 () Bool)

(assert (=> (not b_lambda!24307) (not b!1340505)))

(declare-fun t!45548 () Bool)

(declare-fun tb!12147 () Bool)

(assert (=> (and start!113090 (= defaultEntry!1306 defaultEntry!1306) t!45548) tb!12147))

(declare-fun result!25393 () Bool)

(assert (=> tb!12147 (= result!25393 tp_is_empty!37141)))

(assert (=> b!1340505 t!45548))

(declare-fun b_and!50173 () Bool)

(assert (= b_and!50171 (and (=> t!45548 result!25393) b_and!50173)))

(declare-fun m!1227799 () Bool)

(assert (=> b!1340506 m!1227799))

(declare-fun m!1227801 () Bool)

(assert (=> b!1340513 m!1227801))

(assert (=> b!1340513 m!1227801))

(declare-fun m!1227803 () Bool)

(assert (=> b!1340513 m!1227803))

(declare-fun m!1227805 () Bool)

(assert (=> b!1340509 m!1227805))

(assert (=> b!1340508 m!1227801))

(declare-fun m!1227807 () Bool)

(assert (=> mapNonEmpty!57418 m!1227807))

(declare-fun m!1227809 () Bool)

(assert (=> b!1340505 m!1227809))

(declare-fun m!1227811 () Bool)

(assert (=> b!1340505 m!1227811))

(declare-fun m!1227813 () Bool)

(assert (=> b!1340505 m!1227813))

(declare-fun m!1227815 () Bool)

(assert (=> b!1340505 m!1227815))

(assert (=> b!1340505 m!1227809))

(declare-fun m!1227817 () Bool)

(assert (=> b!1340505 m!1227817))

(assert (=> b!1340505 m!1227811))

(assert (=> b!1340505 m!1227801))

(declare-fun m!1227819 () Bool)

(assert (=> b!1340505 m!1227819))

(assert (=> b!1340505 m!1227813))

(declare-fun m!1227821 () Bool)

(assert (=> b!1340505 m!1227821))

(declare-fun m!1227823 () Bool)

(assert (=> b!1340512 m!1227823))

(assert (=> b!1340512 m!1227823))

(declare-fun m!1227825 () Bool)

(assert (=> b!1340512 m!1227825))

(declare-fun m!1227827 () Bool)

(assert (=> start!113090 m!1227827))

(declare-fun m!1227829 () Bool)

(assert (=> start!113090 m!1227829))

(declare-fun m!1227831 () Bool)

(assert (=> start!113090 m!1227831))

(check-sat (not b_lambda!24307) (not mapNonEmpty!57418) (not b!1340513) (not b!1340509) (not b!1340512) (not b!1340506) b_and!50173 (not b!1340505) tp_is_empty!37141 (not b_next!31141) (not start!113090))
(check-sat b_and!50173 (not b_next!31141))
