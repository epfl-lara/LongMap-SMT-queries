; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134096 () Bool)

(assert start!134096)

(declare-fun mapIsEmpty!59526 () Bool)

(declare-fun mapRes!59526 () Bool)

(assert (=> mapIsEmpty!59526 mapRes!59526))

(declare-fun b!1565448 () Bool)

(declare-fun e!872601 () Bool)

(assert (=> b!1565448 (= e!872601 false)))

(declare-fun lt!672728 () Bool)

(declare-datatypes ((array!104358 0))(
  ( (array!104359 (arr!50364 (Array (_ BitVec 32) (_ BitVec 64))) (size!50915 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104358)

(declare-datatypes ((List!36542 0))(
  ( (Nil!36539) (Cons!36538 (h!38002 (_ BitVec 64)) (t!51381 List!36542)) )
))
(declare-fun arrayNoDuplicates!0 (array!104358 (_ BitVec 32) List!36542) Bool)

(assert (=> b!1565448 (= lt!672728 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36539))))

(declare-fun b!1565449 () Bool)

(declare-fun res!1069417 () Bool)

(assert (=> b!1565449 (=> (not res!1069417) (not e!872601))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59897 0))(
  ( (V!59898 (val!19467 Int)) )
))
(declare-datatypes ((ValueCell!18353 0))(
  ( (ValueCellFull!18353 (v!22211 V!59897)) (EmptyCell!18353) )
))
(declare-datatypes ((array!104360 0))(
  ( (array!104361 (arr!50365 (Array (_ BitVec 32) ValueCell!18353)) (size!50916 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104360)

(assert (=> b!1565449 (= res!1069417 (and (= (size!50916 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50915 _keys!637) (size!50916 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59526 () Bool)

(declare-fun tp!113361 () Bool)

(declare-fun e!872599 () Bool)

(assert (=> mapNonEmpty!59526 (= mapRes!59526 (and tp!113361 e!872599))))

(declare-fun mapRest!59526 () (Array (_ BitVec 32) ValueCell!18353))

(declare-fun mapValue!59526 () ValueCell!18353)

(declare-fun mapKey!59526 () (_ BitVec 32))

(assert (=> mapNonEmpty!59526 (= (arr!50365 _values!487) (store mapRest!59526 mapKey!59526 mapValue!59526))))

(declare-fun b!1565450 () Bool)

(declare-fun tp_is_empty!38767 () Bool)

(assert (=> b!1565450 (= e!872599 tp_is_empty!38767)))

(declare-fun res!1069416 () Bool)

(assert (=> start!134096 (=> (not res!1069416) (not e!872601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134096 (= res!1069416 (validMask!0 mask!947))))

(assert (=> start!134096 e!872601))

(assert (=> start!134096 true))

(declare-fun e!872598 () Bool)

(declare-fun array_inv!39391 (array!104360) Bool)

(assert (=> start!134096 (and (array_inv!39391 _values!487) e!872598)))

(declare-fun array_inv!39392 (array!104358) Bool)

(assert (=> start!134096 (array_inv!39392 _keys!637)))

(declare-fun b!1565451 () Bool)

(declare-fun res!1069418 () Bool)

(assert (=> b!1565451 (=> (not res!1069418) (not e!872601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104358 (_ BitVec 32)) Bool)

(assert (=> b!1565451 (= res!1069418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565452 () Bool)

(declare-fun e!872602 () Bool)

(assert (=> b!1565452 (= e!872602 tp_is_empty!38767)))

(declare-fun b!1565453 () Bool)

(assert (=> b!1565453 (= e!872598 (and e!872602 mapRes!59526))))

(declare-fun condMapEmpty!59526 () Bool)

(declare-fun mapDefault!59526 () ValueCell!18353)

(assert (=> b!1565453 (= condMapEmpty!59526 (= (arr!50365 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18353)) mapDefault!59526)))))

(assert (= (and start!134096 res!1069416) b!1565449))

(assert (= (and b!1565449 res!1069417) b!1565451))

(assert (= (and b!1565451 res!1069418) b!1565448))

(assert (= (and b!1565453 condMapEmpty!59526) mapIsEmpty!59526))

(assert (= (and b!1565453 (not condMapEmpty!59526)) mapNonEmpty!59526))

(get-info :version)

(assert (= (and mapNonEmpty!59526 ((_ is ValueCellFull!18353) mapValue!59526)) b!1565450))

(assert (= (and b!1565453 ((_ is ValueCellFull!18353) mapDefault!59526)) b!1565452))

(assert (= start!134096 b!1565453))

(declare-fun m!1440927 () Bool)

(assert (=> b!1565448 m!1440927))

(declare-fun m!1440929 () Bool)

(assert (=> mapNonEmpty!59526 m!1440929))

(declare-fun m!1440931 () Bool)

(assert (=> start!134096 m!1440931))

(declare-fun m!1440933 () Bool)

(assert (=> start!134096 m!1440933))

(declare-fun m!1440935 () Bool)

(assert (=> start!134096 m!1440935))

(declare-fun m!1440937 () Bool)

(assert (=> b!1565451 m!1440937))

(check-sat (not start!134096) (not b!1565451) tp_is_empty!38767 (not b!1565448) (not mapNonEmpty!59526))
(check-sat)
