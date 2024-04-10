; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4116 () Bool)

(assert start!4116)

(declare-fun b_free!1021 () Bool)

(declare-fun b_next!1021 () Bool)

(assert (=> start!4116 (= b_free!1021 (not b_next!1021))))

(declare-fun tp!4482 () Bool)

(declare-fun b_and!1831 () Bool)

(assert (=> start!4116 (= tp!4482 b_and!1831)))

(declare-fun b!30707 () Bool)

(declare-fun res!18536 () Bool)

(declare-fun e!19676 () Bool)

(assert (=> b!30707 (=> (not res!18536) (not e!19676))))

(declare-datatypes ((array!1977 0))(
  ( (array!1978 (arr!942 (Array (_ BitVec 32) (_ BitVec 64))) (size!1043 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1977)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1977 (_ BitVec 32)) Bool)

(assert (=> b!30707 (= res!18536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30708 () Bool)

(declare-fun e!19672 () Bool)

(declare-fun e!19673 () Bool)

(assert (=> b!30708 (= e!19672 e!19673)))

(declare-fun res!18534 () Bool)

(assert (=> b!30708 (=> (not res!18534) (not e!19673))))

(declare-datatypes ((SeekEntryResult!108 0))(
  ( (MissingZero!108 (index!2554 (_ BitVec 32))) (Found!108 (index!2555 (_ BitVec 32))) (Intermediate!108 (undefined!920 Bool) (index!2556 (_ BitVec 32)) (x!6562 (_ BitVec 32))) (Undefined!108) (MissingVacant!108 (index!2557 (_ BitVec 32))) )
))
(declare-fun lt!11451 () SeekEntryResult!108)

(assert (=> b!30708 (= res!18534 (is-Found!108 lt!11451))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1977 (_ BitVec 32)) SeekEntryResult!108)

(assert (=> b!30708 (= lt!11451 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!30709 () Bool)

(assert (=> b!30709 (= e!19673 (not true))))

(declare-datatypes ((V!1659 0))(
  ( (V!1660 (val!714 Int)) )
))
(declare-datatypes ((tuple2!1174 0))(
  ( (tuple2!1175 (_1!598 (_ BitVec 64)) (_2!598 V!1659)) )
))
(declare-datatypes ((List!769 0))(
  ( (Nil!766) (Cons!765 (h!1332 tuple2!1174) (t!3462 List!769)) )
))
(declare-datatypes ((ListLongMap!751 0))(
  ( (ListLongMap!752 (toList!391 List!769)) )
))
(declare-fun lt!11453 () ListLongMap!751)

(declare-fun contains!331 (ListLongMap!751 (_ BitVec 64)) Bool)

(assert (=> b!30709 (contains!331 lt!11453 (select (arr!942 _keys!1833) (index!2555 lt!11451)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!488 0))(
  ( (ValueCellFull!488 (v!1803 V!1659)) (EmptyCell!488) )
))
(declare-datatypes ((array!1979 0))(
  ( (array!1980 (arr!943 (Array (_ BitVec 32) ValueCell!488)) (size!1044 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1979)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!687 0))(
  ( (Unit!688) )
))
(declare-fun lt!11452 () Unit!687)

(declare-fun zeroValue!1443 () V!1659)

(declare-fun minValue!1443 () V!1659)

(declare-fun lemmaValidKeyInArrayIsInListMap!37 (array!1977 array!1979 (_ BitVec 32) (_ BitVec 32) V!1659 V!1659 (_ BitVec 32) Int) Unit!687)

(assert (=> b!30709 (= lt!11452 (lemmaValidKeyInArrayIsInListMap!37 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2555 lt!11451) defaultEntry!1504))))

(declare-fun res!18535 () Bool)

(assert (=> start!4116 (=> (not res!18535) (not e!19676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4116 (= res!18535 (validMask!0 mask!2294))))

(assert (=> start!4116 e!19676))

(assert (=> start!4116 true))

(assert (=> start!4116 tp!4482))

(declare-fun e!19675 () Bool)

(declare-fun array_inv!657 (array!1979) Bool)

(assert (=> start!4116 (and (array_inv!657 _values!1501) e!19675)))

(declare-fun array_inv!658 (array!1977) Bool)

(assert (=> start!4116 (array_inv!658 _keys!1833)))

(declare-fun tp_is_empty!1375 () Bool)

(assert (=> start!4116 tp_is_empty!1375))

(declare-fun b!30710 () Bool)

(declare-fun res!18532 () Bool)

(assert (=> b!30710 (=> (not res!18532) (not e!19672))))

(declare-fun arrayContainsKey!0 (array!1977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30710 (= res!18532 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30711 () Bool)

(declare-fun e!19670 () Bool)

(assert (=> b!30711 (= e!19670 tp_is_empty!1375)))

(declare-fun b!30712 () Bool)

(assert (=> b!30712 (= e!19676 e!19672)))

(declare-fun res!18537 () Bool)

(assert (=> b!30712 (=> (not res!18537) (not e!19672))))

(assert (=> b!30712 (= res!18537 (not (contains!331 lt!11453 k!1304)))))

(declare-fun getCurrentListMap!219 (array!1977 array!1979 (_ BitVec 32) (_ BitVec 32) V!1659 V!1659 (_ BitVec 32) Int) ListLongMap!751)

(assert (=> b!30712 (= lt!11453 (getCurrentListMap!219 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!30713 () Bool)

(declare-fun mapRes!1591 () Bool)

(assert (=> b!30713 (= e!19675 (and e!19670 mapRes!1591))))

(declare-fun condMapEmpty!1591 () Bool)

(declare-fun mapDefault!1591 () ValueCell!488)

