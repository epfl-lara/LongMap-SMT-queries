; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133472 () Bool)

(assert start!133472)

(declare-fun b_free!31939 () Bool)

(declare-fun b_next!31939 () Bool)

(assert (=> start!133472 (= b_free!31939 (not b_next!31939))))

(declare-fun tp!112942 () Bool)

(declare-fun b_and!51377 () Bool)

(assert (=> start!133472 (= tp!112942 b_and!51377)))

(declare-fun mapNonEmpty!59283 () Bool)

(declare-fun mapRes!59283 () Bool)

(declare-fun tp!112941 () Bool)

(declare-fun e!869671 () Bool)

(assert (=> mapNonEmpty!59283 (= mapRes!59283 (and tp!112941 e!869671))))

(declare-fun mapKey!59283 () (_ BitVec 32))

(declare-datatypes ((V!59681 0))(
  ( (V!59682 (val!19386 Int)) )
))
(declare-datatypes ((ValueCell!18272 0))(
  ( (ValueCellFull!18272 (v!22134 V!59681)) (EmptyCell!18272) )
))
(declare-fun mapRest!59283 () (Array (_ BitVec 32) ValueCell!18272))

(declare-datatypes ((array!103846 0))(
  ( (array!103847 (arr!50116 (Array (_ BitVec 32) ValueCell!18272)) (size!50668 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103846)

(declare-fun mapValue!59283 () ValueCell!18272)

(assert (=> mapNonEmpty!59283 (= (arr!50116 _values!487) (store mapRest!59283 mapKey!59283 mapValue!59283))))

(declare-fun b!1560584 () Bool)

(declare-fun res!1067159 () Bool)

(declare-fun e!869668 () Bool)

(assert (=> b!1560584 (=> (not res!1067159) (not e!869668))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103848 0))(
  ( (array!103849 (arr!50117 (Array (_ BitVec 32) (_ BitVec 64))) (size!50669 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103848)

(assert (=> b!1560584 (= res!1067159 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50669 _keys!637)) (bvslt from!782 (size!50669 _keys!637))))))

(declare-fun b!1560585 () Bool)

(declare-fun tp_is_empty!38605 () Bool)

(assert (=> b!1560585 (= e!869671 tp_is_empty!38605)))

(declare-fun mapIsEmpty!59283 () Bool)

(assert (=> mapIsEmpty!59283 mapRes!59283))

(declare-fun res!1067156 () Bool)

(assert (=> start!133472 (=> (not res!1067156) (not e!869668))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133472 (= res!1067156 (validMask!0 mask!947))))

(assert (=> start!133472 e!869668))

(assert (=> start!133472 tp!112942))

(assert (=> start!133472 tp_is_empty!38605))

(assert (=> start!133472 true))

(declare-fun array_inv!39149 (array!103848) Bool)

(assert (=> start!133472 (array_inv!39149 _keys!637)))

(declare-fun e!869667 () Bool)

(declare-fun array_inv!39150 (array!103846) Bool)

(assert (=> start!133472 (and (array_inv!39150 _values!487) e!869667)))

(declare-fun b!1560586 () Bool)

(declare-fun e!869670 () Bool)

(assert (=> b!1560586 (= e!869667 (and e!869670 mapRes!59283))))

(declare-fun condMapEmpty!59283 () Bool)

(declare-fun mapDefault!59283 () ValueCell!18272)

(assert (=> b!1560586 (= condMapEmpty!59283 (= (arr!50116 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18272)) mapDefault!59283)))))

(declare-fun b!1560587 () Bool)

(declare-fun res!1067157 () Bool)

(assert (=> b!1560587 (=> (not res!1067157) (not e!869668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1560587 (= res!1067157 (validKeyInArray!0 (select (arr!50117 _keys!637) from!782)))))

(declare-fun b!1560588 () Bool)

(assert (=> b!1560588 (= e!869670 tp_is_empty!38605)))

(declare-fun b!1560589 () Bool)

(declare-fun res!1067155 () Bool)

(assert (=> b!1560589 (=> (not res!1067155) (not e!869668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103848 (_ BitVec 32)) Bool)

(assert (=> b!1560589 (= res!1067155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560590 () Bool)

(declare-fun res!1067160 () Bool)

(assert (=> b!1560590 (=> (not res!1067160) (not e!869668))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560590 (= res!1067160 (and (= (size!50668 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50669 _keys!637) (size!50668 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560591 () Bool)

(declare-fun res!1067158 () Bool)

(assert (=> b!1560591 (=> (not res!1067158) (not e!869668))))

(declare-datatypes ((List!36448 0))(
  ( (Nil!36445) (Cons!36444 (h!37891 (_ BitVec 64)) (t!51173 List!36448)) )
))
(declare-fun arrayNoDuplicates!0 (array!103848 (_ BitVec 32) List!36448) Bool)

(assert (=> b!1560591 (= res!1067158 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36445))))

(declare-fun b!1560592 () Bool)

(assert (=> b!1560592 (= e!869668 false)))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59681)

(declare-fun minValue!453 () V!59681)

(declare-fun lt!670769 () Bool)

(declare-datatypes ((tuple2!25112 0))(
  ( (tuple2!25113 (_1!12567 (_ BitVec 64)) (_2!12567 V!59681)) )
))
(declare-datatypes ((List!36449 0))(
  ( (Nil!36446) (Cons!36445 (h!37892 tuple2!25112) (t!51174 List!36449)) )
))
(declare-datatypes ((ListLongMap!22547 0))(
  ( (ListLongMap!22548 (toList!11289 List!36449)) )
))
(declare-fun contains!10199 (ListLongMap!22547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6663 (array!103848 array!103846 (_ BitVec 32) (_ BitVec 32) V!59681 V!59681 (_ BitVec 32) Int) ListLongMap!22547)

(assert (=> b!1560592 (= lt!670769 (contains!10199 (getCurrentListMapNoExtraKeys!6663 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!133472 res!1067156) b!1560590))

(assert (= (and b!1560590 res!1067160) b!1560589))

(assert (= (and b!1560589 res!1067155) b!1560591))

(assert (= (and b!1560591 res!1067158) b!1560584))

(assert (= (and b!1560584 res!1067159) b!1560587))

(assert (= (and b!1560587 res!1067157) b!1560592))

(assert (= (and b!1560586 condMapEmpty!59283) mapIsEmpty!59283))

(assert (= (and b!1560586 (not condMapEmpty!59283)) mapNonEmpty!59283))

(get-info :version)

(assert (= (and mapNonEmpty!59283 ((_ is ValueCellFull!18272) mapValue!59283)) b!1560585))

(assert (= (and b!1560586 ((_ is ValueCellFull!18272) mapDefault!59283)) b!1560588))

(assert (= start!133472 b!1560586))

(declare-fun m!1435689 () Bool)

(assert (=> b!1560591 m!1435689))

(declare-fun m!1435691 () Bool)

(assert (=> mapNonEmpty!59283 m!1435691))

(declare-fun m!1435693 () Bool)

(assert (=> start!133472 m!1435693))

(declare-fun m!1435695 () Bool)

(assert (=> start!133472 m!1435695))

(declare-fun m!1435697 () Bool)

(assert (=> start!133472 m!1435697))

(declare-fun m!1435699 () Bool)

(assert (=> b!1560589 m!1435699))

(declare-fun m!1435701 () Bool)

(assert (=> b!1560587 m!1435701))

(assert (=> b!1560587 m!1435701))

(declare-fun m!1435703 () Bool)

(assert (=> b!1560587 m!1435703))

(declare-fun m!1435705 () Bool)

(assert (=> b!1560592 m!1435705))

(assert (=> b!1560592 m!1435705))

(declare-fun m!1435707 () Bool)

(assert (=> b!1560592 m!1435707))

(check-sat (not start!133472) tp_is_empty!38605 (not mapNonEmpty!59283) b_and!51377 (not b!1560592) (not b!1560591) (not b!1560589) (not b_next!31939) (not b!1560587))
(check-sat b_and!51377 (not b_next!31939))
