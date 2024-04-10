; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84356 () Bool)

(assert start!84356)

(declare-fun mapIsEmpty!36767 () Bool)

(declare-fun mapRes!36767 () Bool)

(assert (=> mapIsEmpty!36767 mapRes!36767))

(declare-fun b!986704 () Bool)

(declare-fun res!660124 () Bool)

(declare-fun e!556404 () Bool)

(assert (=> b!986704 (=> (not res!660124) (not e!556404))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62279 0))(
  ( (array!62280 (arr!29997 (Array (_ BitVec 32) (_ BitVec 64))) (size!30476 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62279)

(declare-datatypes ((V!35861 0))(
  ( (V!35862 (val!11630 Int)) )
))
(declare-datatypes ((ValueCell!11098 0))(
  ( (ValueCellFull!11098 (v!14192 V!35861)) (EmptyCell!11098) )
))
(declare-datatypes ((array!62281 0))(
  ( (array!62282 (arr!29998 (Array (_ BitVec 32) ValueCell!11098)) (size!30477 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62281)

(assert (=> b!986704 (= res!660124 (and (= (size!30477 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30476 _keys!1544) (size!30477 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986705 () Bool)

(assert (=> b!986705 (= e!556404 false)))

(declare-fun lt!437534 () Bool)

(declare-datatypes ((List!20750 0))(
  ( (Nil!20747) (Cons!20746 (h!21908 (_ BitVec 64)) (t!29649 List!20750)) )
))
(declare-fun arrayNoDuplicates!0 (array!62279 (_ BitVec 32) List!20750) Bool)

(assert (=> b!986705 (= lt!437534 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20747))))

(declare-fun b!986706 () Bool)

(declare-fun e!556405 () Bool)

(declare-fun e!556403 () Bool)

(assert (=> b!986706 (= e!556405 (and e!556403 mapRes!36767))))

(declare-fun condMapEmpty!36767 () Bool)

(declare-fun mapDefault!36767 () ValueCell!11098)

