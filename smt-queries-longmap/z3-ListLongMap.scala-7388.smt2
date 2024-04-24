; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94326 () Bool)

(assert start!94326)

(declare-fun b_free!21505 () Bool)

(declare-fun b_next!21505 () Bool)

(assert (=> start!94326 (= b_free!21505 (not b_next!21505))))

(declare-fun tp!75946 () Bool)

(declare-fun b_and!34257 () Bool)

(assert (=> start!94326 (= tp!75946 b_and!34257)))

(declare-fun b!1065423 () Bool)

(declare-fun res!710931 () Bool)

(declare-fun e!607262 () Bool)

(assert (=> b!1065423 (=> (not res!710931) (not e!607262))))

(declare-datatypes ((array!67675 0))(
  ( (array!67676 (arr!32536 (Array (_ BitVec 32) (_ BitVec 64))) (size!33073 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67675)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67675 (_ BitVec 32)) Bool)

(assert (=> b!1065423 (= res!710931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39652 () Bool)

(declare-fun mapRes!39652 () Bool)

(declare-fun tp!75947 () Bool)

(declare-fun e!607263 () Bool)

(assert (=> mapNonEmpty!39652 (= mapRes!39652 (and tp!75947 e!607263))))

(declare-fun mapKey!39652 () (_ BitVec 32))

(declare-datatypes ((V!38889 0))(
  ( (V!38890 (val!12708 Int)) )
))
(declare-datatypes ((ValueCell!11954 0))(
  ( (ValueCellFull!11954 (v!15316 V!38889)) (EmptyCell!11954) )
))
(declare-fun mapValue!39652 () ValueCell!11954)

(declare-datatypes ((array!67677 0))(
  ( (array!67678 (arr!32537 (Array (_ BitVec 32) ValueCell!11954)) (size!33074 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67677)

(declare-fun mapRest!39652 () (Array (_ BitVec 32) ValueCell!11954))

(assert (=> mapNonEmpty!39652 (= (arr!32537 _values!955) (store mapRest!39652 mapKey!39652 mapValue!39652))))

(declare-fun b!1065424 () Bool)

(declare-fun res!710932 () Bool)

(assert (=> b!1065424 (=> (not res!710932) (not e!607262))))

(declare-datatypes ((List!22654 0))(
  ( (Nil!22651) (Cons!22650 (h!23868 (_ BitVec 64)) (t!31961 List!22654)) )
))
(declare-fun arrayNoDuplicates!0 (array!67675 (_ BitVec 32) List!22654) Bool)

(assert (=> b!1065424 (= res!710932 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22651))))

(declare-fun b!1065425 () Bool)

(declare-fun e!607265 () Bool)

(declare-fun e!607266 () Bool)

(assert (=> b!1065425 (= e!607265 (and e!607266 mapRes!39652))))

(declare-fun condMapEmpty!39652 () Bool)

(declare-fun mapDefault!39652 () ValueCell!11954)

(assert (=> b!1065425 (= condMapEmpty!39652 (= (arr!32537 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11954)) mapDefault!39652)))))

(declare-fun res!710929 () Bool)

(assert (=> start!94326 (=> (not res!710929) (not e!607262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94326 (= res!710929 (validMask!0 mask!1515))))

(assert (=> start!94326 e!607262))

(assert (=> start!94326 true))

(declare-fun tp_is_empty!25315 () Bool)

(assert (=> start!94326 tp_is_empty!25315))

(declare-fun array_inv!25216 (array!67677) Bool)

(assert (=> start!94326 (and (array_inv!25216 _values!955) e!607265)))

(assert (=> start!94326 tp!75946))

(declare-fun array_inv!25217 (array!67675) Bool)

(assert (=> start!94326 (array_inv!25217 _keys!1163)))

(declare-fun b!1065426 () Bool)

(assert (=> b!1065426 (= e!607266 tp_is_empty!25315)))

(declare-fun mapIsEmpty!39652 () Bool)

(assert (=> mapIsEmpty!39652 mapRes!39652))

(declare-fun b!1065427 () Bool)

(assert (=> b!1065427 (= e!607262 (not true))))

(declare-datatypes ((tuple2!16080 0))(
  ( (tuple2!16081 (_1!8051 (_ BitVec 64)) (_2!8051 V!38889)) )
))
(declare-datatypes ((List!22655 0))(
  ( (Nil!22652) (Cons!22651 (h!23869 tuple2!16080) (t!31962 List!22655)) )
))
(declare-datatypes ((ListLongMap!14057 0))(
  ( (ListLongMap!14058 (toList!7044 List!22655)) )
))
(declare-fun lt!469560 () ListLongMap!14057)

(declare-fun lt!469559 () ListLongMap!14057)

(assert (=> b!1065427 (= lt!469560 lt!469559)))

(declare-fun zeroValueBefore!47 () V!38889)

(declare-datatypes ((Unit!34891 0))(
  ( (Unit!34892) )
))
(declare-fun lt!469558 () Unit!34891)

(declare-fun minValue!907 () V!38889)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38889)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!681 (array!67675 array!67677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38889 V!38889 V!38889 V!38889 (_ BitVec 32) Int) Unit!34891)

(assert (=> b!1065427 (= lt!469558 (lemmaNoChangeToArrayThenSameMapNoExtras!681 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3678 (array!67675 array!67677 (_ BitVec 32) (_ BitVec 32) V!38889 V!38889 (_ BitVec 32) Int) ListLongMap!14057)

(assert (=> b!1065427 (= lt!469559 (getCurrentListMapNoExtraKeys!3678 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065427 (= lt!469560 (getCurrentListMapNoExtraKeys!3678 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065428 () Bool)

(assert (=> b!1065428 (= e!607263 tp_is_empty!25315)))

(declare-fun b!1065429 () Bool)

(declare-fun res!710930 () Bool)

(assert (=> b!1065429 (=> (not res!710930) (not e!607262))))

(assert (=> b!1065429 (= res!710930 (and (= (size!33074 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33073 _keys!1163) (size!33074 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94326 res!710929) b!1065429))

(assert (= (and b!1065429 res!710930) b!1065423))

(assert (= (and b!1065423 res!710931) b!1065424))

(assert (= (and b!1065424 res!710932) b!1065427))

(assert (= (and b!1065425 condMapEmpty!39652) mapIsEmpty!39652))

(assert (= (and b!1065425 (not condMapEmpty!39652)) mapNonEmpty!39652))

(get-info :version)

(assert (= (and mapNonEmpty!39652 ((_ is ValueCellFull!11954) mapValue!39652)) b!1065428))

(assert (= (and b!1065425 ((_ is ValueCellFull!11954) mapDefault!39652)) b!1065426))

(assert (= start!94326 b!1065425))

(declare-fun m!984373 () Bool)

(assert (=> mapNonEmpty!39652 m!984373))

(declare-fun m!984375 () Bool)

(assert (=> start!94326 m!984375))

(declare-fun m!984377 () Bool)

(assert (=> start!94326 m!984377))

(declare-fun m!984379 () Bool)

(assert (=> start!94326 m!984379))

(declare-fun m!984381 () Bool)

(assert (=> b!1065424 m!984381))

(declare-fun m!984383 () Bool)

(assert (=> b!1065427 m!984383))

(declare-fun m!984385 () Bool)

(assert (=> b!1065427 m!984385))

(declare-fun m!984387 () Bool)

(assert (=> b!1065427 m!984387))

(declare-fun m!984389 () Bool)

(assert (=> b!1065423 m!984389))

(check-sat tp_is_empty!25315 b_and!34257 (not start!94326) (not b!1065424) (not b_next!21505) (not b!1065427) (not mapNonEmpty!39652) (not b!1065423))
(check-sat b_and!34257 (not b_next!21505))
