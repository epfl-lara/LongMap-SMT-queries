; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72618 () Bool)

(assert start!72618)

(declare-fun b!842954 () Bool)

(declare-fun e!470257 () Bool)

(declare-fun tp_is_empty!15669 () Bool)

(assert (=> b!842954 (= e!470257 tp_is_empty!15669)))

(declare-fun b!842955 () Bool)

(declare-fun res!572884 () Bool)

(declare-fun e!470253 () Bool)

(assert (=> b!842955 (=> (not res!572884) (not e!470253))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!47602 0))(
  ( (array!47603 (arr!22832 (Array (_ BitVec 32) (_ BitVec 64))) (size!23272 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47602)

(declare-datatypes ((V!25939 0))(
  ( (V!25940 (val!7882 Int)) )
))
(declare-datatypes ((ValueCell!7395 0))(
  ( (ValueCellFull!7395 (v!10307 V!25939)) (EmptyCell!7395) )
))
(declare-datatypes ((array!47604 0))(
  ( (array!47605 (arr!22833 (Array (_ BitVec 32) ValueCell!7395)) (size!23273 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47604)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!842955 (= res!572884 (and (= (size!23273 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23272 _keys!868) (size!23273 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25103 () Bool)

(declare-fun mapRes!25103 () Bool)

(declare-fun tp!48421 () Bool)

(assert (=> mapNonEmpty!25103 (= mapRes!25103 (and tp!48421 e!470257))))

(declare-fun mapValue!25103 () ValueCell!7395)

(declare-fun mapRest!25103 () (Array (_ BitVec 32) ValueCell!7395))

(declare-fun mapKey!25103 () (_ BitVec 32))

(assert (=> mapNonEmpty!25103 (= (arr!22833 _values!688) (store mapRest!25103 mapKey!25103 mapValue!25103))))

(declare-fun res!572883 () Bool)

(assert (=> start!72618 (=> (not res!572883) (not e!470253))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72618 (= res!572883 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23272 _keys!868))))))

(assert (=> start!72618 e!470253))

(assert (=> start!72618 true))

(declare-fun array_inv!18166 (array!47602) Bool)

(assert (=> start!72618 (array_inv!18166 _keys!868)))

(declare-fun e!470255 () Bool)

(declare-fun array_inv!18167 (array!47604) Bool)

(assert (=> start!72618 (and (array_inv!18167 _values!688) e!470255)))

(declare-fun b!842956 () Bool)

(declare-fun res!572882 () Bool)

(assert (=> b!842956 (=> (not res!572882) (not e!470253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47602 (_ BitVec 32)) Bool)

(assert (=> b!842956 (= res!572882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842957 () Bool)

(declare-fun e!470256 () Bool)

(assert (=> b!842957 (= e!470255 (and e!470256 mapRes!25103))))

(declare-fun condMapEmpty!25103 () Bool)

(declare-fun mapDefault!25103 () ValueCell!7395)

(assert (=> b!842957 (= condMapEmpty!25103 (= (arr!22833 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7395)) mapDefault!25103)))))

(declare-fun b!842958 () Bool)

(assert (=> b!842958 (= e!470256 tp_is_empty!15669)))

(declare-fun b!842959 () Bool)

(assert (=> b!842959 (= e!470253 false)))

(declare-fun lt!381070 () Bool)

(declare-datatypes ((List!16226 0))(
  ( (Nil!16223) (Cons!16222 (h!17353 (_ BitVec 64)) (t!22597 List!16226)) )
))
(declare-fun arrayNoDuplicates!0 (array!47602 (_ BitVec 32) List!16226) Bool)

(assert (=> b!842959 (= lt!381070 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16223))))

(declare-fun mapIsEmpty!25103 () Bool)

(assert (=> mapIsEmpty!25103 mapRes!25103))

(declare-fun b!842960 () Bool)

(declare-fun res!572885 () Bool)

(assert (=> b!842960 (=> (not res!572885) (not e!470253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842960 (= res!572885 (validMask!0 mask!1196))))

(assert (= (and start!72618 res!572883) b!842960))

(assert (= (and b!842960 res!572885) b!842955))

(assert (= (and b!842955 res!572884) b!842956))

(assert (= (and b!842956 res!572882) b!842959))

(assert (= (and b!842957 condMapEmpty!25103) mapIsEmpty!25103))

(assert (= (and b!842957 (not condMapEmpty!25103)) mapNonEmpty!25103))

(get-info :version)

(assert (= (and mapNonEmpty!25103 ((_ is ValueCellFull!7395) mapValue!25103)) b!842954))

(assert (= (and b!842957 ((_ is ValueCellFull!7395) mapDefault!25103)) b!842958))

(assert (= start!72618 b!842957))

(declare-fun m!785841 () Bool)

(assert (=> b!842959 m!785841))

(declare-fun m!785843 () Bool)

(assert (=> b!842960 m!785843))

(declare-fun m!785845 () Bool)

(assert (=> start!72618 m!785845))

(declare-fun m!785847 () Bool)

(assert (=> start!72618 m!785847))

(declare-fun m!785849 () Bool)

(assert (=> mapNonEmpty!25103 m!785849))

(declare-fun m!785851 () Bool)

(assert (=> b!842956 m!785851))

(check-sat (not b!842960) (not b!842959) tp_is_empty!15669 (not start!72618) (not mapNonEmpty!25103) (not b!842956))
(check-sat)
