; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133466 () Bool)

(assert start!133466)

(declare-fun b!1560503 () Bool)

(declare-fun e!869624 () Bool)

(declare-fun e!869626 () Bool)

(declare-fun mapRes!59274 () Bool)

(assert (=> b!1560503 (= e!869624 (and e!869626 mapRes!59274))))

(declare-fun condMapEmpty!59274 () Bool)

(declare-datatypes ((V!59673 0))(
  ( (V!59674 (val!19383 Int)) )
))
(declare-datatypes ((ValueCell!18269 0))(
  ( (ValueCellFull!18269 (v!22131 V!59673)) (EmptyCell!18269) )
))
(declare-datatypes ((array!103834 0))(
  ( (array!103835 (arr!50110 (Array (_ BitVec 32) ValueCell!18269)) (size!50662 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103834)

(declare-fun mapDefault!59274 () ValueCell!18269)

(assert (=> b!1560503 (= condMapEmpty!59274 (= (arr!50110 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18269)) mapDefault!59274)))))

(declare-fun b!1560504 () Bool)

(declare-fun res!1067104 () Bool)

(declare-fun e!869625 () Bool)

(assert (=> b!1560504 (=> (not res!1067104) (not e!869625))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103836 0))(
  ( (array!103837 (arr!50111 (Array (_ BitVec 32) (_ BitVec 64))) (size!50663 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103836)

(assert (=> b!1560504 (= res!1067104 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50663 _keys!637)) (bvslt from!782 (size!50663 _keys!637))))))

(declare-fun b!1560505 () Bool)

(declare-fun res!1067101 () Bool)

(assert (=> b!1560505 (=> (not res!1067101) (not e!869625))))

(declare-datatypes ((List!36447 0))(
  ( (Nil!36444) (Cons!36443 (h!37890 (_ BitVec 64)) (t!51172 List!36447)) )
))
(declare-fun arrayNoDuplicates!0 (array!103836 (_ BitVec 32) List!36447) Bool)

(assert (=> b!1560505 (= res!1067101 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36444))))

(declare-fun b!1560506 () Bool)

(declare-fun tp_is_empty!38599 () Bool)

(assert (=> b!1560506 (= e!869626 tp_is_empty!38599)))

(declare-fun b!1560507 () Bool)

(declare-fun res!1067106 () Bool)

(assert (=> b!1560507 (=> (not res!1067106) (not e!869625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1560507 (= res!1067106 (validKeyInArray!0 (select (arr!50111 _keys!637) from!782)))))

(declare-fun b!1560508 () Bool)

(assert (=> b!1560508 (= e!869625 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(declare-fun res!1067105 () Bool)

(assert (=> start!133466 (=> (not res!1067105) (not e!869625))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133466 (= res!1067105 (validMask!0 mask!947))))

(assert (=> start!133466 e!869625))

(assert (=> start!133466 true))

(declare-fun array_inv!39145 (array!103836) Bool)

(assert (=> start!133466 (array_inv!39145 _keys!637)))

(declare-fun array_inv!39146 (array!103834) Bool)

(assert (=> start!133466 (and (array_inv!39146 _values!487) e!869624)))

(declare-fun b!1560509 () Bool)

(declare-fun res!1067102 () Bool)

(assert (=> b!1560509 (=> (not res!1067102) (not e!869625))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560509 (= res!1067102 (and (= (size!50662 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50663 _keys!637) (size!50662 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59274 () Bool)

(declare-fun tp!112930 () Bool)

(declare-fun e!869622 () Bool)

(assert (=> mapNonEmpty!59274 (= mapRes!59274 (and tp!112930 e!869622))))

(declare-fun mapValue!59274 () ValueCell!18269)

(declare-fun mapKey!59274 () (_ BitVec 32))

(declare-fun mapRest!59274 () (Array (_ BitVec 32) ValueCell!18269))

(assert (=> mapNonEmpty!59274 (= (arr!50110 _values!487) (store mapRest!59274 mapKey!59274 mapValue!59274))))

(declare-fun b!1560510 () Bool)

(declare-fun res!1067103 () Bool)

(assert (=> b!1560510 (=> (not res!1067103) (not e!869625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103836 (_ BitVec 32)) Bool)

(assert (=> b!1560510 (= res!1067103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59274 () Bool)

(assert (=> mapIsEmpty!59274 mapRes!59274))

(declare-fun b!1560511 () Bool)

(assert (=> b!1560511 (= e!869622 tp_is_empty!38599)))

(assert (= (and start!133466 res!1067105) b!1560509))

(assert (= (and b!1560509 res!1067102) b!1560510))

(assert (= (and b!1560510 res!1067103) b!1560505))

(assert (= (and b!1560505 res!1067101) b!1560504))

(assert (= (and b!1560504 res!1067104) b!1560507))

(assert (= (and b!1560507 res!1067106) b!1560508))

(assert (= (and b!1560503 condMapEmpty!59274) mapIsEmpty!59274))

(assert (= (and b!1560503 (not condMapEmpty!59274)) mapNonEmpty!59274))

(get-info :version)

(assert (= (and mapNonEmpty!59274 ((_ is ValueCellFull!18269) mapValue!59274)) b!1560511))

(assert (= (and b!1560503 ((_ is ValueCellFull!18269) mapDefault!59274)) b!1560506))

(assert (= start!133466 b!1560503))

(declare-fun m!1435641 () Bool)

(assert (=> mapNonEmpty!59274 m!1435641))

(declare-fun m!1435643 () Bool)

(assert (=> b!1560510 m!1435643))

(declare-fun m!1435645 () Bool)

(assert (=> b!1560505 m!1435645))

(declare-fun m!1435647 () Bool)

(assert (=> start!133466 m!1435647))

(declare-fun m!1435649 () Bool)

(assert (=> start!133466 m!1435649))

(declare-fun m!1435651 () Bool)

(assert (=> start!133466 m!1435651))

(declare-fun m!1435653 () Bool)

(assert (=> b!1560507 m!1435653))

(assert (=> b!1560507 m!1435653))

(declare-fun m!1435655 () Bool)

(assert (=> b!1560507 m!1435655))

(check-sat (not b!1560505) (not b!1560507) (not mapNonEmpty!59274) (not b!1560510) (not start!133466) tp_is_empty!38599)
(check-sat)
