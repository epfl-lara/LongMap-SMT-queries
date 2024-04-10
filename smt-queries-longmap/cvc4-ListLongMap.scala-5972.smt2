; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77662 () Bool)

(assert start!77662)

(declare-fun b_free!16247 () Bool)

(declare-fun b_next!16247 () Bool)

(assert (=> start!77662 (= b_free!16247 (not b_next!16247))))

(declare-fun tp!57003 () Bool)

(declare-fun b_and!26647 () Bool)

(assert (=> start!77662 (= tp!57003 b_and!26647)))

(declare-fun b!905574 () Bool)

(declare-fun e!507464 () Bool)

(declare-fun e!507460 () Bool)

(assert (=> b!905574 (= e!507464 e!507460)))

(declare-fun res!611091 () Bool)

(assert (=> b!905574 (=> (not res!611091) (not e!507460))))

(declare-datatypes ((V!29851 0))(
  ( (V!29852 (val!9383 Int)) )
))
(declare-datatypes ((tuple2!12206 0))(
  ( (tuple2!12207 (_1!6114 (_ BitVec 64)) (_2!6114 V!29851)) )
))
(declare-datatypes ((List!18016 0))(
  ( (Nil!18013) (Cons!18012 (h!19158 tuple2!12206) (t!25435 List!18016)) )
))
(declare-datatypes ((ListLongMap!10903 0))(
  ( (ListLongMap!10904 (toList!5467 List!18016)) )
))
(declare-fun lt!408604 () ListLongMap!10903)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4512 (ListLongMap!10903 (_ BitVec 64)) Bool)

(assert (=> b!905574 (= res!611091 (contains!4512 lt!408604 k!1033))))

