; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72784 () Bool)

(assert start!72784)

(declare-fun b!844647 () Bool)

(declare-fun e!471487 () Bool)

(declare-fun tp_is_empty!15853 () Bool)

(assert (=> b!844647 (= e!471487 tp_is_empty!15853)))

(declare-fun mapIsEmpty!25379 () Bool)

(declare-fun mapRes!25379 () Bool)

(assert (=> mapIsEmpty!25379 mapRes!25379))

(declare-fun res!573877 () Bool)

(declare-fun e!471488 () Bool)

(assert (=> start!72784 (=> (not res!573877) (not e!471488))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47929 0))(
  ( (array!47930 (arr!22996 (Array (_ BitVec 32) (_ BitVec 64))) (size!23438 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47929)

(assert (=> start!72784 (= res!573877 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23438 _keys!868))))))

(assert (=> start!72784 e!471488))

(assert (=> start!72784 true))

(declare-fun array_inv!18348 (array!47929) Bool)

(assert (=> start!72784 (array_inv!18348 _keys!868)))

(declare-datatypes ((V!26185 0))(
  ( (V!26186 (val!7974 Int)) )
))
(declare-datatypes ((ValueCell!7487 0))(
  ( (ValueCellFull!7487 (v!10393 V!26185)) (EmptyCell!7487) )
))
(declare-datatypes ((array!47931 0))(
  ( (array!47932 (arr!22997 (Array (_ BitVec 32) ValueCell!7487)) (size!23439 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47931)

(declare-fun e!471485 () Bool)

(declare-fun array_inv!18349 (array!47931) Bool)

(assert (=> start!72784 (and (array_inv!18349 _values!688) e!471485)))

(declare-fun b!844648 () Bool)

(declare-fun res!573879 () Bool)

(assert (=> b!844648 (=> (not res!573879) (not e!471488))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844648 (= res!573879 (validMask!0 mask!1196))))

(declare-fun b!844649 () Bool)

(declare-fun res!573878 () Bool)

(assert (=> b!844649 (=> (not res!573878) (not e!471488))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844649 (= res!573878 (and (= (size!23439 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23438 _keys!868) (size!23439 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844650 () Bool)

(declare-fun e!471486 () Bool)

(assert (=> b!844650 (= e!471485 (and e!471486 mapRes!25379))))

(declare-fun condMapEmpty!25379 () Bool)

(declare-fun mapDefault!25379 () ValueCell!7487)

(assert (=> b!844650 (= condMapEmpty!25379 (= (arr!22997 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7487)) mapDefault!25379)))))

(declare-fun b!844651 () Bool)

(declare-fun res!573876 () Bool)

(assert (=> b!844651 (=> (not res!573876) (not e!471488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47929 (_ BitVec 32)) Bool)

(assert (=> b!844651 (= res!573876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844652 () Bool)

(assert (=> b!844652 (= e!471488 false)))

(declare-fun lt!381110 () Bool)

(declare-datatypes ((List!16303 0))(
  ( (Nil!16300) (Cons!16299 (h!17430 (_ BitVec 64)) (t!22665 List!16303)) )
))
(declare-fun arrayNoDuplicates!0 (array!47929 (_ BitVec 32) List!16303) Bool)

(assert (=> b!844652 (= lt!381110 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16300))))

(declare-fun b!844653 () Bool)

(assert (=> b!844653 (= e!471486 tp_is_empty!15853)))

(declare-fun mapNonEmpty!25379 () Bool)

(declare-fun tp!48698 () Bool)

(assert (=> mapNonEmpty!25379 (= mapRes!25379 (and tp!48698 e!471487))))

(declare-fun mapKey!25379 () (_ BitVec 32))

(declare-fun mapValue!25379 () ValueCell!7487)

(declare-fun mapRest!25379 () (Array (_ BitVec 32) ValueCell!7487))

(assert (=> mapNonEmpty!25379 (= (arr!22997 _values!688) (store mapRest!25379 mapKey!25379 mapValue!25379))))

(assert (= (and start!72784 res!573877) b!844648))

(assert (= (and b!844648 res!573879) b!844649))

(assert (= (and b!844649 res!573878) b!844651))

(assert (= (and b!844651 res!573876) b!844652))

(assert (= (and b!844650 condMapEmpty!25379) mapIsEmpty!25379))

(assert (= (and b!844650 (not condMapEmpty!25379)) mapNonEmpty!25379))

(get-info :version)

(assert (= (and mapNonEmpty!25379 ((_ is ValueCellFull!7487) mapValue!25379)) b!844647))

(assert (= (and b!844650 ((_ is ValueCellFull!7487) mapDefault!25379)) b!844653))

(assert (= start!72784 b!844650))

(declare-fun m!786191 () Bool)

(assert (=> b!844648 m!786191))

(declare-fun m!786193 () Bool)

(assert (=> b!844651 m!786193))

(declare-fun m!786195 () Bool)

(assert (=> mapNonEmpty!25379 m!786195))

(declare-fun m!786197 () Bool)

(assert (=> b!844652 m!786197))

(declare-fun m!786199 () Bool)

(assert (=> start!72784 m!786199))

(declare-fun m!786201 () Bool)

(assert (=> start!72784 m!786201))

(check-sat (not mapNonEmpty!25379) (not b!844651) tp_is_empty!15853 (not start!72784) (not b!844648) (not b!844652))
(check-sat)
