; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77712 () Bool)

(assert start!77712)

(declare-fun b_free!16297 () Bool)

(declare-fun b_next!16297 () Bool)

(assert (=> start!77712 (= b_free!16297 (not b_next!16297))))

(declare-fun tp!57152 () Bool)

(declare-fun b_and!26747 () Bool)

(assert (=> start!77712 (= tp!57152 b_and!26747)))

(declare-fun b!906599 () Bool)

(declare-fun res!611843 () Bool)

(declare-fun e!508065 () Bool)

(assert (=> b!906599 (=> res!611843 e!508065)))

(declare-datatypes ((V!29919 0))(
  ( (V!29920 (val!9408 Int)) )
))
(declare-fun lt!408981 () V!29919)

(declare-datatypes ((tuple2!12248 0))(
  ( (tuple2!12249 (_1!6135 (_ BitVec 64)) (_2!6135 V!29919)) )
))
(declare-datatypes ((List!18053 0))(
  ( (Nil!18050) (Cons!18049 (h!19195 tuple2!12248) (t!25522 List!18053)) )
))
(declare-datatypes ((ListLongMap!10945 0))(
  ( (ListLongMap!10946 (toList!5488 List!18053)) )
))
(declare-fun lt!408978 () ListLongMap!10945)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun apply!474 (ListLongMap!10945 (_ BitVec 64)) V!29919)

(assert (=> b!906599 (= res!611843 (not (= (apply!474 lt!408978 k!1033) lt!408981)))))

(declare-fun res!611841 () Bool)

(declare-fun e!508061 () Bool)

(assert (=> start!77712 (=> (not res!611841) (not e!508061))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77712 (= res!611841 (validMask!0 mask!1756))))

(assert (=> start!77712 e!508061))

