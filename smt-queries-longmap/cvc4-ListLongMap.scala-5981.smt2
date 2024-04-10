; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77716 () Bool)

(assert start!77716)

(declare-fun b_free!16301 () Bool)

(declare-fun b_next!16301 () Bool)

(assert (=> start!77716 (= b_free!16301 (not b_next!16301))))

(declare-fun tp!57164 () Bool)

(declare-fun b_and!26755 () Bool)

(assert (=> start!77716 (= tp!57164 b_and!26755)))

(declare-fun b!906681 () Bool)

(declare-fun res!611904 () Bool)

(declare-fun e!508111 () Bool)

(assert (=> b!906681 (=> (not res!611904) (not e!508111))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906681 (= res!611904 (inRange!0 i!717 mask!1756))))

(declare-fun b!906682 () Bool)

(declare-fun res!611901 () Bool)

(declare-fun e!508112 () Bool)

(assert (=> b!906682 (=> (not res!611901) (not e!508112))))

(declare-datatypes ((V!29923 0))(
  ( (V!29924 (val!9410 Int)) )
))
(declare-datatypes ((ValueCell!8878 0))(
  ( (ValueCellFull!8878 (v!11915 V!29923)) (EmptyCell!8878) )
))
(declare-datatypes ((array!53480 0))(
  ( (array!53481 (arr!25699 (Array (_ BitVec 32) ValueCell!8878)) (size!26158 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53480)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!53482 0))(
  ( (array!53483 (arr!25700 (Array (_ BitVec 32) (_ BitVec 64))) (size!26159 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53482)

(assert (=> b!906682 (= res!611901 (and (= (size!26158 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26159 _keys!1386) (size!26158 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906683 () Bool)

(declare-fun e!508108 () Bool)

(declare-fun e!508109 () Bool)

(assert (=> b!906683 (= e!508108 e!508109)))

(declare-fun res!611903 () Bool)

(assert (=> b!906683 (=> res!611903 e!508109)))

(declare-datatypes ((tuple2!12252 0))(
  ( (tuple2!12253 (_1!6137 (_ BitVec 64)) (_2!6137 V!29923)) )
))
(declare-datatypes ((List!18057 0))(
  ( (Nil!18054) (Cons!18053 (h!19199 tuple2!12252) (t!25530 List!18057)) )
))
(declare-datatypes ((ListLongMap!10949 0))(
  ( (ListLongMap!10950 (toList!5490 List!18057)) )
))
(declare-fun lt!409007 () ListLongMap!10949)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4535 (ListLongMap!10949 (_ BitVec 64)) Bool)

(assert (=> b!906683 (= res!611903 (not (contains!4535 lt!409007 k!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29923)

(declare-fun minValue!1094 () V!29923)

(declare-fun getCurrentListMap!2756 (array!53482 array!53480 (_ BitVec 32) (_ BitVec 32) V!29923 V!29923 (_ BitVec 32) Int) ListLongMap!10949)

(assert (=> b!906683 (= lt!409007 (getCurrentListMap!2756 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906684 () Bool)

(declare-fun res!611907 () Bool)

(assert (=> b!906684 (=> (not res!611907) (not e!508111))))

(assert (=> b!906684 (= res!611907 (and (= (select (arr!25700 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906685 () Bool)

(declare-fun res!611908 () Bool)

(assert (=> b!906685 (=> (not res!611908) (not e!508112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53482 (_ BitVec 32)) Bool)

(assert (=> b!906685 (= res!611908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906686 () Bool)

(declare-fun e!508107 () Bool)

(declare-fun tp_is_empty!18719 () Bool)

(assert (=> b!906686 (= e!508107 tp_is_empty!18719)))

(declare-fun mapIsEmpty!29791 () Bool)

(declare-fun mapRes!29791 () Bool)

(assert (=> mapIsEmpty!29791 mapRes!29791))

(declare-fun b!906687 () Bool)

(assert (=> b!906687 (= e!508109 true)))

(declare-fun lt!409009 () ListLongMap!10949)

(declare-fun lt!409011 () V!29923)

(declare-fun apply!476 (ListLongMap!10949 (_ BitVec 64)) V!29923)

(assert (=> b!906687 (= (apply!476 lt!409009 k!1033) lt!409011)))

(declare-datatypes ((Unit!30774 0))(
  ( (Unit!30775) )
))
(declare-fun lt!409010 () Unit!30774)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!31 (array!53482 array!53480 (_ BitVec 32) (_ BitVec 32) V!29923 V!29923 (_ BitVec 64) V!29923 (_ BitVec 32) Int) Unit!30774)

(assert (=> b!906687 (= lt!409010 (lemmaListMapApplyFromThenApplyFromZero!31 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409011 i!717 defaultEntry!1160))))

(declare-fun b!906688 () Bool)

(assert (=> b!906688 (= e!508111 (not e!508108))))

(declare-fun res!611902 () Bool)

(assert (=> b!906688 (=> res!611902 e!508108)))

(assert (=> b!906688 (= res!611902 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26159 _keys!1386))))))

(declare-fun get!13513 (ValueCell!8878 V!29923) V!29923)

(declare-fun dynLambda!1353 (Int (_ BitVec 64)) V!29923)

(assert (=> b!906688 (= lt!409011 (get!13513 (select (arr!25699 _values!1152) i!717) (dynLambda!1353 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906688 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409008 () Unit!30774)

(declare-fun lemmaKeyInListMapIsInArray!225 (array!53482 array!53480 (_ BitVec 32) (_ BitVec 32) V!29923 V!29923 (_ BitVec 64) Int) Unit!30774)

(assert (=> b!906688 (= lt!409008 (lemmaKeyInListMapIsInArray!225 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!906689 () Bool)

(declare-fun e!508106 () Bool)

(assert (=> b!906689 (= e!508106 tp_is_empty!18719)))

(declare-fun b!906690 () Bool)

(declare-fun res!611900 () Bool)

(assert (=> b!906690 (=> res!611900 e!508109)))

(assert (=> b!906690 (= res!611900 (not (= (apply!476 lt!409007 k!1033) lt!409011)))))

(declare-fun mapNonEmpty!29791 () Bool)

(declare-fun tp!57165 () Bool)

(assert (=> mapNonEmpty!29791 (= mapRes!29791 (and tp!57165 e!508107))))

(declare-fun mapRest!29791 () (Array (_ BitVec 32) ValueCell!8878))

(declare-fun mapValue!29791 () ValueCell!8878)

(declare-fun mapKey!29791 () (_ BitVec 32))

(assert (=> mapNonEmpty!29791 (= (arr!25699 _values!1152) (store mapRest!29791 mapKey!29791 mapValue!29791))))

(declare-fun b!906691 () Bool)

(assert (=> b!906691 (= e!508112 e!508111)))

(declare-fun res!611909 () Bool)

(assert (=> b!906691 (=> (not res!611909) (not e!508111))))

(assert (=> b!906691 (= res!611909 (contains!4535 lt!409009 k!1033))))

(assert (=> b!906691 (= lt!409009 (getCurrentListMap!2756 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun res!611906 () Bool)

(assert (=> start!77716 (=> (not res!611906) (not e!508112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77716 (= res!611906 (validMask!0 mask!1756))))

(assert (=> start!77716 e!508112))

(declare-fun e!508113 () Bool)

(declare-fun array_inv!20132 (array!53480) Bool)

(assert (=> start!77716 (and (array_inv!20132 _values!1152) e!508113)))

(assert (=> start!77716 tp!57164))

(assert (=> start!77716 true))

(assert (=> start!77716 tp_is_empty!18719))

(declare-fun array_inv!20133 (array!53482) Bool)

(assert (=> start!77716 (array_inv!20133 _keys!1386)))

(declare-fun b!906692 () Bool)

(assert (=> b!906692 (= e!508113 (and e!508106 mapRes!29791))))

(declare-fun condMapEmpty!29791 () Bool)

(declare-fun mapDefault!29791 () ValueCell!8878)

