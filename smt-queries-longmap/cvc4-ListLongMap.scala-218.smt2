; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3994 () Bool)

(assert start!3994)

(declare-fun b_free!899 () Bool)

(declare-fun b_next!899 () Bool)

(assert (=> start!3994 (= b_free!899 (not b_next!899))))

(declare-fun tp!4117 () Bool)

(declare-fun b_and!1709 () Bool)

(assert (=> start!3994 (= tp!4117 b_and!1709)))

(declare-fun b!28911 () Bool)

(declare-fun e!18691 () Bool)

(declare-fun tp_is_empty!1253 () Bool)

(assert (=> b!28911 (= e!18691 tp_is_empty!1253)))

(declare-fun b!28912 () Bool)

(declare-fun e!18687 () Bool)

(declare-fun e!18692 () Bool)

(assert (=> b!28912 (= e!18687 e!18692)))

(declare-fun res!17289 () Bool)

(assert (=> b!28912 (=> (not res!17289) (not e!18692))))

(declare-datatypes ((V!1495 0))(
  ( (V!1496 (val!653 Int)) )
))
(declare-datatypes ((tuple2!1084 0))(
  ( (tuple2!1085 (_1!553 (_ BitVec 64)) (_2!553 V!1495)) )
))
(declare-datatypes ((List!684 0))(
  ( (Nil!681) (Cons!680 (h!1247 tuple2!1084) (t!3377 List!684)) )
))
(declare-datatypes ((ListLongMap!661 0))(
  ( (ListLongMap!662 (toList!346 List!684)) )
))
(declare-fun lt!10992 () ListLongMap!661)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!286 (ListLongMap!661 (_ BitVec 64)) Bool)

(assert (=> b!28912 (= res!17289 (not (contains!286 lt!10992 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!427 0))(
  ( (ValueCellFull!427 (v!1742 V!1495)) (EmptyCell!427) )
))
(declare-datatypes ((array!1741 0))(
  ( (array!1742 (arr!824 (Array (_ BitVec 32) ValueCell!427)) (size!925 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1741)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1743 0))(
  ( (array!1744 (arr!825 (Array (_ BitVec 32) (_ BitVec 64))) (size!926 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1743)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1495)

(declare-fun minValue!1443 () V!1495)

(declare-fun getCurrentListMap!176 (array!1743 array!1741 (_ BitVec 32) (_ BitVec 32) V!1495 V!1495 (_ BitVec 32) Int) ListLongMap!661)

(assert (=> b!28912 (= lt!10992 (getCurrentListMap!176 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28913 () Bool)

(declare-fun res!17283 () Bool)

(assert (=> b!28913 (=> (not res!17283) (not e!18687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28913 (= res!17283 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!1408 () Bool)

(declare-fun mapRes!1408 () Bool)

(assert (=> mapIsEmpty!1408 mapRes!1408))

(declare-fun b!28914 () Bool)

(declare-fun res!17284 () Bool)

(assert (=> b!28914 (=> (not res!17284) (not e!18687))))

(assert (=> b!28914 (= res!17284 (and (= (size!925 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!926 _keys!1833) (size!925 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28915 () Bool)

(declare-fun res!17288 () Bool)

(assert (=> b!28915 (=> (not res!17288) (not e!18692))))

(declare-fun arrayContainsKey!0 (array!1743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28915 (= res!17288 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28916 () Bool)

(assert (=> b!28916 (= e!18692 (not true))))

(declare-datatypes ((SeekEntryResult!75 0))(
  ( (MissingZero!75 (index!2422 (_ BitVec 32))) (Found!75 (index!2423 (_ BitVec 32))) (Intermediate!75 (undefined!887 Bool) (index!2424 (_ BitVec 32)) (x!6361 (_ BitVec 32))) (Undefined!75) (MissingVacant!75 (index!2425 (_ BitVec 32))) )
))
(declare-fun lt!10993 () SeekEntryResult!75)

(declare-fun lt!10991 () (_ BitVec 32))

(assert (=> b!28916 (and (is-Found!75 lt!10993) (= (index!2423 lt!10993) lt!10991))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1743 (_ BitVec 32)) SeekEntryResult!75)

(assert (=> b!28916 (= lt!10993 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!657 0))(
  ( (Unit!658) )
))
(declare-fun lt!10990 () Unit!657)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1743 (_ BitVec 32)) Unit!657)

(assert (=> b!28916 (= lt!10990 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!10991 _keys!1833 mask!2294))))

(assert (=> b!28916 (contains!286 lt!10992 (select (arr!825 _keys!1833) lt!10991))))

(declare-fun lt!10994 () Unit!657)

(declare-fun lemmaValidKeyInArrayIsInListMap!22 (array!1743 array!1741 (_ BitVec 32) (_ BitVec 32) V!1495 V!1495 (_ BitVec 32) Int) Unit!657)

(assert (=> b!28916 (= lt!10994 (lemmaValidKeyInArrayIsInListMap!22 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10991 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1743 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28916 (= lt!10991 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28917 () Bool)

(declare-fun res!17285 () Bool)

(assert (=> b!28917 (=> (not res!17285) (not e!18687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1743 (_ BitVec 32)) Bool)

(assert (=> b!28917 (= res!17285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28918 () Bool)

(declare-fun res!17286 () Bool)

(assert (=> b!28918 (=> (not res!17286) (not e!18687))))

(declare-datatypes ((List!685 0))(
  ( (Nil!682) (Cons!681 (h!1248 (_ BitVec 64)) (t!3378 List!685)) )
))
(declare-fun arrayNoDuplicates!0 (array!1743 (_ BitVec 32) List!685) Bool)

(assert (=> b!28918 (= res!17286 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!682))))

(declare-fun res!17287 () Bool)

(assert (=> start!3994 (=> (not res!17287) (not e!18687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3994 (= res!17287 (validMask!0 mask!2294))))

(assert (=> start!3994 e!18687))

(assert (=> start!3994 true))

(assert (=> start!3994 tp!4117))

(declare-fun e!18690 () Bool)

(declare-fun array_inv!569 (array!1741) Bool)

(assert (=> start!3994 (and (array_inv!569 _values!1501) e!18690)))

(declare-fun array_inv!570 (array!1743) Bool)

(assert (=> start!3994 (array_inv!570 _keys!1833)))

(assert (=> start!3994 tp_is_empty!1253))

(declare-fun mapNonEmpty!1408 () Bool)

(declare-fun tp!4116 () Bool)

(assert (=> mapNonEmpty!1408 (= mapRes!1408 (and tp!4116 e!18691))))

(declare-fun mapRest!1408 () (Array (_ BitVec 32) ValueCell!427))

(declare-fun mapValue!1408 () ValueCell!427)

(declare-fun mapKey!1408 () (_ BitVec 32))

(assert (=> mapNonEmpty!1408 (= (arr!824 _values!1501) (store mapRest!1408 mapKey!1408 mapValue!1408))))

(declare-fun b!28919 () Bool)

(declare-fun e!18689 () Bool)

(assert (=> b!28919 (= e!18690 (and e!18689 mapRes!1408))))

(declare-fun condMapEmpty!1408 () Bool)

(declare-fun mapDefault!1408 () ValueCell!427)

