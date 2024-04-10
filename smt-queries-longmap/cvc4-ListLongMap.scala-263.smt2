; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4328 () Bool)

(assert start!4328)

(declare-fun b_free!1169 () Bool)

(declare-fun b_next!1169 () Bool)

(assert (=> start!4328 (= b_free!1169 (not b_next!1169))))

(declare-fun tp!4935 () Bool)

(declare-fun b_and!1985 () Bool)

(assert (=> start!4328 (= tp!4935 b_and!1985)))

(declare-fun mapNonEmpty!1822 () Bool)

(declare-fun mapRes!1822 () Bool)

(declare-fun tp!4936 () Bool)

(declare-fun e!21159 () Bool)

(assert (=> mapNonEmpty!1822 (= mapRes!1822 (and tp!4936 e!21159))))

(declare-fun mapKey!1822 () (_ BitVec 32))

(declare-datatypes ((V!1855 0))(
  ( (V!1856 (val!788 Int)) )
))
(declare-datatypes ((ValueCell!562 0))(
  ( (ValueCellFull!562 (v!1880 V!1855)) (EmptyCell!562) )
))
(declare-datatypes ((array!2261 0))(
  ( (array!2262 (arr!1081 (Array (_ BitVec 32) ValueCell!562)) (size!1182 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2261)

(declare-fun mapRest!1822 () (Array (_ BitVec 32) ValueCell!562))

(declare-fun mapValue!1822 () ValueCell!562)

(assert (=> mapNonEmpty!1822 (= (arr!1081 _values!1501) (store mapRest!1822 mapKey!1822 mapValue!1822))))

(declare-fun b!33312 () Bool)

(declare-fun res!20241 () Bool)

(declare-fun e!21163 () Bool)

(assert (=> b!33312 (=> (not res!20241) (not e!21163))))

(declare-datatypes ((array!2263 0))(
  ( (array!2264 (arr!1082 (Array (_ BitVec 32) (_ BitVec 64))) (size!1183 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2263)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2263 (_ BitVec 32)) Bool)

(assert (=> b!33312 (= res!20241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33313 () Bool)

(declare-fun res!20245 () Bool)

(assert (=> b!33313 (=> (not res!20245) (not e!21163))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!33313 (= res!20245 (and (= (size!1182 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1183 _keys!1833) (size!1182 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33314 () Bool)

(declare-fun res!20244 () Bool)

(assert (=> b!33314 (=> (not res!20244) (not e!21163))))

(declare-datatypes ((List!876 0))(
  ( (Nil!873) (Cons!872 (h!1439 (_ BitVec 64)) (t!3575 List!876)) )
))
(declare-fun arrayNoDuplicates!0 (array!2263 (_ BitVec 32) List!876) Bool)

(assert (=> b!33314 (= res!20244 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!873))))

(declare-fun res!20239 () Bool)

(assert (=> start!4328 (=> (not res!20239) (not e!21163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4328 (= res!20239 (validMask!0 mask!2294))))

(assert (=> start!4328 e!21163))

(assert (=> start!4328 true))

(assert (=> start!4328 tp!4935))

(declare-fun e!21161 () Bool)

(declare-fun array_inv!761 (array!2261) Bool)

(assert (=> start!4328 (and (array_inv!761 _values!1501) e!21161)))

(declare-fun array_inv!762 (array!2263) Bool)

(assert (=> start!4328 (array_inv!762 _keys!1833)))

(declare-fun tp_is_empty!1523 () Bool)

(assert (=> start!4328 tp_is_empty!1523))

(declare-fun b!33315 () Bool)

(declare-fun e!21162 () Bool)

(assert (=> b!33315 (= e!21162 (not true))))

(declare-datatypes ((SeekEntryResult!127 0))(
  ( (MissingZero!127 (index!2630 (_ BitVec 32))) (Found!127 (index!2631 (_ BitVec 32))) (Intermediate!127 (undefined!939 Bool) (index!2632 (_ BitVec 32)) (x!6803 (_ BitVec 32))) (Undefined!127) (MissingVacant!127 (index!2633 (_ BitVec 32))) )
))
(declare-fun lt!12124 () SeekEntryResult!127)

(declare-fun lt!12123 () (_ BitVec 32))

(assert (=> b!33315 (and (is-Found!127 lt!12124) (= (index!2631 lt!12124) lt!12123))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2263 (_ BitVec 32)) SeekEntryResult!127)

(assert (=> b!33315 (= lt!12124 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!742 0))(
  ( (Unit!743) )
))
(declare-fun lt!12126 () Unit!742)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2263 (_ BitVec 32)) Unit!742)

(assert (=> b!33315 (= lt!12126 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!12123 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1286 0))(
  ( (tuple2!1287 (_1!654 (_ BitVec 64)) (_2!654 V!1855)) )
))
(declare-datatypes ((List!877 0))(
  ( (Nil!874) (Cons!873 (h!1440 tuple2!1286) (t!3576 List!877)) )
))
(declare-datatypes ((ListLongMap!863 0))(
  ( (ListLongMap!864 (toList!447 List!877)) )
))
(declare-fun lt!12122 () ListLongMap!863)

(declare-fun contains!390 (ListLongMap!863 (_ BitVec 64)) Bool)

(assert (=> b!33315 (contains!390 lt!12122 (select (arr!1082 _keys!1833) lt!12123))))

(declare-fun lt!12125 () Unit!742)

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1855)

(declare-fun minValue!1443 () V!1855)

(declare-fun lemmaValidKeyInArrayIsInListMap!59 (array!2263 array!2261 (_ BitVec 32) (_ BitVec 32) V!1855 V!1855 (_ BitVec 32) Int) Unit!742)

(assert (=> b!33315 (= lt!12125 (lemmaValidKeyInArrayIsInListMap!59 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12123 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2263 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33315 (= lt!12123 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!33316 () Bool)

(declare-fun e!21160 () Bool)

(assert (=> b!33316 (= e!21161 (and e!21160 mapRes!1822))))

(declare-fun condMapEmpty!1822 () Bool)

(declare-fun mapDefault!1822 () ValueCell!562)

