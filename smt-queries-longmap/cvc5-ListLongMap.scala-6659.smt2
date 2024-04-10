; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83926 () Bool)

(assert start!83926)

(declare-fun b!980845 () Bool)

(declare-fun e!552854 () Bool)

(declare-fun tp_is_empty!22729 () Bool)

(assert (=> b!980845 (= e!552854 tp_is_empty!22729)))

(declare-fun mapIsEmpty!36122 () Bool)

(declare-fun mapRes!36122 () Bool)

(assert (=> mapIsEmpty!36122 mapRes!36122))

(declare-fun b!980846 () Bool)

(declare-fun res!656416 () Bool)

(declare-fun e!552856 () Bool)

(assert (=> b!980846 (=> (not res!656416) (not e!552856))))

(declare-datatypes ((array!61461 0))(
  ( (array!61462 (arr!29588 (Array (_ BitVec 32) (_ BitVec 64))) (size!30067 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61461)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61461 (_ BitVec 32)) Bool)

(assert (=> b!980846 (= res!656416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656417 () Bool)

(assert (=> start!83926 (=> (not res!656417) (not e!552856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83926 (= res!656417 (validMask!0 mask!1948))))

(assert (=> start!83926 e!552856))

(assert (=> start!83926 true))

(declare-datatypes ((V!35289 0))(
  ( (V!35290 (val!11415 Int)) )
))
(declare-datatypes ((ValueCell!10883 0))(
  ( (ValueCellFull!10883 (v!13977 V!35289)) (EmptyCell!10883) )
))
(declare-datatypes ((array!61463 0))(
  ( (array!61464 (arr!29589 (Array (_ BitVec 32) ValueCell!10883)) (size!30068 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61463)

(declare-fun e!552857 () Bool)

(declare-fun array_inv!22875 (array!61463) Bool)

(assert (=> start!83926 (and (array_inv!22875 _values!1278) e!552857)))

(declare-fun array_inv!22876 (array!61461) Bool)

(assert (=> start!83926 (array_inv!22876 _keys!1544)))

(declare-fun b!980847 () Bool)

(declare-fun e!552858 () Bool)

(assert (=> b!980847 (= e!552858 tp_is_empty!22729)))

(declare-fun b!980848 () Bool)

(assert (=> b!980848 (= e!552856 false)))

(declare-fun lt!435611 () Bool)

(declare-datatypes ((List!20507 0))(
  ( (Nil!20504) (Cons!20503 (h!21665 (_ BitVec 64)) (t!29190 List!20507)) )
))
(declare-fun arrayNoDuplicates!0 (array!61461 (_ BitVec 32) List!20507) Bool)

(assert (=> b!980848 (= lt!435611 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20504))))

(declare-fun mapNonEmpty!36122 () Bool)

(declare-fun tp!68635 () Bool)

(assert (=> mapNonEmpty!36122 (= mapRes!36122 (and tp!68635 e!552858))))

(declare-fun mapValue!36122 () ValueCell!10883)

(declare-fun mapKey!36122 () (_ BitVec 32))

(declare-fun mapRest!36122 () (Array (_ BitVec 32) ValueCell!10883))

(assert (=> mapNonEmpty!36122 (= (arr!29589 _values!1278) (store mapRest!36122 mapKey!36122 mapValue!36122))))

(declare-fun b!980849 () Bool)

(declare-fun res!656415 () Bool)

(assert (=> b!980849 (=> (not res!656415) (not e!552856))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980849 (= res!656415 (and (= (size!30068 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30067 _keys!1544) (size!30068 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980850 () Bool)

(assert (=> b!980850 (= e!552857 (and e!552854 mapRes!36122))))

(declare-fun condMapEmpty!36122 () Bool)

(declare-fun mapDefault!36122 () ValueCell!10883)

