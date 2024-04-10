; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78856 () Bool)

(assert start!78856)

(declare-fun b_free!17069 () Bool)

(declare-fun b_next!17069 () Bool)

(assert (=> start!78856 (= b_free!17069 (not b_next!17069))))

(declare-fun tp!59648 () Bool)

(declare-fun b_and!27875 () Bool)

(assert (=> start!78856 (= tp!59648 b_and!27875)))

(declare-fun b!921259 () Bool)

(declare-fun e!516993 () Bool)

(declare-fun tp_is_empty!19577 () Bool)

(assert (=> b!921259 (= e!516993 tp_is_empty!19577)))

(declare-fun b!921260 () Bool)

(declare-fun res!621271 () Bool)

(declare-fun e!516994 () Bool)

(assert (=> b!921260 (=> (not res!621271) (not e!516994))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921260 (= res!621271 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921261 () Bool)

(declare-fun e!516995 () Bool)

(assert (=> b!921261 (= e!516995 true)))

(declare-fun lt!413610 () Bool)

(declare-datatypes ((List!18599 0))(
  ( (Nil!18596) (Cons!18595 (h!19741 (_ BitVec 64)) (t!26398 List!18599)) )
))
(declare-fun contains!4819 (List!18599 (_ BitVec 64)) Bool)

(assert (=> b!921261 (= lt!413610 (contains!4819 Nil!18596 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921262 () Bool)

(declare-fun res!621264 () Bool)

(assert (=> b!921262 (=> res!621264 e!516995)))

(declare-fun noDuplicate!1343 (List!18599) Bool)

(assert (=> b!921262 (= res!621264 (not (noDuplicate!1343 Nil!18596)))))

(declare-fun b!921263 () Bool)

(declare-fun e!516990 () Bool)

(declare-fun mapRes!31122 () Bool)

(assert (=> b!921263 (= e!516990 (and e!516993 mapRes!31122))))

(declare-fun condMapEmpty!31122 () Bool)

(declare-datatypes ((V!31067 0))(
  ( (V!31068 (val!9839 Int)) )
))
(declare-datatypes ((ValueCell!9307 0))(
  ( (ValueCellFull!9307 (v!12357 V!31067)) (EmptyCell!9307) )
))
(declare-datatypes ((array!55134 0))(
  ( (array!55135 (arr!26512 (Array (_ BitVec 32) ValueCell!9307)) (size!26971 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55134)

(declare-fun mapDefault!31122 () ValueCell!9307)

