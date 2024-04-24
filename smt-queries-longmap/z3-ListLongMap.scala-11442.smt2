; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133862 () Bool)

(assert start!133862)

(declare-fun b!1562577 () Bool)

(declare-fun res!1067717 () Bool)

(declare-fun e!870837 () Bool)

(assert (=> b!1562577 (=> (not res!1067717) (not e!870837))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103914 0))(
  ( (array!103915 (arr!50142 (Array (_ BitVec 32) (_ BitVec 64))) (size!50693 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103914)

(declare-datatypes ((V!59585 0))(
  ( (V!59586 (val!19350 Int)) )
))
(declare-datatypes ((ValueCell!18236 0))(
  ( (ValueCellFull!18236 (v!22094 V!59585)) (EmptyCell!18236) )
))
(declare-datatypes ((array!103916 0))(
  ( (array!103917 (arr!50143 (Array (_ BitVec 32) ValueCell!18236)) (size!50694 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103916)

(assert (=> b!1562577 (= res!1067717 (and (= (size!50694 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50693 _keys!637) (size!50694 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562578 () Bool)

(declare-fun res!1067715 () Bool)

(assert (=> b!1562578 (=> (not res!1067715) (not e!870837))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1562578 (= res!1067715 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50693 _keys!637)) (bvsge from!782 (size!50693 _keys!637))))))

(declare-fun b!1562579 () Bool)

(declare-fun res!1067716 () Bool)

(assert (=> b!1562579 (=> (not res!1067716) (not e!870837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103914 (_ BitVec 32)) Bool)

(assert (=> b!1562579 (= res!1067716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1067713 () Bool)

(assert (=> start!133862 (=> (not res!1067713) (not e!870837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133862 (= res!1067713 (validMask!0 mask!947))))

(assert (=> start!133862 e!870837))

(assert (=> start!133862 true))

(declare-fun array_inv!39233 (array!103914) Bool)

(assert (=> start!133862 (array_inv!39233 _keys!637)))

(declare-fun e!870834 () Bool)

(declare-fun array_inv!39234 (array!103916) Bool)

(assert (=> start!133862 (and (array_inv!39234 _values!487) e!870834)))

(declare-fun mapNonEmpty!59175 () Bool)

(declare-fun mapRes!59175 () Bool)

(declare-fun tp!112830 () Bool)

(declare-fun e!870835 () Bool)

(assert (=> mapNonEmpty!59175 (= mapRes!59175 (and tp!112830 e!870835))))

(declare-fun mapValue!59175 () ValueCell!18236)

(declare-fun mapKey!59175 () (_ BitVec 32))

(declare-fun mapRest!59175 () (Array (_ BitVec 32) ValueCell!18236))

(assert (=> mapNonEmpty!59175 (= (arr!50143 _values!487) (store mapRest!59175 mapKey!59175 mapValue!59175))))

(declare-fun mapIsEmpty!59175 () Bool)

(assert (=> mapIsEmpty!59175 mapRes!59175))

(declare-fun b!1562580 () Bool)

(declare-fun res!1067714 () Bool)

(assert (=> b!1562580 (=> (not res!1067714) (not e!870837))))

(declare-datatypes ((List!36405 0))(
  ( (Nil!36402) (Cons!36401 (h!37865 (_ BitVec 64)) (t!51130 List!36405)) )
))
(declare-fun arrayNoDuplicates!0 (array!103914 (_ BitVec 32) List!36405) Bool)

(assert (=> b!1562580 (= res!1067714 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36402))))

(declare-fun b!1562581 () Bool)

(declare-fun res!1067712 () Bool)

(assert (=> b!1562581 (=> (not res!1067712) (not e!870837))))

(declare-datatypes ((tuple2!25082 0))(
  ( (tuple2!25083 (_1!12552 (_ BitVec 64)) (_2!12552 V!59585)) )
))
(declare-datatypes ((List!36406 0))(
  ( (Nil!36403) (Cons!36402 (h!37866 tuple2!25082) (t!51131 List!36406)) )
))
(declare-datatypes ((ListLongMap!22525 0))(
  ( (ListLongMap!22526 (toList!11278 List!36406)) )
))
(declare-fun contains!10279 (ListLongMap!22525 (_ BitVec 64)) Bool)

(assert (=> b!1562581 (= res!1067712 (not (contains!10279 (ListLongMap!22526 Nil!36403) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1562582 () Bool)

(declare-fun e!870836 () Bool)

(declare-fun tp_is_empty!38533 () Bool)

(assert (=> b!1562582 (= e!870836 tp_is_empty!38533)))

(declare-fun b!1562583 () Bool)

(assert (=> b!1562583 (= e!870835 tp_is_empty!38533)))

(declare-fun b!1562584 () Bool)

(assert (=> b!1562584 (= e!870834 (and e!870836 mapRes!59175))))

(declare-fun condMapEmpty!59175 () Bool)

(declare-fun mapDefault!59175 () ValueCell!18236)

(assert (=> b!1562584 (= condMapEmpty!59175 (= (arr!50143 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18236)) mapDefault!59175)))))

(declare-fun b!1562585 () Bool)

(assert (=> b!1562585 (= e!870837 false)))

(declare-fun lt!671864 () Bool)

(assert (=> b!1562585 (= lt!671864 (contains!10279 (ListLongMap!22526 Nil!36403) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!133862 res!1067713) b!1562577))

(assert (= (and b!1562577 res!1067717) b!1562579))

(assert (= (and b!1562579 res!1067716) b!1562580))

(assert (= (and b!1562580 res!1067714) b!1562578))

(assert (= (and b!1562578 res!1067715) b!1562581))

(assert (= (and b!1562581 res!1067712) b!1562585))

(assert (= (and b!1562584 condMapEmpty!59175) mapIsEmpty!59175))

(assert (= (and b!1562584 (not condMapEmpty!59175)) mapNonEmpty!59175))

(get-info :version)

(assert (= (and mapNonEmpty!59175 ((_ is ValueCellFull!18236) mapValue!59175)) b!1562583))

(assert (= (and b!1562584 ((_ is ValueCellFull!18236) mapDefault!59175)) b!1562582))

(assert (= start!133862 b!1562584))

(declare-fun m!1438359 () Bool)

(assert (=> mapNonEmpty!59175 m!1438359))

(declare-fun m!1438361 () Bool)

(assert (=> b!1562580 m!1438361))

(declare-fun m!1438363 () Bool)

(assert (=> b!1562585 m!1438363))

(declare-fun m!1438365 () Bool)

(assert (=> b!1562579 m!1438365))

(declare-fun m!1438367 () Bool)

(assert (=> start!133862 m!1438367))

(declare-fun m!1438369 () Bool)

(assert (=> start!133862 m!1438369))

(declare-fun m!1438371 () Bool)

(assert (=> start!133862 m!1438371))

(declare-fun m!1438373 () Bool)

(assert (=> b!1562581 m!1438373))

(check-sat (not b!1562581) (not b!1562579) (not b!1562585) (not mapNonEmpty!59175) tp_is_empty!38533 (not start!133862) (not b!1562580))
(check-sat)
