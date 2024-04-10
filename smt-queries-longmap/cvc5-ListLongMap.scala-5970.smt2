; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77646 () Bool)

(assert start!77646)

(declare-fun b_free!16231 () Bool)

(declare-fun b_next!16231 () Bool)

(assert (=> start!77646 (= b_free!16231 (not b_next!16231))))

(declare-fun tp!56954 () Bool)

(declare-fun b_and!26615 () Bool)

(assert (=> start!77646 (= tp!56954 b_and!26615)))

(declare-fun b!905246 () Bool)

(declare-fun res!610855 () Bool)

(declare-fun e!507270 () Bool)

(assert (=> b!905246 (=> (not res!610855) (not e!507270))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905246 (= res!610855 (inRange!0 i!717 mask!1756))))

(declare-fun b!905247 () Bool)

(declare-fun res!610850 () Bool)

(declare-fun e!507269 () Bool)

(assert (=> b!905247 (=> (not res!610850) (not e!507269))))

(declare-datatypes ((array!53342 0))(
  ( (array!53343 (arr!25630 (Array (_ BitVec 32) (_ BitVec 64))) (size!26089 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53342)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53342 (_ BitVec 32)) Bool)

(assert (=> b!905247 (= res!610850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905248 () Bool)

(declare-fun e!507267 () Bool)

(assert (=> b!905248 (= e!507270 (not e!507267))))

(declare-fun res!610857 () Bool)

(assert (=> b!905248 (=> res!610857 e!507267)))

(assert (=> b!905248 (= res!610857 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26089 _keys!1386))))))

(declare-datatypes ((V!29831 0))(
  ( (V!29832 (val!9375 Int)) )
))
(declare-datatypes ((ValueCell!8843 0))(
  ( (ValueCellFull!8843 (v!11880 V!29831)) (EmptyCell!8843) )
))
(declare-datatypes ((array!53344 0))(
  ( (array!53345 (arr!25631 (Array (_ BitVec 32) ValueCell!8843)) (size!26090 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53344)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!408482 () V!29831)

(declare-fun get!13465 (ValueCell!8843 V!29831) V!29831)

(declare-fun dynLambda!1327 (Int (_ BitVec 64)) V!29831)

(assert (=> b!905248 (= lt!408482 (get!13465 (select (arr!25631 _values!1152) i!717) (dynLambda!1327 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905248 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30712 0))(
  ( (Unit!30713) )
))
(declare-fun lt!408483 () Unit!30712)

(declare-fun zeroValue!1094 () V!29831)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29831)

(declare-fun lemmaKeyInListMapIsInArray!199 (array!53342 array!53344 (_ BitVec 32) (_ BitVec 32) V!29831 V!29831 (_ BitVec 64) Int) Unit!30712)

(assert (=> b!905248 (= lt!408483 (lemmaKeyInListMapIsInArray!199 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!905249 () Bool)

(declare-fun e!507268 () Bool)

(assert (=> b!905249 (= e!507267 e!507268)))

(declare-fun res!610854 () Bool)

(assert (=> b!905249 (=> res!610854 e!507268)))

(declare-datatypes ((tuple2!12192 0))(
  ( (tuple2!12193 (_1!6107 (_ BitVec 64)) (_2!6107 V!29831)) )
))
(declare-datatypes ((List!18003 0))(
  ( (Nil!18000) (Cons!17999 (h!19145 tuple2!12192) (t!25406 List!18003)) )
))
(declare-datatypes ((ListLongMap!10889 0))(
  ( (ListLongMap!10890 (toList!5460 List!18003)) )
))
(declare-fun lt!408485 () ListLongMap!10889)

(declare-fun contains!4506 (ListLongMap!10889 (_ BitVec 64)) Bool)

(assert (=> b!905249 (= res!610854 (not (contains!4506 lt!408485 k!1033)))))

(declare-fun getCurrentListMap!2727 (array!53342 array!53344 (_ BitVec 32) (_ BitVec 32) V!29831 V!29831 (_ BitVec 32) Int) ListLongMap!10889)

(assert (=> b!905249 (= lt!408485 (getCurrentListMap!2727 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!610856 () Bool)

(assert (=> start!77646 (=> (not res!610856) (not e!507269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77646 (= res!610856 (validMask!0 mask!1756))))

(assert (=> start!77646 e!507269))

(declare-fun e!507271 () Bool)

(declare-fun array_inv!20080 (array!53344) Bool)

(assert (=> start!77646 (and (array_inv!20080 _values!1152) e!507271)))

(assert (=> start!77646 tp!56954))

(assert (=> start!77646 true))

(declare-fun tp_is_empty!18649 () Bool)

(assert (=> start!77646 tp_is_empty!18649))

(declare-fun array_inv!20081 (array!53342) Bool)

(assert (=> start!77646 (array_inv!20081 _keys!1386)))

(declare-fun b!905250 () Bool)

(declare-fun res!610853 () Bool)

(assert (=> b!905250 (=> res!610853 e!507268)))

(declare-fun apply!449 (ListLongMap!10889 (_ BitVec 64)) V!29831)

(assert (=> b!905250 (= res!610853 (not (= (apply!449 lt!408485 k!1033) lt!408482)))))

(declare-fun b!905251 () Bool)

(declare-fun res!610851 () Bool)

(assert (=> b!905251 (=> (not res!610851) (not e!507269))))

(declare-datatypes ((List!18004 0))(
  ( (Nil!18001) (Cons!18000 (h!19146 (_ BitVec 64)) (t!25407 List!18004)) )
))
(declare-fun arrayNoDuplicates!0 (array!53342 (_ BitVec 32) List!18004) Bool)

(assert (=> b!905251 (= res!610851 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18001))))

(declare-fun b!905252 () Bool)

(declare-fun e!507272 () Bool)

(declare-fun mapRes!29686 () Bool)

(assert (=> b!905252 (= e!507271 (and e!507272 mapRes!29686))))

(declare-fun condMapEmpty!29686 () Bool)

(declare-fun mapDefault!29686 () ValueCell!8843)

