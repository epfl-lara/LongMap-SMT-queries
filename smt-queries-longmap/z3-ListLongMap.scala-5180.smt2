; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70046 () Bool)

(assert start!70046)

(declare-fun b_free!12487 () Bool)

(declare-fun b_next!12487 () Bool)

(assert (=> start!70046 (= b_free!12487 (not b_next!12487))))

(declare-fun tp!44176 () Bool)

(declare-fun b_and!21233 () Bool)

(assert (=> start!70046 (= tp!44176 b_and!21233)))

(declare-fun b!814022 () Bool)

(declare-fun res!556075 () Bool)

(declare-fun e!451186 () Bool)

(assert (=> b!814022 (=> (not res!556075) (not e!451186))))

(declare-datatypes ((array!44593 0))(
  ( (array!44594 (arr!21357 (Array (_ BitVec 32) (_ BitVec 64))) (size!21778 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44593)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44593 (_ BitVec 32)) Bool)

(assert (=> b!814022 (= res!556075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814023 () Bool)

(declare-fun res!556076 () Bool)

(assert (=> b!814023 (=> (not res!556076) (not e!451186))))

(declare-datatypes ((List!15224 0))(
  ( (Nil!15221) (Cons!15220 (h!16349 (_ BitVec 64)) (t!21532 List!15224)) )
))
(declare-fun arrayNoDuplicates!0 (array!44593 (_ BitVec 32) List!15224) Bool)

(assert (=> b!814023 (= res!556076 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15221))))

(declare-fun b!814025 () Bool)

(assert (=> b!814025 (= e!451186 (not true))))

(declare-datatypes ((V!23931 0))(
  ( (V!23932 (val!7146 Int)) )
))
(declare-datatypes ((tuple2!9398 0))(
  ( (tuple2!9399 (_1!4710 (_ BitVec 64)) (_2!4710 V!23931)) )
))
(declare-datatypes ((List!15225 0))(
  ( (Nil!15222) (Cons!15221 (h!16350 tuple2!9398) (t!21533 List!15225)) )
))
(declare-datatypes ((ListLongMap!8211 0))(
  ( (ListLongMap!8212 (toList!4121 List!15225)) )
))
(declare-fun lt!364300 () ListLongMap!8211)

(declare-fun lt!364301 () ListLongMap!8211)

(assert (=> b!814025 (= lt!364300 lt!364301)))

(declare-fun zeroValueBefore!34 () V!23931)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23931)

(declare-fun minValue!754 () V!23931)

(declare-datatypes ((ValueCell!6683 0))(
  ( (ValueCellFull!6683 (v!9567 V!23931)) (EmptyCell!6683) )
))
(declare-datatypes ((array!44595 0))(
  ( (array!44596 (arr!21358 (Array (_ BitVec 32) ValueCell!6683)) (size!21779 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44595)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27676 0))(
  ( (Unit!27677) )
))
(declare-fun lt!364302 () Unit!27676)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!279 (array!44593 array!44595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23931 V!23931 V!23931 V!23931 (_ BitVec 32) Int) Unit!27676)

(assert (=> b!814025 (= lt!364302 (lemmaNoChangeToArrayThenSameMapNoExtras!279 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2186 (array!44593 array!44595 (_ BitVec 32) (_ BitVec 32) V!23931 V!23931 (_ BitVec 32) Int) ListLongMap!8211)

(assert (=> b!814025 (= lt!364301 (getCurrentListMapNoExtraKeys!2186 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814025 (= lt!364300 (getCurrentListMapNoExtraKeys!2186 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22876 () Bool)

(declare-fun mapRes!22876 () Bool)

(declare-fun tp!44175 () Bool)

(declare-fun e!451185 () Bool)

(assert (=> mapNonEmpty!22876 (= mapRes!22876 (and tp!44175 e!451185))))

(declare-fun mapValue!22876 () ValueCell!6683)

(declare-fun mapKey!22876 () (_ BitVec 32))

(declare-fun mapRest!22876 () (Array (_ BitVec 32) ValueCell!6683))

(assert (=> mapNonEmpty!22876 (= (arr!21358 _values!788) (store mapRest!22876 mapKey!22876 mapValue!22876))))

(declare-fun b!814026 () Bool)

(declare-fun e!451188 () Bool)

(declare-fun e!451184 () Bool)

(assert (=> b!814026 (= e!451188 (and e!451184 mapRes!22876))))

(declare-fun condMapEmpty!22876 () Bool)

(declare-fun mapDefault!22876 () ValueCell!6683)

(assert (=> b!814026 (= condMapEmpty!22876 (= (arr!21358 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6683)) mapDefault!22876)))))

(declare-fun mapIsEmpty!22876 () Bool)

(assert (=> mapIsEmpty!22876 mapRes!22876))

(declare-fun b!814027 () Bool)

(declare-fun res!556074 () Bool)

(assert (=> b!814027 (=> (not res!556074) (not e!451186))))

(assert (=> b!814027 (= res!556074 (and (= (size!21779 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21778 _keys!976) (size!21779 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814028 () Bool)

(declare-fun tp_is_empty!14197 () Bool)

(assert (=> b!814028 (= e!451185 tp_is_empty!14197)))

(declare-fun b!814024 () Bool)

(assert (=> b!814024 (= e!451184 tp_is_empty!14197)))

(declare-fun res!556073 () Bool)

(assert (=> start!70046 (=> (not res!556073) (not e!451186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70046 (= res!556073 (validMask!0 mask!1312))))

(assert (=> start!70046 e!451186))

(assert (=> start!70046 tp_is_empty!14197))

(declare-fun array_inv!17177 (array!44593) Bool)

(assert (=> start!70046 (array_inv!17177 _keys!976)))

(assert (=> start!70046 true))

(declare-fun array_inv!17178 (array!44595) Bool)

(assert (=> start!70046 (and (array_inv!17178 _values!788) e!451188)))

(assert (=> start!70046 tp!44176))

(assert (= (and start!70046 res!556073) b!814027))

(assert (= (and b!814027 res!556074) b!814022))

(assert (= (and b!814022 res!556075) b!814023))

(assert (= (and b!814023 res!556076) b!814025))

(assert (= (and b!814026 condMapEmpty!22876) mapIsEmpty!22876))

(assert (= (and b!814026 (not condMapEmpty!22876)) mapNonEmpty!22876))

(get-info :version)

(assert (= (and mapNonEmpty!22876 ((_ is ValueCellFull!6683) mapValue!22876)) b!814028))

(assert (= (and b!814026 ((_ is ValueCellFull!6683) mapDefault!22876)) b!814024))

(assert (= start!70046 b!814026))

(declare-fun m!755355 () Bool)

(assert (=> mapNonEmpty!22876 m!755355))

(declare-fun m!755357 () Bool)

(assert (=> b!814022 m!755357))

(declare-fun m!755359 () Bool)

(assert (=> b!814025 m!755359))

(declare-fun m!755361 () Bool)

(assert (=> b!814025 m!755361))

(declare-fun m!755363 () Bool)

(assert (=> b!814025 m!755363))

(declare-fun m!755365 () Bool)

(assert (=> b!814023 m!755365))

(declare-fun m!755367 () Bool)

(assert (=> start!70046 m!755367))

(declare-fun m!755369 () Bool)

(assert (=> start!70046 m!755369))

(declare-fun m!755371 () Bool)

(assert (=> start!70046 m!755371))

(check-sat (not b!814022) (not b!814025) (not b_next!12487) (not mapNonEmpty!22876) tp_is_empty!14197 (not b!814023) (not start!70046) b_and!21233)
(check-sat b_and!21233 (not b_next!12487))
