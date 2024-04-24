; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133874 () Bool)

(assert start!133874)

(declare-fun b!1562739 () Bool)

(declare-fun e!870927 () Bool)

(assert (=> b!1562739 (= e!870927 false)))

(declare-fun lt!671882 () Bool)

(declare-datatypes ((V!59601 0))(
  ( (V!59602 (val!19356 Int)) )
))
(declare-datatypes ((tuple2!25090 0))(
  ( (tuple2!25091 (_1!12556 (_ BitVec 64)) (_2!12556 V!59601)) )
))
(declare-datatypes ((List!36412 0))(
  ( (Nil!36409) (Cons!36408 (h!37872 tuple2!25090) (t!51137 List!36412)) )
))
(declare-datatypes ((ListLongMap!22533 0))(
  ( (ListLongMap!22534 (toList!11282 List!36412)) )
))
(declare-fun contains!10283 (ListLongMap!22533 (_ BitVec 64)) Bool)

(assert (=> b!1562739 (= lt!671882 (contains!10283 (ListLongMap!22534 Nil!36409) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59193 () Bool)

(declare-fun mapRes!59193 () Bool)

(declare-fun tp!112848 () Bool)

(declare-fun e!870928 () Bool)

(assert (=> mapNonEmpty!59193 (= mapRes!59193 (and tp!112848 e!870928))))

(declare-datatypes ((ValueCell!18242 0))(
  ( (ValueCellFull!18242 (v!22100 V!59601)) (EmptyCell!18242) )
))
(declare-fun mapRest!59193 () (Array (_ BitVec 32) ValueCell!18242))

(declare-fun mapKey!59193 () (_ BitVec 32))

(declare-datatypes ((array!103934 0))(
  ( (array!103935 (arr!50152 (Array (_ BitVec 32) ValueCell!18242)) (size!50703 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103934)

(declare-fun mapValue!59193 () ValueCell!18242)

(assert (=> mapNonEmpty!59193 (= (arr!50152 _values!487) (store mapRest!59193 mapKey!59193 mapValue!59193))))

(declare-fun b!1562740 () Bool)

(declare-fun res!1067823 () Bool)

(assert (=> b!1562740 (=> (not res!1067823) (not e!870927))))

(declare-datatypes ((array!103936 0))(
  ( (array!103937 (arr!50153 (Array (_ BitVec 32) (_ BitVec 64))) (size!50704 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103936)

(declare-datatypes ((List!36413 0))(
  ( (Nil!36410) (Cons!36409 (h!37873 (_ BitVec 64)) (t!51138 List!36413)) )
))
(declare-fun arrayNoDuplicates!0 (array!103936 (_ BitVec 32) List!36413) Bool)

(assert (=> b!1562740 (= res!1067823 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36410))))

(declare-fun res!1067824 () Bool)

(assert (=> start!133874 (=> (not res!1067824) (not e!870927))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133874 (= res!1067824 (validMask!0 mask!947))))

(assert (=> start!133874 e!870927))

(assert (=> start!133874 true))

(declare-fun array_inv!39239 (array!103936) Bool)

(assert (=> start!133874 (array_inv!39239 _keys!637)))

(declare-fun e!870925 () Bool)

(declare-fun array_inv!39240 (array!103934) Bool)

(assert (=> start!133874 (and (array_inv!39240 _values!487) e!870925)))

(declare-fun b!1562741 () Bool)

(declare-fun e!870924 () Bool)

(declare-fun tp_is_empty!38545 () Bool)

(assert (=> b!1562741 (= e!870924 tp_is_empty!38545)))

(declare-fun b!1562742 () Bool)

(declare-fun res!1067825 () Bool)

(assert (=> b!1562742 (=> (not res!1067825) (not e!870927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103936 (_ BitVec 32)) Bool)

(assert (=> b!1562742 (= res!1067825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562743 () Bool)

(declare-fun res!1067821 () Bool)

(assert (=> b!1562743 (=> (not res!1067821) (not e!870927))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562743 (= res!1067821 (and (= (size!50703 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50704 _keys!637) (size!50703 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562744 () Bool)

(declare-fun res!1067822 () Bool)

(assert (=> b!1562744 (=> (not res!1067822) (not e!870927))))

(assert (=> b!1562744 (= res!1067822 (not (contains!10283 (ListLongMap!22534 Nil!36409) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1562745 () Bool)

(assert (=> b!1562745 (= e!870928 tp_is_empty!38545)))

(declare-fun b!1562746 () Bool)

(declare-fun res!1067820 () Bool)

(assert (=> b!1562746 (=> (not res!1067820) (not e!870927))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1562746 (= res!1067820 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50704 _keys!637)) (bvsge from!782 (size!50704 _keys!637))))))

(declare-fun b!1562747 () Bool)

(assert (=> b!1562747 (= e!870925 (and e!870924 mapRes!59193))))

(declare-fun condMapEmpty!59193 () Bool)

(declare-fun mapDefault!59193 () ValueCell!18242)

(assert (=> b!1562747 (= condMapEmpty!59193 (= (arr!50152 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18242)) mapDefault!59193)))))

(declare-fun mapIsEmpty!59193 () Bool)

(assert (=> mapIsEmpty!59193 mapRes!59193))

(assert (= (and start!133874 res!1067824) b!1562743))

(assert (= (and b!1562743 res!1067821) b!1562742))

(assert (= (and b!1562742 res!1067825) b!1562740))

(assert (= (and b!1562740 res!1067823) b!1562746))

(assert (= (and b!1562746 res!1067820) b!1562744))

(assert (= (and b!1562744 res!1067822) b!1562739))

(assert (= (and b!1562747 condMapEmpty!59193) mapIsEmpty!59193))

(assert (= (and b!1562747 (not condMapEmpty!59193)) mapNonEmpty!59193))

(get-info :version)

(assert (= (and mapNonEmpty!59193 ((_ is ValueCellFull!18242) mapValue!59193)) b!1562745))

(assert (= (and b!1562747 ((_ is ValueCellFull!18242) mapDefault!59193)) b!1562741))

(assert (= start!133874 b!1562747))

(declare-fun m!1438455 () Bool)

(assert (=> b!1562742 m!1438455))

(declare-fun m!1438457 () Bool)

(assert (=> b!1562740 m!1438457))

(declare-fun m!1438459 () Bool)

(assert (=> mapNonEmpty!59193 m!1438459))

(declare-fun m!1438461 () Bool)

(assert (=> start!133874 m!1438461))

(declare-fun m!1438463 () Bool)

(assert (=> start!133874 m!1438463))

(declare-fun m!1438465 () Bool)

(assert (=> start!133874 m!1438465))

(declare-fun m!1438467 () Bool)

(assert (=> b!1562744 m!1438467))

(declare-fun m!1438469 () Bool)

(assert (=> b!1562739 m!1438469))

(check-sat (not b!1562739) (not mapNonEmpty!59193) (not b!1562742) tp_is_empty!38545 (not b!1562740) (not start!133874) (not b!1562744))
(check-sat)
