; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84122 () Bool)

(assert start!84122)

(declare-fun b!983590 () Bool)

(declare-fun e!554487 () Bool)

(declare-fun tp_is_empty!22925 () Bool)

(assert (=> b!983590 (= e!554487 tp_is_empty!22925)))

(declare-fun mapNonEmpty!36416 () Bool)

(declare-fun mapRes!36416 () Bool)

(declare-fun tp!69100 () Bool)

(declare-fun e!554486 () Bool)

(assert (=> mapNonEmpty!36416 (= mapRes!36416 (and tp!69100 e!554486))))

(declare-datatypes ((V!35549 0))(
  ( (V!35550 (val!11513 Int)) )
))
(declare-datatypes ((ValueCell!10981 0))(
  ( (ValueCellFull!10981 (v!14075 V!35549)) (EmptyCell!10981) )
))
(declare-datatypes ((array!61837 0))(
  ( (array!61838 (arr!29776 (Array (_ BitVec 32) ValueCell!10981)) (size!30255 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61837)

(declare-fun mapKey!36416 () (_ BitVec 32))

(declare-fun mapValue!36416 () ValueCell!10981)

(declare-fun mapRest!36416 () (Array (_ BitVec 32) ValueCell!10981))

(assert (=> mapNonEmpty!36416 (= (arr!29776 _values!1278) (store mapRest!36416 mapKey!36416 mapValue!36416))))

(declare-fun res!658172 () Bool)

(declare-fun e!554490 () Bool)

(assert (=> start!84122 (=> (not res!658172) (not e!554490))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84122 (= res!658172 (validMask!0 mask!1948))))

(assert (=> start!84122 e!554490))

(assert (=> start!84122 true))

(declare-fun e!554489 () Bool)

(declare-fun array_inv!23025 (array!61837) Bool)

(assert (=> start!84122 (and (array_inv!23025 _values!1278) e!554489)))

(declare-datatypes ((array!61839 0))(
  ( (array!61840 (arr!29777 (Array (_ BitVec 32) (_ BitVec 64))) (size!30256 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61839)

(declare-fun array_inv!23026 (array!61839) Bool)

(assert (=> start!84122 (array_inv!23026 _keys!1544)))

(declare-fun b!983591 () Bool)

(assert (=> b!983591 (= e!554490 false)))

(declare-fun lt!436544 () Bool)

(declare-datatypes ((List!20618 0))(
  ( (Nil!20615) (Cons!20614 (h!21776 (_ BitVec 64)) (t!29409 List!20618)) )
))
(declare-fun arrayNoDuplicates!0 (array!61839 (_ BitVec 32) List!20618) Bool)

(assert (=> b!983591 (= lt!436544 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20615))))

(declare-fun b!983592 () Bool)

(assert (=> b!983592 (= e!554486 tp_is_empty!22925)))

(declare-fun b!983593 () Bool)

(declare-fun res!658170 () Bool)

(assert (=> b!983593 (=> (not res!658170) (not e!554490))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983593 (= res!658170 (and (= (size!30255 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30256 _keys!1544) (size!30255 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983594 () Bool)

(declare-fun res!658171 () Bool)

(assert (=> b!983594 (=> (not res!658171) (not e!554490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61839 (_ BitVec 32)) Bool)

(assert (=> b!983594 (= res!658171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983595 () Bool)

(assert (=> b!983595 (= e!554489 (and e!554487 mapRes!36416))))

(declare-fun condMapEmpty!36416 () Bool)

(declare-fun mapDefault!36416 () ValueCell!10981)

