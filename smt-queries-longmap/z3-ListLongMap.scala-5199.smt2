; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70188 () Bool)

(assert start!70188)

(declare-fun b_free!12601 () Bool)

(declare-fun b_next!12601 () Bool)

(assert (=> start!70188 (= b_free!12601 (not b_next!12601))))

(declare-fun tp!44524 () Bool)

(declare-fun b_and!21363 () Bool)

(assert (=> start!70188 (= tp!44524 b_and!21363)))

(declare-fun b!815409 () Bool)

(declare-fun res!556840 () Bool)

(declare-fun e!452171 () Bool)

(assert (=> b!815409 (=> (not res!556840) (not e!452171))))

(declare-datatypes ((array!44813 0))(
  ( (array!44814 (arr!21465 (Array (_ BitVec 32) (_ BitVec 64))) (size!21886 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44813)

(declare-datatypes ((List!15299 0))(
  ( (Nil!15296) (Cons!15295 (h!16424 (_ BitVec 64)) (t!21611 List!15299)) )
))
(declare-fun arrayNoDuplicates!0 (array!44813 (_ BitVec 32) List!15299) Bool)

(assert (=> b!815409 (= res!556840 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15296))))

(declare-fun mapIsEmpty!23053 () Bool)

(declare-fun mapRes!23053 () Bool)

(assert (=> mapIsEmpty!23053 mapRes!23053))

(declare-fun b!815410 () Bool)

(declare-fun e!452170 () Bool)

(assert (=> b!815410 (= e!452171 (not e!452170))))

(declare-fun res!556842 () Bool)

(assert (=> b!815410 (=> res!556842 e!452170)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!815410 (= res!556842 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24083 0))(
  ( (V!24084 (val!7203 Int)) )
))
(declare-datatypes ((tuple2!9472 0))(
  ( (tuple2!9473 (_1!4747 (_ BitVec 64)) (_2!4747 V!24083)) )
))
(declare-datatypes ((List!15300 0))(
  ( (Nil!15297) (Cons!15296 (h!16425 tuple2!9472) (t!21612 List!15300)) )
))
(declare-datatypes ((ListLongMap!8285 0))(
  ( (ListLongMap!8286 (toList!4158 List!15300)) )
))
(declare-fun lt!364935 () ListLongMap!8285)

(declare-fun lt!364933 () ListLongMap!8285)

(assert (=> b!815410 (= lt!364935 lt!364933)))

(declare-datatypes ((Unit!27750 0))(
  ( (Unit!27751) )
))
(declare-fun lt!364936 () Unit!27750)

(declare-fun zeroValueBefore!34 () V!24083)

(declare-fun zeroValueAfter!34 () V!24083)

(declare-fun minValue!754 () V!24083)

(declare-datatypes ((ValueCell!6740 0))(
  ( (ValueCellFull!6740 (v!9624 V!24083)) (EmptyCell!6740) )
))
(declare-datatypes ((array!44815 0))(
  ( (array!44816 (arr!21466 (Array (_ BitVec 32) ValueCell!6740)) (size!21887 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44815)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!316 (array!44813 array!44815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24083 V!24083 V!24083 V!24083 (_ BitVec 32) Int) Unit!27750)

(assert (=> b!815410 (= lt!364936 (lemmaNoChangeToArrayThenSameMapNoExtras!316 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2223 (array!44813 array!44815 (_ BitVec 32) (_ BitVec 32) V!24083 V!24083 (_ BitVec 32) Int) ListLongMap!8285)

(assert (=> b!815410 (= lt!364933 (getCurrentListMapNoExtraKeys!2223 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815410 (= lt!364935 (getCurrentListMapNoExtraKeys!2223 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815411 () Bool)

(declare-fun e!452169 () Bool)

(declare-fun tp_is_empty!14311 () Bool)

(assert (=> b!815411 (= e!452169 tp_is_empty!14311)))

(declare-fun b!815412 () Bool)

(declare-fun res!556843 () Bool)

(assert (=> b!815412 (=> (not res!556843) (not e!452171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44813 (_ BitVec 32)) Bool)

(assert (=> b!815412 (= res!556843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556841 () Bool)

(assert (=> start!70188 (=> (not res!556841) (not e!452171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70188 (= res!556841 (validMask!0 mask!1312))))

(assert (=> start!70188 e!452171))

(assert (=> start!70188 tp_is_empty!14311))

(declare-fun array_inv!17255 (array!44813) Bool)

(assert (=> start!70188 (array_inv!17255 _keys!976)))

(assert (=> start!70188 true))

(declare-fun e!452174 () Bool)

(declare-fun array_inv!17256 (array!44815) Bool)

(assert (=> start!70188 (and (array_inv!17256 _values!788) e!452174)))

(assert (=> start!70188 tp!44524))

(declare-fun b!815413 () Bool)

(declare-fun res!556839 () Bool)

(assert (=> b!815413 (=> (not res!556839) (not e!452171))))

(assert (=> b!815413 (= res!556839 (and (= (size!21887 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21886 _keys!976) (size!21887 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815414 () Bool)

(declare-fun e!452172 () Bool)

(assert (=> b!815414 (= e!452174 (and e!452172 mapRes!23053))))

(declare-fun condMapEmpty!23053 () Bool)

(declare-fun mapDefault!23053 () ValueCell!6740)

(assert (=> b!815414 (= condMapEmpty!23053 (= (arr!21466 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6740)) mapDefault!23053)))))

(declare-fun mapNonEmpty!23053 () Bool)

(declare-fun tp!44523 () Bool)

(assert (=> mapNonEmpty!23053 (= mapRes!23053 (and tp!44523 e!452169))))

(declare-fun mapKey!23053 () (_ BitVec 32))

(declare-fun mapValue!23053 () ValueCell!6740)

(declare-fun mapRest!23053 () (Array (_ BitVec 32) ValueCell!6740))

(assert (=> mapNonEmpty!23053 (= (arr!21466 _values!788) (store mapRest!23053 mapKey!23053 mapValue!23053))))

(declare-fun b!815415 () Bool)

(assert (=> b!815415 (= e!452172 tp_is_empty!14311)))

(declare-fun b!815416 () Bool)

(assert (=> b!815416 (= e!452170 true)))

(declare-fun lt!364934 () ListLongMap!8285)

(declare-fun getCurrentListMap!2335 (array!44813 array!44815 (_ BitVec 32) (_ BitVec 32) V!24083 V!24083 (_ BitVec 32) Int) ListLongMap!8285)

(assert (=> b!815416 (= lt!364934 (getCurrentListMap!2335 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!364937 () ListLongMap!8285)

(declare-fun +!1823 (ListLongMap!8285 tuple2!9472) ListLongMap!8285)

(assert (=> b!815416 (= lt!364937 (+!1823 (getCurrentListMap!2335 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and start!70188 res!556841) b!815413))

(assert (= (and b!815413 res!556839) b!815412))

(assert (= (and b!815412 res!556843) b!815409))

(assert (= (and b!815409 res!556840) b!815410))

(assert (= (and b!815410 (not res!556842)) b!815416))

(assert (= (and b!815414 condMapEmpty!23053) mapIsEmpty!23053))

(assert (= (and b!815414 (not condMapEmpty!23053)) mapNonEmpty!23053))

(get-info :version)

(assert (= (and mapNonEmpty!23053 ((_ is ValueCellFull!6740) mapValue!23053)) b!815411))

(assert (= (and b!815414 ((_ is ValueCellFull!6740) mapDefault!23053)) b!815415))

(assert (= start!70188 b!815414))

(declare-fun m!756549 () Bool)

(assert (=> b!815416 m!756549))

(declare-fun m!756551 () Bool)

(assert (=> b!815416 m!756551))

(assert (=> b!815416 m!756551))

(declare-fun m!756553 () Bool)

(assert (=> b!815416 m!756553))

(declare-fun m!756555 () Bool)

(assert (=> b!815412 m!756555))

(declare-fun m!756557 () Bool)

(assert (=> b!815410 m!756557))

(declare-fun m!756559 () Bool)

(assert (=> b!815410 m!756559))

(declare-fun m!756561 () Bool)

(assert (=> b!815410 m!756561))

(declare-fun m!756563 () Bool)

(assert (=> mapNonEmpty!23053 m!756563))

(declare-fun m!756565 () Bool)

(assert (=> start!70188 m!756565))

(declare-fun m!756567 () Bool)

(assert (=> start!70188 m!756567))

(declare-fun m!756569 () Bool)

(assert (=> start!70188 m!756569))

(declare-fun m!756571 () Bool)

(assert (=> b!815409 m!756571))

(check-sat (not start!70188) (not b!815409) (not mapNonEmpty!23053) (not b!815410) (not b_next!12601) (not b!815416) b_and!21363 (not b!815412) tp_is_empty!14311)
(check-sat b_and!21363 (not b_next!12601))
