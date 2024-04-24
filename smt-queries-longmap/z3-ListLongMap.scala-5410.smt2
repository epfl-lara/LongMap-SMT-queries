; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72382 () Bool)

(assert start!72382)

(declare-fun b!837884 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun e!467632 () Bool)

(declare-datatypes ((array!46889 0))(
  ( (array!46890 (arr!22474 (Array (_ BitVec 32) (_ BitVec 64))) (size!22915 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46889)

(declare-datatypes ((V!25441 0))(
  ( (V!25442 (val!7695 Int)) )
))
(declare-datatypes ((ValueCell!7208 0))(
  ( (ValueCellFull!7208 (v!10119 V!25441)) (EmptyCell!7208) )
))
(declare-datatypes ((array!46891 0))(
  ( (array!46892 (arr!22475 (Array (_ BitVec 32) ValueCell!7208)) (size!22916 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46891)

(assert (=> b!837884 (= e!467632 (and (= (size!22916 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22915 _keys!868) (size!22916 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011) (= (size!22915 _keys!868) (bvadd #b00000000000000000000000000000001 mask!1196)) (bvsgt #b00000000000000000000000000000000 (size!22915 _keys!868))))))

(declare-fun b!837885 () Bool)

(declare-fun e!467636 () Bool)

(declare-fun tp_is_empty!15295 () Bool)

(assert (=> b!837885 (= e!467636 tp_is_empty!15295)))

(declare-fun b!837886 () Bool)

(declare-fun e!467633 () Bool)

(assert (=> b!837886 (= e!467633 tp_is_empty!15295)))

(declare-fun res!569626 () Bool)

(assert (=> start!72382 (=> (not res!569626) (not e!467632))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72382 (= res!569626 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22915 _keys!868))))))

(assert (=> start!72382 e!467632))

(assert (=> start!72382 true))

(declare-fun array_inv!17958 (array!46889) Bool)

(assert (=> start!72382 (array_inv!17958 _keys!868)))

(declare-fun e!467634 () Bool)

(declare-fun array_inv!17959 (array!46891) Bool)

(assert (=> start!72382 (and (array_inv!17959 _values!688) e!467634)))

(declare-fun mapNonEmpty!24533 () Bool)

(declare-fun mapRes!24533 () Bool)

(declare-fun tp!47528 () Bool)

(assert (=> mapNonEmpty!24533 (= mapRes!24533 (and tp!47528 e!467633))))

(declare-fun mapRest!24533 () (Array (_ BitVec 32) ValueCell!7208))

(declare-fun mapValue!24533 () ValueCell!7208)

(declare-fun mapKey!24533 () (_ BitVec 32))

(assert (=> mapNonEmpty!24533 (= (arr!22475 _values!688) (store mapRest!24533 mapKey!24533 mapValue!24533))))

(declare-fun mapIsEmpty!24533 () Bool)

(assert (=> mapIsEmpty!24533 mapRes!24533))

(declare-fun b!837887 () Bool)

(declare-fun res!569627 () Bool)

(assert (=> b!837887 (=> (not res!569627) (not e!467632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837887 (= res!569627 (validMask!0 mask!1196))))

(declare-fun b!837888 () Bool)

(assert (=> b!837888 (= e!467634 (and e!467636 mapRes!24533))))

(declare-fun condMapEmpty!24533 () Bool)

(declare-fun mapDefault!24533 () ValueCell!7208)

(assert (=> b!837888 (= condMapEmpty!24533 (= (arr!22475 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7208)) mapDefault!24533)))))

(assert (= (and start!72382 res!569626) b!837887))

(assert (= (and b!837887 res!569627) b!837884))

(assert (= (and b!837888 condMapEmpty!24533) mapIsEmpty!24533))

(assert (= (and b!837888 (not condMapEmpty!24533)) mapNonEmpty!24533))

(get-info :version)

(assert (= (and mapNonEmpty!24533 ((_ is ValueCellFull!7208) mapValue!24533)) b!837886))

(assert (= (and b!837888 ((_ is ValueCellFull!7208) mapDefault!24533)) b!837885))

(assert (= start!72382 b!837888))

(declare-fun m!783329 () Bool)

(assert (=> start!72382 m!783329))

(declare-fun m!783331 () Bool)

(assert (=> start!72382 m!783331))

(declare-fun m!783333 () Bool)

(assert (=> mapNonEmpty!24533 m!783333))

(declare-fun m!783335 () Bool)

(assert (=> b!837887 m!783335))

(check-sat (not b!837887) (not start!72382) (not mapNonEmpty!24533) tp_is_empty!15295)
(check-sat)
