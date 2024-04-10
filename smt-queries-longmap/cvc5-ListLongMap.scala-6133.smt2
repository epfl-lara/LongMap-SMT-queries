; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78906 () Bool)

(assert start!78906)

(declare-fun b_free!17119 () Bool)

(declare-fun b_next!17119 () Bool)

(assert (=> start!78906 (= b_free!17119 (not b_next!17119))))

(declare-fun tp!59798 () Bool)

(declare-fun b_and!27975 () Bool)

(assert (=> start!78906 (= tp!59798 b_and!27975)))

(declare-fun mapIsEmpty!31197 () Bool)

(declare-fun mapRes!31197 () Bool)

(assert (=> mapIsEmpty!31197 mapRes!31197))

(declare-fun mapNonEmpty!31197 () Bool)

(declare-fun tp!59797 () Bool)

(declare-fun e!517619 () Bool)

(assert (=> mapNonEmpty!31197 (= mapRes!31197 (and tp!59797 e!517619))))

(declare-datatypes ((V!31135 0))(
  ( (V!31136 (val!9864 Int)) )
))
(declare-datatypes ((ValueCell!9332 0))(
  ( (ValueCellFull!9332 (v!12382 V!31135)) (EmptyCell!9332) )
))
(declare-fun mapValue!31197 () ValueCell!9332)

(declare-fun mapRest!31197 () (Array (_ BitVec 32) ValueCell!9332))

(declare-datatypes ((array!55230 0))(
  ( (array!55231 (arr!26560 (Array (_ BitVec 32) ValueCell!9332)) (size!27019 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55230)

(declare-fun mapKey!31197 () (_ BitVec 32))

(assert (=> mapNonEmpty!31197 (= (arr!26560 _values!1231) (store mapRest!31197 mapKey!31197 mapValue!31197))))

(declare-fun b!922518 () Bool)

(declare-fun tp_is_empty!19627 () Bool)

(assert (=> b!922518 (= e!517619 tp_is_empty!19627)))

(declare-fun b!922519 () Bool)

(declare-fun res!622102 () Bool)

(declare-fun e!517622 () Bool)

(assert (=> b!922519 (=> (not res!622102) (not e!517622))))

(declare-datatypes ((array!55232 0))(
  ( (array!55233 (arr!26561 (Array (_ BitVec 32) (_ BitVec 64))) (size!27020 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55232)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!922519 (= res!622102 (and (= (size!27019 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27020 _keys!1487) (size!27019 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922521 () Bool)

(declare-fun e!517624 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!922521 (= e!517624 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!922522 () Bool)

(declare-fun arrayContainsKey!0 (array!55232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922522 (= e!517624 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!922523 () Bool)

(declare-fun e!517618 () Bool)

(declare-fun e!517623 () Bool)

(assert (=> b!922523 (= e!517618 e!517623)))

(declare-fun res!622098 () Bool)

(assert (=> b!922523 (=> (not res!622098) (not e!517623))))

(declare-fun lt!414287 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922523 (= res!622098 (validKeyInArray!0 lt!414287))))

(assert (=> b!922523 (= lt!414287 (select (arr!26561 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922524 () Bool)

(declare-fun res!622101 () Bool)

(assert (=> b!922524 (=> (not res!622101) (not e!517622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55232 (_ BitVec 32)) Bool)

(assert (=> b!922524 (= res!622101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922525 () Bool)

(declare-fun e!517621 () Bool)

(assert (=> b!922525 (= e!517621 tp_is_empty!19627)))

(declare-fun b!922526 () Bool)

(declare-fun res!622097 () Bool)

(assert (=> b!922526 (=> (not res!622097) (not e!517622))))

(assert (=> b!922526 (= res!622097 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27020 _keys!1487))))))

(declare-fun b!922527 () Bool)

(declare-fun e!517617 () Bool)

(assert (=> b!922527 (= e!517617 (and e!517621 mapRes!31197))))

(declare-fun condMapEmpty!31197 () Bool)

(declare-fun mapDefault!31197 () ValueCell!9332)

