; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133370 () Bool)

(assert start!133370)

(declare-fun b!1559423 () Bool)

(declare-fun res!1066458 () Bool)

(declare-fun e!868902 () Bool)

(assert (=> b!1559423 (=> (not res!1066458) (not e!868902))))

(declare-datatypes ((array!103652 0))(
  ( (array!103653 (arr!50019 (Array (_ BitVec 32) (_ BitVec 64))) (size!50571 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103652)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103652 (_ BitVec 32)) Bool)

(assert (=> b!1559423 (= res!1066458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559424 () Bool)

(declare-fun e!868905 () Bool)

(declare-fun e!868903 () Bool)

(declare-fun mapRes!59130 () Bool)

(assert (=> b!1559424 (= e!868905 (and e!868903 mapRes!59130))))

(declare-fun condMapEmpty!59130 () Bool)

(declare-datatypes ((V!59545 0))(
  ( (V!59546 (val!19335 Int)) )
))
(declare-datatypes ((ValueCell!18221 0))(
  ( (ValueCellFull!18221 (v!22083 V!59545)) (EmptyCell!18221) )
))
(declare-datatypes ((array!103654 0))(
  ( (array!103655 (arr!50020 (Array (_ BitVec 32) ValueCell!18221)) (size!50572 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103654)

(declare-fun mapDefault!59130 () ValueCell!18221)

(assert (=> b!1559424 (= condMapEmpty!59130 (= (arr!50020 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18221)) mapDefault!59130)))))

(declare-fun b!1559425 () Bool)

(declare-fun res!1066455 () Bool)

(assert (=> b!1559425 (=> (not res!1066455) (not e!868902))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559425 (= res!1066455 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50571 _keys!637)) (bvsge from!782 (size!50571 _keys!637))))))

(declare-fun b!1559426 () Bool)

(declare-fun res!1066457 () Bool)

(assert (=> b!1559426 (=> (not res!1066457) (not e!868902))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559426 (= res!1066457 (and (= (size!50572 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50571 _keys!637) (size!50572 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559427 () Bool)

(declare-fun res!1066453 () Bool)

(assert (=> b!1559427 (=> (not res!1066453) (not e!868902))))

(declare-datatypes ((List!36401 0))(
  ( (Nil!36398) (Cons!36397 (h!37844 (_ BitVec 64)) (t!51126 List!36401)) )
))
(declare-fun arrayNoDuplicates!0 (array!103652 (_ BitVec 32) List!36401) Bool)

(assert (=> b!1559427 (= res!1066453 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36398))))

(declare-fun b!1559428 () Bool)

(declare-fun e!868906 () Bool)

(declare-fun tp_is_empty!38503 () Bool)

(assert (=> b!1559428 (= e!868906 tp_is_empty!38503)))

(declare-fun mapIsEmpty!59130 () Bool)

(assert (=> mapIsEmpty!59130 mapRes!59130))

(declare-fun b!1559429 () Bool)

(assert (=> b!1559429 (= e!868902 false)))

(declare-fun lt!670625 () Bool)

(declare-datatypes ((tuple2!25078 0))(
  ( (tuple2!25079 (_1!12550 (_ BitVec 64)) (_2!12550 V!59545)) )
))
(declare-datatypes ((List!36402 0))(
  ( (Nil!36399) (Cons!36398 (h!37845 tuple2!25078) (t!51127 List!36402)) )
))
(declare-datatypes ((ListLongMap!22513 0))(
  ( (ListLongMap!22514 (toList!11272 List!36402)) )
))
(declare-fun contains!10182 (ListLongMap!22513 (_ BitVec 64)) Bool)

(assert (=> b!1559429 (= lt!670625 (contains!10182 (ListLongMap!22514 Nil!36399) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559430 () Bool)

(assert (=> b!1559430 (= e!868903 tp_is_empty!38503)))

(declare-fun b!1559431 () Bool)

(declare-fun res!1066454 () Bool)

(assert (=> b!1559431 (=> (not res!1066454) (not e!868902))))

(assert (=> b!1559431 (= res!1066454 (not (contains!10182 (ListLongMap!22514 Nil!36399) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1066456 () Bool)

(assert (=> start!133370 (=> (not res!1066456) (not e!868902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133370 (= res!1066456 (validMask!0 mask!947))))

(assert (=> start!133370 e!868902))

(assert (=> start!133370 true))

(declare-fun array_inv!39087 (array!103652) Bool)

(assert (=> start!133370 (array_inv!39087 _keys!637)))

(declare-fun array_inv!39088 (array!103654) Bool)

(assert (=> start!133370 (and (array_inv!39088 _values!487) e!868905)))

(declare-fun mapNonEmpty!59130 () Bool)

(declare-fun tp!112786 () Bool)

(assert (=> mapNonEmpty!59130 (= mapRes!59130 (and tp!112786 e!868906))))

(declare-fun mapKey!59130 () (_ BitVec 32))

(declare-fun mapValue!59130 () ValueCell!18221)

(declare-fun mapRest!59130 () (Array (_ BitVec 32) ValueCell!18221))

(assert (=> mapNonEmpty!59130 (= (arr!50020 _values!487) (store mapRest!59130 mapKey!59130 mapValue!59130))))

(assert (= (and start!133370 res!1066456) b!1559426))

(assert (= (and b!1559426 res!1066457) b!1559423))

(assert (= (and b!1559423 res!1066458) b!1559427))

(assert (= (and b!1559427 res!1066453) b!1559425))

(assert (= (and b!1559425 res!1066455) b!1559431))

(assert (= (and b!1559431 res!1066454) b!1559429))

(assert (= (and b!1559424 condMapEmpty!59130) mapIsEmpty!59130))

(assert (= (and b!1559424 (not condMapEmpty!59130)) mapNonEmpty!59130))

(get-info :version)

(assert (= (and mapNonEmpty!59130 ((_ is ValueCellFull!18221) mapValue!59130)) b!1559428))

(assert (= (and b!1559424 ((_ is ValueCellFull!18221) mapDefault!59130)) b!1559430))

(assert (= start!133370 b!1559424))

(declare-fun m!1434969 () Bool)

(assert (=> b!1559427 m!1434969))

(declare-fun m!1434971 () Bool)

(assert (=> b!1559429 m!1434971))

(declare-fun m!1434973 () Bool)

(assert (=> mapNonEmpty!59130 m!1434973))

(declare-fun m!1434975 () Bool)

(assert (=> start!133370 m!1434975))

(declare-fun m!1434977 () Bool)

(assert (=> start!133370 m!1434977))

(declare-fun m!1434979 () Bool)

(assert (=> start!133370 m!1434979))

(declare-fun m!1434981 () Bool)

(assert (=> b!1559423 m!1434981))

(declare-fun m!1434983 () Bool)

(assert (=> b!1559431 m!1434983))

(check-sat (not b!1559423) (not b!1559429) (not b!1559431) tp_is_empty!38503 (not b!1559427) (not start!133370) (not mapNonEmpty!59130))
(check-sat)
