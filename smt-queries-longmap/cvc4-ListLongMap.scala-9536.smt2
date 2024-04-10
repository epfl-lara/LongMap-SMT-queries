; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113082 () Bool)

(assert start!113082)

(declare-fun b_free!31133 () Bool)

(declare-fun b_next!31133 () Bool)

(assert (=> start!113082 (= b_free!31133 (not b_next!31133))))

(declare-fun tp!109203 () Bool)

(declare-fun b_and!50173 () Bool)

(assert (=> start!113082 (= tp!109203 b_and!50173)))

(declare-fun res!889192 () Bool)

(declare-fun e!763474 () Bool)

(assert (=> start!113082 (=> (not res!889192) (not e!763474))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113082 (= res!889192 (validMask!0 mask!1977))))

(assert (=> start!113082 e!763474))

(declare-fun tp_is_empty!37133 () Bool)

(assert (=> start!113082 tp_is_empty!37133))

(assert (=> start!113082 true))

(declare-datatypes ((array!91118 0))(
  ( (array!91119 (arr!44015 (Array (_ BitVec 32) (_ BitVec 64))) (size!44565 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91118)

(declare-fun array_inv!33187 (array!91118) Bool)

(assert (=> start!113082 (array_inv!33187 _keys!1571)))

(declare-datatypes ((V!54613 0))(
  ( (V!54614 (val!18641 Int)) )
))
(declare-datatypes ((ValueCell!17668 0))(
  ( (ValueCellFull!17668 (v!21289 V!54613)) (EmptyCell!17668) )
))
(declare-datatypes ((array!91120 0))(
  ( (array!91121 (arr!44016 (Array (_ BitVec 32) ValueCell!17668)) (size!44566 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91120)

(declare-fun e!763477 () Bool)

(declare-fun array_inv!33188 (array!91120) Bool)

(assert (=> start!113082 (and (array_inv!33188 _values!1303) e!763477)))

(assert (=> start!113082 tp!109203))

(declare-fun mapNonEmpty!57406 () Bool)

(declare-fun mapRes!57406 () Bool)

(declare-fun tp!109204 () Bool)

(declare-fun e!763478 () Bool)

(assert (=> mapNonEmpty!57406 (= mapRes!57406 (and tp!109204 e!763478))))

(declare-fun mapRest!57406 () (Array (_ BitVec 32) ValueCell!17668))

(declare-fun mapValue!57406 () ValueCell!17668)

(declare-fun mapKey!57406 () (_ BitVec 32))

(assert (=> mapNonEmpty!57406 (= (arr!44016 _values!1303) (store mapRest!57406 mapKey!57406 mapValue!57406))))

(declare-fun b!1340421 () Bool)

(declare-fun res!889198 () Bool)

(assert (=> b!1340421 (=> (not res!889198) (not e!763474))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340421 (= res!889198 (validKeyInArray!0 (select (arr!44015 _keys!1571) from!1960)))))

(declare-fun b!1340422 () Bool)

(assert (=> b!1340422 (= e!763478 tp_is_empty!37133)))

(declare-fun b!1340423 () Bool)

(declare-fun res!889193 () Bool)

(assert (=> b!1340423 (=> (not res!889193) (not e!763474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91118 (_ BitVec 32)) Bool)

(assert (=> b!1340423 (= res!889193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340424 () Bool)

(declare-fun e!763476 () Bool)

(assert (=> b!1340424 (= e!763476 tp_is_empty!37133)))

(declare-fun b!1340425 () Bool)

(declare-fun res!889200 () Bool)

(assert (=> b!1340425 (=> (not res!889200) (not e!763474))))

(declare-fun k!1142 () (_ BitVec 64))

(assert (=> b!1340425 (= res!889200 (not (= (select (arr!44015 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1340426 () Bool)

(assert (=> b!1340426 (= e!763477 (and e!763476 mapRes!57406))))

(declare-fun condMapEmpty!57406 () Bool)

(declare-fun mapDefault!57406 () ValueCell!17668)

