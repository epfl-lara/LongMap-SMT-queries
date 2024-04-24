; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113416 () Bool)

(assert start!113416)

(declare-fun b_free!31243 () Bool)

(declare-fun b_next!31243 () Bool)

(assert (=> start!113416 (= b_free!31243 (not b_next!31243))))

(declare-fun tp!109533 () Bool)

(declare-fun b_and!50395 () Bool)

(assert (=> start!113416 (= tp!109533 b_and!50395)))

(declare-fun b!1343810 () Bool)

(declare-fun res!891195 () Bool)

(declare-fun e!765146 () Bool)

(assert (=> b!1343810 (=> (not res!891195) (not e!765146))))

(declare-datatypes ((V!54761 0))(
  ( (V!54762 (val!18696 Int)) )
))
(declare-fun minValue!1245 () V!54761)

(declare-datatypes ((array!91451 0))(
  ( (array!91452 (arr!44177 (Array (_ BitVec 32) (_ BitVec 64))) (size!44728 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91451)

(declare-fun zeroValue!1245 () V!54761)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17723 0))(
  ( (ValueCellFull!17723 (v!21339 V!54761)) (EmptyCell!17723) )
))
(declare-datatypes ((array!91453 0))(
  ( (array!91454 (arr!44178 (Array (_ BitVec 32) ValueCell!17723)) (size!44729 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91453)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((tuple2!24132 0))(
  ( (tuple2!24133 (_1!12077 (_ BitVec 64)) (_2!12077 V!54761)) )
))
(declare-datatypes ((List!31281 0))(
  ( (Nil!31278) (Cons!31277 (h!32495 tuple2!24132) (t!45727 List!31281)) )
))
(declare-datatypes ((ListLongMap!21797 0))(
  ( (ListLongMap!21798 (toList!10914 List!31281)) )
))
(declare-fun contains!9102 (ListLongMap!21797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5861 (array!91451 array!91453 (_ BitVec 32) (_ BitVec 32) V!54761 V!54761 (_ BitVec 32) Int) ListLongMap!21797)

(assert (=> b!1343810 (= res!891195 (contains!9102 (getCurrentListMap!5861 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343811 () Bool)

(declare-fun res!891197 () Bool)

(assert (=> b!1343811 (=> (not res!891197) (not e!765146))))

(declare-datatypes ((List!31282 0))(
  ( (Nil!31279) (Cons!31278 (h!32496 (_ BitVec 64)) (t!45728 List!31282)) )
))
(declare-fun arrayNoDuplicates!0 (array!91451 (_ BitVec 32) List!31282) Bool)

(assert (=> b!1343811 (= res!891197 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31279))))

(declare-fun b!1343812 () Bool)

(declare-fun e!765142 () Bool)

(declare-fun e!765143 () Bool)

(declare-fun mapRes!57571 () Bool)

(assert (=> b!1343812 (= e!765142 (and e!765143 mapRes!57571))))

(declare-fun condMapEmpty!57571 () Bool)

(declare-fun mapDefault!57571 () ValueCell!17723)

(assert (=> b!1343812 (= condMapEmpty!57571 (= (arr!44178 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17723)) mapDefault!57571)))))

(declare-fun res!891196 () Bool)

(assert (=> start!113416 (=> (not res!891196) (not e!765146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113416 (= res!891196 (validMask!0 mask!1977))))

(assert (=> start!113416 e!765146))

(declare-fun tp_is_empty!37243 () Bool)

(assert (=> start!113416 tp_is_empty!37243))

(assert (=> start!113416 true))

(declare-fun array_inv!33573 (array!91451) Bool)

(assert (=> start!113416 (array_inv!33573 _keys!1571)))

(declare-fun array_inv!33574 (array!91453) Bool)

(assert (=> start!113416 (and (array_inv!33574 _values!1303) e!765142)))

(assert (=> start!113416 tp!109533))

(declare-fun b!1343813 () Bool)

(declare-fun res!891200 () Bool)

(assert (=> b!1343813 (=> (not res!891200) (not e!765146))))

(assert (=> b!1343813 (= res!891200 (and (= (size!44729 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44728 _keys!1571) (size!44729 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343814 () Bool)

(assert (=> b!1343814 (= e!765146 (not true))))

(declare-fun lt!594988 () ListLongMap!21797)

(assert (=> b!1343814 (contains!9102 lt!594988 k0!1142)))

(declare-fun lt!594985 () V!54761)

(declare-datatypes ((Unit!44000 0))(
  ( (Unit!44001) )
))
(declare-fun lt!594986 () Unit!44000)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!356 ((_ BitVec 64) (_ BitVec 64) V!54761 ListLongMap!21797) Unit!44000)

(assert (=> b!1343814 (= lt!594986 (lemmaInListMapAfterAddingDiffThenInBefore!356 k0!1142 (select (arr!44177 _keys!1571) from!1960) lt!594985 lt!594988))))

(declare-fun lt!594989 () ListLongMap!21797)

(assert (=> b!1343814 (contains!9102 lt!594989 k0!1142)))

(declare-fun lt!594987 () Unit!44000)

(assert (=> b!1343814 (= lt!594987 (lemmaInListMapAfterAddingDiffThenInBefore!356 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594989))))

(declare-fun +!4830 (ListLongMap!21797 tuple2!24132) ListLongMap!21797)

(assert (=> b!1343814 (= lt!594989 (+!4830 lt!594988 (tuple2!24133 (select (arr!44177 _keys!1571) from!1960) lt!594985)))))

(declare-fun get!22320 (ValueCell!17723 V!54761) V!54761)

(declare-fun dynLambda!3784 (Int (_ BitVec 64)) V!54761)

(assert (=> b!1343814 (= lt!594985 (get!22320 (select (arr!44178 _values!1303) from!1960) (dynLambda!3784 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6479 (array!91451 array!91453 (_ BitVec 32) (_ BitVec 32) V!54761 V!54761 (_ BitVec 32) Int) ListLongMap!21797)

(assert (=> b!1343814 (= lt!594988 (getCurrentListMapNoExtraKeys!6479 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343815 () Bool)

(declare-fun res!891203 () Bool)

(assert (=> b!1343815 (=> (not res!891203) (not e!765146))))

(assert (=> b!1343815 (= res!891203 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343816 () Bool)

(declare-fun res!891199 () Bool)

(assert (=> b!1343816 (=> (not res!891199) (not e!765146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91451 (_ BitVec 32)) Bool)

(assert (=> b!1343816 (= res!891199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343817 () Bool)

(assert (=> b!1343817 (= e!765143 tp_is_empty!37243)))

(declare-fun mapIsEmpty!57571 () Bool)

(assert (=> mapIsEmpty!57571 mapRes!57571))

(declare-fun b!1343818 () Bool)

(declare-fun res!891198 () Bool)

(assert (=> b!1343818 (=> (not res!891198) (not e!765146))))

(assert (=> b!1343818 (= res!891198 (not (= (select (arr!44177 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343819 () Bool)

(declare-fun e!765145 () Bool)

(assert (=> b!1343819 (= e!765145 tp_is_empty!37243)))

(declare-fun mapNonEmpty!57571 () Bool)

(declare-fun tp!109534 () Bool)

(assert (=> mapNonEmpty!57571 (= mapRes!57571 (and tp!109534 e!765145))))

(declare-fun mapValue!57571 () ValueCell!17723)

(declare-fun mapKey!57571 () (_ BitVec 32))

(declare-fun mapRest!57571 () (Array (_ BitVec 32) ValueCell!17723))

(assert (=> mapNonEmpty!57571 (= (arr!44178 _values!1303) (store mapRest!57571 mapKey!57571 mapValue!57571))))

(declare-fun b!1343820 () Bool)

(declare-fun res!891202 () Bool)

(assert (=> b!1343820 (=> (not res!891202) (not e!765146))))

(assert (=> b!1343820 (= res!891202 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44728 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343821 () Bool)

(declare-fun res!891201 () Bool)

(assert (=> b!1343821 (=> (not res!891201) (not e!765146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343821 (= res!891201 (validKeyInArray!0 (select (arr!44177 _keys!1571) from!1960)))))

(assert (= (and start!113416 res!891196) b!1343813))

(assert (= (and b!1343813 res!891200) b!1343816))

(assert (= (and b!1343816 res!891199) b!1343811))

(assert (= (and b!1343811 res!891197) b!1343820))

(assert (= (and b!1343820 res!891202) b!1343810))

(assert (= (and b!1343810 res!891195) b!1343818))

(assert (= (and b!1343818 res!891198) b!1343821))

(assert (= (and b!1343821 res!891201) b!1343815))

(assert (= (and b!1343815 res!891203) b!1343814))

(assert (= (and b!1343812 condMapEmpty!57571) mapIsEmpty!57571))

(assert (= (and b!1343812 (not condMapEmpty!57571)) mapNonEmpty!57571))

(get-info :version)

(assert (= (and mapNonEmpty!57571 ((_ is ValueCellFull!17723) mapValue!57571)) b!1343819))

(assert (= (and b!1343812 ((_ is ValueCellFull!17723) mapDefault!57571)) b!1343817))

(assert (= start!113416 b!1343812))

(declare-fun b_lambda!24413 () Bool)

(assert (=> (not b_lambda!24413) (not b!1343814)))

(declare-fun t!45726 () Bool)

(declare-fun tb!12249 () Bool)

(assert (=> (and start!113416 (= defaultEntry!1306 defaultEntry!1306) t!45726) tb!12249))

(declare-fun result!25597 () Bool)

(assert (=> tb!12249 (= result!25597 tp_is_empty!37243)))

(assert (=> b!1343814 t!45726))

(declare-fun b_and!50397 () Bool)

(assert (= b_and!50395 (and (=> t!45726 result!25597) b_and!50397)))

(declare-fun m!1231731 () Bool)

(assert (=> b!1343818 m!1231731))

(declare-fun m!1231733 () Bool)

(assert (=> b!1343810 m!1231733))

(assert (=> b!1343810 m!1231733))

(declare-fun m!1231735 () Bool)

(assert (=> b!1343810 m!1231735))

(assert (=> b!1343821 m!1231731))

(assert (=> b!1343821 m!1231731))

(declare-fun m!1231737 () Bool)

(assert (=> b!1343821 m!1231737))

(declare-fun m!1231739 () Bool)

(assert (=> b!1343814 m!1231739))

(declare-fun m!1231741 () Bool)

(assert (=> b!1343814 m!1231741))

(declare-fun m!1231743 () Bool)

(assert (=> b!1343814 m!1231743))

(declare-fun m!1231745 () Bool)

(assert (=> b!1343814 m!1231745))

(declare-fun m!1231747 () Bool)

(assert (=> b!1343814 m!1231747))

(assert (=> b!1343814 m!1231741))

(assert (=> b!1343814 m!1231743))

(assert (=> b!1343814 m!1231731))

(declare-fun m!1231749 () Bool)

(assert (=> b!1343814 m!1231749))

(assert (=> b!1343814 m!1231731))

(declare-fun m!1231751 () Bool)

(assert (=> b!1343814 m!1231751))

(declare-fun m!1231753 () Bool)

(assert (=> b!1343814 m!1231753))

(declare-fun m!1231755 () Bool)

(assert (=> b!1343814 m!1231755))

(declare-fun m!1231757 () Bool)

(assert (=> b!1343811 m!1231757))

(declare-fun m!1231759 () Bool)

(assert (=> mapNonEmpty!57571 m!1231759))

(declare-fun m!1231761 () Bool)

(assert (=> start!113416 m!1231761))

(declare-fun m!1231763 () Bool)

(assert (=> start!113416 m!1231763))

(declare-fun m!1231765 () Bool)

(assert (=> start!113416 m!1231765))

(declare-fun m!1231767 () Bool)

(assert (=> b!1343816 m!1231767))

(check-sat (not b!1343810) (not mapNonEmpty!57571) b_and!50397 (not b!1343811) (not b!1343821) (not start!113416) (not b!1343814) tp_is_empty!37243 (not b_lambda!24413) (not b_next!31243) (not b!1343816))
(check-sat b_and!50397 (not b_next!31243))
