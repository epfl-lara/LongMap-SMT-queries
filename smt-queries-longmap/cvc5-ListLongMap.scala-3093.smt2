; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43498 () Bool)

(assert start!43498)

(declare-fun b_free!12277 () Bool)

(declare-fun b_next!12277 () Bool)

(assert (=> start!43498 (= b_free!12277 (not b_next!12277))))

(declare-fun tp!43114 () Bool)

(declare-fun b_and!21037 () Bool)

(assert (=> start!43498 (= tp!43114 b_and!21037)))

(declare-fun b!481964 () Bool)

(declare-fun res!287314 () Bool)

(declare-fun e!283580 () Bool)

(assert (=> b!481964 (=> (not res!287314) (not e!283580))))

(declare-datatypes ((array!31237 0))(
  ( (array!31238 (arr!15021 (Array (_ BitVec 32) (_ BitVec 64))) (size!15379 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31237)

(declare-datatypes ((List!9186 0))(
  ( (Nil!9183) (Cons!9182 (h!10038 (_ BitVec 64)) (t!15400 List!9186)) )
))
(declare-fun arrayNoDuplicates!0 (array!31237 (_ BitVec 32) List!9186) Bool)

(assert (=> b!481964 (= res!287314 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9183))))

(declare-fun b!481965 () Bool)

(declare-fun e!283581 () Bool)

(declare-fun tp_is_empty!13789 () Bool)

(assert (=> b!481965 (= e!283581 tp_is_empty!13789)))

(declare-fun b!481966 () Bool)

(assert (=> b!481966 (= e!283580 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19457 0))(
  ( (V!19458 (val!6942 Int)) )
))
(declare-fun minValue!1458 () V!19457)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19457)

(declare-datatypes ((ValueCell!6533 0))(
  ( (ValueCellFull!6533 (v!9235 V!19457)) (EmptyCell!6533) )
))
(declare-datatypes ((array!31239 0))(
  ( (array!31240 (arr!15022 (Array (_ BitVec 32) ValueCell!6533)) (size!15380 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31239)

(declare-fun lt!218653 () Bool)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9106 0))(
  ( (tuple2!9107 (_1!4564 (_ BitVec 64)) (_2!4564 V!19457)) )
))
(declare-datatypes ((List!9187 0))(
  ( (Nil!9184) (Cons!9183 (h!10039 tuple2!9106) (t!15401 List!9187)) )
))
(declare-datatypes ((ListLongMap!8019 0))(
  ( (ListLongMap!8020 (toList!4025 List!9187)) )
))
(declare-fun contains!2639 (ListLongMap!8019 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2344 (array!31237 array!31239 (_ BitVec 32) (_ BitVec 32) V!19457 V!19457 (_ BitVec 32) Int) ListLongMap!8019)

(assert (=> b!481966 (= lt!218653 (contains!2639 (getCurrentListMap!2344 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!481967 () Bool)

(declare-fun res!287315 () Bool)

(assert (=> b!481967 (=> (not res!287315) (not e!283580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31237 (_ BitVec 32)) Bool)

(assert (=> b!481967 (= res!287315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481968 () Bool)

(declare-fun e!283584 () Bool)

(assert (=> b!481968 (= e!283584 tp_is_empty!13789)))

(declare-fun b!481969 () Bool)

(declare-fun res!287316 () Bool)

(assert (=> b!481969 (=> (not res!287316) (not e!283580))))

(assert (=> b!481969 (= res!287316 (and (= (size!15380 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15379 _keys!1874) (size!15380 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!287317 () Bool)

(assert (=> start!43498 (=> (not res!287317) (not e!283580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43498 (= res!287317 (validMask!0 mask!2352))))

(assert (=> start!43498 e!283580))

(assert (=> start!43498 true))

(assert (=> start!43498 tp_is_empty!13789))

(declare-fun e!283582 () Bool)

(declare-fun array_inv!10832 (array!31239) Bool)

(assert (=> start!43498 (and (array_inv!10832 _values!1516) e!283582)))

(assert (=> start!43498 tp!43114))

(declare-fun array_inv!10833 (array!31237) Bool)

(assert (=> start!43498 (array_inv!10833 _keys!1874)))

(declare-fun mapIsEmpty!22393 () Bool)

(declare-fun mapRes!22393 () Bool)

(assert (=> mapIsEmpty!22393 mapRes!22393))

(declare-fun b!481970 () Bool)

(assert (=> b!481970 (= e!283582 (and e!283584 mapRes!22393))))

(declare-fun condMapEmpty!22393 () Bool)

(declare-fun mapDefault!22393 () ValueCell!6533)

