; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77752 () Bool)

(assert start!77752)

(declare-fun b_free!16337 () Bool)

(declare-fun b_next!16337 () Bool)

(assert (=> start!77752 (= b_free!16337 (not b_next!16337))))

(declare-fun tp!57272 () Bool)

(declare-fun b_and!26827 () Bool)

(assert (=> start!77752 (= tp!57272 b_and!26827)))

(declare-fun b!907419 () Bool)

(declare-fun res!612446 () Bool)

(declare-fun e!508541 () Bool)

(assert (=> b!907419 (=> (not res!612446) (not e!508541))))

(declare-datatypes ((array!53544 0))(
  ( (array!53545 (arr!25731 (Array (_ BitVec 32) (_ BitVec 64))) (size!26190 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53544)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53544 (_ BitVec 32)) Bool)

(assert (=> b!907419 (= res!612446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907420 () Bool)

(declare-fun res!612445 () Bool)

(declare-fun e!508539 () Bool)

(assert (=> b!907420 (=> res!612445 e!508539)))

(declare-datatypes ((V!29971 0))(
  ( (V!29972 (val!9428 Int)) )
))
(declare-datatypes ((tuple2!12278 0))(
  ( (tuple2!12279 (_1!6150 (_ BitVec 64)) (_2!6150 V!29971)) )
))
(declare-datatypes ((List!18078 0))(
  ( (Nil!18075) (Cons!18074 (h!19220 tuple2!12278) (t!25587 List!18078)) )
))
(declare-datatypes ((ListLongMap!10975 0))(
  ( (ListLongMap!10976 (toList!5503 List!18078)) )
))
(declare-fun lt!409279 () ListLongMap!10975)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!409280 () V!29971)

(declare-fun apply!487 (ListLongMap!10975 (_ BitVec 64)) V!29971)

(assert (=> b!907420 (= res!612445 (not (= (apply!487 lt!409279 k!1033) lt!409280)))))

(declare-fun b!907421 () Bool)

(declare-fun e!508542 () Bool)

(declare-fun tp_is_empty!18755 () Bool)

(assert (=> b!907421 (= e!508542 tp_is_empty!18755)))

(declare-fun b!907422 () Bool)

(declare-fun res!612447 () Bool)

(assert (=> b!907422 (=> (not res!612447) (not e!508541))))

(declare-datatypes ((ValueCell!8896 0))(
  ( (ValueCellFull!8896 (v!11933 V!29971)) (EmptyCell!8896) )
))
(declare-datatypes ((array!53546 0))(
  ( (array!53547 (arr!25732 (Array (_ BitVec 32) ValueCell!8896)) (size!26191 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53546)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!907422 (= res!612447 (and (= (size!26191 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26190 _keys!1386) (size!26191 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907423 () Bool)

(declare-fun e!508545 () Bool)

(assert (=> b!907423 (= e!508545 tp_is_empty!18755)))

(declare-fun b!907424 () Bool)

(assert (=> b!907424 (= e!508539 true)))

(declare-fun lt!409281 () ListLongMap!10975)

(assert (=> b!907424 (= (apply!487 lt!409281 k!1033) lt!409280)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29971)

(declare-fun minValue!1094 () V!29971)

(declare-datatypes ((Unit!30796 0))(
  ( (Unit!30797) )
))
(declare-fun lt!409278 () Unit!30796)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!40 (array!53544 array!53546 (_ BitVec 32) (_ BitVec 32) V!29971 V!29971 (_ BitVec 64) V!29971 (_ BitVec 32) Int) Unit!30796)

(assert (=> b!907424 (= lt!409278 (lemmaListMapApplyFromThenApplyFromZero!40 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409280 i!717 defaultEntry!1160))))

(declare-fun res!612441 () Bool)

(assert (=> start!77752 (=> (not res!612441) (not e!508541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77752 (= res!612441 (validMask!0 mask!1756))))

(assert (=> start!77752 e!508541))

(declare-fun e!508543 () Bool)

(declare-fun array_inv!20150 (array!53546) Bool)

(assert (=> start!77752 (and (array_inv!20150 _values!1152) e!508543)))

(assert (=> start!77752 tp!57272))

(assert (=> start!77752 true))

(assert (=> start!77752 tp_is_empty!18755))

(declare-fun array_inv!20151 (array!53544) Bool)

(assert (=> start!77752 (array_inv!20151 _keys!1386)))

(declare-fun b!907425 () Bool)

(declare-fun res!612448 () Bool)

(assert (=> b!907425 (=> (not res!612448) (not e!508541))))

(declare-datatypes ((List!18079 0))(
  ( (Nil!18076) (Cons!18075 (h!19221 (_ BitVec 64)) (t!25588 List!18079)) )
))
(declare-fun arrayNoDuplicates!0 (array!53544 (_ BitVec 32) List!18079) Bool)

(assert (=> b!907425 (= res!612448 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18076))))

(declare-fun b!907426 () Bool)

(declare-fun res!612444 () Bool)

(declare-fun e!508540 () Bool)

(assert (=> b!907426 (=> (not res!612444) (not e!508540))))

(assert (=> b!907426 (= res!612444 (and (= (select (arr!25731 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907427 () Bool)

(declare-fun res!612442 () Bool)

(assert (=> b!907427 (=> (not res!612442) (not e!508540))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907427 (= res!612442 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29845 () Bool)

(declare-fun mapRes!29845 () Bool)

(declare-fun tp!57273 () Bool)

(assert (=> mapNonEmpty!29845 (= mapRes!29845 (and tp!57273 e!508542))))

(declare-fun mapRest!29845 () (Array (_ BitVec 32) ValueCell!8896))

(declare-fun mapValue!29845 () ValueCell!8896)

(declare-fun mapKey!29845 () (_ BitVec 32))

(assert (=> mapNonEmpty!29845 (= (arr!25732 _values!1152) (store mapRest!29845 mapKey!29845 mapValue!29845))))

(declare-fun b!907428 () Bool)

(assert (=> b!907428 (= e!508541 e!508540)))

(declare-fun res!612449 () Bool)

(assert (=> b!907428 (=> (not res!612449) (not e!508540))))

(declare-fun contains!4547 (ListLongMap!10975 (_ BitVec 64)) Bool)

(assert (=> b!907428 (= res!612449 (contains!4547 lt!409281 k!1033))))

(declare-fun getCurrentListMap!2768 (array!53544 array!53546 (_ BitVec 32) (_ BitVec 32) V!29971 V!29971 (_ BitVec 32) Int) ListLongMap!10975)

(assert (=> b!907428 (= lt!409281 (getCurrentListMap!2768 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907429 () Bool)

(assert (=> b!907429 (= e!508543 (and e!508545 mapRes!29845))))

(declare-fun condMapEmpty!29845 () Bool)

(declare-fun mapDefault!29845 () ValueCell!8896)

