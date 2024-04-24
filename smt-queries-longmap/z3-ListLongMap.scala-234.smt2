; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4082 () Bool)

(assert start!4082)

(declare-fun b_free!991 () Bool)

(declare-fun b_next!991 () Bool)

(assert (=> start!4082 (= b_free!991 (not b_next!991))))

(declare-fun tp!4392 () Bool)

(declare-fun b_and!1791 () Bool)

(assert (=> start!4082 (= tp!4392 b_and!1791)))

(declare-fun b!30183 () Bool)

(declare-fun res!18178 () Bool)

(declare-fun e!19393 () Bool)

(assert (=> b!30183 (=> (not res!18178) (not e!19393))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1619 0))(
  ( (V!1620 (val!699 Int)) )
))
(declare-datatypes ((ValueCell!473 0))(
  ( (ValueCellFull!473 (v!1788 V!1619)) (EmptyCell!473) )
))
(declare-datatypes ((array!1899 0))(
  ( (array!1900 (arr!903 (Array (_ BitVec 32) ValueCell!473)) (size!1004 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1899)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1901 0))(
  ( (array!1902 (arr!904 (Array (_ BitVec 32) (_ BitVec 64))) (size!1005 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1901)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1619)

(declare-fun minValue!1443 () V!1619)

(declare-datatypes ((tuple2!1152 0))(
  ( (tuple2!1153 (_1!587 (_ BitVec 64)) (_2!587 V!1619)) )
))
(declare-datatypes ((List!744 0))(
  ( (Nil!741) (Cons!740 (h!1307 tuple2!1152) (t!3431 List!744)) )
))
(declare-datatypes ((ListLongMap!723 0))(
  ( (ListLongMap!724 (toList!377 List!744)) )
))
(declare-fun contains!319 (ListLongMap!723 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!202 (array!1901 array!1899 (_ BitVec 32) (_ BitVec 32) V!1619 V!1619 (_ BitVec 32) Int) ListLongMap!723)

(assert (=> b!30183 (= res!18178 (not (contains!319 (getCurrentListMap!202 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30184 () Bool)

(assert (=> b!30184 (= e!19393 false)))

(declare-datatypes ((SeekEntryResult!100 0))(
  ( (MissingZero!100 (index!2522 (_ BitVec 32))) (Found!100 (index!2523 (_ BitVec 32))) (Intermediate!100 (undefined!912 Bool) (index!2524 (_ BitVec 32)) (x!6514 (_ BitVec 32))) (Undefined!100) (MissingVacant!100 (index!2525 (_ BitVec 32))) )
))
(declare-fun lt!11358 () SeekEntryResult!100)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1901 (_ BitVec 32)) SeekEntryResult!100)

(assert (=> b!30184 (= lt!11358 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30185 () Bool)

(declare-fun e!19390 () Bool)

(declare-fun e!19392 () Bool)

(declare-fun mapRes!1546 () Bool)

(assert (=> b!30185 (= e!19390 (and e!19392 mapRes!1546))))

(declare-fun condMapEmpty!1546 () Bool)

(declare-fun mapDefault!1546 () ValueCell!473)

(assert (=> b!30185 (= condMapEmpty!1546 (= (arr!903 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!473)) mapDefault!1546)))))

(declare-fun b!30186 () Bool)

(declare-fun e!19391 () Bool)

(declare-fun tp_is_empty!1345 () Bool)

(assert (=> b!30186 (= e!19391 tp_is_empty!1345)))

(declare-fun b!30187 () Bool)

(declare-fun res!18176 () Bool)

(assert (=> b!30187 (=> (not res!18176) (not e!19393))))

(declare-fun arrayContainsKey!0 (array!1901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30187 (= res!18176 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30188 () Bool)

(declare-fun res!18179 () Bool)

(assert (=> b!30188 (=> (not res!18179) (not e!19393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1901 (_ BitVec 32)) Bool)

(assert (=> b!30188 (= res!18179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!18177 () Bool)

(assert (=> start!4082 (=> (not res!18177) (not e!19393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4082 (= res!18177 (validMask!0 mask!2294))))

(assert (=> start!4082 e!19393))

(assert (=> start!4082 true))

(assert (=> start!4082 tp!4392))

(declare-fun array_inv!625 (array!1899) Bool)

(assert (=> start!4082 (and (array_inv!625 _values!1501) e!19390)))

(declare-fun array_inv!626 (array!1901) Bool)

(assert (=> start!4082 (array_inv!626 _keys!1833)))

(assert (=> start!4082 tp_is_empty!1345))

(declare-fun b!30189 () Bool)

(declare-fun res!18174 () Bool)

(assert (=> b!30189 (=> (not res!18174) (not e!19393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30189 (= res!18174 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1546 () Bool)

(declare-fun tp!4393 () Bool)

(assert (=> mapNonEmpty!1546 (= mapRes!1546 (and tp!4393 e!19391))))

(declare-fun mapKey!1546 () (_ BitVec 32))

(declare-fun mapValue!1546 () ValueCell!473)

(declare-fun mapRest!1546 () (Array (_ BitVec 32) ValueCell!473))

(assert (=> mapNonEmpty!1546 (= (arr!903 _values!1501) (store mapRest!1546 mapKey!1546 mapValue!1546))))

(declare-fun b!30190 () Bool)

(assert (=> b!30190 (= e!19392 tp_is_empty!1345)))

(declare-fun mapIsEmpty!1546 () Bool)

(assert (=> mapIsEmpty!1546 mapRes!1546))

(declare-fun b!30191 () Bool)

(declare-fun res!18173 () Bool)

(assert (=> b!30191 (=> (not res!18173) (not e!19393))))

(assert (=> b!30191 (= res!18173 (and (= (size!1004 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1005 _keys!1833) (size!1004 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30192 () Bool)

(declare-fun res!18175 () Bool)

(assert (=> b!30192 (=> (not res!18175) (not e!19393))))

(declare-datatypes ((List!745 0))(
  ( (Nil!742) (Cons!741 (h!1308 (_ BitVec 64)) (t!3432 List!745)) )
))
(declare-fun arrayNoDuplicates!0 (array!1901 (_ BitVec 32) List!745) Bool)

(assert (=> b!30192 (= res!18175 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!742))))

(assert (= (and start!4082 res!18177) b!30191))

(assert (= (and b!30191 res!18173) b!30188))

(assert (= (and b!30188 res!18179) b!30192))

(assert (= (and b!30192 res!18175) b!30189))

(assert (= (and b!30189 res!18174) b!30183))

(assert (= (and b!30183 res!18178) b!30187))

(assert (= (and b!30187 res!18176) b!30184))

(assert (= (and b!30185 condMapEmpty!1546) mapIsEmpty!1546))

(assert (= (and b!30185 (not condMapEmpty!1546)) mapNonEmpty!1546))

(get-info :version)

(assert (= (and mapNonEmpty!1546 ((_ is ValueCellFull!473) mapValue!1546)) b!30186))

(assert (= (and b!30185 ((_ is ValueCellFull!473) mapDefault!1546)) b!30190))

(assert (= start!4082 b!30185))

(declare-fun m!24167 () Bool)

(assert (=> b!30184 m!24167))

(declare-fun m!24169 () Bool)

(assert (=> b!30189 m!24169))

(declare-fun m!24171 () Bool)

(assert (=> b!30188 m!24171))

(declare-fun m!24173 () Bool)

(assert (=> start!4082 m!24173))

(declare-fun m!24175 () Bool)

(assert (=> start!4082 m!24175))

(declare-fun m!24177 () Bool)

(assert (=> start!4082 m!24177))

(declare-fun m!24179 () Bool)

(assert (=> b!30183 m!24179))

(assert (=> b!30183 m!24179))

(declare-fun m!24181 () Bool)

(assert (=> b!30183 m!24181))

(declare-fun m!24183 () Bool)

(assert (=> mapNonEmpty!1546 m!24183))

(declare-fun m!24185 () Bool)

(assert (=> b!30187 m!24185))

(declare-fun m!24187 () Bool)

(assert (=> b!30192 m!24187))

(check-sat (not b!30192) (not start!4082) tp_is_empty!1345 b_and!1791 (not b_next!991) (not mapNonEmpty!1546) (not b!30188) (not b!30183) (not b!30184) (not b!30187) (not b!30189))
(check-sat b_and!1791 (not b_next!991))
