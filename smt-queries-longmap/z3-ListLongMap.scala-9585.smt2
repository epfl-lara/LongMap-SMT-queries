; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113596 () Bool)

(assert start!113596)

(declare-fun b_free!31423 () Bool)

(declare-fun b_next!31423 () Bool)

(assert (=> start!113596 (= b_free!31423 (not b_next!31423))))

(declare-fun tp!110074 () Bool)

(declare-fun b_and!50701 () Bool)

(assert (=> start!113596 (= tp!110074 b_and!50701)))

(declare-fun b!1347010 () Bool)

(declare-fun res!893463 () Bool)

(declare-fun e!766557 () Bool)

(assert (=> b!1347010 (=> (not res!893463) (not e!766557))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91791 0))(
  ( (array!91792 (arr!44347 (Array (_ BitVec 32) (_ BitVec 64))) (size!44898 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91791)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347010 (= res!893463 (not (= (select (arr!44347 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1347011 () Bool)

(declare-fun e!766561 () Bool)

(declare-fun tp_is_empty!37423 () Bool)

(assert (=> b!1347011 (= e!766561 tp_is_empty!37423)))

(declare-fun b!1347012 () Bool)

(declare-fun e!766560 () Bool)

(declare-fun e!766559 () Bool)

(declare-fun mapRes!57841 () Bool)

(assert (=> b!1347012 (= e!766560 (and e!766559 mapRes!57841))))

(declare-fun condMapEmpty!57841 () Bool)

(declare-datatypes ((V!55001 0))(
  ( (V!55002 (val!18786 Int)) )
))
(declare-datatypes ((ValueCell!17813 0))(
  ( (ValueCellFull!17813 (v!21429 V!55001)) (EmptyCell!17813) )
))
(declare-datatypes ((array!91793 0))(
  ( (array!91794 (arr!44348 (Array (_ BitVec 32) ValueCell!17813)) (size!44899 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91793)

(declare-fun mapDefault!57841 () ValueCell!17813)

(assert (=> b!1347012 (= condMapEmpty!57841 (= (arr!44348 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17813)) mapDefault!57841)))))

(declare-fun b!1347013 () Bool)

(declare-fun res!893462 () Bool)

(assert (=> b!1347013 (=> (not res!893462) (not e!766557))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1347013 (= res!893462 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1347014 () Bool)

(declare-fun res!893467 () Bool)

(assert (=> b!1347014 (=> (not res!893467) (not e!766557))))

(declare-datatypes ((List!31400 0))(
  ( (Nil!31397) (Cons!31396 (h!32614 (_ BitVec 64)) (t!45972 List!31400)) )
))
(declare-fun arrayNoDuplicates!0 (array!91791 (_ BitVec 32) List!31400) Bool)

(assert (=> b!1347014 (= res!893467 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31397))))

(declare-fun b!1347015 () Bool)

(assert (=> b!1347015 (= e!766559 tp_is_empty!37423)))

(declare-fun b!1347016 () Bool)

(declare-fun res!893460 () Bool)

(assert (=> b!1347016 (=> (not res!893460) (not e!766557))))

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1347016 (= res!893460 (and (= (size!44899 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44898 _keys!1571) (size!44899 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347017 () Bool)

(declare-fun res!893466 () Bool)

(assert (=> b!1347017 (=> (not res!893466) (not e!766557))))

(assert (=> b!1347017 (= res!893466 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44898 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347018 () Bool)

(declare-fun res!893464 () Bool)

(assert (=> b!1347018 (=> (not res!893464) (not e!766557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347018 (= res!893464 (validKeyInArray!0 (select (arr!44347 _keys!1571) from!1960)))))

(declare-fun b!1347019 () Bool)

(declare-fun res!893468 () Bool)

(declare-fun e!766558 () Bool)

(assert (=> b!1347019 (=> (not res!893468) (not e!766558))))

(assert (=> b!1347019 (= res!893468 (not (= k0!1142 (select (arr!44347 _keys!1571) from!1960))))))

(declare-fun b!1347020 () Bool)

(declare-fun res!893465 () Bool)

(assert (=> b!1347020 (=> (not res!893465) (not e!766557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91791 (_ BitVec 32)) Bool)

(assert (=> b!1347020 (= res!893465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347009 () Bool)

(assert (=> b!1347009 (= e!766557 e!766558)))

(declare-fun res!893458 () Bool)

(assert (=> b!1347009 (=> (not res!893458) (not e!766558))))

(declare-datatypes ((tuple2!24256 0))(
  ( (tuple2!24257 (_1!12139 (_ BitVec 64)) (_2!12139 V!55001)) )
))
(declare-datatypes ((List!31401 0))(
  ( (Nil!31398) (Cons!31397 (h!32615 tuple2!24256) (t!45973 List!31401)) )
))
(declare-datatypes ((ListLongMap!21921 0))(
  ( (ListLongMap!21922 (toList!10976 List!31401)) )
))
(declare-fun lt!595881 () ListLongMap!21921)

(declare-fun lt!595883 () V!55001)

(declare-fun contains!9164 (ListLongMap!21921 (_ BitVec 64)) Bool)

(declare-fun +!4867 (ListLongMap!21921 tuple2!24256) ListLongMap!21921)

(assert (=> b!1347009 (= res!893458 (contains!9164 (+!4867 lt!595881 (tuple2!24257 (select (arr!44347 _keys!1571) from!1960) lt!595883)) k0!1142))))

(declare-fun minValue!1245 () V!55001)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!55001)

(declare-fun getCurrentListMapNoExtraKeys!6516 (array!91791 array!91793 (_ BitVec 32) (_ BitVec 32) V!55001 V!55001 (_ BitVec 32) Int) ListLongMap!21921)

(assert (=> b!1347009 (= lt!595881 (getCurrentListMapNoExtraKeys!6516 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22417 (ValueCell!17813 V!55001) V!55001)

(declare-fun dynLambda!3821 (Int (_ BitVec 64)) V!55001)

(assert (=> b!1347009 (= lt!595883 (get!22417 (select (arr!44348 _values!1303) from!1960) (dynLambda!3821 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!893459 () Bool)

(assert (=> start!113596 (=> (not res!893459) (not e!766557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113596 (= res!893459 (validMask!0 mask!1977))))

(assert (=> start!113596 e!766557))

(assert (=> start!113596 tp_is_empty!37423))

(assert (=> start!113596 true))

(declare-fun array_inv!33681 (array!91791) Bool)

(assert (=> start!113596 (array_inv!33681 _keys!1571)))

(declare-fun array_inv!33682 (array!91793) Bool)

(assert (=> start!113596 (and (array_inv!33682 _values!1303) e!766560)))

(assert (=> start!113596 tp!110074))

(declare-fun mapNonEmpty!57841 () Bool)

(declare-fun tp!110073 () Bool)

(assert (=> mapNonEmpty!57841 (= mapRes!57841 (and tp!110073 e!766561))))

(declare-fun mapKey!57841 () (_ BitVec 32))

(declare-fun mapRest!57841 () (Array (_ BitVec 32) ValueCell!17813))

(declare-fun mapValue!57841 () ValueCell!17813)

(assert (=> mapNonEmpty!57841 (= (arr!44348 _values!1303) (store mapRest!57841 mapKey!57841 mapValue!57841))))

(declare-fun b!1347021 () Bool)

(assert (=> b!1347021 (= e!766558 (not true))))

(assert (=> b!1347021 (contains!9164 lt!595881 k0!1142)))

(declare-datatypes ((Unit!44068 0))(
  ( (Unit!44069) )
))
(declare-fun lt!595882 () Unit!44068)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!390 ((_ BitVec 64) (_ BitVec 64) V!55001 ListLongMap!21921) Unit!44068)

(assert (=> b!1347021 (= lt!595882 (lemmaInListMapAfterAddingDiffThenInBefore!390 k0!1142 (select (arr!44347 _keys!1571) from!1960) lt!595883 lt!595881))))

(declare-fun b!1347022 () Bool)

(declare-fun res!893461 () Bool)

(assert (=> b!1347022 (=> (not res!893461) (not e!766557))))

(declare-fun getCurrentListMap!5916 (array!91791 array!91793 (_ BitVec 32) (_ BitVec 32) V!55001 V!55001 (_ BitVec 32) Int) ListLongMap!21921)

(assert (=> b!1347022 (= res!893461 (contains!9164 (getCurrentListMap!5916 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57841 () Bool)

(assert (=> mapIsEmpty!57841 mapRes!57841))

(assert (= (and start!113596 res!893459) b!1347016))

(assert (= (and b!1347016 res!893460) b!1347020))

(assert (= (and b!1347020 res!893465) b!1347014))

(assert (= (and b!1347014 res!893467) b!1347017))

(assert (= (and b!1347017 res!893466) b!1347022))

(assert (= (and b!1347022 res!893461) b!1347010))

(assert (= (and b!1347010 res!893463) b!1347018))

(assert (= (and b!1347018 res!893464) b!1347013))

(assert (= (and b!1347013 res!893462) b!1347009))

(assert (= (and b!1347009 res!893458) b!1347019))

(assert (= (and b!1347019 res!893468) b!1347021))

(assert (= (and b!1347012 condMapEmpty!57841) mapIsEmpty!57841))

(assert (= (and b!1347012 (not condMapEmpty!57841)) mapNonEmpty!57841))

(get-info :version)

(assert (= (and mapNonEmpty!57841 ((_ is ValueCellFull!17813) mapValue!57841)) b!1347011))

(assert (= (and b!1347012 ((_ is ValueCellFull!17813) mapDefault!57841)) b!1347015))

(assert (= start!113596 b!1347012))

(declare-fun b_lambda!24539 () Bool)

(assert (=> (not b_lambda!24539) (not b!1347009)))

(declare-fun t!45971 () Bool)

(declare-fun tb!12375 () Bool)

(assert (=> (and start!113596 (= defaultEntry!1306 defaultEntry!1306) t!45971) tb!12375))

(declare-fun result!25849 () Bool)

(assert (=> tb!12375 (= result!25849 tp_is_empty!37423)))

(assert (=> b!1347009 t!45971))

(declare-fun b_and!50703 () Bool)

(assert (= b_and!50701 (and (=> t!45971 result!25849) b_and!50703)))

(declare-fun m!1234653 () Bool)

(assert (=> b!1347014 m!1234653))

(declare-fun m!1234655 () Bool)

(assert (=> mapNonEmpty!57841 m!1234655))

(declare-fun m!1234657 () Bool)

(assert (=> b!1347020 m!1234657))

(declare-fun m!1234659 () Bool)

(assert (=> b!1347021 m!1234659))

(declare-fun m!1234661 () Bool)

(assert (=> b!1347021 m!1234661))

(assert (=> b!1347021 m!1234661))

(declare-fun m!1234663 () Bool)

(assert (=> b!1347021 m!1234663))

(assert (=> b!1347010 m!1234661))

(assert (=> b!1347018 m!1234661))

(assert (=> b!1347018 m!1234661))

(declare-fun m!1234665 () Bool)

(assert (=> b!1347018 m!1234665))

(declare-fun m!1234667 () Bool)

(assert (=> b!1347009 m!1234667))

(declare-fun m!1234669 () Bool)

(assert (=> b!1347009 m!1234669))

(declare-fun m!1234671 () Bool)

(assert (=> b!1347009 m!1234671))

(assert (=> b!1347009 m!1234667))

(assert (=> b!1347009 m!1234669))

(assert (=> b!1347009 m!1234661))

(declare-fun m!1234673 () Bool)

(assert (=> b!1347009 m!1234673))

(declare-fun m!1234675 () Bool)

(assert (=> b!1347009 m!1234675))

(assert (=> b!1347009 m!1234673))

(declare-fun m!1234677 () Bool)

(assert (=> b!1347009 m!1234677))

(declare-fun m!1234679 () Bool)

(assert (=> start!113596 m!1234679))

(declare-fun m!1234681 () Bool)

(assert (=> start!113596 m!1234681))

(declare-fun m!1234683 () Bool)

(assert (=> start!113596 m!1234683))

(declare-fun m!1234685 () Bool)

(assert (=> b!1347022 m!1234685))

(assert (=> b!1347022 m!1234685))

(declare-fun m!1234687 () Bool)

(assert (=> b!1347022 m!1234687))

(assert (=> b!1347019 m!1234661))

(check-sat (not start!113596) (not b!1347014) (not b!1347009) (not mapNonEmpty!57841) (not b!1347020) (not b_next!31423) b_and!50703 (not b!1347022) (not b!1347021) (not b_lambda!24539) (not b!1347018) tp_is_empty!37423)
(check-sat b_and!50703 (not b_next!31423))
