; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84106 () Bool)

(assert start!84106)

(declare-fun b!983446 () Bool)

(declare-fun e!554369 () Bool)

(assert (=> b!983446 (= e!554369 false)))

(declare-fun lt!436520 () Bool)

(declare-datatypes ((array!61805 0))(
  ( (array!61806 (arr!29760 (Array (_ BitVec 32) (_ BitVec 64))) (size!30239 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61805)

(declare-datatypes ((List!20612 0))(
  ( (Nil!20609) (Cons!20608 (h!21770 (_ BitVec 64)) (t!29403 List!20612)) )
))
(declare-fun arrayNoDuplicates!0 (array!61805 (_ BitVec 32) List!20612) Bool)

(assert (=> b!983446 (= lt!436520 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20609))))

(declare-fun mapIsEmpty!36392 () Bool)

(declare-fun mapRes!36392 () Bool)

(assert (=> mapIsEmpty!36392 mapRes!36392))

(declare-fun res!658099 () Bool)

(assert (=> start!84106 (=> (not res!658099) (not e!554369))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84106 (= res!658099 (validMask!0 mask!1948))))

(assert (=> start!84106 e!554369))

(assert (=> start!84106 true))

(declare-datatypes ((V!35529 0))(
  ( (V!35530 (val!11505 Int)) )
))
(declare-datatypes ((ValueCell!10973 0))(
  ( (ValueCellFull!10973 (v!14067 V!35529)) (EmptyCell!10973) )
))
(declare-datatypes ((array!61807 0))(
  ( (array!61808 (arr!29761 (Array (_ BitVec 32) ValueCell!10973)) (size!30240 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61807)

(declare-fun e!554368 () Bool)

(declare-fun array_inv!23011 (array!61807) Bool)

(assert (=> start!84106 (and (array_inv!23011 _values!1278) e!554368)))

(declare-fun array_inv!23012 (array!61805) Bool)

(assert (=> start!84106 (array_inv!23012 _keys!1544)))

(declare-fun b!983447 () Bool)

(declare-fun e!554366 () Bool)

(assert (=> b!983447 (= e!554368 (and e!554366 mapRes!36392))))

(declare-fun condMapEmpty!36392 () Bool)

(declare-fun mapDefault!36392 () ValueCell!10973)

