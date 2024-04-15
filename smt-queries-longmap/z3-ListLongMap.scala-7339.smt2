; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93720 () Bool)

(assert start!93720)

(declare-fun b_free!21211 () Bool)

(declare-fun b_next!21211 () Bool)

(assert (=> start!93720 (= b_free!21211 (not b_next!21211))))

(declare-fun tp!75053 () Bool)

(declare-fun b_and!33895 () Bool)

(assert (=> start!93720 (= tp!75053 b_and!33895)))

(declare-fun b!1060051 () Bool)

(declare-fun e!603476 () Bool)

(declare-fun e!603473 () Bool)

(declare-fun mapRes!39199 () Bool)

(assert (=> b!1060051 (= e!603476 (and e!603473 mapRes!39199))))

(declare-fun condMapEmpty!39199 () Bool)

(declare-datatypes ((V!38497 0))(
  ( (V!38498 (val!12561 Int)) )
))
(declare-datatypes ((ValueCell!11807 0))(
  ( (ValueCellFull!11807 (v!15170 V!38497)) (EmptyCell!11807) )
))
(declare-datatypes ((array!67004 0))(
  ( (array!67005 (arr!32211 (Array (_ BitVec 32) ValueCell!11807)) (size!32749 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67004)

(declare-fun mapDefault!39199 () ValueCell!11807)

(assert (=> b!1060051 (= condMapEmpty!39199 (= (arr!32211 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11807)) mapDefault!39199)))))

(declare-fun mapIsEmpty!39199 () Bool)

(assert (=> mapIsEmpty!39199 mapRes!39199))

(declare-fun mapNonEmpty!39199 () Bool)

(declare-fun tp!75052 () Bool)

(declare-fun e!603475 () Bool)

(assert (=> mapNonEmpty!39199 (= mapRes!39199 (and tp!75052 e!603475))))

(declare-fun mapKey!39199 () (_ BitVec 32))

(declare-fun mapValue!39199 () ValueCell!11807)

(declare-fun mapRest!39199 () (Array (_ BitVec 32) ValueCell!11807))

(assert (=> mapNonEmpty!39199 (= (arr!32211 _values!955) (store mapRest!39199 mapKey!39199 mapValue!39199))))

(declare-fun b!1060052 () Bool)

(declare-fun tp_is_empty!25021 () Bool)

(assert (=> b!1060052 (= e!603473 tp_is_empty!25021)))

(declare-fun b!1060053 () Bool)

(declare-fun res!708061 () Bool)

(declare-fun e!603474 () Bool)

(assert (=> b!1060053 (=> (not res!708061) (not e!603474))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67006 0))(
  ( (array!67007 (arr!32212 (Array (_ BitVec 32) (_ BitVec 64))) (size!32750 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67006)

(assert (=> b!1060053 (= res!708061 (and (= (size!32749 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32750 _keys!1163) (size!32749 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!708063 () Bool)

(assert (=> start!93720 (=> (not res!708063) (not e!603474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93720 (= res!708063 (validMask!0 mask!1515))))

(assert (=> start!93720 e!603474))

(assert (=> start!93720 true))

(assert (=> start!93720 tp_is_empty!25021))

(declare-fun array_inv!24968 (array!67004) Bool)

(assert (=> start!93720 (and (array_inv!24968 _values!955) e!603476)))

(assert (=> start!93720 tp!75053))

(declare-fun array_inv!24969 (array!67006) Bool)

(assert (=> start!93720 (array_inv!24969 _keys!1163)))

(declare-fun b!1060054 () Bool)

(declare-fun res!708064 () Bool)

(assert (=> b!1060054 (=> (not res!708064) (not e!603474))))

(declare-datatypes ((List!22492 0))(
  ( (Nil!22489) (Cons!22488 (h!23697 (_ BitVec 64)) (t!31790 List!22492)) )
))
(declare-fun arrayNoDuplicates!0 (array!67006 (_ BitVec 32) List!22492) Bool)

(assert (=> b!1060054 (= res!708064 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22489))))

(declare-fun b!1060055 () Bool)

(assert (=> b!1060055 (= e!603475 tp_is_empty!25021)))

(declare-fun b!1060056 () Bool)

(assert (=> b!1060056 (= e!603474 false)))

(declare-fun zeroValueBefore!47 () V!38497)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38497)

(declare-datatypes ((tuple2!15938 0))(
  ( (tuple2!15939 (_1!7980 (_ BitVec 64)) (_2!7980 V!38497)) )
))
(declare-datatypes ((List!22493 0))(
  ( (Nil!22490) (Cons!22489 (h!23698 tuple2!15938) (t!31791 List!22493)) )
))
(declare-datatypes ((ListLongMap!13907 0))(
  ( (ListLongMap!13908 (toList!6969 List!22493)) )
))
(declare-fun lt!467036 () ListLongMap!13907)

(declare-fun getCurrentListMapNoExtraKeys!3586 (array!67006 array!67004 (_ BitVec 32) (_ BitVec 32) V!38497 V!38497 (_ BitVec 32) Int) ListLongMap!13907)

(assert (=> b!1060056 (= lt!467036 (getCurrentListMapNoExtraKeys!3586 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060057 () Bool)

(declare-fun res!708062 () Bool)

(assert (=> b!1060057 (=> (not res!708062) (not e!603474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67006 (_ BitVec 32)) Bool)

(assert (=> b!1060057 (= res!708062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!93720 res!708063) b!1060053))

(assert (= (and b!1060053 res!708061) b!1060057))

(assert (= (and b!1060057 res!708062) b!1060054))

(assert (= (and b!1060054 res!708064) b!1060056))

(assert (= (and b!1060051 condMapEmpty!39199) mapIsEmpty!39199))

(assert (= (and b!1060051 (not condMapEmpty!39199)) mapNonEmpty!39199))

(get-info :version)

(assert (= (and mapNonEmpty!39199 ((_ is ValueCellFull!11807) mapValue!39199)) b!1060055))

(assert (= (and b!1060051 ((_ is ValueCellFull!11807) mapDefault!39199)) b!1060052))

(assert (= start!93720 b!1060051))

(declare-fun m!978737 () Bool)

(assert (=> mapNonEmpty!39199 m!978737))

(declare-fun m!978739 () Bool)

(assert (=> b!1060056 m!978739))

(declare-fun m!978741 () Bool)

(assert (=> b!1060054 m!978741))

(declare-fun m!978743 () Bool)

(assert (=> start!93720 m!978743))

(declare-fun m!978745 () Bool)

(assert (=> start!93720 m!978745))

(declare-fun m!978747 () Bool)

(assert (=> start!93720 m!978747))

(declare-fun m!978749 () Bool)

(assert (=> b!1060057 m!978749))

(check-sat (not b!1060056) (not b_next!21211) tp_is_empty!25021 (not b!1060057) b_and!33895 (not mapNonEmpty!39199) (not b!1060054) (not start!93720))
(check-sat b_and!33895 (not b_next!21211))
