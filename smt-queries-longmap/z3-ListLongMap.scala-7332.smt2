; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93668 () Bool)

(assert start!93668)

(declare-fun mapIsEmpty!39133 () Bool)

(declare-fun mapRes!39133 () Bool)

(assert (=> mapIsEmpty!39133 mapRes!39133))

(declare-fun b!1059582 () Bool)

(declare-fun res!707803 () Bool)

(declare-fun e!603132 () Bool)

(assert (=> b!1059582 (=> (not res!707803) (not e!603132))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38441 0))(
  ( (V!38442 (val!12540 Int)) )
))
(declare-datatypes ((ValueCell!11786 0))(
  ( (ValueCellFull!11786 (v!15149 V!38441)) (EmptyCell!11786) )
))
(declare-datatypes ((array!66920 0))(
  ( (array!66921 (arr!32170 (Array (_ BitVec 32) ValueCell!11786)) (size!32708 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66920)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66922 0))(
  ( (array!66923 (arr!32171 (Array (_ BitVec 32) (_ BitVec 64))) (size!32709 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66922)

(assert (=> b!1059582 (= res!707803 (and (= (size!32708 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32709 _keys!1163) (size!32708 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059583 () Bool)

(declare-fun e!603133 () Bool)

(declare-fun tp_is_empty!24979 () Bool)

(assert (=> b!1059583 (= e!603133 tp_is_empty!24979)))

(declare-fun b!1059584 () Bool)

(declare-fun e!603135 () Bool)

(assert (=> b!1059584 (= e!603135 (and e!603133 mapRes!39133))))

(declare-fun condMapEmpty!39133 () Bool)

(declare-fun mapDefault!39133 () ValueCell!11786)

(assert (=> b!1059584 (= condMapEmpty!39133 (= (arr!32170 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11786)) mapDefault!39133)))))

(declare-fun res!707801 () Bool)

(assert (=> start!93668 (=> (not res!707801) (not e!603132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93668 (= res!707801 (validMask!0 mask!1515))))

(assert (=> start!93668 e!603132))

(assert (=> start!93668 true))

(declare-fun array_inv!24940 (array!66920) Bool)

(assert (=> start!93668 (and (array_inv!24940 _values!955) e!603135)))

(declare-fun array_inv!24941 (array!66922) Bool)

(assert (=> start!93668 (array_inv!24941 _keys!1163)))

(declare-fun b!1059585 () Bool)

(assert (=> b!1059585 (= e!603132 false)))

(declare-fun lt!466973 () Bool)

(declare-datatypes ((List!22467 0))(
  ( (Nil!22464) (Cons!22463 (h!23672 (_ BitVec 64)) (t!31765 List!22467)) )
))
(declare-fun arrayNoDuplicates!0 (array!66922 (_ BitVec 32) List!22467) Bool)

(assert (=> b!1059585 (= lt!466973 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22464))))

(declare-fun mapNonEmpty!39133 () Bool)

(declare-fun tp!74939 () Bool)

(declare-fun e!603134 () Bool)

(assert (=> mapNonEmpty!39133 (= mapRes!39133 (and tp!74939 e!603134))))

(declare-fun mapKey!39133 () (_ BitVec 32))

(declare-fun mapValue!39133 () ValueCell!11786)

(declare-fun mapRest!39133 () (Array (_ BitVec 32) ValueCell!11786))

(assert (=> mapNonEmpty!39133 (= (arr!32170 _values!955) (store mapRest!39133 mapKey!39133 mapValue!39133))))

(declare-fun b!1059586 () Bool)

(assert (=> b!1059586 (= e!603134 tp_is_empty!24979)))

(declare-fun b!1059587 () Bool)

(declare-fun res!707802 () Bool)

(assert (=> b!1059587 (=> (not res!707802) (not e!603132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66922 (_ BitVec 32)) Bool)

(assert (=> b!1059587 (= res!707802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!93668 res!707801) b!1059582))

(assert (= (and b!1059582 res!707803) b!1059587))

(assert (= (and b!1059587 res!707802) b!1059585))

(assert (= (and b!1059584 condMapEmpty!39133) mapIsEmpty!39133))

(assert (= (and b!1059584 (not condMapEmpty!39133)) mapNonEmpty!39133))

(get-info :version)

(assert (= (and mapNonEmpty!39133 ((_ is ValueCellFull!11786) mapValue!39133)) b!1059586))

(assert (= (and b!1059584 ((_ is ValueCellFull!11786) mapDefault!39133)) b!1059583))

(assert (= start!93668 b!1059584))

(declare-fun m!978437 () Bool)

(assert (=> start!93668 m!978437))

(declare-fun m!978439 () Bool)

(assert (=> start!93668 m!978439))

(declare-fun m!978441 () Bool)

(assert (=> start!93668 m!978441))

(declare-fun m!978443 () Bool)

(assert (=> b!1059585 m!978443))

(declare-fun m!978445 () Bool)

(assert (=> mapNonEmpty!39133 m!978445))

(declare-fun m!978447 () Bool)

(assert (=> b!1059587 m!978447))

(check-sat (not b!1059585) (not start!93668) tp_is_empty!24979 (not b!1059587) (not mapNonEmpty!39133))
(check-sat)
