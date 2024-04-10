; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70044 () Bool)

(assert start!70044)

(declare-fun b_free!12465 () Bool)

(declare-fun b_next!12465 () Bool)

(assert (=> start!70044 (= b_free!12465 (not b_next!12465))))

(declare-fun tp!44109 () Bool)

(declare-fun b_and!21237 () Bool)

(assert (=> start!70044 (= tp!44109 b_and!21237)))

(declare-fun b!814037 () Bool)

(declare-fun e!451172 () Bool)

(assert (=> b!814037 (= e!451172 false)))

(declare-datatypes ((array!44556 0))(
  ( (array!44557 (arr!21338 (Array (_ BitVec 32) (_ BitVec 64))) (size!21759 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44556)

(declare-datatypes ((V!23901 0))(
  ( (V!23902 (val!7135 Int)) )
))
(declare-fun zeroValueAfter!34 () V!23901)

(declare-fun minValue!754 () V!23901)

(declare-datatypes ((ValueCell!6672 0))(
  ( (ValueCellFull!6672 (v!9562 V!23901)) (EmptyCell!6672) )
))
(declare-datatypes ((array!44558 0))(
  ( (array!44559 (arr!21339 (Array (_ BitVec 32) ValueCell!6672)) (size!21760 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44558)

(declare-datatypes ((tuple2!9350 0))(
  ( (tuple2!9351 (_1!4686 (_ BitVec 64)) (_2!4686 V!23901)) )
))
(declare-datatypes ((List!15182 0))(
  ( (Nil!15179) (Cons!15178 (h!16307 tuple2!9350) (t!21499 List!15182)) )
))
(declare-datatypes ((ListLongMap!8173 0))(
  ( (ListLongMap!8174 (toList!4102 List!15182)) )
))
(declare-fun lt!364467 () ListLongMap!8173)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2152 (array!44556 array!44558 (_ BitVec 32) (_ BitVec 32) V!23901 V!23901 (_ BitVec 32) Int) ListLongMap!8173)

(assert (=> b!814037 (= lt!364467 (getCurrentListMapNoExtraKeys!2152 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23901)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364466 () ListLongMap!8173)

(assert (=> b!814037 (= lt!364466 (getCurrentListMapNoExtraKeys!2152 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814038 () Bool)

(declare-fun e!451173 () Bool)

(declare-fun e!451170 () Bool)

(declare-fun mapRes!22843 () Bool)

(assert (=> b!814038 (= e!451173 (and e!451170 mapRes!22843))))

(declare-fun condMapEmpty!22843 () Bool)

(declare-fun mapDefault!22843 () ValueCell!6672)

(assert (=> b!814038 (= condMapEmpty!22843 (= (arr!21339 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6672)) mapDefault!22843)))))

(declare-fun mapIsEmpty!22843 () Bool)

(assert (=> mapIsEmpty!22843 mapRes!22843))

(declare-fun b!814039 () Bool)

(declare-fun res!556050 () Bool)

(assert (=> b!814039 (=> (not res!556050) (not e!451172))))

(assert (=> b!814039 (= res!556050 (and (= (size!21760 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21759 _keys!976) (size!21760 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814040 () Bool)

(declare-fun tp_is_empty!14175 () Bool)

(assert (=> b!814040 (= e!451170 tp_is_empty!14175)))

(declare-fun b!814041 () Bool)

(declare-fun res!556049 () Bool)

(assert (=> b!814041 (=> (not res!556049) (not e!451172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44556 (_ BitVec 32)) Bool)

(assert (=> b!814041 (= res!556049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22843 () Bool)

(declare-fun tp!44110 () Bool)

(declare-fun e!451169 () Bool)

(assert (=> mapNonEmpty!22843 (= mapRes!22843 (and tp!44110 e!451169))))

(declare-fun mapKey!22843 () (_ BitVec 32))

(declare-fun mapValue!22843 () ValueCell!6672)

(declare-fun mapRest!22843 () (Array (_ BitVec 32) ValueCell!6672))

(assert (=> mapNonEmpty!22843 (= (arr!21339 _values!788) (store mapRest!22843 mapKey!22843 mapValue!22843))))

(declare-fun res!556047 () Bool)

(assert (=> start!70044 (=> (not res!556047) (not e!451172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70044 (= res!556047 (validMask!0 mask!1312))))

(assert (=> start!70044 e!451172))

(assert (=> start!70044 tp_is_empty!14175))

(declare-fun array_inv!17081 (array!44556) Bool)

(assert (=> start!70044 (array_inv!17081 _keys!976)))

(assert (=> start!70044 true))

(declare-fun array_inv!17082 (array!44558) Bool)

(assert (=> start!70044 (and (array_inv!17082 _values!788) e!451173)))

(assert (=> start!70044 tp!44109))

(declare-fun b!814042 () Bool)

(declare-fun res!556048 () Bool)

(assert (=> b!814042 (=> (not res!556048) (not e!451172))))

(declare-datatypes ((List!15183 0))(
  ( (Nil!15180) (Cons!15179 (h!16308 (_ BitVec 64)) (t!21500 List!15183)) )
))
(declare-fun arrayNoDuplicates!0 (array!44556 (_ BitVec 32) List!15183) Bool)

(assert (=> b!814042 (= res!556048 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15180))))

(declare-fun b!814043 () Bool)

(assert (=> b!814043 (= e!451169 tp_is_empty!14175)))

(assert (= (and start!70044 res!556047) b!814039))

(assert (= (and b!814039 res!556050) b!814041))

(assert (= (and b!814041 res!556049) b!814042))

(assert (= (and b!814042 res!556048) b!814037))

(assert (= (and b!814038 condMapEmpty!22843) mapIsEmpty!22843))

(assert (= (and b!814038 (not condMapEmpty!22843)) mapNonEmpty!22843))

(get-info :version)

(assert (= (and mapNonEmpty!22843 ((_ is ValueCellFull!6672) mapValue!22843)) b!814043))

(assert (= (and b!814038 ((_ is ValueCellFull!6672) mapDefault!22843)) b!814040))

(assert (= start!70044 b!814038))

(declare-fun m!755925 () Bool)

(assert (=> start!70044 m!755925))

(declare-fun m!755927 () Bool)

(assert (=> start!70044 m!755927))

(declare-fun m!755929 () Bool)

(assert (=> start!70044 m!755929))

(declare-fun m!755931 () Bool)

(assert (=> b!814037 m!755931))

(declare-fun m!755933 () Bool)

(assert (=> b!814037 m!755933))

(declare-fun m!755935 () Bool)

(assert (=> b!814042 m!755935))

(declare-fun m!755937 () Bool)

(assert (=> b!814041 m!755937))

(declare-fun m!755939 () Bool)

(assert (=> mapNonEmpty!22843 m!755939))

(check-sat (not start!70044) (not mapNonEmpty!22843) b_and!21237 tp_is_empty!14175 (not b!814042) (not b_next!12465) (not b!814037) (not b!814041))
(check-sat b_and!21237 (not b_next!12465))
