; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113336 () Bool)

(assert start!113336)

(declare-fun b_free!31387 () Bool)

(declare-fun b_next!31387 () Bool)

(assert (=> start!113336 (= b_free!31387 (not b_next!31387))))

(declare-fun tp!109966 () Bool)

(declare-fun b_and!50627 () Bool)

(assert (=> start!113336 (= tp!109966 b_and!50627)))

(declare-fun b!1344918 () Bool)

(declare-fun e!765393 () Bool)

(assert (=> b!1344918 (= e!765393 (not true))))

(declare-datatypes ((V!54953 0))(
  ( (V!54954 (val!18768 Int)) )
))
(declare-datatypes ((tuple2!24190 0))(
  ( (tuple2!24191 (_1!12106 (_ BitVec 64)) (_2!12106 V!54953)) )
))
(declare-datatypes ((List!31346 0))(
  ( (Nil!31343) (Cons!31342 (h!32551 tuple2!24190) (t!45890 List!31346)) )
))
(declare-datatypes ((ListLongMap!21847 0))(
  ( (ListLongMap!21848 (toList!10939 List!31346)) )
))
(declare-fun lt!595243 () ListLongMap!21847)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9115 (ListLongMap!21847 (_ BitVec 64)) Bool)

(assert (=> b!1344918 (contains!9115 lt!595243 k!1142)))

(declare-datatypes ((Unit!44119 0))(
  ( (Unit!44120) )
))
(declare-fun lt!595245 () Unit!44119)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!595244 () V!54953)

(declare-datatypes ((array!91614 0))(
  ( (array!91615 (arr!44263 (Array (_ BitVec 32) (_ BitVec 64))) (size!44813 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91614)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!390 ((_ BitVec 64) (_ BitVec 64) V!54953 ListLongMap!21847) Unit!44119)

(assert (=> b!1344918 (= lt!595245 (lemmaInListMapAfterAddingDiffThenInBefore!390 k!1142 (select (arr!44263 _keys!1571) from!1960) lt!595244 lt!595243))))

(declare-fun b!1344919 () Bool)

(declare-fun res!892347 () Bool)

(declare-fun e!765394 () Bool)

(assert (=> b!1344919 (=> (not res!892347) (not e!765394))))

(declare-datatypes ((List!31347 0))(
  ( (Nil!31344) (Cons!31343 (h!32552 (_ BitVec 64)) (t!45891 List!31347)) )
))
(declare-fun arrayNoDuplicates!0 (array!91614 (_ BitVec 32) List!31347) Bool)

(assert (=> b!1344919 (= res!892347 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31344))))

(declare-fun b!1344920 () Bool)

(declare-fun e!765395 () Bool)

(declare-fun e!765391 () Bool)

(declare-fun mapRes!57787 () Bool)

(assert (=> b!1344920 (= e!765395 (and e!765391 mapRes!57787))))

(declare-fun condMapEmpty!57787 () Bool)

(declare-datatypes ((ValueCell!17795 0))(
  ( (ValueCellFull!17795 (v!21416 V!54953)) (EmptyCell!17795) )
))
(declare-datatypes ((array!91616 0))(
  ( (array!91617 (arr!44264 (Array (_ BitVec 32) ValueCell!17795)) (size!44814 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91616)

(declare-fun mapDefault!57787 () ValueCell!17795)

