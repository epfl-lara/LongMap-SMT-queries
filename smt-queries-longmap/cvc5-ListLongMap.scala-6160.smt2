; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79068 () Bool)

(assert start!79068)

(declare-fun b_free!17281 () Bool)

(declare-fun b_next!17281 () Bool)

(assert (=> start!79068 (= b_free!17281 (not b_next!17281))))

(declare-fun tp!60283 () Bool)

(declare-fun b_and!28299 () Bool)

(assert (=> start!79068 (= tp!60283 b_and!28299)))

(declare-fun b!927127 () Bool)

(declare-fun res!624531 () Bool)

(declare-fun e!520472 () Bool)

(assert (=> b!927127 (=> (not res!624531) (not e!520472))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55540 0))(
  ( (array!55541 (arr!26715 (Array (_ BitVec 32) (_ BitVec 64))) (size!27174 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55540)

(assert (=> b!927127 (= res!624531 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27174 _keys!1487))))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31351 0))(
  ( (V!31352 (val!9945 Int)) )
))
(declare-fun v!791 () V!31351)

(declare-fun e!520463 () Bool)

(declare-fun b!927128 () Bool)

(declare-datatypes ((tuple2!12980 0))(
  ( (tuple2!12981 (_1!6501 (_ BitVec 64)) (_2!6501 V!31351)) )
))
(declare-datatypes ((List!18781 0))(
  ( (Nil!18778) (Cons!18777 (h!19923 tuple2!12980) (t!26792 List!18781)) )
))
(declare-datatypes ((ListLongMap!11677 0))(
  ( (ListLongMap!11678 (toList!5854 List!18781)) )
))
(declare-fun lt!417779 () ListLongMap!11677)

(declare-fun apply!684 (ListLongMap!11677 (_ BitVec 64)) V!31351)

(assert (=> b!927128 (= e!520463 (= (apply!684 lt!417779 k!1099) v!791))))

(declare-fun b!927129 () Bool)

(declare-fun res!624534 () Bool)

(declare-fun e!520464 () Bool)

(assert (=> b!927129 (=> (not res!624534) (not e!520464))))

(declare-fun lt!417770 () ListLongMap!11677)

(assert (=> b!927129 (= res!624534 (= (apply!684 lt!417770 k!1099) v!791))))

(declare-fun b!927130 () Bool)

(declare-fun e!520474 () Bool)

(declare-fun tp_is_empty!19789 () Bool)

(assert (=> b!927130 (= e!520474 tp_is_empty!19789)))

(declare-fun mapIsEmpty!31440 () Bool)

(declare-fun mapRes!31440 () Bool)

(assert (=> mapIsEmpty!31440 mapRes!31440))

(declare-fun b!927131 () Bool)

(declare-fun res!624533 () Bool)

(assert (=> b!927131 (=> (not res!624533) (not e!520472))))

(declare-datatypes ((List!18782 0))(
  ( (Nil!18779) (Cons!18778 (h!19924 (_ BitVec 64)) (t!26793 List!18782)) )
))
(declare-fun arrayNoDuplicates!0 (array!55540 (_ BitVec 32) List!18782) Bool)

(assert (=> b!927131 (= res!624533 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18779))))

(declare-fun b!927132 () Bool)

(declare-fun e!520467 () Bool)

(declare-fun e!520470 () Bool)

(assert (=> b!927132 (= e!520467 (and e!520470 mapRes!31440))))

(declare-fun condMapEmpty!31440 () Bool)

(declare-datatypes ((ValueCell!9413 0))(
  ( (ValueCellFull!9413 (v!12463 V!31351)) (EmptyCell!9413) )
))
(declare-datatypes ((array!55542 0))(
  ( (array!55543 (arr!26716 (Array (_ BitVec 32) ValueCell!9413)) (size!27175 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55542)

(declare-fun mapDefault!31440 () ValueCell!9413)

