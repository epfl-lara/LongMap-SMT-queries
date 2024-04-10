; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110876 () Bool)

(assert start!110876)

(declare-fun b_free!29711 () Bool)

(declare-fun b_next!29711 () Bool)

(assert (=> start!110876 (= b_free!29711 (not b_next!29711))))

(declare-fun tp!104454 () Bool)

(declare-fun b_and!47919 () Bool)

(assert (=> start!110876 (= tp!104454 b_and!47919)))

(declare-fun mapNonEmpty!54790 () Bool)

(declare-fun mapRes!54790 () Bool)

(declare-fun tp!104455 () Bool)

(declare-fun e!748694 () Bool)

(assert (=> mapNonEmpty!54790 (= mapRes!54790 (and tp!104455 e!748694))))

(declare-fun mapKey!54790 () (_ BitVec 32))

(declare-datatypes ((V!52357 0))(
  ( (V!52358 (val!17795 Int)) )
))
(declare-datatypes ((ValueCell!16822 0))(
  ( (ValueCellFull!16822 (v!20422 V!52357)) (EmptyCell!16822) )
))
(declare-datatypes ((array!87864 0))(
  ( (array!87865 (arr!42412 (Array (_ BitVec 32) ValueCell!16822)) (size!42962 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87864)

(declare-fun mapValue!54790 () ValueCell!16822)

(declare-fun mapRest!54790 () (Array (_ BitVec 32) ValueCell!16822))

(assert (=> mapNonEmpty!54790 (= (arr!42412 _values!1354) (store mapRest!54790 mapKey!54790 mapValue!54790))))

(declare-fun b!1312643 () Bool)

(declare-fun res!871491 () Bool)

(declare-fun e!748697 () Bool)

(assert (=> b!1312643 (=> (not res!871491) (not e!748697))))

(declare-datatypes ((array!87866 0))(
  ( (array!87867 (arr!42413 (Array (_ BitVec 32) (_ BitVec 64))) (size!42963 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87866)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87866 (_ BitVec 32)) Bool)

(assert (=> b!1312643 (= res!871491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312644 () Bool)

(declare-fun e!748696 () Bool)

(declare-fun e!748693 () Bool)

(assert (=> b!1312644 (= e!748696 (and e!748693 mapRes!54790))))

(declare-fun condMapEmpty!54790 () Bool)

(declare-fun mapDefault!54790 () ValueCell!16822)

