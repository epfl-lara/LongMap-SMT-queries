; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133988 () Bool)

(assert start!133988)

(declare-fun b_free!31993 () Bool)

(declare-fun b_next!31993 () Bool)

(assert (=> start!133988 (= b_free!31993 (not b_next!31993))))

(declare-fun tp!113103 () Bool)

(declare-fun b_and!51499 () Bool)

(assert (=> start!133988 (= tp!113103 b_and!51499)))

(declare-fun b!1564110 () Bool)

(declare-fun res!1068634 () Bool)

(declare-fun e!871782 () Bool)

(assert (=> b!1564110 (=> (not res!1068634) (not e!871782))))

(declare-datatypes ((array!104152 0))(
  ( (array!104153 (arr!50261 (Array (_ BitVec 32) (_ BitVec 64))) (size!50812 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104152)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564110 (= res!1068634 (validKeyInArray!0 (select (arr!50261 _keys!637) from!782)))))

(declare-fun b!1564111 () Bool)

(assert (=> b!1564111 (= e!871782 (not (bvsge (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!59753 0))(
  ( (V!59754 (val!19413 Int)) )
))
(declare-datatypes ((tuple2!25138 0))(
  ( (tuple2!25139 (_1!12580 (_ BitVec 64)) (_2!12580 V!59753)) )
))
(declare-datatypes ((List!36477 0))(
  ( (Nil!36474) (Cons!36473 (h!37937 tuple2!25138) (t!51252 List!36477)) )
))
(declare-datatypes ((ListLongMap!22581 0))(
  ( (ListLongMap!22582 (toList!11306 List!36477)) )
))
(declare-fun lt!672192 () ListLongMap!22581)

(declare-fun lt!672193 () V!59753)

(declare-fun contains!10307 (ListLongMap!22581 (_ BitVec 64)) Bool)

(declare-fun +!5082 (ListLongMap!22581 tuple2!25138) ListLongMap!22581)

(assert (=> b!1564111 (not (contains!10307 (+!5082 lt!672192 (tuple2!25139 (select (arr!50261 _keys!637) from!782) lt!672193)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51849 0))(
  ( (Unit!51850) )
))
(declare-fun lt!672194 () Unit!51849)

(declare-fun addStillNotContains!533 (ListLongMap!22581 (_ BitVec 64) V!59753 (_ BitVec 64)) Unit!51849)

(assert (=> b!1564111 (= lt!672194 (addStillNotContains!533 lt!672192 (select (arr!50261 _keys!637) from!782) lt!672193 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18299 0))(
  ( (ValueCellFull!18299 (v!22157 V!59753)) (EmptyCell!18299) )
))
(declare-datatypes ((array!104154 0))(
  ( (array!104155 (arr!50262 (Array (_ BitVec 32) ValueCell!18299)) (size!50813 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104154)

(declare-fun get!26258 (ValueCell!18299 V!59753) V!59753)

(declare-fun dynLambda!3880 (Int (_ BitVec 64)) V!59753)

(assert (=> b!1564111 (= lt!672193 (get!26258 (select (arr!50262 _values!487) from!782) (dynLambda!3880 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59753)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59753)

(declare-fun getCurrentListMapNoExtraKeys!6705 (array!104152 array!104154 (_ BitVec 32) (_ BitVec 32) V!59753 V!59753 (_ BitVec 32) Int) ListLongMap!22581)

(assert (=> b!1564111 (= lt!672192 (getCurrentListMapNoExtraKeys!6705 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564112 () Bool)

(declare-fun res!1068631 () Bool)

(assert (=> b!1564112 (=> (not res!1068631) (not e!871782))))

(assert (=> b!1564112 (= res!1068631 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50812 _keys!637)) (bvslt from!782 (size!50812 _keys!637))))))

(declare-fun mapIsEmpty!59364 () Bool)

(declare-fun mapRes!59364 () Bool)

(assert (=> mapIsEmpty!59364 mapRes!59364))

(declare-fun b!1564113 () Bool)

(declare-fun res!1068635 () Bool)

(assert (=> b!1564113 (=> (not res!1068635) (not e!871782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104152 (_ BitVec 32)) Bool)

(assert (=> b!1564113 (= res!1068635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564114 () Bool)

(declare-fun e!871779 () Bool)

(declare-fun tp_is_empty!38659 () Bool)

(assert (=> b!1564114 (= e!871779 tp_is_empty!38659)))

(declare-fun mapNonEmpty!59364 () Bool)

(declare-fun tp!113102 () Bool)

(declare-fun e!871781 () Bool)

(assert (=> mapNonEmpty!59364 (= mapRes!59364 (and tp!113102 e!871781))))

(declare-fun mapKey!59364 () (_ BitVec 32))

(declare-fun mapValue!59364 () ValueCell!18299)

(declare-fun mapRest!59364 () (Array (_ BitVec 32) ValueCell!18299))

(assert (=> mapNonEmpty!59364 (= (arr!50262 _values!487) (store mapRest!59364 mapKey!59364 mapValue!59364))))

(declare-fun b!1564115 () Bool)

(declare-fun e!871780 () Bool)

(assert (=> b!1564115 (= e!871780 (and e!871779 mapRes!59364))))

(declare-fun condMapEmpty!59364 () Bool)

(declare-fun mapDefault!59364 () ValueCell!18299)

(assert (=> b!1564115 (= condMapEmpty!59364 (= (arr!50262 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18299)) mapDefault!59364)))))

(declare-fun b!1564116 () Bool)

(declare-fun res!1068633 () Bool)

(assert (=> b!1564116 (=> (not res!1068633) (not e!871782))))

(declare-datatypes ((List!36478 0))(
  ( (Nil!36475) (Cons!36474 (h!37938 (_ BitVec 64)) (t!51253 List!36478)) )
))
(declare-fun arrayNoDuplicates!0 (array!104152 (_ BitVec 32) List!36478) Bool)

(assert (=> b!1564116 (= res!1068633 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36475))))

(declare-fun res!1068630 () Bool)

(assert (=> start!133988 (=> (not res!1068630) (not e!871782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133988 (= res!1068630 (validMask!0 mask!947))))

(assert (=> start!133988 e!871782))

(assert (=> start!133988 tp!113103))

(assert (=> start!133988 tp_is_empty!38659))

(assert (=> start!133988 true))

(declare-fun array_inv!39311 (array!104152) Bool)

(assert (=> start!133988 (array_inv!39311 _keys!637)))

(declare-fun array_inv!39312 (array!104154) Bool)

(assert (=> start!133988 (and (array_inv!39312 _values!487) e!871780)))

(declare-fun b!1564117 () Bool)

(assert (=> b!1564117 (= e!871781 tp_is_empty!38659)))

(declare-fun b!1564118 () Bool)

(declare-fun res!1068632 () Bool)

(assert (=> b!1564118 (=> (not res!1068632) (not e!871782))))

(assert (=> b!1564118 (= res!1068632 (and (= (size!50813 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50812 _keys!637) (size!50813 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133988 res!1068630) b!1564118))

(assert (= (and b!1564118 res!1068632) b!1564113))

(assert (= (and b!1564113 res!1068635) b!1564116))

(assert (= (and b!1564116 res!1068633) b!1564112))

(assert (= (and b!1564112 res!1068631) b!1564110))

(assert (= (and b!1564110 res!1068634) b!1564111))

(assert (= (and b!1564115 condMapEmpty!59364) mapIsEmpty!59364))

(assert (= (and b!1564115 (not condMapEmpty!59364)) mapNonEmpty!59364))

(get-info :version)

(assert (= (and mapNonEmpty!59364 ((_ is ValueCellFull!18299) mapValue!59364)) b!1564117))

(assert (= (and b!1564115 ((_ is ValueCellFull!18299) mapDefault!59364)) b!1564114))

(assert (= start!133988 b!1564115))

(declare-fun b_lambda!24861 () Bool)

(assert (=> (not b_lambda!24861) (not b!1564111)))

(declare-fun t!51251 () Bool)

(declare-fun tb!12529 () Bool)

(assert (=> (and start!133988 (= defaultEntry!495 defaultEntry!495) t!51251) tb!12529))

(declare-fun result!26347 () Bool)

(assert (=> tb!12529 (= result!26347 tp_is_empty!38659)))

(assert (=> b!1564111 t!51251))

(declare-fun b_and!51501 () Bool)

(assert (= b_and!51499 (and (=> t!51251 result!26347) b_and!51501)))

(declare-fun m!1439619 () Bool)

(assert (=> b!1564116 m!1439619))

(declare-fun m!1439621 () Bool)

(assert (=> b!1564110 m!1439621))

(assert (=> b!1564110 m!1439621))

(declare-fun m!1439623 () Bool)

(assert (=> b!1564110 m!1439623))

(declare-fun m!1439625 () Bool)

(assert (=> mapNonEmpty!59364 m!1439625))

(declare-fun m!1439627 () Bool)

(assert (=> start!133988 m!1439627))

(declare-fun m!1439629 () Bool)

(assert (=> start!133988 m!1439629))

(declare-fun m!1439631 () Bool)

(assert (=> start!133988 m!1439631))

(declare-fun m!1439633 () Bool)

(assert (=> b!1564111 m!1439633))

(declare-fun m!1439635 () Bool)

(assert (=> b!1564111 m!1439635))

(declare-fun m!1439637 () Bool)

(assert (=> b!1564111 m!1439637))

(declare-fun m!1439639 () Bool)

(assert (=> b!1564111 m!1439639))

(declare-fun m!1439641 () Bool)

(assert (=> b!1564111 m!1439641))

(assert (=> b!1564111 m!1439633))

(assert (=> b!1564111 m!1439621))

(assert (=> b!1564111 m!1439635))

(assert (=> b!1564111 m!1439639))

(assert (=> b!1564111 m!1439621))

(declare-fun m!1439643 () Bool)

(assert (=> b!1564111 m!1439643))

(declare-fun m!1439645 () Bool)

(assert (=> b!1564111 m!1439645))

(declare-fun m!1439647 () Bool)

(assert (=> b!1564113 m!1439647))

(check-sat (not b!1564113) (not b!1564116) (not b!1564111) (not b_next!31993) (not start!133988) (not b_lambda!24861) b_and!51501 (not b!1564110) (not mapNonEmpty!59364) tp_is_empty!38659)
(check-sat b_and!51501 (not b_next!31993))
