; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93670 () Bool)

(assert start!93670)

(declare-fun b!1059699 () Bool)

(declare-fun e!603196 () Bool)

(declare-fun e!603197 () Bool)

(declare-fun mapRes!39127 () Bool)

(assert (=> b!1059699 (= e!603196 (and e!603197 mapRes!39127))))

(declare-fun condMapEmpty!39127 () Bool)

(declare-datatypes ((V!38435 0))(
  ( (V!38436 (val!12538 Int)) )
))
(declare-datatypes ((ValueCell!11784 0))(
  ( (ValueCellFull!11784 (v!15148 V!38435)) (EmptyCell!11784) )
))
(declare-datatypes ((array!66975 0))(
  ( (array!66976 (arr!32197 (Array (_ BitVec 32) ValueCell!11784)) (size!32733 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66975)

(declare-fun mapDefault!39127 () ValueCell!11784)

(assert (=> b!1059699 (= condMapEmpty!39127 (= (arr!32197 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11784)) mapDefault!39127)))))

(declare-fun mapNonEmpty!39127 () Bool)

(declare-fun tp!74933 () Bool)

(declare-fun e!603195 () Bool)

(assert (=> mapNonEmpty!39127 (= mapRes!39127 (and tp!74933 e!603195))))

(declare-fun mapRest!39127 () (Array (_ BitVec 32) ValueCell!11784))

(declare-fun mapKey!39127 () (_ BitVec 32))

(declare-fun mapValue!39127 () ValueCell!11784)

(assert (=> mapNonEmpty!39127 (= (arr!32197 _values!955) (store mapRest!39127 mapKey!39127 mapValue!39127))))

(declare-fun b!1059700 () Bool)

(declare-fun e!603198 () Bool)

(assert (=> b!1059700 (= e!603198 false)))

(declare-fun lt!467167 () Bool)

(declare-datatypes ((array!66977 0))(
  ( (array!66978 (arr!32198 (Array (_ BitVec 32) (_ BitVec 64))) (size!32734 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66977)

(declare-datatypes ((List!22439 0))(
  ( (Nil!22436) (Cons!22435 (h!23644 (_ BitVec 64)) (t!31746 List!22439)) )
))
(declare-fun arrayNoDuplicates!0 (array!66977 (_ BitVec 32) List!22439) Bool)

(assert (=> b!1059700 (= lt!467167 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22436))))

(declare-fun b!1059701 () Bool)

(declare-fun res!707853 () Bool)

(assert (=> b!1059701 (=> (not res!707853) (not e!603198))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059701 (= res!707853 (and (= (size!32733 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32734 _keys!1163) (size!32733 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059702 () Bool)

(declare-fun tp_is_empty!24975 () Bool)

(assert (=> b!1059702 (= e!603195 tp_is_empty!24975)))

(declare-fun b!1059703 () Bool)

(declare-fun res!707854 () Bool)

(assert (=> b!1059703 (=> (not res!707854) (not e!603198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66977 (_ BitVec 32)) Bool)

(assert (=> b!1059703 (= res!707854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059704 () Bool)

(assert (=> b!1059704 (= e!603197 tp_is_empty!24975)))

(declare-fun mapIsEmpty!39127 () Bool)

(assert (=> mapIsEmpty!39127 mapRes!39127))

(declare-fun res!707852 () Bool)

(assert (=> start!93670 (=> (not res!707852) (not e!603198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93670 (= res!707852 (validMask!0 mask!1515))))

(assert (=> start!93670 e!603198))

(assert (=> start!93670 true))

(declare-fun array_inv!24958 (array!66975) Bool)

(assert (=> start!93670 (and (array_inv!24958 _values!955) e!603196)))

(declare-fun array_inv!24959 (array!66977) Bool)

(assert (=> start!93670 (array_inv!24959 _keys!1163)))

(assert (= (and start!93670 res!707852) b!1059701))

(assert (= (and b!1059701 res!707853) b!1059703))

(assert (= (and b!1059703 res!707854) b!1059700))

(assert (= (and b!1059699 condMapEmpty!39127) mapIsEmpty!39127))

(assert (= (and b!1059699 (not condMapEmpty!39127)) mapNonEmpty!39127))

(get-info :version)

(assert (= (and mapNonEmpty!39127 ((_ is ValueCellFull!11784) mapValue!39127)) b!1059702))

(assert (= (and b!1059699 ((_ is ValueCellFull!11784) mapDefault!39127)) b!1059704))

(assert (= start!93670 b!1059699))

(declare-fun m!979039 () Bool)

(assert (=> mapNonEmpty!39127 m!979039))

(declare-fun m!979041 () Bool)

(assert (=> b!1059700 m!979041))

(declare-fun m!979043 () Bool)

(assert (=> b!1059703 m!979043))

(declare-fun m!979045 () Bool)

(assert (=> start!93670 m!979045))

(declare-fun m!979047 () Bool)

(assert (=> start!93670 m!979047))

(declare-fun m!979049 () Bool)

(assert (=> start!93670 m!979049))

(check-sat (not start!93670) (not b!1059700) tp_is_empty!24975 (not mapNonEmpty!39127) (not b!1059703))
(check-sat)
