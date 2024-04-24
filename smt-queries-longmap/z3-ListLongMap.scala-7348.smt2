; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94028 () Bool)

(assert start!94028)

(declare-fun b_free!21265 () Bool)

(declare-fun b_next!21265 () Bool)

(assert (=> start!94028 (= b_free!21265 (not b_next!21265))))

(declare-fun tp!75217 () Bool)

(declare-fun b_and!33989 () Bool)

(assert (=> start!94028 (= tp!75217 b_and!33989)))

(declare-fun mapIsEmpty!39283 () Bool)

(declare-fun mapRes!39283 () Bool)

(assert (=> mapIsEmpty!39283 mapRes!39283))

(declare-fun b!1062172 () Bool)

(declare-fun e!604876 () Bool)

(declare-fun tp_is_empty!25075 () Bool)

(assert (=> b!1062172 (= e!604876 tp_is_empty!25075)))

(declare-fun mapNonEmpty!39283 () Bool)

(declare-fun tp!75218 () Bool)

(assert (=> mapNonEmpty!39283 (= mapRes!39283 (and tp!75218 e!604876))))

(declare-datatypes ((V!38569 0))(
  ( (V!38570 (val!12588 Int)) )
))
(declare-datatypes ((ValueCell!11834 0))(
  ( (ValueCellFull!11834 (v!15194 V!38569)) (EmptyCell!11834) )
))
(declare-fun mapRest!39283 () (Array (_ BitVec 32) ValueCell!11834))

(declare-fun mapValue!39283 () ValueCell!11834)

(declare-fun mapKey!39283 () (_ BitVec 32))

(declare-datatypes ((array!67211 0))(
  ( (array!67212 (arr!32307 (Array (_ BitVec 32) ValueCell!11834)) (size!32844 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67211)

(assert (=> mapNonEmpty!39283 (= (arr!32307 _values!955) (store mapRest!39283 mapKey!39283 mapValue!39283))))

(declare-fun b!1062173 () Bool)

(declare-fun res!709003 () Bool)

(declare-fun e!604878 () Bool)

(assert (=> b!1062173 (=> (not res!709003) (not e!604878))))

(declare-datatypes ((array!67213 0))(
  ( (array!67214 (arr!32308 (Array (_ BitVec 32) (_ BitVec 64))) (size!32845 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67213)

(declare-datatypes ((List!22483 0))(
  ( (Nil!22480) (Cons!22479 (h!23697 (_ BitVec 64)) (t!31784 List!22483)) )
))
(declare-fun arrayNoDuplicates!0 (array!67213 (_ BitVec 32) List!22483) Bool)

(assert (=> b!1062173 (= res!709003 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22480))))

(declare-fun b!1062174 () Bool)

(declare-fun res!709004 () Bool)

(assert (=> b!1062174 (=> (not res!709004) (not e!604878))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67213 (_ BitVec 32)) Bool)

(assert (=> b!1062174 (= res!709004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062171 () Bool)

(declare-fun res!709005 () Bool)

(assert (=> b!1062171 (=> (not res!709005) (not e!604878))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062171 (= res!709005 (and (= (size!32844 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32845 _keys!1163) (size!32844 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!709006 () Bool)

(assert (=> start!94028 (=> (not res!709006) (not e!604878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94028 (= res!709006 (validMask!0 mask!1515))))

(assert (=> start!94028 e!604878))

(assert (=> start!94028 true))

(assert (=> start!94028 tp_is_empty!25075))

(declare-fun e!604875 () Bool)

(declare-fun array_inv!25046 (array!67211) Bool)

(assert (=> start!94028 (and (array_inv!25046 _values!955) e!604875)))

(assert (=> start!94028 tp!75217))

(declare-fun array_inv!25047 (array!67213) Bool)

(assert (=> start!94028 (array_inv!25047 _keys!1163)))

(declare-fun b!1062175 () Bool)

(declare-fun e!604877 () Bool)

(assert (=> b!1062175 (= e!604877 tp_is_empty!25075)))

(declare-fun b!1062176 () Bool)

(assert (=> b!1062176 (= e!604875 (and e!604877 mapRes!39283))))

(declare-fun condMapEmpty!39283 () Bool)

(declare-fun mapDefault!39283 () ValueCell!11834)

(assert (=> b!1062176 (= condMapEmpty!39283 (= (arr!32307 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11834)) mapDefault!39283)))))

(declare-fun b!1062177 () Bool)

(assert (=> b!1062177 (= e!604878 false)))

(declare-datatypes ((tuple2!15900 0))(
  ( (tuple2!15901 (_1!7961 (_ BitVec 64)) (_2!7961 V!38569)) )
))
(declare-datatypes ((List!22484 0))(
  ( (Nil!22481) (Cons!22480 (h!23698 tuple2!15900) (t!31785 List!22484)) )
))
(declare-datatypes ((ListLongMap!13877 0))(
  ( (ListLongMap!13878 (toList!6954 List!22484)) )
))
(declare-fun lt!467910 () ListLongMap!13877)

(declare-fun minValue!907 () V!38569)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38569)

(declare-fun getCurrentListMapNoExtraKeys!3602 (array!67213 array!67211 (_ BitVec 32) (_ BitVec 32) V!38569 V!38569 (_ BitVec 32) Int) ListLongMap!13877)

(assert (=> b!1062177 (= lt!467910 (getCurrentListMapNoExtraKeys!3602 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38569)

(declare-fun lt!467909 () ListLongMap!13877)

(assert (=> b!1062177 (= lt!467909 (getCurrentListMapNoExtraKeys!3602 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94028 res!709006) b!1062171))

(assert (= (and b!1062171 res!709005) b!1062174))

(assert (= (and b!1062174 res!709004) b!1062173))

(assert (= (and b!1062173 res!709003) b!1062177))

(assert (= (and b!1062176 condMapEmpty!39283) mapIsEmpty!39283))

(assert (= (and b!1062176 (not condMapEmpty!39283)) mapNonEmpty!39283))

(get-info :version)

(assert (= (and mapNonEmpty!39283 ((_ is ValueCellFull!11834) mapValue!39283)) b!1062172))

(assert (= (and b!1062176 ((_ is ValueCellFull!11834) mapDefault!39283)) b!1062175))

(assert (= start!94028 b!1062176))

(declare-fun m!981487 () Bool)

(assert (=> b!1062177 m!981487))

(declare-fun m!981489 () Bool)

(assert (=> b!1062177 m!981489))

(declare-fun m!981491 () Bool)

(assert (=> b!1062173 m!981491))

(declare-fun m!981493 () Bool)

(assert (=> b!1062174 m!981493))

(declare-fun m!981495 () Bool)

(assert (=> mapNonEmpty!39283 m!981495))

(declare-fun m!981497 () Bool)

(assert (=> start!94028 m!981497))

(declare-fun m!981499 () Bool)

(assert (=> start!94028 m!981499))

(declare-fun m!981501 () Bool)

(assert (=> start!94028 m!981501))

(check-sat (not b_next!21265) tp_is_empty!25075 (not b!1062173) b_and!33989 (not mapNonEmpty!39283) (not b!1062177) (not start!94028) (not b!1062174))
(check-sat b_and!33989 (not b_next!21265))
