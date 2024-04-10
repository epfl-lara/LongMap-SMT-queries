; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72708 () Bool)

(assert start!72708)

(declare-fun mapNonEmpty!25238 () Bool)

(declare-fun mapRes!25238 () Bool)

(declare-fun tp!48556 () Bool)

(declare-fun e!470932 () Bool)

(assert (=> mapNonEmpty!25238 (= mapRes!25238 (and tp!48556 e!470932))))

(declare-datatypes ((V!26059 0))(
  ( (V!26060 (val!7927 Int)) )
))
(declare-datatypes ((ValueCell!7440 0))(
  ( (ValueCellFull!7440 (v!10352 V!26059)) (EmptyCell!7440) )
))
(declare-fun mapValue!25238 () ValueCell!7440)

(declare-fun mapRest!25238 () (Array (_ BitVec 32) ValueCell!7440))

(declare-fun mapKey!25238 () (_ BitVec 32))

(declare-datatypes ((array!47762 0))(
  ( (array!47763 (arr!22912 (Array (_ BitVec 32) ValueCell!7440)) (size!23352 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47762)

(assert (=> mapNonEmpty!25238 (= (arr!22912 _values!688) (store mapRest!25238 mapKey!25238 mapValue!25238))))

(declare-fun res!573425 () Bool)

(declare-fun e!470931 () Bool)

(assert (=> start!72708 (=> (not res!573425) (not e!470931))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47764 0))(
  ( (array!47765 (arr!22913 (Array (_ BitVec 32) (_ BitVec 64))) (size!23353 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47764)

(assert (=> start!72708 (= res!573425 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23353 _keys!868))))))

(assert (=> start!72708 e!470931))

(assert (=> start!72708 true))

(declare-fun array_inv!18220 (array!47764) Bool)

(assert (=> start!72708 (array_inv!18220 _keys!868)))

(declare-fun e!470929 () Bool)

(declare-fun array_inv!18221 (array!47762) Bool)

(assert (=> start!72708 (and (array_inv!18221 _values!688) e!470929)))

(declare-fun b!843899 () Bool)

(declare-fun res!573423 () Bool)

(assert (=> b!843899 (=> (not res!573423) (not e!470931))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!843899 (= res!573423 (and (= (size!23352 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23353 _keys!868) (size!23352 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843900 () Bool)

(declare-fun res!573424 () Bool)

(assert (=> b!843900 (=> (not res!573424) (not e!470931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843900 (= res!573424 (validMask!0 mask!1196))))

(declare-fun b!843901 () Bool)

(declare-fun tp_is_empty!15759 () Bool)

(assert (=> b!843901 (= e!470932 tp_is_empty!15759)))

(declare-fun mapIsEmpty!25238 () Bool)

(assert (=> mapIsEmpty!25238 mapRes!25238))

(declare-fun b!843902 () Bool)

(declare-fun e!470930 () Bool)

(assert (=> b!843902 (= e!470930 tp_is_empty!15759)))

(declare-fun b!843903 () Bool)

(assert (=> b!843903 (= e!470929 (and e!470930 mapRes!25238))))

(declare-fun condMapEmpty!25238 () Bool)

(declare-fun mapDefault!25238 () ValueCell!7440)

(assert (=> b!843903 (= condMapEmpty!25238 (= (arr!22912 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7440)) mapDefault!25238)))))

(declare-fun b!843904 () Bool)

(declare-fun res!573422 () Bool)

(assert (=> b!843904 (=> (not res!573422) (not e!470931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47764 (_ BitVec 32)) Bool)

(assert (=> b!843904 (= res!573422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843905 () Bool)

(assert (=> b!843905 (= e!470931 false)))

(declare-fun lt!381205 () Bool)

(declare-datatypes ((List!16254 0))(
  ( (Nil!16251) (Cons!16250 (h!17381 (_ BitVec 64)) (t!22625 List!16254)) )
))
(declare-fun arrayNoDuplicates!0 (array!47764 (_ BitVec 32) List!16254) Bool)

(assert (=> b!843905 (= lt!381205 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16251))))

(assert (= (and start!72708 res!573425) b!843900))

(assert (= (and b!843900 res!573424) b!843899))

(assert (= (and b!843899 res!573423) b!843904))

(assert (= (and b!843904 res!573422) b!843905))

(assert (= (and b!843903 condMapEmpty!25238) mapIsEmpty!25238))

(assert (= (and b!843903 (not condMapEmpty!25238)) mapNonEmpty!25238))

(get-info :version)

(assert (= (and mapNonEmpty!25238 ((_ is ValueCellFull!7440) mapValue!25238)) b!843901))

(assert (= (and b!843903 ((_ is ValueCellFull!7440) mapDefault!25238)) b!843902))

(assert (= start!72708 b!843903))

(declare-fun m!786381 () Bool)

(assert (=> b!843905 m!786381))

(declare-fun m!786383 () Bool)

(assert (=> b!843904 m!786383))

(declare-fun m!786385 () Bool)

(assert (=> mapNonEmpty!25238 m!786385))

(declare-fun m!786387 () Bool)

(assert (=> b!843900 m!786387))

(declare-fun m!786389 () Bool)

(assert (=> start!72708 m!786389))

(declare-fun m!786391 () Bool)

(assert (=> start!72708 m!786391))

(check-sat (not b!843900) (not mapNonEmpty!25238) (not b!843905) (not b!843904) (not start!72708) tp_is_empty!15759)
(check-sat)
