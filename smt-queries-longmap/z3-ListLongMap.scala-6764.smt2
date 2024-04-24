; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85048 () Bool)

(assert start!85048)

(declare-fun res!663333 () Bool)

(declare-fun e!560070 () Bool)

(assert (=> start!85048 (=> (not res!663333) (not e!560070))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85048 (= res!663333 (validMask!0 mask!2471))))

(assert (=> start!85048 e!560070))

(assert (=> start!85048 true))

(declare-datatypes ((V!36129 0))(
  ( (V!36130 (val!11730 Int)) )
))
(declare-datatypes ((ValueCell!11198 0))(
  ( (ValueCellFull!11198 (v!14304 V!36129)) (EmptyCell!11198) )
))
(declare-datatypes ((array!62734 0))(
  ( (array!62735 (arr!30207 (Array (_ BitVec 32) ValueCell!11198)) (size!30687 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62734)

(declare-fun e!560067 () Bool)

(declare-fun array_inv!23351 (array!62734) Bool)

(assert (=> start!85048 (and (array_inv!23351 _values!1551) e!560067)))

(declare-datatypes ((array!62736 0))(
  ( (array!62737 (arr!30208 (Array (_ BitVec 32) (_ BitVec 64))) (size!30688 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62736)

(declare-fun array_inv!23352 (array!62736) Bool)

(assert (=> start!85048 (array_inv!23352 _keys!1945)))

(declare-fun b!992806 () Bool)

(declare-fun e!560068 () Bool)

(declare-fun tp_is_empty!23359 () Bool)

(assert (=> b!992806 (= e!560068 tp_is_empty!23359)))

(declare-fun b!992807 () Bool)

(declare-fun res!663332 () Bool)

(assert (=> b!992807 (=> (not res!663332) (not e!560070))))

(declare-fun k0!1425 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!992807 (= res!663332 (validKeyInArray!0 k0!1425))))

(declare-fun b!992808 () Bool)

(declare-fun res!663334 () Bool)

(assert (=> b!992808 (=> (not res!663334) (not e!560070))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!992808 (= res!663334 (and (= (size!30687 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30688 _keys!1945) (size!30687 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!992809 () Bool)

(declare-fun e!560069 () Bool)

(declare-fun mapRes!37110 () Bool)

(assert (=> b!992809 (= e!560067 (and e!560069 mapRes!37110))))

(declare-fun condMapEmpty!37110 () Bool)

(declare-fun mapDefault!37110 () ValueCell!11198)

(assert (=> b!992809 (= condMapEmpty!37110 (= (arr!30207 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11198)) mapDefault!37110)))))

(declare-fun b!992810 () Bool)

(declare-fun res!663335 () Bool)

(assert (=> b!992810 (=> (not res!663335) (not e!560070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62736 (_ BitVec 32)) Bool)

(assert (=> b!992810 (= res!663335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun mapNonEmpty!37110 () Bool)

(declare-fun tp!70182 () Bool)

(assert (=> mapNonEmpty!37110 (= mapRes!37110 (and tp!70182 e!560068))))

(declare-fun mapRest!37110 () (Array (_ BitVec 32) ValueCell!11198))

(declare-fun mapKey!37110 () (_ BitVec 32))

(declare-fun mapValue!37110 () ValueCell!11198)

(assert (=> mapNonEmpty!37110 (= (arr!30207 _values!1551) (store mapRest!37110 mapKey!37110 mapValue!37110))))

(declare-fun b!992811 () Bool)

(declare-fun res!663331 () Bool)

(assert (=> b!992811 (=> (not res!663331) (not e!560070))))

(declare-datatypes ((List!20855 0))(
  ( (Nil!20852) (Cons!20851 (h!22019 (_ BitVec 64)) (t!29830 List!20855)) )
))
(declare-fun arrayNoDuplicates!0 (array!62736 (_ BitVec 32) List!20855) Bool)

(assert (=> b!992811 (= res!663331 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20852))))

(declare-fun b!992812 () Bool)

(assert (=> b!992812 (= e!560070 (not (= (size!30688 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471))))))

(declare-fun mapIsEmpty!37110 () Bool)

(assert (=> mapIsEmpty!37110 mapRes!37110))

(declare-fun b!992813 () Bool)

(assert (=> b!992813 (= e!560069 tp_is_empty!23359)))

(assert (= (and start!85048 res!663333) b!992808))

(assert (= (and b!992808 res!663334) b!992810))

(assert (= (and b!992810 res!663335) b!992811))

(assert (= (and b!992811 res!663331) b!992807))

(assert (= (and b!992807 res!663332) b!992812))

(assert (= (and b!992809 condMapEmpty!37110) mapIsEmpty!37110))

(assert (= (and b!992809 (not condMapEmpty!37110)) mapNonEmpty!37110))

(get-info :version)

(assert (= (and mapNonEmpty!37110 ((_ is ValueCellFull!11198) mapValue!37110)) b!992806))

(assert (= (and b!992809 ((_ is ValueCellFull!11198) mapDefault!37110)) b!992813))

(assert (= start!85048 b!992809))

(declare-fun m!920971 () Bool)

(assert (=> b!992810 m!920971))

(declare-fun m!920973 () Bool)

(assert (=> b!992807 m!920973))

(declare-fun m!920975 () Bool)

(assert (=> mapNonEmpty!37110 m!920975))

(declare-fun m!920977 () Bool)

(assert (=> b!992811 m!920977))

(declare-fun m!920979 () Bool)

(assert (=> start!85048 m!920979))

(declare-fun m!920981 () Bool)

(assert (=> start!85048 m!920981))

(declare-fun m!920983 () Bool)

(assert (=> start!85048 m!920983))

(check-sat (not b!992807) tp_is_empty!23359 (not start!85048) (not b!992810) (not b!992811) (not mapNonEmpty!37110))
(check-sat)
