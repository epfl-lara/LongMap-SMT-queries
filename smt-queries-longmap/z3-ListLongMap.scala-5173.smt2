; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70026 () Bool)

(assert start!70026)

(declare-fun b_free!12447 () Bool)

(declare-fun b_next!12447 () Bool)

(assert (=> start!70026 (= b_free!12447 (not b_next!12447))))

(declare-fun tp!44056 () Bool)

(declare-fun b_and!21219 () Bool)

(assert (=> start!70026 (= tp!44056 b_and!21219)))

(declare-fun b!813848 () Bool)

(declare-fun e!451036 () Bool)

(declare-fun e!451034 () Bool)

(declare-fun mapRes!22816 () Bool)

(assert (=> b!813848 (= e!451036 (and e!451034 mapRes!22816))))

(declare-fun condMapEmpty!22816 () Bool)

(declare-datatypes ((V!23877 0))(
  ( (V!23878 (val!7126 Int)) )
))
(declare-datatypes ((ValueCell!6663 0))(
  ( (ValueCellFull!6663 (v!9553 V!23877)) (EmptyCell!6663) )
))
(declare-datatypes ((array!44522 0))(
  ( (array!44523 (arr!21321 (Array (_ BitVec 32) ValueCell!6663)) (size!21742 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44522)

(declare-fun mapDefault!22816 () ValueCell!6663)

(assert (=> b!813848 (= condMapEmpty!22816 (= (arr!21321 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6663)) mapDefault!22816)))))

(declare-fun b!813849 () Bool)

(declare-fun tp_is_empty!14157 () Bool)

(assert (=> b!813849 (= e!451034 tp_is_empty!14157)))

(declare-fun b!813850 () Bool)

(declare-fun e!451035 () Bool)

(assert (=> b!813850 (= e!451035 false)))

(declare-datatypes ((array!44524 0))(
  ( (array!44525 (arr!21322 (Array (_ BitVec 32) (_ BitVec 64))) (size!21743 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44524)

(declare-datatypes ((tuple2!9334 0))(
  ( (tuple2!9335 (_1!4678 (_ BitVec 64)) (_2!4678 V!23877)) )
))
(declare-datatypes ((List!15168 0))(
  ( (Nil!15165) (Cons!15164 (h!16293 tuple2!9334) (t!21485 List!15168)) )
))
(declare-datatypes ((ListLongMap!8157 0))(
  ( (ListLongMap!8158 (toList!4094 List!15168)) )
))
(declare-fun lt!364412 () ListLongMap!8157)

(declare-fun zeroValueAfter!34 () V!23877)

(declare-fun minValue!754 () V!23877)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2144 (array!44524 array!44522 (_ BitVec 32) (_ BitVec 32) V!23877 V!23877 (_ BitVec 32) Int) ListLongMap!8157)

(assert (=> b!813850 (= lt!364412 (getCurrentListMapNoExtraKeys!2144 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23877)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364413 () ListLongMap!8157)

(assert (=> b!813850 (= lt!364413 (getCurrentListMapNoExtraKeys!2144 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813851 () Bool)

(declare-fun res!555941 () Bool)

(assert (=> b!813851 (=> (not res!555941) (not e!451035))))

(assert (=> b!813851 (= res!555941 (and (= (size!21742 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21743 _keys!976) (size!21742 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813852 () Bool)

(declare-fun res!555939 () Bool)

(assert (=> b!813852 (=> (not res!555939) (not e!451035))))

(declare-datatypes ((List!15169 0))(
  ( (Nil!15166) (Cons!15165 (h!16294 (_ BitVec 64)) (t!21486 List!15169)) )
))
(declare-fun arrayNoDuplicates!0 (array!44524 (_ BitVec 32) List!15169) Bool)

(assert (=> b!813852 (= res!555939 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15166))))

(declare-fun b!813853 () Bool)

(declare-fun e!451038 () Bool)

(assert (=> b!813853 (= e!451038 tp_is_empty!14157)))

(declare-fun res!555940 () Bool)

(assert (=> start!70026 (=> (not res!555940) (not e!451035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70026 (= res!555940 (validMask!0 mask!1312))))

(assert (=> start!70026 e!451035))

(assert (=> start!70026 tp_is_empty!14157))

(declare-fun array_inv!17073 (array!44524) Bool)

(assert (=> start!70026 (array_inv!17073 _keys!976)))

(assert (=> start!70026 true))

(declare-fun array_inv!17074 (array!44522) Bool)

(assert (=> start!70026 (and (array_inv!17074 _values!788) e!451036)))

(assert (=> start!70026 tp!44056))

(declare-fun mapNonEmpty!22816 () Bool)

(declare-fun tp!44055 () Bool)

(assert (=> mapNonEmpty!22816 (= mapRes!22816 (and tp!44055 e!451038))))

(declare-fun mapValue!22816 () ValueCell!6663)

(declare-fun mapRest!22816 () (Array (_ BitVec 32) ValueCell!6663))

(declare-fun mapKey!22816 () (_ BitVec 32))

(assert (=> mapNonEmpty!22816 (= (arr!21321 _values!788) (store mapRest!22816 mapKey!22816 mapValue!22816))))

(declare-fun mapIsEmpty!22816 () Bool)

(assert (=> mapIsEmpty!22816 mapRes!22816))

(declare-fun b!813854 () Bool)

(declare-fun res!555942 () Bool)

(assert (=> b!813854 (=> (not res!555942) (not e!451035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44524 (_ BitVec 32)) Bool)

(assert (=> b!813854 (= res!555942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70026 res!555940) b!813851))

(assert (= (and b!813851 res!555941) b!813854))

(assert (= (and b!813854 res!555942) b!813852))

(assert (= (and b!813852 res!555939) b!813850))

(assert (= (and b!813848 condMapEmpty!22816) mapIsEmpty!22816))

(assert (= (and b!813848 (not condMapEmpty!22816)) mapNonEmpty!22816))

(get-info :version)

(assert (= (and mapNonEmpty!22816 ((_ is ValueCellFull!6663) mapValue!22816)) b!813853))

(assert (= (and b!813848 ((_ is ValueCellFull!6663) mapDefault!22816)) b!813849))

(assert (= start!70026 b!813848))

(declare-fun m!755781 () Bool)

(assert (=> mapNonEmpty!22816 m!755781))

(declare-fun m!755783 () Bool)

(assert (=> start!70026 m!755783))

(declare-fun m!755785 () Bool)

(assert (=> start!70026 m!755785))

(declare-fun m!755787 () Bool)

(assert (=> start!70026 m!755787))

(declare-fun m!755789 () Bool)

(assert (=> b!813854 m!755789))

(declare-fun m!755791 () Bool)

(assert (=> b!813852 m!755791))

(declare-fun m!755793 () Bool)

(assert (=> b!813850 m!755793))

(declare-fun m!755795 () Bool)

(assert (=> b!813850 m!755795))

(check-sat b_and!21219 (not mapNonEmpty!22816) (not b!813850) (not start!70026) (not b!813852) (not b_next!12447) (not b!813854) tp_is_empty!14157)
(check-sat b_and!21219 (not b_next!12447))
