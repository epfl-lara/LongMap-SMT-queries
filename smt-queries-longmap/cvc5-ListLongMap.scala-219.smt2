; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3996 () Bool)

(assert start!3996)

(declare-fun b_free!901 () Bool)

(declare-fun b_next!901 () Bool)

(assert (=> start!3996 (= b_free!901 (not b_next!901))))

(declare-fun tp!4122 () Bool)

(declare-fun b_and!1711 () Bool)

(assert (=> start!3996 (= tp!4122 b_and!1711)))

(declare-fun b!28941 () Bool)

(declare-fun e!18708 () Bool)

(declare-fun tp_is_empty!1255 () Bool)

(assert (=> b!28941 (= e!18708 tp_is_empty!1255)))

(declare-fun b!28942 () Bool)

(declare-fun e!18709 () Bool)

(declare-fun e!18707 () Bool)

(assert (=> b!28942 (= e!18709 e!18707)))

(declare-fun res!17307 () Bool)

(assert (=> b!28942 (=> (not res!17307) (not e!18707))))

(declare-datatypes ((V!1499 0))(
  ( (V!1500 (val!654 Int)) )
))
(declare-datatypes ((tuple2!1086 0))(
  ( (tuple2!1087 (_1!554 (_ BitVec 64)) (_2!554 V!1499)) )
))
(declare-datatypes ((List!686 0))(
  ( (Nil!683) (Cons!682 (h!1249 tuple2!1086) (t!3379 List!686)) )
))
(declare-datatypes ((ListLongMap!663 0))(
  ( (ListLongMap!664 (toList!347 List!686)) )
))
(declare-fun lt!11006 () ListLongMap!663)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!287 (ListLongMap!663 (_ BitVec 64)) Bool)

(assert (=> b!28942 (= res!17307 (not (contains!287 lt!11006 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!428 0))(
  ( (ValueCellFull!428 (v!1743 V!1499)) (EmptyCell!428) )
))
(declare-datatypes ((array!1745 0))(
  ( (array!1746 (arr!826 (Array (_ BitVec 32) ValueCell!428)) (size!927 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1745)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1747 0))(
  ( (array!1748 (arr!827 (Array (_ BitVec 32) (_ BitVec 64))) (size!928 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1747)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1499)

(declare-fun minValue!1443 () V!1499)

(declare-fun getCurrentListMap!177 (array!1747 array!1745 (_ BitVec 32) (_ BitVec 32) V!1499 V!1499 (_ BitVec 32) Int) ListLongMap!663)

(assert (=> b!28942 (= lt!11006 (getCurrentListMap!177 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapNonEmpty!1411 () Bool)

(declare-fun mapRes!1411 () Bool)

(declare-fun tp!4123 () Bool)

(declare-fun e!18705 () Bool)

(assert (=> mapNonEmpty!1411 (= mapRes!1411 (and tp!4123 e!18705))))

(declare-fun mapRest!1411 () (Array (_ BitVec 32) ValueCell!428))

(declare-fun mapValue!1411 () ValueCell!428)

(declare-fun mapKey!1411 () (_ BitVec 32))

(assert (=> mapNonEmpty!1411 (= (arr!826 _values!1501) (store mapRest!1411 mapKey!1411 mapValue!1411))))

(declare-fun res!17310 () Bool)

(assert (=> start!3996 (=> (not res!17310) (not e!18709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3996 (= res!17310 (validMask!0 mask!2294))))

(assert (=> start!3996 e!18709))

(assert (=> start!3996 true))

(assert (=> start!3996 tp!4122))

(declare-fun e!18710 () Bool)

(declare-fun array_inv!571 (array!1745) Bool)

(assert (=> start!3996 (and (array_inv!571 _values!1501) e!18710)))

(declare-fun array_inv!572 (array!1747) Bool)

(assert (=> start!3996 (array_inv!572 _keys!1833)))

(assert (=> start!3996 tp_is_empty!1255))

(declare-fun b!28943 () Bool)

(declare-fun res!17305 () Bool)

(assert (=> b!28943 (=> (not res!17305) (not e!18709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1747 (_ BitVec 32)) Bool)

(assert (=> b!28943 (= res!17305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28944 () Bool)

(declare-fun res!17309 () Bool)

(assert (=> b!28944 (=> (not res!17309) (not e!18709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28944 (= res!17309 (validKeyInArray!0 k!1304))))

(declare-fun b!28945 () Bool)

(declare-fun res!17304 () Bool)

(assert (=> b!28945 (=> (not res!17304) (not e!18707))))

(declare-fun arrayContainsKey!0 (array!1747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28945 (= res!17304 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28946 () Bool)

(declare-fun res!17308 () Bool)

(assert (=> b!28946 (=> (not res!17308) (not e!18709))))

(declare-datatypes ((List!687 0))(
  ( (Nil!684) (Cons!683 (h!1250 (_ BitVec 64)) (t!3380 List!687)) )
))
(declare-fun arrayNoDuplicates!0 (array!1747 (_ BitVec 32) List!687) Bool)

(assert (=> b!28946 (= res!17308 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!684))))

(declare-fun b!28947 () Bool)

(assert (=> b!28947 (= e!18707 (not true))))

(declare-datatypes ((SeekEntryResult!76 0))(
  ( (MissingZero!76 (index!2426 (_ BitVec 32))) (Found!76 (index!2427 (_ BitVec 32))) (Intermediate!76 (undefined!888 Bool) (index!2428 (_ BitVec 32)) (x!6370 (_ BitVec 32))) (Undefined!76) (MissingVacant!76 (index!2429 (_ BitVec 32))) )
))
(declare-fun lt!11007 () SeekEntryResult!76)

(declare-fun lt!11009 () (_ BitVec 32))

(assert (=> b!28947 (and (is-Found!76 lt!11007) (= (index!2427 lt!11007) lt!11009))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1747 (_ BitVec 32)) SeekEntryResult!76)

(assert (=> b!28947 (= lt!11007 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!659 0))(
  ( (Unit!660) )
))
(declare-fun lt!11008 () Unit!659)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1747 (_ BitVec 32)) Unit!659)

(assert (=> b!28947 (= lt!11008 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!11009 _keys!1833 mask!2294))))

(assert (=> b!28947 (contains!287 lt!11006 (select (arr!827 _keys!1833) lt!11009))))

(declare-fun lt!11005 () Unit!659)

(declare-fun lemmaValidKeyInArrayIsInListMap!23 (array!1747 array!1745 (_ BitVec 32) (_ BitVec 32) V!1499 V!1499 (_ BitVec 32) Int) Unit!659)

(assert (=> b!28947 (= lt!11005 (lemmaValidKeyInArrayIsInListMap!23 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11009 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1747 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28947 (= lt!11009 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28948 () Bool)

(assert (=> b!28948 (= e!18710 (and e!18708 mapRes!1411))))

(declare-fun condMapEmpty!1411 () Bool)

(declare-fun mapDefault!1411 () ValueCell!428)

