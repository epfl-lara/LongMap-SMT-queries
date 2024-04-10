; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83738 () Bool)

(assert start!83738)

(declare-fun res!654338 () Bool)

(declare-fun e!551284 () Bool)

(assert (=> start!83738 (=> (not res!654338) (not e!551284))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83738 (= res!654338 (validMask!0 mask!1948))))

(assert (=> start!83738 e!551284))

(assert (=> start!83738 true))

(declare-datatypes ((V!35037 0))(
  ( (V!35038 (val!11321 Int)) )
))
(declare-datatypes ((ValueCell!10789 0))(
  ( (ValueCellFull!10789 (v!13883 V!35037)) (EmptyCell!10789) )
))
(declare-datatypes ((array!61109 0))(
  ( (array!61110 (arr!29412 (Array (_ BitVec 32) ValueCell!10789)) (size!29891 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61109)

(declare-fun e!551282 () Bool)

(declare-fun array_inv!22739 (array!61109) Bool)

(assert (=> start!83738 (and (array_inv!22739 _values!1278) e!551282)))

(declare-datatypes ((array!61111 0))(
  ( (array!61112 (arr!29413 (Array (_ BitVec 32) (_ BitVec 64))) (size!29892 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61111)

(declare-fun array_inv!22740 (array!61111) Bool)

(assert (=> start!83738 (array_inv!22740 _keys!1544)))

(declare-fun b!977752 () Bool)

(declare-fun res!654337 () Bool)

(assert (=> b!977752 (=> (not res!654337) (not e!551284))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977752 (= res!654337 (and (= (size!29891 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29892 _keys!1544) (size!29891 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977753 () Bool)

(declare-fun e!551285 () Bool)

(declare-fun tp_is_empty!22541 () Bool)

(assert (=> b!977753 (= e!551285 tp_is_empty!22541)))

(declare-fun b!977754 () Bool)

(declare-fun mapRes!35840 () Bool)

(assert (=> b!977754 (= e!551282 (and e!551285 mapRes!35840))))

(declare-fun condMapEmpty!35840 () Bool)

(declare-fun mapDefault!35840 () ValueCell!10789)