(declare-datatypes ((ValueCell!8851 0))(
  ( (ValueCellFull!8851 (v!11888 V!29851)) (EmptyCell!8851) )
))
(declare-datatypes ((array!53372 0))(
  ( (array!53373 (arr!25645 (Array (_ BitVec 32) ValueCell!8851)) (size!26104 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53372)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29851)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29851)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((array!53374 0))(
  ( (array!53375 (arr!25646 (Array (_ BitVec 32) (_ BitVec 64))) (size!26105 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53374)

(declare-fun getCurrentListMap!2733 (array!53374 array!53372 (_ BitVec 32) (_ BitVec 32) V!29851 V!29851 (_ BitVec 32) Int) ListLongMap!10903)

(assert (=> b!905574 (= lt!408604 (getCurrentListMap!2733 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905575 () Bool)

(declare-fun res!611097 () Bool)

(assert (=> b!905575 (=> (not res!611097) (not e!507464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53374 (_ BitVec 32)) Bool)

(assert (=> b!905575 (= res!611097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905576 () Bool)

(declare-fun e!507463 () Bool)

(declare-fun tp_is_empty!18665 () Bool)

(assert (=> b!905576 (= e!507463 tp_is_empty!18665)))

(declare-fun mapNonEmpty!29710 () Bool)

(declare-fun mapRes!29710 () Bool)

(declare-fun tp!57002 () Bool)

(declare-fun e!507458 () Bool)

(assert (=> mapNonEmpty!29710 (= mapRes!29710 (and tp!57002 e!507458))))

(declare-fun mapValue!29710 () ValueCell!8851)

(declare-fun mapRest!29710 () (Array (_ BitVec 32) ValueCell!8851))

(declare-fun mapKey!29710 () (_ BitVec 32))

(assert (=> mapNonEmpty!29710 (= (arr!25645 _values!1152) (store mapRest!29710 mapKey!29710 mapValue!29710))))

(declare-fun mapIsEmpty!29710 () Bool)

(assert (=> mapIsEmpty!29710 mapRes!29710))

(declare-fun res!611098 () Bool)

(assert (=> start!77662 (=> (not res!611098) (not e!507464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77662 (= res!611098 (validMask!0 mask!1756))))

(assert (=> start!77662 e!507464))

(declare-fun e!507459 () Bool)

(declare-fun array_inv!20092 (array!53372) Bool)

(assert (=> start!77662 (and (array_inv!20092 _values!1152) e!507459)))

(assert (=> start!77662 tp!57003))

(assert (=> start!77662 true))

(assert (=> start!77662 tp_is_empty!18665))

(declare-fun array_inv!20093 (array!53374) Bool)

(assert (=> start!77662 (array_inv!20093 _keys!1386)))

(declare-fun b!905577 () Bool)

(declare-fun e!507462 () Bool)

(assert (=> b!905577 (= e!507460 (not e!507462))))

(declare-fun res!611094 () Bool)

(assert (=> b!905577 (=> res!611094 e!507462)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!905577 (= res!611094 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26105 _keys!1386))))))

(declare-fun lt!408606 () V!29851)

(declare-fun get!13474 (ValueCell!8851 V!29851) V!29851)

(declare-fun dynLambda!1332 (Int (_ BitVec 64)) V!29851)

(assert (=> b!905577 (= lt!408606 (get!13474 (select (arr!25645 _values!1152) i!717) (dynLambda!1332 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905577 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30726 0))(
  ( (Unit!30727) )
))
(declare-fun lt!408602 () Unit!30726)

(declare-fun lemmaKeyInListMapIsInArray!204 (array!53374 array!53372 (_ BitVec 32) (_ BitVec 32) V!29851 V!29851 (_ BitVec 64) Int) Unit!30726)

(assert (=> b!905577 (= lt!408602 (lemmaKeyInListMapIsInArray!204 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!905578 () Bool)

(declare-fun res!611096 () Bool)

(assert (=> b!905578 (=> (not res!611096) (not e!507460))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905578 (= res!611096 (inRange!0 i!717 mask!1756))))

(declare-fun b!905579 () Bool)

(declare-fun e!507461 () Bool)

(assert (=> b!905579 (= e!507462 e!507461)))

(declare-fun res!611092 () Bool)

(assert (=> b!905579 (=> res!611092 e!507461)))

(declare-fun lt!408603 () ListLongMap!10903)

(assert (=> b!905579 (= res!611092 (not (contains!4512 lt!408603 k!1033)))))

(assert (=> b!905579 (= lt!408603 (getCurrentListMap!2733 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905580 () Bool)

(declare-fun res!611099 () Bool)

(assert (=> b!905580 (=> (not res!611099) (not e!507464))))

(declare-datatypes ((List!18017 0))(
  ( (Nil!18014) (Cons!18013 (h!19159 (_ BitVec 64)) (t!25436 List!18017)) )
))
(declare-fun arrayNoDuplicates!0 (array!53374 (_ BitVec 32) List!18017) Bool)

(assert (=> b!905580 (= res!611099 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18014))))

(declare-fun b!905581 () Bool)

(assert (=> b!905581 (= e!507461 true)))

(declare-fun apply!456 (ListLongMap!10903 (_ BitVec 64)) V!29851)

(assert (=> b!905581 (= (apply!456 lt!408604 k!1033) lt!408606)))

(declare-fun lt!408605 () Unit!30726)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!11 (array!53374 array!53372 (_ BitVec 32) (_ BitVec 32) V!29851 V!29851 (_ BitVec 64) V!29851 (_ BitVec 32) Int) Unit!30726)

(assert (=> b!905581 (= lt!408605 (lemmaListMapApplyFromThenApplyFromZero!11 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408606 i!717 defaultEntry!1160))))

(declare-fun b!905582 () Bool)

(assert (=> b!905582 (= e!507458 tp_is_empty!18665)))

(declare-fun b!905583 () Bool)

(declare-fun res!611095 () Bool)

(assert (=> b!905583 (=> (not res!611095) (not e!507460))))

(assert (=> b!905583 (= res!611095 (and (= (select (arr!25646 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905584 () Bool)

(declare-fun res!611093 () Bool)

(assert (=> b!905584 (=> res!611093 e!507461)))

(assert (=> b!905584 (= res!611093 (not (= (apply!456 lt!408603 k!1033) lt!408606)))))

(declare-fun b!905585 () Bool)

(assert (=> b!905585 (= e!507459 (and e!507463 mapRes!29710))))

(declare-fun condMapEmpty!29710 () Bool)

(declare-fun mapDefault!29710 () ValueCell!8851)

