; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93652 () Bool)

(assert start!93652)

(declare-fun b!1059537 () Bool)

(declare-fun e!603063 () Bool)

(assert (=> b!1059537 (= e!603063 false)))

(declare-fun lt!467140 () Bool)

(declare-datatypes ((array!66943 0))(
  ( (array!66944 (arr!32181 (Array (_ BitVec 32) (_ BitVec 64))) (size!32717 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66943)

(declare-datatypes ((List!22434 0))(
  ( (Nil!22431) (Cons!22430 (h!23639 (_ BitVec 64)) (t!31741 List!22434)) )
))
(declare-fun arrayNoDuplicates!0 (array!66943 (_ BitVec 32) List!22434) Bool)

(assert (=> b!1059537 (= lt!467140 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22431))))

(declare-fun res!707772 () Bool)

(assert (=> start!93652 (=> (not res!707772) (not e!603063))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93652 (= res!707772 (validMask!0 mask!1515))))

(assert (=> start!93652 e!603063))

(assert (=> start!93652 true))

(declare-datatypes ((V!38411 0))(
  ( (V!38412 (val!12529 Int)) )
))
(declare-datatypes ((ValueCell!11775 0))(
  ( (ValueCellFull!11775 (v!15139 V!38411)) (EmptyCell!11775) )
))
(declare-datatypes ((array!66945 0))(
  ( (array!66946 (arr!32182 (Array (_ BitVec 32) ValueCell!11775)) (size!32718 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66945)

(declare-fun e!603059 () Bool)

(declare-fun array_inv!24948 (array!66945) Bool)

(assert (=> start!93652 (and (array_inv!24948 _values!955) e!603059)))

(declare-fun array_inv!24949 (array!66943) Bool)

(assert (=> start!93652 (array_inv!24949 _keys!1163)))

(declare-fun b!1059538 () Bool)

(declare-fun e!603061 () Bool)

(declare-fun mapRes!39100 () Bool)

(assert (=> b!1059538 (= e!603059 (and e!603061 mapRes!39100))))

(declare-fun condMapEmpty!39100 () Bool)

(declare-fun mapDefault!39100 () ValueCell!11775)

(assert (=> b!1059538 (= condMapEmpty!39100 (= (arr!32182 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11775)) mapDefault!39100)))))

(declare-fun b!1059539 () Bool)

(declare-fun res!707773 () Bool)

(assert (=> b!1059539 (=> (not res!707773) (not e!603063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66943 (_ BitVec 32)) Bool)

(assert (=> b!1059539 (= res!707773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059540 () Bool)

(declare-fun res!707771 () Bool)

(assert (=> b!1059540 (=> (not res!707771) (not e!603063))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059540 (= res!707771 (and (= (size!32718 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32717 _keys!1163) (size!32718 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059541 () Bool)

(declare-fun tp_is_empty!24957 () Bool)

(assert (=> b!1059541 (= e!603061 tp_is_empty!24957)))

(declare-fun b!1059542 () Bool)

(declare-fun e!603060 () Bool)

(assert (=> b!1059542 (= e!603060 tp_is_empty!24957)))

(declare-fun mapNonEmpty!39100 () Bool)

(declare-fun tp!74906 () Bool)

(assert (=> mapNonEmpty!39100 (= mapRes!39100 (and tp!74906 e!603060))))

(declare-fun mapRest!39100 () (Array (_ BitVec 32) ValueCell!11775))

(declare-fun mapValue!39100 () ValueCell!11775)

(declare-fun mapKey!39100 () (_ BitVec 32))

(assert (=> mapNonEmpty!39100 (= (arr!32182 _values!955) (store mapRest!39100 mapKey!39100 mapValue!39100))))

(declare-fun mapIsEmpty!39100 () Bool)

(assert (=> mapIsEmpty!39100 mapRes!39100))

(assert (= (and start!93652 res!707772) b!1059540))

(assert (= (and b!1059540 res!707771) b!1059539))

(assert (= (and b!1059539 res!707773) b!1059537))

(assert (= (and b!1059538 condMapEmpty!39100) mapIsEmpty!39100))

(assert (= (and b!1059538 (not condMapEmpty!39100)) mapNonEmpty!39100))

(get-info :version)

(assert (= (and mapNonEmpty!39100 ((_ is ValueCellFull!11775) mapValue!39100)) b!1059542))

(assert (= (and b!1059538 ((_ is ValueCellFull!11775) mapDefault!39100)) b!1059541))

(assert (= start!93652 b!1059538))

(declare-fun m!978931 () Bool)

(assert (=> b!1059537 m!978931))

(declare-fun m!978933 () Bool)

(assert (=> start!93652 m!978933))

(declare-fun m!978935 () Bool)

(assert (=> start!93652 m!978935))

(declare-fun m!978937 () Bool)

(assert (=> start!93652 m!978937))

(declare-fun m!978939 () Bool)

(assert (=> b!1059539 m!978939))

(declare-fun m!978941 () Bool)

(assert (=> mapNonEmpty!39100 m!978941))

(check-sat (not b!1059539) tp_is_empty!24957 (not start!93652) (not mapNonEmpty!39100) (not b!1059537))
(check-sat)
