; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78712 () Bool)

(assert start!78712)

(declare-fun b_free!16925 () Bool)

(declare-fun b_next!16925 () Bool)

(assert (=> start!78712 (= b_free!16925 (not b_next!16925))))

(declare-fun tp!59215 () Bool)

(declare-fun b_and!27587 () Bool)

(assert (=> start!78712 (= tp!59215 b_and!27587)))

(declare-fun b!918042 () Bool)

(declare-fun res!618943 () Bool)

(declare-fun e!515377 () Bool)

(assert (=> b!918042 (=> (not res!618943) (not e!515377))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918042 (= res!618943 (validKeyInArray!0 k!1099))))

(declare-fun mapIsEmpty!30906 () Bool)

(declare-fun mapRes!30906 () Bool)

(assert (=> mapIsEmpty!30906 mapRes!30906))

(declare-fun b!918043 () Bool)

(declare-fun res!618946 () Bool)

(assert (=> b!918043 (=> (not res!618946) (not e!515377))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918043 (= res!618946 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918044 () Bool)

(declare-fun e!515375 () Bool)

(declare-fun tp_is_empty!19433 () Bool)

(assert (=> b!918044 (= e!515375 tp_is_empty!19433)))

(declare-fun mapNonEmpty!30906 () Bool)

(declare-fun tp!59216 () Bool)

(declare-fun e!515376 () Bool)

(assert (=> mapNonEmpty!30906 (= mapRes!30906 (and tp!59216 e!515376))))

(declare-fun mapKey!30906 () (_ BitVec 32))

(declare-datatypes ((V!30875 0))(
  ( (V!30876 (val!9767 Int)) )
))
(declare-datatypes ((ValueCell!9235 0))(
  ( (ValueCellFull!9235 (v!12285 V!30875)) (EmptyCell!9235) )
))
(declare-fun mapRest!30906 () (Array (_ BitVec 32) ValueCell!9235))

(declare-datatypes ((array!54850 0))(
  ( (array!54851 (arr!26370 (Array (_ BitVec 32) ValueCell!9235)) (size!26829 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54850)

(declare-fun mapValue!30906 () ValueCell!9235)

(assert (=> mapNonEmpty!30906 (= (arr!26370 _values!1231) (store mapRest!30906 mapKey!30906 mapValue!30906))))

(declare-fun b!918045 () Bool)

(declare-fun res!618944 () Bool)

(declare-fun e!515371 () Bool)

(assert (=> b!918045 (=> (not res!618944) (not e!515371))))

(declare-datatypes ((array!54852 0))(
  ( (array!54853 (arr!26371 (Array (_ BitVec 32) (_ BitVec 64))) (size!26830 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54852)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54852 (_ BitVec 32)) Bool)

(assert (=> b!918045 (= res!618944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918046 () Bool)

(declare-fun res!618941 () Bool)

(assert (=> b!918046 (=> (not res!618941) (not e!515377))))

(declare-fun v!791 () V!30875)

(declare-datatypes ((tuple2!12688 0))(
  ( (tuple2!12689 (_1!6355 (_ BitVec 64)) (_2!6355 V!30875)) )
))
(declare-datatypes ((List!18495 0))(
  ( (Nil!18492) (Cons!18491 (h!19637 tuple2!12688) (t!26150 List!18495)) )
))
(declare-datatypes ((ListLongMap!11385 0))(
  ( (ListLongMap!11386 (toList!5708 List!18495)) )
))
(declare-fun lt!412145 () ListLongMap!11385)

(declare-fun apply!558 (ListLongMap!11385 (_ BitVec 64)) V!30875)

(assert (=> b!918046 (= res!618941 (= (apply!558 lt!412145 k!1099) v!791))))

(declare-fun res!618942 () Bool)

(assert (=> start!78712 (=> (not res!618942) (not e!515371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78712 (= res!618942 (validMask!0 mask!1881))))

(assert (=> start!78712 e!515371))

(assert (=> start!78712 true))

(assert (=> start!78712 tp_is_empty!19433))

(declare-fun e!515373 () Bool)

(declare-fun array_inv!20562 (array!54850) Bool)

(assert (=> start!78712 (and (array_inv!20562 _values!1231) e!515373)))

(assert (=> start!78712 tp!59215))

(declare-fun array_inv!20563 (array!54852) Bool)

(assert (=> start!78712 (array_inv!20563 _keys!1487)))

(declare-fun b!918047 () Bool)

(assert (=> b!918047 (= e!515373 (and e!515375 mapRes!30906))))

(declare-fun condMapEmpty!30906 () Bool)

(declare-fun mapDefault!30906 () ValueCell!9235)

