; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113220 () Bool)

(assert start!113220)

(declare-fun b_free!31271 () Bool)

(declare-fun b_next!31271 () Bool)

(assert (=> start!113220 (= b_free!31271 (not b_next!31271))))

(declare-fun tp!109617 () Bool)

(declare-fun b_and!50449 () Bool)

(assert (=> start!113220 (= tp!109617 b_and!50449)))

(declare-fun b!1343043 () Bool)

(declare-fun res!891060 () Bool)

(declare-fun e!764513 () Bool)

(assert (=> b!1343043 (=> (not res!891060) (not e!764513))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91390 0))(
  ( (array!91391 (arr!44151 (Array (_ BitVec 32) (_ BitVec 64))) (size!44701 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91390)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343043 (= res!891060 (not (= (select (arr!44151 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1343044 () Bool)

(declare-fun res!891063 () Bool)

(assert (=> b!1343044 (=> (not res!891063) (not e!764513))))

(declare-datatypes ((List!31261 0))(
  ( (Nil!31258) (Cons!31257 (h!32466 (_ BitVec 64)) (t!45743 List!31261)) )
))
(declare-fun arrayNoDuplicates!0 (array!91390 (_ BitVec 32) List!31261) Bool)

(assert (=> b!1343044 (= res!891063 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31258))))

(declare-fun b!1343045 () Bool)

(declare-fun res!891056 () Bool)

(assert (=> b!1343045 (=> (not res!891056) (not e!764513))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343045 (= res!891056 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343046 () Bool)

(declare-fun res!891059 () Bool)

(assert (=> b!1343046 (=> (not res!891059) (not e!764513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343046 (= res!891059 (validKeyInArray!0 (select (arr!44151 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57613 () Bool)

(declare-fun mapRes!57613 () Bool)

(assert (=> mapIsEmpty!57613 mapRes!57613))

(declare-fun b!1343047 () Bool)

(declare-fun res!891057 () Bool)

(assert (=> b!1343047 (=> (not res!891057) (not e!764513))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91390 (_ BitVec 32)) Bool)

(assert (=> b!1343047 (= res!891057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343048 () Bool)

(declare-fun e!764512 () Bool)

(declare-fun tp_is_empty!37271 () Bool)

(assert (=> b!1343048 (= e!764512 tp_is_empty!37271)))

(declare-fun b!1343049 () Bool)

(declare-fun e!764510 () Bool)

(assert (=> b!1343049 (= e!764510 (and e!764512 mapRes!57613))))

(declare-fun condMapEmpty!57613 () Bool)

(declare-datatypes ((V!54797 0))(
  ( (V!54798 (val!18710 Int)) )
))
(declare-datatypes ((ValueCell!17737 0))(
  ( (ValueCellFull!17737 (v!21358 V!54797)) (EmptyCell!17737) )
))
(declare-datatypes ((array!91392 0))(
  ( (array!91393 (arr!44152 (Array (_ BitVec 32) ValueCell!17737)) (size!44702 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91392)

(declare-fun mapDefault!57613 () ValueCell!17737)

