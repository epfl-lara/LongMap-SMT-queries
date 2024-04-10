; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70270 () Bool)

(assert start!70270)

(declare-fun b_free!12645 () Bool)

(declare-fun b_next!12645 () Bool)

(assert (=> start!70270 (= b_free!12645 (not b_next!12645))))

(declare-fun tp!44658 () Bool)

(declare-fun b_and!21445 () Bool)

(assert (=> start!70270 (= tp!44658 b_and!21445)))

(declare-fun b!816367 () Bool)

(declare-fun e!452827 () Bool)

(declare-fun e!452829 () Bool)

(assert (=> b!816367 (= e!452827 (not e!452829))))

(declare-fun res!557358 () Bool)

(assert (=> b!816367 (=> res!557358 e!452829)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816367 (= res!557358 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24141 0))(
  ( (V!24142 (val!7225 Int)) )
))
(declare-datatypes ((tuple2!9490 0))(
  ( (tuple2!9491 (_1!4756 (_ BitVec 64)) (_2!4756 V!24141)) )
))
(declare-datatypes ((List!15319 0))(
  ( (Nil!15316) (Cons!15315 (h!16444 tuple2!9490) (t!21642 List!15319)) )
))
(declare-datatypes ((ListLongMap!8313 0))(
  ( (ListLongMap!8314 (toList!4172 List!15319)) )
))
(declare-fun lt!365632 () ListLongMap!8313)

(declare-fun lt!365631 () ListLongMap!8313)

(assert (=> b!816367 (= lt!365632 lt!365631)))

(declare-fun zeroValueBefore!34 () V!24141)

