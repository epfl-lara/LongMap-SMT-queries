; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112884 () Bool)

(assert start!112884)

(declare-fun mapNonEmpty!57160 () Bool)

(declare-fun mapRes!57160 () Bool)

(declare-fun tp!108859 () Bool)

(declare-fun e!762226 () Bool)

(assert (=> mapNonEmpty!57160 (= mapRes!57160 (and tp!108859 e!762226))))

(declare-datatypes ((V!54409 0))(
  ( (V!54410 (val!18564 Int)) )
))
(declare-datatypes ((ValueCell!17591 0))(
  ( (ValueCellFull!17591 (v!21211 V!54409)) (EmptyCell!17591) )
))
(declare-fun mapRest!57160 () (Array (_ BitVec 32) ValueCell!17591))

(declare-fun mapKey!57160 () (_ BitVec 32))

(declare-fun mapValue!57160 () ValueCell!17591)

(declare-datatypes ((array!90818 0))(
  ( (array!90819 (arr!43870 (Array (_ BitVec 32) ValueCell!17591)) (size!44420 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90818)

(assert (=> mapNonEmpty!57160 (= (arr!43870 _values!1303) (store mapRest!57160 mapKey!57160 mapValue!57160))))

(declare-fun mapIsEmpty!57160 () Bool)

(assert (=> mapIsEmpty!57160 mapRes!57160))

(declare-fun res!888151 () Bool)

(declare-fun e!762224 () Bool)

(assert (=> start!112884 (=> (not res!888151) (not e!762224))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112884 (= res!888151 (validMask!0 mask!1977))))

(assert (=> start!112884 e!762224))

(assert (=> start!112884 true))

(declare-fun e!762225 () Bool)

(declare-fun array_inv!33083 (array!90818) Bool)

(assert (=> start!112884 (and (array_inv!33083 _values!1303) e!762225)))

(declare-datatypes ((array!90820 0))(
  ( (array!90821 (arr!43871 (Array (_ BitVec 32) (_ BitVec 64))) (size!44421 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90820)

(declare-fun array_inv!33084 (array!90820) Bool)

(assert (=> start!112884 (array_inv!33084 _keys!1571)))

(declare-fun b!1338613 () Bool)

(declare-fun tp_is_empty!36979 () Bool)

(assert (=> b!1338613 (= e!762226 tp_is_empty!36979)))

(declare-fun b!1338614 () Bool)

(declare-fun e!762228 () Bool)

(assert (=> b!1338614 (= e!762228 tp_is_empty!36979)))

(declare-fun b!1338615 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338615 (= e!762224 (and (= (size!44420 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44421 _keys!1571) (size!44420 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011) (not (= (size!44421 _keys!1571) (bvadd #b00000000000000000000000000000001 mask!1977)))))))

(declare-fun b!1338616 () Bool)

(assert (=> b!1338616 (= e!762225 (and e!762228 mapRes!57160))))

(declare-fun condMapEmpty!57160 () Bool)

(declare-fun mapDefault!57160 () ValueCell!17591)

