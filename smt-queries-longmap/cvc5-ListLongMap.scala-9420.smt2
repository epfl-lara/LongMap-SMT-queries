; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112128 () Bool)

(assert start!112128)

(declare-fun b!1328009 () Bool)

(declare-fun e!757125 () Bool)

(assert (=> b!1328009 (= e!757125 false)))

(declare-fun lt!590791 () Bool)

(declare-datatypes ((array!89766 0))(
  ( (array!89767 (arr!43349 (Array (_ BitVec 32) (_ BitVec 64))) (size!43899 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89766)

(declare-datatypes ((List!30706 0))(
  ( (Nil!30703) (Cons!30702 (h!31911 (_ BitVec 64)) (t!44712 List!30706)) )
))
(declare-fun arrayNoDuplicates!0 (array!89766 (_ BitVec 32) List!30706) Bool)

(assert (=> b!1328009 (= lt!590791 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30703))))

(declare-fun b!1328010 () Bool)

(declare-fun e!757124 () Bool)

(declare-fun e!757126 () Bool)

(declare-fun mapRes!56323 () Bool)

(assert (=> b!1328010 (= e!757124 (and e!757126 mapRes!56323))))

(declare-fun condMapEmpty!56323 () Bool)

(declare-datatypes ((V!53681 0))(
  ( (V!53682 (val!18291 Int)) )
))
(declare-datatypes ((ValueCell!17318 0))(
  ( (ValueCellFull!17318 (v!20928 V!53681)) (EmptyCell!17318) )
))
(declare-datatypes ((array!89768 0))(
  ( (array!89769 (arr!43350 (Array (_ BitVec 32) ValueCell!17318)) (size!43900 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89768)

(declare-fun mapDefault!56323 () ValueCell!17318)

