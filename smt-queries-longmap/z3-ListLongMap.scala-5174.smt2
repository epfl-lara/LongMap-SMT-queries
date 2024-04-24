; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70196 () Bool)

(assert start!70196)

(declare-fun b_free!12451 () Bool)

(declare-fun b_next!12451 () Bool)

(assert (=> start!70196 (= b_free!12451 (not b_next!12451))))

(declare-fun tp!44067 () Bool)

(declare-fun b_and!21233 () Bool)

(assert (=> start!70196 (= tp!44067 b_and!21233)))

(declare-fun b!814784 () Bool)

(declare-fun e!451644 () Bool)

(declare-fun tp_is_empty!14161 () Bool)

(assert (=> b!814784 (= e!451644 tp_is_empty!14161)))

(declare-fun b!814785 () Bool)

(declare-fun e!451646 () Bool)

(assert (=> b!814785 (= e!451646 tp_is_empty!14161)))

(declare-fun b!814786 () Bool)

(declare-fun res!556310 () Bool)

(declare-fun e!451643 () Bool)

(assert (=> b!814786 (=> (not res!556310) (not e!451643))))

(declare-datatypes ((array!44531 0))(
  ( (array!44532 (arr!21321 (Array (_ BitVec 32) (_ BitVec 64))) (size!21741 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44531)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23883 0))(
  ( (V!23884 (val!7128 Int)) )
))
(declare-datatypes ((ValueCell!6665 0))(
  ( (ValueCellFull!6665 (v!9555 V!23883)) (EmptyCell!6665) )
))
(declare-datatypes ((array!44533 0))(
  ( (array!44534 (arr!21322 (Array (_ BitVec 32) ValueCell!6665)) (size!21742 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44533)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814786 (= res!556310 (and (= (size!21742 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21741 _keys!976) (size!21742 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814787 () Bool)

(assert (=> b!814787 (= e!451643 false)))

(declare-datatypes ((tuple2!9254 0))(
  ( (tuple2!9255 (_1!4638 (_ BitVec 64)) (_2!4638 V!23883)) )
))
(declare-datatypes ((List!15073 0))(
  ( (Nil!15070) (Cons!15069 (h!16204 tuple2!9254) (t!21382 List!15073)) )
))
(declare-datatypes ((ListLongMap!8079 0))(
  ( (ListLongMap!8080 (toList!4055 List!15073)) )
))
(declare-fun lt!364778 () ListLongMap!8079)

(declare-fun zeroValueAfter!34 () V!23883)

(declare-fun minValue!754 () V!23883)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2162 (array!44531 array!44533 (_ BitVec 32) (_ BitVec 32) V!23883 V!23883 (_ BitVec 32) Int) ListLongMap!8079)

(assert (=> b!814787 (= lt!364778 (getCurrentListMapNoExtraKeys!2162 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23883)

(declare-fun lt!364779 () ListLongMap!8079)

(assert (=> b!814787 (= lt!364779 (getCurrentListMapNoExtraKeys!2162 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22822 () Bool)

(declare-fun mapRes!22822 () Bool)

(declare-fun tp!44068 () Bool)

(assert (=> mapNonEmpty!22822 (= mapRes!22822 (and tp!44068 e!451646))))

(declare-fun mapValue!22822 () ValueCell!6665)

(declare-fun mapKey!22822 () (_ BitVec 32))

(declare-fun mapRest!22822 () (Array (_ BitVec 32) ValueCell!6665))

(assert (=> mapNonEmpty!22822 (= (arr!21322 _values!788) (store mapRest!22822 mapKey!22822 mapValue!22822))))

(declare-fun mapIsEmpty!22822 () Bool)

(assert (=> mapIsEmpty!22822 mapRes!22822))

(declare-fun b!814789 () Bool)

(declare-fun e!451645 () Bool)

(assert (=> b!814789 (= e!451645 (and e!451644 mapRes!22822))))

(declare-fun condMapEmpty!22822 () Bool)

(declare-fun mapDefault!22822 () ValueCell!6665)

(assert (=> b!814789 (= condMapEmpty!22822 (= (arr!21322 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6665)) mapDefault!22822)))))

(declare-fun b!814790 () Bool)

(declare-fun res!556309 () Bool)

(assert (=> b!814790 (=> (not res!556309) (not e!451643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44531 (_ BitVec 32)) Bool)

(assert (=> b!814790 (= res!556309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556311 () Bool)

(assert (=> start!70196 (=> (not res!556311) (not e!451643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70196 (= res!556311 (validMask!0 mask!1312))))

(assert (=> start!70196 e!451643))

(assert (=> start!70196 tp_is_empty!14161))

(declare-fun array_inv!17121 (array!44531) Bool)

(assert (=> start!70196 (array_inv!17121 _keys!976)))

(assert (=> start!70196 true))

(declare-fun array_inv!17122 (array!44533) Bool)

(assert (=> start!70196 (and (array_inv!17122 _values!788) e!451645)))

(assert (=> start!70196 tp!44067))

(declare-fun b!814788 () Bool)

(declare-fun res!556312 () Bool)

(assert (=> b!814788 (=> (not res!556312) (not e!451643))))

(declare-datatypes ((List!15074 0))(
  ( (Nil!15071) (Cons!15070 (h!16205 (_ BitVec 64)) (t!21383 List!15074)) )
))
(declare-fun arrayNoDuplicates!0 (array!44531 (_ BitVec 32) List!15074) Bool)

(assert (=> b!814788 (= res!556312 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15071))))

(assert (= (and start!70196 res!556311) b!814786))

(assert (= (and b!814786 res!556310) b!814790))

(assert (= (and b!814790 res!556309) b!814788))

(assert (= (and b!814788 res!556312) b!814787))

(assert (= (and b!814789 condMapEmpty!22822) mapIsEmpty!22822))

(assert (= (and b!814789 (not condMapEmpty!22822)) mapNonEmpty!22822))

(get-info :version)

(assert (= (and mapNonEmpty!22822 ((_ is ValueCellFull!6665) mapValue!22822)) b!814785))

(assert (= (and b!814789 ((_ is ValueCellFull!6665) mapDefault!22822)) b!814784))

(assert (= start!70196 b!814789))

(declare-fun m!757095 () Bool)

(assert (=> mapNonEmpty!22822 m!757095))

(declare-fun m!757097 () Bool)

(assert (=> b!814788 m!757097))

(declare-fun m!757099 () Bool)

(assert (=> b!814787 m!757099))

(declare-fun m!757101 () Bool)

(assert (=> b!814787 m!757101))

(declare-fun m!757103 () Bool)

(assert (=> b!814790 m!757103))

(declare-fun m!757105 () Bool)

(assert (=> start!70196 m!757105))

(declare-fun m!757107 () Bool)

(assert (=> start!70196 m!757107))

(declare-fun m!757109 () Bool)

(assert (=> start!70196 m!757109))

(check-sat (not b!814788) (not b!814787) tp_is_empty!14161 (not start!70196) (not mapNonEmpty!22822) b_and!21233 (not b_next!12451) (not b!814790))
(check-sat b_and!21233 (not b_next!12451))
