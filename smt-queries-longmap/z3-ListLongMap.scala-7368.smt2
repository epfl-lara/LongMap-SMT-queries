; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93928 () Bool)

(assert start!93928)

(declare-fun b_free!21387 () Bool)

(declare-fun b_next!21387 () Bool)

(assert (=> start!93928 (= b_free!21387 (not b_next!21387))))

(declare-fun tp!75587 () Bool)

(declare-fun b_and!34109 () Bool)

(assert (=> start!93928 (= tp!75587 b_and!34109)))

(declare-fun mapIsEmpty!39469 () Bool)

(declare-fun mapRes!39469 () Bool)

(assert (=> mapIsEmpty!39469 mapRes!39469))

(declare-fun b!1062301 () Bool)

(declare-fun e!605080 () Bool)

(declare-fun e!605085 () Bool)

(assert (=> b!1062301 (= e!605080 (and e!605085 mapRes!39469))))

(declare-fun condMapEmpty!39469 () Bool)

(declare-datatypes ((V!38731 0))(
  ( (V!38732 (val!12649 Int)) )
))
(declare-datatypes ((ValueCell!11895 0))(
  ( (ValueCellFull!11895 (v!15259 V!38731)) (EmptyCell!11895) )
))
(declare-datatypes ((array!67397 0))(
  ( (array!67398 (arr!32405 (Array (_ BitVec 32) ValueCell!11895)) (size!32941 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67397)

(declare-fun mapDefault!39469 () ValueCell!11895)

(assert (=> b!1062301 (= condMapEmpty!39469 (= (arr!32405 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11895)) mapDefault!39469)))))

(declare-fun b!1062303 () Bool)

(declare-fun res!709338 () Bool)

(declare-fun e!605082 () Bool)

(assert (=> b!1062303 (=> (not res!709338) (not e!605082))))

(declare-datatypes ((array!67399 0))(
  ( (array!67400 (arr!32406 (Array (_ BitVec 32) (_ BitVec 64))) (size!32942 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67399)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67399 (_ BitVec 32)) Bool)

(assert (=> b!1062303 (= res!709338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39469 () Bool)

(declare-fun tp!75586 () Bool)

(declare-fun e!605084 () Bool)

(assert (=> mapNonEmpty!39469 (= mapRes!39469 (and tp!75586 e!605084))))

(declare-fun mapKey!39469 () (_ BitVec 32))

(declare-fun mapRest!39469 () (Array (_ BitVec 32) ValueCell!11895))

(declare-fun mapValue!39469 () ValueCell!11895)

(assert (=> mapNonEmpty!39469 (= (arr!32405 _values!955) (store mapRest!39469 mapKey!39469 mapValue!39469))))

(declare-fun b!1062304 () Bool)

(declare-fun e!605086 () Bool)

(declare-fun e!605081 () Bool)

(assert (=> b!1062304 (= e!605086 e!605081)))

(declare-fun res!709339 () Bool)

(assert (=> b!1062304 (=> res!709339 e!605081)))

(declare-datatypes ((tuple2!15998 0))(
  ( (tuple2!15999 (_1!8010 (_ BitVec 64)) (_2!8010 V!38731)) )
))
(declare-datatypes ((List!22581 0))(
  ( (Nil!22578) (Cons!22577 (h!23786 tuple2!15998) (t!31892 List!22581)) )
))
(declare-datatypes ((ListLongMap!13967 0))(
  ( (ListLongMap!13968 (toList!6999 List!22581)) )
))
(declare-fun lt!468023 () ListLongMap!13967)

(declare-fun contains!6232 (ListLongMap!13967 (_ BitVec 64)) Bool)

(assert (=> b!1062304 (= res!709339 (contains!6232 lt!468023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38731)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38731)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!3985 (array!67399 array!67397 (_ BitVec 32) (_ BitVec 32) V!38731 V!38731 (_ BitVec 32) Int) ListLongMap!13967)

(assert (=> b!1062304 (= lt!468023 (getCurrentListMap!3985 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062305 () Bool)

(declare-fun res!709336 () Bool)

(assert (=> b!1062305 (=> (not res!709336) (not e!605082))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1062305 (= res!709336 (and (= (size!32941 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32942 _keys!1163) (size!32941 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062306 () Bool)

(declare-fun tp_is_empty!25197 () Bool)

(assert (=> b!1062306 (= e!605084 tp_is_empty!25197)))

(declare-fun b!1062307 () Bool)

(assert (=> b!1062307 (= e!605081 true)))

(declare-fun -!564 (ListLongMap!13967 (_ BitVec 64)) ListLongMap!13967)

(assert (=> b!1062307 (= (-!564 lt!468023 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468023)))

(declare-datatypes ((Unit!34798 0))(
  ( (Unit!34799) )
))
(declare-fun lt!468025 () Unit!34798)

(declare-fun removeNotPresentStillSame!11 (ListLongMap!13967 (_ BitVec 64)) Unit!34798)

(assert (=> b!1062307 (= lt!468025 (removeNotPresentStillSame!11 lt!468023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062308 () Bool)

(assert (=> b!1062308 (= e!605082 (not e!605086))))

(declare-fun res!709335 () Bool)

(assert (=> b!1062308 (=> res!709335 e!605086)))

(assert (=> b!1062308 (= res!709335 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468026 () ListLongMap!13967)

(declare-fun lt!468022 () ListLongMap!13967)

(assert (=> b!1062308 (= lt!468026 lt!468022)))

(declare-fun lt!468024 () Unit!34798)

(declare-fun zeroValueAfter!47 () V!38731)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!635 (array!67399 array!67397 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38731 V!38731 V!38731 V!38731 (_ BitVec 32) Int) Unit!34798)

(assert (=> b!1062308 (= lt!468024 (lemmaNoChangeToArrayThenSameMapNoExtras!635 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3598 (array!67399 array!67397 (_ BitVec 32) (_ BitVec 32) V!38731 V!38731 (_ BitVec 32) Int) ListLongMap!13967)

(assert (=> b!1062308 (= lt!468022 (getCurrentListMapNoExtraKeys!3598 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062308 (= lt!468026 (getCurrentListMapNoExtraKeys!3598 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062309 () Bool)

(declare-fun res!709337 () Bool)

(assert (=> b!1062309 (=> (not res!709337) (not e!605082))))

(declare-datatypes ((List!22582 0))(
  ( (Nil!22579) (Cons!22578 (h!23787 (_ BitVec 64)) (t!31893 List!22582)) )
))
(declare-fun arrayNoDuplicates!0 (array!67399 (_ BitVec 32) List!22582) Bool)

(assert (=> b!1062309 (= res!709337 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22579))))

(declare-fun b!1062302 () Bool)

(assert (=> b!1062302 (= e!605085 tp_is_empty!25197)))

(declare-fun res!709340 () Bool)

(assert (=> start!93928 (=> (not res!709340) (not e!605082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93928 (= res!709340 (validMask!0 mask!1515))))

(assert (=> start!93928 e!605082))

(assert (=> start!93928 true))

(assert (=> start!93928 tp_is_empty!25197))

(declare-fun array_inv!25106 (array!67397) Bool)

(assert (=> start!93928 (and (array_inv!25106 _values!955) e!605080)))

(assert (=> start!93928 tp!75587))

(declare-fun array_inv!25107 (array!67399) Bool)

(assert (=> start!93928 (array_inv!25107 _keys!1163)))

(assert (= (and start!93928 res!709340) b!1062305))

(assert (= (and b!1062305 res!709336) b!1062303))

(assert (= (and b!1062303 res!709338) b!1062309))

(assert (= (and b!1062309 res!709337) b!1062308))

(assert (= (and b!1062308 (not res!709335)) b!1062304))

(assert (= (and b!1062304 (not res!709339)) b!1062307))

(assert (= (and b!1062301 condMapEmpty!39469) mapIsEmpty!39469))

(assert (= (and b!1062301 (not condMapEmpty!39469)) mapNonEmpty!39469))

(get-info :version)

(assert (= (and mapNonEmpty!39469 ((_ is ValueCellFull!11895) mapValue!39469)) b!1062306))

(assert (= (and b!1062301 ((_ is ValueCellFull!11895) mapDefault!39469)) b!1062302))

(assert (= start!93928 b!1062301))

(declare-fun m!981059 () Bool)

(assert (=> b!1062309 m!981059))

(declare-fun m!981061 () Bool)

(assert (=> b!1062304 m!981061))

(declare-fun m!981063 () Bool)

(assert (=> b!1062304 m!981063))

(declare-fun m!981065 () Bool)

(assert (=> b!1062307 m!981065))

(declare-fun m!981067 () Bool)

(assert (=> b!1062307 m!981067))

(declare-fun m!981069 () Bool)

(assert (=> start!93928 m!981069))

(declare-fun m!981071 () Bool)

(assert (=> start!93928 m!981071))

(declare-fun m!981073 () Bool)

(assert (=> start!93928 m!981073))

(declare-fun m!981075 () Bool)

(assert (=> b!1062303 m!981075))

(declare-fun m!981077 () Bool)

(assert (=> b!1062308 m!981077))

(declare-fun m!981079 () Bool)

(assert (=> b!1062308 m!981079))

(declare-fun m!981081 () Bool)

(assert (=> b!1062308 m!981081))

(declare-fun m!981083 () Bool)

(assert (=> mapNonEmpty!39469 m!981083))

(check-sat (not b!1062309) (not b!1062307) b_and!34109 (not mapNonEmpty!39469) (not b!1062303) (not b!1062308) (not b!1062304) (not start!93928) (not b_next!21387) tp_is_empty!25197)
(check-sat b_and!34109 (not b_next!21387))
