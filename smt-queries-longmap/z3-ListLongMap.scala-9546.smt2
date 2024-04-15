; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113138 () Bool)

(assert start!113138)

(declare-fun b_free!31189 () Bool)

(declare-fun b_next!31189 () Bool)

(assert (=> start!113138 (= b_free!31189 (not b_next!31189))))

(declare-fun tp!109373 () Bool)

(declare-fun b_and!50267 () Bool)

(assert (=> start!113138 (= tp!109373 b_and!50267)))

(declare-fun b!1341415 () Bool)

(declare-fun res!889919 () Bool)

(declare-fun e!763864 () Bool)

(assert (=> b!1341415 (=> (not res!889919) (not e!763864))))

(declare-datatypes ((array!91171 0))(
  ( (array!91172 (arr!44042 (Array (_ BitVec 32) (_ BitVec 64))) (size!44594 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91171)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341415 (= res!889919 (validKeyInArray!0 (select (arr!44042 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57490 () Bool)

(declare-fun mapRes!57490 () Bool)

(assert (=> mapIsEmpty!57490 mapRes!57490))

(declare-fun b!1341416 () Bool)

(declare-fun e!763862 () Bool)

(declare-fun tp_is_empty!37189 () Bool)

(assert (=> b!1341416 (= e!763862 tp_is_empty!37189)))

(declare-fun b!1341417 () Bool)

(declare-fun res!889922 () Bool)

(assert (=> b!1341417 (=> (not res!889922) (not e!763864))))

(declare-datatypes ((V!54689 0))(
  ( (V!54690 (val!18669 Int)) )
))
(declare-fun minValue!1245 () V!54689)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54689)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17696 0))(
  ( (ValueCellFull!17696 (v!21316 V!54689)) (EmptyCell!17696) )
))
(declare-datatypes ((array!91173 0))(
  ( (array!91174 (arr!44043 (Array (_ BitVec 32) ValueCell!17696)) (size!44595 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91173)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24092 0))(
  ( (tuple2!24093 (_1!12057 (_ BitVec 64)) (_2!12057 V!54689)) )
))
(declare-datatypes ((List!31242 0))(
  ( (Nil!31239) (Cons!31238 (h!32447 tuple2!24092) (t!45634 List!31242)) )
))
(declare-datatypes ((ListLongMap!21749 0))(
  ( (ListLongMap!21750 (toList!10890 List!31242)) )
))
(declare-fun contains!8995 (ListLongMap!21749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5743 (array!91171 array!91173 (_ BitVec 32) (_ BitVec 32) V!54689 V!54689 (_ BitVec 32) Int) ListLongMap!21749)

(assert (=> b!1341417 (= res!889922 (contains!8995 (getCurrentListMap!5743 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341419 () Bool)

(declare-fun res!889926 () Bool)

(assert (=> b!1341419 (=> (not res!889926) (not e!763864))))

(assert (=> b!1341419 (= res!889926 (not (= (select (arr!44042 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341420 () Bool)

(declare-fun e!763863 () Bool)

(assert (=> b!1341420 (= e!763863 (and e!763862 mapRes!57490))))

(declare-fun condMapEmpty!57490 () Bool)

(declare-fun mapDefault!57490 () ValueCell!17696)

(assert (=> b!1341420 (= condMapEmpty!57490 (= (arr!44043 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17696)) mapDefault!57490)))))

(declare-fun b!1341421 () Bool)

(declare-fun res!889924 () Bool)

(assert (=> b!1341421 (=> (not res!889924) (not e!763864))))

(declare-datatypes ((List!31243 0))(
  ( (Nil!31240) (Cons!31239 (h!32448 (_ BitVec 64)) (t!45635 List!31243)) )
))
(declare-fun arrayNoDuplicates!0 (array!91171 (_ BitVec 32) List!31243) Bool)

(assert (=> b!1341421 (= res!889924 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31240))))

(declare-fun mapNonEmpty!57490 () Bool)

(declare-fun tp!109372 () Bool)

(declare-fun e!763865 () Bool)

(assert (=> mapNonEmpty!57490 (= mapRes!57490 (and tp!109372 e!763865))))

(declare-fun mapKey!57490 () (_ BitVec 32))

(declare-fun mapValue!57490 () ValueCell!17696)

(declare-fun mapRest!57490 () (Array (_ BitVec 32) ValueCell!17696))

(assert (=> mapNonEmpty!57490 (= (arr!44043 _values!1303) (store mapRest!57490 mapKey!57490 mapValue!57490))))

(declare-fun b!1341422 () Bool)

(declare-fun res!889921 () Bool)

(assert (=> b!1341422 (=> (not res!889921) (not e!763864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91171 (_ BitVec 32)) Bool)

(assert (=> b!1341422 (= res!889921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341423 () Bool)

(assert (=> b!1341423 (= e!763865 tp_is_empty!37189)))

(declare-fun b!1341424 () Bool)

(declare-fun res!889925 () Bool)

(assert (=> b!1341424 (=> (not res!889925) (not e!763864))))

(assert (=> b!1341424 (= res!889925 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341425 () Bool)

(assert (=> b!1341425 (= e!763864 (not true))))

(declare-fun lt!593966 () ListLongMap!21749)

(assert (=> b!1341425 (contains!8995 lt!593966 k0!1142)))

(declare-datatypes ((Unit!43834 0))(
  ( (Unit!43835) )
))
(declare-fun lt!593967 () Unit!43834)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!335 ((_ BitVec 64) (_ BitVec 64) V!54689 ListLongMap!21749) Unit!43834)

(assert (=> b!1341425 (= lt!593967 (lemmaInListMapAfterAddingDiffThenInBefore!335 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593966))))

(declare-fun +!4796 (ListLongMap!21749 tuple2!24092) ListLongMap!21749)

(declare-fun getCurrentListMapNoExtraKeys!6439 (array!91171 array!91173 (_ BitVec 32) (_ BitVec 32) V!54689 V!54689 (_ BitVec 32) Int) ListLongMap!21749)

(declare-fun get!22232 (ValueCell!17696 V!54689) V!54689)

(declare-fun dynLambda!3726 (Int (_ BitVec 64)) V!54689)

(assert (=> b!1341425 (= lt!593966 (+!4796 (getCurrentListMapNoExtraKeys!6439 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24093 (select (arr!44042 _keys!1571) from!1960) (get!22232 (select (arr!44043 _values!1303) from!1960) (dynLambda!3726 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341426 () Bool)

(declare-fun res!889927 () Bool)

(assert (=> b!1341426 (=> (not res!889927) (not e!763864))))

(assert (=> b!1341426 (= res!889927 (and (= (size!44595 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44594 _keys!1571) (size!44595 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341418 () Bool)

(declare-fun res!889923 () Bool)

(assert (=> b!1341418 (=> (not res!889923) (not e!763864))))

(assert (=> b!1341418 (= res!889923 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44594 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!889920 () Bool)

(assert (=> start!113138 (=> (not res!889920) (not e!763864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113138 (= res!889920 (validMask!0 mask!1977))))

(assert (=> start!113138 e!763864))

(assert (=> start!113138 tp_is_empty!37189))

(assert (=> start!113138 true))

(declare-fun array_inv!33395 (array!91171) Bool)

(assert (=> start!113138 (array_inv!33395 _keys!1571)))

(declare-fun array_inv!33396 (array!91173) Bool)

(assert (=> start!113138 (and (array_inv!33396 _values!1303) e!763863)))

(assert (=> start!113138 tp!109373))

(assert (= (and start!113138 res!889920) b!1341426))

(assert (= (and b!1341426 res!889927) b!1341422))

(assert (= (and b!1341422 res!889921) b!1341421))

(assert (= (and b!1341421 res!889924) b!1341418))

(assert (= (and b!1341418 res!889923) b!1341417))

(assert (= (and b!1341417 res!889922) b!1341419))

(assert (= (and b!1341419 res!889926) b!1341415))

(assert (= (and b!1341415 res!889919) b!1341424))

(assert (= (and b!1341424 res!889925) b!1341425))

(assert (= (and b!1341420 condMapEmpty!57490) mapIsEmpty!57490))

(assert (= (and b!1341420 (not condMapEmpty!57490)) mapNonEmpty!57490))

(get-info :version)

(assert (= (and mapNonEmpty!57490 ((_ is ValueCellFull!17696) mapValue!57490)) b!1341423))

(assert (= (and b!1341420 ((_ is ValueCellFull!17696) mapDefault!57490)) b!1341416))

(assert (= start!113138 b!1341420))

(declare-fun b_lambda!24355 () Bool)

(assert (=> (not b_lambda!24355) (not b!1341425)))

(declare-fun t!45633 () Bool)

(declare-fun tb!12195 () Bool)

(assert (=> (and start!113138 (= defaultEntry!1306 defaultEntry!1306) t!45633) tb!12195))

(declare-fun result!25489 () Bool)

(assert (=> tb!12195 (= result!25489 tp_is_empty!37189)))

(assert (=> b!1341425 t!45633))

(declare-fun b_and!50269 () Bool)

(assert (= b_and!50267 (and (=> t!45633 result!25489) b_and!50269)))

(declare-fun m!1228615 () Bool)

(assert (=> b!1341422 m!1228615))

(declare-fun m!1228617 () Bool)

(assert (=> mapNonEmpty!57490 m!1228617))

(declare-fun m!1228619 () Bool)

(assert (=> b!1341417 m!1228619))

(assert (=> b!1341417 m!1228619))

(declare-fun m!1228621 () Bool)

(assert (=> b!1341417 m!1228621))

(declare-fun m!1228623 () Bool)

(assert (=> b!1341421 m!1228623))

(declare-fun m!1228625 () Bool)

(assert (=> start!113138 m!1228625))

(declare-fun m!1228627 () Bool)

(assert (=> start!113138 m!1228627))

(declare-fun m!1228629 () Bool)

(assert (=> start!113138 m!1228629))

(declare-fun m!1228631 () Bool)

(assert (=> b!1341415 m!1228631))

(assert (=> b!1341415 m!1228631))

(declare-fun m!1228633 () Bool)

(assert (=> b!1341415 m!1228633))

(declare-fun m!1228635 () Bool)

(assert (=> b!1341425 m!1228635))

(declare-fun m!1228637 () Bool)

(assert (=> b!1341425 m!1228637))

(declare-fun m!1228639 () Bool)

(assert (=> b!1341425 m!1228639))

(declare-fun m!1228641 () Bool)

(assert (=> b!1341425 m!1228641))

(assert (=> b!1341425 m!1228635))

(declare-fun m!1228643 () Bool)

(assert (=> b!1341425 m!1228643))

(assert (=> b!1341425 m!1228637))

(declare-fun m!1228645 () Bool)

(assert (=> b!1341425 m!1228645))

(assert (=> b!1341425 m!1228639))

(assert (=> b!1341425 m!1228631))

(declare-fun m!1228647 () Bool)

(assert (=> b!1341425 m!1228647))

(assert (=> b!1341419 m!1228631))

(check-sat (not b_lambda!24355) (not b!1341425) b_and!50269 (not b!1341421) (not start!113138) (not b!1341415) (not b!1341422) (not mapNonEmpty!57490) tp_is_empty!37189 (not b!1341417) (not b_next!31189))
(check-sat b_and!50269 (not b_next!31189))
