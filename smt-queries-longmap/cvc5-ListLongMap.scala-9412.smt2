; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112058 () Bool)

(assert start!112058)

(declare-fun b!1327483 () Bool)

(declare-fun res!880874 () Bool)

(declare-fun e!756706 () Bool)

(assert (=> b!1327483 (=> (not res!880874) (not e!756706))))

(declare-datatypes ((array!89678 0))(
  ( (array!89679 (arr!43307 (Array (_ BitVec 32) (_ BitVec 64))) (size!43857 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89678)

(assert (=> b!1327483 (= res!880874 (and (bvsle #b00000000000000000000000000000000 (size!43857 _keys!1590)) (bvslt (size!43857 _keys!1590) #b01111111111111111111111111111111)))))

(declare-fun b!1327484 () Bool)

(declare-datatypes ((List!30691 0))(
  ( (Nil!30688) (Cons!30687 (h!31896 (_ BitVec 64)) (t!44697 List!30691)) )
))
(declare-fun noDuplicate!2064 (List!30691) Bool)

(assert (=> b!1327484 (= e!756706 (not (noDuplicate!2064 Nil!30688)))))

(declare-fun mapIsEmpty!56245 () Bool)

(declare-fun mapRes!56245 () Bool)

(assert (=> mapIsEmpty!56245 mapRes!56245))

(declare-fun mapNonEmpty!56245 () Bool)

(declare-fun tp!107152 () Bool)

(declare-fun e!756705 () Bool)

(assert (=> mapNonEmpty!56245 (= mapRes!56245 (and tp!107152 e!756705))))

(declare-datatypes ((V!53617 0))(
  ( (V!53618 (val!18267 Int)) )
))
(declare-datatypes ((ValueCell!17294 0))(
  ( (ValueCellFull!17294 (v!20903 V!53617)) (EmptyCell!17294) )
))
(declare-fun mapRest!56245 () (Array (_ BitVec 32) ValueCell!17294))

(declare-datatypes ((array!89680 0))(
  ( (array!89681 (arr!43308 (Array (_ BitVec 32) ValueCell!17294)) (size!43858 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89680)

(declare-fun mapKey!56245 () (_ BitVec 32))

(declare-fun mapValue!56245 () ValueCell!17294)

(assert (=> mapNonEmpty!56245 (= (arr!43308 _values!1320) (store mapRest!56245 mapKey!56245 mapValue!56245))))

(declare-fun b!1327485 () Bool)

(declare-fun tp_is_empty!36385 () Bool)

(assert (=> b!1327485 (= e!756705 tp_is_empty!36385)))

(declare-fun b!1327486 () Bool)

(declare-fun res!880873 () Bool)

(assert (=> b!1327486 (=> (not res!880873) (not e!756706))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327486 (= res!880873 (and (= (size!43858 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43857 _keys!1590) (size!43858 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!880875 () Bool)

(assert (=> start!112058 (=> (not res!880875) (not e!756706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112058 (= res!880875 (validMask!0 mask!1998))))

(assert (=> start!112058 e!756706))

(assert (=> start!112058 true))

(declare-fun e!756703 () Bool)

(declare-fun array_inv!32687 (array!89680) Bool)

(assert (=> start!112058 (and (array_inv!32687 _values!1320) e!756703)))

(declare-fun array_inv!32688 (array!89678) Bool)

(assert (=> start!112058 (array_inv!32688 _keys!1590)))

(declare-fun b!1327487 () Bool)

(declare-fun res!880876 () Bool)

(assert (=> b!1327487 (=> (not res!880876) (not e!756706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89678 (_ BitVec 32)) Bool)

(assert (=> b!1327487 (= res!880876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327488 () Bool)

(declare-fun e!756704 () Bool)

(assert (=> b!1327488 (= e!756703 (and e!756704 mapRes!56245))))

(declare-fun condMapEmpty!56245 () Bool)

(declare-fun mapDefault!56245 () ValueCell!17294)

