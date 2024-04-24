; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94058 () Bool)

(assert start!94058)

(declare-fun b_free!21295 () Bool)

(declare-fun b_next!21295 () Bool)

(assert (=> start!94058 (= b_free!21295 (not b_next!21295))))

(declare-fun tp!75308 () Bool)

(declare-fun b_and!34019 () Bool)

(assert (=> start!94058 (= tp!75308 b_and!34019)))

(declare-fun res!709186 () Bool)

(declare-fun e!605099 () Bool)

(assert (=> start!94058 (=> (not res!709186) (not e!605099))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94058 (= res!709186 (validMask!0 mask!1515))))

(assert (=> start!94058 e!605099))

(assert (=> start!94058 true))

(declare-fun tp_is_empty!25105 () Bool)

(assert (=> start!94058 tp_is_empty!25105))

(declare-datatypes ((V!38609 0))(
  ( (V!38610 (val!12603 Int)) )
))
(declare-datatypes ((ValueCell!11849 0))(
  ( (ValueCellFull!11849 (v!15209 V!38609)) (EmptyCell!11849) )
))
(declare-datatypes ((array!67265 0))(
  ( (array!67266 (arr!32334 (Array (_ BitVec 32) ValueCell!11849)) (size!32871 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67265)

(declare-fun e!605100 () Bool)

(declare-fun array_inv!25070 (array!67265) Bool)

(assert (=> start!94058 (and (array_inv!25070 _values!955) e!605100)))

(assert (=> start!94058 tp!75308))

(declare-datatypes ((array!67267 0))(
  ( (array!67268 (arr!32335 (Array (_ BitVec 32) (_ BitVec 64))) (size!32872 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67267)

(declare-fun array_inv!25071 (array!67267) Bool)

(assert (=> start!94058 (array_inv!25071 _keys!1163)))

(declare-fun b!1062486 () Bool)

(declare-fun e!605102 () Bool)

(assert (=> b!1062486 (= e!605102 tp_is_empty!25105)))

(declare-fun b!1062487 () Bool)

(declare-fun res!709183 () Bool)

(assert (=> b!1062487 (=> (not res!709183) (not e!605099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67267 (_ BitVec 32)) Bool)

(assert (=> b!1062487 (= res!709183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39328 () Bool)

(declare-fun mapRes!39328 () Bool)

(declare-fun tp!75307 () Bool)

(declare-fun e!605101 () Bool)

(assert (=> mapNonEmpty!39328 (= mapRes!39328 (and tp!75307 e!605101))))

(declare-fun mapKey!39328 () (_ BitVec 32))

(declare-fun mapRest!39328 () (Array (_ BitVec 32) ValueCell!11849))

(declare-fun mapValue!39328 () ValueCell!11849)

(assert (=> mapNonEmpty!39328 (= (arr!32334 _values!955) (store mapRest!39328 mapKey!39328 mapValue!39328))))

(declare-fun b!1062488 () Bool)

(declare-fun res!709185 () Bool)

(assert (=> b!1062488 (=> (not res!709185) (not e!605099))))

(declare-datatypes ((List!22501 0))(
  ( (Nil!22498) (Cons!22497 (h!23715 (_ BitVec 64)) (t!31802 List!22501)) )
))
(declare-fun arrayNoDuplicates!0 (array!67267 (_ BitVec 32) List!22501) Bool)

(assert (=> b!1062488 (= res!709185 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22498))))

(declare-fun b!1062489 () Bool)

(assert (=> b!1062489 (= e!605100 (and e!605102 mapRes!39328))))

(declare-fun condMapEmpty!39328 () Bool)

(declare-fun mapDefault!39328 () ValueCell!11849)

(assert (=> b!1062489 (= condMapEmpty!39328 (= (arr!32334 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11849)) mapDefault!39328)))))

(declare-fun b!1062490 () Bool)

(declare-fun res!709184 () Bool)

(assert (=> b!1062490 (=> (not res!709184) (not e!605099))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062490 (= res!709184 (and (= (size!32871 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32872 _keys!1163) (size!32871 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062491 () Bool)

(assert (=> b!1062491 (= e!605101 tp_is_empty!25105)))

(declare-fun b!1062492 () Bool)

(assert (=> b!1062492 (= e!605099 false)))

(declare-datatypes ((tuple2!15916 0))(
  ( (tuple2!15917 (_1!7969 (_ BitVec 64)) (_2!7969 V!38609)) )
))
(declare-datatypes ((List!22502 0))(
  ( (Nil!22499) (Cons!22498 (h!23716 tuple2!15916) (t!31803 List!22502)) )
))
(declare-datatypes ((ListLongMap!13893 0))(
  ( (ListLongMap!13894 (toList!6962 List!22502)) )
))
(declare-fun lt!468000 () ListLongMap!13893)

(declare-fun minValue!907 () V!38609)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38609)

(declare-fun getCurrentListMapNoExtraKeys!3610 (array!67267 array!67265 (_ BitVec 32) (_ BitVec 32) V!38609 V!38609 (_ BitVec 32) Int) ListLongMap!13893)

(assert (=> b!1062492 (= lt!468000 (getCurrentListMapNoExtraKeys!3610 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38609)

(declare-fun lt!467999 () ListLongMap!13893)

(assert (=> b!1062492 (= lt!467999 (getCurrentListMapNoExtraKeys!3610 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39328 () Bool)

(assert (=> mapIsEmpty!39328 mapRes!39328))

(assert (= (and start!94058 res!709186) b!1062490))

(assert (= (and b!1062490 res!709184) b!1062487))

(assert (= (and b!1062487 res!709183) b!1062488))

(assert (= (and b!1062488 res!709185) b!1062492))

(assert (= (and b!1062489 condMapEmpty!39328) mapIsEmpty!39328))

(assert (= (and b!1062489 (not condMapEmpty!39328)) mapNonEmpty!39328))

(get-info :version)

(assert (= (and mapNonEmpty!39328 ((_ is ValueCellFull!11849) mapValue!39328)) b!1062491))

(assert (= (and b!1062489 ((_ is ValueCellFull!11849) mapDefault!39328)) b!1062486))

(assert (= start!94058 b!1062489))

(declare-fun m!981727 () Bool)

(assert (=> b!1062492 m!981727))

(declare-fun m!981729 () Bool)

(assert (=> b!1062492 m!981729))

(declare-fun m!981731 () Bool)

(assert (=> b!1062487 m!981731))

(declare-fun m!981733 () Bool)

(assert (=> mapNonEmpty!39328 m!981733))

(declare-fun m!981735 () Bool)

(assert (=> b!1062488 m!981735))

(declare-fun m!981737 () Bool)

(assert (=> start!94058 m!981737))

(declare-fun m!981739 () Bool)

(assert (=> start!94058 m!981739))

(declare-fun m!981741 () Bool)

(assert (=> start!94058 m!981741))

(check-sat (not b!1062492) (not mapNonEmpty!39328) tp_is_empty!25105 (not start!94058) (not b!1062488) b_and!34019 (not b!1062487) (not b_next!21295))
(check-sat b_and!34019 (not b_next!21295))
