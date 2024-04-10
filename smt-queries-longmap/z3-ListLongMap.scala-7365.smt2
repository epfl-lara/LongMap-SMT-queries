; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93910 () Bool)

(assert start!93910)

(declare-fun b_free!21369 () Bool)

(declare-fun b_next!21369 () Bool)

(assert (=> start!93910 (= b_free!21369 (not b_next!21369))))

(declare-fun tp!75532 () Bool)

(declare-fun b_and!34091 () Bool)

(assert (=> start!93910 (= tp!75532 b_and!34091)))

(declare-fun res!709174 () Bool)

(declare-fun e!604893 () Bool)

(assert (=> start!93910 (=> (not res!709174) (not e!604893))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93910 (= res!709174 (validMask!0 mask!1515))))

(assert (=> start!93910 e!604893))

(assert (=> start!93910 true))

(declare-fun tp_is_empty!25179 () Bool)

(assert (=> start!93910 tp_is_empty!25179))

(declare-datatypes ((V!38707 0))(
  ( (V!38708 (val!12640 Int)) )
))
(declare-datatypes ((ValueCell!11886 0))(
  ( (ValueCellFull!11886 (v!15250 V!38707)) (EmptyCell!11886) )
))
(declare-datatypes ((array!67363 0))(
  ( (array!67364 (arr!32388 (Array (_ BitVec 32) ValueCell!11886)) (size!32924 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67363)

(declare-fun e!604891 () Bool)

(declare-fun array_inv!25096 (array!67363) Bool)

(assert (=> start!93910 (and (array_inv!25096 _values!955) e!604891)))

(assert (=> start!93910 tp!75532))

(declare-datatypes ((array!67365 0))(
  ( (array!67366 (arr!32389 (Array (_ BitVec 32) (_ BitVec 64))) (size!32925 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67365)

(declare-fun array_inv!25097 (array!67365) Bool)

(assert (=> start!93910 (array_inv!25097 _keys!1163)))

(declare-fun b!1062058 () Bool)

(declare-fun res!709178 () Bool)

(assert (=> b!1062058 (=> (not res!709178) (not e!604893))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062058 (= res!709178 (and (= (size!32924 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32925 _keys!1163) (size!32924 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062059 () Bool)

(declare-fun e!604897 () Bool)

(declare-fun e!604894 () Bool)

(assert (=> b!1062059 (= e!604897 e!604894)))

(declare-fun res!709173 () Bool)

(assert (=> b!1062059 (=> res!709173 e!604894)))

(declare-datatypes ((tuple2!15984 0))(
  ( (tuple2!15985 (_1!8003 (_ BitVec 64)) (_2!8003 V!38707)) )
))
(declare-datatypes ((List!22567 0))(
  ( (Nil!22564) (Cons!22563 (h!23772 tuple2!15984) (t!31878 List!22567)) )
))
(declare-datatypes ((ListLongMap!13953 0))(
  ( (ListLongMap!13954 (toList!6992 List!22567)) )
))
(declare-fun lt!467887 () ListLongMap!13953)

(declare-fun contains!6226 (ListLongMap!13953 (_ BitVec 64)) Bool)

(assert (=> b!1062059 (= res!709173 (contains!6226 lt!467887 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38707)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38707)

(declare-fun getCurrentListMap!3979 (array!67365 array!67363 (_ BitVec 32) (_ BitVec 32) V!38707 V!38707 (_ BitVec 32) Int) ListLongMap!13953)

(assert (=> b!1062059 (= lt!467887 (getCurrentListMap!3979 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062060 () Bool)

(declare-fun res!709175 () Bool)

(assert (=> b!1062060 (=> (not res!709175) (not e!604893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67365 (_ BitVec 32)) Bool)

(assert (=> b!1062060 (= res!709175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39442 () Bool)

(declare-fun mapRes!39442 () Bool)

(assert (=> mapIsEmpty!39442 mapRes!39442))

(declare-fun b!1062061 () Bool)

(assert (=> b!1062061 (= e!604893 (not e!604897))))

(declare-fun res!709176 () Bool)

(assert (=> b!1062061 (=> res!709176 e!604897)))

(assert (=> b!1062061 (= res!709176 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!467890 () ListLongMap!13953)

(declare-fun lt!467888 () ListLongMap!13953)

(assert (=> b!1062061 (= lt!467890 lt!467888)))

(declare-datatypes ((Unit!34786 0))(
  ( (Unit!34787) )
))
(declare-fun lt!467889 () Unit!34786)

(declare-fun zeroValueAfter!47 () V!38707)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!630 (array!67365 array!67363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38707 V!38707 V!38707 V!38707 (_ BitVec 32) Int) Unit!34786)

(assert (=> b!1062061 (= lt!467889 (lemmaNoChangeToArrayThenSameMapNoExtras!630 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3593 (array!67365 array!67363 (_ BitVec 32) (_ BitVec 32) V!38707 V!38707 (_ BitVec 32) Int) ListLongMap!13953)

(assert (=> b!1062061 (= lt!467888 (getCurrentListMapNoExtraKeys!3593 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062061 (= lt!467890 (getCurrentListMapNoExtraKeys!3593 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39442 () Bool)

(declare-fun tp!75533 () Bool)

(declare-fun e!604892 () Bool)

(assert (=> mapNonEmpty!39442 (= mapRes!39442 (and tp!75533 e!604892))))

(declare-fun mapRest!39442 () (Array (_ BitVec 32) ValueCell!11886))

(declare-fun mapKey!39442 () (_ BitVec 32))

(declare-fun mapValue!39442 () ValueCell!11886)

(assert (=> mapNonEmpty!39442 (= (arr!32388 _values!955) (store mapRest!39442 mapKey!39442 mapValue!39442))))

(declare-fun b!1062062 () Bool)

(declare-fun e!604895 () Bool)

(assert (=> b!1062062 (= e!604891 (and e!604895 mapRes!39442))))

(declare-fun condMapEmpty!39442 () Bool)

(declare-fun mapDefault!39442 () ValueCell!11886)

(assert (=> b!1062062 (= condMapEmpty!39442 (= (arr!32388 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11886)) mapDefault!39442)))))

(declare-fun b!1062063 () Bool)

(declare-fun res!709177 () Bool)

(assert (=> b!1062063 (=> (not res!709177) (not e!604893))))

(declare-datatypes ((List!22568 0))(
  ( (Nil!22565) (Cons!22564 (h!23773 (_ BitVec 64)) (t!31879 List!22568)) )
))
(declare-fun arrayNoDuplicates!0 (array!67365 (_ BitVec 32) List!22568) Bool)

(assert (=> b!1062063 (= res!709177 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22565))))

(declare-fun b!1062064 () Bool)

(assert (=> b!1062064 (= e!604892 tp_is_empty!25179)))

(declare-fun b!1062065 () Bool)

(assert (=> b!1062065 (= e!604894 true)))

(declare-fun -!558 (ListLongMap!13953 (_ BitVec 64)) ListLongMap!13953)

(assert (=> b!1062065 (= (-!558 lt!467887 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467887)))

(declare-fun lt!467891 () Unit!34786)

(declare-fun removeNotPresentStillSame!5 (ListLongMap!13953 (_ BitVec 64)) Unit!34786)

(assert (=> b!1062065 (= lt!467891 (removeNotPresentStillSame!5 lt!467887 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062066 () Bool)

(assert (=> b!1062066 (= e!604895 tp_is_empty!25179)))

(assert (= (and start!93910 res!709174) b!1062058))

(assert (= (and b!1062058 res!709178) b!1062060))

(assert (= (and b!1062060 res!709175) b!1062063))

(assert (= (and b!1062063 res!709177) b!1062061))

(assert (= (and b!1062061 (not res!709176)) b!1062059))

(assert (= (and b!1062059 (not res!709173)) b!1062065))

(assert (= (and b!1062062 condMapEmpty!39442) mapIsEmpty!39442))

(assert (= (and b!1062062 (not condMapEmpty!39442)) mapNonEmpty!39442))

(get-info :version)

(assert (= (and mapNonEmpty!39442 ((_ is ValueCellFull!11886) mapValue!39442)) b!1062064))

(assert (= (and b!1062062 ((_ is ValueCellFull!11886) mapDefault!39442)) b!1062066))

(assert (= start!93910 b!1062062))

(declare-fun m!980825 () Bool)

(assert (=> mapNonEmpty!39442 m!980825))

(declare-fun m!980827 () Bool)

(assert (=> b!1062065 m!980827))

(declare-fun m!980829 () Bool)

(assert (=> b!1062065 m!980829))

(declare-fun m!980831 () Bool)

(assert (=> b!1062061 m!980831))

(declare-fun m!980833 () Bool)

(assert (=> b!1062061 m!980833))

(declare-fun m!980835 () Bool)

(assert (=> b!1062061 m!980835))

(declare-fun m!980837 () Bool)

(assert (=> b!1062063 m!980837))

(declare-fun m!980839 () Bool)

(assert (=> b!1062060 m!980839))

(declare-fun m!980841 () Bool)

(assert (=> b!1062059 m!980841))

(declare-fun m!980843 () Bool)

(assert (=> b!1062059 m!980843))

(declare-fun m!980845 () Bool)

(assert (=> start!93910 m!980845))

(declare-fun m!980847 () Bool)

(assert (=> start!93910 m!980847))

(declare-fun m!980849 () Bool)

(assert (=> start!93910 m!980849))

(check-sat (not b!1062059) (not b!1062063) tp_is_empty!25179 b_and!34091 (not b_next!21369) (not b!1062060) (not b!1062065) (not mapNonEmpty!39442) (not start!93910) (not b!1062061))
(check-sat b_and!34091 (not b_next!21369))
