; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113236 () Bool)

(assert start!113236)

(declare-datatypes ((array!91103 0))(
  ( (array!91104 (arr!44003 (Array (_ BitVec 32) (_ BitVec 64))) (size!44554 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91103)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun e!763793 () Bool)

(declare-fun b!1340782 () Bool)

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1340782 (= e!763793 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44554 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!1960 (size!44554 _keys!1571))))))

(declare-fun b!1340783 () Bool)

(declare-fun res!889099 () Bool)

(assert (=> b!1340783 (=> (not res!889099) (not e!763793))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!54521 0))(
  ( (V!54522 (val!18606 Int)) )
))
(declare-datatypes ((ValueCell!17633 0))(
  ( (ValueCellFull!17633 (v!21249 V!54521)) (EmptyCell!17633) )
))
(declare-datatypes ((array!91105 0))(
  ( (array!91106 (arr!44004 (Array (_ BitVec 32) ValueCell!17633)) (size!44555 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91105)

(assert (=> b!1340783 (= res!889099 (and (= (size!44555 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44554 _keys!1571) (size!44555 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57301 () Bool)

(declare-fun mapRes!57301 () Bool)

(declare-fun tp!109000 () Bool)

(declare-fun e!763794 () Bool)

(assert (=> mapNonEmpty!57301 (= mapRes!57301 (and tp!109000 e!763794))))

(declare-fun mapKey!57301 () (_ BitVec 32))

(declare-fun mapValue!57301 () ValueCell!17633)

(declare-fun mapRest!57301 () (Array (_ BitVec 32) ValueCell!17633))

(assert (=> mapNonEmpty!57301 (= (arr!44004 _values!1303) (store mapRest!57301 mapKey!57301 mapValue!57301))))

(declare-fun mapIsEmpty!57301 () Bool)

(assert (=> mapIsEmpty!57301 mapRes!57301))

(declare-fun b!1340784 () Bool)

(declare-fun e!763795 () Bool)

(declare-fun tp_is_empty!37063 () Bool)

(assert (=> b!1340784 (= e!763795 tp_is_empty!37063)))

(declare-fun res!889098 () Bool)

(assert (=> start!113236 (=> (not res!889098) (not e!763793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113236 (= res!889098 (validMask!0 mask!1977))))

(assert (=> start!113236 e!763793))

(assert (=> start!113236 true))

(declare-fun array_inv!33445 (array!91103) Bool)

(assert (=> start!113236 (array_inv!33445 _keys!1571)))

(declare-fun e!763792 () Bool)

(declare-fun array_inv!33446 (array!91105) Bool)

(assert (=> start!113236 (and (array_inv!33446 _values!1303) e!763792)))

(declare-fun b!1340785 () Bool)

(declare-fun res!889100 () Bool)

(assert (=> b!1340785 (=> (not res!889100) (not e!763793))))

(declare-datatypes ((List!31155 0))(
  ( (Nil!31152) (Cons!31151 (h!32369 (_ BitVec 64)) (t!45479 List!31155)) )
))
(declare-fun arrayNoDuplicates!0 (array!91103 (_ BitVec 32) List!31155) Bool)

(assert (=> b!1340785 (= res!889100 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31152))))

(declare-fun b!1340786 () Bool)

(assert (=> b!1340786 (= e!763794 tp_is_empty!37063)))

(declare-fun b!1340787 () Bool)

(assert (=> b!1340787 (= e!763792 (and e!763795 mapRes!57301))))

(declare-fun condMapEmpty!57301 () Bool)

(declare-fun mapDefault!57301 () ValueCell!17633)

(assert (=> b!1340787 (= condMapEmpty!57301 (= (arr!44004 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17633)) mapDefault!57301)))))

(declare-fun b!1340788 () Bool)

(declare-fun res!889097 () Bool)

(assert (=> b!1340788 (=> (not res!889097) (not e!763793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91103 (_ BitVec 32)) Bool)

(assert (=> b!1340788 (= res!889097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113236 res!889098) b!1340783))

(assert (= (and b!1340783 res!889099) b!1340788))

(assert (= (and b!1340788 res!889097) b!1340785))

(assert (= (and b!1340785 res!889100) b!1340782))

(assert (= (and b!1340787 condMapEmpty!57301) mapIsEmpty!57301))

(assert (= (and b!1340787 (not condMapEmpty!57301)) mapNonEmpty!57301))

(get-info :version)

(assert (= (and mapNonEmpty!57301 ((_ is ValueCellFull!17633) mapValue!57301)) b!1340786))

(assert (= (and b!1340787 ((_ is ValueCellFull!17633) mapDefault!57301)) b!1340784))

(assert (= start!113236 b!1340787))

(declare-fun m!1229127 () Bool)

(assert (=> mapNonEmpty!57301 m!1229127))

(declare-fun m!1229129 () Bool)

(assert (=> start!113236 m!1229129))

(declare-fun m!1229131 () Bool)

(assert (=> start!113236 m!1229131))

(declare-fun m!1229133 () Bool)

(assert (=> start!113236 m!1229133))

(declare-fun m!1229135 () Bool)

(assert (=> b!1340785 m!1229135))

(declare-fun m!1229137 () Bool)

(assert (=> b!1340788 m!1229137))

(check-sat (not start!113236) (not b!1340788) tp_is_empty!37063 (not b!1340785) (not mapNonEmpty!57301))
(check-sat)
