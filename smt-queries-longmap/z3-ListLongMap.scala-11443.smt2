; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133406 () Bool)

(assert start!133406)

(declare-fun b!1559909 () Bool)

(declare-fun e!869175 () Bool)

(assert (=> b!1559909 (= e!869175 false)))

(declare-fun lt!670679 () Bool)

(declare-datatypes ((V!59593 0))(
  ( (V!59594 (val!19353 Int)) )
))
(declare-datatypes ((tuple2!25104 0))(
  ( (tuple2!25105 (_1!12563 (_ BitVec 64)) (_2!12563 V!59593)) )
))
(declare-datatypes ((List!36425 0))(
  ( (Nil!36422) (Cons!36421 (h!37868 tuple2!25104) (t!51150 List!36425)) )
))
(declare-datatypes ((ListLongMap!22539 0))(
  ( (ListLongMap!22540 (toList!11285 List!36425)) )
))
(declare-fun contains!10195 (ListLongMap!22539 (_ BitVec 64)) Bool)

(assert (=> b!1559909 (= lt!670679 (contains!10195 (ListLongMap!22540 Nil!36422) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1066782 () Bool)

(assert (=> start!133406 (=> (not res!1066782) (not e!869175))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133406 (= res!1066782 (validMask!0 mask!947))))

(assert (=> start!133406 e!869175))

(assert (=> start!133406 true))

(declare-datatypes ((array!103722 0))(
  ( (array!103723 (arr!50054 (Array (_ BitVec 32) (_ BitVec 64))) (size!50606 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103722)

(declare-fun array_inv!39111 (array!103722) Bool)

(assert (=> start!133406 (array_inv!39111 _keys!637)))

(declare-datatypes ((ValueCell!18239 0))(
  ( (ValueCellFull!18239 (v!22101 V!59593)) (EmptyCell!18239) )
))
(declare-datatypes ((array!103724 0))(
  ( (array!103725 (arr!50055 (Array (_ BitVec 32) ValueCell!18239)) (size!50607 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103724)

(declare-fun e!869172 () Bool)

(declare-fun array_inv!39112 (array!103724) Bool)

(assert (=> start!133406 (and (array_inv!39112 _values!487) e!869172)))

(declare-fun b!1559910 () Bool)

(declare-fun e!869176 () Bool)

(declare-fun tp_is_empty!38539 () Bool)

(assert (=> b!1559910 (= e!869176 tp_is_empty!38539)))

(declare-fun mapNonEmpty!59184 () Bool)

(declare-fun mapRes!59184 () Bool)

(declare-fun tp!112840 () Bool)

(declare-fun e!869173 () Bool)

(assert (=> mapNonEmpty!59184 (= mapRes!59184 (and tp!112840 e!869173))))

(declare-fun mapValue!59184 () ValueCell!18239)

(declare-fun mapKey!59184 () (_ BitVec 32))

(declare-fun mapRest!59184 () (Array (_ BitVec 32) ValueCell!18239))

(assert (=> mapNonEmpty!59184 (= (arr!50055 _values!487) (store mapRest!59184 mapKey!59184 mapValue!59184))))

(declare-fun b!1559911 () Bool)

(assert (=> b!1559911 (= e!869173 tp_is_empty!38539)))

(declare-fun b!1559912 () Bool)

(assert (=> b!1559912 (= e!869172 (and e!869176 mapRes!59184))))

(declare-fun condMapEmpty!59184 () Bool)

(declare-fun mapDefault!59184 () ValueCell!18239)

(assert (=> b!1559912 (= condMapEmpty!59184 (= (arr!50055 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18239)) mapDefault!59184)))))

(declare-fun b!1559913 () Bool)

(declare-fun res!1066781 () Bool)

(assert (=> b!1559913 (=> (not res!1066781) (not e!869175))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559913 (= res!1066781 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50606 _keys!637)) (bvsge from!782 (size!50606 _keys!637))))))

(declare-fun b!1559914 () Bool)

(declare-fun res!1066780 () Bool)

(assert (=> b!1559914 (=> (not res!1066780) (not e!869175))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559914 (= res!1066780 (and (= (size!50607 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50606 _keys!637) (size!50607 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559915 () Bool)

(declare-fun res!1066778 () Bool)

(assert (=> b!1559915 (=> (not res!1066778) (not e!869175))))

(assert (=> b!1559915 (= res!1066778 (not (contains!10195 (ListLongMap!22540 Nil!36422) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559916 () Bool)

(declare-fun res!1066777 () Bool)

(assert (=> b!1559916 (=> (not res!1066777) (not e!869175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103722 (_ BitVec 32)) Bool)

(assert (=> b!1559916 (= res!1066777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59184 () Bool)

(assert (=> mapIsEmpty!59184 mapRes!59184))

(declare-fun b!1559917 () Bool)

(declare-fun res!1066779 () Bool)

(assert (=> b!1559917 (=> (not res!1066779) (not e!869175))))

(declare-datatypes ((List!36426 0))(
  ( (Nil!36423) (Cons!36422 (h!37869 (_ BitVec 64)) (t!51151 List!36426)) )
))
(declare-fun arrayNoDuplicates!0 (array!103722 (_ BitVec 32) List!36426) Bool)

(assert (=> b!1559917 (= res!1066779 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36423))))

(assert (= (and start!133406 res!1066782) b!1559914))

(assert (= (and b!1559914 res!1066780) b!1559916))

(assert (= (and b!1559916 res!1066777) b!1559917))

(assert (= (and b!1559917 res!1066779) b!1559913))

(assert (= (and b!1559913 res!1066781) b!1559915))

(assert (= (and b!1559915 res!1066778) b!1559909))

(assert (= (and b!1559912 condMapEmpty!59184) mapIsEmpty!59184))

(assert (= (and b!1559912 (not condMapEmpty!59184)) mapNonEmpty!59184))

(get-info :version)

(assert (= (and mapNonEmpty!59184 ((_ is ValueCellFull!18239) mapValue!59184)) b!1559911))

(assert (= (and b!1559912 ((_ is ValueCellFull!18239) mapDefault!59184)) b!1559910))

(assert (= start!133406 b!1559912))

(declare-fun m!1435257 () Bool)

(assert (=> b!1559917 m!1435257))

(declare-fun m!1435259 () Bool)

(assert (=> b!1559909 m!1435259))

(declare-fun m!1435261 () Bool)

(assert (=> start!133406 m!1435261))

(declare-fun m!1435263 () Bool)

(assert (=> start!133406 m!1435263))

(declare-fun m!1435265 () Bool)

(assert (=> start!133406 m!1435265))

(declare-fun m!1435267 () Bool)

(assert (=> b!1559916 m!1435267))

(declare-fun m!1435269 () Bool)

(assert (=> mapNonEmpty!59184 m!1435269))

(declare-fun m!1435271 () Bool)

(assert (=> b!1559915 m!1435271))

(check-sat (not b!1559916) (not mapNonEmpty!59184) (not start!133406) (not b!1559917) tp_is_empty!38539 (not b!1559915) (not b!1559909))
(check-sat)
