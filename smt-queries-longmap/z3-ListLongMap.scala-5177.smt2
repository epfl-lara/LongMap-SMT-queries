; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70028 () Bool)

(assert start!70028)

(declare-fun b_free!12469 () Bool)

(declare-fun b_next!12469 () Bool)

(assert (=> start!70028 (= b_free!12469 (not b_next!12469))))

(declare-fun tp!44122 () Bool)

(declare-fun b_and!21215 () Bool)

(assert (=> start!70028 (= tp!44122 b_and!21215)))

(declare-fun b!813833 () Bool)

(declare-fun e!451052 () Bool)

(declare-fun e!451051 () Bool)

(declare-fun mapRes!22849 () Bool)

(assert (=> b!813833 (= e!451052 (and e!451051 mapRes!22849))))

(declare-fun condMapEmpty!22849 () Bool)

(declare-datatypes ((V!23907 0))(
  ( (V!23908 (val!7137 Int)) )
))
(declare-datatypes ((ValueCell!6674 0))(
  ( (ValueCellFull!6674 (v!9558 V!23907)) (EmptyCell!6674) )
))
(declare-datatypes ((array!44559 0))(
  ( (array!44560 (arr!21340 (Array (_ BitVec 32) ValueCell!6674)) (size!21761 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44559)

(declare-fun mapDefault!22849 () ValueCell!6674)

(assert (=> b!813833 (= condMapEmpty!22849 (= (arr!21340 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6674)) mapDefault!22849)))))

(declare-fun mapNonEmpty!22849 () Bool)

(declare-fun tp!44121 () Bool)

(declare-fun e!451049 () Bool)

(assert (=> mapNonEmpty!22849 (= mapRes!22849 (and tp!44121 e!451049))))

(declare-fun mapValue!22849 () ValueCell!6674)

(declare-fun mapRest!22849 () (Array (_ BitVec 32) ValueCell!6674))

(declare-fun mapKey!22849 () (_ BitVec 32))

(assert (=> mapNonEmpty!22849 (= (arr!21340 _values!788) (store mapRest!22849 mapKey!22849 mapValue!22849))))

(declare-fun b!813834 () Bool)

(declare-fun res!555966 () Bool)

(declare-fun e!451053 () Bool)

(assert (=> b!813834 (=> (not res!555966) (not e!451053))))

(declare-datatypes ((array!44561 0))(
  ( (array!44562 (arr!21341 (Array (_ BitVec 32) (_ BitVec 64))) (size!21762 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44561)

(declare-datatypes ((List!15216 0))(
  ( (Nil!15213) (Cons!15212 (h!16341 (_ BitVec 64)) (t!21524 List!15216)) )
))
(declare-fun arrayNoDuplicates!0 (array!44561 (_ BitVec 32) List!15216) Bool)

(assert (=> b!813834 (= res!555966 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15213))))

(declare-fun mapIsEmpty!22849 () Bool)

(assert (=> mapIsEmpty!22849 mapRes!22849))

(declare-fun b!813835 () Bool)

(declare-fun tp_is_empty!14179 () Bool)

(assert (=> b!813835 (= e!451051 tp_is_empty!14179)))

(declare-fun res!555968 () Bool)

(assert (=> start!70028 (=> (not res!555968) (not e!451053))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70028 (= res!555968 (validMask!0 mask!1312))))

(assert (=> start!70028 e!451053))

(assert (=> start!70028 tp_is_empty!14179))

(declare-fun array_inv!17165 (array!44561) Bool)

(assert (=> start!70028 (array_inv!17165 _keys!976)))

(assert (=> start!70028 true))

(declare-fun array_inv!17166 (array!44559) Bool)

(assert (=> start!70028 (and (array_inv!17166 _values!788) e!451052)))

(assert (=> start!70028 tp!44122))

(declare-fun b!813836 () Bool)

(assert (=> b!813836 (= e!451049 tp_is_empty!14179)))

(declare-fun b!813837 () Bool)

(declare-fun res!555967 () Bool)

(assert (=> b!813837 (=> (not res!555967) (not e!451053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44561 (_ BitVec 32)) Bool)

(assert (=> b!813837 (= res!555967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813838 () Bool)

(declare-fun res!555965 () Bool)

(assert (=> b!813838 (=> (not res!555965) (not e!451053))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813838 (= res!555965 (and (= (size!21761 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21762 _keys!976) (size!21761 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813839 () Bool)

(assert (=> b!813839 (= e!451053 false)))

(declare-datatypes ((tuple2!9390 0))(
  ( (tuple2!9391 (_1!4706 (_ BitVec 64)) (_2!4706 V!23907)) )
))
(declare-datatypes ((List!15217 0))(
  ( (Nil!15214) (Cons!15213 (h!16342 tuple2!9390) (t!21525 List!15217)) )
))
(declare-datatypes ((ListLongMap!8203 0))(
  ( (ListLongMap!8204 (toList!4117 List!15217)) )
))
(declare-fun lt!364236 () ListLongMap!8203)

(declare-fun zeroValueAfter!34 () V!23907)

(declare-fun minValue!754 () V!23907)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2182 (array!44561 array!44559 (_ BitVec 32) (_ BitVec 32) V!23907 V!23907 (_ BitVec 32) Int) ListLongMap!8203)

(assert (=> b!813839 (= lt!364236 (getCurrentListMapNoExtraKeys!2182 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23907)

(declare-fun lt!364235 () ListLongMap!8203)

(assert (=> b!813839 (= lt!364235 (getCurrentListMapNoExtraKeys!2182 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70028 res!555968) b!813838))

(assert (= (and b!813838 res!555965) b!813837))

(assert (= (and b!813837 res!555967) b!813834))

(assert (= (and b!813834 res!555966) b!813839))

(assert (= (and b!813833 condMapEmpty!22849) mapIsEmpty!22849))

(assert (= (and b!813833 (not condMapEmpty!22849)) mapNonEmpty!22849))

(get-info :version)

(assert (= (and mapNonEmpty!22849 ((_ is ValueCellFull!6674) mapValue!22849)) b!813836))

(assert (= (and b!813833 ((_ is ValueCellFull!6674) mapDefault!22849)) b!813835))

(assert (= start!70028 b!813833))

(declare-fun m!755205 () Bool)

(assert (=> start!70028 m!755205))

(declare-fun m!755207 () Bool)

(assert (=> start!70028 m!755207))

(declare-fun m!755209 () Bool)

(assert (=> start!70028 m!755209))

(declare-fun m!755211 () Bool)

(assert (=> b!813837 m!755211))

(declare-fun m!755213 () Bool)

(assert (=> b!813839 m!755213))

(declare-fun m!755215 () Bool)

(assert (=> b!813839 m!755215))

(declare-fun m!755217 () Bool)

(assert (=> mapNonEmpty!22849 m!755217))

(declare-fun m!755219 () Bool)

(assert (=> b!813834 m!755219))

(check-sat (not b_next!12469) b_and!21215 (not b!813839) (not b!813837) tp_is_empty!14179 (not start!70028) (not mapNonEmpty!22849) (not b!813834))
(check-sat b_and!21215 (not b_next!12469))
