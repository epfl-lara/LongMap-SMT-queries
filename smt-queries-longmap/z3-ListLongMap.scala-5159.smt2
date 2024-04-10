; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69930 () Bool)

(assert start!69930)

(declare-fun b_free!12363 () Bool)

(declare-fun b_next!12363 () Bool)

(assert (=> start!69930 (= b_free!12363 (not b_next!12363))))

(declare-fun tp!43801 () Bool)

(declare-fun b_and!21131 () Bool)

(assert (=> start!69930 (= tp!43801 b_and!21131)))

(declare-fun b!812893 () Bool)

(declare-fun res!555408 () Bool)

(declare-fun e!450358 () Bool)

(assert (=> b!812893 (=> (not res!555408) (not e!450358))))

(declare-datatypes ((array!44362 0))(
  ( (array!44363 (arr!21242 (Array (_ BitVec 32) (_ BitVec 64))) (size!21663 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44362)

(declare-datatypes ((List!15110 0))(
  ( (Nil!15107) (Cons!15106 (h!16235 (_ BitVec 64)) (t!21425 List!15110)) )
))
(declare-fun arrayNoDuplicates!0 (array!44362 (_ BitVec 32) List!15110) Bool)

(assert (=> b!812893 (= res!555408 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15107))))

(declare-fun res!555411 () Bool)

(assert (=> start!69930 (=> (not res!555411) (not e!450358))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69930 (= res!555411 (validMask!0 mask!1312))))

(assert (=> start!69930 e!450358))

(declare-fun tp_is_empty!14073 () Bool)

(assert (=> start!69930 tp_is_empty!14073))

(declare-fun array_inv!17015 (array!44362) Bool)

(assert (=> start!69930 (array_inv!17015 _keys!976)))

(assert (=> start!69930 true))

(declare-datatypes ((V!23765 0))(
  ( (V!23766 (val!7084 Int)) )
))
(declare-datatypes ((ValueCell!6621 0))(
  ( (ValueCellFull!6621 (v!9511 V!23765)) (EmptyCell!6621) )
))
(declare-datatypes ((array!44364 0))(
  ( (array!44365 (arr!21243 (Array (_ BitVec 32) ValueCell!6621)) (size!21664 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44364)

(declare-fun e!450357 () Bool)

(declare-fun array_inv!17016 (array!44364) Bool)

(assert (=> start!69930 (and (array_inv!17016 _values!788) e!450357)))

(assert (=> start!69930 tp!43801))

(declare-fun b!812894 () Bool)

(assert (=> b!812894 (= e!450358 false)))

(declare-fun zeroValueBefore!34 () V!23765)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23765)

(declare-datatypes ((tuple2!9280 0))(
  ( (tuple2!9281 (_1!4651 (_ BitVec 64)) (_2!4651 V!23765)) )
))
(declare-datatypes ((List!15111 0))(
  ( (Nil!15108) (Cons!15107 (h!16236 tuple2!9280) (t!21426 List!15111)) )
))
(declare-datatypes ((ListLongMap!8103 0))(
  ( (ListLongMap!8104 (toList!4067 List!15111)) )
))
(declare-fun lt!364206 () ListLongMap!8103)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2117 (array!44362 array!44364 (_ BitVec 32) (_ BitVec 32) V!23765 V!23765 (_ BitVec 32) Int) ListLongMap!8103)

(assert (=> b!812894 (= lt!364206 (getCurrentListMapNoExtraKeys!2117 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!812895 () Bool)

(declare-fun res!555409 () Bool)

(assert (=> b!812895 (=> (not res!555409) (not e!450358))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812895 (= res!555409 (and (= (size!21664 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21663 _keys!976) (size!21664 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812896 () Bool)

(declare-fun e!450360 () Bool)

(declare-fun mapRes!22687 () Bool)

(assert (=> b!812896 (= e!450357 (and e!450360 mapRes!22687))))

(declare-fun condMapEmpty!22687 () Bool)

(declare-fun mapDefault!22687 () ValueCell!6621)

(assert (=> b!812896 (= condMapEmpty!22687 (= (arr!21243 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6621)) mapDefault!22687)))))

(declare-fun b!812897 () Bool)

(declare-fun e!450356 () Bool)

(assert (=> b!812897 (= e!450356 tp_is_empty!14073)))

(declare-fun mapNonEmpty!22687 () Bool)

(declare-fun tp!43800 () Bool)

(assert (=> mapNonEmpty!22687 (= mapRes!22687 (and tp!43800 e!450356))))

(declare-fun mapKey!22687 () (_ BitVec 32))

(declare-fun mapValue!22687 () ValueCell!6621)

(declare-fun mapRest!22687 () (Array (_ BitVec 32) ValueCell!6621))

(assert (=> mapNonEmpty!22687 (= (arr!21243 _values!788) (store mapRest!22687 mapKey!22687 mapValue!22687))))

(declare-fun mapIsEmpty!22687 () Bool)

(assert (=> mapIsEmpty!22687 mapRes!22687))

(declare-fun b!812898 () Bool)

(declare-fun res!555410 () Bool)

(assert (=> b!812898 (=> (not res!555410) (not e!450358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44362 (_ BitVec 32)) Bool)

(assert (=> b!812898 (= res!555410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812899 () Bool)

(assert (=> b!812899 (= e!450360 tp_is_empty!14073)))

(assert (= (and start!69930 res!555411) b!812895))

(assert (= (and b!812895 res!555409) b!812898))

(assert (= (and b!812898 res!555410) b!812893))

(assert (= (and b!812893 res!555408) b!812894))

(assert (= (and b!812896 condMapEmpty!22687) mapIsEmpty!22687))

(assert (= (and b!812896 (not condMapEmpty!22687)) mapNonEmpty!22687))

(get-info :version)

(assert (= (and mapNonEmpty!22687 ((_ is ValueCellFull!6621) mapValue!22687)) b!812897))

(assert (= (and b!812896 ((_ is ValueCellFull!6621) mapDefault!22687)) b!812899))

(assert (= start!69930 b!812896))

(declare-fun m!755117 () Bool)

(assert (=> start!69930 m!755117))

(declare-fun m!755119 () Bool)

(assert (=> start!69930 m!755119))

(declare-fun m!755121 () Bool)

(assert (=> start!69930 m!755121))

(declare-fun m!755123 () Bool)

(assert (=> b!812894 m!755123))

(declare-fun m!755125 () Bool)

(assert (=> mapNonEmpty!22687 m!755125))

(declare-fun m!755127 () Bool)

(assert (=> b!812893 m!755127))

(declare-fun m!755129 () Bool)

(assert (=> b!812898 m!755129))

(check-sat b_and!21131 (not b!812898) (not start!69930) tp_is_empty!14073 (not b!812894) (not b!812893) (not mapNonEmpty!22687) (not b_next!12363))
(check-sat b_and!21131 (not b_next!12363))
