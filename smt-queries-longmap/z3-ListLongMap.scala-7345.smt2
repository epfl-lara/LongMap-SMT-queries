; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93776 () Bool)

(assert start!93776)

(declare-fun b_free!21249 () Bool)

(declare-fun b_next!21249 () Bool)

(assert (=> start!93776 (= b_free!21249 (not b_next!21249))))

(declare-fun tp!75169 () Bool)

(declare-fun b_and!33963 () Bool)

(assert (=> start!93776 (= tp!75169 b_and!33963)))

(declare-fun b!1060676 () Bool)

(declare-fun res!708385 () Bool)

(declare-fun e!603900 () Bool)

(assert (=> b!1060676 (=> (not res!708385) (not e!603900))))

(declare-datatypes ((array!67133 0))(
  ( (array!67134 (arr!32274 (Array (_ BitVec 32) (_ BitVec 64))) (size!32810 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67133)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67133 (_ BitVec 32)) Bool)

(assert (=> b!1060676 (= res!708385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060677 () Bool)

(declare-fun e!603903 () Bool)

(declare-fun tp_is_empty!25059 () Bool)

(assert (=> b!1060677 (= e!603903 tp_is_empty!25059)))

(declare-fun mapIsEmpty!39259 () Bool)

(declare-fun mapRes!39259 () Bool)

(assert (=> mapIsEmpty!39259 mapRes!39259))

(declare-fun b!1060678 () Bool)

(declare-fun e!603901 () Bool)

(assert (=> b!1060678 (= e!603901 (and e!603903 mapRes!39259))))

(declare-fun condMapEmpty!39259 () Bool)

(declare-datatypes ((V!38547 0))(
  ( (V!38548 (val!12580 Int)) )
))
(declare-datatypes ((ValueCell!11826 0))(
  ( (ValueCellFull!11826 (v!15190 V!38547)) (EmptyCell!11826) )
))
(declare-datatypes ((array!67135 0))(
  ( (array!67136 (arr!32275 (Array (_ BitVec 32) ValueCell!11826)) (size!32811 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67135)

(declare-fun mapDefault!39259 () ValueCell!11826)

(assert (=> b!1060678 (= condMapEmpty!39259 (= (arr!32275 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11826)) mapDefault!39259)))))

(declare-fun mapNonEmpty!39259 () Bool)

(declare-fun tp!75170 () Bool)

(declare-fun e!603899 () Bool)

(assert (=> mapNonEmpty!39259 (= mapRes!39259 (and tp!75170 e!603899))))

(declare-fun mapRest!39259 () (Array (_ BitVec 32) ValueCell!11826))

(declare-fun mapKey!39259 () (_ BitVec 32))

(declare-fun mapValue!39259 () ValueCell!11826)

(assert (=> mapNonEmpty!39259 (= (arr!32275 _values!955) (store mapRest!39259 mapKey!39259 mapValue!39259))))

(declare-fun b!1060679 () Bool)

(assert (=> b!1060679 (= e!603900 false)))

(declare-fun minValue!907 () V!38547)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((tuple2!15898 0))(
  ( (tuple2!15899 (_1!7960 (_ BitVec 64)) (_2!7960 V!38547)) )
))
(declare-datatypes ((List!22484 0))(
  ( (Nil!22481) (Cons!22480 (h!23689 tuple2!15898) (t!31793 List!22484)) )
))
(declare-datatypes ((ListLongMap!13867 0))(
  ( (ListLongMap!13868 (toList!6949 List!22484)) )
))
(declare-fun lt!467347 () ListLongMap!13867)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38547)

(declare-fun getCurrentListMapNoExtraKeys!3551 (array!67133 array!67135 (_ BitVec 32) (_ BitVec 32) V!38547 V!38547 (_ BitVec 32) Int) ListLongMap!13867)

(assert (=> b!1060679 (= lt!467347 (getCurrentListMapNoExtraKeys!3551 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38547)

(declare-fun lt!467346 () ListLongMap!13867)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060679 (= lt!467346 (getCurrentListMapNoExtraKeys!3551 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060681 () Bool)

(declare-fun res!708388 () Bool)

(assert (=> b!1060681 (=> (not res!708388) (not e!603900))))

(declare-datatypes ((List!22485 0))(
  ( (Nil!22482) (Cons!22481 (h!23690 (_ BitVec 64)) (t!31794 List!22485)) )
))
(declare-fun arrayNoDuplicates!0 (array!67133 (_ BitVec 32) List!22485) Bool)

(assert (=> b!1060681 (= res!708388 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22482))))

(declare-fun b!1060682 () Bool)

(declare-fun res!708387 () Bool)

(assert (=> b!1060682 (=> (not res!708387) (not e!603900))))

(assert (=> b!1060682 (= res!708387 (and (= (size!32811 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32810 _keys!1163) (size!32811 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!708386 () Bool)

(assert (=> start!93776 (=> (not res!708386) (not e!603900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93776 (= res!708386 (validMask!0 mask!1515))))

(assert (=> start!93776 e!603900))

(assert (=> start!93776 true))

(assert (=> start!93776 tp_is_empty!25059))

(declare-fun array_inv!25008 (array!67135) Bool)

(assert (=> start!93776 (and (array_inv!25008 _values!955) e!603901)))

(assert (=> start!93776 tp!75169))

(declare-fun array_inv!25009 (array!67133) Bool)

(assert (=> start!93776 (array_inv!25009 _keys!1163)))

(declare-fun b!1060680 () Bool)

(assert (=> b!1060680 (= e!603899 tp_is_empty!25059)))

(assert (= (and start!93776 res!708386) b!1060682))

(assert (= (and b!1060682 res!708387) b!1060676))

(assert (= (and b!1060676 res!708385) b!1060681))

(assert (= (and b!1060681 res!708388) b!1060679))

(assert (= (and b!1060678 condMapEmpty!39259) mapIsEmpty!39259))

(assert (= (and b!1060678 (not condMapEmpty!39259)) mapNonEmpty!39259))

(get-info :version)

(assert (= (and mapNonEmpty!39259 ((_ is ValueCellFull!11826) mapValue!39259)) b!1060680))

(assert (= (and b!1060678 ((_ is ValueCellFull!11826) mapDefault!39259)) b!1060677))

(assert (= start!93776 b!1060678))

(declare-fun m!979687 () Bool)

(assert (=> b!1060676 m!979687))

(declare-fun m!979689 () Bool)

(assert (=> mapNonEmpty!39259 m!979689))

(declare-fun m!979691 () Bool)

(assert (=> b!1060681 m!979691))

(declare-fun m!979693 () Bool)

(assert (=> start!93776 m!979693))

(declare-fun m!979695 () Bool)

(assert (=> start!93776 m!979695))

(declare-fun m!979697 () Bool)

(assert (=> start!93776 m!979697))

(declare-fun m!979699 () Bool)

(assert (=> b!1060679 m!979699))

(declare-fun m!979701 () Bool)

(assert (=> b!1060679 m!979701))

(check-sat (not b!1060679) (not b!1060681) (not mapNonEmpty!39259) (not start!93776) b_and!33963 tp_is_empty!25059 (not b_next!21249) (not b!1060676))
(check-sat b_and!33963 (not b_next!21249))
