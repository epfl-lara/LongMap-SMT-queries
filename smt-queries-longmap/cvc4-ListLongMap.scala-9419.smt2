; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112126 () Bool)

(assert start!112126)

(declare-fun b!1327991 () Bool)

(declare-fun e!757110 () Bool)

(assert (=> b!1327991 (= e!757110 false)))

(declare-fun lt!590788 () Bool)

(declare-datatypes ((array!89762 0))(
  ( (array!89763 (arr!43347 (Array (_ BitVec 32) (_ BitVec 64))) (size!43897 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89762)

(declare-datatypes ((List!30705 0))(
  ( (Nil!30702) (Cons!30701 (h!31910 (_ BitVec 64)) (t!44711 List!30705)) )
))
(declare-fun arrayNoDuplicates!0 (array!89762 (_ BitVec 32) List!30705) Bool)

(assert (=> b!1327991 (= lt!590788 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30702))))

(declare-fun mapNonEmpty!56320 () Bool)

(declare-fun mapRes!56320 () Bool)

(declare-fun tp!107227 () Bool)

(declare-fun e!757109 () Bool)

(assert (=> mapNonEmpty!56320 (= mapRes!56320 (and tp!107227 e!757109))))

(declare-datatypes ((V!53677 0))(
  ( (V!53678 (val!18290 Int)) )
))
(declare-datatypes ((ValueCell!17317 0))(
  ( (ValueCellFull!17317 (v!20927 V!53677)) (EmptyCell!17317) )
))
(declare-fun mapRest!56320 () (Array (_ BitVec 32) ValueCell!17317))

(declare-datatypes ((array!89764 0))(
  ( (array!89765 (arr!43348 (Array (_ BitVec 32) ValueCell!17317)) (size!43898 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89764)

(declare-fun mapKey!56320 () (_ BitVec 32))

(declare-fun mapValue!56320 () ValueCell!17317)

(assert (=> mapNonEmpty!56320 (= (arr!43348 _values!1320) (store mapRest!56320 mapKey!56320 mapValue!56320))))

(declare-fun b!1327992 () Bool)

(declare-fun tp_is_empty!36431 () Bool)

(assert (=> b!1327992 (= e!757109 tp_is_empty!36431)))

(declare-fun mapIsEmpty!56320 () Bool)

(assert (=> mapIsEmpty!56320 mapRes!56320))

(declare-fun b!1327993 () Bool)

(declare-fun res!881146 () Bool)

(assert (=> b!1327993 (=> (not res!881146) (not e!757110))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89762 (_ BitVec 32)) Bool)

(assert (=> b!1327993 (= res!881146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327994 () Bool)

(declare-fun res!881147 () Bool)

(assert (=> b!1327994 (=> (not res!881147) (not e!757110))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327994 (= res!881147 (and (= (size!43898 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43897 _keys!1590) (size!43898 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327996 () Bool)

(declare-fun e!757111 () Bool)

(declare-fun e!757108 () Bool)

(assert (=> b!1327996 (= e!757111 (and e!757108 mapRes!56320))))

(declare-fun condMapEmpty!56320 () Bool)

(declare-fun mapDefault!56320 () ValueCell!17317)

