; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70118 () Bool)

(assert start!70118)

(declare-fun b_free!12385 () Bool)

(declare-fun b_next!12385 () Bool)

(assert (=> start!70118 (= b_free!12385 (not b_next!12385))))

(declare-fun tp!43866 () Bool)

(declare-fun b_and!21163 () Bool)

(assert (=> start!70118 (= tp!43866 b_and!21163)))

(declare-fun mapNonEmpty!22720 () Bool)

(declare-fun mapRes!22720 () Bool)

(declare-fun tp!43867 () Bool)

(declare-fun e!451101 () Bool)

(assert (=> mapNonEmpty!22720 (= mapRes!22720 (and tp!43867 e!451101))))

(declare-datatypes ((V!23795 0))(
  ( (V!23796 (val!7095 Int)) )
))
(declare-datatypes ((ValueCell!6632 0))(
  ( (ValueCellFull!6632 (v!9522 V!23795)) (EmptyCell!6632) )
))
(declare-fun mapValue!22720 () ValueCell!6632)

(declare-fun mapKey!22720 () (_ BitVec 32))

(declare-datatypes ((array!44407 0))(
  ( (array!44408 (arr!21260 (Array (_ BitVec 32) ValueCell!6632)) (size!21680 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44407)

(declare-fun mapRest!22720 () (Array (_ BitVec 32) ValueCell!6632))

(assert (=> mapNonEmpty!22720 (= (arr!21260 _values!788) (store mapRest!22720 mapKey!22720 mapValue!22720))))

(declare-fun b!814018 () Bool)

(declare-fun res!555888 () Bool)

(declare-fun e!451099 () Bool)

(assert (=> b!814018 (=> (not res!555888) (not e!451099))))

(declare-datatypes ((array!44409 0))(
  ( (array!44410 (arr!21261 (Array (_ BitVec 32) (_ BitVec 64))) (size!21681 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44409)

(declare-datatypes ((List!15031 0))(
  ( (Nil!15028) (Cons!15027 (h!16162 (_ BitVec 64)) (t!21338 List!15031)) )
))
(declare-fun arrayNoDuplicates!0 (array!44409 (_ BitVec 32) List!15031) Bool)

(assert (=> b!814018 (= res!555888 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15028))))

(declare-fun b!814019 () Bool)

(declare-fun res!555886 () Bool)

(assert (=> b!814019 (=> (not res!555886) (not e!451099))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44409 (_ BitVec 32)) Bool)

(assert (=> b!814019 (= res!555886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814020 () Bool)

(declare-fun tp_is_empty!14095 () Bool)

(assert (=> b!814020 (= e!451101 tp_is_empty!14095)))

(declare-fun res!555889 () Bool)

(assert (=> start!70118 (=> (not res!555889) (not e!451099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70118 (= res!555889 (validMask!0 mask!1312))))

(assert (=> start!70118 e!451099))

(assert (=> start!70118 tp_is_empty!14095))

(declare-fun array_inv!17083 (array!44409) Bool)

(assert (=> start!70118 (array_inv!17083 _keys!976)))

(assert (=> start!70118 true))

(declare-fun e!451103 () Bool)

(declare-fun array_inv!17084 (array!44407) Bool)

(assert (=> start!70118 (and (array_inv!17084 _values!788) e!451103)))

(assert (=> start!70118 tp!43866))

(declare-fun b!814021 () Bool)

(assert (=> b!814021 (= e!451099 false)))

(declare-fun zeroValueBefore!34 () V!23795)

(declare-datatypes ((tuple2!9212 0))(
  ( (tuple2!9213 (_1!4617 (_ BitVec 64)) (_2!4617 V!23795)) )
))
(declare-datatypes ((List!15032 0))(
  ( (Nil!15029) (Cons!15028 (h!16163 tuple2!9212) (t!21339 List!15032)) )
))
(declare-datatypes ((ListLongMap!8037 0))(
  ( (ListLongMap!8038 (toList!4034 List!15032)) )
))
(declare-fun lt!364593 () ListLongMap!8037)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23795)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2141 (array!44409 array!44407 (_ BitVec 32) (_ BitVec 32) V!23795 V!23795 (_ BitVec 32) Int) ListLongMap!8037)

(assert (=> b!814021 (= lt!364593 (getCurrentListMapNoExtraKeys!2141 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22720 () Bool)

(assert (=> mapIsEmpty!22720 mapRes!22720))

(declare-fun b!814022 () Bool)

(declare-fun e!451102 () Bool)

(assert (=> b!814022 (= e!451103 (and e!451102 mapRes!22720))))

(declare-fun condMapEmpty!22720 () Bool)

(declare-fun mapDefault!22720 () ValueCell!6632)

(assert (=> b!814022 (= condMapEmpty!22720 (= (arr!21260 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6632)) mapDefault!22720)))))

(declare-fun b!814023 () Bool)

(assert (=> b!814023 (= e!451102 tp_is_empty!14095)))

(declare-fun b!814024 () Bool)

(declare-fun res!555887 () Bool)

(assert (=> b!814024 (=> (not res!555887) (not e!451099))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814024 (= res!555887 (and (= (size!21680 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21681 _keys!976) (size!21680 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70118 res!555889) b!814024))

(assert (= (and b!814024 res!555887) b!814019))

(assert (= (and b!814019 res!555886) b!814018))

(assert (= (and b!814018 res!555888) b!814021))

(assert (= (and b!814022 condMapEmpty!22720) mapIsEmpty!22720))

(assert (= (and b!814022 (not condMapEmpty!22720)) mapNonEmpty!22720))

(get-info :version)

(assert (= (and mapNonEmpty!22720 ((_ is ValueCellFull!6632) mapValue!22720)) b!814020))

(assert (= (and b!814022 ((_ is ValueCellFull!6632) mapDefault!22720)) b!814023))

(assert (= start!70118 b!814022))

(declare-fun m!756553 () Bool)

(assert (=> start!70118 m!756553))

(declare-fun m!756555 () Bool)

(assert (=> start!70118 m!756555))

(declare-fun m!756557 () Bool)

(assert (=> start!70118 m!756557))

(declare-fun m!756559 () Bool)

(assert (=> b!814019 m!756559))

(declare-fun m!756561 () Bool)

(assert (=> mapNonEmpty!22720 m!756561))

(declare-fun m!756563 () Bool)

(assert (=> b!814018 m!756563))

(declare-fun m!756565 () Bool)

(assert (=> b!814021 m!756565))

(check-sat b_and!21163 (not b!814021) (not b_next!12385) (not b!814019) tp_is_empty!14095 (not b!814018) (not start!70118) (not mapNonEmpty!22720))
(check-sat b_and!21163 (not b_next!12385))
