; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43490 () Bool)

(assert start!43490)

(declare-fun b_free!12269 () Bool)

(declare-fun b_next!12269 () Bool)

(assert (=> start!43490 (= b_free!12269 (not b_next!12269))))

(declare-fun tp!43090 () Bool)

(declare-fun b_and!21029 () Bool)

(assert (=> start!43490 (= tp!43090 b_and!21029)))

(declare-fun mapIsEmpty!22381 () Bool)

(declare-fun mapRes!22381 () Bool)

(assert (=> mapIsEmpty!22381 mapRes!22381))

(declare-fun mapNonEmpty!22381 () Bool)

(declare-fun tp!43089 () Bool)

(declare-fun e!283521 () Bool)

(assert (=> mapNonEmpty!22381 (= mapRes!22381 (and tp!43089 e!283521))))

(declare-datatypes ((V!19445 0))(
  ( (V!19446 (val!6938 Int)) )
))
(declare-datatypes ((ValueCell!6529 0))(
  ( (ValueCellFull!6529 (v!9231 V!19445)) (EmptyCell!6529) )
))
(declare-fun mapRest!22381 () (Array (_ BitVec 32) ValueCell!6529))

(declare-datatypes ((array!31223 0))(
  ( (array!31224 (arr!15014 (Array (_ BitVec 32) ValueCell!6529)) (size!15372 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31223)

(declare-fun mapKey!22381 () (_ BitVec 32))

(declare-fun mapValue!22381 () ValueCell!6529)

(assert (=> mapNonEmpty!22381 (= (arr!15014 _values!1516) (store mapRest!22381 mapKey!22381 mapValue!22381))))

(declare-fun res!287269 () Bool)

(declare-fun e!283523 () Bool)

(assert (=> start!43490 (=> (not res!287269) (not e!283523))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43490 (= res!287269 (validMask!0 mask!2352))))

(assert (=> start!43490 e!283523))

(assert (=> start!43490 true))

(declare-fun tp_is_empty!13781 () Bool)

(assert (=> start!43490 tp_is_empty!13781))

(declare-fun e!283524 () Bool)

(declare-fun array_inv!10828 (array!31223) Bool)

(assert (=> start!43490 (and (array_inv!10828 _values!1516) e!283524)))

(assert (=> start!43490 tp!43090))

(declare-datatypes ((array!31225 0))(
  ( (array!31226 (arr!15015 (Array (_ BitVec 32) (_ BitVec 64))) (size!15373 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31225)

(declare-fun array_inv!10829 (array!31225) Bool)

(assert (=> start!43490 (array_inv!10829 _keys!1874)))

(declare-fun b!481880 () Bool)

(assert (=> b!481880 (= e!283521 tp_is_empty!13781)))

(declare-fun b!481881 () Bool)

(declare-fun res!287266 () Bool)

(assert (=> b!481881 (=> (not res!287266) (not e!283523))))

(declare-datatypes ((List!9182 0))(
  ( (Nil!9179) (Cons!9178 (h!10034 (_ BitVec 64)) (t!15396 List!9182)) )
))
(declare-fun arrayNoDuplicates!0 (array!31225 (_ BitVec 32) List!9182) Bool)

(assert (=> b!481881 (= res!287266 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9179))))

(declare-fun b!481882 () Bool)

(declare-fun res!287267 () Bool)

(assert (=> b!481882 (=> (not res!287267) (not e!283523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31225 (_ BitVec 32)) Bool)

(assert (=> b!481882 (= res!287267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481883 () Bool)

(declare-fun e!283522 () Bool)

(assert (=> b!481883 (= e!283522 tp_is_empty!13781)))

(declare-fun b!481884 () Bool)

(assert (=> b!481884 (= e!283523 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun lt!218641 () Bool)

(declare-fun minValue!1458 () V!19445)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19445)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9102 0))(
  ( (tuple2!9103 (_1!4562 (_ BitVec 64)) (_2!4562 V!19445)) )
))
(declare-datatypes ((List!9183 0))(
  ( (Nil!9180) (Cons!9179 (h!10035 tuple2!9102) (t!15397 List!9183)) )
))
(declare-datatypes ((ListLongMap!8015 0))(
  ( (ListLongMap!8016 (toList!4023 List!9183)) )
))
(declare-fun contains!2637 (ListLongMap!8015 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2342 (array!31225 array!31223 (_ BitVec 32) (_ BitVec 32) V!19445 V!19445 (_ BitVec 32) Int) ListLongMap!8015)

(assert (=> b!481884 (= lt!218641 (contains!2637 (getCurrentListMap!2342 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!481885 () Bool)

(declare-fun res!287268 () Bool)

(assert (=> b!481885 (=> (not res!287268) (not e!283523))))

(assert (=> b!481885 (= res!287268 (and (= (size!15372 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15373 _keys!1874) (size!15372 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481886 () Bool)

(assert (=> b!481886 (= e!283524 (and e!283522 mapRes!22381))))

(declare-fun condMapEmpty!22381 () Bool)

(declare-fun mapDefault!22381 () ValueCell!6529)

