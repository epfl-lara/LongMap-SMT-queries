; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93626 () Bool)

(assert start!93626)

(declare-fun b!1059204 () Bool)

(declare-fun e!602818 () Bool)

(assert (=> b!1059204 (= e!602818 false)))

(declare-fun lt!466910 () Bool)

(declare-datatypes ((array!66844 0))(
  ( (array!66845 (arr!32132 (Array (_ BitVec 32) (_ BitVec 64))) (size!32670 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66844)

(declare-datatypes ((List!22455 0))(
  ( (Nil!22452) (Cons!22451 (h!23660 (_ BitVec 64)) (t!31753 List!22455)) )
))
(declare-fun arrayNoDuplicates!0 (array!66844 (_ BitVec 32) List!22455) Bool)

(assert (=> b!1059204 (= lt!466910 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22452))))

(declare-fun b!1059205 () Bool)

(declare-fun res!707612 () Bool)

(assert (=> b!1059205 (=> (not res!707612) (not e!602818))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66844 (_ BitVec 32)) Bool)

(assert (=> b!1059205 (= res!707612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!707614 () Bool)

(assert (=> start!93626 (=> (not res!707614) (not e!602818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93626 (= res!707614 (validMask!0 mask!1515))))

(assert (=> start!93626 e!602818))

(assert (=> start!93626 true))

(declare-datatypes ((V!38385 0))(
  ( (V!38386 (val!12519 Int)) )
))
(declare-datatypes ((ValueCell!11765 0))(
  ( (ValueCellFull!11765 (v!15128 V!38385)) (EmptyCell!11765) )
))
(declare-datatypes ((array!66846 0))(
  ( (array!66847 (arr!32133 (Array (_ BitVec 32) ValueCell!11765)) (size!32671 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66846)

(declare-fun e!602820 () Bool)

(declare-fun array_inv!24912 (array!66846) Bool)

(assert (=> start!93626 (and (array_inv!24912 _values!955) e!602820)))

(declare-fun array_inv!24913 (array!66844) Bool)

(assert (=> start!93626 (array_inv!24913 _keys!1163)))

(declare-fun b!1059206 () Bool)

(declare-fun e!602817 () Bool)

(declare-fun tp_is_empty!24937 () Bool)

(assert (=> b!1059206 (= e!602817 tp_is_empty!24937)))

(declare-fun mapIsEmpty!39070 () Bool)

(declare-fun mapRes!39070 () Bool)

(assert (=> mapIsEmpty!39070 mapRes!39070))

(declare-fun b!1059207 () Bool)

(declare-fun e!602819 () Bool)

(assert (=> b!1059207 (= e!602820 (and e!602819 mapRes!39070))))

(declare-fun condMapEmpty!39070 () Bool)

(declare-fun mapDefault!39070 () ValueCell!11765)

(assert (=> b!1059207 (= condMapEmpty!39070 (= (arr!32133 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11765)) mapDefault!39070)))))

(declare-fun b!1059208 () Bool)

(assert (=> b!1059208 (= e!602819 tp_is_empty!24937)))

(declare-fun b!1059209 () Bool)

(declare-fun res!707613 () Bool)

(assert (=> b!1059209 (=> (not res!707613) (not e!602818))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1059209 (= res!707613 (and (= (size!32671 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32670 _keys!1163) (size!32671 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39070 () Bool)

(declare-fun tp!74876 () Bool)

(assert (=> mapNonEmpty!39070 (= mapRes!39070 (and tp!74876 e!602817))))

(declare-fun mapKey!39070 () (_ BitVec 32))

(declare-fun mapValue!39070 () ValueCell!11765)

(declare-fun mapRest!39070 () (Array (_ BitVec 32) ValueCell!11765))

(assert (=> mapNonEmpty!39070 (= (arr!32133 _values!955) (store mapRest!39070 mapKey!39070 mapValue!39070))))

(assert (= (and start!93626 res!707614) b!1059209))

(assert (= (and b!1059209 res!707613) b!1059205))

(assert (= (and b!1059205 res!707612) b!1059204))

(assert (= (and b!1059207 condMapEmpty!39070) mapIsEmpty!39070))

(assert (= (and b!1059207 (not condMapEmpty!39070)) mapNonEmpty!39070))

(get-info :version)

(assert (= (and mapNonEmpty!39070 ((_ is ValueCellFull!11765) mapValue!39070)) b!1059206))

(assert (= (and b!1059207 ((_ is ValueCellFull!11765) mapDefault!39070)) b!1059208))

(assert (= start!93626 b!1059207))

(declare-fun m!978185 () Bool)

(assert (=> b!1059204 m!978185))

(declare-fun m!978187 () Bool)

(assert (=> b!1059205 m!978187))

(declare-fun m!978189 () Bool)

(assert (=> start!93626 m!978189))

(declare-fun m!978191 () Bool)

(assert (=> start!93626 m!978191))

(declare-fun m!978193 () Bool)

(assert (=> start!93626 m!978193))

(declare-fun m!978195 () Bool)

(assert (=> mapNonEmpty!39070 m!978195))

(check-sat (not b!1059205) (not mapNonEmpty!39070) tp_is_empty!24937 (not b!1059204) (not start!93626))
(check-sat)
