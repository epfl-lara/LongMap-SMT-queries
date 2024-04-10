; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93676 () Bool)

(assert start!93676)

(declare-fun b!1059753 () Bool)

(declare-fun e!603243 () Bool)

(declare-fun tp_is_empty!24981 () Bool)

(assert (=> b!1059753 (= e!603243 tp_is_empty!24981)))

(declare-fun mapNonEmpty!39136 () Bool)

(declare-fun mapRes!39136 () Bool)

(declare-fun tp!74942 () Bool)

(declare-fun e!603240 () Bool)

(assert (=> mapNonEmpty!39136 (= mapRes!39136 (and tp!74942 e!603240))))

(declare-fun mapKey!39136 () (_ BitVec 32))

(declare-datatypes ((V!38443 0))(
  ( (V!38444 (val!12541 Int)) )
))
(declare-datatypes ((ValueCell!11787 0))(
  ( (ValueCellFull!11787 (v!15151 V!38443)) (EmptyCell!11787) )
))
(declare-fun mapRest!39136 () (Array (_ BitVec 32) ValueCell!11787))

(declare-datatypes ((array!66985 0))(
  ( (array!66986 (arr!32202 (Array (_ BitVec 32) ValueCell!11787)) (size!32738 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66985)

(declare-fun mapValue!39136 () ValueCell!11787)

(assert (=> mapNonEmpty!39136 (= (arr!32202 _values!955) (store mapRest!39136 mapKey!39136 mapValue!39136))))

(declare-fun res!707880 () Bool)

(declare-fun e!603241 () Bool)

(assert (=> start!93676 (=> (not res!707880) (not e!603241))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93676 (= res!707880 (validMask!0 mask!1515))))

(assert (=> start!93676 e!603241))

(assert (=> start!93676 true))

(declare-fun e!603242 () Bool)

(declare-fun array_inv!24962 (array!66985) Bool)

(assert (=> start!93676 (and (array_inv!24962 _values!955) e!603242)))

(declare-datatypes ((array!66987 0))(
  ( (array!66988 (arr!32203 (Array (_ BitVec 32) (_ BitVec 64))) (size!32739 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66987)

(declare-fun array_inv!24963 (array!66987) Bool)

(assert (=> start!93676 (array_inv!24963 _keys!1163)))

(declare-fun b!1059754 () Bool)

(declare-fun res!707881 () Bool)

(assert (=> b!1059754 (=> (not res!707881) (not e!603241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66987 (_ BitVec 32)) Bool)

(assert (=> b!1059754 (= res!707881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059755 () Bool)

(assert (=> b!1059755 (= e!603242 (and e!603243 mapRes!39136))))

(declare-fun condMapEmpty!39136 () Bool)

(declare-fun mapDefault!39136 () ValueCell!11787)

(assert (=> b!1059755 (= condMapEmpty!39136 (= (arr!32202 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11787)) mapDefault!39136)))))

(declare-fun b!1059756 () Bool)

(declare-fun res!707879 () Bool)

(assert (=> b!1059756 (=> (not res!707879) (not e!603241))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059756 (= res!707879 (and (= (size!32738 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32739 _keys!1163) (size!32738 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39136 () Bool)

(assert (=> mapIsEmpty!39136 mapRes!39136))

(declare-fun b!1059757 () Bool)

(assert (=> b!1059757 (= e!603240 tp_is_empty!24981)))

(declare-fun b!1059758 () Bool)

(assert (=> b!1059758 (= e!603241 false)))

(declare-fun lt!467176 () Bool)

(declare-datatypes ((List!22441 0))(
  ( (Nil!22438) (Cons!22437 (h!23646 (_ BitVec 64)) (t!31748 List!22441)) )
))
(declare-fun arrayNoDuplicates!0 (array!66987 (_ BitVec 32) List!22441) Bool)

(assert (=> b!1059758 (= lt!467176 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22438))))

(assert (= (and start!93676 res!707880) b!1059756))

(assert (= (and b!1059756 res!707879) b!1059754))

(assert (= (and b!1059754 res!707881) b!1059758))

(assert (= (and b!1059755 condMapEmpty!39136) mapIsEmpty!39136))

(assert (= (and b!1059755 (not condMapEmpty!39136)) mapNonEmpty!39136))

(get-info :version)

(assert (= (and mapNonEmpty!39136 ((_ is ValueCellFull!11787) mapValue!39136)) b!1059757))

(assert (= (and b!1059755 ((_ is ValueCellFull!11787) mapDefault!39136)) b!1059753))

(assert (= start!93676 b!1059755))

(declare-fun m!979075 () Bool)

(assert (=> mapNonEmpty!39136 m!979075))

(declare-fun m!979077 () Bool)

(assert (=> start!93676 m!979077))

(declare-fun m!979079 () Bool)

(assert (=> start!93676 m!979079))

(declare-fun m!979081 () Bool)

(assert (=> start!93676 m!979081))

(declare-fun m!979083 () Bool)

(assert (=> b!1059754 m!979083))

(declare-fun m!979085 () Bool)

(assert (=> b!1059758 m!979085))

(check-sat (not mapNonEmpty!39136) tp_is_empty!24981 (not start!93676) (not b!1059758) (not b!1059754))
(check-sat)
