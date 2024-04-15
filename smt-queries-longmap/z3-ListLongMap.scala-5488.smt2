; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72694 () Bool)

(assert start!72694)

(declare-fun b!843702 () Bool)

(declare-fun e!470812 () Bool)

(declare-fun tp_is_empty!15763 () Bool)

(assert (=> b!843702 (= e!470812 tp_is_empty!15763)))

(declare-fun b!843703 () Bool)

(declare-fun e!470810 () Bool)

(declare-fun e!470811 () Bool)

(declare-fun mapRes!25244 () Bool)

(assert (=> b!843703 (= e!470810 (and e!470811 mapRes!25244))))

(declare-fun condMapEmpty!25244 () Bool)

(declare-datatypes ((V!26065 0))(
  ( (V!26066 (val!7929 Int)) )
))
(declare-datatypes ((ValueCell!7442 0))(
  ( (ValueCellFull!7442 (v!10348 V!26065)) (EmptyCell!7442) )
))
(declare-datatypes ((array!47765 0))(
  ( (array!47766 (arr!22914 (Array (_ BitVec 32) ValueCell!7442)) (size!23356 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47765)

(declare-fun mapDefault!25244 () ValueCell!7442)

(assert (=> b!843703 (= condMapEmpty!25244 (= (arr!22914 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7442)) mapDefault!25244)))))

(declare-fun mapIsEmpty!25244 () Bool)

(assert (=> mapIsEmpty!25244 mapRes!25244))

(declare-fun res!573338 () Bool)

(declare-fun e!470813 () Bool)

(assert (=> start!72694 (=> (not res!573338) (not e!470813))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47767 0))(
  ( (array!47768 (arr!22915 (Array (_ BitVec 32) (_ BitVec 64))) (size!23357 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47767)

(assert (=> start!72694 (= res!573338 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23357 _keys!868))))))

(assert (=> start!72694 e!470813))

(assert (=> start!72694 true))

(declare-fun array_inv!18298 (array!47767) Bool)

(assert (=> start!72694 (array_inv!18298 _keys!868)))

(declare-fun array_inv!18299 (array!47765) Bool)

(assert (=> start!72694 (and (array_inv!18299 _values!688) e!470810)))

(declare-fun mapNonEmpty!25244 () Bool)

(declare-fun tp!48563 () Bool)

(assert (=> mapNonEmpty!25244 (= mapRes!25244 (and tp!48563 e!470812))))

(declare-fun mapValue!25244 () ValueCell!7442)

(declare-fun mapKey!25244 () (_ BitVec 32))

(declare-fun mapRest!25244 () (Array (_ BitVec 32) ValueCell!7442))

(assert (=> mapNonEmpty!25244 (= (arr!22914 _values!688) (store mapRest!25244 mapKey!25244 mapValue!25244))))

(declare-fun b!843704 () Bool)

(declare-fun res!573336 () Bool)

(assert (=> b!843704 (=> (not res!573336) (not e!470813))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47767 (_ BitVec 32)) Bool)

(assert (=> b!843704 (= res!573336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843705 () Bool)

(assert (=> b!843705 (= e!470811 tp_is_empty!15763)))

(declare-fun b!843706 () Bool)

(declare-fun res!573337 () Bool)

(assert (=> b!843706 (=> (not res!573337) (not e!470813))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843706 (= res!573337 (and (= (size!23356 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23357 _keys!868) (size!23356 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843707 () Bool)

(assert (=> b!843707 (= e!470813 false)))

(declare-fun lt!380975 () Bool)

(declare-datatypes ((List!16273 0))(
  ( (Nil!16270) (Cons!16269 (h!17400 (_ BitVec 64)) (t!22635 List!16273)) )
))
(declare-fun arrayNoDuplicates!0 (array!47767 (_ BitVec 32) List!16273) Bool)

(assert (=> b!843707 (= lt!380975 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16270))))

(declare-fun b!843708 () Bool)

(declare-fun res!573339 () Bool)

(assert (=> b!843708 (=> (not res!573339) (not e!470813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843708 (= res!573339 (validMask!0 mask!1196))))

(assert (= (and start!72694 res!573338) b!843708))

(assert (= (and b!843708 res!573339) b!843706))

(assert (= (and b!843706 res!573337) b!843704))

(assert (= (and b!843704 res!573336) b!843707))

(assert (= (and b!843703 condMapEmpty!25244) mapIsEmpty!25244))

(assert (= (and b!843703 (not condMapEmpty!25244)) mapNonEmpty!25244))

(get-info :version)

(assert (= (and mapNonEmpty!25244 ((_ is ValueCellFull!7442) mapValue!25244)) b!843702))

(assert (= (and b!843703 ((_ is ValueCellFull!7442) mapDefault!25244)) b!843705))

(assert (= start!72694 b!843703))

(declare-fun m!785651 () Bool)

(assert (=> start!72694 m!785651))

(declare-fun m!785653 () Bool)

(assert (=> start!72694 m!785653))

(declare-fun m!785655 () Bool)

(assert (=> b!843707 m!785655))

(declare-fun m!785657 () Bool)

(assert (=> mapNonEmpty!25244 m!785657))

(declare-fun m!785659 () Bool)

(assert (=> b!843708 m!785659))

(declare-fun m!785661 () Bool)

(assert (=> b!843704 m!785661))

(check-sat (not b!843704) (not b!843707) (not start!72694) (not mapNonEmpty!25244) (not b!843708) tp_is_empty!15763)
(check-sat)
