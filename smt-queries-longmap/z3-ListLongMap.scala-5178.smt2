; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70056 () Bool)

(assert start!70056)

(declare-fun b_free!12477 () Bool)

(declare-fun b_next!12477 () Bool)

(assert (=> start!70056 (= b_free!12477 (not b_next!12477))))

(declare-fun tp!44146 () Bool)

(declare-fun b_and!21249 () Bool)

(assert (=> start!70056 (= tp!44146 b_and!21249)))

(declare-fun b!814163 () Bool)

(declare-fun e!451260 () Bool)

(declare-fun tp_is_empty!14187 () Bool)

(assert (=> b!814163 (= e!451260 tp_is_empty!14187)))

(declare-fun b!814164 () Bool)

(declare-fun e!451261 () Bool)

(declare-fun e!451263 () Bool)

(declare-fun mapRes!22861 () Bool)

(assert (=> b!814164 (= e!451261 (and e!451263 mapRes!22861))))

(declare-fun condMapEmpty!22861 () Bool)

(declare-datatypes ((V!23917 0))(
  ( (V!23918 (val!7141 Int)) )
))
(declare-datatypes ((ValueCell!6678 0))(
  ( (ValueCellFull!6678 (v!9568 V!23917)) (EmptyCell!6678) )
))
(declare-datatypes ((array!44580 0))(
  ( (array!44581 (arr!21350 (Array (_ BitVec 32) ValueCell!6678)) (size!21771 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44580)

(declare-fun mapDefault!22861 () ValueCell!6678)

(assert (=> b!814164 (= condMapEmpty!22861 (= (arr!21350 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6678)) mapDefault!22861)))))

(declare-fun b!814165 () Bool)

(declare-fun res!556120 () Bool)

(declare-fun e!451259 () Bool)

(assert (=> b!814165 (=> (not res!556120) (not e!451259))))

(declare-datatypes ((array!44582 0))(
  ( (array!44583 (arr!21351 (Array (_ BitVec 32) (_ BitVec 64))) (size!21772 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44582)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44582 (_ BitVec 32)) Bool)

(assert (=> b!814165 (= res!556120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22861 () Bool)

(assert (=> mapIsEmpty!22861 mapRes!22861))

(declare-fun mapNonEmpty!22861 () Bool)

(declare-fun tp!44145 () Bool)

(assert (=> mapNonEmpty!22861 (= mapRes!22861 (and tp!44145 e!451260))))

(declare-fun mapKey!22861 () (_ BitVec 32))

(declare-fun mapRest!22861 () (Array (_ BitVec 32) ValueCell!6678))

(declare-fun mapValue!22861 () ValueCell!6678)

(assert (=> mapNonEmpty!22861 (= (arr!21350 _values!788) (store mapRest!22861 mapKey!22861 mapValue!22861))))

(declare-fun b!814166 () Bool)

(assert (=> b!814166 (= e!451263 tp_is_empty!14187)))

(declare-fun b!814167 () Bool)

(declare-fun res!556119 () Bool)

(assert (=> b!814167 (=> (not res!556119) (not e!451259))))

(declare-datatypes ((List!15191 0))(
  ( (Nil!15188) (Cons!15187 (h!16316 (_ BitVec 64)) (t!21508 List!15191)) )
))
(declare-fun arrayNoDuplicates!0 (array!44582 (_ BitVec 32) List!15191) Bool)

(assert (=> b!814167 (= res!556119 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15188))))

(declare-fun b!814169 () Bool)

(declare-fun res!556122 () Bool)

(assert (=> b!814169 (=> (not res!556122) (not e!451259))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814169 (= res!556122 (and (= (size!21771 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21772 _keys!976) (size!21771 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556121 () Bool)

(assert (=> start!70056 (=> (not res!556121) (not e!451259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70056 (= res!556121 (validMask!0 mask!1312))))

(assert (=> start!70056 e!451259))

(assert (=> start!70056 tp_is_empty!14187))

(declare-fun array_inv!17089 (array!44582) Bool)

(assert (=> start!70056 (array_inv!17089 _keys!976)))

(assert (=> start!70056 true))

(declare-fun array_inv!17090 (array!44580) Bool)

(assert (=> start!70056 (and (array_inv!17090 _values!788) e!451261)))

(assert (=> start!70056 tp!44146))

(declare-fun b!814168 () Bool)

(assert (=> b!814168 (= e!451259 false)))

(declare-fun zeroValueAfter!34 () V!23917)

(declare-fun minValue!754 () V!23917)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9360 0))(
  ( (tuple2!9361 (_1!4691 (_ BitVec 64)) (_2!4691 V!23917)) )
))
(declare-datatypes ((List!15192 0))(
  ( (Nil!15189) (Cons!15188 (h!16317 tuple2!9360) (t!21509 List!15192)) )
))
(declare-datatypes ((ListLongMap!8183 0))(
  ( (ListLongMap!8184 (toList!4107 List!15192)) )
))
(declare-fun lt!364503 () ListLongMap!8183)

(declare-fun getCurrentListMapNoExtraKeys!2157 (array!44582 array!44580 (_ BitVec 32) (_ BitVec 32) V!23917 V!23917 (_ BitVec 32) Int) ListLongMap!8183)

(assert (=> b!814168 (= lt!364503 (getCurrentListMapNoExtraKeys!2157 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23917)

(declare-fun lt!364502 () ListLongMap!8183)

(assert (=> b!814168 (= lt!364502 (getCurrentListMapNoExtraKeys!2157 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70056 res!556121) b!814169))

(assert (= (and b!814169 res!556122) b!814165))

(assert (= (and b!814165 res!556120) b!814167))

(assert (= (and b!814167 res!556119) b!814168))

(assert (= (and b!814164 condMapEmpty!22861) mapIsEmpty!22861))

(assert (= (and b!814164 (not condMapEmpty!22861)) mapNonEmpty!22861))

(get-info :version)

(assert (= (and mapNonEmpty!22861 ((_ is ValueCellFull!6678) mapValue!22861)) b!814163))

(assert (= (and b!814164 ((_ is ValueCellFull!6678) mapDefault!22861)) b!814166))

(assert (= start!70056 b!814164))

(declare-fun m!756021 () Bool)

(assert (=> b!814165 m!756021))

(declare-fun m!756023 () Bool)

(assert (=> b!814168 m!756023))

(declare-fun m!756025 () Bool)

(assert (=> b!814168 m!756025))

(declare-fun m!756027 () Bool)

(assert (=> start!70056 m!756027))

(declare-fun m!756029 () Bool)

(assert (=> start!70056 m!756029))

(declare-fun m!756031 () Bool)

(assert (=> start!70056 m!756031))

(declare-fun m!756033 () Bool)

(assert (=> b!814167 m!756033))

(declare-fun m!756035 () Bool)

(assert (=> mapNonEmpty!22861 m!756035))

(check-sat (not start!70056) (not mapNonEmpty!22861) (not b_next!12477) b_and!21249 tp_is_empty!14187 (not b!814165) (not b!814168) (not b!814167))
(check-sat b_and!21249 (not b_next!12477))
