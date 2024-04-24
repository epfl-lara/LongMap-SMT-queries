; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70160 () Bool)

(assert start!70160)

(declare-fun b_free!12415 () Bool)

(declare-fun b_next!12415 () Bool)

(assert (=> start!70160 (= b_free!12415 (not b_next!12415))))

(declare-fun tp!43959 () Bool)

(declare-fun b_and!21197 () Bool)

(assert (=> start!70160 (= tp!43959 b_and!21197)))

(declare-fun b!814406 () Bool)

(declare-fun res!556093 () Bool)

(declare-fun e!451372 () Bool)

(assert (=> b!814406 (=> (not res!556093) (not e!451372))))

(declare-datatypes ((array!44469 0))(
  ( (array!44470 (arr!21290 (Array (_ BitVec 32) (_ BitVec 64))) (size!21710 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44469)

(declare-datatypes ((List!15055 0))(
  ( (Nil!15052) (Cons!15051 (h!16186 (_ BitVec 64)) (t!21364 List!15055)) )
))
(declare-fun arrayNoDuplicates!0 (array!44469 (_ BitVec 32) List!15055) Bool)

(assert (=> b!814406 (= res!556093 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15052))))

(declare-fun mapNonEmpty!22768 () Bool)

(declare-fun mapRes!22768 () Bool)

(declare-fun tp!43960 () Bool)

(declare-fun e!451374 () Bool)

(assert (=> mapNonEmpty!22768 (= mapRes!22768 (and tp!43960 e!451374))))

(declare-fun mapKey!22768 () (_ BitVec 32))

(declare-datatypes ((V!23835 0))(
  ( (V!23836 (val!7110 Int)) )
))
(declare-datatypes ((ValueCell!6647 0))(
  ( (ValueCellFull!6647 (v!9537 V!23835)) (EmptyCell!6647) )
))
(declare-datatypes ((array!44471 0))(
  ( (array!44472 (arr!21291 (Array (_ BitVec 32) ValueCell!6647)) (size!21711 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44471)

(declare-fun mapValue!22768 () ValueCell!6647)

(declare-fun mapRest!22768 () (Array (_ BitVec 32) ValueCell!6647))

(assert (=> mapNonEmpty!22768 (= (arr!21291 _values!788) (store mapRest!22768 mapKey!22768 mapValue!22768))))

(declare-fun b!814407 () Bool)

(declare-fun res!556095 () Bool)

(assert (=> b!814407 (=> (not res!556095) (not e!451372))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44469 (_ BitVec 32)) Bool)

(assert (=> b!814407 (= res!556095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556096 () Bool)

(assert (=> start!70160 (=> (not res!556096) (not e!451372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70160 (= res!556096 (validMask!0 mask!1312))))

(assert (=> start!70160 e!451372))

(declare-fun tp_is_empty!14125 () Bool)

(assert (=> start!70160 tp_is_empty!14125))

(declare-fun array_inv!17101 (array!44469) Bool)

(assert (=> start!70160 (array_inv!17101 _keys!976)))

(assert (=> start!70160 true))

(declare-fun e!451376 () Bool)

(declare-fun array_inv!17102 (array!44471) Bool)

(assert (=> start!70160 (and (array_inv!17102 _values!788) e!451376)))

(assert (=> start!70160 tp!43959))

(declare-fun b!814408 () Bool)

(assert (=> b!814408 (= e!451372 false)))

(declare-fun zeroValueAfter!34 () V!23835)

(declare-fun minValue!754 () V!23835)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9236 0))(
  ( (tuple2!9237 (_1!4629 (_ BitVec 64)) (_2!4629 V!23835)) )
))
(declare-datatypes ((List!15056 0))(
  ( (Nil!15053) (Cons!15052 (h!16187 tuple2!9236) (t!21365 List!15056)) )
))
(declare-datatypes ((ListLongMap!8061 0))(
  ( (ListLongMap!8062 (toList!4046 List!15056)) )
))
(declare-fun lt!364671 () ListLongMap!8061)

(declare-fun getCurrentListMapNoExtraKeys!2153 (array!44469 array!44471 (_ BitVec 32) (_ BitVec 32) V!23835 V!23835 (_ BitVec 32) Int) ListLongMap!8061)

(assert (=> b!814408 (= lt!364671 (getCurrentListMapNoExtraKeys!2153 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23835)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364670 () ListLongMap!8061)

(assert (=> b!814408 (= lt!364670 (getCurrentListMapNoExtraKeys!2153 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814409 () Bool)

(assert (=> b!814409 (= e!451374 tp_is_empty!14125)))

(declare-fun b!814410 () Bool)

(declare-fun res!556094 () Bool)

(assert (=> b!814410 (=> (not res!556094) (not e!451372))))

(assert (=> b!814410 (= res!556094 (and (= (size!21711 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21710 _keys!976) (size!21711 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814411 () Bool)

(declare-fun e!451375 () Bool)

(assert (=> b!814411 (= e!451376 (and e!451375 mapRes!22768))))

(declare-fun condMapEmpty!22768 () Bool)

(declare-fun mapDefault!22768 () ValueCell!6647)

(assert (=> b!814411 (= condMapEmpty!22768 (= (arr!21291 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6647)) mapDefault!22768)))))

(declare-fun b!814412 () Bool)

(assert (=> b!814412 (= e!451375 tp_is_empty!14125)))

(declare-fun mapIsEmpty!22768 () Bool)

(assert (=> mapIsEmpty!22768 mapRes!22768))

(assert (= (and start!70160 res!556096) b!814410))

(assert (= (and b!814410 res!556094) b!814407))

(assert (= (and b!814407 res!556095) b!814406))

(assert (= (and b!814406 res!556093) b!814408))

(assert (= (and b!814411 condMapEmpty!22768) mapIsEmpty!22768))

(assert (= (and b!814411 (not condMapEmpty!22768)) mapNonEmpty!22768))

(get-info :version)

(assert (= (and mapNonEmpty!22768 ((_ is ValueCellFull!6647) mapValue!22768)) b!814409))

(assert (= (and b!814411 ((_ is ValueCellFull!6647) mapDefault!22768)) b!814412))

(assert (= start!70160 b!814411))

(declare-fun m!756807 () Bool)

(assert (=> start!70160 m!756807))

(declare-fun m!756809 () Bool)

(assert (=> start!70160 m!756809))

(declare-fun m!756811 () Bool)

(assert (=> start!70160 m!756811))

(declare-fun m!756813 () Bool)

(assert (=> b!814407 m!756813))

(declare-fun m!756815 () Bool)

(assert (=> b!814406 m!756815))

(declare-fun m!756817 () Bool)

(assert (=> mapNonEmpty!22768 m!756817))

(declare-fun m!756819 () Bool)

(assert (=> b!814408 m!756819))

(declare-fun m!756821 () Bool)

(assert (=> b!814408 m!756821))

(check-sat (not start!70160) (not b!814406) (not b_next!12415) b_and!21197 (not b!814408) (not b!814407) (not mapNonEmpty!22768) tp_is_empty!14125)
(check-sat b_and!21197 (not b_next!12415))
