; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83962 () Bool)

(assert start!83962)

(declare-fun b!981169 () Bool)

(declare-fun res!656579 () Bool)

(declare-fun e!553127 () Bool)

(assert (=> b!981169 (=> (not res!656579) (not e!553127))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35337 0))(
  ( (V!35338 (val!11433 Int)) )
))
(declare-datatypes ((ValueCell!10901 0))(
  ( (ValueCellFull!10901 (v!13995 V!35337)) (EmptyCell!10901) )
))
(declare-datatypes ((array!61527 0))(
  ( (array!61528 (arr!29621 (Array (_ BitVec 32) ValueCell!10901)) (size!30100 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61527)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61529 0))(
  ( (array!61530 (arr!29622 (Array (_ BitVec 32) (_ BitVec 64))) (size!30101 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61529)

(assert (=> b!981169 (= res!656579 (and (= (size!30100 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30101 _keys!1544) (size!30100 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981170 () Bool)

(assert (=> b!981170 (= e!553127 false)))

(declare-fun lt!435665 () Bool)

(declare-datatypes ((List!20518 0))(
  ( (Nil!20515) (Cons!20514 (h!21676 (_ BitVec 64)) (t!29201 List!20518)) )
))
(declare-fun arrayNoDuplicates!0 (array!61529 (_ BitVec 32) List!20518) Bool)

(assert (=> b!981170 (= lt!435665 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20515))))

(declare-fun res!656578 () Bool)

(assert (=> start!83962 (=> (not res!656578) (not e!553127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83962 (= res!656578 (validMask!0 mask!1948))))

(assert (=> start!83962 e!553127))

(assert (=> start!83962 true))

(declare-fun e!553125 () Bool)

(declare-fun array_inv!22901 (array!61527) Bool)

(assert (=> start!83962 (and (array_inv!22901 _values!1278) e!553125)))

(declare-fun array_inv!22902 (array!61529) Bool)

(assert (=> start!83962 (array_inv!22902 _keys!1544)))

(declare-fun b!981171 () Bool)

(declare-fun res!656577 () Bool)

(assert (=> b!981171 (=> (not res!656577) (not e!553127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61529 (_ BitVec 32)) Bool)

(assert (=> b!981171 (= res!656577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981172 () Bool)

(declare-fun e!553126 () Bool)

(declare-fun tp_is_empty!22765 () Bool)

(assert (=> b!981172 (= e!553126 tp_is_empty!22765)))

(declare-fun b!981173 () Bool)

(declare-fun e!553124 () Bool)

(declare-fun mapRes!36176 () Bool)

(assert (=> b!981173 (= e!553125 (and e!553124 mapRes!36176))))

(declare-fun condMapEmpty!36176 () Bool)

(declare-fun mapDefault!36176 () ValueCell!10901)

