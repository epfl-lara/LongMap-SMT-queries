; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93646 () Bool)

(assert start!93646)

(declare-fun res!707746 () Bool)

(declare-fun e!603018 () Bool)

(assert (=> start!93646 (=> (not res!707746) (not e!603018))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93646 (= res!707746 (validMask!0 mask!1515))))

(assert (=> start!93646 e!603018))

(assert (=> start!93646 true))

(declare-datatypes ((V!38403 0))(
  ( (V!38404 (val!12526 Int)) )
))
(declare-datatypes ((ValueCell!11772 0))(
  ( (ValueCellFull!11772 (v!15136 V!38403)) (EmptyCell!11772) )
))
(declare-datatypes ((array!66933 0))(
  ( (array!66934 (arr!32176 (Array (_ BitVec 32) ValueCell!11772)) (size!32712 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66933)

(declare-fun e!603014 () Bool)

(declare-fun array_inv!24944 (array!66933) Bool)

(assert (=> start!93646 (and (array_inv!24944 _values!955) e!603014)))

(declare-datatypes ((array!66935 0))(
  ( (array!66936 (arr!32177 (Array (_ BitVec 32) (_ BitVec 64))) (size!32713 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66935)

(declare-fun array_inv!24945 (array!66935) Bool)

(assert (=> start!93646 (array_inv!24945 _keys!1163)))

(declare-fun b!1059483 () Bool)

(declare-fun e!603016 () Bool)

(declare-fun tp_is_empty!24951 () Bool)

(assert (=> b!1059483 (= e!603016 tp_is_empty!24951)))

(declare-fun mapNonEmpty!39091 () Bool)

(declare-fun mapRes!39091 () Bool)

(declare-fun tp!74897 () Bool)

(assert (=> mapNonEmpty!39091 (= mapRes!39091 (and tp!74897 e!603016))))

(declare-fun mapKey!39091 () (_ BitVec 32))

(declare-fun mapValue!39091 () ValueCell!11772)

(declare-fun mapRest!39091 () (Array (_ BitVec 32) ValueCell!11772))

(assert (=> mapNonEmpty!39091 (= (arr!32176 _values!955) (store mapRest!39091 mapKey!39091 mapValue!39091))))

(declare-fun b!1059484 () Bool)

(declare-fun e!603017 () Bool)

(assert (=> b!1059484 (= e!603017 tp_is_empty!24951)))

(declare-fun b!1059485 () Bool)

(assert (=> b!1059485 (= e!603018 false)))

(declare-fun lt!467131 () Bool)

(declare-datatypes ((List!22432 0))(
  ( (Nil!22429) (Cons!22428 (h!23637 (_ BitVec 64)) (t!31739 List!22432)) )
))
(declare-fun arrayNoDuplicates!0 (array!66935 (_ BitVec 32) List!22432) Bool)

(assert (=> b!1059485 (= lt!467131 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22429))))

(declare-fun b!1059486 () Bool)

(assert (=> b!1059486 (= e!603014 (and e!603017 mapRes!39091))))

(declare-fun condMapEmpty!39091 () Bool)

(declare-fun mapDefault!39091 () ValueCell!11772)

(assert (=> b!1059486 (= condMapEmpty!39091 (= (arr!32176 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11772)) mapDefault!39091)))))

(declare-fun mapIsEmpty!39091 () Bool)

(assert (=> mapIsEmpty!39091 mapRes!39091))

(declare-fun b!1059487 () Bool)

(declare-fun res!707745 () Bool)

(assert (=> b!1059487 (=> (not res!707745) (not e!603018))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1059487 (= res!707745 (and (= (size!32712 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32713 _keys!1163) (size!32712 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059488 () Bool)

(declare-fun res!707744 () Bool)

(assert (=> b!1059488 (=> (not res!707744) (not e!603018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66935 (_ BitVec 32)) Bool)

(assert (=> b!1059488 (= res!707744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!93646 res!707746) b!1059487))

(assert (= (and b!1059487 res!707745) b!1059488))

(assert (= (and b!1059488 res!707744) b!1059485))

(assert (= (and b!1059486 condMapEmpty!39091) mapIsEmpty!39091))

(assert (= (and b!1059486 (not condMapEmpty!39091)) mapNonEmpty!39091))

(get-info :version)

(assert (= (and mapNonEmpty!39091 ((_ is ValueCellFull!11772) mapValue!39091)) b!1059483))

(assert (= (and b!1059486 ((_ is ValueCellFull!11772) mapDefault!39091)) b!1059484))

(assert (= start!93646 b!1059486))

(declare-fun m!978895 () Bool)

(assert (=> start!93646 m!978895))

(declare-fun m!978897 () Bool)

(assert (=> start!93646 m!978897))

(declare-fun m!978899 () Bool)

(assert (=> start!93646 m!978899))

(declare-fun m!978901 () Bool)

(assert (=> mapNonEmpty!39091 m!978901))

(declare-fun m!978903 () Bool)

(assert (=> b!1059485 m!978903))

(declare-fun m!978905 () Bool)

(assert (=> b!1059488 m!978905))

(check-sat tp_is_empty!24951 (not b!1059488) (not start!93646) (not b!1059485) (not mapNonEmpty!39091))
(check-sat)
