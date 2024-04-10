; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83972 () Bool)

(assert start!83972)

(declare-fun b!981283 () Bool)

(declare-fun e!553199 () Bool)

(declare-fun tp_is_empty!22775 () Bool)

(assert (=> b!981283 (= e!553199 tp_is_empty!22775)))

(declare-fun b!981284 () Bool)

(declare-fun e!553202 () Bool)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981284 (= e!553202 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun b!981285 () Bool)

(declare-fun e!553200 () Bool)

(assert (=> b!981285 (= e!553200 tp_is_empty!22775)))

(declare-fun b!981286 () Bool)

(declare-fun res!656648 () Bool)

(assert (=> b!981286 (=> (not res!656648) (not e!553202))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35349 0))(
  ( (V!35350 (val!11438 Int)) )
))
(declare-datatypes ((ValueCell!10906 0))(
  ( (ValueCellFull!10906 (v!14000 V!35349)) (EmptyCell!10906) )
))
(declare-datatypes ((array!61547 0))(
  ( (array!61548 (arr!29631 (Array (_ BitVec 32) ValueCell!10906)) (size!30110 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61547)

(declare-datatypes ((array!61549 0))(
  ( (array!61550 (arr!29632 (Array (_ BitVec 32) (_ BitVec 64))) (size!30111 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61549)

(assert (=> b!981286 (= res!656648 (and (= (size!30110 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30111 _keys!1544) (size!30110 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!656649 () Bool)

(assert (=> start!83972 (=> (not res!656649) (not e!553202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83972 (= res!656649 (validMask!0 mask!1948))))

(assert (=> start!83972 e!553202))

(assert (=> start!83972 true))

(declare-fun e!553203 () Bool)

(declare-fun array_inv!22909 (array!61547) Bool)

(assert (=> start!83972 (and (array_inv!22909 _values!1278) e!553203)))

(declare-fun array_inv!22910 (array!61549) Bool)

(assert (=> start!83972 (array_inv!22910 _keys!1544)))

(declare-fun b!981287 () Bool)

(declare-fun res!656650 () Bool)

(assert (=> b!981287 (=> (not res!656650) (not e!553202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981287 (= res!656650 (validKeyInArray!0 (select (arr!29632 _keys!1544) from!1932)))))

(declare-fun b!981288 () Bool)

(declare-fun res!656651 () Bool)

(assert (=> b!981288 (=> (not res!656651) (not e!553202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61549 (_ BitVec 32)) Bool)

(assert (=> b!981288 (= res!656651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981289 () Bool)

(declare-fun mapRes!36191 () Bool)

(assert (=> b!981289 (= e!553203 (and e!553199 mapRes!36191))))

(declare-fun condMapEmpty!36191 () Bool)

(declare-fun mapDefault!36191 () ValueCell!10906)

