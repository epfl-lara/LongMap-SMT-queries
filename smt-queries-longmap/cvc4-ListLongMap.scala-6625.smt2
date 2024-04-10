; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83726 () Bool)

(assert start!83726)

(declare-fun b!977644 () Bool)

(declare-fun res!654282 () Bool)

(declare-fun e!551193 () Bool)

(assert (=> b!977644 (=> (not res!654282) (not e!551193))))

(declare-datatypes ((array!61085 0))(
  ( (array!61086 (arr!29400 (Array (_ BitVec 32) (_ BitVec 64))) (size!29879 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61085)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61085 (_ BitVec 32)) Bool)

(assert (=> b!977644 (= res!654282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!35822 () Bool)

(declare-fun mapRes!35822 () Bool)

(assert (=> mapIsEmpty!35822 mapRes!35822))

(declare-fun b!977646 () Bool)

(assert (=> b!977646 (= e!551193 false)))

(declare-fun lt!433502 () Bool)

(declare-datatypes ((List!20382 0))(
  ( (Nil!20379) (Cons!20378 (h!21540 (_ BitVec 64)) (t!28897 List!20382)) )
))
(declare-fun arrayNoDuplicates!0 (array!61085 (_ BitVec 32) List!20382) Bool)

(assert (=> b!977646 (= lt!433502 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20379))))

(declare-fun b!977647 () Bool)

(declare-fun e!551194 () Bool)

(declare-fun e!551192 () Bool)

(assert (=> b!977647 (= e!551194 (and e!551192 mapRes!35822))))

(declare-fun condMapEmpty!35822 () Bool)

(declare-datatypes ((V!35021 0))(
  ( (V!35022 (val!11315 Int)) )
))
(declare-datatypes ((ValueCell!10783 0))(
  ( (ValueCellFull!10783 (v!13877 V!35021)) (EmptyCell!10783) )
))
(declare-datatypes ((array!61087 0))(
  ( (array!61088 (arr!29401 (Array (_ BitVec 32) ValueCell!10783)) (size!29880 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61087)

(declare-fun mapDefault!35822 () ValueCell!10783)

