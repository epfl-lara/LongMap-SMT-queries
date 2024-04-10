; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93664 () Bool)

(assert start!93664)

(declare-fun b!1059645 () Bool)

(declare-fun e!603149 () Bool)

(declare-fun tp_is_empty!24969 () Bool)

(assert (=> b!1059645 (= e!603149 tp_is_empty!24969)))

(declare-fun b!1059646 () Bool)

(declare-fun e!603150 () Bool)

(declare-fun e!603152 () Bool)

(declare-fun mapRes!39118 () Bool)

(assert (=> b!1059646 (= e!603150 (and e!603152 mapRes!39118))))

(declare-fun condMapEmpty!39118 () Bool)

(declare-datatypes ((V!38427 0))(
  ( (V!38428 (val!12535 Int)) )
))
(declare-datatypes ((ValueCell!11781 0))(
  ( (ValueCellFull!11781 (v!15145 V!38427)) (EmptyCell!11781) )
))
(declare-datatypes ((array!66965 0))(
  ( (array!66966 (arr!32192 (Array (_ BitVec 32) ValueCell!11781)) (size!32728 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66965)

(declare-fun mapDefault!39118 () ValueCell!11781)

(assert (=> b!1059646 (= condMapEmpty!39118 (= (arr!32192 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11781)) mapDefault!39118)))))

(declare-fun res!707827 () Bool)

(declare-fun e!603151 () Bool)

(assert (=> start!93664 (=> (not res!707827) (not e!603151))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93664 (= res!707827 (validMask!0 mask!1515))))

(assert (=> start!93664 e!603151))

(assert (=> start!93664 true))

(declare-fun array_inv!24954 (array!66965) Bool)

(assert (=> start!93664 (and (array_inv!24954 _values!955) e!603150)))

(declare-datatypes ((array!66967 0))(
  ( (array!66968 (arr!32193 (Array (_ BitVec 32) (_ BitVec 64))) (size!32729 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66967)

(declare-fun array_inv!24955 (array!66967) Bool)

(assert (=> start!93664 (array_inv!24955 _keys!1163)))

(declare-fun b!1059647 () Bool)

(assert (=> b!1059647 (= e!603152 tp_is_empty!24969)))

(declare-fun mapIsEmpty!39118 () Bool)

(assert (=> mapIsEmpty!39118 mapRes!39118))

(declare-fun b!1059648 () Bool)

(declare-fun res!707826 () Bool)

(assert (=> b!1059648 (=> (not res!707826) (not e!603151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66967 (_ BitVec 32)) Bool)

(assert (=> b!1059648 (= res!707826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059649 () Bool)

(assert (=> b!1059649 (= e!603151 false)))

(declare-fun lt!467158 () Bool)

(declare-datatypes ((List!22437 0))(
  ( (Nil!22434) (Cons!22433 (h!23642 (_ BitVec 64)) (t!31744 List!22437)) )
))
(declare-fun arrayNoDuplicates!0 (array!66967 (_ BitVec 32) List!22437) Bool)

(assert (=> b!1059649 (= lt!467158 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22434))))

(declare-fun mapNonEmpty!39118 () Bool)

(declare-fun tp!74924 () Bool)

(assert (=> mapNonEmpty!39118 (= mapRes!39118 (and tp!74924 e!603149))))

(declare-fun mapKey!39118 () (_ BitVec 32))

(declare-fun mapValue!39118 () ValueCell!11781)

(declare-fun mapRest!39118 () (Array (_ BitVec 32) ValueCell!11781))

(assert (=> mapNonEmpty!39118 (= (arr!32192 _values!955) (store mapRest!39118 mapKey!39118 mapValue!39118))))

(declare-fun b!1059650 () Bool)

(declare-fun res!707825 () Bool)

(assert (=> b!1059650 (=> (not res!707825) (not e!603151))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059650 (= res!707825 (and (= (size!32728 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32729 _keys!1163) (size!32728 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93664 res!707827) b!1059650))

(assert (= (and b!1059650 res!707825) b!1059648))

(assert (= (and b!1059648 res!707826) b!1059649))

(assert (= (and b!1059646 condMapEmpty!39118) mapIsEmpty!39118))

(assert (= (and b!1059646 (not condMapEmpty!39118)) mapNonEmpty!39118))

(get-info :version)

(assert (= (and mapNonEmpty!39118 ((_ is ValueCellFull!11781) mapValue!39118)) b!1059645))

(assert (= (and b!1059646 ((_ is ValueCellFull!11781) mapDefault!39118)) b!1059647))

(assert (= start!93664 b!1059646))

(declare-fun m!979003 () Bool)

(assert (=> start!93664 m!979003))

(declare-fun m!979005 () Bool)

(assert (=> start!93664 m!979005))

(declare-fun m!979007 () Bool)

(assert (=> start!93664 m!979007))

(declare-fun m!979009 () Bool)

(assert (=> b!1059648 m!979009))

(declare-fun m!979011 () Bool)

(assert (=> b!1059649 m!979011))

(declare-fun m!979013 () Bool)

(assert (=> mapNonEmpty!39118 m!979013))

(check-sat (not mapNonEmpty!39118) (not start!93664) (not b!1059649) (not b!1059648) tp_is_empty!24969)
(check-sat)
