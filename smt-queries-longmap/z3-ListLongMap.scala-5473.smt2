; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72604 () Bool)

(assert start!72604)

(declare-fun b!842757 () Bool)

(declare-fun e!470137 () Bool)

(assert (=> b!842757 (= e!470137 false)))

(declare-fun lt!380840 () Bool)

(declare-datatypes ((array!47591 0))(
  ( (array!47592 (arr!22827 (Array (_ BitVec 32) (_ BitVec 64))) (size!23269 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47591)

(declare-datatypes ((List!16240 0))(
  ( (Nil!16237) (Cons!16236 (h!17367 (_ BitVec 64)) (t!22602 List!16240)) )
))
(declare-fun arrayNoDuplicates!0 (array!47591 (_ BitVec 32) List!16240) Bool)

(assert (=> b!842757 (= lt!380840 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16237))))

(declare-fun b!842758 () Bool)

(declare-fun res!572796 () Bool)

(assert (=> b!842758 (=> (not res!572796) (not e!470137))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!25945 0))(
  ( (V!25946 (val!7884 Int)) )
))
(declare-datatypes ((ValueCell!7397 0))(
  ( (ValueCellFull!7397 (v!10303 V!25945)) (EmptyCell!7397) )
))
(declare-datatypes ((array!47593 0))(
  ( (array!47594 (arr!22828 (Array (_ BitVec 32) ValueCell!7397)) (size!23270 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47593)

(assert (=> b!842758 (= res!572796 (and (= (size!23270 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23269 _keys!868) (size!23270 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25109 () Bool)

(declare-fun mapRes!25109 () Bool)

(declare-fun tp!48428 () Bool)

(declare-fun e!470135 () Bool)

(assert (=> mapNonEmpty!25109 (= mapRes!25109 (and tp!48428 e!470135))))

(declare-fun mapKey!25109 () (_ BitVec 32))

(declare-fun mapValue!25109 () ValueCell!7397)

(declare-fun mapRest!25109 () (Array (_ BitVec 32) ValueCell!7397))

(assert (=> mapNonEmpty!25109 (= (arr!22828 _values!688) (store mapRest!25109 mapKey!25109 mapValue!25109))))

(declare-fun b!842760 () Bool)

(declare-fun tp_is_empty!15673 () Bool)

(assert (=> b!842760 (= e!470135 tp_is_empty!15673)))

(declare-fun b!842761 () Bool)

(declare-fun e!470138 () Bool)

(assert (=> b!842761 (= e!470138 tp_is_empty!15673)))

(declare-fun b!842762 () Bool)

(declare-fun res!572799 () Bool)

(assert (=> b!842762 (=> (not res!572799) (not e!470137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47591 (_ BitVec 32)) Bool)

(assert (=> b!842762 (= res!572799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25109 () Bool)

(assert (=> mapIsEmpty!25109 mapRes!25109))

(declare-fun b!842763 () Bool)

(declare-fun e!470139 () Bool)

(assert (=> b!842763 (= e!470139 (and e!470138 mapRes!25109))))

(declare-fun condMapEmpty!25109 () Bool)

(declare-fun mapDefault!25109 () ValueCell!7397)

(assert (=> b!842763 (= condMapEmpty!25109 (= (arr!22828 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7397)) mapDefault!25109)))))

(declare-fun b!842759 () Bool)

(declare-fun res!572797 () Bool)

(assert (=> b!842759 (=> (not res!572797) (not e!470137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842759 (= res!572797 (validMask!0 mask!1196))))

(declare-fun res!572798 () Bool)

(assert (=> start!72604 (=> (not res!572798) (not e!470137))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72604 (= res!572798 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23269 _keys!868))))))

(assert (=> start!72604 e!470137))

(assert (=> start!72604 true))

(declare-fun array_inv!18232 (array!47591) Bool)

(assert (=> start!72604 (array_inv!18232 _keys!868)))

(declare-fun array_inv!18233 (array!47593) Bool)

(assert (=> start!72604 (and (array_inv!18233 _values!688) e!470139)))

(assert (= (and start!72604 res!572798) b!842759))

(assert (= (and b!842759 res!572797) b!842758))

(assert (= (and b!842758 res!572796) b!842762))

(assert (= (and b!842762 res!572799) b!842757))

(assert (= (and b!842763 condMapEmpty!25109) mapIsEmpty!25109))

(assert (= (and b!842763 (not condMapEmpty!25109)) mapNonEmpty!25109))

(get-info :version)

(assert (= (and mapNonEmpty!25109 ((_ is ValueCellFull!7397) mapValue!25109)) b!842760))

(assert (= (and b!842763 ((_ is ValueCellFull!7397) mapDefault!25109)) b!842761))

(assert (= start!72604 b!842763))

(declare-fun m!785111 () Bool)

(assert (=> mapNonEmpty!25109 m!785111))

(declare-fun m!785113 () Bool)

(assert (=> b!842762 m!785113))

(declare-fun m!785115 () Bool)

(assert (=> start!72604 m!785115))

(declare-fun m!785117 () Bool)

(assert (=> start!72604 m!785117))

(declare-fun m!785119 () Bool)

(assert (=> b!842759 m!785119))

(declare-fun m!785121 () Bool)

(assert (=> b!842757 m!785121))

(check-sat tp_is_empty!15673 (not mapNonEmpty!25109) (not b!842762) (not b!842759) (not b!842757) (not start!72604))
(check-sat)
