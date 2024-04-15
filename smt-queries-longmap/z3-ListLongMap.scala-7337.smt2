; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93708 () Bool)

(assert start!93708)

(declare-fun b_free!21199 () Bool)

(declare-fun b_next!21199 () Bool)

(assert (=> start!93708 (= b_free!21199 (not b_next!21199))))

(declare-fun tp!75017 () Bool)

(declare-fun b_and!33883 () Bool)

(assert (=> start!93708 (= tp!75017 b_and!33883)))

(declare-fun b!1059925 () Bool)

(declare-fun e!603385 () Bool)

(declare-fun tp_is_empty!25009 () Bool)

(assert (=> b!1059925 (= e!603385 tp_is_empty!25009)))

(declare-fun b!1059926 () Bool)

(declare-fun e!603387 () Bool)

(assert (=> b!1059926 (= e!603387 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38481 0))(
  ( (V!38482 (val!12555 Int)) )
))
(declare-datatypes ((ValueCell!11801 0))(
  ( (ValueCellFull!11801 (v!15164 V!38481)) (EmptyCell!11801) )
))
(declare-datatypes ((array!66980 0))(
  ( (array!66981 (arr!32199 (Array (_ BitVec 32) ValueCell!11801)) (size!32737 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66980)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38481)

(declare-datatypes ((tuple2!15928 0))(
  ( (tuple2!15929 (_1!7975 (_ BitVec 64)) (_2!7975 V!38481)) )
))
(declare-datatypes ((List!22482 0))(
  ( (Nil!22479) (Cons!22478 (h!23687 tuple2!15928) (t!31780 List!22482)) )
))
(declare-datatypes ((ListLongMap!13897 0))(
  ( (ListLongMap!13898 (toList!6964 List!22482)) )
))
(declare-fun lt!467018 () ListLongMap!13897)

(declare-fun zeroValueBefore!47 () V!38481)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66982 0))(
  ( (array!66983 (arr!32200 (Array (_ BitVec 32) (_ BitVec 64))) (size!32738 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66982)

(declare-fun getCurrentListMapNoExtraKeys!3581 (array!66982 array!66980 (_ BitVec 32) (_ BitVec 32) V!38481 V!38481 (_ BitVec 32) Int) ListLongMap!13897)

(assert (=> b!1059926 (= lt!467018 (getCurrentListMapNoExtraKeys!3581 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1059927 () Bool)

(declare-fun e!603386 () Bool)

(declare-fun mapRes!39181 () Bool)

(assert (=> b!1059927 (= e!603386 (and e!603385 mapRes!39181))))

(declare-fun condMapEmpty!39181 () Bool)

(declare-fun mapDefault!39181 () ValueCell!11801)

(assert (=> b!1059927 (= condMapEmpty!39181 (= (arr!32199 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11801)) mapDefault!39181)))))

(declare-fun mapIsEmpty!39181 () Bool)

(assert (=> mapIsEmpty!39181 mapRes!39181))

(declare-fun b!1059928 () Bool)

(declare-fun res!707991 () Bool)

(assert (=> b!1059928 (=> (not res!707991) (not e!603387))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1059928 (= res!707991 (and (= (size!32737 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32738 _keys!1163) (size!32737 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059929 () Bool)

(declare-fun res!707992 () Bool)

(assert (=> b!1059929 (=> (not res!707992) (not e!603387))))

(declare-datatypes ((List!22483 0))(
  ( (Nil!22480) (Cons!22479 (h!23688 (_ BitVec 64)) (t!31781 List!22483)) )
))
(declare-fun arrayNoDuplicates!0 (array!66982 (_ BitVec 32) List!22483) Bool)

(assert (=> b!1059929 (= res!707992 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22480))))

(declare-fun b!1059930 () Bool)

(declare-fun res!707989 () Bool)

(assert (=> b!1059930 (=> (not res!707989) (not e!603387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66982 (_ BitVec 32)) Bool)

(assert (=> b!1059930 (= res!707989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059931 () Bool)

(declare-fun e!603384 () Bool)

(assert (=> b!1059931 (= e!603384 tp_is_empty!25009)))

(declare-fun mapNonEmpty!39181 () Bool)

(declare-fun tp!75016 () Bool)

(assert (=> mapNonEmpty!39181 (= mapRes!39181 (and tp!75016 e!603384))))

(declare-fun mapValue!39181 () ValueCell!11801)

(declare-fun mapKey!39181 () (_ BitVec 32))

(declare-fun mapRest!39181 () (Array (_ BitVec 32) ValueCell!11801))

(assert (=> mapNonEmpty!39181 (= (arr!32199 _values!955) (store mapRest!39181 mapKey!39181 mapValue!39181))))

(declare-fun res!707990 () Bool)

(assert (=> start!93708 (=> (not res!707990) (not e!603387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93708 (= res!707990 (validMask!0 mask!1515))))

(assert (=> start!93708 e!603387))

(assert (=> start!93708 true))

(assert (=> start!93708 tp_is_empty!25009))

(declare-fun array_inv!24962 (array!66980) Bool)

(assert (=> start!93708 (and (array_inv!24962 _values!955) e!603386)))

(assert (=> start!93708 tp!75017))

(declare-fun array_inv!24963 (array!66982) Bool)

(assert (=> start!93708 (array_inv!24963 _keys!1163)))

(assert (= (and start!93708 res!707990) b!1059928))

(assert (= (and b!1059928 res!707991) b!1059930))

(assert (= (and b!1059930 res!707989) b!1059929))

(assert (= (and b!1059929 res!707992) b!1059926))

(assert (= (and b!1059927 condMapEmpty!39181) mapIsEmpty!39181))

(assert (= (and b!1059927 (not condMapEmpty!39181)) mapNonEmpty!39181))

(get-info :version)

(assert (= (and mapNonEmpty!39181 ((_ is ValueCellFull!11801) mapValue!39181)) b!1059931))

(assert (= (and b!1059927 ((_ is ValueCellFull!11801) mapDefault!39181)) b!1059925))

(assert (= start!93708 b!1059927))

(declare-fun m!978653 () Bool)

(assert (=> start!93708 m!978653))

(declare-fun m!978655 () Bool)

(assert (=> start!93708 m!978655))

(declare-fun m!978657 () Bool)

(assert (=> start!93708 m!978657))

(declare-fun m!978659 () Bool)

(assert (=> mapNonEmpty!39181 m!978659))

(declare-fun m!978661 () Bool)

(assert (=> b!1059929 m!978661))

(declare-fun m!978663 () Bool)

(assert (=> b!1059926 m!978663))

(declare-fun m!978665 () Bool)

(assert (=> b!1059930 m!978665))

(check-sat b_and!33883 (not b!1059929) (not b!1059930) (not b_next!21199) tp_is_empty!25009 (not b!1059926) (not mapNonEmpty!39181) (not start!93708))
(check-sat b_and!33883 (not b_next!21199))
