; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77638 () Bool)

(assert start!77638)

(declare-fun b_free!16223 () Bool)

(declare-fun b_next!16223 () Bool)

(assert (=> start!77638 (= b_free!16223 (not b_next!16223))))

(declare-fun tp!56930 () Bool)

(declare-fun b_and!26599 () Bool)

(assert (=> start!77638 (= tp!56930 b_and!26599)))

(declare-fun b!905082 () Bool)

(declare-fun res!610734 () Bool)

(declare-fun e!507176 () Bool)

(assert (=> b!905082 (=> res!610734 e!507176)))

(declare-datatypes ((V!29819 0))(
  ( (V!29820 (val!9371 Int)) )
))
(declare-fun lt!408424 () V!29819)

(declare-datatypes ((tuple2!12184 0))(
  ( (tuple2!12185 (_1!6103 (_ BitVec 64)) (_2!6103 V!29819)) )
))
(declare-datatypes ((List!17997 0))(
  ( (Nil!17994) (Cons!17993 (h!19139 tuple2!12184) (t!25392 List!17997)) )
))
(declare-datatypes ((ListLongMap!10881 0))(
  ( (ListLongMap!10882 (toList!5456 List!17997)) )
))
(declare-fun lt!408423 () ListLongMap!10881)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun apply!447 (ListLongMap!10881 (_ BitVec 64)) V!29819)

(assert (=> b!905082 (= res!610734 (not (= (apply!447 lt!408423 k!1033) lt!408424)))))

(declare-fun b!905083 () Bool)

(declare-fun e!507170 () Bool)

(declare-fun tp_is_empty!18641 () Bool)

(assert (=> b!905083 (= e!507170 tp_is_empty!18641)))

(declare-fun b!905084 () Bool)

(declare-fun e!507175 () Bool)

(assert (=> b!905084 (= e!507175 tp_is_empty!18641)))

(declare-fun res!610732 () Bool)

(declare-fun e!507174 () Bool)

(assert (=> start!77638 (=> (not res!610732) (not e!507174))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77638 (= res!610732 (validMask!0 mask!1756))))

(assert (=> start!77638 e!507174))

(declare-datatypes ((ValueCell!8839 0))(
  ( (ValueCellFull!8839 (v!11876 V!29819)) (EmptyCell!8839) )
))
(declare-datatypes ((array!53326 0))(
  ( (array!53327 (arr!25622 (Array (_ BitVec 32) ValueCell!8839)) (size!26081 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53326)

(declare-fun e!507177 () Bool)

(declare-fun array_inv!20074 (array!53326) Bool)

(assert (=> start!77638 (and (array_inv!20074 _values!1152) e!507177)))

(assert (=> start!77638 tp!56930))

(assert (=> start!77638 true))

(assert (=> start!77638 tp_is_empty!18641))

(declare-datatypes ((array!53328 0))(
  ( (array!53329 (arr!25623 (Array (_ BitVec 32) (_ BitVec 64))) (size!26082 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53328)

(declare-fun array_inv!20075 (array!53328) Bool)

(assert (=> start!77638 (array_inv!20075 _keys!1386)))

(declare-fun b!905085 () Bool)

(declare-fun e!507173 () Bool)

(assert (=> b!905085 (= e!507173 e!507176)))

(declare-fun res!610738 () Bool)

(assert (=> b!905085 (=> res!610738 e!507176)))

(declare-fun contains!4502 (ListLongMap!10881 (_ BitVec 64)) Bool)

(assert (=> b!905085 (= res!610738 (not (contains!4502 lt!408423 k!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29819)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29819)

(declare-fun getCurrentListMap!2723 (array!53328 array!53326 (_ BitVec 32) (_ BitVec 32) V!29819 V!29819 (_ BitVec 32) Int) ListLongMap!10881)

(assert (=> b!905085 (= lt!408423 (getCurrentListMap!2723 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29674 () Bool)

(declare-fun mapRes!29674 () Bool)

(declare-fun tp!56931 () Bool)

(assert (=> mapNonEmpty!29674 (= mapRes!29674 (and tp!56931 e!507170))))

(declare-fun mapRest!29674 () (Array (_ BitVec 32) ValueCell!8839))

(declare-fun mapValue!29674 () ValueCell!8839)

(declare-fun mapKey!29674 () (_ BitVec 32))

(assert (=> mapNonEmpty!29674 (= (arr!25622 _values!1152) (store mapRest!29674 mapKey!29674 mapValue!29674))))

(declare-fun b!905086 () Bool)

(declare-fun e!507171 () Bool)

(assert (=> b!905086 (= e!507171 (not e!507173))))

(declare-fun res!610733 () Bool)

(assert (=> b!905086 (=> res!610733 e!507173)))

(assert (=> b!905086 (= res!610733 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26082 _keys!1386))))))

(declare-fun get!13457 (ValueCell!8839 V!29819) V!29819)

(declare-fun dynLambda!1323 (Int (_ BitVec 64)) V!29819)

(assert (=> b!905086 (= lt!408424 (get!13457 (select (arr!25622 _values!1152) i!717) (dynLambda!1323 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905086 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30704 0))(
  ( (Unit!30705) )
))
(declare-fun lt!408422 () Unit!30704)

(declare-fun lemmaKeyInListMapIsInArray!195 (array!53328 array!53326 (_ BitVec 32) (_ BitVec 32) V!29819 V!29819 (_ BitVec 64) Int) Unit!30704)

(assert (=> b!905086 (= lt!408422 (lemmaKeyInListMapIsInArray!195 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!905087 () Bool)

(assert (=> b!905087 (= e!507177 (and e!507175 mapRes!29674))))

(declare-fun condMapEmpty!29674 () Bool)

(declare-fun mapDefault!29674 () ValueCell!8839)

