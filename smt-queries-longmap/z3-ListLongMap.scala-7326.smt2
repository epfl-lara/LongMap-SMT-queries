; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93640 () Bool)

(assert start!93640)

(declare-fun b!1059430 () Bool)

(declare-fun e!602971 () Bool)

(declare-fun tp_is_empty!24945 () Bool)

(assert (=> b!1059430 (= e!602971 tp_is_empty!24945)))

(declare-fun b!1059431 () Bool)

(declare-fun e!602973 () Bool)

(assert (=> b!1059431 (= e!602973 false)))

(declare-fun lt!467122 () Bool)

(declare-datatypes ((array!66921 0))(
  ( (array!66922 (arr!32170 (Array (_ BitVec 32) (_ BitVec 64))) (size!32706 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66921)

(declare-datatypes ((List!22429 0))(
  ( (Nil!22426) (Cons!22425 (h!23634 (_ BitVec 64)) (t!31736 List!22429)) )
))
(declare-fun arrayNoDuplicates!0 (array!66921 (_ BitVec 32) List!22429) Bool)

(assert (=> b!1059431 (= lt!467122 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22426))))

(declare-fun b!1059432 () Bool)

(declare-fun e!602970 () Bool)

(declare-fun e!602972 () Bool)

(declare-fun mapRes!39082 () Bool)

(assert (=> b!1059432 (= e!602970 (and e!602972 mapRes!39082))))

(declare-fun condMapEmpty!39082 () Bool)

(declare-datatypes ((V!38395 0))(
  ( (V!38396 (val!12523 Int)) )
))
(declare-datatypes ((ValueCell!11769 0))(
  ( (ValueCellFull!11769 (v!15133 V!38395)) (EmptyCell!11769) )
))
(declare-datatypes ((array!66923 0))(
  ( (array!66924 (arr!32171 (Array (_ BitVec 32) ValueCell!11769)) (size!32707 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66923)

(declare-fun mapDefault!39082 () ValueCell!11769)

(assert (=> b!1059432 (= condMapEmpty!39082 (= (arr!32171 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11769)) mapDefault!39082)))))

(declare-fun mapIsEmpty!39082 () Bool)

(assert (=> mapIsEmpty!39082 mapRes!39082))

(declare-fun mapNonEmpty!39082 () Bool)

(declare-fun tp!74888 () Bool)

(assert (=> mapNonEmpty!39082 (= mapRes!39082 (and tp!74888 e!602971))))

(declare-fun mapValue!39082 () ValueCell!11769)

(declare-fun mapKey!39082 () (_ BitVec 32))

(declare-fun mapRest!39082 () (Array (_ BitVec 32) ValueCell!11769))

(assert (=> mapNonEmpty!39082 (= (arr!32171 _values!955) (store mapRest!39082 mapKey!39082 mapValue!39082))))

(declare-fun res!707718 () Bool)

(assert (=> start!93640 (=> (not res!707718) (not e!602973))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93640 (= res!707718 (validMask!0 mask!1515))))

(assert (=> start!93640 e!602973))

(assert (=> start!93640 true))

(declare-fun array_inv!24940 (array!66923) Bool)

(assert (=> start!93640 (and (array_inv!24940 _values!955) e!602970)))

(declare-fun array_inv!24941 (array!66921) Bool)

(assert (=> start!93640 (array_inv!24941 _keys!1163)))

(declare-fun b!1059429 () Bool)

(declare-fun res!707719 () Bool)

(assert (=> b!1059429 (=> (not res!707719) (not e!602973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66921 (_ BitVec 32)) Bool)

(assert (=> b!1059429 (= res!707719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059433 () Bool)

(assert (=> b!1059433 (= e!602972 tp_is_empty!24945)))

(declare-fun b!1059434 () Bool)

(declare-fun res!707717 () Bool)

(assert (=> b!1059434 (=> (not res!707717) (not e!602973))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059434 (= res!707717 (and (= (size!32707 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32706 _keys!1163) (size!32707 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93640 res!707718) b!1059434))

(assert (= (and b!1059434 res!707717) b!1059429))

(assert (= (and b!1059429 res!707719) b!1059431))

(assert (= (and b!1059432 condMapEmpty!39082) mapIsEmpty!39082))

(assert (= (and b!1059432 (not condMapEmpty!39082)) mapNonEmpty!39082))

(get-info :version)

(assert (= (and mapNonEmpty!39082 ((_ is ValueCellFull!11769) mapValue!39082)) b!1059430))

(assert (= (and b!1059432 ((_ is ValueCellFull!11769) mapDefault!39082)) b!1059433))

(assert (= start!93640 b!1059432))

(declare-fun m!978859 () Bool)

(assert (=> b!1059431 m!978859))

(declare-fun m!978861 () Bool)

(assert (=> mapNonEmpty!39082 m!978861))

(declare-fun m!978863 () Bool)

(assert (=> start!93640 m!978863))

(declare-fun m!978865 () Bool)

(assert (=> start!93640 m!978865))

(declare-fun m!978867 () Bool)

(assert (=> start!93640 m!978867))

(declare-fun m!978869 () Bool)

(assert (=> b!1059429 m!978869))

(check-sat (not b!1059429) (not b!1059431) (not mapNonEmpty!39082) (not start!93640) tp_is_empty!24945)
(check-sat)
