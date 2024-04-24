; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70124 () Bool)

(assert start!70124)

(declare-fun b_free!12391 () Bool)

(declare-fun b_next!12391 () Bool)

(assert (=> start!70124 (= b_free!12391 (not b_next!12391))))

(declare-fun tp!43884 () Bool)

(declare-fun b_and!21169 () Bool)

(assert (=> start!70124 (= tp!43884 b_and!21169)))

(declare-fun b!814081 () Bool)

(declare-fun res!555925 () Bool)

(declare-fun e!451147 () Bool)

(assert (=> b!814081 (=> (not res!555925) (not e!451147))))

(declare-datatypes ((array!44419 0))(
  ( (array!44420 (arr!21266 (Array (_ BitVec 32) (_ BitVec 64))) (size!21686 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44419)

(declare-datatypes ((List!15035 0))(
  ( (Nil!15032) (Cons!15031 (h!16166 (_ BitVec 64)) (t!21342 List!15035)) )
))
(declare-fun arrayNoDuplicates!0 (array!44419 (_ BitVec 32) List!15035) Bool)

(assert (=> b!814081 (= res!555925 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15032))))

(declare-fun b!814082 () Bool)

(declare-fun res!555923 () Bool)

(assert (=> b!814082 (=> (not res!555923) (not e!451147))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44419 (_ BitVec 32)) Bool)

(assert (=> b!814082 (= res!555923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814083 () Bool)

(assert (=> b!814083 (= e!451147 false)))

(declare-datatypes ((V!23803 0))(
  ( (V!23804 (val!7098 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23803)

(declare-datatypes ((tuple2!9216 0))(
  ( (tuple2!9217 (_1!4619 (_ BitVec 64)) (_2!4619 V!23803)) )
))
(declare-datatypes ((List!15036 0))(
  ( (Nil!15033) (Cons!15032 (h!16167 tuple2!9216) (t!21343 List!15036)) )
))
(declare-datatypes ((ListLongMap!8041 0))(
  ( (ListLongMap!8042 (toList!4036 List!15036)) )
))
(declare-fun lt!364602 () ListLongMap!8041)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23803)

(declare-datatypes ((ValueCell!6635 0))(
  ( (ValueCellFull!6635 (v!9525 V!23803)) (EmptyCell!6635) )
))
(declare-datatypes ((array!44421 0))(
  ( (array!44422 (arr!21267 (Array (_ BitVec 32) ValueCell!6635)) (size!21687 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44421)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2143 (array!44419 array!44421 (_ BitVec 32) (_ BitVec 32) V!23803 V!23803 (_ BitVec 32) Int) ListLongMap!8041)

(assert (=> b!814083 (= lt!364602 (getCurrentListMapNoExtraKeys!2143 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22729 () Bool)

(declare-fun mapRes!22729 () Bool)

(declare-fun tp!43885 () Bool)

(declare-fun e!451145 () Bool)

(assert (=> mapNonEmpty!22729 (= mapRes!22729 (and tp!43885 e!451145))))

(declare-fun mapKey!22729 () (_ BitVec 32))

(declare-fun mapValue!22729 () ValueCell!6635)

(declare-fun mapRest!22729 () (Array (_ BitVec 32) ValueCell!6635))

(assert (=> mapNonEmpty!22729 (= (arr!21267 _values!788) (store mapRest!22729 mapKey!22729 mapValue!22729))))

(declare-fun mapIsEmpty!22729 () Bool)

(assert (=> mapIsEmpty!22729 mapRes!22729))

(declare-fun res!555922 () Bool)

(assert (=> start!70124 (=> (not res!555922) (not e!451147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70124 (= res!555922 (validMask!0 mask!1312))))

(assert (=> start!70124 e!451147))

(declare-fun tp_is_empty!14101 () Bool)

(assert (=> start!70124 tp_is_empty!14101))

(declare-fun array_inv!17085 (array!44419) Bool)

(assert (=> start!70124 (array_inv!17085 _keys!976)))

(assert (=> start!70124 true))

(declare-fun e!451146 () Bool)

(declare-fun array_inv!17086 (array!44421) Bool)

(assert (=> start!70124 (and (array_inv!17086 _values!788) e!451146)))

(assert (=> start!70124 tp!43884))

(declare-fun b!814084 () Bool)

(assert (=> b!814084 (= e!451145 tp_is_empty!14101)))

(declare-fun b!814085 () Bool)

(declare-fun res!555924 () Bool)

(assert (=> b!814085 (=> (not res!555924) (not e!451147))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814085 (= res!555924 (and (= (size!21687 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21686 _keys!976) (size!21687 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814086 () Bool)

(declare-fun e!451148 () Bool)

(assert (=> b!814086 (= e!451148 tp_is_empty!14101)))

(declare-fun b!814087 () Bool)

(assert (=> b!814087 (= e!451146 (and e!451148 mapRes!22729))))

(declare-fun condMapEmpty!22729 () Bool)

(declare-fun mapDefault!22729 () ValueCell!6635)

(assert (=> b!814087 (= condMapEmpty!22729 (= (arr!21267 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6635)) mapDefault!22729)))))

(assert (= (and start!70124 res!555922) b!814085))

(assert (= (and b!814085 res!555924) b!814082))

(assert (= (and b!814082 res!555923) b!814081))

(assert (= (and b!814081 res!555925) b!814083))

(assert (= (and b!814087 condMapEmpty!22729) mapIsEmpty!22729))

(assert (= (and b!814087 (not condMapEmpty!22729)) mapNonEmpty!22729))

(get-info :version)

(assert (= (and mapNonEmpty!22729 ((_ is ValueCellFull!6635) mapValue!22729)) b!814084))

(assert (= (and b!814087 ((_ is ValueCellFull!6635) mapDefault!22729)) b!814086))

(assert (= start!70124 b!814087))

(declare-fun m!756595 () Bool)

(assert (=> mapNonEmpty!22729 m!756595))

(declare-fun m!756597 () Bool)

(assert (=> b!814081 m!756597))

(declare-fun m!756599 () Bool)

(assert (=> b!814083 m!756599))

(declare-fun m!756601 () Bool)

(assert (=> b!814082 m!756601))

(declare-fun m!756603 () Bool)

(assert (=> start!70124 m!756603))

(declare-fun m!756605 () Bool)

(assert (=> start!70124 m!756605))

(declare-fun m!756607 () Bool)

(assert (=> start!70124 m!756607))

(check-sat (not start!70124) (not b!814081) (not mapNonEmpty!22729) (not b_next!12391) (not b!814083) tp_is_empty!14101 (not b!814082) b_and!21169)
(check-sat b_and!21169 (not b_next!12391))
