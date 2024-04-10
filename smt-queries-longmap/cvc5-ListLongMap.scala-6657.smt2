; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83914 () Bool)

(assert start!83914)

(declare-fun b_free!19723 () Bool)

(declare-fun b_next!19723 () Bool)

(assert (=> start!83914 (= b_free!19723 (not b_next!19723))))

(declare-fun tp!68611 () Bool)

(declare-fun b_and!31535 () Bool)

(assert (=> start!83914 (= tp!68611 b_and!31535)))

(declare-fun b!980696 () Bool)

(declare-fun e!552760 () Bool)

(declare-fun tp_is_empty!22717 () Bool)

(assert (=> b!980696 (= e!552760 tp_is_empty!22717)))

(declare-fun res!656329 () Bool)

(declare-fun e!552762 () Bool)

(assert (=> start!83914 (=> (not res!656329) (not e!552762))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83914 (= res!656329 (validMask!0 mask!1948))))

(assert (=> start!83914 e!552762))

(assert (=> start!83914 true))

(assert (=> start!83914 tp_is_empty!22717))

(declare-datatypes ((V!35273 0))(
  ( (V!35274 (val!11409 Int)) )
))
(declare-datatypes ((ValueCell!10877 0))(
  ( (ValueCellFull!10877 (v!13971 V!35273)) (EmptyCell!10877) )
))
(declare-datatypes ((array!61441 0))(
  ( (array!61442 (arr!29578 (Array (_ BitVec 32) ValueCell!10877)) (size!30057 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61441)

(declare-fun e!552758 () Bool)

(declare-fun array_inv!22867 (array!61441) Bool)

(assert (=> start!83914 (and (array_inv!22867 _values!1278) e!552758)))

(assert (=> start!83914 tp!68611))

(declare-datatypes ((array!61443 0))(
  ( (array!61444 (arr!29579 (Array (_ BitVec 32) (_ BitVec 64))) (size!30058 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61443)

(declare-fun array_inv!22868 (array!61443) Bool)

(assert (=> start!83914 (array_inv!22868 _keys!1544)))

(declare-fun b!980697 () Bool)

(declare-fun res!656326 () Bool)

(assert (=> b!980697 (=> (not res!656326) (not e!552762))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980697 (= res!656326 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30058 _keys!1544))))))

(declare-fun b!980698 () Bool)

(declare-fun res!656327 () Bool)

(assert (=> b!980698 (=> (not res!656327) (not e!552762))))

(declare-datatypes ((List!20502 0))(
  ( (Nil!20499) (Cons!20498 (h!21660 (_ BitVec 64)) (t!29181 List!20502)) )
))
(declare-fun arrayNoDuplicates!0 (array!61443 (_ BitVec 32) List!20502) Bool)

(assert (=> b!980698 (= res!656327 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20499))))

(declare-fun b!980699 () Bool)

(declare-fun mapRes!36104 () Bool)

(assert (=> b!980699 (= e!552758 (and e!552760 mapRes!36104))))

(declare-fun condMapEmpty!36104 () Bool)

(declare-fun mapDefault!36104 () ValueCell!10877)

