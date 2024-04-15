; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133478 () Bool)

(assert start!133478)

(declare-fun b_free!31945 () Bool)

(declare-fun b_next!31945 () Bool)

(assert (=> start!133478 (= b_free!31945 (not b_next!31945))))

(declare-fun tp!112960 () Bool)

(declare-fun b_and!51383 () Bool)

(assert (=> start!133478 (= tp!112960 b_and!51383)))

(declare-fun b!1560665 () Bool)

(declare-fun e!869716 () Bool)

(declare-fun tp_is_empty!38611 () Bool)

(assert (=> b!1560665 (= e!869716 tp_is_empty!38611)))

(declare-fun b!1560666 () Bool)

(declare-fun e!869714 () Bool)

(assert (=> b!1560666 (= e!869714 (not true))))

(declare-datatypes ((array!103858 0))(
  ( (array!103859 (arr!50122 (Array (_ BitVec 32) (_ BitVec 64))) (size!50674 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103858)

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((V!59689 0))(
  ( (V!59690 (val!19389 Int)) )
))
(declare-datatypes ((tuple2!25114 0))(
  ( (tuple2!25115 (_1!12568 (_ BitVec 64)) (_2!12568 V!59689)) )
))
(declare-datatypes ((List!36452 0))(
  ( (Nil!36449) (Cons!36448 (h!37895 tuple2!25114) (t!51179 List!36452)) )
))
(declare-datatypes ((ListLongMap!22549 0))(
  ( (ListLongMap!22550 (toList!11290 List!36452)) )
))
(declare-fun lt!670784 () ListLongMap!22549)

(declare-fun lt!670782 () V!59689)

(declare-fun contains!10200 (ListLongMap!22549 (_ BitVec 64)) Bool)

(declare-fun +!5055 (ListLongMap!22549 tuple2!25114) ListLongMap!22549)

(assert (=> b!1560666 (not (contains!10200 (+!5055 lt!670784 (tuple2!25115 (select (arr!50122 _keys!637) from!782) lt!670782)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51718 0))(
  ( (Unit!51719) )
))
(declare-fun lt!670783 () Unit!51718)

(declare-fun addStillNotContains!502 (ListLongMap!22549 (_ BitVec 64) V!59689 (_ BitVec 64)) Unit!51718)

(assert (=> b!1560666 (= lt!670783 (addStillNotContains!502 lt!670784 (select (arr!50122 _keys!637) from!782) lt!670782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18275 0))(
  ( (ValueCellFull!18275 (v!22137 V!59689)) (EmptyCell!18275) )
))
(declare-datatypes ((array!103860 0))(
  ( (array!103861 (arr!50123 (Array (_ BitVec 32) ValueCell!18275)) (size!50675 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103860)

(declare-fun get!26182 (ValueCell!18275 V!59689) V!59689)

(declare-fun dynLambda!3831 (Int (_ BitVec 64)) V!59689)

(assert (=> b!1560666 (= lt!670782 (get!26182 (select (arr!50123 _values!487) from!782) (dynLambda!3831 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59689)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59689)

(declare-fun getCurrentListMapNoExtraKeys!6664 (array!103858 array!103860 (_ BitVec 32) (_ BitVec 32) V!59689 V!59689 (_ BitVec 32) Int) ListLongMap!22549)

(assert (=> b!1560666 (= lt!670784 (getCurrentListMapNoExtraKeys!6664 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59292 () Bool)

(declare-fun mapRes!59292 () Bool)

(assert (=> mapIsEmpty!59292 mapRes!59292))

(declare-fun b!1560667 () Bool)

(declare-fun res!1067211 () Bool)

(assert (=> b!1560667 (=> (not res!1067211) (not e!869714))))

(declare-datatypes ((List!36453 0))(
  ( (Nil!36450) (Cons!36449 (h!37896 (_ BitVec 64)) (t!51180 List!36453)) )
))
(declare-fun arrayNoDuplicates!0 (array!103858 (_ BitVec 32) List!36453) Bool)

(assert (=> b!1560667 (= res!1067211 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36450))))

(declare-fun b!1560668 () Bool)

(declare-fun res!1067209 () Bool)

(assert (=> b!1560668 (=> (not res!1067209) (not e!869714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1560668 (= res!1067209 (validKeyInArray!0 (select (arr!50122 _keys!637) from!782)))))

(declare-fun b!1560669 () Bool)

(declare-fun e!869713 () Bool)

(declare-fun e!869715 () Bool)

(assert (=> b!1560669 (= e!869713 (and e!869715 mapRes!59292))))

(declare-fun condMapEmpty!59292 () Bool)

(declare-fun mapDefault!59292 () ValueCell!18275)

(assert (=> b!1560669 (= condMapEmpty!59292 (= (arr!50123 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18275)) mapDefault!59292)))))

(declare-fun res!1067213 () Bool)

(assert (=> start!133478 (=> (not res!1067213) (not e!869714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133478 (= res!1067213 (validMask!0 mask!947))))

(assert (=> start!133478 e!869714))

(assert (=> start!133478 tp!112960))

(assert (=> start!133478 tp_is_empty!38611))

(assert (=> start!133478 true))

(declare-fun array_inv!39153 (array!103858) Bool)

(assert (=> start!133478 (array_inv!39153 _keys!637)))

(declare-fun array_inv!39154 (array!103860) Bool)

(assert (=> start!133478 (and (array_inv!39154 _values!487) e!869713)))

(declare-fun b!1560670 () Bool)

(declare-fun res!1067210 () Bool)

(assert (=> b!1560670 (=> (not res!1067210) (not e!869714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103858 (_ BitVec 32)) Bool)

(assert (=> b!1560670 (= res!1067210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59292 () Bool)

(declare-fun tp!112959 () Bool)

(assert (=> mapNonEmpty!59292 (= mapRes!59292 (and tp!112959 e!869716))))

(declare-fun mapKey!59292 () (_ BitVec 32))

(declare-fun mapValue!59292 () ValueCell!18275)

(declare-fun mapRest!59292 () (Array (_ BitVec 32) ValueCell!18275))

(assert (=> mapNonEmpty!59292 (= (arr!50123 _values!487) (store mapRest!59292 mapKey!59292 mapValue!59292))))

(declare-fun b!1560671 () Bool)

(assert (=> b!1560671 (= e!869715 tp_is_empty!38611)))

(declare-fun b!1560672 () Bool)

(declare-fun res!1067214 () Bool)

(assert (=> b!1560672 (=> (not res!1067214) (not e!869714))))

(assert (=> b!1560672 (= res!1067214 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50674 _keys!637)) (bvslt from!782 (size!50674 _keys!637))))))

(declare-fun b!1560673 () Bool)

(declare-fun res!1067212 () Bool)

(assert (=> b!1560673 (=> (not res!1067212) (not e!869714))))

(assert (=> b!1560673 (= res!1067212 (and (= (size!50675 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50674 _keys!637) (size!50675 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133478 res!1067213) b!1560673))

(assert (= (and b!1560673 res!1067212) b!1560670))

(assert (= (and b!1560670 res!1067210) b!1560667))

(assert (= (and b!1560667 res!1067211) b!1560672))

(assert (= (and b!1560672 res!1067214) b!1560668))

(assert (= (and b!1560668 res!1067209) b!1560666))

(assert (= (and b!1560669 condMapEmpty!59292) mapIsEmpty!59292))

(assert (= (and b!1560669 (not condMapEmpty!59292)) mapNonEmpty!59292))

(get-info :version)

(assert (= (and mapNonEmpty!59292 ((_ is ValueCellFull!18275) mapValue!59292)) b!1560665))

(assert (= (and b!1560669 ((_ is ValueCellFull!18275) mapDefault!59292)) b!1560671))

(assert (= start!133478 b!1560669))

(declare-fun b_lambda!24809 () Bool)

(assert (=> (not b_lambda!24809) (not b!1560666)))

(declare-fun t!51178 () Bool)

(declare-fun tb!12481 () Bool)

(assert (=> (and start!133478 (= defaultEntry!495 defaultEntry!495) t!51178) tb!12481))

(declare-fun result!26251 () Bool)

(assert (=> tb!12481 (= result!26251 tp_is_empty!38611)))

(assert (=> b!1560666 t!51178))

(declare-fun b_and!51385 () Bool)

(assert (= b_and!51383 (and (=> t!51178 result!26251) b_and!51385)))

(declare-fun m!1435749 () Bool)

(assert (=> mapNonEmpty!59292 m!1435749))

(declare-fun m!1435751 () Bool)

(assert (=> b!1560667 m!1435751))

(declare-fun m!1435753 () Bool)

(assert (=> b!1560666 m!1435753))

(declare-fun m!1435755 () Bool)

(assert (=> b!1560666 m!1435755))

(declare-fun m!1435757 () Bool)

(assert (=> b!1560666 m!1435757))

(assert (=> b!1560666 m!1435753))

(declare-fun m!1435759 () Bool)

(assert (=> b!1560666 m!1435759))

(declare-fun m!1435761 () Bool)

(assert (=> b!1560666 m!1435761))

(assert (=> b!1560666 m!1435755))

(declare-fun m!1435763 () Bool)

(assert (=> b!1560666 m!1435763))

(assert (=> b!1560666 m!1435761))

(declare-fun m!1435765 () Bool)

(assert (=> b!1560666 m!1435765))

(assert (=> b!1560666 m!1435759))

(declare-fun m!1435767 () Bool)

(assert (=> b!1560666 m!1435767))

(assert (=> b!1560668 m!1435759))

(assert (=> b!1560668 m!1435759))

(declare-fun m!1435769 () Bool)

(assert (=> b!1560668 m!1435769))

(declare-fun m!1435771 () Bool)

(assert (=> start!133478 m!1435771))

(declare-fun m!1435773 () Bool)

(assert (=> start!133478 m!1435773))

(declare-fun m!1435775 () Bool)

(assert (=> start!133478 m!1435775))

(declare-fun m!1435777 () Bool)

(assert (=> b!1560670 m!1435777))

(check-sat (not b_next!31945) (not b!1560666) b_and!51385 (not b_lambda!24809) (not b!1560667) (not start!133478) (not mapNonEmpty!59292) tp_is_empty!38611 (not b!1560670) (not b!1560668))
(check-sat b_and!51385 (not b_next!31945))
