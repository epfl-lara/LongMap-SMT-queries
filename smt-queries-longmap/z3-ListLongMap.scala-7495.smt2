; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95178 () Bool)

(assert start!95178)

(declare-fun b_free!22147 () Bool)

(declare-fun b_next!22147 () Bool)

(assert (=> start!95178 (= b_free!22147 (not b_next!22147))))

(declare-fun tp!77905 () Bool)

(declare-fun b_and!35011 () Bool)

(assert (=> start!95178 (= tp!77905 b_and!35011)))

(declare-fun b!1074816 () Bool)

(declare-fun res!716492 () Bool)

(declare-fun e!614149 () Bool)

(assert (=> b!1074816 (=> (not res!716492) (not e!614149))))

(declare-datatypes ((array!68919 0))(
  ( (array!68920 (arr!33147 (Array (_ BitVec 32) (_ BitVec 64))) (size!33684 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68919)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68919 (_ BitVec 32)) Bool)

(assert (=> b!1074816 (= res!716492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074817 () Bool)

(assert (=> b!1074817 (= e!614149 false)))

(declare-datatypes ((V!39745 0))(
  ( (V!39746 (val!13029 Int)) )
))
(declare-datatypes ((ValueCell!12275 0))(
  ( (ValueCellFull!12275 (v!15643 V!39745)) (EmptyCell!12275) )
))
(declare-datatypes ((array!68921 0))(
  ( (array!68922 (arr!33148 (Array (_ BitVec 32) ValueCell!12275)) (size!33685 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68921)

(declare-datatypes ((tuple2!16576 0))(
  ( (tuple2!16577 (_1!8299 (_ BitVec 64)) (_2!8299 V!39745)) )
))
(declare-datatypes ((List!23133 0))(
  ( (Nil!23130) (Cons!23129 (h!24347 tuple2!16576) (t!32462 List!23133)) )
))
(declare-datatypes ((ListLongMap!14553 0))(
  ( (ListLongMap!14554 (toList!7292 List!23133)) )
))
(declare-fun lt!476577 () ListLongMap!14553)

(declare-fun minValue!907 () V!39745)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39745)

(declare-fun getCurrentListMapNoExtraKeys!3890 (array!68919 array!68921 (_ BitVec 32) (_ BitVec 32) V!39745 V!39745 (_ BitVec 32) Int) ListLongMap!14553)

(assert (=> b!1074817 (= lt!476577 (getCurrentListMapNoExtraKeys!3890 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39745)

(declare-fun lt!476576 () ListLongMap!14553)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074817 (= lt!476576 (getCurrentListMapNoExtraKeys!3890 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074818 () Bool)

(declare-fun e!614151 () Bool)

(declare-fun tp_is_empty!25957 () Bool)

(assert (=> b!1074818 (= e!614151 tp_is_empty!25957)))

(declare-fun b!1074819 () Bool)

(declare-fun e!614153 () Bool)

(assert (=> b!1074819 (= e!614153 tp_is_empty!25957)))

(declare-fun b!1074820 () Bool)

(declare-fun res!716494 () Bool)

(assert (=> b!1074820 (=> (not res!716494) (not e!614149))))

(declare-datatypes ((List!23134 0))(
  ( (Nil!23131) (Cons!23130 (h!24348 (_ BitVec 64)) (t!32463 List!23134)) )
))
(declare-fun arrayNoDuplicates!0 (array!68919 (_ BitVec 32) List!23134) Bool)

(assert (=> b!1074820 (= res!716494 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23131))))

(declare-fun b!1074821 () Bool)

(declare-fun e!614152 () Bool)

(declare-fun mapRes!40648 () Bool)

(assert (=> b!1074821 (= e!614152 (and e!614151 mapRes!40648))))

(declare-fun condMapEmpty!40648 () Bool)

(declare-fun mapDefault!40648 () ValueCell!12275)

(assert (=> b!1074821 (= condMapEmpty!40648 (= (arr!33148 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12275)) mapDefault!40648)))))

(declare-fun mapIsEmpty!40648 () Bool)

(assert (=> mapIsEmpty!40648 mapRes!40648))

(declare-fun b!1074822 () Bool)

(declare-fun res!716491 () Bool)

(assert (=> b!1074822 (=> (not res!716491) (not e!614149))))

(assert (=> b!1074822 (= res!716491 (and (= (size!33685 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33684 _keys!1163) (size!33685 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!716493 () Bool)

(assert (=> start!95178 (=> (not res!716493) (not e!614149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95178 (= res!716493 (validMask!0 mask!1515))))

(assert (=> start!95178 e!614149))

(assert (=> start!95178 true))

(assert (=> start!95178 tp_is_empty!25957))

(declare-fun array_inv!25658 (array!68921) Bool)

(assert (=> start!95178 (and (array_inv!25658 _values!955) e!614152)))

(assert (=> start!95178 tp!77905))

(declare-fun array_inv!25659 (array!68919) Bool)

(assert (=> start!95178 (array_inv!25659 _keys!1163)))

(declare-fun mapNonEmpty!40648 () Bool)

(declare-fun tp!77906 () Bool)

(assert (=> mapNonEmpty!40648 (= mapRes!40648 (and tp!77906 e!614153))))

(declare-fun mapKey!40648 () (_ BitVec 32))

(declare-fun mapRest!40648 () (Array (_ BitVec 32) ValueCell!12275))

(declare-fun mapValue!40648 () ValueCell!12275)

(assert (=> mapNonEmpty!40648 (= (arr!33148 _values!955) (store mapRest!40648 mapKey!40648 mapValue!40648))))

(assert (= (and start!95178 res!716493) b!1074822))

(assert (= (and b!1074822 res!716491) b!1074816))

(assert (= (and b!1074816 res!716492) b!1074820))

(assert (= (and b!1074820 res!716494) b!1074817))

(assert (= (and b!1074821 condMapEmpty!40648) mapIsEmpty!40648))

(assert (= (and b!1074821 (not condMapEmpty!40648)) mapNonEmpty!40648))

(get-info :version)

(assert (= (and mapNonEmpty!40648 ((_ is ValueCellFull!12275) mapValue!40648)) b!1074819))

(assert (= (and b!1074821 ((_ is ValueCellFull!12275) mapDefault!40648)) b!1074818))

(assert (= start!95178 b!1074821))

(declare-fun m!994135 () Bool)

(assert (=> start!95178 m!994135))

(declare-fun m!994137 () Bool)

(assert (=> start!95178 m!994137))

(declare-fun m!994139 () Bool)

(assert (=> start!95178 m!994139))

(declare-fun m!994141 () Bool)

(assert (=> b!1074817 m!994141))

(declare-fun m!994143 () Bool)

(assert (=> b!1074817 m!994143))

(declare-fun m!994145 () Bool)

(assert (=> b!1074820 m!994145))

(declare-fun m!994147 () Bool)

(assert (=> b!1074816 m!994147))

(declare-fun m!994149 () Bool)

(assert (=> mapNonEmpty!40648 m!994149))

(check-sat tp_is_empty!25957 b_and!35011 (not b_next!22147) (not b!1074820) (not b!1074816) (not mapNonEmpty!40648) (not start!95178) (not b!1074817))
(check-sat b_and!35011 (not b_next!22147))
