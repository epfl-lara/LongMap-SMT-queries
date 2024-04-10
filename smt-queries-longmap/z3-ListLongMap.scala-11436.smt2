; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133416 () Bool)

(assert start!133416)

(declare-fun b!1559682 () Bool)

(declare-fun e!869070 () Bool)

(declare-fun tp_is_empty!38499 () Bool)

(assert (=> b!1559682 (= e!869070 tp_is_empty!38499)))

(declare-fun b!1559683 () Bool)

(declare-fun res!1066549 () Bool)

(declare-fun e!869071 () Bool)

(assert (=> b!1559683 (=> (not res!1066549) (not e!869071))))

(declare-datatypes ((array!103724 0))(
  ( (array!103725 (arr!50054 (Array (_ BitVec 32) (_ BitVec 64))) (size!50604 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103724)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103724 (_ BitVec 32)) Bool)

(assert (=> b!1559683 (= res!1066549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1066546 () Bool)

(assert (=> start!133416 (=> (not res!1066546) (not e!869071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133416 (= res!1066546 (validMask!0 mask!947))))

(assert (=> start!133416 e!869071))

(assert (=> start!133416 true))

(declare-fun array_inv!38909 (array!103724) Bool)

(assert (=> start!133416 (array_inv!38909 _keys!637)))

(declare-datatypes ((V!59539 0))(
  ( (V!59540 (val!19333 Int)) )
))
(declare-datatypes ((ValueCell!18219 0))(
  ( (ValueCellFull!18219 (v!22085 V!59539)) (EmptyCell!18219) )
))
(declare-datatypes ((array!103726 0))(
  ( (array!103727 (arr!50055 (Array (_ BitVec 32) ValueCell!18219)) (size!50605 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103726)

(declare-fun e!869074 () Bool)

(declare-fun array_inv!38910 (array!103726) Bool)

(assert (=> start!133416 (and (array_inv!38910 _values!487) e!869074)))

(declare-fun b!1559684 () Bool)

(declare-fun res!1066551 () Bool)

(assert (=> b!1559684 (=> (not res!1066551) (not e!869071))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559684 (= res!1066551 (and (= (size!50605 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50604 _keys!637) (size!50605 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559685 () Bool)

(assert (=> b!1559685 (= e!869071 false)))

(declare-fun lt!670905 () Bool)

(declare-datatypes ((tuple2!25006 0))(
  ( (tuple2!25007 (_1!12514 (_ BitVec 64)) (_2!12514 V!59539)) )
))
(declare-datatypes ((List!36357 0))(
  ( (Nil!36354) (Cons!36353 (h!37799 tuple2!25006) (t!51090 List!36357)) )
))
(declare-datatypes ((ListLongMap!22441 0))(
  ( (ListLongMap!22442 (toList!11236 List!36357)) )
))
(declare-fun contains!10226 (ListLongMap!22441 (_ BitVec 64)) Bool)

(assert (=> b!1559685 (= lt!670905 (contains!10226 (ListLongMap!22442 Nil!36354) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559686 () Bool)

(declare-fun res!1066547 () Bool)

(assert (=> b!1559686 (=> (not res!1066547) (not e!869071))))

(declare-datatypes ((List!36358 0))(
  ( (Nil!36355) (Cons!36354 (h!37800 (_ BitVec 64)) (t!51091 List!36358)) )
))
(declare-fun arrayNoDuplicates!0 (array!103724 (_ BitVec 32) List!36358) Bool)

(assert (=> b!1559686 (= res!1066547 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36355))))

(declare-fun mapIsEmpty!59124 () Bool)

(declare-fun mapRes!59124 () Bool)

(assert (=> mapIsEmpty!59124 mapRes!59124))

(declare-fun b!1559687 () Bool)

(declare-fun res!1066550 () Bool)

(assert (=> b!1559687 (=> (not res!1066550) (not e!869071))))

(assert (=> b!1559687 (= res!1066550 (not (contains!10226 (ListLongMap!22442 Nil!36354) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559688 () Bool)

(declare-fun e!869073 () Bool)

(assert (=> b!1559688 (= e!869073 tp_is_empty!38499)))

(declare-fun b!1559689 () Bool)

(assert (=> b!1559689 (= e!869074 (and e!869070 mapRes!59124))))

(declare-fun condMapEmpty!59124 () Bool)

(declare-fun mapDefault!59124 () ValueCell!18219)

(assert (=> b!1559689 (= condMapEmpty!59124 (= (arr!50055 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18219)) mapDefault!59124)))))

(declare-fun mapNonEmpty!59124 () Bool)

(declare-fun tp!112779 () Bool)

(assert (=> mapNonEmpty!59124 (= mapRes!59124 (and tp!112779 e!869073))))

(declare-fun mapKey!59124 () (_ BitVec 32))

(declare-fun mapRest!59124 () (Array (_ BitVec 32) ValueCell!18219))

(declare-fun mapValue!59124 () ValueCell!18219)

(assert (=> mapNonEmpty!59124 (= (arr!50055 _values!487) (store mapRest!59124 mapKey!59124 mapValue!59124))))

(declare-fun b!1559690 () Bool)

(declare-fun res!1066548 () Bool)

(assert (=> b!1559690 (=> (not res!1066548) (not e!869071))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559690 (= res!1066548 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50604 _keys!637)) (bvsge from!782 (size!50604 _keys!637))))))

(assert (= (and start!133416 res!1066546) b!1559684))

(assert (= (and b!1559684 res!1066551) b!1559683))

(assert (= (and b!1559683 res!1066549) b!1559686))

(assert (= (and b!1559686 res!1066547) b!1559690))

(assert (= (and b!1559690 res!1066548) b!1559687))

(assert (= (and b!1559687 res!1066550) b!1559685))

(assert (= (and b!1559689 condMapEmpty!59124) mapIsEmpty!59124))

(assert (= (and b!1559689 (not condMapEmpty!59124)) mapNonEmpty!59124))

(get-info :version)

(assert (= (and mapNonEmpty!59124 ((_ is ValueCellFull!18219) mapValue!59124)) b!1559688))

(assert (= (and b!1559689 ((_ is ValueCellFull!18219) mapDefault!59124)) b!1559682))

(assert (= start!133416 b!1559689))

(declare-fun m!1435829 () Bool)

(assert (=> b!1559687 m!1435829))

(declare-fun m!1435831 () Bool)

(assert (=> mapNonEmpty!59124 m!1435831))

(declare-fun m!1435833 () Bool)

(assert (=> b!1559683 m!1435833))

(declare-fun m!1435835 () Bool)

(assert (=> b!1559685 m!1435835))

(declare-fun m!1435837 () Bool)

(assert (=> b!1559686 m!1435837))

(declare-fun m!1435839 () Bool)

(assert (=> start!133416 m!1435839))

(declare-fun m!1435841 () Bool)

(assert (=> start!133416 m!1435841))

(declare-fun m!1435843 () Bool)

(assert (=> start!133416 m!1435843))

(check-sat (not b!1559687) (not start!133416) (not b!1559685) (not mapNonEmpty!59124) tp_is_empty!38499 (not b!1559683) (not b!1559686))
(check-sat)
