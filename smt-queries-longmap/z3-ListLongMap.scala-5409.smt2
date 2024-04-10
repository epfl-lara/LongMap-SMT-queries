; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72210 () Bool)

(assert start!72210)

(declare-fun b!836951 () Bool)

(declare-fun e!467022 () Bool)

(declare-fun e!467024 () Bool)

(declare-fun mapRes!24527 () Bool)

(assert (=> b!836951 (= e!467022 (and e!467024 mapRes!24527))))

(declare-fun condMapEmpty!24527 () Bool)

(declare-datatypes ((V!25435 0))(
  ( (V!25436 (val!7693 Int)) )
))
(declare-datatypes ((ValueCell!7206 0))(
  ( (ValueCellFull!7206 (v!10117 V!25435)) (EmptyCell!7206) )
))
(declare-datatypes ((array!46882 0))(
  ( (array!46883 (arr!22475 (Array (_ BitVec 32) ValueCell!7206)) (size!22915 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46882)

(declare-fun mapDefault!24527 () ValueCell!7206)

(assert (=> b!836951 (= condMapEmpty!24527 (= (arr!22475 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7206)) mapDefault!24527)))))

(declare-fun b!836952 () Bool)

(declare-fun tp_is_empty!15291 () Bool)

(assert (=> b!836952 (= e!467024 tp_is_empty!15291)))

(declare-fun mapIsEmpty!24527 () Bool)

(assert (=> mapIsEmpty!24527 mapRes!24527))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun e!467020 () Bool)

(declare-datatypes ((array!46884 0))(
  ( (array!46885 (arr!22476 (Array (_ BitVec 32) (_ BitVec 64))) (size!22916 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46884)

(declare-fun b!836953 () Bool)

(assert (=> b!836953 (= e!467020 (and (= (size!22915 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22916 _keys!868) (size!22915 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011) (not (= (size!22916 _keys!868) (bvadd #b00000000000000000000000000000001 mask!1196)))))))

(declare-fun mapNonEmpty!24527 () Bool)

(declare-fun tp!47521 () Bool)

(declare-fun e!467023 () Bool)

(assert (=> mapNonEmpty!24527 (= mapRes!24527 (and tp!47521 e!467023))))

(declare-fun mapValue!24527 () ValueCell!7206)

(declare-fun mapKey!24527 () (_ BitVec 32))

(declare-fun mapRest!24527 () (Array (_ BitVec 32) ValueCell!7206))

(assert (=> mapNonEmpty!24527 (= (arr!22475 _values!688) (store mapRest!24527 mapKey!24527 mapValue!24527))))

(declare-fun b!836955 () Bool)

(declare-fun res!569270 () Bool)

(assert (=> b!836955 (=> (not res!569270) (not e!467020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!836955 (= res!569270 (validMask!0 mask!1196))))

(declare-fun b!836954 () Bool)

(assert (=> b!836954 (= e!467023 tp_is_empty!15291)))

(declare-fun res!569271 () Bool)

(assert (=> start!72210 (=> (not res!569271) (not e!467020))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72210 (= res!569271 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22916 _keys!868))))))

(assert (=> start!72210 e!467020))

(assert (=> start!72210 true))

(declare-fun array_inv!17922 (array!46884) Bool)

(assert (=> start!72210 (array_inv!17922 _keys!868)))

(declare-fun array_inv!17923 (array!46882) Bool)

(assert (=> start!72210 (and (array_inv!17923 _values!688) e!467022)))

(assert (= (and start!72210 res!569271) b!836955))

(assert (= (and b!836955 res!569270) b!836953))

(assert (= (and b!836951 condMapEmpty!24527) mapIsEmpty!24527))

(assert (= (and b!836951 (not condMapEmpty!24527)) mapNonEmpty!24527))

(get-info :version)

(assert (= (and mapNonEmpty!24527 ((_ is ValueCellFull!7206) mapValue!24527)) b!836954))

(assert (= (and b!836951 ((_ is ValueCellFull!7206) mapDefault!24527)) b!836952))

(assert (= start!72210 b!836951))

(declare-fun m!782021 () Bool)

(assert (=> mapNonEmpty!24527 m!782021))

(declare-fun m!782023 () Bool)

(assert (=> b!836955 m!782023))

(declare-fun m!782025 () Bool)

(assert (=> start!72210 m!782025))

(declare-fun m!782027 () Bool)

(assert (=> start!72210 m!782027))

(check-sat (not b!836955) (not start!72210) (not mapNonEmpty!24527) tp_is_empty!15291)
(check-sat)
