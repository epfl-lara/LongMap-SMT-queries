; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113602 () Bool)

(assert start!113602)

(declare-fun b_free!31429 () Bool)

(declare-fun b_next!31429 () Bool)

(assert (=> start!113602 (= b_free!31429 (not b_next!31429))))

(declare-fun tp!110091 () Bool)

(declare-fun b_and!50713 () Bool)

(assert (=> start!113602 (= tp!110091 b_and!50713)))

(declare-fun b!1347141 () Bool)

(declare-fun e!766614 () Bool)

(declare-fun e!766611 () Bool)

(assert (=> b!1347141 (= e!766614 e!766611)))

(declare-fun res!893564 () Bool)

(assert (=> b!1347141 (=> (not res!893564) (not e!766611))))

(declare-datatypes ((V!55009 0))(
  ( (V!55010 (val!18789 Int)) )
))
(declare-datatypes ((tuple2!24262 0))(
  ( (tuple2!24263 (_1!12142 (_ BitVec 64)) (_2!12142 V!55009)) )
))
(declare-datatypes ((List!31405 0))(
  ( (Nil!31402) (Cons!31401 (h!32619 tuple2!24262) (t!45983 List!31405)) )
))
(declare-datatypes ((ListLongMap!21927 0))(
  ( (ListLongMap!21928 (toList!10979 List!31405)) )
))
(declare-fun lt!595909 () ListLongMap!21927)

