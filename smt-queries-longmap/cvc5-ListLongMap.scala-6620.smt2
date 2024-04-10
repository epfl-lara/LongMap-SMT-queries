; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83692 () Bool)

(assert start!83692)

(declare-fun res!654131 () Bool)

(declare-fun e!550940 () Bool)

(assert (=> start!83692 (=> (not res!654131) (not e!550940))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83692 (= res!654131 (validMask!0 mask!1948))))

(assert (=> start!83692 e!550940))

(assert (=> start!83692 true))

(declare-datatypes ((V!34977 0))(
  ( (V!34978 (val!11298 Int)) )
))
(declare-datatypes ((ValueCell!10766 0))(
  ( (ValueCellFull!10766 (v!13860 V!34977)) (EmptyCell!10766) )
))
(declare-datatypes ((array!61025 0))(
  ( (array!61026 (arr!29370 (Array (_ BitVec 32) ValueCell!10766)) (size!29849 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61025)

(declare-fun e!550937 () Bool)

(declare-fun array_inv!22705 (array!61025) Bool)

(assert (=> start!83692 (and (array_inv!22705 _values!1278) e!550937)))

(declare-datatypes ((array!61027 0))(
  ( (array!61028 (arr!29371 (Array (_ BitVec 32) (_ BitVec 64))) (size!29850 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61027)

(declare-fun array_inv!22706 (array!61027) Bool)

(assert (=> start!83692 (array_inv!22706 _keys!1544)))

(declare-fun b!977338 () Bool)

(declare-fun e!550938 () Bool)

(declare-fun mapRes!35771 () Bool)

(assert (=> b!977338 (= e!550937 (and e!550938 mapRes!35771))))

(declare-fun condMapEmpty!35771 () Bool)

(declare-fun mapDefault!35771 () ValueCell!10766)

