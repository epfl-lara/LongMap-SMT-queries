; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94076 () Bool)

(assert start!94076)

(declare-fun b_free!21313 () Bool)

(declare-fun b_next!21313 () Bool)

(assert (=> start!94076 (= b_free!21313 (not b_next!21313))))

(declare-fun tp!75361 () Bool)

(declare-fun b_and!34037 () Bool)

(assert (=> start!94076 (= tp!75361 b_and!34037)))

(declare-fun b!1062675 () Bool)

(declare-fun res!709293 () Bool)

(declare-fun e!605234 () Bool)

(assert (=> b!1062675 (=> (not res!709293) (not e!605234))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38633 0))(
  ( (V!38634 (val!12612 Int)) )
))
(declare-datatypes ((ValueCell!11858 0))(
  ( (ValueCellFull!11858 (v!15218 V!38633)) (EmptyCell!11858) )
))
(declare-datatypes ((array!67301 0))(
  ( (array!67302 (arr!32352 (Array (_ BitVec 32) ValueCell!11858)) (size!32889 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67301)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67303 0))(
  ( (array!67304 (arr!32353 (Array (_ BitVec 32) (_ BitVec 64))) (size!32890 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67303)

(assert (=> b!1062675 (= res!709293 (and (= (size!32889 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32890 _keys!1163) (size!32889 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062676 () Bool)

(declare-fun res!709294 () Bool)

(assert (=> b!1062676 (=> (not res!709294) (not e!605234))))

(declare-datatypes ((List!22515 0))(
  ( (Nil!22512) (Cons!22511 (h!23729 (_ BitVec 64)) (t!31816 List!22515)) )
))
(declare-fun arrayNoDuplicates!0 (array!67303 (_ BitVec 32) List!22515) Bool)

(assert (=> b!1062676 (= res!709294 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22512))))

(declare-fun b!1062677 () Bool)

(declare-fun res!709292 () Bool)

(assert (=> b!1062677 (=> (not res!709292) (not e!605234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67303 (_ BitVec 32)) Bool)

(assert (=> b!1062677 (= res!709292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062678 () Bool)

(declare-fun e!605237 () Bool)

(declare-fun e!605236 () Bool)

(declare-fun mapRes!39355 () Bool)

(assert (=> b!1062678 (= e!605237 (and e!605236 mapRes!39355))))

(declare-fun condMapEmpty!39355 () Bool)

(declare-fun mapDefault!39355 () ValueCell!11858)

(assert (=> b!1062678 (= condMapEmpty!39355 (= (arr!32352 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11858)) mapDefault!39355)))))

(declare-fun b!1062679 () Bool)

(declare-fun e!605235 () Bool)

(declare-fun tp_is_empty!25123 () Bool)

(assert (=> b!1062679 (= e!605235 tp_is_empty!25123)))

(declare-fun res!709291 () Bool)

(assert (=> start!94076 (=> (not res!709291) (not e!605234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94076 (= res!709291 (validMask!0 mask!1515))))

(assert (=> start!94076 e!605234))

(assert (=> start!94076 true))

(assert (=> start!94076 tp_is_empty!25123))

(declare-fun array_inv!25084 (array!67301) Bool)

(assert (=> start!94076 (and (array_inv!25084 _values!955) e!605237)))

(assert (=> start!94076 tp!75361))

(declare-fun array_inv!25085 (array!67303) Bool)

(assert (=> start!94076 (array_inv!25085 _keys!1163)))

(declare-fun mapIsEmpty!39355 () Bool)

(assert (=> mapIsEmpty!39355 mapRes!39355))

(declare-fun mapNonEmpty!39355 () Bool)

(declare-fun tp!75362 () Bool)

(assert (=> mapNonEmpty!39355 (= mapRes!39355 (and tp!75362 e!605235))))

(declare-fun mapKey!39355 () (_ BitVec 32))

(declare-fun mapRest!39355 () (Array (_ BitVec 32) ValueCell!11858))

(declare-fun mapValue!39355 () ValueCell!11858)

(assert (=> mapNonEmpty!39355 (= (arr!32352 _values!955) (store mapRest!39355 mapKey!39355 mapValue!39355))))

(declare-fun b!1062680 () Bool)

(assert (=> b!1062680 (= e!605234 (not true))))

(declare-datatypes ((tuple2!15930 0))(
  ( (tuple2!15931 (_1!7976 (_ BitVec 64)) (_2!7976 V!38633)) )
))
(declare-datatypes ((List!22516 0))(
  ( (Nil!22513) (Cons!22512 (h!23730 tuple2!15930) (t!31817 List!22516)) )
))
(declare-datatypes ((ListLongMap!13907 0))(
  ( (ListLongMap!13908 (toList!6969 List!22516)) )
))
(declare-fun lt!468074 () ListLongMap!13907)

(declare-fun lt!468075 () ListLongMap!13907)

(assert (=> b!1062680 (= lt!468074 lt!468075)))

(declare-fun zeroValueBefore!47 () V!38633)

(declare-datatypes ((Unit!34743 0))(
  ( (Unit!34744) )
))
(declare-fun lt!468073 () Unit!34743)

(declare-fun minValue!907 () V!38633)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38633)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!620 (array!67303 array!67301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38633 V!38633 V!38633 V!38633 (_ BitVec 32) Int) Unit!34743)

(assert (=> b!1062680 (= lt!468073 (lemmaNoChangeToArrayThenSameMapNoExtras!620 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3617 (array!67303 array!67301 (_ BitVec 32) (_ BitVec 32) V!38633 V!38633 (_ BitVec 32) Int) ListLongMap!13907)

(assert (=> b!1062680 (= lt!468075 (getCurrentListMapNoExtraKeys!3617 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062680 (= lt!468074 (getCurrentListMapNoExtraKeys!3617 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062681 () Bool)

(assert (=> b!1062681 (= e!605236 tp_is_empty!25123)))

(assert (= (and start!94076 res!709291) b!1062675))

(assert (= (and b!1062675 res!709293) b!1062677))

(assert (= (and b!1062677 res!709292) b!1062676))

(assert (= (and b!1062676 res!709294) b!1062680))

(assert (= (and b!1062678 condMapEmpty!39355) mapIsEmpty!39355))

(assert (= (and b!1062678 (not condMapEmpty!39355)) mapNonEmpty!39355))

(get-info :version)

(assert (= (and mapNonEmpty!39355 ((_ is ValueCellFull!11858) mapValue!39355)) b!1062679))

(assert (= (and b!1062678 ((_ is ValueCellFull!11858) mapDefault!39355)) b!1062681))

(assert (= start!94076 b!1062678))

(declare-fun m!981883 () Bool)

(assert (=> b!1062677 m!981883))

(declare-fun m!981885 () Bool)

(assert (=> mapNonEmpty!39355 m!981885))

(declare-fun m!981887 () Bool)

(assert (=> start!94076 m!981887))

(declare-fun m!981889 () Bool)

(assert (=> start!94076 m!981889))

(declare-fun m!981891 () Bool)

(assert (=> start!94076 m!981891))

(declare-fun m!981893 () Bool)

(assert (=> b!1062676 m!981893))

(declare-fun m!981895 () Bool)

(assert (=> b!1062680 m!981895))

(declare-fun m!981897 () Bool)

(assert (=> b!1062680 m!981897))

(declare-fun m!981899 () Bool)

(assert (=> b!1062680 m!981899))

(check-sat (not start!94076) (not b_next!21313) b_and!34037 (not b!1062676) (not b!1062677) (not b!1062680) (not mapNonEmpty!39355) tp_is_empty!25123)
(check-sat b_and!34037 (not b_next!21313))
