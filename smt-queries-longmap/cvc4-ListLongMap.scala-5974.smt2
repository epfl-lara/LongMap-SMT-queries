; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77674 () Bool)

(assert start!77674)

(declare-fun b_free!16259 () Bool)

(declare-fun b_next!16259 () Bool)

(assert (=> start!77674 (= b_free!16259 (not b_next!16259))))

(declare-fun tp!57038 () Bool)

(declare-fun b_and!26671 () Bool)

(assert (=> start!77674 (= tp!57038 b_and!26671)))

(declare-fun b!905820 () Bool)

(declare-fun e!507607 () Bool)

(declare-fun e!507609 () Bool)

(assert (=> b!905820 (= e!507607 e!507609)))

(declare-fun res!611278 () Bool)

(assert (=> b!905820 (=> (not res!611278) (not e!507609))))

(declare-datatypes ((V!29867 0))(
  ( (V!29868 (val!9389 Int)) )
))
(declare-datatypes ((tuple2!12216 0))(
  ( (tuple2!12217 (_1!6119 (_ BitVec 64)) (_2!6119 V!29867)) )
))
(declare-datatypes ((List!18026 0))(
  ( (Nil!18023) (Cons!18022 (h!19168 tuple2!12216) (t!25457 List!18026)) )
))
(declare-datatypes ((ListLongMap!10913 0))(
  ( (ListLongMap!10914 (toList!5472 List!18026)) )
))
(declare-fun lt!408692 () ListLongMap!10913)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4517 (ListLongMap!10913 (_ BitVec 64)) Bool)

(assert (=> b!905820 (= res!611278 (contains!4517 lt!408692 k!1033))))