(declare-datatypes ((array!44912 0))(
  ( (array!44913 (arr!21513 (Array (_ BitVec 32) (_ BitVec 64))) (size!21934 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44912)

(declare-fun zeroValueAfter!34 () V!24141)

(declare-fun minValue!754 () V!24141)

(declare-datatypes ((ValueCell!6762 0))(
  ( (ValueCellFull!6762 (v!9653 V!24141)) (EmptyCell!6762) )
))
(declare-datatypes ((array!44914 0))(
  ( (array!44915 (arr!21514 (Array (_ BitVec 32) ValueCell!6762)) (size!21935 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44914)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27834 0))(
  ( (Unit!27835) )
))
(declare-fun lt!365630 () Unit!27834)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!327 (array!44912 array!44914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24141 V!24141 V!24141 V!24141 (_ BitVec 32) Int) Unit!27834)

(assert (=> b!816367 (= lt!365630 (lemmaNoChangeToArrayThenSameMapNoExtras!327 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2217 (array!44912 array!44914 (_ BitVec 32) (_ BitVec 32) V!24141 V!24141 (_ BitVec 32) Int) ListLongMap!8313)

(assert (=> b!816367 (= lt!365631 (getCurrentListMapNoExtraKeys!2217 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816367 (= lt!365632 (getCurrentListMapNoExtraKeys!2217 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23122 () Bool)

(declare-fun mapRes!23122 () Bool)

(declare-fun tp!44659 () Bool)

(declare-fun e!452826 () Bool)

(assert (=> mapNonEmpty!23122 (= mapRes!23122 (and tp!44659 e!452826))))

(declare-fun mapRest!23122 () (Array (_ BitVec 32) ValueCell!6762))

(declare-fun mapValue!23122 () ValueCell!6762)

(declare-fun mapKey!23122 () (_ BitVec 32))

(assert (=> mapNonEmpty!23122 (= (arr!21514 _values!788) (store mapRest!23122 mapKey!23122 mapValue!23122))))

(declare-fun b!816368 () Bool)

(declare-fun res!557361 () Bool)

(assert (=> b!816368 (=> (not res!557361) (not e!452827))))

(assert (=> b!816368 (= res!557361 (and (= (size!21935 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21934 _keys!976) (size!21935 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816369 () Bool)

(declare-fun e!452830 () Bool)

(declare-fun tp_is_empty!14355 () Bool)

(assert (=> b!816369 (= e!452830 tp_is_empty!14355)))

(declare-fun b!816370 () Bool)

(declare-fun res!557357 () Bool)

(assert (=> b!816370 (=> (not res!557357) (not e!452827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44912 (_ BitVec 32)) Bool)

(assert (=> b!816370 (= res!557357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!557360 () Bool)

(assert (=> start!70270 (=> (not res!557360) (not e!452827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70270 (= res!557360 (validMask!0 mask!1312))))

(assert (=> start!70270 e!452827))

(assert (=> start!70270 tp_is_empty!14355))

(declare-fun array_inv!17213 (array!44912) Bool)

(assert (=> start!70270 (array_inv!17213 _keys!976)))

(assert (=> start!70270 true))

(declare-fun e!452828 () Bool)

(declare-fun array_inv!17214 (array!44914) Bool)

(assert (=> start!70270 (and (array_inv!17214 _values!788) e!452828)))

(assert (=> start!70270 tp!44658))

(declare-fun b!816371 () Bool)

(assert (=> b!816371 (= e!452829 true)))

(declare-fun lt!365628 () ListLongMap!8313)

(declare-fun getCurrentListMap!2398 (array!44912 array!44914 (_ BitVec 32) (_ BitVec 32) V!24141 V!24141 (_ BitVec 32) Int) ListLongMap!8313)

(assert (=> b!816371 (= lt!365628 (getCurrentListMap!2398 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365629 () ListLongMap!8313)

(declare-fun +!1804 (ListLongMap!8313 tuple2!9490) ListLongMap!8313)

(assert (=> b!816371 (= lt!365629 (+!1804 (getCurrentListMap!2398 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816372 () Bool)

(declare-fun res!557359 () Bool)

(assert (=> b!816372 (=> (not res!557359) (not e!452827))))

(declare-datatypes ((List!15320 0))(
  ( (Nil!15317) (Cons!15316 (h!16445 (_ BitVec 64)) (t!21643 List!15320)) )
))
(declare-fun arrayNoDuplicates!0 (array!44912 (_ BitVec 32) List!15320) Bool)

(assert (=> b!816372 (= res!557359 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15317))))

(declare-fun mapIsEmpty!23122 () Bool)

(assert (=> mapIsEmpty!23122 mapRes!23122))

(declare-fun b!816373 () Bool)

(assert (=> b!816373 (= e!452828 (and e!452830 mapRes!23122))))

(declare-fun condMapEmpty!23122 () Bool)

(declare-fun mapDefault!23122 () ValueCell!6762)

(assert (=> b!816373 (= condMapEmpty!23122 (= (arr!21514 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6762)) mapDefault!23122)))))

(declare-fun b!816374 () Bool)

(assert (=> b!816374 (= e!452826 tp_is_empty!14355)))

(assert (= (and start!70270 res!557360) b!816368))

(assert (= (and b!816368 res!557361) b!816370))

(assert (= (and b!816370 res!557357) b!816372))

(assert (= (and b!816372 res!557359) b!816367))

(assert (= (and b!816367 (not res!557358)) b!816371))

(assert (= (and b!816373 condMapEmpty!23122) mapIsEmpty!23122))

(assert (= (and b!816373 (not condMapEmpty!23122)) mapNonEmpty!23122))

(get-info :version)

(assert (= (and mapNonEmpty!23122 ((_ is ValueCellFull!6762) mapValue!23122)) b!816374))

(assert (= (and b!816373 ((_ is ValueCellFull!6762) mapDefault!23122)) b!816369))

(assert (= start!70270 b!816373))

(declare-fun m!757999 () Bool)

(assert (=> b!816367 m!757999))

(declare-fun m!758001 () Bool)

(assert (=> b!816367 m!758001))

(declare-fun m!758003 () Bool)

(assert (=> b!816367 m!758003))

(declare-fun m!758005 () Bool)

(assert (=> mapNonEmpty!23122 m!758005))

(declare-fun m!758007 () Bool)

(assert (=> b!816371 m!758007))

(declare-fun m!758009 () Bool)

(assert (=> b!816371 m!758009))

(assert (=> b!816371 m!758009))

(declare-fun m!758011 () Bool)

(assert (=> b!816371 m!758011))

(declare-fun m!758013 () Bool)

(assert (=> start!70270 m!758013))

(declare-fun m!758015 () Bool)

(assert (=> start!70270 m!758015))

(declare-fun m!758017 () Bool)

(assert (=> start!70270 m!758017))

(declare-fun m!758019 () Bool)

(assert (=> b!816370 m!758019))

(declare-fun m!758021 () Bool)

(assert (=> b!816372 m!758021))

(check-sat (not b!816371) b_and!21445 tp_is_empty!14355 (not start!70270) (not mapNonEmpty!23122) (not b!816370) (not b!816367) (not b!816372) (not b_next!12645))
(check-sat b_and!21445 (not b_next!12645))
