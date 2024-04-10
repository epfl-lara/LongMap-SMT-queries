; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83956 () Bool)

(assert start!83956)

(declare-fun mapNonEmpty!36167 () Bool)

(declare-fun mapRes!36167 () Bool)

(declare-fun tp!68680 () Bool)

(declare-fun e!553080 () Bool)

(assert (=> mapNonEmpty!36167 (= mapRes!36167 (and tp!68680 e!553080))))

(declare-datatypes ((V!35329 0))(
  ( (V!35330 (val!11430 Int)) )
))
(declare-datatypes ((ValueCell!10898 0))(
  ( (ValueCellFull!10898 (v!13992 V!35329)) (EmptyCell!10898) )
))
(declare-datatypes ((array!61515 0))(
  ( (array!61516 (arr!29615 (Array (_ BitVec 32) ValueCell!10898)) (size!30094 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61515)

(declare-fun mapRest!36167 () (Array (_ BitVec 32) ValueCell!10898))

(declare-fun mapValue!36167 () ValueCell!10898)

(declare-fun mapKey!36167 () (_ BitVec 32))

(assert (=> mapNonEmpty!36167 (= (arr!29615 _values!1278) (store mapRest!36167 mapKey!36167 mapValue!36167))))

(declare-fun b!981115 () Bool)

(declare-fun e!553083 () Bool)

(assert (=> b!981115 (= e!553083 false)))

(declare-fun lt!435656 () Bool)

(declare-datatypes ((array!61517 0))(
  ( (array!61518 (arr!29616 (Array (_ BitVec 32) (_ BitVec 64))) (size!30095 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61517)

(declare-datatypes ((List!20515 0))(
  ( (Nil!20512) (Cons!20511 (h!21673 (_ BitVec 64)) (t!29198 List!20515)) )
))
(declare-fun arrayNoDuplicates!0 (array!61517 (_ BitVec 32) List!20515) Bool)

(assert (=> b!981115 (= lt!435656 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20512))))

(declare-fun b!981116 () Bool)

(declare-fun res!656550 () Bool)

(assert (=> b!981116 (=> (not res!656550) (not e!553083))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981116 (= res!656550 (and (= (size!30094 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30095 _keys!1544) (size!30094 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981117 () Bool)

(declare-fun tp_is_empty!22759 () Bool)

(assert (=> b!981117 (= e!553080 tp_is_empty!22759)))

(declare-fun mapIsEmpty!36167 () Bool)

(assert (=> mapIsEmpty!36167 mapRes!36167))

(declare-fun b!981118 () Bool)

(declare-fun res!656551 () Bool)

(assert (=> b!981118 (=> (not res!656551) (not e!553083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61517 (_ BitVec 32)) Bool)

(assert (=> b!981118 (= res!656551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656552 () Bool)

(assert (=> start!83956 (=> (not res!656552) (not e!553083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83956 (= res!656552 (validMask!0 mask!1948))))

(assert (=> start!83956 e!553083))

(assert (=> start!83956 true))

(declare-fun e!553081 () Bool)

(declare-fun array_inv!22895 (array!61515) Bool)

(assert (=> start!83956 (and (array_inv!22895 _values!1278) e!553081)))

(declare-fun array_inv!22896 (array!61517) Bool)

(assert (=> start!83956 (array_inv!22896 _keys!1544)))

(declare-fun b!981119 () Bool)

(declare-fun e!553082 () Bool)

(assert (=> b!981119 (= e!553082 tp_is_empty!22759)))

(declare-fun b!981120 () Bool)

(assert (=> b!981120 (= e!553081 (and e!553082 mapRes!36167))))

(declare-fun condMapEmpty!36167 () Bool)

(declare-fun mapDefault!36167 () ValueCell!10898)

