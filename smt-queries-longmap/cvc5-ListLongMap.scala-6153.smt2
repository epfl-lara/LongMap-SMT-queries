; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79026 () Bool)

(assert start!79026)

(declare-fun b_free!17239 () Bool)

(declare-fun b_next!17239 () Bool)

(assert (=> start!79026 (= b_free!17239 (not b_next!17239))))

(declare-fun tp!60157 () Bool)

(declare-fun b_and!28215 () Bool)

(assert (=> start!79026 (= tp!60157 b_and!28215)))

(declare-fun b!925825 () Bool)

(declare-fun res!623839 () Bool)

(declare-fun e!519648 () Bool)

(assert (=> b!925825 (=> (not res!623839) (not e!519648))))

(declare-datatypes ((array!55460 0))(
  ( (array!55461 (arr!26675 (Array (_ BitVec 32) (_ BitVec 64))) (size!27134 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55460)

(declare-datatypes ((List!18745 0))(
  ( (Nil!18742) (Cons!18741 (h!19887 (_ BitVec 64)) (t!26714 List!18745)) )
))
(declare-fun arrayNoDuplicates!0 (array!55460 (_ BitVec 32) List!18745) Bool)

(assert (=> b!925825 (= res!623839 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18742))))

(declare-fun mapIsEmpty!31377 () Bool)

(declare-fun mapRes!31377 () Bool)

(assert (=> mapIsEmpty!31377 mapRes!31377))

(declare-fun b!925826 () Bool)

(declare-fun res!623832 () Bool)

(assert (=> b!925826 (=> (not res!623832) (not e!519648))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55460 (_ BitVec 32)) Bool)

(assert (=> b!925826 (= res!623832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925827 () Bool)

(declare-fun e!519652 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!925827 (= e!519652 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925828 () Bool)

(declare-fun res!623834 () Bool)

(assert (=> b!925828 (=> (not res!623834) (not e!519648))))

(declare-datatypes ((V!31295 0))(
  ( (V!31296 (val!9924 Int)) )
))
(declare-datatypes ((ValueCell!9392 0))(
  ( (ValueCellFull!9392 (v!12442 V!31295)) (EmptyCell!9392) )
))
(declare-datatypes ((array!55462 0))(
  ( (array!55463 (arr!26676 (Array (_ BitVec 32) ValueCell!9392)) (size!27135 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55462)

(assert (=> b!925828 (= res!623834 (and (= (size!27135 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27134 _keys!1487) (size!27135 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925829 () Bool)

(declare-fun e!519650 () Bool)

(declare-fun e!519651 () Bool)

(assert (=> b!925829 (= e!519650 (and e!519651 mapRes!31377))))

(declare-fun condMapEmpty!31377 () Bool)

(declare-fun mapDefault!31377 () ValueCell!9392)

