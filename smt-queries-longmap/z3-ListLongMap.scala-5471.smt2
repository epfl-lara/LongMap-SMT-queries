; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72778 () Bool)

(assert start!72778)

(declare-fun b!843773 () Bool)

(declare-fun e!470779 () Bool)

(declare-fun tp_is_empty!15661 () Bool)

(assert (=> b!843773 (= e!470779 tp_is_empty!15661)))

(declare-fun res!573179 () Bool)

(declare-fun e!470776 () Bool)

(assert (=> start!72778 (=> (not res!573179) (not e!470776))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47609 0))(
  ( (array!47610 (arr!22831 (Array (_ BitVec 32) (_ BitVec 64))) (size!23272 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47609)

(assert (=> start!72778 (= res!573179 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23272 _keys!868))))))

(assert (=> start!72778 e!470776))

(assert (=> start!72778 true))

(declare-fun array_inv!18212 (array!47609) Bool)

(assert (=> start!72778 (array_inv!18212 _keys!868)))

(declare-datatypes ((V!25929 0))(
  ( (V!25930 (val!7878 Int)) )
))
(declare-datatypes ((ValueCell!7391 0))(
  ( (ValueCellFull!7391 (v!10303 V!25929)) (EmptyCell!7391) )
))
(declare-datatypes ((array!47611 0))(
  ( (array!47612 (arr!22832 (Array (_ BitVec 32) ValueCell!7391)) (size!23273 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47611)

(declare-fun e!470777 () Bool)

(declare-fun array_inv!18213 (array!47611) Bool)

(assert (=> start!72778 (and (array_inv!18213 _values!688) e!470777)))

(declare-fun b!843774 () Bool)

(declare-fun res!573181 () Bool)

(assert (=> b!843774 (=> (not res!573181) (not e!470776))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47609 (_ BitVec 32)) Bool)

(assert (=> b!843774 (= res!573181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843775 () Bool)

(declare-fun res!573178 () Bool)

(assert (=> b!843775 (=> (not res!573178) (not e!470776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843775 (= res!573178 (validMask!0 mask!1196))))

(declare-fun b!843776 () Bool)

(declare-fun res!573180 () Bool)

(assert (=> b!843776 (=> (not res!573180) (not e!470776))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843776 (= res!573180 (and (= (size!23273 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23272 _keys!868) (size!23273 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843777 () Bool)

(assert (=> b!843777 (= e!470776 false)))

(declare-fun lt!381419 () Bool)

(declare-datatypes ((List!16148 0))(
  ( (Nil!16145) (Cons!16144 (h!17281 (_ BitVec 64)) (t!22511 List!16148)) )
))
(declare-fun arrayNoDuplicates!0 (array!47609 (_ BitVec 32) List!16148) Bool)

(assert (=> b!843777 (= lt!381419 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16145))))

(declare-fun b!843778 () Bool)

(declare-fun e!470778 () Bool)

(assert (=> b!843778 (= e!470778 tp_is_empty!15661)))

(declare-fun mapIsEmpty!25091 () Bool)

(declare-fun mapRes!25091 () Bool)

(assert (=> mapIsEmpty!25091 mapRes!25091))

(declare-fun b!843779 () Bool)

(assert (=> b!843779 (= e!470777 (and e!470779 mapRes!25091))))

(declare-fun condMapEmpty!25091 () Bool)

(declare-fun mapDefault!25091 () ValueCell!7391)

(assert (=> b!843779 (= condMapEmpty!25091 (= (arr!22832 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7391)) mapDefault!25091)))))

(declare-fun mapNonEmpty!25091 () Bool)

(declare-fun tp!48410 () Bool)

(assert (=> mapNonEmpty!25091 (= mapRes!25091 (and tp!48410 e!470778))))

(declare-fun mapValue!25091 () ValueCell!7391)

(declare-fun mapKey!25091 () (_ BitVec 32))

(declare-fun mapRest!25091 () (Array (_ BitVec 32) ValueCell!7391))

(assert (=> mapNonEmpty!25091 (= (arr!22832 _values!688) (store mapRest!25091 mapKey!25091 mapValue!25091))))

(assert (= (and start!72778 res!573179) b!843775))

(assert (= (and b!843775 res!573178) b!843776))

(assert (= (and b!843776 res!573180) b!843774))

(assert (= (and b!843774 res!573181) b!843777))

(assert (= (and b!843779 condMapEmpty!25091) mapIsEmpty!25091))

(assert (= (and b!843779 (not condMapEmpty!25091)) mapNonEmpty!25091))

(get-info :version)

(assert (= (and mapNonEmpty!25091 ((_ is ValueCellFull!7391) mapValue!25091)) b!843778))

(assert (= (and b!843779 ((_ is ValueCellFull!7391) mapDefault!25091)) b!843773))

(assert (= start!72778 b!843779))

(declare-fun m!787085 () Bool)

(assert (=> mapNonEmpty!25091 m!787085))

(declare-fun m!787087 () Bool)

(assert (=> start!72778 m!787087))

(declare-fun m!787089 () Bool)

(assert (=> start!72778 m!787089))

(declare-fun m!787091 () Bool)

(assert (=> b!843774 m!787091))

(declare-fun m!787093 () Bool)

(assert (=> b!843775 m!787093))

(declare-fun m!787095 () Bool)

(assert (=> b!843777 m!787095))

(check-sat tp_is_empty!15661 (not mapNonEmpty!25091) (not start!72778) (not b!843774) (not b!843775) (not b!843777))
(check-sat)
