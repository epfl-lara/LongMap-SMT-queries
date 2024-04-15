; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72616 () Bool)

(assert start!72616)

(declare-fun mapIsEmpty!25127 () Bool)

(declare-fun mapRes!25127 () Bool)

(assert (=> mapIsEmpty!25127 mapRes!25127))

(declare-fun b!842883 () Bool)

(declare-fun res!572871 () Bool)

(declare-fun e!470228 () Bool)

(assert (=> b!842883 (=> (not res!572871) (not e!470228))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842883 (= res!572871 (validMask!0 mask!1196))))

(declare-fun b!842884 () Bool)

(assert (=> b!842884 (= e!470228 false)))

(declare-fun lt!380858 () Bool)

(declare-datatypes ((array!47615 0))(
  ( (array!47616 (arr!22839 (Array (_ BitVec 32) (_ BitVec 64))) (size!23281 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47615)

(declare-datatypes ((List!16245 0))(
  ( (Nil!16242) (Cons!16241 (h!17372 (_ BitVec 64)) (t!22607 List!16245)) )
))
(declare-fun arrayNoDuplicates!0 (array!47615 (_ BitVec 32) List!16245) Bool)

(assert (=> b!842884 (= lt!380858 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16242))))

(declare-fun b!842885 () Bool)

(declare-fun res!572870 () Bool)

(assert (=> b!842885 (=> (not res!572870) (not e!470228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47615 (_ BitVec 32)) Bool)

(assert (=> b!842885 (= res!572870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!572868 () Bool)

(assert (=> start!72616 (=> (not res!572868) (not e!470228))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72616 (= res!572868 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23281 _keys!868))))))

(assert (=> start!72616 e!470228))

(assert (=> start!72616 true))

(declare-fun array_inv!18240 (array!47615) Bool)

(assert (=> start!72616 (array_inv!18240 _keys!868)))

(declare-datatypes ((V!25961 0))(
  ( (V!25962 (val!7890 Int)) )
))
(declare-datatypes ((ValueCell!7403 0))(
  ( (ValueCellFull!7403 (v!10309 V!25961)) (EmptyCell!7403) )
))
(declare-datatypes ((array!47617 0))(
  ( (array!47618 (arr!22840 (Array (_ BitVec 32) ValueCell!7403)) (size!23282 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47617)

(declare-fun e!470229 () Bool)

(declare-fun array_inv!18241 (array!47617) Bool)

(assert (=> start!72616 (and (array_inv!18241 _values!688) e!470229)))

(declare-fun mapNonEmpty!25127 () Bool)

(declare-fun tp!48446 () Bool)

(declare-fun e!470227 () Bool)

(assert (=> mapNonEmpty!25127 (= mapRes!25127 (and tp!48446 e!470227))))

(declare-fun mapValue!25127 () ValueCell!7403)

(declare-fun mapKey!25127 () (_ BitVec 32))

(declare-fun mapRest!25127 () (Array (_ BitVec 32) ValueCell!7403))

(assert (=> mapNonEmpty!25127 (= (arr!22840 _values!688) (store mapRest!25127 mapKey!25127 mapValue!25127))))

(declare-fun b!842886 () Bool)

(declare-fun e!470225 () Bool)

(declare-fun tp_is_empty!15685 () Bool)

(assert (=> b!842886 (= e!470225 tp_is_empty!15685)))

(declare-fun b!842887 () Bool)

(declare-fun res!572869 () Bool)

(assert (=> b!842887 (=> (not res!572869) (not e!470228))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842887 (= res!572869 (and (= (size!23282 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23281 _keys!868) (size!23282 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842888 () Bool)

(assert (=> b!842888 (= e!470227 tp_is_empty!15685)))

(declare-fun b!842889 () Bool)

(assert (=> b!842889 (= e!470229 (and e!470225 mapRes!25127))))

(declare-fun condMapEmpty!25127 () Bool)

(declare-fun mapDefault!25127 () ValueCell!7403)

(assert (=> b!842889 (= condMapEmpty!25127 (= (arr!22840 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7403)) mapDefault!25127)))))

(assert (= (and start!72616 res!572868) b!842883))

(assert (= (and b!842883 res!572871) b!842887))

(assert (= (and b!842887 res!572869) b!842885))

(assert (= (and b!842885 res!572870) b!842884))

(assert (= (and b!842889 condMapEmpty!25127) mapIsEmpty!25127))

(assert (= (and b!842889 (not condMapEmpty!25127)) mapNonEmpty!25127))

(get-info :version)

(assert (= (and mapNonEmpty!25127 ((_ is ValueCellFull!7403) mapValue!25127)) b!842888))

(assert (= (and b!842889 ((_ is ValueCellFull!7403) mapDefault!25127)) b!842886))

(assert (= start!72616 b!842889))

(declare-fun m!785183 () Bool)

(assert (=> b!842883 m!785183))

(declare-fun m!785185 () Bool)

(assert (=> b!842884 m!785185))

(declare-fun m!785187 () Bool)

(assert (=> b!842885 m!785187))

(declare-fun m!785189 () Bool)

(assert (=> mapNonEmpty!25127 m!785189))

(declare-fun m!785191 () Bool)

(assert (=> start!72616 m!785191))

(declare-fun m!785193 () Bool)

(assert (=> start!72616 m!785193))

(check-sat (not start!72616) (not b!842885) (not b!842884) tp_is_empty!15685 (not b!842883) (not mapNonEmpty!25127))
(check-sat)
