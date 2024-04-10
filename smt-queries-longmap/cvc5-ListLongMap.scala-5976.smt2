; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77682 () Bool)

(assert start!77682)

(declare-fun b_free!16267 () Bool)

(declare-fun b_next!16267 () Bool)

(assert (=> start!77682 (= b_free!16267 (not b_next!16267))))

(declare-fun tp!57062 () Bool)

(declare-fun b_and!26687 () Bool)

(assert (=> start!77682 (= tp!57062 b_and!26687)))

(declare-fun b!905984 () Bool)

(declare-fun e!507702 () Bool)

(declare-fun e!507701 () Bool)

(assert (=> b!905984 (= e!507702 (not e!507701))))

(declare-fun res!611392 () Bool)

(assert (=> b!905984 (=> res!611392 e!507701)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53412 0))(
  ( (array!53413 (arr!25665 (Array (_ BitVec 32) (_ BitVec 64))) (size!26124 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53412)

(assert (=> b!905984 (= res!611392 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26124 _keys!1386))))))

(declare-datatypes ((V!29879 0))(
  ( (V!29880 (val!9393 Int)) )
))
(declare-datatypes ((ValueCell!8861 0))(
  ( (ValueCellFull!8861 (v!11898 V!29879)) (EmptyCell!8861) )
))
(declare-datatypes ((array!53414 0))(
  ( (array!53415 (arr!25666 (Array (_ BitVec 32) ValueCell!8861)) (size!26125 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53414)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!408753 () V!29879)

(declare-fun get!13489 (ValueCell!8861 V!29879) V!29879)

(declare-fun dynLambda!1339 (Int (_ BitVec 64)) V!29879)

(assert (=> b!905984 (= lt!408753 (get!13489 (select (arr!25666 _values!1152) i!717) (dynLambda!1339 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905984 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29879)

(declare-datatypes ((Unit!30744 0))(
  ( (Unit!30745) )
))
(declare-fun lt!408752 () Unit!30744)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29879)

(declare-fun lemmaKeyInListMapIsInArray!211 (array!53412 array!53414 (_ BitVec 32) (_ BitVec 32) V!29879 V!29879 (_ BitVec 64) Int) Unit!30744)

(assert (=> b!905984 (= lt!408752 (lemmaKeyInListMapIsInArray!211 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!905985 () Bool)

(declare-fun e!507703 () Bool)

(assert (=> b!905985 (= e!507703 e!507702)))

(declare-fun res!611396 () Bool)

(assert (=> b!905985 (=> (not res!611396) (not e!507702))))

(declare-datatypes ((tuple2!12222 0))(
  ( (tuple2!12223 (_1!6122 (_ BitVec 64)) (_2!6122 V!29879)) )
))
(declare-datatypes ((List!18031 0))(
  ( (Nil!18028) (Cons!18027 (h!19173 tuple2!12222) (t!25470 List!18031)) )
))
(declare-datatypes ((ListLongMap!10919 0))(
  ( (ListLongMap!10920 (toList!5475 List!18031)) )
))
(declare-fun lt!408756 () ListLongMap!10919)

(declare-fun contains!4520 (ListLongMap!10919 (_ BitVec 64)) Bool)

(assert (=> b!905985 (= res!611396 (contains!4520 lt!408756 k!1033))))

(declare-fun getCurrentListMap!2741 (array!53412 array!53414 (_ BitVec 32) (_ BitVec 32) V!29879 V!29879 (_ BitVec 32) Int) ListLongMap!10919)

(assert (=> b!905985 (= lt!408756 (getCurrentListMap!2741 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905986 () Bool)

(declare-fun res!611395 () Bool)

(assert (=> b!905986 (=> (not res!611395) (not e!507702))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905986 (= res!611395 (inRange!0 i!717 mask!1756))))

(declare-fun b!905987 () Bool)

(declare-fun e!507704 () Bool)

(declare-fun tp_is_empty!18685 () Bool)

(assert (=> b!905987 (= e!507704 tp_is_empty!18685)))

(declare-fun b!905988 () Bool)

(declare-fun e!507700 () Bool)

(assert (=> b!905988 (= e!507700 true)))

(declare-fun apply!463 (ListLongMap!10919 (_ BitVec 64)) V!29879)

(assert (=> b!905988 (= (apply!463 lt!408756 k!1033) lt!408753)))

(declare-fun lt!408754 () Unit!30744)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!18 (array!53412 array!53414 (_ BitVec 32) (_ BitVec 32) V!29879 V!29879 (_ BitVec 64) V!29879 (_ BitVec 32) Int) Unit!30744)

(assert (=> b!905988 (= lt!408754 (lemmaListMapApplyFromThenApplyFromZero!18 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408753 i!717 defaultEntry!1160))))

(declare-fun res!611394 () Bool)

(assert (=> start!77682 (=> (not res!611394) (not e!507703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77682 (= res!611394 (validMask!0 mask!1756))))

(assert (=> start!77682 e!507703))

(declare-fun e!507705 () Bool)

(declare-fun array_inv!20104 (array!53414) Bool)

(assert (=> start!77682 (and (array_inv!20104 _values!1152) e!507705)))

(assert (=> start!77682 tp!57062))

(assert (=> start!77682 true))

(assert (=> start!77682 tp_is_empty!18685))

(declare-fun array_inv!20105 (array!53412) Bool)

(assert (=> start!77682 (array_inv!20105 _keys!1386)))

(declare-fun b!905989 () Bool)

(declare-fun res!611393 () Bool)

(assert (=> b!905989 (=> (not res!611393) (not e!507703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53412 (_ BitVec 32)) Bool)

(assert (=> b!905989 (= res!611393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905990 () Bool)

(assert (=> b!905990 (= e!507701 e!507700)))

(declare-fun res!611391 () Bool)

(assert (=> b!905990 (=> res!611391 e!507700)))

(declare-fun lt!408755 () ListLongMap!10919)

(assert (=> b!905990 (= res!611391 (not (contains!4520 lt!408755 k!1033)))))

(assert (=> b!905990 (= lt!408755 (getCurrentListMap!2741 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905991 () Bool)

(declare-fun res!611390 () Bool)

(assert (=> b!905991 (=> res!611390 e!507700)))

(assert (=> b!905991 (= res!611390 (not (= (apply!463 lt!408755 k!1033) lt!408753)))))

(declare-fun b!905992 () Bool)

(declare-fun e!507698 () Bool)

(assert (=> b!905992 (= e!507698 tp_is_empty!18685)))

(declare-fun mapIsEmpty!29740 () Bool)

(declare-fun mapRes!29740 () Bool)

(assert (=> mapIsEmpty!29740 mapRes!29740))

(declare-fun b!905993 () Bool)

(declare-fun res!611399 () Bool)

(assert (=> b!905993 (=> (not res!611399) (not e!507702))))

(assert (=> b!905993 (= res!611399 (and (= (select (arr!25665 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905994 () Bool)

(assert (=> b!905994 (= e!507705 (and e!507698 mapRes!29740))))

(declare-fun condMapEmpty!29740 () Bool)

(declare-fun mapDefault!29740 () ValueCell!8861)

