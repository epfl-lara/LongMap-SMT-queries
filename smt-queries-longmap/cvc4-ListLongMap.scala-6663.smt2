; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83954 () Bool)

(assert start!83954)

(declare-fun b!981097 () Bool)

(declare-fun res!656542 () Bool)

(declare-fun e!553068 () Bool)

(assert (=> b!981097 (=> (not res!656542) (not e!553068))))

(declare-datatypes ((array!61511 0))(
  ( (array!61512 (arr!29613 (Array (_ BitVec 32) (_ BitVec 64))) (size!30092 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61511)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61511 (_ BitVec 32)) Bool)

(assert (=> b!981097 (= res!656542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36164 () Bool)

(declare-fun mapRes!36164 () Bool)

(assert (=> mapIsEmpty!36164 mapRes!36164))

(declare-fun res!656541 () Bool)

(assert (=> start!83954 (=> (not res!656541) (not e!553068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83954 (= res!656541 (validMask!0 mask!1948))))

(assert (=> start!83954 e!553068))

(assert (=> start!83954 true))

(declare-datatypes ((V!35325 0))(
  ( (V!35326 (val!11429 Int)) )
))
(declare-datatypes ((ValueCell!10897 0))(
  ( (ValueCellFull!10897 (v!13991 V!35325)) (EmptyCell!10897) )
))
(declare-datatypes ((array!61513 0))(
  ( (array!61514 (arr!29614 (Array (_ BitVec 32) ValueCell!10897)) (size!30093 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61513)

(declare-fun e!553064 () Bool)

(declare-fun array_inv!22893 (array!61513) Bool)

(assert (=> start!83954 (and (array_inv!22893 _values!1278) e!553064)))

(declare-fun array_inv!22894 (array!61511) Bool)

(assert (=> start!83954 (array_inv!22894 _keys!1544)))

(declare-fun b!981098 () Bool)

(declare-fun e!553066 () Bool)

(assert (=> b!981098 (= e!553064 (and e!553066 mapRes!36164))))

(declare-fun condMapEmpty!36164 () Bool)

(declare-fun mapDefault!36164 () ValueCell!10897)

