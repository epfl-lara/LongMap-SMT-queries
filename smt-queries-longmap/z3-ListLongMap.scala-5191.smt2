; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70126 () Bool)

(assert start!70126)

(declare-fun b_free!12553 () Bool)

(declare-fun b_next!12553 () Bool)

(assert (=> start!70126 (= b_free!12553 (not b_next!12553))))

(declare-fun tp!44376 () Bool)

(declare-fun b_and!21307 () Bool)

(assert (=> start!70126 (= tp!44376 b_and!21307)))

(declare-fun b!814800 () Bool)

(declare-fun res!556501 () Bool)

(declare-fun e!451735 () Bool)

(assert (=> b!814800 (=> (not res!556501) (not e!451735))))

(declare-datatypes ((array!44719 0))(
  ( (array!44720 (arr!21419 (Array (_ BitVec 32) (_ BitVec 64))) (size!21840 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44719)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24019 0))(
  ( (V!24020 (val!7179 Int)) )
))
(declare-datatypes ((ValueCell!6716 0))(
  ( (ValueCellFull!6716 (v!9600 V!24019)) (EmptyCell!6716) )
))
(declare-datatypes ((array!44721 0))(
  ( (array!44722 (arr!21420 (Array (_ BitVec 32) ValueCell!6716)) (size!21841 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44721)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!814800 (= res!556501 (and (= (size!21841 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21840 _keys!976) (size!21841 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814801 () Bool)

(declare-fun e!451738 () Bool)

(declare-fun tp_is_empty!14263 () Bool)

(assert (=> b!814801 (= e!451738 tp_is_empty!14263)))

(declare-fun b!814802 () Bool)

(assert (=> b!814802 (= e!451735 (not true))))

(declare-datatypes ((tuple2!9438 0))(
  ( (tuple2!9439 (_1!4730 (_ BitVec 64)) (_2!4730 V!24019)) )
))
(declare-datatypes ((List!15267 0))(
  ( (Nil!15264) (Cons!15263 (h!16392 tuple2!9438) (t!21577 List!15267)) )
))
(declare-datatypes ((ListLongMap!8251 0))(
  ( (ListLongMap!8252 (toList!4141 List!15267)) )
))
(declare-fun lt!364639 () ListLongMap!8251)

(declare-fun lt!364638 () ListLongMap!8251)

(assert (=> b!814802 (= lt!364639 lt!364638)))

(declare-fun zeroValueBefore!34 () V!24019)

(declare-datatypes ((Unit!27716 0))(
  ( (Unit!27717) )
))
(declare-fun lt!364637 () Unit!27716)

(declare-fun zeroValueAfter!34 () V!24019)

(declare-fun minValue!754 () V!24019)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!299 (array!44719 array!44721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24019 V!24019 V!24019 V!24019 (_ BitVec 32) Int) Unit!27716)

(assert (=> b!814802 (= lt!364637 (lemmaNoChangeToArrayThenSameMapNoExtras!299 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2206 (array!44719 array!44721 (_ BitVec 32) (_ BitVec 32) V!24019 V!24019 (_ BitVec 32) Int) ListLongMap!8251)

(assert (=> b!814802 (= lt!364638 (getCurrentListMapNoExtraKeys!2206 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814802 (= lt!364639 (getCurrentListMapNoExtraKeys!2206 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814803 () Bool)

(declare-fun e!451737 () Bool)

(declare-fun e!451734 () Bool)

(declare-fun mapRes!22978 () Bool)

(assert (=> b!814803 (= e!451737 (and e!451734 mapRes!22978))))

(declare-fun condMapEmpty!22978 () Bool)

(declare-fun mapDefault!22978 () ValueCell!6716)

(assert (=> b!814803 (= condMapEmpty!22978 (= (arr!21420 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6716)) mapDefault!22978)))))

(declare-fun b!814804 () Bool)

(assert (=> b!814804 (= e!451734 tp_is_empty!14263)))

(declare-fun b!814805 () Bool)

(declare-fun res!556500 () Bool)

(assert (=> b!814805 (=> (not res!556500) (not e!451735))))

(declare-datatypes ((List!15268 0))(
  ( (Nil!15265) (Cons!15264 (h!16393 (_ BitVec 64)) (t!21578 List!15268)) )
))
(declare-fun arrayNoDuplicates!0 (array!44719 (_ BitVec 32) List!15268) Bool)

(assert (=> b!814805 (= res!556500 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15265))))

(declare-fun mapNonEmpty!22978 () Bool)

(declare-fun tp!44377 () Bool)

(assert (=> mapNonEmpty!22978 (= mapRes!22978 (and tp!44377 e!451738))))

(declare-fun mapValue!22978 () ValueCell!6716)

(declare-fun mapKey!22978 () (_ BitVec 32))

(declare-fun mapRest!22978 () (Array (_ BitVec 32) ValueCell!6716))

(assert (=> mapNonEmpty!22978 (= (arr!21420 _values!788) (store mapRest!22978 mapKey!22978 mapValue!22978))))

(declare-fun b!814806 () Bool)

(declare-fun res!556503 () Bool)

(assert (=> b!814806 (=> (not res!556503) (not e!451735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44719 (_ BitVec 32)) Bool)

(assert (=> b!814806 (= res!556503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556502 () Bool)

(assert (=> start!70126 (=> (not res!556502) (not e!451735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70126 (= res!556502 (validMask!0 mask!1312))))

(assert (=> start!70126 e!451735))

(assert (=> start!70126 tp_is_empty!14263))

(declare-fun array_inv!17217 (array!44719) Bool)

(assert (=> start!70126 (array_inv!17217 _keys!976)))

(assert (=> start!70126 true))

(declare-fun array_inv!17218 (array!44721) Bool)

(assert (=> start!70126 (and (array_inv!17218 _values!788) e!451737)))

(assert (=> start!70126 tp!44376))

(declare-fun mapIsEmpty!22978 () Bool)

(assert (=> mapIsEmpty!22978 mapRes!22978))

(assert (= (and start!70126 res!556502) b!814800))

(assert (= (and b!814800 res!556501) b!814806))

(assert (= (and b!814806 res!556503) b!814805))

(assert (= (and b!814805 res!556500) b!814802))

(assert (= (and b!814803 condMapEmpty!22978) mapIsEmpty!22978))

(assert (= (and b!814803 (not condMapEmpty!22978)) mapNonEmpty!22978))

(get-info :version)

(assert (= (and mapNonEmpty!22978 ((_ is ValueCellFull!6716) mapValue!22978)) b!814801))

(assert (= (and b!814803 ((_ is ValueCellFull!6716) mapDefault!22978)) b!814804))

(assert (= start!70126 b!814803))

(declare-fun m!756015 () Bool)

(assert (=> start!70126 m!756015))

(declare-fun m!756017 () Bool)

(assert (=> start!70126 m!756017))

(declare-fun m!756019 () Bool)

(assert (=> start!70126 m!756019))

(declare-fun m!756021 () Bool)

(assert (=> b!814805 m!756021))

(declare-fun m!756023 () Bool)

(assert (=> mapNonEmpty!22978 m!756023))

(declare-fun m!756025 () Bool)

(assert (=> b!814806 m!756025))

(declare-fun m!756027 () Bool)

(assert (=> b!814802 m!756027))

(declare-fun m!756029 () Bool)

(assert (=> b!814802 m!756029))

(declare-fun m!756031 () Bool)

(assert (=> b!814802 m!756031))

(check-sat (not b!814805) (not mapNonEmpty!22978) (not b!814806) tp_is_empty!14263 (not b!814802) (not start!70126) (not b_next!12553) b_and!21307)
(check-sat b_and!21307 (not b_next!12553))
