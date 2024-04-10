; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133548 () Bool)

(assert start!133548)

(declare-fun b_free!31965 () Bool)

(declare-fun b_next!31965 () Bool)

(assert (=> start!133548 (= b_free!31965 (not b_next!31965))))

(declare-fun tp!113019 () Bool)

(declare-fun b_and!51441 () Bool)

(assert (=> start!133548 (= tp!113019 b_and!51441)))

(declare-fun mapNonEmpty!59322 () Bool)

(declare-fun mapRes!59322 () Bool)

(declare-fun tp!113018 () Bool)

(declare-fun e!870063 () Bool)

(assert (=> mapNonEmpty!59322 (= mapRes!59322 (and tp!113018 e!870063))))

(declare-fun mapKey!59322 () (_ BitVec 32))

(declare-datatypes ((V!59715 0))(
  ( (V!59716 (val!19399 Int)) )
))
(declare-datatypes ((ValueCell!18285 0))(
  ( (ValueCellFull!18285 (v!22151 V!59715)) (EmptyCell!18285) )
))
(declare-fun mapValue!59322 () ValueCell!18285)

(declare-datatypes ((array!103980 0))(
  ( (array!103981 (arr!50182 (Array (_ BitVec 32) ValueCell!18285)) (size!50732 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103980)

(declare-fun mapRest!59322 () (Array (_ BitVec 32) ValueCell!18285))

(assert (=> mapNonEmpty!59322 (= (arr!50182 _values!487) (store mapRest!59322 mapKey!59322 mapValue!59322))))

(declare-fun b!1561268 () Bool)

(declare-fun res!1067521 () Bool)

(declare-fun e!870062 () Bool)

(assert (=> b!1561268 (=> (not res!1067521) (not e!870062))))

(declare-datatypes ((array!103982 0))(
  ( (array!103983 (arr!50183 (Array (_ BitVec 32) (_ BitVec 64))) (size!50733 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103982)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103982 (_ BitVec 32)) Bool)

(assert (=> b!1561268 (= res!1067521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561269 () Bool)

(declare-fun res!1067518 () Bool)

(assert (=> b!1561269 (=> (not res!1067518) (not e!870062))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561269 (= res!1067518 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50733 _keys!637)) (bvslt from!782 (size!50733 _keys!637))))))

(declare-fun b!1561271 () Bool)

(declare-fun res!1067522 () Bool)

(assert (=> b!1561271 (=> (not res!1067522) (not e!870062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561271 (= res!1067522 (validKeyInArray!0 (select (arr!50183 _keys!637) from!782)))))

(declare-fun b!1561270 () Bool)

(declare-fun e!870061 () Bool)

(declare-fun tp_is_empty!38631 () Bool)

(assert (=> b!1561270 (= e!870061 tp_is_empty!38631)))

(declare-fun res!1067519 () Bool)

(assert (=> start!133548 (=> (not res!1067519) (not e!870062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133548 (= res!1067519 (validMask!0 mask!947))))

(assert (=> start!133548 e!870062))

(assert (=> start!133548 tp!113019))

(assert (=> start!133548 tp_is_empty!38631))

(assert (=> start!133548 true))

(declare-fun array_inv!39007 (array!103982) Bool)

(assert (=> start!133548 (array_inv!39007 _keys!637)))

(declare-fun e!870060 () Bool)

(declare-fun array_inv!39008 (array!103980) Bool)

(assert (=> start!133548 (and (array_inv!39008 _values!487) e!870060)))

(declare-fun b!1561272 () Bool)

(declare-fun res!1067520 () Bool)

(assert (=> b!1561272 (=> (not res!1067520) (not e!870062))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561272 (= res!1067520 (and (= (size!50732 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50733 _keys!637) (size!50732 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561273 () Bool)

(assert (=> b!1561273 (= e!870063 tp_is_empty!38631)))

(declare-fun mapIsEmpty!59322 () Bool)

(assert (=> mapIsEmpty!59322 mapRes!59322))

(declare-fun b!1561274 () Bool)

(assert (=> b!1561274 (= e!870062 (not true))))

(declare-datatypes ((tuple2!25060 0))(
  ( (tuple2!25061 (_1!12541 (_ BitVec 64)) (_2!12541 V!59715)) )
))
(declare-datatypes ((List!36430 0))(
  ( (Nil!36427) (Cons!36426 (h!37872 tuple2!25060) (t!51185 List!36430)) )
))
(declare-datatypes ((ListLongMap!22495 0))(
  ( (ListLongMap!22496 (toList!11263 List!36430)) )
))
(declare-fun lt!671158 () ListLongMap!22495)

(declare-fun lt!671159 () V!59715)

(declare-fun contains!10253 (ListLongMap!22495 (_ BitVec 64)) Bool)

(declare-fun +!5033 (ListLongMap!22495 tuple2!25060) ListLongMap!22495)

(assert (=> b!1561274 (not (contains!10253 (+!5033 lt!671158 (tuple2!25061 (select (arr!50183 _keys!637) from!782) lt!671159)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51920 0))(
  ( (Unit!51921) )
))
(declare-fun lt!671160 () Unit!51920)

(declare-fun addStillNotContains!523 (ListLongMap!22495 (_ BitVec 64) V!59715 (_ BitVec 64)) Unit!51920)

(assert (=> b!1561274 (= lt!671160 (addStillNotContains!523 lt!671158 (select (arr!50183 _keys!637) from!782) lt!671159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26198 (ValueCell!18285 V!59715) V!59715)

(declare-fun dynLambda!3817 (Int (_ BitVec 64)) V!59715)

(assert (=> b!1561274 (= lt!671159 (get!26198 (select (arr!50182 _values!487) from!782) (dynLambda!3817 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59715)

(declare-fun minValue!453 () V!59715)

(declare-fun getCurrentListMapNoExtraKeys!6647 (array!103982 array!103980 (_ BitVec 32) (_ BitVec 32) V!59715 V!59715 (_ BitVec 32) Int) ListLongMap!22495)

(assert (=> b!1561274 (= lt!671158 (getCurrentListMapNoExtraKeys!6647 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561275 () Bool)

(assert (=> b!1561275 (= e!870060 (and e!870061 mapRes!59322))))

(declare-fun condMapEmpty!59322 () Bool)

(declare-fun mapDefault!59322 () ValueCell!18285)

(assert (=> b!1561275 (= condMapEmpty!59322 (= (arr!50182 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18285)) mapDefault!59322)))))

(declare-fun b!1561276 () Bool)

(declare-fun res!1067523 () Bool)

(assert (=> b!1561276 (=> (not res!1067523) (not e!870062))))

(declare-datatypes ((List!36431 0))(
  ( (Nil!36428) (Cons!36427 (h!37873 (_ BitVec 64)) (t!51186 List!36431)) )
))
(declare-fun arrayNoDuplicates!0 (array!103982 (_ BitVec 32) List!36431) Bool)

(assert (=> b!1561276 (= res!1067523 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36428))))

(assert (= (and start!133548 res!1067519) b!1561272))

(assert (= (and b!1561272 res!1067520) b!1561268))

(assert (= (and b!1561268 res!1067521) b!1561276))

(assert (= (and b!1561276 res!1067523) b!1561269))

(assert (= (and b!1561269 res!1067518) b!1561271))

(assert (= (and b!1561271 res!1067522) b!1561274))

(assert (= (and b!1561275 condMapEmpty!59322) mapIsEmpty!59322))

(assert (= (and b!1561275 (not condMapEmpty!59322)) mapNonEmpty!59322))

(get-info :version)

(assert (= (and mapNonEmpty!59322 ((_ is ValueCellFull!18285) mapValue!59322)) b!1561273))

(assert (= (and b!1561275 ((_ is ValueCellFull!18285) mapDefault!59322)) b!1561270))

(assert (= start!133548 b!1561275))

(declare-fun b_lambda!24839 () Bool)

(assert (=> (not b_lambda!24839) (not b!1561274)))

(declare-fun t!51184 () Bool)

(declare-fun tb!12509 () Bool)

(assert (=> (and start!133548 (= defaultEntry!495 defaultEntry!495) t!51184) tb!12509))

(declare-fun result!26299 () Bool)

(assert (=> tb!12509 (= result!26299 tp_is_empty!38631)))

(assert (=> b!1561274 t!51184))

(declare-fun b_and!51443 () Bool)

(assert (= b_and!51441 (and (=> t!51184 result!26299) b_and!51443)))

(declare-fun m!1436941 () Bool)

(assert (=> b!1561276 m!1436941))

(declare-fun m!1436943 () Bool)

(assert (=> mapNonEmpty!59322 m!1436943))

(declare-fun m!1436945 () Bool)

(assert (=> start!133548 m!1436945))

(declare-fun m!1436947 () Bool)

(assert (=> start!133548 m!1436947))

(declare-fun m!1436949 () Bool)

(assert (=> start!133548 m!1436949))

(declare-fun m!1436951 () Bool)

(assert (=> b!1561271 m!1436951))

(assert (=> b!1561271 m!1436951))

(declare-fun m!1436953 () Bool)

(assert (=> b!1561271 m!1436953))

(declare-fun m!1436955 () Bool)

(assert (=> b!1561268 m!1436955))

(declare-fun m!1436957 () Bool)

(assert (=> b!1561274 m!1436957))

(declare-fun m!1436959 () Bool)

(assert (=> b!1561274 m!1436959))

(declare-fun m!1436961 () Bool)

(assert (=> b!1561274 m!1436961))

(declare-fun m!1436963 () Bool)

(assert (=> b!1561274 m!1436963))

(assert (=> b!1561274 m!1436957))

(assert (=> b!1561274 m!1436951))

(declare-fun m!1436965 () Bool)

(assert (=> b!1561274 m!1436965))

(assert (=> b!1561274 m!1436951))

(assert (=> b!1561274 m!1436963))

(declare-fun m!1436967 () Bool)

(assert (=> b!1561274 m!1436967))

(assert (=> b!1561274 m!1436959))

(declare-fun m!1436969 () Bool)

(assert (=> b!1561274 m!1436969))

(check-sat (not b_next!31965) (not b!1561274) (not b!1561276) (not mapNonEmpty!59322) (not b!1561271) b_and!51443 (not b!1561268) tp_is_empty!38631 (not start!133548) (not b_lambda!24839))
(check-sat b_and!51443 (not b_next!31965))
