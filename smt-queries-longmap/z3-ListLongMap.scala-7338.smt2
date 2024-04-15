; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93714 () Bool)

(assert start!93714)

(declare-fun b_free!21205 () Bool)

(declare-fun b_next!21205 () Bool)

(assert (=> start!93714 (= b_free!21205 (not b_next!21205))))

(declare-fun tp!75035 () Bool)

(declare-fun b_and!33889 () Bool)

(assert (=> start!93714 (= tp!75035 b_and!33889)))

(declare-fun b!1059988 () Bool)

(declare-fun res!708025 () Bool)

(declare-fun e!603430 () Bool)

(assert (=> b!1059988 (=> (not res!708025) (not e!603430))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((V!38489 0))(
  ( (V!38490 (val!12558 Int)) )
))
(declare-datatypes ((ValueCell!11804 0))(
  ( (ValueCellFull!11804 (v!15167 V!38489)) (EmptyCell!11804) )
))
(declare-datatypes ((array!66992 0))(
  ( (array!66993 (arr!32205 (Array (_ BitVec 32) ValueCell!11804)) (size!32743 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66992)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66994 0))(
  ( (array!66995 (arr!32206 (Array (_ BitVec 32) (_ BitVec 64))) (size!32744 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66994)

(assert (=> b!1059988 (= res!708025 (and (= (size!32743 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32744 _keys!1163) (size!32743 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059989 () Bool)

(declare-fun res!708027 () Bool)

(assert (=> b!1059989 (=> (not res!708027) (not e!603430))))

(declare-datatypes ((List!22488 0))(
  ( (Nil!22485) (Cons!22484 (h!23693 (_ BitVec 64)) (t!31786 List!22488)) )
))
(declare-fun arrayNoDuplicates!0 (array!66994 (_ BitVec 32) List!22488) Bool)

(assert (=> b!1059989 (= res!708027 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22485))))

(declare-fun b!1059990 () Bool)

(declare-fun e!603431 () Bool)

(declare-fun tp_is_empty!25015 () Bool)

(assert (=> b!1059990 (= e!603431 tp_is_empty!25015)))

(declare-fun res!708028 () Bool)

(assert (=> start!93714 (=> (not res!708028) (not e!603430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93714 (= res!708028 (validMask!0 mask!1515))))

(assert (=> start!93714 e!603430))

(assert (=> start!93714 true))

(assert (=> start!93714 tp_is_empty!25015))

(declare-fun e!603428 () Bool)

(declare-fun array_inv!24966 (array!66992) Bool)

(assert (=> start!93714 (and (array_inv!24966 _values!955) e!603428)))

(assert (=> start!93714 tp!75035))

(declare-fun array_inv!24967 (array!66994) Bool)

(assert (=> start!93714 (array_inv!24967 _keys!1163)))

(declare-fun b!1059991 () Bool)

(declare-fun e!603432 () Bool)

(assert (=> b!1059991 (= e!603432 tp_is_empty!25015)))

(declare-fun b!1059992 () Bool)

(assert (=> b!1059992 (= e!603430 false)))

(declare-fun zeroValueBefore!47 () V!38489)

(declare-datatypes ((tuple2!15934 0))(
  ( (tuple2!15935 (_1!7978 (_ BitVec 64)) (_2!7978 V!38489)) )
))
(declare-datatypes ((List!22489 0))(
  ( (Nil!22486) (Cons!22485 (h!23694 tuple2!15934) (t!31787 List!22489)) )
))
(declare-datatypes ((ListLongMap!13903 0))(
  ( (ListLongMap!13904 (toList!6967 List!22489)) )
))
(declare-fun lt!467027 () ListLongMap!13903)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38489)

(declare-fun getCurrentListMapNoExtraKeys!3584 (array!66994 array!66992 (_ BitVec 32) (_ BitVec 32) V!38489 V!38489 (_ BitVec 32) Int) ListLongMap!13903)

(assert (=> b!1059992 (= lt!467027 (getCurrentListMapNoExtraKeys!3584 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39190 () Bool)

(declare-fun mapRes!39190 () Bool)

(assert (=> mapIsEmpty!39190 mapRes!39190))

(declare-fun mapNonEmpty!39190 () Bool)

(declare-fun tp!75034 () Bool)

(assert (=> mapNonEmpty!39190 (= mapRes!39190 (and tp!75034 e!603431))))

(declare-fun mapRest!39190 () (Array (_ BitVec 32) ValueCell!11804))

(declare-fun mapKey!39190 () (_ BitVec 32))

(declare-fun mapValue!39190 () ValueCell!11804)

(assert (=> mapNonEmpty!39190 (= (arr!32205 _values!955) (store mapRest!39190 mapKey!39190 mapValue!39190))))

(declare-fun b!1059993 () Bool)

(declare-fun res!708026 () Bool)

(assert (=> b!1059993 (=> (not res!708026) (not e!603430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66994 (_ BitVec 32)) Bool)

(assert (=> b!1059993 (= res!708026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059994 () Bool)

(assert (=> b!1059994 (= e!603428 (and e!603432 mapRes!39190))))

(declare-fun condMapEmpty!39190 () Bool)

(declare-fun mapDefault!39190 () ValueCell!11804)

(assert (=> b!1059994 (= condMapEmpty!39190 (= (arr!32205 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11804)) mapDefault!39190)))))

(assert (= (and start!93714 res!708028) b!1059988))

(assert (= (and b!1059988 res!708025) b!1059993))

(assert (= (and b!1059993 res!708026) b!1059989))

(assert (= (and b!1059989 res!708027) b!1059992))

(assert (= (and b!1059994 condMapEmpty!39190) mapIsEmpty!39190))

(assert (= (and b!1059994 (not condMapEmpty!39190)) mapNonEmpty!39190))

(get-info :version)

(assert (= (and mapNonEmpty!39190 ((_ is ValueCellFull!11804) mapValue!39190)) b!1059990))

(assert (= (and b!1059994 ((_ is ValueCellFull!11804) mapDefault!39190)) b!1059991))

(assert (= start!93714 b!1059994))

(declare-fun m!978695 () Bool)

(assert (=> start!93714 m!978695))

(declare-fun m!978697 () Bool)

(assert (=> start!93714 m!978697))

(declare-fun m!978699 () Bool)

(assert (=> start!93714 m!978699))

(declare-fun m!978701 () Bool)

(assert (=> b!1059992 m!978701))

(declare-fun m!978703 () Bool)

(assert (=> b!1059989 m!978703))

(declare-fun m!978705 () Bool)

(assert (=> mapNonEmpty!39190 m!978705))

(declare-fun m!978707 () Bool)

(assert (=> b!1059993 m!978707))

(check-sat (not b!1059989) b_and!33889 (not b_next!21205) tp_is_empty!25015 (not b!1059992) (not start!93714) (not mapNonEmpty!39190) (not b!1059993))
(check-sat b_and!33889 (not b_next!21205))
