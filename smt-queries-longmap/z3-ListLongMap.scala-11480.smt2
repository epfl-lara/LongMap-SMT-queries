; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133680 () Bool)

(assert start!133680)

(declare-fun mapIsEmpty!59520 () Bool)

(declare-fun mapRes!59520 () Bool)

(assert (=> mapIsEmpty!59520 mapRes!59520))

(declare-fun b!1562976 () Bool)

(declare-fun res!1068538 () Bool)

(declare-fun e!871059 () Bool)

(assert (=> b!1562976 (=> (not res!1068538) (not e!871059))))

(declare-datatypes ((array!104228 0))(
  ( (array!104229 (arr!50306 (Array (_ BitVec 32) (_ BitVec 64))) (size!50856 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104228)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104228 (_ BitVec 32)) Bool)

(assert (=> b!1562976 (= res!1068538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1068539 () Bool)

(assert (=> start!133680 (=> (not res!1068539) (not e!871059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133680 (= res!1068539 (validMask!0 mask!947))))

(assert (=> start!133680 e!871059))

(assert (=> start!133680 true))

(declare-datatypes ((V!59891 0))(
  ( (V!59892 (val!19465 Int)) )
))
(declare-datatypes ((ValueCell!18351 0))(
  ( (ValueCellFull!18351 (v!22217 V!59891)) (EmptyCell!18351) )
))
(declare-datatypes ((array!104230 0))(
  ( (array!104231 (arr!50307 (Array (_ BitVec 32) ValueCell!18351)) (size!50857 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104230)

(declare-fun e!871060 () Bool)

(declare-fun array_inv!39101 (array!104230) Bool)

(assert (=> start!133680 (and (array_inv!39101 _values!487) e!871060)))

(declare-fun array_inv!39102 (array!104228) Bool)

(assert (=> start!133680 (array_inv!39102 _keys!637)))

(declare-fun b!1562977 () Bool)

(declare-fun e!871062 () Bool)

(declare-fun tp_is_empty!38763 () Bool)

(assert (=> b!1562977 (= e!871062 tp_is_empty!38763)))

(declare-fun b!1562978 () Bool)

(declare-fun e!871061 () Bool)

(assert (=> b!1562978 (= e!871061 tp_is_empty!38763)))

(declare-fun mapNonEmpty!59520 () Bool)

(declare-fun tp!113355 () Bool)

(assert (=> mapNonEmpty!59520 (= mapRes!59520 (and tp!113355 e!871062))))

(declare-fun mapValue!59520 () ValueCell!18351)

(declare-fun mapKey!59520 () (_ BitVec 32))

(declare-fun mapRest!59520 () (Array (_ BitVec 32) ValueCell!18351))

(assert (=> mapNonEmpty!59520 (= (arr!50307 _values!487) (store mapRest!59520 mapKey!59520 mapValue!59520))))

(declare-fun b!1562979 () Bool)

(assert (=> b!1562979 (= e!871059 false)))

(declare-fun lt!671814 () Bool)

(declare-datatypes ((List!36504 0))(
  ( (Nil!36501) (Cons!36500 (h!37946 (_ BitVec 64)) (t!51351 List!36504)) )
))
(declare-fun arrayNoDuplicates!0 (array!104228 (_ BitVec 32) List!36504) Bool)

(assert (=> b!1562979 (= lt!671814 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36501))))

(declare-fun b!1562980 () Bool)

(assert (=> b!1562980 (= e!871060 (and e!871061 mapRes!59520))))

(declare-fun condMapEmpty!59520 () Bool)

(declare-fun mapDefault!59520 () ValueCell!18351)

(assert (=> b!1562980 (= condMapEmpty!59520 (= (arr!50307 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18351)) mapDefault!59520)))))

(declare-fun b!1562981 () Bool)

(declare-fun res!1068540 () Bool)

(assert (=> b!1562981 (=> (not res!1068540) (not e!871059))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562981 (= res!1068540 (and (= (size!50857 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50856 _keys!637) (size!50857 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133680 res!1068539) b!1562981))

(assert (= (and b!1562981 res!1068540) b!1562976))

(assert (= (and b!1562976 res!1068538) b!1562979))

(assert (= (and b!1562980 condMapEmpty!59520) mapIsEmpty!59520))

(assert (= (and b!1562980 (not condMapEmpty!59520)) mapNonEmpty!59520))

(get-info :version)

(assert (= (and mapNonEmpty!59520 ((_ is ValueCellFull!18351) mapValue!59520)) b!1562977))

(assert (= (and b!1562980 ((_ is ValueCellFull!18351) mapDefault!59520)) b!1562978))

(assert (= start!133680 b!1562980))

(declare-fun m!1438645 () Bool)

(assert (=> b!1562976 m!1438645))

(declare-fun m!1438647 () Bool)

(assert (=> start!133680 m!1438647))

(declare-fun m!1438649 () Bool)

(assert (=> start!133680 m!1438649))

(declare-fun m!1438651 () Bool)

(assert (=> start!133680 m!1438651))

(declare-fun m!1438653 () Bool)

(assert (=> mapNonEmpty!59520 m!1438653))

(declare-fun m!1438655 () Bool)

(assert (=> b!1562979 m!1438655))

(check-sat (not b!1562979) (not start!133680) (not b!1562976) tp_is_empty!38763 (not mapNonEmpty!59520))
(check-sat)
