; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83930 () Bool)

(assert start!83930)

(declare-fun mapNonEmpty!36128 () Bool)

(declare-fun mapRes!36128 () Bool)

(declare-fun tp!68641 () Bool)

(declare-fun e!552887 () Bool)

(assert (=> mapNonEmpty!36128 (= mapRes!36128 (and tp!68641 e!552887))))

(declare-datatypes ((V!35293 0))(
  ( (V!35294 (val!11417 Int)) )
))
(declare-datatypes ((ValueCell!10885 0))(
  ( (ValueCellFull!10885 (v!13979 V!35293)) (EmptyCell!10885) )
))
(declare-datatypes ((array!61469 0))(
  ( (array!61470 (arr!29592 (Array (_ BitVec 32) ValueCell!10885)) (size!30071 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61469)

(declare-fun mapKey!36128 () (_ BitVec 32))

(declare-fun mapRest!36128 () (Array (_ BitVec 32) ValueCell!10885))

(declare-fun mapValue!36128 () ValueCell!10885)

(assert (=> mapNonEmpty!36128 (= (arr!29592 _values!1278) (store mapRest!36128 mapKey!36128 mapValue!36128))))

(declare-fun b!980881 () Bool)

(declare-fun e!552886 () Bool)

(declare-fun tp_is_empty!22733 () Bool)

(assert (=> b!980881 (= e!552886 tp_is_empty!22733)))

(declare-fun b!980882 () Bool)

(declare-fun res!656435 () Bool)

(declare-fun e!552884 () Bool)

(assert (=> b!980882 (=> (not res!656435) (not e!552884))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61471 0))(
  ( (array!61472 (arr!29593 (Array (_ BitVec 32) (_ BitVec 64))) (size!30072 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61471)

(assert (=> b!980882 (= res!656435 (and (= (size!30071 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30072 _keys!1544) (size!30071 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36128 () Bool)

(assert (=> mapIsEmpty!36128 mapRes!36128))

(declare-fun b!980884 () Bool)

(assert (=> b!980884 (= e!552884 false)))

(declare-fun lt!435617 () Bool)

(declare-datatypes ((List!20509 0))(
  ( (Nil!20506) (Cons!20505 (h!21667 (_ BitVec 64)) (t!29192 List!20509)) )
))
(declare-fun arrayNoDuplicates!0 (array!61471 (_ BitVec 32) List!20509) Bool)

(assert (=> b!980884 (= lt!435617 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20506))))

(declare-fun b!980885 () Bool)

(assert (=> b!980885 (= e!552887 tp_is_empty!22733)))

(declare-fun b!980886 () Bool)

(declare-fun res!656434 () Bool)

(assert (=> b!980886 (=> (not res!656434) (not e!552884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61471 (_ BitVec 32)) Bool)

(assert (=> b!980886 (= res!656434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980883 () Bool)

(declare-fun e!552888 () Bool)

(assert (=> b!980883 (= e!552888 (and e!552886 mapRes!36128))))

(declare-fun condMapEmpty!36128 () Bool)

(declare-fun mapDefault!36128 () ValueCell!10885)

