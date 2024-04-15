; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133550 () Bool)

(assert start!133550)

(declare-fun b_free!32017 () Bool)

(declare-fun b_next!32017 () Bool)

(assert (=> start!133550 (= b_free!32017 (not b_next!32017))))

(declare-fun tp!113176 () Bool)

(declare-fun b_and!51527 () Bool)

(assert (=> start!133550 (= tp!113176 b_and!51527)))

(declare-fun b!1561718 () Bool)

(declare-fun e!870261 () Bool)

(assert (=> b!1561718 (= e!870261 (not true))))

(declare-fun lt!671168 () Bool)

(declare-datatypes ((V!59785 0))(
  ( (V!59786 (val!19425 Int)) )
))
(declare-datatypes ((tuple2!25162 0))(
  ( (tuple2!25163 (_1!12592 (_ BitVec 64)) (_2!12592 V!59785)) )
))
(declare-datatypes ((List!36502 0))(
  ( (Nil!36499) (Cons!36498 (h!37945 tuple2!25162) (t!51301 List!36502)) )
))
(declare-datatypes ((ListLongMap!22597 0))(
  ( (ListLongMap!22598 (toList!11314 List!36502)) )
))
(declare-fun lt!671167 () ListLongMap!22597)

(declare-fun contains!10224 (ListLongMap!22597 (_ BitVec 64)) Bool)

