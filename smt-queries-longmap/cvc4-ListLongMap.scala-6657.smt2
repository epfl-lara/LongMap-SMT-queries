; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83918 () Bool)

(assert start!83918)

(declare-fun b_free!19727 () Bool)

(declare-fun b_next!19727 () Bool)

(assert (=> start!83918 (= b_free!19727 (not b_next!19727))))

(declare-fun tp!68622 () Bool)

(declare-fun b_and!31543 () Bool)

(assert (=> start!83918 (= tp!68622 b_and!31543)))

(declare-fun res!656380 () Bool)

(declare-fun e!552797 () Bool)

(assert (=> start!83918 (=> (not res!656380) (not e!552797))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83918 (= res!656380 (validMask!0 mask!1948))))

(assert (=> start!83918 e!552797))

(assert (=> start!83918 true))

(declare-fun tp_is_empty!22721 () Bool)

(assert (=> start!83918 tp_is_empty!22721))

(declare-datatypes ((V!35277 0))(
  ( (V!35278 (val!11411 Int)) )
))
(declare-datatypes ((ValueCell!10879 0))(
  ( (ValueCellFull!10879 (v!13973 V!35277)) (EmptyCell!10879) )
))
(declare-datatypes ((array!61449 0))(
  ( (array!61450 (arr!29582 (Array (_ BitVec 32) ValueCell!10879)) (size!30061 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61449)

(declare-fun e!552793 () Bool)

(declare-fun array_inv!22871 (array!61449) Bool)

(assert (=> start!83918 (and (array_inv!22871 _values!1278) e!552793)))

(assert (=> start!83918 tp!68622))

(declare-datatypes ((array!61451 0))(
  ( (array!61452 (arr!29583 (Array (_ BitVec 32) (_ BitVec 64))) (size!30062 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61451)

(declare-fun array_inv!22872 (array!61451) Bool)

(assert (=> start!83918 (array_inv!22872 _keys!1544)))

(declare-fun b!980766 () Bool)

(declare-fun res!656374 () Bool)

(assert (=> b!980766 (=> (not res!656374) (not e!552797))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980766 (= res!656374 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30062 _keys!1544))))))

(declare-fun b!980767 () Bool)

(declare-fun res!656378 () Bool)

(assert (=> b!980767 (=> (not res!656378) (not e!552797))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980767 (= res!656378 (and (= (size!30061 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30062 _keys!1544) (size!30061 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980768 () Bool)

(declare-fun e!552798 () Bool)

(assert (=> b!980768 (= e!552798 tp_is_empty!22721)))

(declare-fun b!980769 () Bool)

(declare-fun res!656381 () Bool)

(assert (=> b!980769 (=> (not res!656381) (not e!552797))))

(declare-datatypes ((List!20505 0))(
  ( (Nil!20502) (Cons!20501 (h!21663 (_ BitVec 64)) (t!29188 List!20505)) )
))
(declare-fun arrayNoDuplicates!0 (array!61451 (_ BitVec 32) List!20505) Bool)

(assert (=> b!980769 (= res!656381 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20502))))

(declare-fun b!980770 () Bool)

(declare-fun res!656379 () Bool)

(assert (=> b!980770 (=> (not res!656379) (not e!552797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61451 (_ BitVec 32)) Bool)

(assert (=> b!980770 (= res!656379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980771 () Bool)

(declare-fun e!552796 () Bool)

(declare-fun mapRes!36110 () Bool)

(assert (=> b!980771 (= e!552793 (and e!552796 mapRes!36110))))

(declare-fun condMapEmpty!36110 () Bool)

(declare-fun mapDefault!36110 () ValueCell!10879)

