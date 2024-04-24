; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93892 () Bool)

(assert start!93892)

(declare-fun b!1060900 () Bool)

(declare-fun e!603948 () Bool)

(declare-fun tp_is_empty!24961 () Bool)

(assert (=> b!1060900 (= e!603948 tp_is_empty!24961)))

(declare-fun res!708312 () Bool)

(declare-fun e!603946 () Bool)

(assert (=> start!93892 (=> (not res!708312) (not e!603946))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93892 (= res!708312 (validMask!0 mask!1515))))

(assert (=> start!93892 e!603946))

(assert (=> start!93892 true))

(declare-datatypes ((V!38417 0))(
  ( (V!38418 (val!12531 Int)) )
))
(declare-datatypes ((ValueCell!11777 0))(
  ( (ValueCellFull!11777 (v!15137 V!38417)) (EmptyCell!11777) )
))
(declare-datatypes ((array!66995 0))(
  ( (array!66996 (arr!32201 (Array (_ BitVec 32) ValueCell!11777)) (size!32738 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66995)

(declare-fun e!603944 () Bool)

(declare-fun array_inv!24970 (array!66995) Bool)

(assert (=> start!93892 (and (array_inv!24970 _values!955) e!603944)))

(declare-datatypes ((array!66997 0))(
  ( (array!66998 (arr!32202 (Array (_ BitVec 32) (_ BitVec 64))) (size!32739 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66997)

(declare-fun array_inv!24971 (array!66997) Bool)

(assert (=> start!93892 (array_inv!24971 _keys!1163)))

(declare-fun b!1060901 () Bool)

(declare-fun e!603945 () Bool)

(assert (=> b!1060901 (= e!603945 tp_is_empty!24961)))

(declare-fun b!1060902 () Bool)

(declare-fun res!708313 () Bool)

(assert (=> b!1060902 (=> (not res!708313) (not e!603946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66997 (_ BitVec 32)) Bool)

(assert (=> b!1060902 (= res!708313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060903 () Bool)

(declare-fun res!708311 () Bool)

(assert (=> b!1060903 (=> (not res!708311) (not e!603946))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060903 (= res!708311 (and (= (size!32738 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32739 _keys!1163) (size!32738 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39106 () Bool)

(declare-fun mapRes!39106 () Bool)

(assert (=> mapIsEmpty!39106 mapRes!39106))

(declare-fun b!1060904 () Bool)

(assert (=> b!1060904 (= e!603944 (and e!603945 mapRes!39106))))

(declare-fun condMapEmpty!39106 () Bool)

(declare-fun mapDefault!39106 () ValueCell!11777)

(assert (=> b!1060904 (= condMapEmpty!39106 (= (arr!32201 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11777)) mapDefault!39106)))))

(declare-fun b!1060905 () Bool)

(assert (=> b!1060905 (= e!603946 false)))

(declare-fun lt!467661 () Bool)

(declare-datatypes ((List!22421 0))(
  ( (Nil!22418) (Cons!22417 (h!23635 (_ BitVec 64)) (t!31720 List!22421)) )
))
(declare-fun arrayNoDuplicates!0 (array!66997 (_ BitVec 32) List!22421) Bool)

(assert (=> b!1060905 (= lt!467661 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22418))))

(declare-fun mapNonEmpty!39106 () Bool)

(declare-fun tp!74912 () Bool)

(assert (=> mapNonEmpty!39106 (= mapRes!39106 (and tp!74912 e!603948))))

(declare-fun mapKey!39106 () (_ BitVec 32))

(declare-fun mapRest!39106 () (Array (_ BitVec 32) ValueCell!11777))

(declare-fun mapValue!39106 () ValueCell!11777)

(assert (=> mapNonEmpty!39106 (= (arr!32201 _values!955) (store mapRest!39106 mapKey!39106 mapValue!39106))))

(assert (= (and start!93892 res!708312) b!1060903))

(assert (= (and b!1060903 res!708311) b!1060902))

(assert (= (and b!1060902 res!708313) b!1060905))

(assert (= (and b!1060904 condMapEmpty!39106) mapIsEmpty!39106))

(assert (= (and b!1060904 (not condMapEmpty!39106)) mapNonEmpty!39106))

(get-info :version)

(assert (= (and mapNonEmpty!39106 ((_ is ValueCellFull!11777) mapValue!39106)) b!1060900))

(assert (= (and b!1060904 ((_ is ValueCellFull!11777) mapDefault!39106)) b!1060901))

(assert (= start!93892 b!1060904))

(declare-fun m!980627 () Bool)

(assert (=> start!93892 m!980627))

(declare-fun m!980629 () Bool)

(assert (=> start!93892 m!980629))

(declare-fun m!980631 () Bool)

(assert (=> start!93892 m!980631))

(declare-fun m!980633 () Bool)

(assert (=> b!1060902 m!980633))

(declare-fun m!980635 () Bool)

(assert (=> b!1060905 m!980635))

(declare-fun m!980637 () Bool)

(assert (=> mapNonEmpty!39106 m!980637))

(check-sat (not b!1060905) (not start!93892) tp_is_empty!24961 (not mapNonEmpty!39106) (not b!1060902))
(check-sat)