(assert (=> b!1561718 (= lt!671168 (contains!10224 lt!671167 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561718 (not (contains!10224 lt!671167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671166 () V!59785)

(declare-fun lt!671165 () ListLongMap!22597)

(declare-datatypes ((array!103994 0))(
  ( (array!103995 (arr!50190 (Array (_ BitVec 32) (_ BitVec 64))) (size!50742 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103994)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun +!5079 (ListLongMap!22597 tuple2!25162) ListLongMap!22597)

(assert (=> b!1561718 (= lt!671167 (+!5079 lt!671165 (tuple2!25163 (select (arr!50190 _keys!637) from!782) lt!671166)))))

(declare-datatypes ((Unit!51766 0))(
  ( (Unit!51767) )
))
(declare-fun lt!671164 () Unit!51766)

(declare-fun addStillNotContains!526 (ListLongMap!22597 (_ BitVec 64) V!59785 (_ BitVec 64)) Unit!51766)

(assert (=> b!1561718 (= lt!671164 (addStillNotContains!526 lt!671165 (select (arr!50190 _keys!637) from!782) lt!671166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18311 0))(
  ( (ValueCellFull!18311 (v!22173 V!59785)) (EmptyCell!18311) )
))
(declare-datatypes ((array!103996 0))(
  ( (array!103997 (arr!50191 (Array (_ BitVec 32) ValueCell!18311)) (size!50743 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103996)

(declare-fun get!26230 (ValueCell!18311 V!59785) V!59785)

(declare-fun dynLambda!3855 (Int (_ BitVec 64)) V!59785)

(assert (=> b!1561718 (= lt!671166 (get!26230 (select (arr!50191 _values!487) from!782) (dynLambda!3855 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59785)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59785)

(declare-fun getCurrentListMapNoExtraKeys!6688 (array!103994 array!103996 (_ BitVec 32) (_ BitVec 32) V!59785 V!59785 (_ BitVec 32) Int) ListLongMap!22597)

(assert (=> b!1561718 (= lt!671165 (getCurrentListMapNoExtraKeys!6688 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561719 () Bool)

(declare-fun res!1067868 () Bool)

(assert (=> b!1561719 (=> (not res!1067868) (not e!870261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103994 (_ BitVec 32)) Bool)

(assert (=> b!1561719 (= res!1067868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561720 () Bool)

(declare-fun res!1067869 () Bool)

(assert (=> b!1561720 (=> (not res!1067869) (not e!870261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561720 (= res!1067869 (validKeyInArray!0 (select (arr!50190 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59400 () Bool)

(declare-fun mapRes!59400 () Bool)

(declare-fun tp!113175 () Bool)

(declare-fun e!870262 () Bool)

(assert (=> mapNonEmpty!59400 (= mapRes!59400 (and tp!113175 e!870262))))

(declare-fun mapKey!59400 () (_ BitVec 32))

(declare-fun mapValue!59400 () ValueCell!18311)

(declare-fun mapRest!59400 () (Array (_ BitVec 32) ValueCell!18311))

(assert (=> mapNonEmpty!59400 (= (arr!50191 _values!487) (store mapRest!59400 mapKey!59400 mapValue!59400))))

(declare-fun mapIsEmpty!59400 () Bool)

(assert (=> mapIsEmpty!59400 mapRes!59400))

(declare-fun b!1561721 () Bool)

(declare-fun tp_is_empty!38683 () Bool)

(assert (=> b!1561721 (= e!870262 tp_is_empty!38683)))

(declare-fun res!1067871 () Bool)

(assert (=> start!133550 (=> (not res!1067871) (not e!870261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133550 (= res!1067871 (validMask!0 mask!947))))

(assert (=> start!133550 e!870261))

(assert (=> start!133550 tp!113176))

(assert (=> start!133550 tp_is_empty!38683))

(assert (=> start!133550 true))

(declare-fun array_inv!39197 (array!103994) Bool)

(assert (=> start!133550 (array_inv!39197 _keys!637)))

(declare-fun e!870265 () Bool)

(declare-fun array_inv!39198 (array!103996) Bool)

(assert (=> start!133550 (and (array_inv!39198 _values!487) e!870265)))

(declare-fun b!1561722 () Bool)

(declare-fun res!1067870 () Bool)

(assert (=> b!1561722 (=> (not res!1067870) (not e!870261))))

(declare-datatypes ((List!36503 0))(
  ( (Nil!36500) (Cons!36499 (h!37946 (_ BitVec 64)) (t!51302 List!36503)) )
))
(declare-fun arrayNoDuplicates!0 (array!103994 (_ BitVec 32) List!36503) Bool)

(assert (=> b!1561722 (= res!1067870 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36500))))

(declare-fun b!1561723 () Bool)

(declare-fun res!1067867 () Bool)

(assert (=> b!1561723 (=> (not res!1067867) (not e!870261))))

(assert (=> b!1561723 (= res!1067867 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50742 _keys!637)) (bvslt from!782 (size!50742 _keys!637))))))

(declare-fun b!1561724 () Bool)

(declare-fun res!1067866 () Bool)

(assert (=> b!1561724 (=> (not res!1067866) (not e!870261))))

(assert (=> b!1561724 (= res!1067866 (and (= (size!50743 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50742 _keys!637) (size!50743 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561725 () Bool)

(declare-fun e!870263 () Bool)

(assert (=> b!1561725 (= e!870263 tp_is_empty!38683)))

(declare-fun b!1561726 () Bool)

(assert (=> b!1561726 (= e!870265 (and e!870263 mapRes!59400))))

(declare-fun condMapEmpty!59400 () Bool)

(declare-fun mapDefault!59400 () ValueCell!18311)

(assert (=> b!1561726 (= condMapEmpty!59400 (= (arr!50191 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18311)) mapDefault!59400)))))

(assert (= (and start!133550 res!1067871) b!1561724))

(assert (= (and b!1561724 res!1067866) b!1561719))

(assert (= (and b!1561719 res!1067868) b!1561722))

(assert (= (and b!1561722 res!1067870) b!1561723))

(assert (= (and b!1561723 res!1067867) b!1561720))

(assert (= (and b!1561720 res!1067869) b!1561718))

(assert (= (and b!1561726 condMapEmpty!59400) mapIsEmpty!59400))

(assert (= (and b!1561726 (not condMapEmpty!59400)) mapNonEmpty!59400))

(get-info :version)

(assert (= (and mapNonEmpty!59400 ((_ is ValueCellFull!18311) mapValue!59400)) b!1561721))

(assert (= (and b!1561726 ((_ is ValueCellFull!18311) mapDefault!59400)) b!1561725))

(assert (= start!133550 b!1561726))

(declare-fun b_lambda!24881 () Bool)

(assert (=> (not b_lambda!24881) (not b!1561718)))

(declare-fun t!51300 () Bool)

(declare-fun tb!12553 () Bool)

(assert (=> (and start!133550 (= defaultEntry!495 defaultEntry!495) t!51300) tb!12553))

(declare-fun result!26395 () Bool)

(assert (=> tb!12553 (= result!26395 tp_is_empty!38683)))

(assert (=> b!1561718 t!51300))

(declare-fun b_and!51529 () Bool)

(assert (= b_and!51527 (and (=> t!51300 result!26395) b_and!51529)))

(declare-fun m!1436853 () Bool)

(assert (=> b!1561720 m!1436853))

(assert (=> b!1561720 m!1436853))

(declare-fun m!1436855 () Bool)

(assert (=> b!1561720 m!1436855))

(declare-fun m!1436857 () Bool)

(assert (=> b!1561722 m!1436857))

(declare-fun m!1436859 () Bool)

(assert (=> b!1561719 m!1436859))

(declare-fun m!1436861 () Bool)

(assert (=> mapNonEmpty!59400 m!1436861))

(declare-fun m!1436863 () Bool)

(assert (=> b!1561718 m!1436863))

(declare-fun m!1436865 () Bool)

(assert (=> b!1561718 m!1436865))

(declare-fun m!1436867 () Bool)

(assert (=> b!1561718 m!1436867))

(declare-fun m!1436869 () Bool)

(assert (=> b!1561718 m!1436869))

(declare-fun m!1436871 () Bool)

(assert (=> b!1561718 m!1436871))

(assert (=> b!1561718 m!1436863))

(declare-fun m!1436873 () Bool)

(assert (=> b!1561718 m!1436873))

(assert (=> b!1561718 m!1436853))

(assert (=> b!1561718 m!1436865))

(declare-fun m!1436875 () Bool)

(assert (=> b!1561718 m!1436875))

(assert (=> b!1561718 m!1436853))

(declare-fun m!1436877 () Bool)

(assert (=> b!1561718 m!1436877))

(declare-fun m!1436879 () Bool)

(assert (=> start!133550 m!1436879))

(declare-fun m!1436881 () Bool)

(assert (=> start!133550 m!1436881))

(declare-fun m!1436883 () Bool)

(assert (=> start!133550 m!1436883))

(check-sat b_and!51529 (not b!1561722) (not b_next!32017) (not start!133550) (not b!1561718) tp_is_empty!38683 (not b_lambda!24881) (not b!1561720) (not mapNonEmpty!59400) (not b!1561719))
(check-sat b_and!51529 (not b_next!32017))
