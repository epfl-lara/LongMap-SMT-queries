; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83944 () Bool)

(assert start!83944)

(declare-fun mapNonEmpty!36149 () Bool)

(declare-fun mapRes!36149 () Bool)

(declare-fun tp!68662 () Bool)

(declare-fun e!552992 () Bool)

(assert (=> mapNonEmpty!36149 (= mapRes!36149 (and tp!68662 e!552992))))

(declare-datatypes ((V!35313 0))(
  ( (V!35314 (val!11424 Int)) )
))
(declare-datatypes ((ValueCell!10892 0))(
  ( (ValueCellFull!10892 (v!13986 V!35313)) (EmptyCell!10892) )
))
(declare-datatypes ((array!61495 0))(
  ( (array!61496 (arr!29605 (Array (_ BitVec 32) ValueCell!10892)) (size!30084 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61495)

(declare-fun mapRest!36149 () (Array (_ BitVec 32) ValueCell!10892))

(declare-fun mapKey!36149 () (_ BitVec 32))

(declare-fun mapValue!36149 () ValueCell!10892)

(assert (=> mapNonEmpty!36149 (= (arr!29605 _values!1278) (store mapRest!36149 mapKey!36149 mapValue!36149))))

(declare-fun b!981007 () Bool)

(declare-fun res!656497 () Bool)

(declare-fun e!552989 () Bool)

(assert (=> b!981007 (=> (not res!656497) (not e!552989))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61497 0))(
  ( (array!61498 (arr!29606 (Array (_ BitVec 32) (_ BitVec 64))) (size!30085 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61497)

(assert (=> b!981007 (= res!656497 (and (= (size!30084 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30085 _keys!1544) (size!30084 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!656498 () Bool)

(assert (=> start!83944 (=> (not res!656498) (not e!552989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83944 (= res!656498 (validMask!0 mask!1948))))

(assert (=> start!83944 e!552989))

(assert (=> start!83944 true))

(declare-fun e!552990 () Bool)

(declare-fun array_inv!22887 (array!61495) Bool)

(assert (=> start!83944 (and (array_inv!22887 _values!1278) e!552990)))

(declare-fun array_inv!22888 (array!61497) Bool)

(assert (=> start!83944 (array_inv!22888 _keys!1544)))

(declare-fun b!981008 () Bool)

(declare-fun e!552991 () Bool)

(assert (=> b!981008 (= e!552990 (and e!552991 mapRes!36149))))

(declare-fun condMapEmpty!36149 () Bool)

(declare-fun mapDefault!36149 () ValueCell!10892)

