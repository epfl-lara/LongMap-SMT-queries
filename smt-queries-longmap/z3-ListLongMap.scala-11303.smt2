; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131672 () Bool)

(assert start!131672)

(declare-fun b!1542140 () Bool)

(declare-fun e!857942 () Bool)

(declare-fun e!857944 () Bool)

(declare-fun mapRes!58270 () Bool)

(assert (=> b!1542140 (= e!857942 (and e!857944 mapRes!58270))))

(declare-fun condMapEmpty!58270 () Bool)

(declare-datatypes ((V!58725 0))(
  ( (V!58726 (val!18933 Int)) )
))
(declare-datatypes ((ValueCell!17945 0))(
  ( (ValueCellFull!17945 (v!21730 V!58725)) (EmptyCell!17945) )
))
(declare-datatypes ((array!102590 0))(
  ( (array!102591 (arr!49498 (Array (_ BitVec 32) ValueCell!17945)) (size!50050 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102590)

(declare-fun mapDefault!58270 () ValueCell!17945)

(assert (=> b!1542140 (= condMapEmpty!58270 (= (arr!49498 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17945)) mapDefault!58270)))))

(declare-fun b!1542141 () Bool)

(declare-fun res!1058373 () Bool)

(declare-fun e!857946 () Bool)

(assert (=> b!1542141 (=> (not res!1058373) (not e!857946))))

(declare-datatypes ((array!102592 0))(
  ( (array!102593 (arr!49499 (Array (_ BitVec 32) (_ BitVec 64))) (size!50051 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102592)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1542141 (= res!1058373 (and (= (size!50050 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50051 _keys!618) (size!50050 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542142 () Bool)

(declare-fun tp_is_empty!37711 () Bool)

(assert (=> b!1542142 (= e!857944 tp_is_empty!37711)))

(declare-fun res!1058371 () Bool)

(assert (=> start!131672 (=> (not res!1058371) (not e!857946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131672 (= res!1058371 (validMask!0 mask!926))))

(assert (=> start!131672 e!857946))

(assert (=> start!131672 true))

(declare-fun array_inv!38707 (array!102590) Bool)

(assert (=> start!131672 (and (array_inv!38707 _values!470) e!857942)))

(declare-fun array_inv!38708 (array!102592) Bool)

(assert (=> start!131672 (array_inv!38708 _keys!618)))

(declare-fun b!1542143 () Bool)

(declare-fun e!857943 () Bool)

(assert (=> b!1542143 (= e!857943 tp_is_empty!37711)))

(declare-fun mapNonEmpty!58270 () Bool)

(declare-fun tp!110798 () Bool)

(assert (=> mapNonEmpty!58270 (= mapRes!58270 (and tp!110798 e!857943))))

(declare-fun mapRest!58270 () (Array (_ BitVec 32) ValueCell!17945))

(declare-fun mapKey!58270 () (_ BitVec 32))

(declare-fun mapValue!58270 () ValueCell!17945)

(assert (=> mapNonEmpty!58270 (= (arr!49498 _values!470) (store mapRest!58270 mapKey!58270 mapValue!58270))))

(declare-fun b!1542144 () Bool)

(declare-fun res!1058372 () Bool)

(assert (=> b!1542144 (=> (not res!1058372) (not e!857946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102592 (_ BitVec 32)) Bool)

(assert (=> b!1542144 (= res!1058372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542145 () Bool)

(assert (=> b!1542145 (= e!857946 false)))

(declare-fun lt!665533 () Bool)

(declare-datatypes ((List!35927 0))(
  ( (Nil!35924) (Cons!35923 (h!37369 (_ BitVec 64)) (t!50613 List!35927)) )
))
(declare-fun arrayNoDuplicates!0 (array!102592 (_ BitVec 32) List!35927) Bool)

(assert (=> b!1542145 (= lt!665533 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35924))))

(declare-fun mapIsEmpty!58270 () Bool)

(assert (=> mapIsEmpty!58270 mapRes!58270))

(assert (= (and start!131672 res!1058371) b!1542141))

(assert (= (and b!1542141 res!1058373) b!1542144))

(assert (= (and b!1542144 res!1058372) b!1542145))

(assert (= (and b!1542140 condMapEmpty!58270) mapIsEmpty!58270))

(assert (= (and b!1542140 (not condMapEmpty!58270)) mapNonEmpty!58270))

(get-info :version)

(assert (= (and mapNonEmpty!58270 ((_ is ValueCellFull!17945) mapValue!58270)) b!1542143))

(assert (= (and b!1542140 ((_ is ValueCellFull!17945) mapDefault!58270)) b!1542142))

(assert (= start!131672 b!1542140))

(declare-fun m!1423197 () Bool)

(assert (=> start!131672 m!1423197))

(declare-fun m!1423199 () Bool)

(assert (=> start!131672 m!1423199))

(declare-fun m!1423201 () Bool)

(assert (=> start!131672 m!1423201))

(declare-fun m!1423203 () Bool)

(assert (=> mapNonEmpty!58270 m!1423203))

(declare-fun m!1423205 () Bool)

(assert (=> b!1542144 m!1423205))

(declare-fun m!1423207 () Bool)

(assert (=> b!1542145 m!1423207))

(check-sat (not b!1542145) (not start!131672) (not mapNonEmpty!58270) (not b!1542144) tp_is_empty!37711)
(check-sat)
