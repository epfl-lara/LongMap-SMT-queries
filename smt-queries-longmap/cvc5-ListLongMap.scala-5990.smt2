; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77792 () Bool)

(assert start!77792)

(declare-fun b_free!16351 () Bool)

(declare-fun b_next!16351 () Bool)

(assert (=> start!77792 (= b_free!16351 (not b_next!16351))))

(declare-fun tp!57317 () Bool)

(declare-fun b_and!26859 () Bool)

(assert (=> start!77792 (= tp!57317 b_and!26859)))

(declare-fun b!907858 () Bool)

(declare-fun res!612721 () Bool)

(declare-fun e!508813 () Bool)

(assert (=> b!907858 (=> (not res!612721) (not e!508813))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53572 0))(
  ( (array!53573 (arr!25744 (Array (_ BitVec 32) (_ BitVec 64))) (size!26203 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53572)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!907858 (= res!612721 (and (= (select (arr!25744 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29869 () Bool)

(declare-fun mapRes!29869 () Bool)

(declare-fun tp!57318 () Bool)

(declare-fun e!508808 () Bool)

(assert (=> mapNonEmpty!29869 (= mapRes!29869 (and tp!57318 e!508808))))

(declare-datatypes ((V!29991 0))(
  ( (V!29992 (val!9435 Int)) )
))
(declare-datatypes ((ValueCell!8903 0))(
  ( (ValueCellFull!8903 (v!11942 V!29991)) (EmptyCell!8903) )
))
(declare-datatypes ((array!53574 0))(
  ( (array!53575 (arr!25745 (Array (_ BitVec 32) ValueCell!8903)) (size!26204 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53574)

(declare-fun mapKey!29869 () (_ BitVec 32))

(declare-fun mapRest!29869 () (Array (_ BitVec 32) ValueCell!8903))

(declare-fun mapValue!29869 () ValueCell!8903)

(assert (=> mapNonEmpty!29869 (= (arr!25745 _values!1152) (store mapRest!29869 mapKey!29869 mapValue!29869))))

(declare-fun b!907859 () Bool)

(declare-fun res!612715 () Bool)

(assert (=> b!907859 (=> (not res!612715) (not e!508813))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907859 (= res!612715 (inRange!0 i!717 mask!1756))))

(declare-fun b!907860 () Bool)

(declare-fun e!508810 () Bool)

(assert (=> b!907860 (= e!508813 (not e!508810))))

(declare-fun res!612722 () Bool)

(assert (=> b!907860 (=> res!612722 e!508810)))

(assert (=> b!907860 (= res!612722 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26203 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409504 () V!29991)

(declare-fun get!13549 (ValueCell!8903 V!29991) V!29991)

(declare-fun dynLambda!1368 (Int (_ BitVec 64)) V!29991)

(assert (=> b!907860 (= lt!409504 (get!13549 (select (arr!25745 _values!1152) i!717) (dynLambda!1368 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907860 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!29991)

(declare-datatypes ((Unit!30812 0))(
  ( (Unit!30813) )
))
(declare-fun lt!409502 () Unit!30812)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29991)

(declare-fun lemmaKeyInListMapIsInArray!240 (array!53572 array!53574 (_ BitVec 32) (_ BitVec 32) V!29991 V!29991 (_ BitVec 64) Int) Unit!30812)

(assert (=> b!907860 (= lt!409502 (lemmaKeyInListMapIsInArray!240 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun res!612714 () Bool)

(declare-fun e!508815 () Bool)

(assert (=> start!77792 (=> (not res!612714) (not e!508815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77792 (= res!612714 (validMask!0 mask!1756))))

(assert (=> start!77792 e!508815))

(declare-fun e!508809 () Bool)

(declare-fun array_inv!20156 (array!53574) Bool)

(assert (=> start!77792 (and (array_inv!20156 _values!1152) e!508809)))

(assert (=> start!77792 tp!57317))

(assert (=> start!77792 true))

(declare-fun tp_is_empty!18769 () Bool)

(assert (=> start!77792 tp_is_empty!18769))

(declare-fun array_inv!20157 (array!53572) Bool)

(assert (=> start!77792 (array_inv!20157 _keys!1386)))

(declare-fun b!907861 () Bool)

(declare-fun res!612716 () Bool)

(assert (=> b!907861 (=> (not res!612716) (not e!508815))))

(assert (=> b!907861 (= res!612716 (and (= (size!26204 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26203 _keys!1386) (size!26204 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29869 () Bool)

(assert (=> mapIsEmpty!29869 mapRes!29869))

(declare-fun b!907862 () Bool)

(declare-fun e!508814 () Bool)

(assert (=> b!907862 (= e!508809 (and e!508814 mapRes!29869))))

(declare-fun condMapEmpty!29869 () Bool)

(declare-fun mapDefault!29869 () ValueCell!8903)

