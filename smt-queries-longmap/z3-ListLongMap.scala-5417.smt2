; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72454 () Bool)

(assert start!72454)

(declare-fun b!838427 () Bool)

(declare-fun res!569940 () Bool)

(declare-fun e!468022 () Bool)

(assert (=> b!838427 (=> (not res!569940) (not e!468022))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838427 (= res!569940 (validMask!0 mask!1196))))

(declare-fun res!569941 () Bool)

(assert (=> start!72454 (=> (not res!569941) (not e!468022))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46973 0))(
  ( (array!46974 (arr!22513 (Array (_ BitVec 32) (_ BitVec 64))) (size!22954 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46973)

(assert (=> start!72454 (= res!569941 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22954 _keys!868))))))

(assert (=> start!72454 e!468022))

(assert (=> start!72454 true))

(declare-fun array_inv!17986 (array!46973) Bool)

(assert (=> start!72454 (array_inv!17986 _keys!868)))

(declare-datatypes ((V!25497 0))(
  ( (V!25498 (val!7716 Int)) )
))
(declare-datatypes ((ValueCell!7229 0))(
  ( (ValueCellFull!7229 (v!10141 V!25497)) (EmptyCell!7229) )
))
(declare-datatypes ((array!46975 0))(
  ( (array!46976 (arr!22514 (Array (_ BitVec 32) ValueCell!7229)) (size!22955 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46975)

(declare-fun e!468023 () Bool)

(declare-fun array_inv!17987 (array!46975) Bool)

(assert (=> start!72454 (and (array_inv!17987 _values!688) e!468023)))

(declare-fun mapNonEmpty!24605 () Bool)

(declare-fun mapRes!24605 () Bool)

(declare-fun tp!47600 () Bool)

(declare-fun e!468025 () Bool)

(assert (=> mapNonEmpty!24605 (= mapRes!24605 (and tp!47600 e!468025))))

(declare-fun mapValue!24605 () ValueCell!7229)

(declare-fun mapRest!24605 () (Array (_ BitVec 32) ValueCell!7229))

(declare-fun mapKey!24605 () (_ BitVec 32))

(assert (=> mapNonEmpty!24605 (= (arr!22514 _values!688) (store mapRest!24605 mapKey!24605 mapValue!24605))))

(declare-fun b!838428 () Bool)

(declare-fun res!569938 () Bool)

(assert (=> b!838428 (=> (not res!569938) (not e!468022))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838428 (= res!569938 (and (= (size!22955 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22954 _keys!868) (size!22955 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838429 () Bool)

(declare-fun tp_is_empty!15337 () Bool)

(assert (=> b!838429 (= e!468025 tp_is_empty!15337)))

(declare-fun b!838430 () Bool)

(declare-fun e!468021 () Bool)

(assert (=> b!838430 (= e!468023 (and e!468021 mapRes!24605))))

(declare-fun condMapEmpty!24605 () Bool)

(declare-fun mapDefault!24605 () ValueCell!7229)

(assert (=> b!838430 (= condMapEmpty!24605 (= (arr!22514 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7229)) mapDefault!24605)))))

(declare-fun b!838431 () Bool)

(declare-fun res!569939 () Bool)

(assert (=> b!838431 (=> (not res!569939) (not e!468022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46973 (_ BitVec 32)) Bool)

(assert (=> b!838431 (= res!569939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24605 () Bool)

(assert (=> mapIsEmpty!24605 mapRes!24605))

(declare-fun b!838432 () Bool)

(assert (=> b!838432 (= e!468021 tp_is_empty!15337)))

(declare-fun b!838433 () Bool)

(assert (=> b!838433 (= e!468022 false)))

(declare-fun lt!380933 () Bool)

(declare-datatypes ((List!15934 0))(
  ( (Nil!15931) (Cons!15930 (h!17067 (_ BitVec 64)) (t!22297 List!15934)) )
))
(declare-fun arrayNoDuplicates!0 (array!46973 (_ BitVec 32) List!15934) Bool)

(assert (=> b!838433 (= lt!380933 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15931))))

(assert (= (and start!72454 res!569941) b!838427))

(assert (= (and b!838427 res!569940) b!838428))

(assert (= (and b!838428 res!569938) b!838431))

(assert (= (and b!838431 res!569939) b!838433))

(assert (= (and b!838430 condMapEmpty!24605) mapIsEmpty!24605))

(assert (= (and b!838430 (not condMapEmpty!24605)) mapNonEmpty!24605))

(get-info :version)

(assert (= (and mapNonEmpty!24605 ((_ is ValueCellFull!7229) mapValue!24605)) b!838429))

(assert (= (and b!838430 ((_ is ValueCellFull!7229) mapDefault!24605)) b!838432))

(assert (= start!72454 b!838430))

(declare-fun m!783629 () Bool)

(assert (=> b!838433 m!783629))

(declare-fun m!783631 () Bool)

(assert (=> b!838431 m!783631))

(declare-fun m!783633 () Bool)

(assert (=> b!838427 m!783633))

(declare-fun m!783635 () Bool)

(assert (=> start!72454 m!783635))

(declare-fun m!783637 () Bool)

(assert (=> start!72454 m!783637))

(declare-fun m!783639 () Bool)

(assert (=> mapNonEmpty!24605 m!783639))

(check-sat (not mapNonEmpty!24605) (not b!838433) (not start!72454) tp_is_empty!15337 (not b!838431) (not b!838427))
(check-sat)
