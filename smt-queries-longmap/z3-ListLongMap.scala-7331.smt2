; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93662 () Bool)

(assert start!93662)

(declare-fun res!707775 () Bool)

(declare-fun e!603086 () Bool)

(assert (=> start!93662 (=> (not res!707775) (not e!603086))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93662 (= res!707775 (validMask!0 mask!1515))))

(assert (=> start!93662 e!603086))

(assert (=> start!93662 true))

(declare-datatypes ((V!38433 0))(
  ( (V!38434 (val!12537 Int)) )
))
(declare-datatypes ((ValueCell!11783 0))(
  ( (ValueCellFull!11783 (v!15146 V!38433)) (EmptyCell!11783) )
))
(declare-datatypes ((array!66910 0))(
  ( (array!66911 (arr!32165 (Array (_ BitVec 32) ValueCell!11783)) (size!32703 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66910)

(declare-fun e!603090 () Bool)

(declare-fun array_inv!24936 (array!66910) Bool)

(assert (=> start!93662 (and (array_inv!24936 _values!955) e!603090)))

(declare-datatypes ((array!66912 0))(
  ( (array!66913 (arr!32166 (Array (_ BitVec 32) (_ BitVec 64))) (size!32704 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66912)

(declare-fun array_inv!24937 (array!66912) Bool)

(assert (=> start!93662 (array_inv!24937 _keys!1163)))

(declare-fun b!1059528 () Bool)

(declare-fun e!603089 () Bool)

(declare-fun tp_is_empty!24973 () Bool)

(assert (=> b!1059528 (= e!603089 tp_is_empty!24973)))

(declare-fun b!1059529 () Bool)

(assert (=> b!1059529 (= e!603086 false)))

(declare-fun lt!466964 () Bool)

(declare-datatypes ((List!22466 0))(
  ( (Nil!22463) (Cons!22462 (h!23671 (_ BitVec 64)) (t!31764 List!22466)) )
))
(declare-fun arrayNoDuplicates!0 (array!66912 (_ BitVec 32) List!22466) Bool)

(assert (=> b!1059529 (= lt!466964 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22463))))

(declare-fun b!1059530 () Bool)

(declare-fun e!603087 () Bool)

(assert (=> b!1059530 (= e!603087 tp_is_empty!24973)))

(declare-fun b!1059531 () Bool)

(declare-fun res!707776 () Bool)

(assert (=> b!1059531 (=> (not res!707776) (not e!603086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66912 (_ BitVec 32)) Bool)

(assert (=> b!1059531 (= res!707776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059532 () Bool)

(declare-fun res!707774 () Bool)

(assert (=> b!1059532 (=> (not res!707774) (not e!603086))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059532 (= res!707774 (and (= (size!32703 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32704 _keys!1163) (size!32703 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39124 () Bool)

(declare-fun mapRes!39124 () Bool)

(assert (=> mapIsEmpty!39124 mapRes!39124))

(declare-fun mapNonEmpty!39124 () Bool)

(declare-fun tp!74930 () Bool)

(assert (=> mapNonEmpty!39124 (= mapRes!39124 (and tp!74930 e!603087))))

(declare-fun mapRest!39124 () (Array (_ BitVec 32) ValueCell!11783))

(declare-fun mapValue!39124 () ValueCell!11783)

(declare-fun mapKey!39124 () (_ BitVec 32))

(assert (=> mapNonEmpty!39124 (= (arr!32165 _values!955) (store mapRest!39124 mapKey!39124 mapValue!39124))))

(declare-fun b!1059533 () Bool)

(assert (=> b!1059533 (= e!603090 (and e!603089 mapRes!39124))))

(declare-fun condMapEmpty!39124 () Bool)

(declare-fun mapDefault!39124 () ValueCell!11783)

(assert (=> b!1059533 (= condMapEmpty!39124 (= (arr!32165 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11783)) mapDefault!39124)))))

(assert (= (and start!93662 res!707775) b!1059532))

(assert (= (and b!1059532 res!707774) b!1059531))

(assert (= (and b!1059531 res!707776) b!1059529))

(assert (= (and b!1059533 condMapEmpty!39124) mapIsEmpty!39124))

(assert (= (and b!1059533 (not condMapEmpty!39124)) mapNonEmpty!39124))

(get-info :version)

(assert (= (and mapNonEmpty!39124 ((_ is ValueCellFull!11783) mapValue!39124)) b!1059530))

(assert (= (and b!1059533 ((_ is ValueCellFull!11783) mapDefault!39124)) b!1059528))

(assert (= start!93662 b!1059533))

(declare-fun m!978401 () Bool)

(assert (=> start!93662 m!978401))

(declare-fun m!978403 () Bool)

(assert (=> start!93662 m!978403))

(declare-fun m!978405 () Bool)

(assert (=> start!93662 m!978405))

(declare-fun m!978407 () Bool)

(assert (=> b!1059529 m!978407))

(declare-fun m!978409 () Bool)

(assert (=> b!1059531 m!978409))

(declare-fun m!978411 () Bool)

(assert (=> mapNonEmpty!39124 m!978411))

(check-sat (not mapNonEmpty!39124) (not b!1059529) (not b!1059531) (not start!93662) tp_is_empty!24973)
(check-sat)
