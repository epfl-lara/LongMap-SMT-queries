; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83936 () Bool)

(assert start!83936)

(declare-fun b!980935 () Bool)

(declare-fun res!656460 () Bool)

(declare-fun e!552933 () Bool)

(assert (=> b!980935 (=> (not res!656460) (not e!552933))))

(declare-datatypes ((array!61481 0))(
  ( (array!61482 (arr!29598 (Array (_ BitVec 32) (_ BitVec 64))) (size!30077 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61481)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61481 (_ BitVec 32)) Bool)

(assert (=> b!980935 (= res!656460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36137 () Bool)

(declare-fun mapRes!36137 () Bool)

(declare-fun tp!68650 () Bool)

(declare-fun e!552931 () Bool)

(assert (=> mapNonEmpty!36137 (= mapRes!36137 (and tp!68650 e!552931))))

(declare-datatypes ((V!35301 0))(
  ( (V!35302 (val!11420 Int)) )
))
(declare-datatypes ((ValueCell!10888 0))(
  ( (ValueCellFull!10888 (v!13982 V!35301)) (EmptyCell!10888) )
))
(declare-datatypes ((array!61483 0))(
  ( (array!61484 (arr!29599 (Array (_ BitVec 32) ValueCell!10888)) (size!30078 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61483)

(declare-fun mapValue!36137 () ValueCell!10888)

(declare-fun mapKey!36137 () (_ BitVec 32))

(declare-fun mapRest!36137 () (Array (_ BitVec 32) ValueCell!10888))

(assert (=> mapNonEmpty!36137 (= (arr!29599 _values!1278) (store mapRest!36137 mapKey!36137 mapValue!36137))))

(declare-fun b!980936 () Bool)

(declare-fun e!552929 () Bool)

(declare-fun tp_is_empty!22739 () Bool)

(assert (=> b!980936 (= e!552929 tp_is_empty!22739)))

(declare-fun b!980937 () Bool)

(assert (=> b!980937 (= e!552931 tp_is_empty!22739)))

(declare-fun b!980938 () Bool)

(declare-fun e!552932 () Bool)

(assert (=> b!980938 (= e!552932 (and e!552929 mapRes!36137))))

(declare-fun condMapEmpty!36137 () Bool)

(declare-fun mapDefault!36137 () ValueCell!10888)

