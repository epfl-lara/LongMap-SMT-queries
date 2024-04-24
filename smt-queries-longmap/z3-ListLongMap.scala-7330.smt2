; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93898 () Bool)

(assert start!93898)

(declare-fun res!708338 () Bool)

(declare-fun e!603992 () Bool)

(assert (=> start!93898 (=> (not res!708338) (not e!603992))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93898 (= res!708338 (validMask!0 mask!1515))))

(assert (=> start!93898 e!603992))

(assert (=> start!93898 true))

(declare-datatypes ((V!38425 0))(
  ( (V!38426 (val!12534 Int)) )
))
(declare-datatypes ((ValueCell!11780 0))(
  ( (ValueCellFull!11780 (v!15140 V!38425)) (EmptyCell!11780) )
))
(declare-datatypes ((array!67005 0))(
  ( (array!67006 (arr!32206 (Array (_ BitVec 32) ValueCell!11780)) (size!32743 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67005)

(declare-fun e!603993 () Bool)

(declare-fun array_inv!24974 (array!67005) Bool)

(assert (=> start!93898 (and (array_inv!24974 _values!955) e!603993)))

(declare-datatypes ((array!67007 0))(
  ( (array!67008 (arr!32207 (Array (_ BitVec 32) (_ BitVec 64))) (size!32744 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67007)

(declare-fun array_inv!24975 (array!67007) Bool)

(assert (=> start!93898 (array_inv!24975 _keys!1163)))

(declare-fun b!1060954 () Bool)

(assert (=> b!1060954 (= e!603992 false)))

(declare-fun lt!467670 () Bool)

(declare-datatypes ((List!22423 0))(
  ( (Nil!22420) (Cons!22419 (h!23637 (_ BitVec 64)) (t!31722 List!22423)) )
))
(declare-fun arrayNoDuplicates!0 (array!67007 (_ BitVec 32) List!22423) Bool)

(assert (=> b!1060954 (= lt!467670 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22420))))

(declare-fun b!1060955 () Bool)

(declare-fun e!603990 () Bool)

(declare-fun mapRes!39115 () Bool)

(assert (=> b!1060955 (= e!603993 (and e!603990 mapRes!39115))))

(declare-fun condMapEmpty!39115 () Bool)

(declare-fun mapDefault!39115 () ValueCell!11780)

(assert (=> b!1060955 (= condMapEmpty!39115 (= (arr!32206 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11780)) mapDefault!39115)))))

(declare-fun b!1060956 () Bool)

(declare-fun res!708339 () Bool)

(assert (=> b!1060956 (=> (not res!708339) (not e!603992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67007 (_ BitVec 32)) Bool)

(assert (=> b!1060956 (= res!708339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39115 () Bool)

(declare-fun tp!74921 () Bool)

(declare-fun e!603989 () Bool)

(assert (=> mapNonEmpty!39115 (= mapRes!39115 (and tp!74921 e!603989))))

(declare-fun mapKey!39115 () (_ BitVec 32))

(declare-fun mapRest!39115 () (Array (_ BitVec 32) ValueCell!11780))

(declare-fun mapValue!39115 () ValueCell!11780)

(assert (=> mapNonEmpty!39115 (= (arr!32206 _values!955) (store mapRest!39115 mapKey!39115 mapValue!39115))))

(declare-fun b!1060957 () Bool)

(declare-fun tp_is_empty!24967 () Bool)

(assert (=> b!1060957 (= e!603990 tp_is_empty!24967)))

(declare-fun b!1060958 () Bool)

(assert (=> b!1060958 (= e!603989 tp_is_empty!24967)))

(declare-fun mapIsEmpty!39115 () Bool)

(assert (=> mapIsEmpty!39115 mapRes!39115))

(declare-fun b!1060959 () Bool)

(declare-fun res!708340 () Bool)

(assert (=> b!1060959 (=> (not res!708340) (not e!603992))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060959 (= res!708340 (and (= (size!32743 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32744 _keys!1163) (size!32743 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93898 res!708338) b!1060959))

(assert (= (and b!1060959 res!708340) b!1060956))

(assert (= (and b!1060956 res!708339) b!1060954))

(assert (= (and b!1060955 condMapEmpty!39115) mapIsEmpty!39115))

(assert (= (and b!1060955 (not condMapEmpty!39115)) mapNonEmpty!39115))

(get-info :version)

(assert (= (and mapNonEmpty!39115 ((_ is ValueCellFull!11780) mapValue!39115)) b!1060958))

(assert (= (and b!1060955 ((_ is ValueCellFull!11780) mapDefault!39115)) b!1060957))

(assert (= start!93898 b!1060955))

(declare-fun m!980663 () Bool)

(assert (=> start!93898 m!980663))

(declare-fun m!980665 () Bool)

(assert (=> start!93898 m!980665))

(declare-fun m!980667 () Bool)

(assert (=> start!93898 m!980667))

(declare-fun m!980669 () Bool)

(assert (=> b!1060954 m!980669))

(declare-fun m!980671 () Bool)

(assert (=> b!1060956 m!980671))

(declare-fun m!980673 () Bool)

(assert (=> mapNonEmpty!39115 m!980673))

(check-sat tp_is_empty!24967 (not start!93898) (not b!1060954) (not b!1060956) (not mapNonEmpty!39115))
(check-sat)
