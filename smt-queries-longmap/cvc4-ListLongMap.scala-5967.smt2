; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77632 () Bool)

(assert start!77632)

(declare-fun b_free!16217 () Bool)

(declare-fun b_next!16217 () Bool)

(assert (=> start!77632 (= b_free!16217 (not b_next!16217))))

(declare-fun tp!56913 () Bool)

(declare-fun b_and!26587 () Bool)

(assert (=> start!77632 (= tp!56913 b_and!26587)))

(declare-fun b!904959 () Bool)

(declare-fun e!507100 () Bool)

(assert (=> b!904959 (= e!507100 true)))

(declare-datatypes ((V!29811 0))(
  ( (V!29812 (val!9368 Int)) )
))
(declare-datatypes ((tuple2!12178 0))(
  ( (tuple2!12179 (_1!6100 (_ BitVec 64)) (_2!6100 V!29811)) )
))
(declare-datatypes ((List!17991 0))(
  ( (Nil!17988) (Cons!17987 (h!19133 tuple2!12178) (t!25380 List!17991)) )
))
(declare-datatypes ((ListLongMap!10875 0))(
  ( (ListLongMap!10876 (toList!5453 List!17991)) )
))
(declare-fun lt!408377 () ListLongMap!10875)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!408381 () V!29811)

(declare-fun apply!445 (ListLongMap!10875 (_ BitVec 64)) V!29811)

(assert (=> b!904959 (= (apply!445 lt!408377 k!1033) lt!408381)))

(declare-datatypes ((ValueCell!8836 0))(
  ( (ValueCellFull!8836 (v!11873 V!29811)) (EmptyCell!8836) )
))
(declare-datatypes ((array!53314 0))(
  ( (array!53315 (arr!25616 (Array (_ BitVec 32) ValueCell!8836)) (size!26075 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53314)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29811)

(declare-datatypes ((array!53316 0))(
  ( (array!53317 (arr!25617 (Array (_ BitVec 32) (_ BitVec 64))) (size!26076 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53316)

(declare-datatypes ((Unit!30700 0))(
  ( (Unit!30701) )
))
(declare-fun lt!408380 () Unit!30700)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29811)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!3 (array!53316 array!53314 (_ BitVec 32) (_ BitVec 32) V!29811 V!29811 (_ BitVec 64) V!29811 (_ BitVec 32) Int) Unit!30700)

(assert (=> b!904959 (= lt!408380 (lemmaListMapApplyFromThenApplyFromZero!3 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408381 i!717 defaultEntry!1160))))

(declare-fun b!904960 () Bool)

(declare-fun res!610644 () Bool)

(declare-fun e!507102 () Bool)

(assert (=> b!904960 (=> (not res!610644) (not e!507102))))

(declare-datatypes ((List!17992 0))(
  ( (Nil!17989) (Cons!17988 (h!19134 (_ BitVec 64)) (t!25381 List!17992)) )
))
(declare-fun arrayNoDuplicates!0 (array!53316 (_ BitVec 32) List!17992) Bool)

(assert (=> b!904960 (= res!610644 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17989))))

(declare-fun res!610641 () Bool)

(assert (=> start!77632 (=> (not res!610641) (not e!507102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77632 (= res!610641 (validMask!0 mask!1756))))

(assert (=> start!77632 e!507102))

(declare-fun e!507101 () Bool)

(declare-fun array_inv!20070 (array!53314) Bool)

(assert (=> start!77632 (and (array_inv!20070 _values!1152) e!507101)))

(assert (=> start!77632 tp!56913))

(assert (=> start!77632 true))

(declare-fun tp_is_empty!18635 () Bool)

(assert (=> start!77632 tp_is_empty!18635))

(declare-fun array_inv!20071 (array!53316) Bool)

(assert (=> start!77632 (array_inv!20071 _keys!1386)))

(declare-fun b!904961 () Bool)

(declare-fun e!507099 () Bool)

(assert (=> b!904961 (= e!507099 tp_is_empty!18635)))

(declare-fun b!904962 () Bool)

(declare-fun res!610645 () Bool)

(assert (=> b!904962 (=> (not res!610645) (not e!507102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53316 (_ BitVec 32)) Bool)

(assert (=> b!904962 (= res!610645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29665 () Bool)

(declare-fun mapRes!29665 () Bool)

(assert (=> mapIsEmpty!29665 mapRes!29665))

(declare-fun b!904963 () Bool)

(declare-fun e!507104 () Bool)

(declare-fun e!507098 () Bool)

(assert (=> b!904963 (= e!507104 (not e!507098))))

(declare-fun res!610648 () Bool)

(assert (=> b!904963 (=> res!610648 e!507098)))

(assert (=> b!904963 (= res!610648 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26076 _keys!1386))))))

(declare-fun get!13453 (ValueCell!8836 V!29811) V!29811)

(declare-fun dynLambda!1321 (Int (_ BitVec 64)) V!29811)

(assert (=> b!904963 (= lt!408381 (get!13453 (select (arr!25616 _values!1152) i!717) (dynLambda!1321 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904963 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408379 () Unit!30700)

(declare-fun lemmaKeyInListMapIsInArray!193 (array!53316 array!53314 (_ BitVec 32) (_ BitVec 32) V!29811 V!29811 (_ BitVec 64) Int) Unit!30700)

(assert (=> b!904963 (= lt!408379 (lemmaKeyInListMapIsInArray!193 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!904964 () Bool)

(declare-fun e!507105 () Bool)

(assert (=> b!904964 (= e!507105 tp_is_empty!18635)))

(declare-fun mapNonEmpty!29665 () Bool)

(declare-fun tp!56912 () Bool)

(assert (=> mapNonEmpty!29665 (= mapRes!29665 (and tp!56912 e!507099))))

(declare-fun mapKey!29665 () (_ BitVec 32))

(declare-fun mapRest!29665 () (Array (_ BitVec 32) ValueCell!8836))

(declare-fun mapValue!29665 () ValueCell!8836)

(assert (=> mapNonEmpty!29665 (= (arr!25616 _values!1152) (store mapRest!29665 mapKey!29665 mapValue!29665))))

(declare-fun b!904965 () Bool)

(declare-fun res!610642 () Bool)

(assert (=> b!904965 (=> (not res!610642) (not e!507104))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904965 (= res!610642 (inRange!0 i!717 mask!1756))))

(declare-fun b!904966 () Bool)

(declare-fun res!610647 () Bool)

(assert (=> b!904966 (=> res!610647 e!507100)))

(declare-fun lt!408378 () ListLongMap!10875)

(assert (=> b!904966 (= res!610647 (not (= (apply!445 lt!408378 k!1033) lt!408381)))))

(declare-fun b!904967 () Bool)

(declare-fun res!610640 () Bool)

(assert (=> b!904967 (=> (not res!610640) (not e!507104))))

(assert (=> b!904967 (= res!610640 (and (= (select (arr!25617 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904968 () Bool)

(assert (=> b!904968 (= e!507101 (and e!507105 mapRes!29665))))

(declare-fun condMapEmpty!29665 () Bool)

(declare-fun mapDefault!29665 () ValueCell!8836)

