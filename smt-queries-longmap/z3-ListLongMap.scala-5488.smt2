; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72880 () Bool)

(assert start!72880)

(declare-fun b!844844 () Bool)

(declare-fun res!573791 () Bool)

(declare-fun e!471543 () Bool)

(assert (=> b!844844 (=> (not res!573791) (not e!471543))))

(declare-datatypes ((array!47803 0))(
  ( (array!47804 (arr!22928 (Array (_ BitVec 32) (_ BitVec 64))) (size!23369 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47803)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47803 (_ BitVec 32)) Bool)

(assert (=> b!844844 (= res!573791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573790 () Bool)

(assert (=> start!72880 (=> (not res!573790) (not e!471543))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72880 (= res!573790 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23369 _keys!868))))))

(assert (=> start!72880 e!471543))

(assert (=> start!72880 true))

(declare-fun array_inv!18284 (array!47803) Bool)

(assert (=> start!72880 (array_inv!18284 _keys!868)))

(declare-datatypes ((V!26065 0))(
  ( (V!26066 (val!7929 Int)) )
))
(declare-datatypes ((ValueCell!7442 0))(
  ( (ValueCellFull!7442 (v!10354 V!26065)) (EmptyCell!7442) )
))
(declare-datatypes ((array!47805 0))(
  ( (array!47806 (arr!22929 (Array (_ BitVec 32) ValueCell!7442)) (size!23370 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47805)

(declare-fun e!471542 () Bool)

(declare-fun array_inv!18285 (array!47805) Bool)

(assert (=> start!72880 (and (array_inv!18285 _values!688) e!471542)))

(declare-fun b!844845 () Bool)

(declare-fun res!573793 () Bool)

(assert (=> b!844845 (=> (not res!573793) (not e!471543))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844845 (= res!573793 (and (= (size!23370 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23369 _keys!868) (size!23370 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844846 () Bool)

(declare-fun res!573792 () Bool)

(assert (=> b!844846 (=> (not res!573792) (not e!471543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844846 (= res!573792 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25244 () Bool)

(declare-fun mapRes!25244 () Bool)

(assert (=> mapIsEmpty!25244 mapRes!25244))

(declare-fun b!844847 () Bool)

(declare-fun e!471541 () Bool)

(declare-fun tp_is_empty!15763 () Bool)

(assert (=> b!844847 (= e!471541 tp_is_empty!15763)))

(declare-fun mapNonEmpty!25244 () Bool)

(declare-fun tp!48563 () Bool)

(assert (=> mapNonEmpty!25244 (= mapRes!25244 (and tp!48563 e!471541))))

(declare-fun mapKey!25244 () (_ BitVec 32))

(declare-fun mapRest!25244 () (Array (_ BitVec 32) ValueCell!7442))

(declare-fun mapValue!25244 () ValueCell!7442)

(assert (=> mapNonEmpty!25244 (= (arr!22929 _values!688) (store mapRest!25244 mapKey!25244 mapValue!25244))))

(declare-fun b!844848 () Bool)

(declare-fun e!471544 () Bool)

(assert (=> b!844848 (= e!471542 (and e!471544 mapRes!25244))))

(declare-fun condMapEmpty!25244 () Bool)

(declare-fun mapDefault!25244 () ValueCell!7442)

(assert (=> b!844848 (= condMapEmpty!25244 (= (arr!22929 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7442)) mapDefault!25244)))))

(declare-fun b!844849 () Bool)

(assert (=> b!844849 (= e!471544 tp_is_empty!15763)))

(declare-fun b!844850 () Bool)

(assert (=> b!844850 (= e!471543 false)))

(declare-fun lt!381572 () Bool)

(declare-datatypes ((List!16184 0))(
  ( (Nil!16181) (Cons!16180 (h!17317 (_ BitVec 64)) (t!22547 List!16184)) )
))
(declare-fun arrayNoDuplicates!0 (array!47803 (_ BitVec 32) List!16184) Bool)

(assert (=> b!844850 (= lt!381572 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16181))))

(assert (= (and start!72880 res!573790) b!844846))

(assert (= (and b!844846 res!573792) b!844845))

(assert (= (and b!844845 res!573793) b!844844))

(assert (= (and b!844844 res!573791) b!844850))

(assert (= (and b!844848 condMapEmpty!25244) mapIsEmpty!25244))

(assert (= (and b!844848 (not condMapEmpty!25244)) mapNonEmpty!25244))

(get-info :version)

(assert (= (and mapNonEmpty!25244 ((_ is ValueCellFull!7442) mapValue!25244)) b!844847))

(assert (= (and b!844848 ((_ is ValueCellFull!7442) mapDefault!25244)) b!844849))

(assert (= start!72880 b!844848))

(declare-fun m!787697 () Bool)

(assert (=> start!72880 m!787697))

(declare-fun m!787699 () Bool)

(assert (=> start!72880 m!787699))

(declare-fun m!787701 () Bool)

(assert (=> mapNonEmpty!25244 m!787701))

(declare-fun m!787703 () Bool)

(assert (=> b!844844 m!787703))

(declare-fun m!787705 () Bool)

(assert (=> b!844846 m!787705))

(declare-fun m!787707 () Bool)

(assert (=> b!844850 m!787707))

(check-sat (not b!844850) (not b!844846) (not b!844844) tp_is_empty!15763 (not mapNonEmpty!25244) (not start!72880))
(check-sat)
