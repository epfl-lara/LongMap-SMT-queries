; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112950 () Bool)

(assert start!112950)

(declare-fun mapIsEmpty!57223 () Bool)

(declare-fun mapRes!57223 () Bool)

(assert (=> mapIsEmpty!57223 mapRes!57223))

(declare-fun b!1338995 () Bool)

(declare-fun res!888332 () Bool)

(declare-fun e!762549 () Bool)

(assert (=> b!1338995 (=> (not res!888332) (not e!762549))))

(declare-datatypes ((array!90890 0))(
  ( (array!90891 (arr!43902 (Array (_ BitVec 32) (_ BitVec 64))) (size!44452 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90890)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90890 (_ BitVec 32)) Bool)

(assert (=> b!1338995 (= res!888332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338996 () Bool)

(declare-fun res!888333 () Bool)

(assert (=> b!1338996 (=> (not res!888333) (not e!762549))))

(assert (=> b!1338996 (= res!888333 (and (bvsle #b00000000000000000000000000000000 (size!44452 _keys!1571)) (bvslt (size!44452 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun b!1338997 () Bool)

(declare-fun res!888330 () Bool)

(assert (=> b!1338997 (=> (not res!888330) (not e!762549))))

(declare-datatypes ((List!31094 0))(
  ( (Nil!31091) (Cons!31090 (h!32299 (_ BitVec 64)) (t!45426 List!31094)) )
))
(declare-fun noDuplicate!2071 (List!31094) Bool)

(assert (=> b!1338997 (= res!888330 (noDuplicate!2071 Nil!31091))))

(declare-fun b!1338998 () Bool)

(declare-fun e!762544 () Bool)

(declare-fun e!762548 () Bool)

(assert (=> b!1338998 (= e!762544 (and e!762548 mapRes!57223))))

(declare-fun condMapEmpty!57223 () Bool)

(declare-datatypes ((V!54453 0))(
  ( (V!54454 (val!18581 Int)) )
))
(declare-datatypes ((ValueCell!17608 0))(
  ( (ValueCellFull!17608 (v!21228 V!54453)) (EmptyCell!17608) )
))
(declare-datatypes ((array!90892 0))(
  ( (array!90893 (arr!43903 (Array (_ BitVec 32) ValueCell!17608)) (size!44453 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90892)

(declare-fun mapDefault!57223 () ValueCell!17608)

