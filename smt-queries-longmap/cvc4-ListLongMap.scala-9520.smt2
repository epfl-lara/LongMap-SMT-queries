; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112986 () Bool)

(assert start!112986)

(declare-fun b!1339247 () Bool)

(declare-fun e!762758 () Bool)

(declare-fun tp_is_empty!37037 () Bool)

(assert (=> b!1339247 (= e!762758 tp_is_empty!37037)))

(declare-fun mapIsEmpty!57262 () Bool)

(declare-fun mapRes!57262 () Bool)

(assert (=> mapIsEmpty!57262 mapRes!57262))

(declare-fun b!1339248 () Bool)

(declare-fun res!888460 () Bool)

(declare-fun e!762756 () Bool)

(assert (=> b!1339248 (=> (not res!888460) (not e!762756))))

(declare-datatypes ((array!90934 0))(
  ( (array!90935 (arr!43923 (Array (_ BitVec 32) (_ BitVec 64))) (size!44473 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90934)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90934 (_ BitVec 32)) Bool)

(assert (=> b!1339248 (= res!888460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339249 () Bool)

(assert (=> b!1339249 (= e!762756 false)))

(declare-fun lt!593859 () Bool)

(declare-datatypes ((List!31103 0))(
  ( (Nil!31100) (Cons!31099 (h!32308 (_ BitVec 64)) (t!45435 List!31103)) )
))
(declare-fun arrayNoDuplicates!0 (array!90934 (_ BitVec 32) List!31103) Bool)

(assert (=> b!1339249 (= lt!593859 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31100))))

(declare-fun res!888462 () Bool)

(assert (=> start!112986 (=> (not res!888462) (not e!762756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112986 (= res!888462 (validMask!0 mask!1977))))

(assert (=> start!112986 e!762756))

(assert (=> start!112986 true))

(declare-datatypes ((V!54485 0))(
  ( (V!54486 (val!18593 Int)) )
))
(declare-datatypes ((ValueCell!17620 0))(
  ( (ValueCellFull!17620 (v!21241 V!54485)) (EmptyCell!17620) )
))
(declare-datatypes ((array!90936 0))(
  ( (array!90937 (arr!43924 (Array (_ BitVec 32) ValueCell!17620)) (size!44474 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90936)

(declare-fun e!762754 () Bool)

(declare-fun array_inv!33121 (array!90936) Bool)

(assert (=> start!112986 (and (array_inv!33121 _values!1303) e!762754)))

(declare-fun array_inv!33122 (array!90934) Bool)

(assert (=> start!112986 (array_inv!33122 _keys!1571)))

(declare-fun b!1339250 () Bool)

(assert (=> b!1339250 (= e!762754 (and e!762758 mapRes!57262))))

(declare-fun condMapEmpty!57262 () Bool)

(declare-fun mapDefault!57262 () ValueCell!17620)

