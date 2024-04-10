; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77686 () Bool)

(assert start!77686)

(declare-fun b_free!16271 () Bool)

(declare-fun b_next!16271 () Bool)

(assert (=> start!77686 (= b_free!16271 (not b_next!16271))))

(declare-fun tp!57074 () Bool)

(declare-fun b_and!26695 () Bool)

(assert (=> start!77686 (= tp!57074 b_and!26695)))

(declare-fun b!906066 () Bool)

(declare-fun e!507753 () Bool)

(declare-fun e!507751 () Bool)

(assert (=> b!906066 (= e!507753 (not e!507751))))

(declare-fun res!611458 () Bool)

(assert (=> b!906066 (=> res!611458 e!507751)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53420 0))(
  ( (array!53421 (arr!25669 (Array (_ BitVec 32) (_ BitVec 64))) (size!26128 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53420)

(assert (=> b!906066 (= res!611458 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26128 _keys!1386))))))

(declare-datatypes ((V!29883 0))(
  ( (V!29884 (val!9395 Int)) )
))
(declare-datatypes ((ValueCell!8863 0))(
  ( (ValueCellFull!8863 (v!11900 V!29883)) (EmptyCell!8863) )
))
(declare-datatypes ((array!53422 0))(
  ( (array!53423 (arr!25670 (Array (_ BitVec 32) ValueCell!8863)) (size!26129 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53422)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!408783 () V!29883)

(declare-fun get!13491 (ValueCell!8863 V!29883) V!29883)

(declare-fun dynLambda!1341 (Int (_ BitVec 64)) V!29883)

(assert (=> b!906066 (= lt!408783 (get!13491 (select (arr!25670 _values!1152) i!717) (dynLambda!1341 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906066 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29883)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29883)

(declare-datatypes ((Unit!30748 0))(
  ( (Unit!30749) )
))
(declare-fun lt!408782 () Unit!30748)

(declare-fun lemmaKeyInListMapIsInArray!213 (array!53420 array!53422 (_ BitVec 32) (_ BitVec 32) V!29883 V!29883 (_ BitVec 64) Int) Unit!30748)

(assert (=> b!906066 (= lt!408782 (lemmaKeyInListMapIsInArray!213 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!906067 () Bool)

(declare-fun res!611457 () Bool)

(declare-fun e!507746 () Bool)

(assert (=> b!906067 (=> (not res!611457) (not e!507746))))

(assert (=> b!906067 (= res!611457 (and (= (size!26129 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26128 _keys!1386) (size!26129 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!611453 () Bool)

(assert (=> start!77686 (=> (not res!611453) (not e!507746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77686 (= res!611453 (validMask!0 mask!1756))))

(assert (=> start!77686 e!507746))

(declare-fun e!507749 () Bool)

(declare-fun array_inv!20108 (array!53422) Bool)

(assert (=> start!77686 (and (array_inv!20108 _values!1152) e!507749)))

(assert (=> start!77686 tp!57074))

(assert (=> start!77686 true))

(declare-fun tp_is_empty!18689 () Bool)

(assert (=> start!77686 tp_is_empty!18689))

(declare-fun array_inv!20109 (array!53420) Bool)

(assert (=> start!77686 (array_inv!20109 _keys!1386)))

(declare-fun b!906068 () Bool)

(declare-fun e!507747 () Bool)

(declare-fun mapRes!29746 () Bool)

(assert (=> b!906068 (= e!507749 (and e!507747 mapRes!29746))))

(declare-fun condMapEmpty!29746 () Bool)

(declare-fun mapDefault!29746 () ValueCell!8863)

