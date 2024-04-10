; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112976 () Bool)

(assert start!112976)

(declare-fun res!888416 () Bool)

(declare-fun e!762679 () Bool)

(assert (=> start!112976 (=> (not res!888416) (not e!762679))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112976 (= res!888416 (validMask!0 mask!1977))))

(assert (=> start!112976 e!762679))

(assert (=> start!112976 true))

(declare-datatypes ((V!54473 0))(
  ( (V!54474 (val!18588 Int)) )
))
(declare-datatypes ((ValueCell!17615 0))(
  ( (ValueCellFull!17615 (v!21236 V!54473)) (EmptyCell!17615) )
))
(declare-datatypes ((array!90916 0))(
  ( (array!90917 (arr!43914 (Array (_ BitVec 32) ValueCell!17615)) (size!44464 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90916)

(declare-fun e!762681 () Bool)

(declare-fun array_inv!33113 (array!90916) Bool)

(assert (=> start!112976 (and (array_inv!33113 _values!1303) e!762681)))

(declare-datatypes ((array!90918 0))(
  ( (array!90919 (arr!43915 (Array (_ BitVec 32) (_ BitVec 64))) (size!44465 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90918)

(declare-fun array_inv!33114 (array!90918) Bool)

(assert (=> start!112976 (array_inv!33114 _keys!1571)))

(declare-fun b!1339157 () Bool)

(declare-fun e!762683 () Bool)

(declare-fun tp_is_empty!37027 () Bool)

(assert (=> b!1339157 (= e!762683 tp_is_empty!37027)))

(declare-fun mapIsEmpty!57247 () Bool)

(declare-fun mapRes!57247 () Bool)

(assert (=> mapIsEmpty!57247 mapRes!57247))

(declare-fun b!1339158 () Bool)

(declare-fun res!888415 () Bool)

(assert (=> b!1339158 (=> (not res!888415) (not e!762679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90918 (_ BitVec 32)) Bool)

(assert (=> b!1339158 (= res!888415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339159 () Bool)

(assert (=> b!1339159 (= e!762679 false)))

(declare-fun lt!593844 () Bool)

(declare-datatypes ((List!31099 0))(
  ( (Nil!31096) (Cons!31095 (h!32304 (_ BitVec 64)) (t!45431 List!31099)) )
))
(declare-fun arrayNoDuplicates!0 (array!90918 (_ BitVec 32) List!31099) Bool)

(assert (=> b!1339159 (= lt!593844 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31096))))

(declare-fun b!1339160 () Bool)

(assert (=> b!1339160 (= e!762681 (and e!762683 mapRes!57247))))

(declare-fun condMapEmpty!57247 () Bool)

(declare-fun mapDefault!57247 () ValueCell!17615)

