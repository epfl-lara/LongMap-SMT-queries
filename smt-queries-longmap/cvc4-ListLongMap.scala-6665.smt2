; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83966 () Bool)

(assert start!83966)

(declare-fun res!656595 () Bool)

(declare-fun e!553157 () Bool)

(assert (=> start!83966 (=> (not res!656595) (not e!553157))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83966 (= res!656595 (validMask!0 mask!1948))))

(assert (=> start!83966 e!553157))

(assert (=> start!83966 true))

(declare-datatypes ((V!35341 0))(
  ( (V!35342 (val!11435 Int)) )
))
(declare-datatypes ((ValueCell!10903 0))(
  ( (ValueCellFull!10903 (v!13997 V!35341)) (EmptyCell!10903) )
))
(declare-datatypes ((array!61535 0))(
  ( (array!61536 (arr!29625 (Array (_ BitVec 32) ValueCell!10903)) (size!30104 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61535)

(declare-fun e!553154 () Bool)

(declare-fun array_inv!22905 (array!61535) Bool)

(assert (=> start!83966 (and (array_inv!22905 _values!1278) e!553154)))

(declare-datatypes ((array!61537 0))(
  ( (array!61538 (arr!29626 (Array (_ BitVec 32) (_ BitVec 64))) (size!30105 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61537)

(declare-fun array_inv!22906 (array!61537) Bool)

(assert (=> start!83966 (array_inv!22906 _keys!1544)))

(declare-fun b!981205 () Bool)

(declare-fun res!656596 () Bool)

(assert (=> b!981205 (=> (not res!656596) (not e!553157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61537 (_ BitVec 32)) Bool)

(assert (=> b!981205 (= res!656596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981206 () Bool)

(assert (=> b!981206 (= e!553157 false)))

(declare-fun lt!435671 () Bool)

(declare-datatypes ((List!20520 0))(
  ( (Nil!20517) (Cons!20516 (h!21678 (_ BitVec 64)) (t!29203 List!20520)) )
))
(declare-fun arrayNoDuplicates!0 (array!61537 (_ BitVec 32) List!20520) Bool)

(assert (=> b!981206 (= lt!435671 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20517))))

(declare-fun b!981207 () Bool)

(declare-fun e!553158 () Bool)

(declare-fun tp_is_empty!22769 () Bool)

(assert (=> b!981207 (= e!553158 tp_is_empty!22769)))

(declare-fun b!981208 () Bool)

(declare-fun res!656597 () Bool)

(assert (=> b!981208 (=> (not res!656597) (not e!553157))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981208 (= res!656597 (and (= (size!30104 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30105 _keys!1544) (size!30104 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981209 () Bool)

(declare-fun e!553155 () Bool)

(declare-fun mapRes!36182 () Bool)

(assert (=> b!981209 (= e!553154 (and e!553155 mapRes!36182))))

(declare-fun condMapEmpty!36182 () Bool)

(declare-fun mapDefault!36182 () ValueCell!10903)

