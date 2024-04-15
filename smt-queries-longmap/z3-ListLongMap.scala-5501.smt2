; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72772 () Bool)

(assert start!72772)

(declare-fun b!844521 () Bool)

(declare-fun res!573807 () Bool)

(declare-fun e!471396 () Bool)

(assert (=> b!844521 (=> (not res!573807) (not e!471396))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844521 (= res!573807 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25361 () Bool)

(declare-fun mapRes!25361 () Bool)

(assert (=> mapIsEmpty!25361 mapRes!25361))

(declare-fun b!844522 () Bool)

(declare-fun e!471399 () Bool)

(declare-fun tp_is_empty!15841 () Bool)

(assert (=> b!844522 (= e!471399 tp_is_empty!15841)))

(declare-fun b!844523 () Bool)

(declare-fun e!471398 () Bool)

(assert (=> b!844523 (= e!471398 tp_is_empty!15841)))

(declare-fun res!573806 () Bool)

(assert (=> start!72772 (=> (not res!573806) (not e!471396))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47905 0))(
  ( (array!47906 (arr!22984 (Array (_ BitVec 32) (_ BitVec 64))) (size!23426 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47905)

(assert (=> start!72772 (= res!573806 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23426 _keys!868))))))

(assert (=> start!72772 e!471396))

(assert (=> start!72772 true))

(declare-fun array_inv!18340 (array!47905) Bool)

(assert (=> start!72772 (array_inv!18340 _keys!868)))

(declare-datatypes ((V!26169 0))(
  ( (V!26170 (val!7968 Int)) )
))
(declare-datatypes ((ValueCell!7481 0))(
  ( (ValueCellFull!7481 (v!10387 V!26169)) (EmptyCell!7481) )
))
(declare-datatypes ((array!47907 0))(
  ( (array!47908 (arr!22985 (Array (_ BitVec 32) ValueCell!7481)) (size!23427 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47907)

(declare-fun e!471395 () Bool)

(declare-fun array_inv!18341 (array!47907) Bool)

(assert (=> start!72772 (and (array_inv!18341 _values!688) e!471395)))

(declare-fun b!844524 () Bool)

(declare-fun res!573804 () Bool)

(assert (=> b!844524 (=> (not res!573804) (not e!471396))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844524 (= res!573804 (and (= (size!23427 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23426 _keys!868) (size!23427 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844525 () Bool)

(declare-fun res!573805 () Bool)

(assert (=> b!844525 (=> (not res!573805) (not e!471396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47905 (_ BitVec 32)) Bool)

(assert (=> b!844525 (= res!573805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844526 () Bool)

(assert (=> b!844526 (= e!471395 (and e!471399 mapRes!25361))))

(declare-fun condMapEmpty!25361 () Bool)

(declare-fun mapDefault!25361 () ValueCell!7481)

(assert (=> b!844526 (= condMapEmpty!25361 (= (arr!22985 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7481)) mapDefault!25361)))))

(declare-fun b!844527 () Bool)

(assert (=> b!844527 (= e!471396 false)))

(declare-fun lt!381092 () Bool)

(declare-datatypes ((List!16297 0))(
  ( (Nil!16294) (Cons!16293 (h!17424 (_ BitVec 64)) (t!22659 List!16297)) )
))
(declare-fun arrayNoDuplicates!0 (array!47905 (_ BitVec 32) List!16297) Bool)

(assert (=> b!844527 (= lt!381092 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16294))))

(declare-fun mapNonEmpty!25361 () Bool)

(declare-fun tp!48680 () Bool)

(assert (=> mapNonEmpty!25361 (= mapRes!25361 (and tp!48680 e!471398))))

(declare-fun mapRest!25361 () (Array (_ BitVec 32) ValueCell!7481))

(declare-fun mapKey!25361 () (_ BitVec 32))

(declare-fun mapValue!25361 () ValueCell!7481)

(assert (=> mapNonEmpty!25361 (= (arr!22985 _values!688) (store mapRest!25361 mapKey!25361 mapValue!25361))))

(assert (= (and start!72772 res!573806) b!844521))

(assert (= (and b!844521 res!573807) b!844524))

(assert (= (and b!844524 res!573804) b!844525))

(assert (= (and b!844525 res!573805) b!844527))

(assert (= (and b!844526 condMapEmpty!25361) mapIsEmpty!25361))

(assert (= (and b!844526 (not condMapEmpty!25361)) mapNonEmpty!25361))

(get-info :version)

(assert (= (and mapNonEmpty!25361 ((_ is ValueCellFull!7481) mapValue!25361)) b!844523))

(assert (= (and b!844526 ((_ is ValueCellFull!7481) mapDefault!25361)) b!844522))

(assert (= start!72772 b!844526))

(declare-fun m!786119 () Bool)

(assert (=> b!844521 m!786119))

(declare-fun m!786121 () Bool)

(assert (=> mapNonEmpty!25361 m!786121))

(declare-fun m!786123 () Bool)

(assert (=> start!72772 m!786123))

(declare-fun m!786125 () Bool)

(assert (=> start!72772 m!786125))

(declare-fun m!786127 () Bool)

(assert (=> b!844525 m!786127))

(declare-fun m!786129 () Bool)

(assert (=> b!844527 m!786129))

(check-sat (not start!72772) (not b!844521) (not b!844525) (not b!844527) (not mapNonEmpty!25361) tp_is_empty!15841)
(check-sat)
