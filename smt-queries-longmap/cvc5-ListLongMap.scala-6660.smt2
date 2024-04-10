; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83932 () Bool)

(assert start!83932)

(declare-fun b!980899 () Bool)

(declare-fun e!552902 () Bool)

(declare-fun tp_is_empty!22735 () Bool)

(assert (=> b!980899 (= e!552902 tp_is_empty!22735)))

(declare-fun mapNonEmpty!36131 () Bool)

(declare-fun mapRes!36131 () Bool)

(declare-fun tp!68644 () Bool)

(declare-fun e!552900 () Bool)

(assert (=> mapNonEmpty!36131 (= mapRes!36131 (and tp!68644 e!552900))))

(declare-datatypes ((V!35297 0))(
  ( (V!35298 (val!11418 Int)) )
))
(declare-datatypes ((ValueCell!10886 0))(
  ( (ValueCellFull!10886 (v!13980 V!35297)) (EmptyCell!10886) )
))
(declare-datatypes ((array!61473 0))(
  ( (array!61474 (arr!29594 (Array (_ BitVec 32) ValueCell!10886)) (size!30073 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61473)

(declare-fun mapValue!36131 () ValueCell!10886)

(declare-fun mapRest!36131 () (Array (_ BitVec 32) ValueCell!10886))

(declare-fun mapKey!36131 () (_ BitVec 32))

(assert (=> mapNonEmpty!36131 (= (arr!29594 _values!1278) (store mapRest!36131 mapKey!36131 mapValue!36131))))

(declare-fun b!980900 () Bool)

(declare-fun res!656443 () Bool)

(declare-fun e!552903 () Bool)

(assert (=> b!980900 (=> (not res!656443) (not e!552903))))

(declare-datatypes ((array!61475 0))(
  ( (array!61476 (arr!29595 (Array (_ BitVec 32) (_ BitVec 64))) (size!30074 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61475)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61475 (_ BitVec 32)) Bool)

(assert (=> b!980900 (= res!656443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656444 () Bool)

(assert (=> start!83932 (=> (not res!656444) (not e!552903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83932 (= res!656444 (validMask!0 mask!1948))))

(assert (=> start!83932 e!552903))

(assert (=> start!83932 true))

(declare-fun e!552899 () Bool)

(declare-fun array_inv!22879 (array!61473) Bool)

(assert (=> start!83932 (and (array_inv!22879 _values!1278) e!552899)))

(declare-fun array_inv!22880 (array!61475) Bool)

(assert (=> start!83932 (array_inv!22880 _keys!1544)))

(declare-fun b!980901 () Bool)

(assert (=> b!980901 (= e!552900 tp_is_empty!22735)))

(declare-fun b!980902 () Bool)

(assert (=> b!980902 (= e!552903 false)))

(declare-fun lt!435620 () Bool)

(declare-datatypes ((List!20510 0))(
  ( (Nil!20507) (Cons!20506 (h!21668 (_ BitVec 64)) (t!29193 List!20510)) )
))
(declare-fun arrayNoDuplicates!0 (array!61475 (_ BitVec 32) List!20510) Bool)

(assert (=> b!980902 (= lt!435620 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20507))))

(declare-fun mapIsEmpty!36131 () Bool)

(assert (=> mapIsEmpty!36131 mapRes!36131))

(declare-fun b!980903 () Bool)

(assert (=> b!980903 (= e!552899 (and e!552902 mapRes!36131))))

(declare-fun condMapEmpty!36131 () Bool)

(declare-fun mapDefault!36131 () ValueCell!10886)

