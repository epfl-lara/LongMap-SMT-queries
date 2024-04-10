; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83900 () Bool)

(assert start!83900)

(declare-fun b_free!19709 () Bool)

(declare-fun b_next!19709 () Bool)

(assert (=> start!83900 (= b_free!19709 (not b_next!19709))))

(declare-fun tp!68568 () Bool)

(declare-fun b_and!31507 () Bool)

(assert (=> start!83900 (= tp!68568 b_and!31507)))

(declare-fun b!980451 () Bool)

(declare-fun e!552633 () Bool)

(declare-fun tp_is_empty!22703 () Bool)

(assert (=> b!980451 (= e!552633 tp_is_empty!22703)))

(declare-fun res!656159 () Bool)

(declare-fun e!552636 () Bool)

(assert (=> start!83900 (=> (not res!656159) (not e!552636))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83900 (= res!656159 (validMask!0 mask!1948))))

(assert (=> start!83900 e!552636))

(assert (=> start!83900 true))

(assert (=> start!83900 tp_is_empty!22703))

(declare-datatypes ((V!35253 0))(
  ( (V!35254 (val!11402 Int)) )
))
(declare-datatypes ((ValueCell!10870 0))(
  ( (ValueCellFull!10870 (v!13964 V!35253)) (EmptyCell!10870) )
))
(declare-datatypes ((array!61413 0))(
  ( (array!61414 (arr!29564 (Array (_ BitVec 32) ValueCell!10870)) (size!30043 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61413)

(declare-fun e!552635 () Bool)

(declare-fun array_inv!22855 (array!61413) Bool)

(assert (=> start!83900 (and (array_inv!22855 _values!1278) e!552635)))

(assert (=> start!83900 tp!68568))

(declare-datatypes ((array!61415 0))(
  ( (array!61416 (arr!29565 (Array (_ BitVec 32) (_ BitVec 64))) (size!30044 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61415)

(declare-fun array_inv!22856 (array!61415) Bool)

(assert (=> start!83900 (array_inv!22856 _keys!1544)))

(declare-fun b!980452 () Bool)

(declare-fun res!656162 () Bool)

(assert (=> b!980452 (=> (not res!656162) (not e!552636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61415 (_ BitVec 32)) Bool)

(assert (=> b!980452 (= res!656162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980453 () Bool)

(declare-fun mapRes!36083 () Bool)

(assert (=> b!980453 (= e!552635 (and e!552633 mapRes!36083))))

(declare-fun condMapEmpty!36083 () Bool)

(declare-fun mapDefault!36083 () ValueCell!10870)

