; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84278 () Bool)

(assert start!84278)

(declare-fun b!985975 () Bool)

(declare-fun e!555820 () Bool)

(declare-fun tp_is_empty!23081 () Bool)

(assert (=> b!985975 (= e!555820 tp_is_empty!23081)))

(declare-fun b!985976 () Bool)

(declare-fun res!659747 () Bool)

(declare-fun e!555821 () Bool)

(assert (=> b!985976 (=> (not res!659747) (not e!555821))))

(declare-datatypes ((array!62135 0))(
  ( (array!62136 (arr!29925 (Array (_ BitVec 32) (_ BitVec 64))) (size!30404 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62135)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62135 (_ BitVec 32)) Bool)

(assert (=> b!985976 (= res!659747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!659745 () Bool)

(assert (=> start!84278 (=> (not res!659745) (not e!555821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84278 (= res!659745 (validMask!0 mask!1948))))

(assert (=> start!84278 e!555821))

(assert (=> start!84278 true))

(declare-datatypes ((V!35757 0))(
  ( (V!35758 (val!11591 Int)) )
))
(declare-datatypes ((ValueCell!11059 0))(
  ( (ValueCellFull!11059 (v!14153 V!35757)) (EmptyCell!11059) )
))
(declare-datatypes ((array!62137 0))(
  ( (array!62138 (arr!29926 (Array (_ BitVec 32) ValueCell!11059)) (size!30405 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62137)

(declare-fun e!555822 () Bool)

(declare-fun array_inv!23127 (array!62137) Bool)

(assert (=> start!84278 (and (array_inv!23127 _values!1278) e!555822)))

(declare-fun array_inv!23128 (array!62135) Bool)

(assert (=> start!84278 (array_inv!23128 _keys!1544)))

(declare-fun b!985977 () Bool)

(assert (=> b!985977 (= e!555821 false)))

(declare-fun lt!437417 () Bool)

(declare-datatypes ((List!20724 0))(
  ( (Nil!20721) (Cons!20720 (h!21882 (_ BitVec 64)) (t!29623 List!20724)) )
))
(declare-fun arrayNoDuplicates!0 (array!62135 (_ BitVec 32) List!20724) Bool)

(assert (=> b!985977 (= lt!437417 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20721))))

(declare-fun b!985978 () Bool)

(declare-fun res!659746 () Bool)

(assert (=> b!985978 (=> (not res!659746) (not e!555821))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985978 (= res!659746 (and (= (size!30405 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30404 _keys!1544) (size!30405 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985979 () Bool)

(declare-fun e!555818 () Bool)

(assert (=> b!985979 (= e!555818 tp_is_empty!23081)))

(declare-fun mapNonEmpty!36650 () Bool)

(declare-fun mapRes!36650 () Bool)

(declare-fun tp!69505 () Bool)

(assert (=> mapNonEmpty!36650 (= mapRes!36650 (and tp!69505 e!555820))))

(declare-fun mapValue!36650 () ValueCell!11059)

(declare-fun mapKey!36650 () (_ BitVec 32))

(declare-fun mapRest!36650 () (Array (_ BitVec 32) ValueCell!11059))

(assert (=> mapNonEmpty!36650 (= (arr!29926 _values!1278) (store mapRest!36650 mapKey!36650 mapValue!36650))))

(declare-fun b!985980 () Bool)

(assert (=> b!985980 (= e!555822 (and e!555818 mapRes!36650))))

(declare-fun condMapEmpty!36650 () Bool)

(declare-fun mapDefault!36650 () ValueCell!11059)

