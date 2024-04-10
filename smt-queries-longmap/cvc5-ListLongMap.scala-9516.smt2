; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112946 () Bool)

(assert start!112946)

(declare-fun mapNonEmpty!57217 () Bool)

(declare-fun mapRes!57217 () Bool)

(declare-fun tp!108916 () Bool)

(declare-fun e!762509 () Bool)

(assert (=> mapNonEmpty!57217 (= mapRes!57217 (and tp!108916 e!762509))))

(declare-datatypes ((V!54449 0))(
  ( (V!54450 (val!18579 Int)) )
))
(declare-datatypes ((ValueCell!17606 0))(
  ( (ValueCellFull!17606 (v!21226 V!54449)) (EmptyCell!17606) )
))
(declare-fun mapValue!57217 () ValueCell!17606)

(declare-datatypes ((array!90882 0))(
  ( (array!90883 (arr!43898 (Array (_ BitVec 32) ValueCell!17606)) (size!44448 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90882)

(declare-fun mapRest!57217 () (Array (_ BitVec 32) ValueCell!17606))

(declare-fun mapKey!57217 () (_ BitVec 32))

(assert (=> mapNonEmpty!57217 (= (arr!43898 _values!1303) (store mapRest!57217 mapKey!57217 mapValue!57217))))

(declare-fun b!1338940 () Bool)

(declare-fun e!762512 () Bool)

(declare-fun tp_is_empty!37009 () Bool)

(assert (=> b!1338940 (= e!762512 tp_is_empty!37009)))

(declare-fun b!1338941 () Bool)

(declare-fun res!888297 () Bool)

(declare-fun e!762511 () Bool)

(assert (=> b!1338941 (=> (not res!888297) (not e!762511))))

(declare-datatypes ((array!90884 0))(
  ( (array!90885 (arr!43899 (Array (_ BitVec 32) (_ BitVec 64))) (size!44449 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90884)

(assert (=> b!1338941 (= res!888297 (and (bvsle #b00000000000000000000000000000000 (size!44449 _keys!1571)) (bvslt (size!44449 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun b!1338942 () Bool)

(assert (=> b!1338942 (= e!762509 tp_is_empty!37009)))

(declare-fun b!1338943 () Bool)

(declare-fun e!762513 () Bool)

(assert (=> b!1338943 (= e!762511 e!762513)))

(declare-fun res!888293 () Bool)

(assert (=> b!1338943 (=> res!888293 e!762513)))

(declare-datatypes ((List!31092 0))(
  ( (Nil!31089) (Cons!31088 (h!32297 (_ BitVec 64)) (t!45424 List!31092)) )
))
(declare-fun contains!8992 (List!31092 (_ BitVec 64)) Bool)

(assert (=> b!1338943 (= res!888293 (contains!8992 Nil!31089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338945 () Bool)

(assert (=> b!1338945 (= e!762513 (contains!8992 Nil!31089 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338946 () Bool)

(declare-fun res!888295 () Bool)

(assert (=> b!1338946 (=> (not res!888295) (not e!762511))))

(declare-fun noDuplicate!2069 (List!31092) Bool)

(assert (=> b!1338946 (= res!888295 (noDuplicate!2069 Nil!31089))))

(declare-fun b!1338947 () Bool)

(declare-fun res!888298 () Bool)

(assert (=> b!1338947 (=> (not res!888298) (not e!762511))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90884 (_ BitVec 32)) Bool)

(assert (=> b!1338947 (= res!888298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!888294 () Bool)

(assert (=> start!112946 (=> (not res!888294) (not e!762511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112946 (= res!888294 (validMask!0 mask!1977))))

(assert (=> start!112946 e!762511))

(assert (=> start!112946 true))

(declare-fun e!762510 () Bool)

(declare-fun array_inv!33103 (array!90882) Bool)

(assert (=> start!112946 (and (array_inv!33103 _values!1303) e!762510)))

(declare-fun array_inv!33104 (array!90884) Bool)

(assert (=> start!112946 (array_inv!33104 _keys!1571)))

(declare-fun b!1338944 () Bool)

(assert (=> b!1338944 (= e!762510 (and e!762512 mapRes!57217))))

(declare-fun condMapEmpty!57217 () Bool)

(declare-fun mapDefault!57217 () ValueCell!17606)

