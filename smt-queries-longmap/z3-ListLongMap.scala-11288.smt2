; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132000 () Bool)

(assert start!132000)

(declare-fun b!1543967 () Bool)

(declare-fun e!858880 () Bool)

(declare-fun tp_is_empty!37621 () Bool)

(assert (=> b!1543967 (= e!858880 tp_is_empty!37621)))

(declare-fun b!1543968 () Bool)

(declare-fun e!858883 () Bool)

(declare-fun mapRes!58120 () Bool)

(assert (=> b!1543968 (= e!858883 (and e!858880 mapRes!58120))))

(declare-fun condMapEmpty!58120 () Bool)

(declare-datatypes ((V!58605 0))(
  ( (V!58606 (val!18888 Int)) )
))
(declare-datatypes ((ValueCell!17900 0))(
  ( (ValueCellFull!17900 (v!21680 V!58605)) (EmptyCell!17900) )
))
(declare-datatypes ((array!102596 0))(
  ( (array!102597 (arr!49498 (Array (_ BitVec 32) ValueCell!17900)) (size!50049 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102596)

(declare-fun mapDefault!58120 () ValueCell!17900)

(assert (=> b!1543968 (= condMapEmpty!58120 (= (arr!49498 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17900)) mapDefault!58120)))))

(declare-fun mapNonEmpty!58120 () Bool)

(declare-fun tp!110647 () Bool)

(declare-fun e!858879 () Bool)

(assert (=> mapNonEmpty!58120 (= mapRes!58120 (and tp!110647 e!858879))))

(declare-fun mapRest!58120 () (Array (_ BitVec 32) ValueCell!17900))

(declare-fun mapKey!58120 () (_ BitVec 32))

(declare-fun mapValue!58120 () ValueCell!17900)

(assert (=> mapNonEmpty!58120 (= (arr!49498 _values!470) (store mapRest!58120 mapKey!58120 mapValue!58120))))

(declare-fun res!1058907 () Bool)

(declare-fun e!858881 () Bool)

(assert (=> start!132000 (=> (not res!1058907) (not e!858881))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132000 (= res!1058907 (validMask!0 mask!926))))

(assert (=> start!132000 e!858881))

(assert (=> start!132000 true))

(declare-fun array_inv!38779 (array!102596) Bool)

(assert (=> start!132000 (and (array_inv!38779 _values!470) e!858883)))

(declare-datatypes ((array!102598 0))(
  ( (array!102599 (arr!49499 (Array (_ BitVec 32) (_ BitVec 64))) (size!50050 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102598)

(declare-fun array_inv!38780 (array!102598) Bool)

(assert (=> start!132000 (array_inv!38780 _keys!618)))

(declare-fun mapIsEmpty!58120 () Bool)

(assert (=> mapIsEmpty!58120 mapRes!58120))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun b!1543969 () Bool)

(assert (=> b!1543969 (= e!858881 (and (= (size!50049 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50050 _keys!618) (size!50049 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011) (not (= (size!50050 _keys!618) (bvadd #b00000000000000000000000000000001 mask!926)))))))

(declare-fun b!1543970 () Bool)

(assert (=> b!1543970 (= e!858879 tp_is_empty!37621)))

(assert (= (and start!132000 res!1058907) b!1543969))

(assert (= (and b!1543968 condMapEmpty!58120) mapIsEmpty!58120))

(assert (= (and b!1543968 (not condMapEmpty!58120)) mapNonEmpty!58120))

(get-info :version)

(assert (= (and mapNonEmpty!58120 ((_ is ValueCellFull!17900) mapValue!58120)) b!1543970))

(assert (= (and b!1543968 ((_ is ValueCellFull!17900) mapDefault!58120)) b!1543967))

(assert (= start!132000 b!1543968))

(declare-fun m!1425755 () Bool)

(assert (=> mapNonEmpty!58120 m!1425755))

(declare-fun m!1425757 () Bool)

(assert (=> start!132000 m!1425757))

(declare-fun m!1425759 () Bool)

(assert (=> start!132000 m!1425759))

(declare-fun m!1425761 () Bool)

(assert (=> start!132000 m!1425761))

(check-sat (not start!132000) (not mapNonEmpty!58120) tp_is_empty!37621)
(check-sat)