(declare-fun lt!595910 () V!55009)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91803 0))(
  ( (array!91804 (arr!44353 (Array (_ BitVec 32) (_ BitVec 64))) (size!44904 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91803)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun contains!9167 (ListLongMap!21927 (_ BitVec 64)) Bool)

(declare-fun +!4870 (ListLongMap!21927 tuple2!24262) ListLongMap!21927)

(assert (=> b!1347141 (= res!893564 (contains!9167 (+!4870 lt!595909 (tuple2!24263 (select (arr!44353 _keys!1571) from!1960) lt!595910)) k0!1142))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55009)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17816 0))(
  ( (ValueCellFull!17816 (v!21432 V!55009)) (EmptyCell!17816) )
))
(declare-datatypes ((array!91805 0))(
  ( (array!91806 (arr!44354 (Array (_ BitVec 32) ValueCell!17816)) (size!44905 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91805)

(declare-fun minValue!1245 () V!55009)

(declare-fun getCurrentListMapNoExtraKeys!6519 (array!91803 array!91805 (_ BitVec 32) (_ BitVec 32) V!55009 V!55009 (_ BitVec 32) Int) ListLongMap!21927)

(assert (=> b!1347141 (= lt!595909 (getCurrentListMapNoExtraKeys!6519 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22422 (ValueCell!17816 V!55009) V!55009)

(declare-fun dynLambda!3824 (Int (_ BitVec 64)) V!55009)

(assert (=> b!1347141 (= lt!595910 (get!22422 (select (arr!44354 _values!1303) from!1960) (dynLambda!3824 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1347143 () Bool)

(declare-fun res!893558 () Bool)

(assert (=> b!1347143 (=> (not res!893558) (not e!766614))))

(assert (=> b!1347143 (= res!893558 (not (= (select (arr!44353 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1347144 () Bool)

(declare-fun res!893567 () Bool)

(assert (=> b!1347144 (=> (not res!893567) (not e!766614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91803 (_ BitVec 32)) Bool)

(assert (=> b!1347144 (= res!893567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347145 () Bool)

(declare-fun e!766615 () Bool)

(declare-fun tp_is_empty!37429 () Bool)

(assert (=> b!1347145 (= e!766615 tp_is_empty!37429)))

(declare-fun b!1347146 () Bool)

(assert (=> b!1347146 (= e!766611 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(assert (=> b!1347146 (contains!9167 lt!595909 k0!1142)))

(declare-datatypes ((Unit!44072 0))(
  ( (Unit!44073) )
))
(declare-fun lt!595908 () Unit!44072)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!392 ((_ BitVec 64) (_ BitVec 64) V!55009 ListLongMap!21927) Unit!44072)

(assert (=> b!1347146 (= lt!595908 (lemmaInListMapAfterAddingDiffThenInBefore!392 k0!1142 (select (arr!44353 _keys!1571) from!1960) lt!595910 lt!595909))))

(declare-fun b!1347147 () Bool)

(declare-fun res!893562 () Bool)

(assert (=> b!1347147 (=> (not res!893562) (not e!766614))))

(assert (=> b!1347147 (= res!893562 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1347148 () Bool)

(declare-fun res!893563 () Bool)

(assert (=> b!1347148 (=> (not res!893563) (not e!766614))))

(assert (=> b!1347148 (= res!893563 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44904 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57850 () Bool)

(declare-fun mapRes!57850 () Bool)

(declare-fun tp!110092 () Bool)

(declare-fun e!766616 () Bool)

(assert (=> mapNonEmpty!57850 (= mapRes!57850 (and tp!110092 e!766616))))

(declare-fun mapValue!57850 () ValueCell!17816)

(declare-fun mapRest!57850 () (Array (_ BitVec 32) ValueCell!17816))

(declare-fun mapKey!57850 () (_ BitVec 32))

(assert (=> mapNonEmpty!57850 (= (arr!44354 _values!1303) (store mapRest!57850 mapKey!57850 mapValue!57850))))

(declare-fun b!1347149 () Bool)

(assert (=> b!1347149 (= e!766616 tp_is_empty!37429)))

(declare-fun b!1347150 () Bool)

(declare-fun res!893560 () Bool)

(assert (=> b!1347150 (=> (not res!893560) (not e!766614))))

(declare-fun getCurrentListMap!5919 (array!91803 array!91805 (_ BitVec 32) (_ BitVec 32) V!55009 V!55009 (_ BitVec 32) Int) ListLongMap!21927)

(assert (=> b!1347150 (= res!893560 (contains!9167 (getCurrentListMap!5919 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347151 () Bool)

(declare-fun e!766613 () Bool)

(assert (=> b!1347151 (= e!766613 (and e!766615 mapRes!57850))))

(declare-fun condMapEmpty!57850 () Bool)

(declare-fun mapDefault!57850 () ValueCell!17816)

(assert (=> b!1347151 (= condMapEmpty!57850 (= (arr!44354 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17816)) mapDefault!57850)))))

(declare-fun b!1347152 () Bool)

(declare-fun res!893557 () Bool)

(assert (=> b!1347152 (=> (not res!893557) (not e!766614))))

(declare-datatypes ((List!31406 0))(
  ( (Nil!31403) (Cons!31402 (h!32620 (_ BitVec 64)) (t!45984 List!31406)) )
))
(declare-fun arrayNoDuplicates!0 (array!91803 (_ BitVec 32) List!31406) Bool)

(assert (=> b!1347152 (= res!893557 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31403))))

(declare-fun b!1347153 () Bool)

(declare-fun res!893561 () Bool)

(assert (=> b!1347153 (=> (not res!893561) (not e!766614))))

(assert (=> b!1347153 (= res!893561 (and (= (size!44905 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44904 _keys!1571) (size!44905 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347154 () Bool)

(declare-fun res!893566 () Bool)

(assert (=> b!1347154 (=> (not res!893566) (not e!766611))))

(assert (=> b!1347154 (= res!893566 (not (= k0!1142 (select (arr!44353 _keys!1571) from!1960))))))

(declare-fun mapIsEmpty!57850 () Bool)

(assert (=> mapIsEmpty!57850 mapRes!57850))

(declare-fun res!893559 () Bool)

(assert (=> start!113602 (=> (not res!893559) (not e!766614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113602 (= res!893559 (validMask!0 mask!1977))))

(assert (=> start!113602 e!766614))

(assert (=> start!113602 tp_is_empty!37429))

(assert (=> start!113602 true))

(declare-fun array_inv!33687 (array!91803) Bool)

(assert (=> start!113602 (array_inv!33687 _keys!1571)))

(declare-fun array_inv!33688 (array!91805) Bool)

(assert (=> start!113602 (and (array_inv!33688 _values!1303) e!766613)))

(assert (=> start!113602 tp!110091))

(declare-fun b!1347142 () Bool)

(declare-fun res!893565 () Bool)

(assert (=> b!1347142 (=> (not res!893565) (not e!766614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347142 (= res!893565 (validKeyInArray!0 (select (arr!44353 _keys!1571) from!1960)))))

(assert (= (and start!113602 res!893559) b!1347153))

(assert (= (and b!1347153 res!893561) b!1347144))

(assert (= (and b!1347144 res!893567) b!1347152))

(assert (= (and b!1347152 res!893557) b!1347148))

(assert (= (and b!1347148 res!893563) b!1347150))

(assert (= (and b!1347150 res!893560) b!1347143))

(assert (= (and b!1347143 res!893558) b!1347142))

(assert (= (and b!1347142 res!893565) b!1347147))

(assert (= (and b!1347147 res!893562) b!1347141))

(assert (= (and b!1347141 res!893564) b!1347154))

(assert (= (and b!1347154 res!893566) b!1347146))

(assert (= (and b!1347151 condMapEmpty!57850) mapIsEmpty!57850))

(assert (= (and b!1347151 (not condMapEmpty!57850)) mapNonEmpty!57850))

(get-info :version)

(assert (= (and mapNonEmpty!57850 ((_ is ValueCellFull!17816) mapValue!57850)) b!1347149))

(assert (= (and b!1347151 ((_ is ValueCellFull!17816) mapDefault!57850)) b!1347145))

(assert (= start!113602 b!1347151))

(declare-fun b_lambda!24545 () Bool)

(assert (=> (not b_lambda!24545) (not b!1347141)))

(declare-fun t!45982 () Bool)

(declare-fun tb!12381 () Bool)

(assert (=> (and start!113602 (= defaultEntry!1306 defaultEntry!1306) t!45982) tb!12381))

(declare-fun result!25861 () Bool)

(assert (=> tb!12381 (= result!25861 tp_is_empty!37429)))

(assert (=> b!1347141 t!45982))

(declare-fun b_and!50715 () Bool)

(assert (= b_and!50713 (and (=> t!45982 result!25861) b_and!50715)))

(declare-fun m!1234761 () Bool)

(assert (=> b!1347141 m!1234761))

(declare-fun m!1234763 () Bool)

(assert (=> b!1347141 m!1234763))

(declare-fun m!1234765 () Bool)

(assert (=> b!1347141 m!1234765))

(declare-fun m!1234767 () Bool)

(assert (=> b!1347141 m!1234767))

(assert (=> b!1347141 m!1234763))

(declare-fun m!1234769 () Bool)

(assert (=> b!1347141 m!1234769))

(declare-fun m!1234771 () Bool)

(assert (=> b!1347141 m!1234771))

(assert (=> b!1347141 m!1234765))

(assert (=> b!1347141 m!1234769))

(declare-fun m!1234773 () Bool)

(assert (=> b!1347141 m!1234773))

(declare-fun m!1234775 () Bool)

(assert (=> start!113602 m!1234775))

(declare-fun m!1234777 () Bool)

(assert (=> start!113602 m!1234777))

(declare-fun m!1234779 () Bool)

(assert (=> start!113602 m!1234779))

(assert (=> b!1347143 m!1234773))

(declare-fun m!1234781 () Bool)

(assert (=> b!1347152 m!1234781))

(declare-fun m!1234783 () Bool)

(assert (=> mapNonEmpty!57850 m!1234783))

(assert (=> b!1347142 m!1234773))

(assert (=> b!1347142 m!1234773))

(declare-fun m!1234785 () Bool)

(assert (=> b!1347142 m!1234785))

(declare-fun m!1234787 () Bool)

(assert (=> b!1347150 m!1234787))

(assert (=> b!1347150 m!1234787))

(declare-fun m!1234789 () Bool)

(assert (=> b!1347150 m!1234789))

(assert (=> b!1347154 m!1234773))

(declare-fun m!1234791 () Bool)

(assert (=> b!1347146 m!1234791))

(assert (=> b!1347146 m!1234773))

(assert (=> b!1347146 m!1234773))

(declare-fun m!1234793 () Bool)

(assert (=> b!1347146 m!1234793))

(declare-fun m!1234795 () Bool)

(assert (=> b!1347144 m!1234795))

(check-sat (not b!1347146) (not b!1347142) (not b!1347144) b_and!50715 tp_is_empty!37429 (not mapNonEmpty!57850) (not b_next!31429) (not b!1347150) (not b!1347141) (not b!1347152) (not b_lambda!24545) (not start!113602))
(check-sat b_and!50715 (not b_next!31429))
