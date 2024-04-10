; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113214 () Bool)

(assert start!113214)

(declare-fun b_free!31265 () Bool)

(declare-fun b_next!31265 () Bool)

(assert (=> start!113214 (= b_free!31265 (not b_next!31265))))

(declare-fun tp!109600 () Bool)

(declare-fun b_and!50437 () Bool)

(assert (=> start!113214 (= tp!109600 b_and!50437)))

(declare-fun res!890976 () Bool)

(declare-fun e!764468 () Bool)

(assert (=> start!113214 (=> (not res!890976) (not e!764468))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113214 (= res!890976 (validMask!0 mask!1977))))

(assert (=> start!113214 e!764468))

(declare-fun tp_is_empty!37265 () Bool)

(assert (=> start!113214 tp_is_empty!37265))

(assert (=> start!113214 true))

(declare-datatypes ((array!91378 0))(
  ( (array!91379 (arr!44145 (Array (_ BitVec 32) (_ BitVec 64))) (size!44695 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91378)

(declare-fun array_inv!33277 (array!91378) Bool)

(assert (=> start!113214 (array_inv!33277 _keys!1571)))

(declare-datatypes ((V!54789 0))(
  ( (V!54790 (val!18707 Int)) )
))
(declare-datatypes ((ValueCell!17734 0))(
  ( (ValueCellFull!17734 (v!21355 V!54789)) (EmptyCell!17734) )
))
(declare-datatypes ((array!91380 0))(
  ( (array!91381 (arr!44146 (Array (_ BitVec 32) ValueCell!17734)) (size!44696 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91380)

(declare-fun e!764464 () Bool)

(declare-fun array_inv!33278 (array!91380) Bool)

(assert (=> start!113214 (and (array_inv!33278 _values!1303) e!764464)))

(assert (=> start!113214 tp!109600))

(declare-fun b!1342929 () Bool)

(declare-fun e!764466 () Bool)

(assert (=> b!1342929 (= e!764466 tp_is_empty!37265)))

(declare-fun b!1342930 () Bool)

(declare-fun res!890977 () Bool)

(assert (=> b!1342930 (=> (not res!890977) (not e!764468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91378 (_ BitVec 32)) Bool)

(assert (=> b!1342930 (= res!890977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342931 () Bool)

(declare-fun mapRes!57604 () Bool)

(assert (=> b!1342931 (= e!764464 (and e!764466 mapRes!57604))))

(declare-fun condMapEmpty!57604 () Bool)

(declare-fun mapDefault!57604 () ValueCell!17734)

