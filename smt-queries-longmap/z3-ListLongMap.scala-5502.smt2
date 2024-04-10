; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72798 () Bool)

(assert start!72798)

(declare-fun res!573963 () Bool)

(declare-fun e!471603 () Bool)

(assert (=> start!72798 (=> (not res!573963) (not e!471603))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47924 0))(
  ( (array!47925 (arr!22993 (Array (_ BitVec 32) (_ BitVec 64))) (size!23433 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47924)

(assert (=> start!72798 (= res!573963 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23433 _keys!868))))))

(assert (=> start!72798 e!471603))

(assert (=> start!72798 true))

(declare-fun array_inv!18280 (array!47924) Bool)

(assert (=> start!72798 (array_inv!18280 _keys!868)))

(declare-datatypes ((V!26179 0))(
  ( (V!26180 (val!7972 Int)) )
))
(declare-datatypes ((ValueCell!7485 0))(
  ( (ValueCellFull!7485 (v!10397 V!26179)) (EmptyCell!7485) )
))
(declare-datatypes ((array!47926 0))(
  ( (array!47927 (arr!22994 (Array (_ BitVec 32) ValueCell!7485)) (size!23434 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47926)

(declare-fun e!471607 () Bool)

(declare-fun array_inv!18281 (array!47926) Bool)

(assert (=> start!72798 (and (array_inv!18281 _values!688) e!471607)))

(declare-fun mapNonEmpty!25373 () Bool)

(declare-fun mapRes!25373 () Bool)

(declare-fun tp!48691 () Bool)

(declare-fun e!471605 () Bool)

(assert (=> mapNonEmpty!25373 (= mapRes!25373 (and tp!48691 e!471605))))

(declare-fun mapKey!25373 () (_ BitVec 32))

(declare-fun mapValue!25373 () ValueCell!7485)

(declare-fun mapRest!25373 () (Array (_ BitVec 32) ValueCell!7485))

(assert (=> mapNonEmpty!25373 (= (arr!22994 _values!688) (store mapRest!25373 mapKey!25373 mapValue!25373))))

(declare-fun b!844844 () Bool)

(declare-fun res!573962 () Bool)

(assert (=> b!844844 (=> (not res!573962) (not e!471603))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47924 (_ BitVec 32)) Bool)

(assert (=> b!844844 (= res!573962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844845 () Bool)

(assert (=> b!844845 (= e!471603 false)))

(declare-fun lt!381340 () Bool)

(declare-datatypes ((List!16286 0))(
  ( (Nil!16283) (Cons!16282 (h!17413 (_ BitVec 64)) (t!22657 List!16286)) )
))
(declare-fun arrayNoDuplicates!0 (array!47924 (_ BitVec 32) List!16286) Bool)

(assert (=> b!844845 (= lt!381340 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16283))))

(declare-fun b!844846 () Bool)

(declare-fun e!471604 () Bool)

(assert (=> b!844846 (= e!471607 (and e!471604 mapRes!25373))))

(declare-fun condMapEmpty!25373 () Bool)

(declare-fun mapDefault!25373 () ValueCell!7485)

(assert (=> b!844846 (= condMapEmpty!25373 (= (arr!22994 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7485)) mapDefault!25373)))))

(declare-fun b!844847 () Bool)

(declare-fun tp_is_empty!15849 () Bool)

(assert (=> b!844847 (= e!471605 tp_is_empty!15849)))

(declare-fun mapIsEmpty!25373 () Bool)

(assert (=> mapIsEmpty!25373 mapRes!25373))

(declare-fun b!844848 () Bool)

(assert (=> b!844848 (= e!471604 tp_is_empty!15849)))

(declare-fun b!844849 () Bool)

(declare-fun res!573965 () Bool)

(assert (=> b!844849 (=> (not res!573965) (not e!471603))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844849 (= res!573965 (and (= (size!23434 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23433 _keys!868) (size!23434 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844850 () Bool)

(declare-fun res!573964 () Bool)

(assert (=> b!844850 (=> (not res!573964) (not e!471603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844850 (= res!573964 (validMask!0 mask!1196))))

(assert (= (and start!72798 res!573963) b!844850))

(assert (= (and b!844850 res!573964) b!844849))

(assert (= (and b!844849 res!573965) b!844844))

(assert (= (and b!844844 res!573962) b!844845))

(assert (= (and b!844846 condMapEmpty!25373) mapIsEmpty!25373))

(assert (= (and b!844846 (not condMapEmpty!25373)) mapNonEmpty!25373))

(get-info :version)

(assert (= (and mapNonEmpty!25373 ((_ is ValueCellFull!7485) mapValue!25373)) b!844847))

(assert (= (and b!844846 ((_ is ValueCellFull!7485) mapDefault!25373)) b!844848))

(assert (= start!72798 b!844846))

(declare-fun m!786921 () Bool)

(assert (=> b!844850 m!786921))

(declare-fun m!786923 () Bool)

(assert (=> start!72798 m!786923))

(declare-fun m!786925 () Bool)

(assert (=> start!72798 m!786925))

(declare-fun m!786927 () Bool)

(assert (=> b!844845 m!786927))

(declare-fun m!786929 () Bool)

(assert (=> b!844844 m!786929))

(declare-fun m!786931 () Bool)

(assert (=> mapNonEmpty!25373 m!786931))

(check-sat tp_is_empty!15849 (not b!844844) (not b!844850) (not b!844845) (not mapNonEmpty!25373) (not start!72798))
(check-sat)
