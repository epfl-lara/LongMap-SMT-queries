; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78618 () Bool)

(assert start!78618)

(declare-fun b_free!16831 () Bool)

(declare-fun b_next!16831 () Bool)

(assert (=> start!78618 (= b_free!16831 (not b_next!16831))))

(declare-fun tp!58934 () Bool)

(declare-fun b_and!27453 () Bool)

(assert (=> start!78618 (= tp!58934 b_and!27453)))

(declare-fun b!916485 () Bool)

(declare-fun res!617847 () Bool)

(declare-fun e!514466 () Bool)

(assert (=> b!916485 (=> (not res!617847) (not e!514466))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54666 0))(
  ( (array!54667 (arr!26278 (Array (_ BitVec 32) (_ BitVec 64))) (size!26737 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54666)

(assert (=> b!916485 (= res!617847 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26737 _keys!1487))))))

(declare-fun b!916486 () Bool)

(declare-fun e!514464 () Bool)

(assert (=> b!916486 (= e!514466 e!514464)))

(declare-fun res!617846 () Bool)

(assert (=> b!916486 (=> (not res!617846) (not e!514464))))

(declare-datatypes ((V!30751 0))(
  ( (V!30752 (val!9720 Int)) )
))
(declare-datatypes ((tuple2!12612 0))(
  ( (tuple2!12613 (_1!6317 (_ BitVec 64)) (_2!6317 V!30751)) )
))
(declare-datatypes ((List!18423 0))(
  ( (Nil!18420) (Cons!18419 (h!19565 tuple2!12612) (t!26036 List!18423)) )
))
(declare-datatypes ((ListLongMap!11309 0))(
  ( (ListLongMap!11310 (toList!5670 List!18423)) )
))
(declare-fun lt!411802 () ListLongMap!11309)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4723 (ListLongMap!11309 (_ BitVec 64)) Bool)

(assert (=> b!916486 (= res!617846 (contains!4723 lt!411802 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9188 0))(
  ( (ValueCellFull!9188 (v!12238 V!30751)) (EmptyCell!9188) )
))
(declare-datatypes ((array!54668 0))(
  ( (array!54669 (arr!26279 (Array (_ BitVec 32) ValueCell!9188)) (size!26738 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54668)

(declare-fun zeroValue!1173 () V!30751)

(declare-fun minValue!1173 () V!30751)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!2930 (array!54666 array!54668 (_ BitVec 32) (_ BitVec 32) V!30751 V!30751 (_ BitVec 32) Int) ListLongMap!11309)

(assert (=> b!916486 (= lt!411802 (getCurrentListMap!2930 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916487 () Bool)

(declare-fun res!617850 () Bool)

(assert (=> b!916487 (=> (not res!617850) (not e!514466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54666 (_ BitVec 32)) Bool)

(assert (=> b!916487 (= res!617850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916488 () Bool)

(declare-fun res!617851 () Bool)

(assert (=> b!916488 (=> (not res!617851) (not e!514466))))

(assert (=> b!916488 (= res!617851 (and (= (size!26738 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26737 _keys!1487) (size!26738 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916489 () Bool)

(assert (=> b!916489 (= e!514464 false)))

(declare-fun lt!411801 () V!30751)

(declare-fun apply!529 (ListLongMap!11309 (_ BitVec 64)) V!30751)

(assert (=> b!916489 (= lt!411801 (apply!529 lt!411802 k!1099))))

(declare-fun b!916490 () Bool)

(declare-fun e!514467 () Bool)

(declare-fun e!514463 () Bool)

(declare-fun mapRes!30765 () Bool)

(assert (=> b!916490 (= e!514467 (and e!514463 mapRes!30765))))

(declare-fun condMapEmpty!30765 () Bool)

(declare-fun mapDefault!30765 () ValueCell!9188)

