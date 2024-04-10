; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133650 () Bool)

(assert start!133650)

(declare-fun b!1562706 () Bool)

(declare-fun e!870837 () Bool)

(declare-fun tp_is_empty!38733 () Bool)

(assert (=> b!1562706 (= e!870837 tp_is_empty!38733)))

(declare-fun mapNonEmpty!59475 () Bool)

(declare-fun mapRes!59475 () Bool)

(declare-fun tp!113310 () Bool)

(assert (=> mapNonEmpty!59475 (= mapRes!59475 (and tp!113310 e!870837))))

(declare-datatypes ((V!59851 0))(
  ( (V!59852 (val!19450 Int)) )
))
(declare-datatypes ((ValueCell!18336 0))(
  ( (ValueCellFull!18336 (v!22202 V!59851)) (EmptyCell!18336) )
))
(declare-fun mapRest!59475 () (Array (_ BitVec 32) ValueCell!18336))

(declare-fun mapKey!59475 () (_ BitVec 32))

(declare-datatypes ((array!104180 0))(
  ( (array!104181 (arr!50282 (Array (_ BitVec 32) ValueCell!18336)) (size!50832 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104180)

(declare-fun mapValue!59475 () ValueCell!18336)

(assert (=> mapNonEmpty!59475 (= (arr!50282 _values!487) (store mapRest!59475 mapKey!59475 mapValue!59475))))

(declare-fun b!1562707 () Bool)

(declare-fun res!1068403 () Bool)

(declare-fun e!870835 () Bool)

(assert (=> b!1562707 (=> (not res!1068403) (not e!870835))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104182 0))(
  ( (array!104183 (arr!50283 (Array (_ BitVec 32) (_ BitVec 64))) (size!50833 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104182)

(assert (=> b!1562707 (= res!1068403 (and (= (size!50832 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50833 _keys!637) (size!50832 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1068405 () Bool)

(assert (=> start!133650 (=> (not res!1068405) (not e!870835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133650 (= res!1068405 (validMask!0 mask!947))))

(assert (=> start!133650 e!870835))

(assert (=> start!133650 true))

(declare-fun e!870834 () Bool)

(declare-fun array_inv!39083 (array!104180) Bool)

(assert (=> start!133650 (and (array_inv!39083 _values!487) e!870834)))

(declare-fun array_inv!39084 (array!104182) Bool)

(assert (=> start!133650 (array_inv!39084 _keys!637)))

(declare-fun b!1562708 () Bool)

(declare-fun e!870836 () Bool)

(assert (=> b!1562708 (= e!870836 tp_is_empty!38733)))

(declare-fun b!1562709 () Bool)

(assert (=> b!1562709 (= e!870835 false)))

(declare-fun lt!671769 () Bool)

(declare-datatypes ((List!36498 0))(
  ( (Nil!36495) (Cons!36494 (h!37940 (_ BitVec 64)) (t!51345 List!36498)) )
))
(declare-fun arrayNoDuplicates!0 (array!104182 (_ BitVec 32) List!36498) Bool)

(assert (=> b!1562709 (= lt!671769 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36495))))

(declare-fun b!1562710 () Bool)

(declare-fun res!1068404 () Bool)

(assert (=> b!1562710 (=> (not res!1068404) (not e!870835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104182 (_ BitVec 32)) Bool)

(assert (=> b!1562710 (= res!1068404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59475 () Bool)

(assert (=> mapIsEmpty!59475 mapRes!59475))

(declare-fun b!1562711 () Bool)

(assert (=> b!1562711 (= e!870834 (and e!870836 mapRes!59475))))

(declare-fun condMapEmpty!59475 () Bool)

(declare-fun mapDefault!59475 () ValueCell!18336)

(assert (=> b!1562711 (= condMapEmpty!59475 (= (arr!50282 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18336)) mapDefault!59475)))))

(assert (= (and start!133650 res!1068405) b!1562707))

(assert (= (and b!1562707 res!1068403) b!1562710))

(assert (= (and b!1562710 res!1068404) b!1562709))

(assert (= (and b!1562711 condMapEmpty!59475) mapIsEmpty!59475))

(assert (= (and b!1562711 (not condMapEmpty!59475)) mapNonEmpty!59475))

(get-info :version)

(assert (= (and mapNonEmpty!59475 ((_ is ValueCellFull!18336) mapValue!59475)) b!1562706))

(assert (= (and b!1562711 ((_ is ValueCellFull!18336) mapDefault!59475)) b!1562708))

(assert (= start!133650 b!1562711))

(declare-fun m!1438465 () Bool)

(assert (=> mapNonEmpty!59475 m!1438465))

(declare-fun m!1438467 () Bool)

(assert (=> start!133650 m!1438467))

(declare-fun m!1438469 () Bool)

(assert (=> start!133650 m!1438469))

(declare-fun m!1438471 () Bool)

(assert (=> start!133650 m!1438471))

(declare-fun m!1438473 () Bool)

(assert (=> b!1562709 m!1438473))

(declare-fun m!1438475 () Bool)

(assert (=> b!1562710 m!1438475))

(check-sat (not mapNonEmpty!59475) (not start!133650) (not b!1562709) (not b!1562710) tp_is_empty!38733)
(check-sat)
