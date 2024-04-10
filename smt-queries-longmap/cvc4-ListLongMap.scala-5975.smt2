; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77680 () Bool)

(assert start!77680)

(declare-fun b_free!16265 () Bool)

(declare-fun b_next!16265 () Bool)

(assert (=> start!77680 (= b_free!16265 (not b_next!16265))))

(declare-fun tp!57056 () Bool)

(declare-fun b_and!26683 () Bool)

(assert (=> start!77680 (= tp!57056 b_and!26683)))

(declare-fun b!905943 () Bool)

(declare-fun e!507679 () Bool)

(declare-fun e!507675 () Bool)

(assert (=> b!905943 (= e!507679 (not e!507675))))

(declare-fun res!611362 () Bool)

(assert (=> b!905943 (=> res!611362 e!507675)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53408 0))(
  ( (array!53409 (arr!25663 (Array (_ BitVec 32) (_ BitVec 64))) (size!26122 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53408)

(assert (=> b!905943 (= res!611362 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26122 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((V!29875 0))(
  ( (V!29876 (val!9392 Int)) )
))
(declare-fun lt!408741 () V!29875)

(declare-datatypes ((ValueCell!8860 0))(
  ( (ValueCellFull!8860 (v!11897 V!29875)) (EmptyCell!8860) )
))
(declare-datatypes ((array!53410 0))(
  ( (array!53411 (arr!25664 (Array (_ BitVec 32) ValueCell!8860)) (size!26123 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53410)

(declare-fun get!13486 (ValueCell!8860 V!29875) V!29875)

(declare-fun dynLambda!1338 (Int (_ BitVec 64)) V!29875)

(assert (=> b!905943 (= lt!408741 (get!13486 (select (arr!25664 _values!1152) i!717) (dynLambda!1338 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905943 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!29875)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29875)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((Unit!30742 0))(
  ( (Unit!30743) )
))
(declare-fun lt!408739 () Unit!30742)

(declare-fun lemmaKeyInListMapIsInArray!210 (array!53408 array!53410 (_ BitVec 32) (_ BitVec 32) V!29875 V!29875 (_ BitVec 64) Int) Unit!30742)

(assert (=> b!905943 (= lt!408739 (lemmaKeyInListMapIsInArray!210 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29737 () Bool)

(declare-fun mapRes!29737 () Bool)

(declare-fun tp!57057 () Bool)

(declare-fun e!507681 () Bool)

(assert (=> mapNonEmpty!29737 (= mapRes!29737 (and tp!57057 e!507681))))

(declare-fun mapRest!29737 () (Array (_ BitVec 32) ValueCell!8860))

(declare-fun mapKey!29737 () (_ BitVec 32))

(declare-fun mapValue!29737 () ValueCell!8860)

(assert (=> mapNonEmpty!29737 (= (arr!25664 _values!1152) (store mapRest!29737 mapKey!29737 mapValue!29737))))

(declare-fun b!905944 () Bool)

(declare-fun res!611369 () Bool)

(assert (=> b!905944 (=> (not res!611369) (not e!507679))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905944 (= res!611369 (inRange!0 i!717 mask!1756))))

(declare-fun b!905945 () Bool)

(declare-fun e!507680 () Bool)

(declare-fun e!507677 () Bool)

(assert (=> b!905945 (= e!507680 (and e!507677 mapRes!29737))))

(declare-fun condMapEmpty!29737 () Bool)

(declare-fun mapDefault!29737 () ValueCell!8860)

