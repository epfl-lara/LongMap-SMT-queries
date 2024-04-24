; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72790 () Bool)

(assert start!72790)

(declare-fun b!843899 () Bool)

(declare-fun e!470869 () Bool)

(declare-fun e!470867 () Bool)

(declare-fun mapRes!25109 () Bool)

(assert (=> b!843899 (= e!470869 (and e!470867 mapRes!25109))))

(declare-fun condMapEmpty!25109 () Bool)

(declare-datatypes ((V!25945 0))(
  ( (V!25946 (val!7884 Int)) )
))
(declare-datatypes ((ValueCell!7397 0))(
  ( (ValueCellFull!7397 (v!10309 V!25945)) (EmptyCell!7397) )
))
(declare-datatypes ((array!47633 0))(
  ( (array!47634 (arr!22843 (Array (_ BitVec 32) ValueCell!7397)) (size!23284 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47633)

(declare-fun mapDefault!25109 () ValueCell!7397)

(assert (=> b!843899 (= condMapEmpty!25109 (= (arr!22843 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7397)) mapDefault!25109)))))

(declare-fun b!843900 () Bool)

(declare-fun tp_is_empty!15673 () Bool)

(assert (=> b!843900 (= e!470867 tp_is_empty!15673)))

(declare-fun res!573251 () Bool)

(declare-fun e!470865 () Bool)

(assert (=> start!72790 (=> (not res!573251) (not e!470865))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47635 0))(
  ( (array!47636 (arr!22844 (Array (_ BitVec 32) (_ BitVec 64))) (size!23285 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47635)

(assert (=> start!72790 (= res!573251 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23285 _keys!868))))))

(assert (=> start!72790 e!470865))

(assert (=> start!72790 true))

(declare-fun array_inv!18222 (array!47635) Bool)

(assert (=> start!72790 (array_inv!18222 _keys!868)))

(declare-fun array_inv!18223 (array!47633) Bool)

(assert (=> start!72790 (and (array_inv!18223 _values!688) e!470869)))

(declare-fun b!843901 () Bool)

(declare-fun res!573253 () Bool)

(assert (=> b!843901 (=> (not res!573253) (not e!470865))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843901 (= res!573253 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25109 () Bool)

(declare-fun tp!48428 () Bool)

(declare-fun e!470866 () Bool)

(assert (=> mapNonEmpty!25109 (= mapRes!25109 (and tp!48428 e!470866))))

(declare-fun mapKey!25109 () (_ BitVec 32))

(declare-fun mapValue!25109 () ValueCell!7397)

(declare-fun mapRest!25109 () (Array (_ BitVec 32) ValueCell!7397))

(assert (=> mapNonEmpty!25109 (= (arr!22843 _values!688) (store mapRest!25109 mapKey!25109 mapValue!25109))))

(declare-fun b!843902 () Bool)

(declare-fun res!573252 () Bool)

(assert (=> b!843902 (=> (not res!573252) (not e!470865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47635 (_ BitVec 32)) Bool)

(assert (=> b!843902 (= res!573252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843903 () Bool)

(assert (=> b!843903 (= e!470866 tp_is_empty!15673)))

(declare-fun mapIsEmpty!25109 () Bool)

(assert (=> mapIsEmpty!25109 mapRes!25109))

(declare-fun b!843904 () Bool)

(assert (=> b!843904 (= e!470865 false)))

(declare-fun lt!381437 () Bool)

(declare-datatypes ((List!16153 0))(
  ( (Nil!16150) (Cons!16149 (h!17286 (_ BitVec 64)) (t!22516 List!16153)) )
))
(declare-fun arrayNoDuplicates!0 (array!47635 (_ BitVec 32) List!16153) Bool)

(assert (=> b!843904 (= lt!381437 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16150))))

(declare-fun b!843905 () Bool)

(declare-fun res!573250 () Bool)

(assert (=> b!843905 (=> (not res!573250) (not e!470865))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843905 (= res!573250 (and (= (size!23284 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23285 _keys!868) (size!23284 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72790 res!573251) b!843901))

(assert (= (and b!843901 res!573253) b!843905))

(assert (= (and b!843905 res!573250) b!843902))

(assert (= (and b!843902 res!573252) b!843904))

(assert (= (and b!843899 condMapEmpty!25109) mapIsEmpty!25109))

(assert (= (and b!843899 (not condMapEmpty!25109)) mapNonEmpty!25109))

(get-info :version)

(assert (= (and mapNonEmpty!25109 ((_ is ValueCellFull!7397) mapValue!25109)) b!843903))

(assert (= (and b!843899 ((_ is ValueCellFull!7397) mapDefault!25109)) b!843900))

(assert (= start!72790 b!843899))

(declare-fun m!787157 () Bool)

(assert (=> b!843902 m!787157))

(declare-fun m!787159 () Bool)

(assert (=> b!843904 m!787159))

(declare-fun m!787161 () Bool)

(assert (=> b!843901 m!787161))

(declare-fun m!787163 () Bool)

(assert (=> mapNonEmpty!25109 m!787163))

(declare-fun m!787165 () Bool)

(assert (=> start!72790 m!787165))

(declare-fun m!787167 () Bool)

(assert (=> start!72790 m!787167))

(check-sat (not b!843902) (not mapNonEmpty!25109) (not b!843904) (not b!843901) tp_is_empty!15673 (not start!72790))
(check-sat)
