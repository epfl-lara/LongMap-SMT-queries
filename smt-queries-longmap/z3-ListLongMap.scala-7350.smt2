; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94040 () Bool)

(assert start!94040)

(declare-fun b_free!21277 () Bool)

(declare-fun b_next!21277 () Bool)

(assert (=> start!94040 (= b_free!21277 (not b_next!21277))))

(declare-fun tp!75254 () Bool)

(declare-fun b_and!34001 () Bool)

(assert (=> start!94040 (= tp!75254 b_and!34001)))

(declare-fun b!1062297 () Bool)

(declare-fun e!604967 () Bool)

(declare-fun e!604964 () Bool)

(declare-fun mapRes!39301 () Bool)

(assert (=> b!1062297 (= e!604967 (and e!604964 mapRes!39301))))

(declare-fun condMapEmpty!39301 () Bool)

(declare-datatypes ((V!38585 0))(
  ( (V!38586 (val!12594 Int)) )
))
(declare-datatypes ((ValueCell!11840 0))(
  ( (ValueCellFull!11840 (v!15200 V!38585)) (EmptyCell!11840) )
))
(declare-datatypes ((array!67233 0))(
  ( (array!67234 (arr!32318 (Array (_ BitVec 32) ValueCell!11840)) (size!32855 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67233)

(declare-fun mapDefault!39301 () ValueCell!11840)

(assert (=> b!1062297 (= condMapEmpty!39301 (= (arr!32318 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11840)) mapDefault!39301)))))

(declare-fun b!1062298 () Bool)

(declare-fun res!709075 () Bool)

(declare-fun e!604968 () Bool)

(assert (=> b!1062298 (=> (not res!709075) (not e!604968))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67235 0))(
  ( (array!67236 (arr!32319 (Array (_ BitVec 32) (_ BitVec 64))) (size!32856 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67235)

(assert (=> b!1062298 (= res!709075 (and (= (size!32855 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32856 _keys!1163) (size!32855 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39301 () Bool)

(declare-fun tp!75253 () Bool)

(declare-fun e!604965 () Bool)

(assert (=> mapNonEmpty!39301 (= mapRes!39301 (and tp!75253 e!604965))))

(declare-fun mapRest!39301 () (Array (_ BitVec 32) ValueCell!11840))

(declare-fun mapValue!39301 () ValueCell!11840)

(declare-fun mapKey!39301 () (_ BitVec 32))

(assert (=> mapNonEmpty!39301 (= (arr!32318 _values!955) (store mapRest!39301 mapKey!39301 mapValue!39301))))

(declare-fun b!1062299 () Bool)

(declare-fun tp_is_empty!25087 () Bool)

(assert (=> b!1062299 (= e!604965 tp_is_empty!25087)))

(declare-fun b!1062300 () Bool)

(declare-fun res!709076 () Bool)

(assert (=> b!1062300 (=> (not res!709076) (not e!604968))))

(declare-datatypes ((List!22491 0))(
  ( (Nil!22488) (Cons!22487 (h!23705 (_ BitVec 64)) (t!31792 List!22491)) )
))
(declare-fun arrayNoDuplicates!0 (array!67235 (_ BitVec 32) List!22491) Bool)

(assert (=> b!1062300 (= res!709076 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22488))))

(declare-fun b!1062301 () Bool)

(assert (=> b!1062301 (= e!604968 false)))

(declare-datatypes ((tuple2!15908 0))(
  ( (tuple2!15909 (_1!7965 (_ BitVec 64)) (_2!7965 V!38585)) )
))
(declare-datatypes ((List!22492 0))(
  ( (Nil!22489) (Cons!22488 (h!23706 tuple2!15908) (t!31793 List!22492)) )
))
(declare-datatypes ((ListLongMap!13885 0))(
  ( (ListLongMap!13886 (toList!6958 List!22492)) )
))
(declare-fun lt!467945 () ListLongMap!13885)

(declare-fun minValue!907 () V!38585)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38585)

(declare-fun getCurrentListMapNoExtraKeys!3606 (array!67235 array!67233 (_ BitVec 32) (_ BitVec 32) V!38585 V!38585 (_ BitVec 32) Int) ListLongMap!13885)

(assert (=> b!1062301 (= lt!467945 (getCurrentListMapNoExtraKeys!3606 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38585)

(declare-fun lt!467946 () ListLongMap!13885)

(assert (=> b!1062301 (= lt!467946 (getCurrentListMapNoExtraKeys!3606 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062302 () Bool)

(declare-fun res!709078 () Bool)

(assert (=> b!1062302 (=> (not res!709078) (not e!604968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67235 (_ BitVec 32)) Bool)

(assert (=> b!1062302 (= res!709078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!709077 () Bool)

(assert (=> start!94040 (=> (not res!709077) (not e!604968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94040 (= res!709077 (validMask!0 mask!1515))))

(assert (=> start!94040 e!604968))

(assert (=> start!94040 true))

(assert (=> start!94040 tp_is_empty!25087))

(declare-fun array_inv!25056 (array!67233) Bool)

(assert (=> start!94040 (and (array_inv!25056 _values!955) e!604967)))

(assert (=> start!94040 tp!75254))

(declare-fun array_inv!25057 (array!67235) Bool)

(assert (=> start!94040 (array_inv!25057 _keys!1163)))

(declare-fun mapIsEmpty!39301 () Bool)

(assert (=> mapIsEmpty!39301 mapRes!39301))

(declare-fun b!1062303 () Bool)

(assert (=> b!1062303 (= e!604964 tp_is_empty!25087)))

(assert (= (and start!94040 res!709077) b!1062298))

(assert (= (and b!1062298 res!709075) b!1062302))

(assert (= (and b!1062302 res!709078) b!1062300))

(assert (= (and b!1062300 res!709076) b!1062301))

(assert (= (and b!1062297 condMapEmpty!39301) mapIsEmpty!39301))

(assert (= (and b!1062297 (not condMapEmpty!39301)) mapNonEmpty!39301))

(get-info :version)

(assert (= (and mapNonEmpty!39301 ((_ is ValueCellFull!11840) mapValue!39301)) b!1062299))

(assert (= (and b!1062297 ((_ is ValueCellFull!11840) mapDefault!39301)) b!1062303))

(assert (= start!94040 b!1062297))

(declare-fun m!981583 () Bool)

(assert (=> b!1062301 m!981583))

(declare-fun m!981585 () Bool)

(assert (=> b!1062301 m!981585))

(declare-fun m!981587 () Bool)

(assert (=> start!94040 m!981587))

(declare-fun m!981589 () Bool)

(assert (=> start!94040 m!981589))

(declare-fun m!981591 () Bool)

(assert (=> start!94040 m!981591))

(declare-fun m!981593 () Bool)

(assert (=> b!1062300 m!981593))

(declare-fun m!981595 () Bool)

(assert (=> mapNonEmpty!39301 m!981595))

(declare-fun m!981597 () Bool)

(assert (=> b!1062302 m!981597))

(check-sat (not mapNonEmpty!39301) (not b_next!21277) (not b!1062301) b_and!34001 (not b!1062300) (not start!94040) (not b!1062302) tp_is_empty!25087)
(check-sat b_and!34001 (not b_next!21277))
