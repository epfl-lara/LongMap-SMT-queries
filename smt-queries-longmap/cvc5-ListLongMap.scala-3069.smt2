; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43266 () Bool)

(assert start!43266)

(declare-fun b_free!12133 () Bool)

(declare-fun b_next!12133 () Bool)

(assert (=> start!43266 (= b_free!12133 (not b_next!12133))))

(declare-fun tp!42669 () Bool)

(declare-fun b_and!20885 () Bool)

(assert (=> start!43266 (= tp!42669 b_and!20885)))

(declare-fun b!479363 () Bool)

(declare-fun res!285947 () Bool)

(declare-fun e!282011 () Bool)

(assert (=> b!479363 (=> (not res!285947) (not e!282011))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30963 0))(
  ( (array!30964 (arr!14888 (Array (_ BitVec 32) (_ BitVec 64))) (size!15246 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30963)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19265 0))(
  ( (V!19266 (val!6870 Int)) )
))
(declare-datatypes ((ValueCell!6461 0))(
  ( (ValueCellFull!6461 (v!9159 V!19265)) (EmptyCell!6461) )
))
(declare-datatypes ((array!30965 0))(
  ( (array!30966 (arr!14889 (Array (_ BitVec 32) ValueCell!6461)) (size!15247 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30965)

(assert (=> b!479363 (= res!285947 (and (= (size!15247 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15246 _keys!1874) (size!15247 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479364 () Bool)

(declare-fun e!282013 () Bool)

(declare-fun tp_is_empty!13645 () Bool)

(assert (=> b!479364 (= e!282013 tp_is_empty!13645)))

(declare-fun b!479365 () Bool)

(assert (=> b!479365 (= e!282011 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19265)

(declare-fun lt!217852 () Bool)

(declare-fun zeroValue!1458 () V!19265)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9016 0))(
  ( (tuple2!9017 (_1!4519 (_ BitVec 64)) (_2!4519 V!19265)) )
))
(declare-datatypes ((List!9095 0))(
  ( (Nil!9092) (Cons!9091 (h!9947 tuple2!9016) (t!15301 List!9095)) )
))
(declare-datatypes ((ListLongMap!7929 0))(
  ( (ListLongMap!7930 (toList!3980 List!9095)) )
))
(declare-fun contains!2590 (ListLongMap!7929 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2299 (array!30963 array!30965 (_ BitVec 32) (_ BitVec 32) V!19265 V!19265 (_ BitVec 32) Int) ListLongMap!7929)

(assert (=> b!479365 (= lt!217852 (contains!2590 (getCurrentListMap!2299 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!479366 () Bool)

(declare-fun e!282014 () Bool)

(declare-fun mapRes!22165 () Bool)

(assert (=> b!479366 (= e!282014 (and e!282013 mapRes!22165))))

(declare-fun condMapEmpty!22165 () Bool)

(declare-fun mapDefault!22165 () ValueCell!6461)

