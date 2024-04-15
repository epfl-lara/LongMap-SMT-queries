; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133538 () Bool)

(assert start!133538)

(declare-fun b_free!32005 () Bool)

(declare-fun b_next!32005 () Bool)

(assert (=> start!133538 (= b_free!32005 (not b_next!32005))))

(declare-fun tp!113140 () Bool)

(declare-fun b_and!51503 () Bool)

(assert (=> start!133538 (= tp!113140 b_and!51503)))

(declare-fun b!1561544 () Bool)

(declare-fun res!1067759 () Bool)

(declare-fun e!870174 () Bool)

(assert (=> b!1561544 (=> (not res!1067759) (not e!870174))))

(declare-datatypes ((array!103972 0))(
  ( (array!103973 (arr!50179 (Array (_ BitVec 32) (_ BitVec 64))) (size!50731 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103972)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103972 (_ BitVec 32)) Bool)

(assert (=> b!1561544 (= res!1067759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561545 () Bool)

(declare-fun res!1067763 () Bool)

(assert (=> b!1561545 (=> (not res!1067763) (not e!870174))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561545 (= res!1067763 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50731 _keys!637)) (bvslt from!782 (size!50731 _keys!637))))))

(declare-fun b!1561546 () Bool)

(declare-fun res!1067762 () Bool)

(assert (=> b!1561546 (=> (not res!1067762) (not e!870174))))

(declare-datatypes ((V!59769 0))(
  ( (V!59770 (val!19419 Int)) )
))
(declare-datatypes ((ValueCell!18305 0))(
  ( (ValueCellFull!18305 (v!22167 V!59769)) (EmptyCell!18305) )
))
(declare-datatypes ((array!103974 0))(
  ( (array!103975 (arr!50180 (Array (_ BitVec 32) ValueCell!18305)) (size!50732 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103974)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561546 (= res!1067762 (and (= (size!50732 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50731 _keys!637) (size!50732 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561547 () Bool)

(declare-fun e!870173 () Bool)

(declare-fun e!870171 () Bool)

(declare-fun mapRes!59382 () Bool)

(assert (=> b!1561547 (= e!870173 (and e!870171 mapRes!59382))))

(declare-fun condMapEmpty!59382 () Bool)

(declare-fun mapDefault!59382 () ValueCell!18305)

(assert (=> b!1561547 (= condMapEmpty!59382 (= (arr!50180 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18305)) mapDefault!59382)))))

(declare-fun mapNonEmpty!59382 () Bool)

(declare-fun tp!113139 () Bool)

(declare-fun e!870175 () Bool)

(assert (=> mapNonEmpty!59382 (= mapRes!59382 (and tp!113139 e!870175))))

(declare-fun mapRest!59382 () (Array (_ BitVec 32) ValueCell!18305))

(declare-fun mapKey!59382 () (_ BitVec 32))

(declare-fun mapValue!59382 () ValueCell!18305)

(assert (=> mapNonEmpty!59382 (= (arr!50180 _values!487) (store mapRest!59382 mapKey!59382 mapValue!59382))))

(declare-fun b!1561548 () Bool)

(declare-fun tp_is_empty!38671 () Bool)

(assert (=> b!1561548 (= e!870175 tp_is_empty!38671)))

(declare-fun b!1561549 () Bool)

(assert (=> b!1561549 (= e!870174 (not true))))

(declare-fun lt!671077 () Bool)

(declare-datatypes ((tuple2!25154 0))(
  ( (tuple2!25155 (_1!12588 (_ BitVec 64)) (_2!12588 V!59769)) )
))
(declare-datatypes ((List!36493 0))(
  ( (Nil!36490) (Cons!36489 (h!37936 tuple2!25154) (t!51280 List!36493)) )
))
(declare-datatypes ((ListLongMap!22589 0))(
  ( (ListLongMap!22590 (toList!11310 List!36493)) )
))
(declare-fun lt!671078 () ListLongMap!22589)

(declare-fun contains!10220 (ListLongMap!22589 (_ BitVec 64)) Bool)

(assert (=> b!1561549 (= lt!671077 (contains!10220 lt!671078 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561549 (not (contains!10220 lt!671078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671075 () ListLongMap!22589)

(declare-fun lt!671076 () V!59769)

(declare-fun +!5075 (ListLongMap!22589 tuple2!25154) ListLongMap!22589)

(assert (=> b!1561549 (= lt!671078 (+!5075 lt!671075 (tuple2!25155 (select (arr!50179 _keys!637) from!782) lt!671076)))))

(declare-datatypes ((Unit!51758 0))(
  ( (Unit!51759) )
))
(declare-fun lt!671074 () Unit!51758)

(declare-fun addStillNotContains!522 (ListLongMap!22589 (_ BitVec 64) V!59769 (_ BitVec 64)) Unit!51758)

(assert (=> b!1561549 (= lt!671074 (addStillNotContains!522 lt!671075 (select (arr!50179 _keys!637) from!782) lt!671076 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26222 (ValueCell!18305 V!59769) V!59769)

(declare-fun dynLambda!3851 (Int (_ BitVec 64)) V!59769)

(assert (=> b!1561549 (= lt!671076 (get!26222 (select (arr!50180 _values!487) from!782) (dynLambda!3851 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!453 () V!59769)

(declare-fun zeroValue!453 () V!59769)

(declare-fun getCurrentListMapNoExtraKeys!6684 (array!103972 array!103974 (_ BitVec 32) (_ BitVec 32) V!59769 V!59769 (_ BitVec 32) Int) ListLongMap!22589)

(assert (=> b!1561549 (= lt!671075 (getCurrentListMapNoExtraKeys!6684 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59382 () Bool)

(assert (=> mapIsEmpty!59382 mapRes!59382))

(declare-fun res!1067761 () Bool)

(assert (=> start!133538 (=> (not res!1067761) (not e!870174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133538 (= res!1067761 (validMask!0 mask!947))))

(assert (=> start!133538 e!870174))

(assert (=> start!133538 tp!113140))

(assert (=> start!133538 tp_is_empty!38671))

(assert (=> start!133538 true))

(declare-fun array_inv!39187 (array!103972) Bool)

(assert (=> start!133538 (array_inv!39187 _keys!637)))

(declare-fun array_inv!39188 (array!103974) Bool)

(assert (=> start!133538 (and (array_inv!39188 _values!487) e!870173)))

(declare-fun b!1561550 () Bool)

(declare-fun res!1067758 () Bool)

(assert (=> b!1561550 (=> (not res!1067758) (not e!870174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561550 (= res!1067758 (validKeyInArray!0 (select (arr!50179 _keys!637) from!782)))))

(declare-fun b!1561551 () Bool)

(declare-fun res!1067760 () Bool)

(assert (=> b!1561551 (=> (not res!1067760) (not e!870174))))

(declare-datatypes ((List!36494 0))(
  ( (Nil!36491) (Cons!36490 (h!37937 (_ BitVec 64)) (t!51281 List!36494)) )
))
(declare-fun arrayNoDuplicates!0 (array!103972 (_ BitVec 32) List!36494) Bool)

(assert (=> b!1561551 (= res!1067760 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36491))))

(declare-fun b!1561552 () Bool)

(assert (=> b!1561552 (= e!870171 tp_is_empty!38671)))

(assert (= (and start!133538 res!1067761) b!1561546))

(assert (= (and b!1561546 res!1067762) b!1561544))

(assert (= (and b!1561544 res!1067759) b!1561551))

(assert (= (and b!1561551 res!1067760) b!1561545))

(assert (= (and b!1561545 res!1067763) b!1561550))

(assert (= (and b!1561550 res!1067758) b!1561549))

(assert (= (and b!1561547 condMapEmpty!59382) mapIsEmpty!59382))

(assert (= (and b!1561547 (not condMapEmpty!59382)) mapNonEmpty!59382))

(get-info :version)

(assert (= (and mapNonEmpty!59382 ((_ is ValueCellFull!18305) mapValue!59382)) b!1561548))

(assert (= (and b!1561547 ((_ is ValueCellFull!18305) mapDefault!59382)) b!1561552))

(assert (= start!133538 b!1561547))

(declare-fun b_lambda!24869 () Bool)

(assert (=> (not b_lambda!24869) (not b!1561549)))

(declare-fun t!51279 () Bool)

(declare-fun tb!12541 () Bool)

(assert (=> (and start!133538 (= defaultEntry!495 defaultEntry!495) t!51279) tb!12541))

(declare-fun result!26371 () Bool)

(assert (=> tb!12541 (= result!26371 tp_is_empty!38671)))

(assert (=> b!1561549 t!51279))

(declare-fun b_and!51505 () Bool)

(assert (= b_and!51503 (and (=> t!51279 result!26371) b_and!51505)))

(declare-fun m!1436661 () Bool)

(assert (=> b!1561544 m!1436661))

(declare-fun m!1436663 () Bool)

(assert (=> b!1561551 m!1436663))

(declare-fun m!1436665 () Bool)

(assert (=> mapNonEmpty!59382 m!1436665))

(declare-fun m!1436667 () Bool)

(assert (=> start!133538 m!1436667))

(declare-fun m!1436669 () Bool)

(assert (=> start!133538 m!1436669))

(declare-fun m!1436671 () Bool)

(assert (=> start!133538 m!1436671))

(declare-fun m!1436673 () Bool)

(assert (=> b!1561549 m!1436673))

(declare-fun m!1436675 () Bool)

(assert (=> b!1561549 m!1436675))

(declare-fun m!1436677 () Bool)

(assert (=> b!1561549 m!1436677))

(declare-fun m!1436679 () Bool)

(assert (=> b!1561549 m!1436679))

(declare-fun m!1436681 () Bool)

(assert (=> b!1561549 m!1436681))

(declare-fun m!1436683 () Bool)

(assert (=> b!1561549 m!1436683))

(assert (=> b!1561549 m!1436673))

(assert (=> b!1561549 m!1436679))

(assert (=> b!1561549 m!1436675))

(declare-fun m!1436685 () Bool)

(assert (=> b!1561549 m!1436685))

(declare-fun m!1436687 () Bool)

(assert (=> b!1561549 m!1436687))

(declare-fun m!1436689 () Bool)

(assert (=> b!1561549 m!1436689))

(assert (=> b!1561550 m!1436679))

(assert (=> b!1561550 m!1436679))

(declare-fun m!1436691 () Bool)

(assert (=> b!1561550 m!1436691))

(check-sat (not b!1561544) (not mapNonEmpty!59382) (not b!1561549) (not b!1561550) (not b!1561551) (not b_next!32005) b_and!51505 tp_is_empty!38671 (not b_lambda!24869) (not start!133538))
(check-sat b_and!51505 (not b_next!32005))