(declare-datatypes ((ValueCell!8876 0))(
  ( (ValueCellFull!8876 (v!11913 V!29919)) (EmptyCell!8876) )
))
(declare-datatypes ((array!53472 0))(
  ( (array!53473 (arr!25695 (Array (_ BitVec 32) ValueCell!8876)) (size!26154 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53472)

(declare-fun e!508060 () Bool)

(declare-fun array_inv!20128 (array!53472) Bool)

(assert (=> start!77712 (and (array_inv!20128 _values!1152) e!508060)))

(assert (=> start!77712 tp!57152))

(assert (=> start!77712 true))

(declare-fun tp_is_empty!18715 () Bool)

(assert (=> start!77712 tp_is_empty!18715))

(declare-datatypes ((array!53474 0))(
  ( (array!53475 (arr!25696 (Array (_ BitVec 32) (_ BitVec 64))) (size!26155 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53474)

(declare-fun array_inv!20129 (array!53474) Bool)

(assert (=> start!77712 (array_inv!20129 _keys!1386)))

(declare-fun b!906600 () Bool)

(declare-fun res!611844 () Bool)

(declare-fun e!508062 () Bool)

(assert (=> b!906600 (=> (not res!611844) (not e!508062))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!906600 (= res!611844 (and (= (select (arr!25696 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906601 () Bool)

(declare-fun res!611840 () Bool)

(assert (=> b!906601 (=> (not res!611840) (not e!508061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53474 (_ BitVec 32)) Bool)

(assert (=> b!906601 (= res!611840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906602 () Bool)

(declare-fun res!611849 () Bool)

(assert (=> b!906602 (=> (not res!611849) (not e!508061))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!906602 (= res!611849 (and (= (size!26154 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26155 _keys!1386) (size!26154 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906603 () Bool)

(declare-fun e!508063 () Bool)

(assert (=> b!906603 (= e!508063 e!508065)))

(declare-fun res!611845 () Bool)

(assert (=> b!906603 (=> res!611845 e!508065)))

(declare-fun contains!4533 (ListLongMap!10945 (_ BitVec 64)) Bool)

(assert (=> b!906603 (= res!611845 (not (contains!4533 lt!408978 k!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29919)

(declare-fun minValue!1094 () V!29919)

(declare-fun getCurrentListMap!2754 (array!53474 array!53472 (_ BitVec 32) (_ BitVec 32) V!29919 V!29919 (_ BitVec 32) Int) ListLongMap!10945)

(assert (=> b!906603 (= lt!408978 (getCurrentListMap!2754 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906604 () Bool)

(assert (=> b!906604 (= e!508062 (not e!508063))))

(declare-fun res!611842 () Bool)

(assert (=> b!906604 (=> res!611842 e!508063)))

(assert (=> b!906604 (= res!611842 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26155 _keys!1386))))))

(declare-fun get!13511 (ValueCell!8876 V!29919) V!29919)

(declare-fun dynLambda!1351 (Int (_ BitVec 64)) V!29919)

(assert (=> b!906604 (= lt!408981 (get!13511 (select (arr!25695 _values!1152) i!717) (dynLambda!1351 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906604 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30770 0))(
  ( (Unit!30771) )
))
(declare-fun lt!408980 () Unit!30770)

(declare-fun lemmaKeyInListMapIsInArray!223 (array!53474 array!53472 (_ BitVec 32) (_ BitVec 32) V!29919 V!29919 (_ BitVec 64) Int) Unit!30770)

(assert (=> b!906604 (= lt!408980 (lemmaKeyInListMapIsInArray!223 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29785 () Bool)

(declare-fun mapRes!29785 () Bool)

(declare-fun tp!57153 () Bool)

(declare-fun e!508058 () Bool)

(assert (=> mapNonEmpty!29785 (= mapRes!29785 (and tp!57153 e!508058))))

(declare-fun mapRest!29785 () (Array (_ BitVec 32) ValueCell!8876))

(declare-fun mapKey!29785 () (_ BitVec 32))

(declare-fun mapValue!29785 () ValueCell!8876)

(assert (=> mapNonEmpty!29785 (= (arr!25695 _values!1152) (store mapRest!29785 mapKey!29785 mapValue!29785))))

(declare-fun b!906605 () Bool)

(declare-fun res!611847 () Bool)

(assert (=> b!906605 (=> (not res!611847) (not e!508062))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906605 (= res!611847 (inRange!0 i!717 mask!1756))))

(declare-fun b!906606 () Bool)

(declare-fun res!611848 () Bool)

(assert (=> b!906606 (=> (not res!611848) (not e!508061))))

(declare-datatypes ((List!18054 0))(
  ( (Nil!18051) (Cons!18050 (h!19196 (_ BitVec 64)) (t!25523 List!18054)) )
))
(declare-fun arrayNoDuplicates!0 (array!53474 (_ BitVec 32) List!18054) Bool)

(assert (=> b!906606 (= res!611848 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18051))))

(declare-fun b!906607 () Bool)

(assert (=> b!906607 (= e!508065 true)))

(declare-fun lt!408979 () ListLongMap!10945)

(assert (=> b!906607 (= (apply!474 lt!408979 k!1033) lt!408981)))

(declare-fun lt!408977 () Unit!30770)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!29 (array!53474 array!53472 (_ BitVec 32) (_ BitVec 32) V!29919 V!29919 (_ BitVec 64) V!29919 (_ BitVec 32) Int) Unit!30770)

(assert (=> b!906607 (= lt!408977 (lemmaListMapApplyFromThenApplyFromZero!29 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408981 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29785 () Bool)

(assert (=> mapIsEmpty!29785 mapRes!29785))

(declare-fun b!906608 () Bool)

(declare-fun e!508064 () Bool)

(assert (=> b!906608 (= e!508064 tp_is_empty!18715)))

(declare-fun b!906609 () Bool)

(assert (=> b!906609 (= e!508061 e!508062)))

(declare-fun res!611846 () Bool)

(assert (=> b!906609 (=> (not res!611846) (not e!508062))))

(assert (=> b!906609 (= res!611846 (contains!4533 lt!408979 k!1033))))

(assert (=> b!906609 (= lt!408979 (getCurrentListMap!2754 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906610 () Bool)

(assert (=> b!906610 (= e!508060 (and e!508064 mapRes!29785))))

(declare-fun condMapEmpty!29785 () Bool)

(declare-fun mapDefault!29785 () ValueCell!8876)

