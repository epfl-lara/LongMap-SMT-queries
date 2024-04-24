; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134190 () Bool)

(assert start!134190)

(declare-fun mapNonEmpty!59655 () Bool)

(declare-fun mapRes!59655 () Bool)

(declare-fun tp!113580 () Bool)

(declare-fun e!873349 () Bool)

(assert (=> mapNonEmpty!59655 (= mapRes!59655 (and tp!113580 e!873349))))

(declare-datatypes ((V!60009 0))(
  ( (V!60010 (val!19509 Int)) )
))
(declare-datatypes ((ValueCell!18395 0))(
  ( (ValueCellFull!18395 (v!22253 V!60009)) (EmptyCell!18395) )
))
(declare-fun mapValue!59655 () ValueCell!18395)

(declare-fun mapKey!59655 () (_ BitVec 32))

(declare-fun mapRest!59655 () (Array (_ BitVec 32) ValueCell!18395))

(declare-datatypes ((array!104520 0))(
  ( (array!104521 (arr!50444 (Array (_ BitVec 32) ValueCell!18395)) (size!50995 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104520)

(assert (=> mapNonEmpty!59655 (= (arr!50444 _values!487) (store mapRest!59655 mapKey!59655 mapValue!59655))))

(declare-fun b!1566677 () Bool)

(declare-fun e!873346 () Bool)

(declare-fun tp_is_empty!38851 () Bool)

(assert (=> b!1566677 (= e!873346 tp_is_empty!38851)))

(declare-fun b!1566678 () Bool)

(declare-fun res!1070250 () Bool)

(declare-fun e!873345 () Bool)

(assert (=> b!1566678 (=> (not res!1070250) (not e!873345))))

(declare-datatypes ((array!104522 0))(
  ( (array!104523 (arr!50445 (Array (_ BitVec 32) (_ BitVec 64))) (size!50996 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104522)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104522 (_ BitVec 32)) Bool)

(assert (=> b!1566678 (= res!1070250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1070248 () Bool)

(assert (=> start!134190 (=> (not res!1070248) (not e!873345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134190 (= res!1070248 (validMask!0 mask!947))))

(assert (=> start!134190 e!873345))

(assert (=> start!134190 true))

(declare-fun array_inv!39447 (array!104522) Bool)

(assert (=> start!134190 (array_inv!39447 _keys!637)))

(declare-fun e!873348 () Bool)

(declare-fun array_inv!39448 (array!104520) Bool)

(assert (=> start!134190 (and (array_inv!39448 _values!487) e!873348)))

(declare-fun b!1566679 () Bool)

(declare-fun res!1070251 () Bool)

(assert (=> b!1566679 (=> (not res!1070251) (not e!873345))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1566679 (= res!1070251 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50996 _keys!637)) (bvsge from!782 (size!50996 _keys!637))))))

(declare-fun b!1566680 () Bool)

(assert (=> b!1566680 (= e!873349 tp_is_empty!38851)))

(declare-fun b!1566681 () Bool)

(declare-fun res!1070247 () Bool)

(assert (=> b!1566681 (=> (not res!1070247) (not e!873345))))

(declare-datatypes ((tuple2!25232 0))(
  ( (tuple2!25233 (_1!12627 (_ BitVec 64)) (_2!12627 V!60009)) )
))
(declare-datatypes ((List!36594 0))(
  ( (Nil!36591) (Cons!36590 (h!38054 tuple2!25232) (t!51433 List!36594)) )
))
(declare-datatypes ((ListLongMap!22675 0))(
  ( (ListLongMap!22676 (toList!11353 List!36594)) )
))
(declare-fun contains!10355 (ListLongMap!22675 (_ BitVec 64)) Bool)

(assert (=> b!1566681 (= res!1070247 (not (contains!10355 (ListLongMap!22676 Nil!36591) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566682 () Bool)

(assert (=> b!1566682 (= e!873345 false)))

(declare-fun lt!672926 () Bool)

(assert (=> b!1566682 (= lt!672926 (contains!10355 (ListLongMap!22676 Nil!36591) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59655 () Bool)

(assert (=> mapIsEmpty!59655 mapRes!59655))

(declare-fun b!1566683 () Bool)

(declare-fun res!1070249 () Bool)

(assert (=> b!1566683 (=> (not res!1070249) (not e!873345))))

(declare-datatypes ((List!36595 0))(
  ( (Nil!36592) (Cons!36591 (h!38055 (_ BitVec 64)) (t!51434 List!36595)) )
))
(declare-fun arrayNoDuplicates!0 (array!104522 (_ BitVec 32) List!36595) Bool)

(assert (=> b!1566683 (= res!1070249 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36592))))

(declare-fun b!1566684 () Bool)

(declare-fun res!1070252 () Bool)

(assert (=> b!1566684 (=> (not res!1070252) (not e!873345))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566684 (= res!1070252 (and (= (size!50995 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50996 _keys!637) (size!50995 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566685 () Bool)

(assert (=> b!1566685 (= e!873348 (and e!873346 mapRes!59655))))

(declare-fun condMapEmpty!59655 () Bool)

(declare-fun mapDefault!59655 () ValueCell!18395)

(assert (=> b!1566685 (= condMapEmpty!59655 (= (arr!50444 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18395)) mapDefault!59655)))))

(assert (= (and start!134190 res!1070248) b!1566684))

(assert (= (and b!1566684 res!1070252) b!1566678))

(assert (= (and b!1566678 res!1070250) b!1566683))

(assert (= (and b!1566683 res!1070249) b!1566679))

(assert (= (and b!1566679 res!1070251) b!1566681))

(assert (= (and b!1566681 res!1070247) b!1566682))

(assert (= (and b!1566685 condMapEmpty!59655) mapIsEmpty!59655))

(assert (= (and b!1566685 (not condMapEmpty!59655)) mapNonEmpty!59655))

(get-info :version)

(assert (= (and mapNonEmpty!59655 ((_ is ValueCellFull!18395) mapValue!59655)) b!1566680))

(assert (= (and b!1566685 ((_ is ValueCellFull!18395) mapDefault!59655)) b!1566677))

(assert (= start!134190 b!1566685))

(declare-fun m!1441773 () Bool)

(assert (=> mapNonEmpty!59655 m!1441773))

(declare-fun m!1441775 () Bool)

(assert (=> b!1566683 m!1441775))

(declare-fun m!1441777 () Bool)

(assert (=> b!1566681 m!1441777))

(declare-fun m!1441779 () Bool)

(assert (=> b!1566678 m!1441779))

(declare-fun m!1441781 () Bool)

(assert (=> start!134190 m!1441781))

(declare-fun m!1441783 () Bool)

(assert (=> start!134190 m!1441783))

(declare-fun m!1441785 () Bool)

(assert (=> start!134190 m!1441785))

(declare-fun m!1441787 () Bool)

(assert (=> b!1566682 m!1441787))

(check-sat (not start!134190) (not b!1566681) (not mapNonEmpty!59655) tp_is_empty!38851 (not b!1566683) (not b!1566678) (not b!1566682))
(check-sat)
