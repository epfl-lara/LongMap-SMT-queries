; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113130 () Bool)

(assert start!113130)

(declare-fun b_free!31181 () Bool)

(declare-fun b_next!31181 () Bool)

(assert (=> start!113130 (= b_free!31181 (not b_next!31181))))

(declare-fun tp!109348 () Bool)

(declare-fun b_and!50269 () Bool)

(assert (=> start!113130 (= tp!109348 b_and!50269)))

(declare-fun b!1341333 () Bool)

(declare-fun res!889847 () Bool)

(declare-fun e!763835 () Bool)

(assert (=> b!1341333 (=> (not res!889847) (not e!763835))))

(declare-datatypes ((V!54677 0))(
  ( (V!54678 (val!18665 Int)) )
))
(declare-fun minValue!1245 () V!54677)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91214 0))(
  ( (array!91215 (arr!44063 (Array (_ BitVec 32) (_ BitVec 64))) (size!44613 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91214)

(declare-fun zeroValue!1245 () V!54677)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17692 0))(
  ( (ValueCellFull!17692 (v!21313 V!54677)) (EmptyCell!17692) )
))
(declare-datatypes ((array!91216 0))(
  ( (array!91217 (arr!44064 (Array (_ BitVec 32) ValueCell!17692)) (size!44614 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91216)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24032 0))(
  ( (tuple2!24033 (_1!12027 (_ BitVec 64)) (_2!12027 V!54677)) )
))
(declare-datatypes ((List!31192 0))(
  ( (Nil!31189) (Cons!31188 (h!32397 tuple2!24032) (t!45584 List!31192)) )
))
(declare-datatypes ((ListLongMap!21689 0))(
  ( (ListLongMap!21690 (toList!10860 List!31192)) )
))
(declare-fun contains!9036 (ListLongMap!21689 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5825 (array!91214 array!91216 (_ BitVec 32) (_ BitVec 32) V!54677 V!54677 (_ BitVec 32) Int) ListLongMap!21689)

(assert (=> b!1341333 (= res!889847 (contains!9036 (getCurrentListMap!5825 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1341334 () Bool)

(declare-fun res!889842 () Bool)

(assert (=> b!1341334 (=> (not res!889842) (not e!763835))))

(assert (=> b!1341334 (= res!889842 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341335 () Bool)

(declare-fun res!889843 () Bool)

(assert (=> b!1341335 (=> (not res!889843) (not e!763835))))

(assert (=> b!1341335 (= res!889843 (and (= (size!44614 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44613 _keys!1571) (size!44614 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57478 () Bool)

(declare-fun mapRes!57478 () Bool)

(declare-fun tp!109347 () Bool)

(declare-fun e!763837 () Bool)

(assert (=> mapNonEmpty!57478 (= mapRes!57478 (and tp!109347 e!763837))))

(declare-fun mapKey!57478 () (_ BitVec 32))

(declare-fun mapValue!57478 () ValueCell!17692)

(declare-fun mapRest!57478 () (Array (_ BitVec 32) ValueCell!17692))

(assert (=> mapNonEmpty!57478 (= (arr!44064 _values!1303) (store mapRest!57478 mapKey!57478 mapValue!57478))))

(declare-fun b!1341336 () Bool)

(declare-fun res!889840 () Bool)

(assert (=> b!1341336 (=> (not res!889840) (not e!763835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341336 (= res!889840 (validKeyInArray!0 (select (arr!44063 _keys!1571) from!1960)))))

(declare-fun b!1341337 () Bool)

(declare-fun e!763836 () Bool)

(declare-fun e!763838 () Bool)

(assert (=> b!1341337 (= e!763836 (and e!763838 mapRes!57478))))

(declare-fun condMapEmpty!57478 () Bool)

(declare-fun mapDefault!57478 () ValueCell!17692)

