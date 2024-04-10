; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72672 () Bool)

(assert start!72672)

(declare-fun b!843521 () Bool)

(declare-fun res!573208 () Bool)

(declare-fun e!470661 () Bool)

(assert (=> b!843521 (=> (not res!573208) (not e!470661))))

(declare-datatypes ((array!47694 0))(
  ( (array!47695 (arr!22878 (Array (_ BitVec 32) (_ BitVec 64))) (size!23318 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47694)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47694 (_ BitVec 32)) Bool)

(assert (=> b!843521 (= res!573208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843522 () Bool)

(declare-fun res!573209 () Bool)

(assert (=> b!843522 (=> (not res!573209) (not e!470661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843522 (= res!573209 (validMask!0 mask!1196))))

(declare-fun b!843523 () Bool)

(declare-fun e!470660 () Bool)

(declare-fun e!470662 () Bool)

(declare-fun mapRes!25184 () Bool)

(assert (=> b!843523 (= e!470660 (and e!470662 mapRes!25184))))

(declare-fun condMapEmpty!25184 () Bool)

(declare-datatypes ((V!26011 0))(
  ( (V!26012 (val!7909 Int)) )
))
(declare-datatypes ((ValueCell!7422 0))(
  ( (ValueCellFull!7422 (v!10334 V!26011)) (EmptyCell!7422) )
))
(declare-datatypes ((array!47696 0))(
  ( (array!47697 (arr!22879 (Array (_ BitVec 32) ValueCell!7422)) (size!23319 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47696)

(declare-fun mapDefault!25184 () ValueCell!7422)

(assert (=> b!843523 (= condMapEmpty!25184 (= (arr!22879 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7422)) mapDefault!25184)))))

(declare-fun b!843524 () Bool)

(declare-fun tp_is_empty!15723 () Bool)

(assert (=> b!843524 (= e!470662 tp_is_empty!15723)))

(declare-fun b!843525 () Bool)

(declare-fun res!573206 () Bool)

(assert (=> b!843525 (=> (not res!573206) (not e!470661))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843525 (= res!573206 (and (= (size!23319 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23318 _keys!868) (size!23319 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25184 () Bool)

(declare-fun tp!48502 () Bool)

(declare-fun e!470659 () Bool)

(assert (=> mapNonEmpty!25184 (= mapRes!25184 (and tp!48502 e!470659))))

(declare-fun mapRest!25184 () (Array (_ BitVec 32) ValueCell!7422))

(declare-fun mapValue!25184 () ValueCell!7422)

(declare-fun mapKey!25184 () (_ BitVec 32))

(assert (=> mapNonEmpty!25184 (= (arr!22879 _values!688) (store mapRest!25184 mapKey!25184 mapValue!25184))))

(declare-fun b!843526 () Bool)

(assert (=> b!843526 (= e!470659 tp_is_empty!15723)))

(declare-fun res!573207 () Bool)

(assert (=> start!72672 (=> (not res!573207) (not e!470661))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72672 (= res!573207 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23318 _keys!868))))))

(assert (=> start!72672 e!470661))

(assert (=> start!72672 true))

(declare-fun array_inv!18194 (array!47694) Bool)

(assert (=> start!72672 (array_inv!18194 _keys!868)))

(declare-fun array_inv!18195 (array!47696) Bool)

(assert (=> start!72672 (and (array_inv!18195 _values!688) e!470660)))

(declare-fun mapIsEmpty!25184 () Bool)

(assert (=> mapIsEmpty!25184 mapRes!25184))

(declare-fun b!843527 () Bool)

(assert (=> b!843527 (= e!470661 false)))

(declare-fun lt!381151 () Bool)

(declare-datatypes ((List!16240 0))(
  ( (Nil!16237) (Cons!16236 (h!17367 (_ BitVec 64)) (t!22611 List!16240)) )
))
(declare-fun arrayNoDuplicates!0 (array!47694 (_ BitVec 32) List!16240) Bool)

(assert (=> b!843527 (= lt!381151 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16237))))

(assert (= (and start!72672 res!573207) b!843522))

(assert (= (and b!843522 res!573209) b!843525))

(assert (= (and b!843525 res!573206) b!843521))

(assert (= (and b!843521 res!573208) b!843527))

(assert (= (and b!843523 condMapEmpty!25184) mapIsEmpty!25184))

(assert (= (and b!843523 (not condMapEmpty!25184)) mapNonEmpty!25184))

(get-info :version)

(assert (= (and mapNonEmpty!25184 ((_ is ValueCellFull!7422) mapValue!25184)) b!843526))

(assert (= (and b!843523 ((_ is ValueCellFull!7422) mapDefault!25184)) b!843524))

(assert (= start!72672 b!843523))

(declare-fun m!786165 () Bool)

(assert (=> b!843522 m!786165))

(declare-fun m!786167 () Bool)

(assert (=> b!843527 m!786167))

(declare-fun m!786169 () Bool)

(assert (=> b!843521 m!786169))

(declare-fun m!786171 () Bool)

(assert (=> mapNonEmpty!25184 m!786171))

(declare-fun m!786173 () Bool)

(assert (=> start!72672 m!786173))

(declare-fun m!786175 () Bool)

(assert (=> start!72672 m!786175))

(check-sat tp_is_empty!15723 (not mapNonEmpty!25184) (not b!843521) (not b!843522) (not start!72672) (not b!843527))
(check-sat)
