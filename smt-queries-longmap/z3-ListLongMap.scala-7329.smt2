; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93650 () Bool)

(assert start!93650)

(declare-fun mapIsEmpty!39106 () Bool)

(declare-fun mapRes!39106 () Bool)

(assert (=> mapIsEmpty!39106 mapRes!39106))

(declare-fun res!707720 () Bool)

(declare-fun e!602999 () Bool)

(assert (=> start!93650 (=> (not res!707720) (not e!602999))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93650 (= res!707720 (validMask!0 mask!1515))))

(assert (=> start!93650 e!602999))

(assert (=> start!93650 true))

(declare-datatypes ((V!38417 0))(
  ( (V!38418 (val!12531 Int)) )
))
(declare-datatypes ((ValueCell!11777 0))(
  ( (ValueCellFull!11777 (v!15140 V!38417)) (EmptyCell!11777) )
))
(declare-datatypes ((array!66886 0))(
  ( (array!66887 (arr!32153 (Array (_ BitVec 32) ValueCell!11777)) (size!32691 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66886)

(declare-fun e!603000 () Bool)

(declare-fun array_inv!24926 (array!66886) Bool)

(assert (=> start!93650 (and (array_inv!24926 _values!955) e!603000)))

(declare-datatypes ((array!66888 0))(
  ( (array!66889 (arr!32154 (Array (_ BitVec 32) (_ BitVec 64))) (size!32692 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66888)

(declare-fun array_inv!24927 (array!66888) Bool)

(assert (=> start!93650 (array_inv!24927 _keys!1163)))

(declare-fun b!1059420 () Bool)

(declare-fun res!707721 () Bool)

(assert (=> b!1059420 (=> (not res!707721) (not e!602999))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059420 (= res!707721 (and (= (size!32691 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32692 _keys!1163) (size!32691 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059421 () Bool)

(declare-fun e!602998 () Bool)

(declare-fun tp_is_empty!24961 () Bool)

(assert (=> b!1059421 (= e!602998 tp_is_empty!24961)))

(declare-fun b!1059422 () Bool)

(assert (=> b!1059422 (= e!602999 false)))

(declare-fun lt!466946 () Bool)

(declare-datatypes ((List!22462 0))(
  ( (Nil!22459) (Cons!22458 (h!23667 (_ BitVec 64)) (t!31760 List!22462)) )
))
(declare-fun arrayNoDuplicates!0 (array!66888 (_ BitVec 32) List!22462) Bool)

(assert (=> b!1059422 (= lt!466946 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22459))))

(declare-fun b!1059423 () Bool)

(assert (=> b!1059423 (= e!603000 (and e!602998 mapRes!39106))))

(declare-fun condMapEmpty!39106 () Bool)

(declare-fun mapDefault!39106 () ValueCell!11777)

(assert (=> b!1059423 (= condMapEmpty!39106 (= (arr!32153 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11777)) mapDefault!39106)))))

(declare-fun b!1059424 () Bool)

(declare-fun res!707722 () Bool)

(assert (=> b!1059424 (=> (not res!707722) (not e!602999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66888 (_ BitVec 32)) Bool)

(assert (=> b!1059424 (= res!707722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059425 () Bool)

(declare-fun e!602996 () Bool)

(assert (=> b!1059425 (= e!602996 tp_is_empty!24961)))

(declare-fun mapNonEmpty!39106 () Bool)

(declare-fun tp!74912 () Bool)

(assert (=> mapNonEmpty!39106 (= mapRes!39106 (and tp!74912 e!602996))))

(declare-fun mapValue!39106 () ValueCell!11777)

(declare-fun mapKey!39106 () (_ BitVec 32))

(declare-fun mapRest!39106 () (Array (_ BitVec 32) ValueCell!11777))

(assert (=> mapNonEmpty!39106 (= (arr!32153 _values!955) (store mapRest!39106 mapKey!39106 mapValue!39106))))

(assert (= (and start!93650 res!707720) b!1059420))

(assert (= (and b!1059420 res!707721) b!1059424))

(assert (= (and b!1059424 res!707722) b!1059422))

(assert (= (and b!1059423 condMapEmpty!39106) mapIsEmpty!39106))

(assert (= (and b!1059423 (not condMapEmpty!39106)) mapNonEmpty!39106))

(get-info :version)

(assert (= (and mapNonEmpty!39106 ((_ is ValueCellFull!11777) mapValue!39106)) b!1059425))

(assert (= (and b!1059423 ((_ is ValueCellFull!11777) mapDefault!39106)) b!1059421))

(assert (= start!93650 b!1059423))

(declare-fun m!978329 () Bool)

(assert (=> start!93650 m!978329))

(declare-fun m!978331 () Bool)

(assert (=> start!93650 m!978331))

(declare-fun m!978333 () Bool)

(assert (=> start!93650 m!978333))

(declare-fun m!978335 () Bool)

(assert (=> b!1059422 m!978335))

(declare-fun m!978337 () Bool)

(assert (=> b!1059424 m!978337))

(declare-fun m!978339 () Bool)

(assert (=> mapNonEmpty!39106 m!978339))

(check-sat (not start!93650) (not b!1059422) (not b!1059424) tp_is_empty!24961 (not mapNonEmpty!39106))
(check-sat)
