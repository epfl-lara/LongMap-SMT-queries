; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113334 () Bool)

(assert start!113334)

(declare-fun b_free!31385 () Bool)

(declare-fun b_next!31385 () Bool)

(assert (=> start!113334 (= b_free!31385 (not b_next!31385))))

(declare-fun tp!109960 () Bool)

(declare-fun b_and!50623 () Bool)

(assert (=> start!113334 (= tp!109960 b_and!50623)))

(declare-fun b!1344875 () Bool)

(declare-fun e!765374 () Bool)

(assert (=> b!1344875 (= e!765374 (not true))))

(declare-datatypes ((V!54949 0))(
  ( (V!54950 (val!18767 Int)) )
))
(declare-datatypes ((tuple2!24188 0))(
  ( (tuple2!24189 (_1!12105 (_ BitVec 64)) (_2!12105 V!54949)) )
))
(declare-datatypes ((List!31345 0))(
  ( (Nil!31342) (Cons!31341 (h!32550 tuple2!24188) (t!45887 List!31345)) )
))
(declare-datatypes ((ListLongMap!21845 0))(
  ( (ListLongMap!21846 (toList!10938 List!31345)) )
))
(declare-fun lt!595236 () ListLongMap!21845)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9114 (ListLongMap!21845 (_ BitVec 64)) Bool)

(assert (=> b!1344875 (contains!9114 lt!595236 k!1142)))

(declare-datatypes ((array!91610 0))(
  ( (array!91611 (arr!44261 (Array (_ BitVec 32) (_ BitVec 64))) (size!44811 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91610)

(declare-datatypes ((Unit!44117 0))(
  ( (Unit!44118) )
))
(declare-fun lt!595234 () Unit!44117)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!595235 () V!54949)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!389 ((_ BitVec 64) (_ BitVec 64) V!54949 ListLongMap!21845) Unit!44117)

(assert (=> b!1344875 (= lt!595234 (lemmaInListMapAfterAddingDiffThenInBefore!389 k!1142 (select (arr!44261 _keys!1571) from!1960) lt!595235 lt!595236))))

(declare-fun b!1344876 () Bool)

(declare-fun e!765373 () Bool)

(declare-fun tp_is_empty!37385 () Bool)

(assert (=> b!1344876 (= e!765373 tp_is_empty!37385)))

(declare-fun b!1344877 () Bool)

(declare-fun res!892314 () Bool)

(declare-fun e!765372 () Bool)

(assert (=> b!1344877 (=> (not res!892314) (not e!765372))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17794 0))(
  ( (ValueCellFull!17794 (v!21415 V!54949)) (EmptyCell!17794) )
))
(declare-datatypes ((array!91612 0))(
  ( (array!91613 (arr!44262 (Array (_ BitVec 32) ValueCell!17794)) (size!44812 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91612)

(assert (=> b!1344877 (= res!892314 (and (= (size!44812 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44811 _keys!1571) (size!44812 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344878 () Bool)

(declare-fun res!892313 () Bool)

(assert (=> b!1344878 (=> (not res!892313) (not e!765374))))

(assert (=> b!1344878 (= res!892313 (not (= k!1142 (select (arr!44261 _keys!1571) from!1960))))))

(declare-fun b!1344879 () Bool)

(declare-fun res!892318 () Bool)

(assert (=> b!1344879 (=> (not res!892318) (not e!765372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91610 (_ BitVec 32)) Bool)

(assert (=> b!1344879 (= res!892318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57784 () Bool)

(declare-fun mapRes!57784 () Bool)

(assert (=> mapIsEmpty!57784 mapRes!57784))

(declare-fun b!1344880 () Bool)

(declare-fun e!765375 () Bool)

(assert (=> b!1344880 (= e!765375 (and e!765373 mapRes!57784))))

(declare-fun condMapEmpty!57784 () Bool)

(declare-fun mapDefault!57784 () ValueCell!17794)

