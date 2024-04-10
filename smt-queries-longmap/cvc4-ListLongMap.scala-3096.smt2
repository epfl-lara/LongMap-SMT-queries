; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43520 () Bool)

(assert start!43520)

(declare-fun b_free!12299 () Bool)

(declare-fun b_next!12299 () Bool)

(assert (=> start!43520 (= b_free!12299 (not b_next!12299))))

(declare-fun tp!43179 () Bool)

(declare-fun b_and!21059 () Bool)

(assert (=> start!43520 (= tp!43179 b_and!21059)))

(declare-fun b!482195 () Bool)

(declare-fun res!287449 () Bool)

(declare-fun e!283745 () Bool)

(assert (=> b!482195 (=> (not res!287449) (not e!283745))))

(declare-datatypes ((array!31281 0))(
  ( (array!31282 (arr!15043 (Array (_ BitVec 32) (_ BitVec 64))) (size!15401 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31281)

(declare-datatypes ((List!9205 0))(
  ( (Nil!9202) (Cons!9201 (h!10057 (_ BitVec 64)) (t!15419 List!9205)) )
))
(declare-fun arrayNoDuplicates!0 (array!31281 (_ BitVec 32) List!9205) Bool)

(assert (=> b!482195 (= res!287449 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9202))))

(declare-fun b!482196 () Bool)

(declare-fun e!283749 () Bool)

(declare-fun tp_is_empty!13811 () Bool)

(assert (=> b!482196 (= e!283749 tp_is_empty!13811)))

(declare-fun res!287446 () Bool)

(assert (=> start!43520 (=> (not res!287446) (not e!283745))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43520 (= res!287446 (validMask!0 mask!2352))))

(assert (=> start!43520 e!283745))

(assert (=> start!43520 true))

(assert (=> start!43520 tp_is_empty!13811))

(declare-datatypes ((V!19485 0))(
  ( (V!19486 (val!6953 Int)) )
))
(declare-datatypes ((ValueCell!6544 0))(
  ( (ValueCellFull!6544 (v!9246 V!19485)) (EmptyCell!6544) )
))
(declare-datatypes ((array!31283 0))(
  ( (array!31284 (arr!15044 (Array (_ BitVec 32) ValueCell!6544)) (size!15402 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31283)

(declare-fun e!283748 () Bool)

(declare-fun array_inv!10852 (array!31283) Bool)

(assert (=> start!43520 (and (array_inv!10852 _values!1516) e!283748)))

(assert (=> start!43520 tp!43179))

(declare-fun array_inv!10853 (array!31281) Bool)

(assert (=> start!43520 (array_inv!10853 _keys!1874)))

(declare-fun b!482197 () Bool)

(assert (=> b!482197 (= e!283745 false)))

(declare-fun minValue!1458 () V!19485)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19485)

(declare-fun lt!218686 () Bool)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9126 0))(
  ( (tuple2!9127 (_1!4574 (_ BitVec 64)) (_2!4574 V!19485)) )
))
(declare-datatypes ((List!9206 0))(
  ( (Nil!9203) (Cons!9202 (h!10058 tuple2!9126) (t!15420 List!9206)) )
))
(declare-datatypes ((ListLongMap!8039 0))(
  ( (ListLongMap!8040 (toList!4035 List!9206)) )
))
(declare-fun contains!2649 (ListLongMap!8039 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2354 (array!31281 array!31283 (_ BitVec 32) (_ BitVec 32) V!19485 V!19485 (_ BitVec 32) Int) ListLongMap!8039)

(assert (=> b!482197 (= lt!218686 (contains!2649 (getCurrentListMap!2354 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!482198 () Bool)

(declare-fun mapRes!22426 () Bool)

(assert (=> b!482198 (= e!283748 (and e!283749 mapRes!22426))))

(declare-fun condMapEmpty!22426 () Bool)

(declare-fun mapDefault!22426 () ValueCell!6544)

