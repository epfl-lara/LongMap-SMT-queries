; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93886 () Bool)

(assert start!93886)

(declare-fun b!1060846 () Bool)

(declare-fun res!708286 () Bool)

(declare-fun e!603899 () Bool)

(assert (=> b!1060846 (=> (not res!708286) (not e!603899))))

(declare-datatypes ((array!66985 0))(
  ( (array!66986 (arr!32196 (Array (_ BitVec 32) (_ BitVec 64))) (size!32733 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66985)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66985 (_ BitVec 32)) Bool)

(assert (=> b!1060846 (= res!708286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708284 () Bool)

(assert (=> start!93886 (=> (not res!708284) (not e!603899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93886 (= res!708284 (validMask!0 mask!1515))))

(assert (=> start!93886 e!603899))

(assert (=> start!93886 true))

(declare-datatypes ((V!38409 0))(
  ( (V!38410 (val!12528 Int)) )
))
(declare-datatypes ((ValueCell!11774 0))(
  ( (ValueCellFull!11774 (v!15134 V!38409)) (EmptyCell!11774) )
))
(declare-datatypes ((array!66987 0))(
  ( (array!66988 (arr!32197 (Array (_ BitVec 32) ValueCell!11774)) (size!32734 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66987)

(declare-fun e!603903 () Bool)

(declare-fun array_inv!24966 (array!66987) Bool)

(assert (=> start!93886 (and (array_inv!24966 _values!955) e!603903)))

(declare-fun array_inv!24967 (array!66985) Bool)

(assert (=> start!93886 (array_inv!24967 _keys!1163)))

(declare-fun mapIsEmpty!39097 () Bool)

(declare-fun mapRes!39097 () Bool)

(assert (=> mapIsEmpty!39097 mapRes!39097))

(declare-fun b!1060847 () Bool)

(assert (=> b!1060847 (= e!603899 false)))

(declare-fun lt!467652 () Bool)

(declare-datatypes ((List!22419 0))(
  ( (Nil!22416) (Cons!22415 (h!23633 (_ BitVec 64)) (t!31718 List!22419)) )
))
(declare-fun arrayNoDuplicates!0 (array!66985 (_ BitVec 32) List!22419) Bool)

(assert (=> b!1060847 (= lt!467652 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22416))))

(declare-fun b!1060848 () Bool)

(declare-fun e!603900 () Bool)

(declare-fun tp_is_empty!24955 () Bool)

(assert (=> b!1060848 (= e!603900 tp_is_empty!24955)))

(declare-fun mapNonEmpty!39097 () Bool)

(declare-fun tp!74903 () Bool)

(declare-fun e!603901 () Bool)

(assert (=> mapNonEmpty!39097 (= mapRes!39097 (and tp!74903 e!603901))))

(declare-fun mapValue!39097 () ValueCell!11774)

(declare-fun mapKey!39097 () (_ BitVec 32))

(declare-fun mapRest!39097 () (Array (_ BitVec 32) ValueCell!11774))

(assert (=> mapNonEmpty!39097 (= (arr!32197 _values!955) (store mapRest!39097 mapKey!39097 mapValue!39097))))

(declare-fun b!1060849 () Bool)

(assert (=> b!1060849 (= e!603903 (and e!603900 mapRes!39097))))

(declare-fun condMapEmpty!39097 () Bool)

(declare-fun mapDefault!39097 () ValueCell!11774)

(assert (=> b!1060849 (= condMapEmpty!39097 (= (arr!32197 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11774)) mapDefault!39097)))))

(declare-fun b!1060850 () Bool)

(assert (=> b!1060850 (= e!603901 tp_is_empty!24955)))

(declare-fun b!1060851 () Bool)

(declare-fun res!708285 () Bool)

(assert (=> b!1060851 (=> (not res!708285) (not e!603899))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060851 (= res!708285 (and (= (size!32734 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32733 _keys!1163) (size!32734 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93886 res!708284) b!1060851))

(assert (= (and b!1060851 res!708285) b!1060846))

(assert (= (and b!1060846 res!708286) b!1060847))

(assert (= (and b!1060849 condMapEmpty!39097) mapIsEmpty!39097))

(assert (= (and b!1060849 (not condMapEmpty!39097)) mapNonEmpty!39097))

(get-info :version)

(assert (= (and mapNonEmpty!39097 ((_ is ValueCellFull!11774) mapValue!39097)) b!1060850))

(assert (= (and b!1060849 ((_ is ValueCellFull!11774) mapDefault!39097)) b!1060848))

(assert (= start!93886 b!1060849))

(declare-fun m!980591 () Bool)

(assert (=> b!1060846 m!980591))

(declare-fun m!980593 () Bool)

(assert (=> start!93886 m!980593))

(declare-fun m!980595 () Bool)

(assert (=> start!93886 m!980595))

(declare-fun m!980597 () Bool)

(assert (=> start!93886 m!980597))

(declare-fun m!980599 () Bool)

(assert (=> b!1060847 m!980599))

(declare-fun m!980601 () Bool)

(assert (=> mapNonEmpty!39097 m!980601))

(check-sat (not mapNonEmpty!39097) (not start!93886) (not b!1060846) (not b!1060847) tp_is_empty!24955)
(check-sat)
