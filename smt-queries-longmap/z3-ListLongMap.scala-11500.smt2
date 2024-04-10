; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133836 () Bool)

(assert start!133836)

(declare-fun res!1069710 () Bool)

(declare-fun e!872155 () Bool)

(assert (=> start!133836 (=> (not res!1069710) (not e!872155))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133836 (= res!1069710 (validMask!0 mask!947))))

(assert (=> start!133836 e!872155))

(assert (=> start!133836 true))

(declare-datatypes ((V!60051 0))(
  ( (V!60052 (val!19525 Int)) )
))
(declare-datatypes ((ValueCell!18411 0))(
  ( (ValueCellFull!18411 (v!22279 V!60051)) (EmptyCell!18411) )
))
(declare-datatypes ((array!104454 0))(
  ( (array!104455 (arr!50417 (Array (_ BitVec 32) ValueCell!18411)) (size!50967 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104454)

(declare-fun e!872156 () Bool)

(declare-fun array_inv!39181 (array!104454) Bool)

(assert (=> start!133836 (and (array_inv!39181 _values!487) e!872156)))

(declare-datatypes ((array!104456 0))(
  ( (array!104457 (arr!50418 (Array (_ BitVec 32) (_ BitVec 64))) (size!50968 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104456)

(declare-fun array_inv!39182 (array!104456) Bool)

(assert (=> start!133836 (array_inv!39182 _keys!637)))

(declare-fun b!1564759 () Bool)

(declare-fun res!1069709 () Bool)

(assert (=> b!1564759 (=> (not res!1069709) (not e!872155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104456 (_ BitVec 32)) Bool)

(assert (=> b!1564759 (= res!1069709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59707 () Bool)

(declare-fun mapRes!59707 () Bool)

(assert (=> mapIsEmpty!59707 mapRes!59707))

(declare-fun b!1564760 () Bool)

(declare-fun e!872157 () Bool)

(assert (=> b!1564760 (= e!872156 (and e!872157 mapRes!59707))))

(declare-fun condMapEmpty!59707 () Bool)

(declare-fun mapDefault!59707 () ValueCell!18411)

(assert (=> b!1564760 (= condMapEmpty!59707 (= (arr!50417 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18411)) mapDefault!59707)))))

(declare-fun b!1564761 () Bool)

(declare-fun tp_is_empty!38883 () Bool)

(assert (=> b!1564761 (= e!872157 tp_is_empty!38883)))

(declare-fun b!1564762 () Bool)

(declare-fun e!872158 () Bool)

(assert (=> b!1564762 (= e!872158 tp_is_empty!38883)))

(declare-fun mapNonEmpty!59707 () Bool)

(declare-fun tp!113632 () Bool)

(assert (=> mapNonEmpty!59707 (= mapRes!59707 (and tp!113632 e!872158))))

(declare-fun mapValue!59707 () ValueCell!18411)

(declare-fun mapRest!59707 () (Array (_ BitVec 32) ValueCell!18411))

(declare-fun mapKey!59707 () (_ BitVec 32))

(assert (=> mapNonEmpty!59707 (= (arr!50417 _values!487) (store mapRest!59707 mapKey!59707 mapValue!59707))))

(declare-fun b!1564763 () Bool)

(assert (=> b!1564763 (= e!872155 false)))

(declare-fun lt!672104 () Bool)

(declare-datatypes ((List!36581 0))(
  ( (Nil!36578) (Cons!36577 (h!38023 (_ BitVec 64)) (t!51428 List!36581)) )
))
(declare-fun arrayNoDuplicates!0 (array!104456 (_ BitVec 32) List!36581) Bool)

(assert (=> b!1564763 (= lt!672104 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36578))))

(declare-fun b!1564764 () Bool)

(declare-fun res!1069711 () Bool)

(assert (=> b!1564764 (=> (not res!1069711) (not e!872155))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564764 (= res!1069711 (and (= (size!50967 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50968 _keys!637) (size!50967 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133836 res!1069710) b!1564764))

(assert (= (and b!1564764 res!1069711) b!1564759))

(assert (= (and b!1564759 res!1069709) b!1564763))

(assert (= (and b!1564760 condMapEmpty!59707) mapIsEmpty!59707))

(assert (= (and b!1564760 (not condMapEmpty!59707)) mapNonEmpty!59707))

(get-info :version)

(assert (= (and mapNonEmpty!59707 ((_ is ValueCellFull!18411) mapValue!59707)) b!1564762))

(assert (= (and b!1564760 ((_ is ValueCellFull!18411) mapDefault!59707)) b!1564761))

(assert (= start!133836 b!1564760))

(declare-fun m!1439857 () Bool)

(assert (=> start!133836 m!1439857))

(declare-fun m!1439859 () Bool)

(assert (=> start!133836 m!1439859))

(declare-fun m!1439861 () Bool)

(assert (=> start!133836 m!1439861))

(declare-fun m!1439863 () Bool)

(assert (=> b!1564759 m!1439863))

(declare-fun m!1439865 () Bool)

(assert (=> mapNonEmpty!59707 m!1439865))

(declare-fun m!1439867 () Bool)

(assert (=> b!1564763 m!1439867))

(check-sat (not start!133836) (not b!1564763) tp_is_empty!38883 (not mapNonEmpty!59707) (not b!1564759))
(check-sat)