(declare-datatypes ((ValueCell!8857 0))(
  ( (ValueCellFull!8857 (v!11894 V!29867)) (EmptyCell!8857) )
))
(declare-datatypes ((array!53396 0))(
  ( (array!53397 (arr!25657 (Array (_ BitVec 32) ValueCell!8857)) (size!26116 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53396)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29867)

(declare-datatypes ((array!53398 0))(
  ( (array!53399 (arr!25658 (Array (_ BitVec 32) (_ BitVec 64))) (size!26117 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53398)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29867)

(declare-fun defaultEntry!1160 () Int)

(declare-fun getCurrentListMap!2738 (array!53398 array!53396 (_ BitVec 32) (_ BitVec 32) V!29867 V!29867 (_ BitVec 32) Int) ListLongMap!10913)

(assert (=> b!905820 (= lt!408692 (getCurrentListMap!2738 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905821 () Bool)

(declare-fun e!507604 () Bool)

(declare-fun e!507606 () Bool)

(assert (=> b!905821 (= e!507604 e!507606)))

(declare-fun res!611270 () Bool)

(assert (=> b!905821 (=> res!611270 e!507606)))

(declare-fun lt!408694 () ListLongMap!10913)

(assert (=> b!905821 (= res!611270 (not (contains!4517 lt!408694 k!1033)))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!905821 (= lt!408694 (getCurrentListMap!2738 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905823 () Bool)

(declare-fun res!611273 () Bool)

(assert (=> b!905823 (=> (not res!611273) (not e!507607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53398 (_ BitVec 32)) Bool)

(assert (=> b!905823 (= res!611273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29728 () Bool)

(declare-fun mapRes!29728 () Bool)

(assert (=> mapIsEmpty!29728 mapRes!29728))

(declare-fun b!905824 () Bool)

(assert (=> b!905824 (= e!507609 (not e!507604))))

(declare-fun res!611276 () Bool)

(assert (=> b!905824 (=> res!611276 e!507604)))

(assert (=> b!905824 (= res!611276 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26117 _keys!1386))))))

(declare-fun lt!408695 () V!29867)

(declare-fun get!13481 (ValueCell!8857 V!29867) V!29867)

(declare-fun dynLambda!1335 (Int (_ BitVec 64)) V!29867)

(assert (=> b!905824 (= lt!408695 (get!13481 (select (arr!25657 _values!1152) i!717) (dynLambda!1335 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905824 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30736 0))(
  ( (Unit!30737) )
))
(declare-fun lt!408693 () Unit!30736)

(declare-fun lemmaKeyInListMapIsInArray!207 (array!53398 array!53396 (_ BitVec 32) (_ BitVec 32) V!29867 V!29867 (_ BitVec 64) Int) Unit!30736)

(assert (=> b!905824 (= lt!408693 (lemmaKeyInListMapIsInArray!207 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!905825 () Bool)

(declare-fun e!507603 () Bool)

(declare-fun tp_is_empty!18677 () Bool)

(assert (=> b!905825 (= e!507603 tp_is_empty!18677)))

(declare-fun b!905826 () Bool)

(declare-fun res!611272 () Bool)

(assert (=> b!905826 (=> (not res!611272) (not e!507607))))

(assert (=> b!905826 (= res!611272 (and (= (size!26116 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26117 _keys!1386) (size!26116 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905827 () Bool)

(declare-fun res!611271 () Bool)

(assert (=> b!905827 (=> (not res!611271) (not e!507609))))

(assert (=> b!905827 (= res!611271 (and (= (select (arr!25658 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905828 () Bool)

(declare-fun res!611279 () Bool)

(assert (=> b!905828 (=> res!611279 e!507606)))

(declare-fun apply!461 (ListLongMap!10913 (_ BitVec 64)) V!29867)

(assert (=> b!905828 (= res!611279 (not (= (apply!461 lt!408694 k!1033) lt!408695)))))

(declare-fun mapNonEmpty!29728 () Bool)

(declare-fun tp!57039 () Bool)

(assert (=> mapNonEmpty!29728 (= mapRes!29728 (and tp!57039 e!507603))))

(declare-fun mapRest!29728 () (Array (_ BitVec 32) ValueCell!8857))

(declare-fun mapValue!29728 () ValueCell!8857)

(declare-fun mapKey!29728 () (_ BitVec 32))

(assert (=> mapNonEmpty!29728 (= (arr!25657 _values!1152) (store mapRest!29728 mapKey!29728 mapValue!29728))))

(declare-fun b!905829 () Bool)

(declare-fun e!507608 () Bool)

(assert (=> b!905829 (= e!507608 tp_is_empty!18677)))

(declare-fun b!905830 () Bool)

(declare-fun res!611275 () Bool)

(assert (=> b!905830 (=> (not res!611275) (not e!507607))))

(declare-datatypes ((List!18027 0))(
  ( (Nil!18024) (Cons!18023 (h!19169 (_ BitVec 64)) (t!25458 List!18027)) )
))
(declare-fun arrayNoDuplicates!0 (array!53398 (_ BitVec 32) List!18027) Bool)

(assert (=> b!905830 (= res!611275 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18024))))

(declare-fun b!905822 () Bool)

(assert (=> b!905822 (= e!507606 true)))

(assert (=> b!905822 (= (apply!461 lt!408692 k!1033) lt!408695)))

(declare-fun lt!408696 () Unit!30736)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!16 (array!53398 array!53396 (_ BitVec 32) (_ BitVec 32) V!29867 V!29867 (_ BitVec 64) V!29867 (_ BitVec 32) Int) Unit!30736)

(assert (=> b!905822 (= lt!408696 (lemmaListMapApplyFromThenApplyFromZero!16 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408695 i!717 defaultEntry!1160))))

(declare-fun res!611274 () Bool)

(assert (=> start!77674 (=> (not res!611274) (not e!507607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77674 (= res!611274 (validMask!0 mask!1756))))

(assert (=> start!77674 e!507607))

(declare-fun e!507602 () Bool)

(declare-fun array_inv!20100 (array!53396) Bool)

(assert (=> start!77674 (and (array_inv!20100 _values!1152) e!507602)))

(assert (=> start!77674 tp!57038))

(assert (=> start!77674 true))

(assert (=> start!77674 tp_is_empty!18677))

(declare-fun array_inv!20101 (array!53398) Bool)

(assert (=> start!77674 (array_inv!20101 _keys!1386)))

(declare-fun b!905831 () Bool)

(assert (=> b!905831 (= e!507602 (and e!507608 mapRes!29728))))

(declare-fun condMapEmpty!29728 () Bool)

(declare-fun mapDefault!29728 () ValueCell!8857)

