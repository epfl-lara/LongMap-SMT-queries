; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72496 () Bool)

(assert start!72496)

(declare-fun b!838868 () Bool)

(declare-fun e!468336 () Bool)

(assert (=> b!838868 (= e!468336 false)))

(declare-fun lt!380996 () Bool)

(declare-datatypes ((array!47057 0))(
  ( (array!47058 (arr!22555 (Array (_ BitVec 32) (_ BitVec 64))) (size!22996 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47057)

(declare-datatypes ((List!15949 0))(
  ( (Nil!15946) (Cons!15945 (h!17082 (_ BitVec 64)) (t!22312 List!15949)) )
))
(declare-fun arrayNoDuplicates!0 (array!47057 (_ BitVec 32) List!15949) Bool)

(assert (=> b!838868 (= lt!380996 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15946))))

(declare-fun res!570193 () Bool)

(assert (=> start!72496 (=> (not res!570193) (not e!468336))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72496 (= res!570193 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22996 _keys!868))))))

(assert (=> start!72496 e!468336))

(assert (=> start!72496 true))

(declare-fun array_inv!18016 (array!47057) Bool)

(assert (=> start!72496 (array_inv!18016 _keys!868)))

(declare-datatypes ((V!25553 0))(
  ( (V!25554 (val!7737 Int)) )
))
(declare-datatypes ((ValueCell!7250 0))(
  ( (ValueCellFull!7250 (v!10162 V!25553)) (EmptyCell!7250) )
))
(declare-datatypes ((array!47059 0))(
  ( (array!47060 (arr!22556 (Array (_ BitVec 32) ValueCell!7250)) (size!22997 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47059)

(declare-fun e!468339 () Bool)

(declare-fun array_inv!18017 (array!47059) Bool)

(assert (=> start!72496 (and (array_inv!18017 _values!688) e!468339)))

(declare-fun b!838869 () Bool)

(declare-fun e!468338 () Bool)

(declare-fun tp_is_empty!15379 () Bool)

(assert (=> b!838869 (= e!468338 tp_is_empty!15379)))

(declare-fun mapIsEmpty!24668 () Bool)

(declare-fun mapRes!24668 () Bool)

(assert (=> mapIsEmpty!24668 mapRes!24668))

(declare-fun b!838870 () Bool)

(declare-fun res!570190 () Bool)

(assert (=> b!838870 (=> (not res!570190) (not e!468336))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47057 (_ BitVec 32)) Bool)

(assert (=> b!838870 (= res!570190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838871 () Bool)

(declare-fun e!468340 () Bool)

(assert (=> b!838871 (= e!468340 tp_is_empty!15379)))

(declare-fun b!838872 () Bool)

(declare-fun res!570192 () Bool)

(assert (=> b!838872 (=> (not res!570192) (not e!468336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838872 (= res!570192 (validMask!0 mask!1196))))

(declare-fun b!838873 () Bool)

(declare-fun res!570191 () Bool)

(assert (=> b!838873 (=> (not res!570191) (not e!468336))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838873 (= res!570191 (and (= (size!22997 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22996 _keys!868) (size!22997 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24668 () Bool)

(declare-fun tp!47663 () Bool)

(assert (=> mapNonEmpty!24668 (= mapRes!24668 (and tp!47663 e!468340))))

(declare-fun mapKey!24668 () (_ BitVec 32))

(declare-fun mapValue!24668 () ValueCell!7250)

(declare-fun mapRest!24668 () (Array (_ BitVec 32) ValueCell!7250))

(assert (=> mapNonEmpty!24668 (= (arr!22556 _values!688) (store mapRest!24668 mapKey!24668 mapValue!24668))))

(declare-fun b!838874 () Bool)

(assert (=> b!838874 (= e!468339 (and e!468338 mapRes!24668))))

(declare-fun condMapEmpty!24668 () Bool)

(declare-fun mapDefault!24668 () ValueCell!7250)

(assert (=> b!838874 (= condMapEmpty!24668 (= (arr!22556 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7250)) mapDefault!24668)))))

(assert (= (and start!72496 res!570193) b!838872))

(assert (= (and b!838872 res!570192) b!838873))

(assert (= (and b!838873 res!570191) b!838870))

(assert (= (and b!838870 res!570190) b!838868))

(assert (= (and b!838874 condMapEmpty!24668) mapIsEmpty!24668))

(assert (= (and b!838874 (not condMapEmpty!24668)) mapNonEmpty!24668))

(get-info :version)

(assert (= (and mapNonEmpty!24668 ((_ is ValueCellFull!7250) mapValue!24668)) b!838871))

(assert (= (and b!838874 ((_ is ValueCellFull!7250) mapDefault!24668)) b!838869))

(assert (= start!72496 b!838874))

(declare-fun m!783881 () Bool)

(assert (=> b!838870 m!783881))

(declare-fun m!783883 () Bool)

(assert (=> start!72496 m!783883))

(declare-fun m!783885 () Bool)

(assert (=> start!72496 m!783885))

(declare-fun m!783887 () Bool)

(assert (=> b!838868 m!783887))

(declare-fun m!783889 () Bool)

(assert (=> mapNonEmpty!24668 m!783889))

(declare-fun m!783891 () Bool)

(assert (=> b!838872 m!783891))

(check-sat (not start!72496) (not b!838868) tp_is_empty!15379 (not b!838872) (not b!838870) (not mapNonEmpty!24668))
(check-sat)
