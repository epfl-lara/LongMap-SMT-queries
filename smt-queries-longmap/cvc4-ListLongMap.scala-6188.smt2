; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79240 () Bool)

(assert start!79240)

(declare-fun b_free!17453 () Bool)

(declare-fun b_next!17453 () Bool)

(assert (=> start!79240 (= b_free!17453 (not b_next!17453))))

(declare-fun tp!60799 () Bool)

(declare-fun b_and!28519 () Bool)

(assert (=> start!79240 (= tp!60799 b_and!28519)))

(declare-fun b!930489 () Bool)

(declare-fun res!626649 () Bool)

(declare-fun e!522504 () Bool)

(assert (=> b!930489 (=> (not res!626649) (not e!522504))))

(declare-datatypes ((array!55868 0))(
  ( (array!55869 (arr!26879 (Array (_ BitVec 32) (_ BitVec 64))) (size!27338 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55868)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31579 0))(
  ( (V!31580 (val!10031 Int)) )
))
(declare-datatypes ((ValueCell!9499 0))(
  ( (ValueCellFull!9499 (v!12549 V!31579)) (EmptyCell!9499) )
))
(declare-datatypes ((array!55870 0))(
  ( (array!55871 (arr!26880 (Array (_ BitVec 32) ValueCell!9499)) (size!27339 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55870)

(assert (=> b!930489 (= res!626649 (and (= (size!27339 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27338 _keys!1487) (size!27339 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930490 () Bool)

(declare-fun res!626645 () Bool)

(declare-fun e!522505 () Bool)

(assert (=> b!930490 (=> (not res!626645) (not e!522505))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31579)

(declare-datatypes ((tuple2!13126 0))(
  ( (tuple2!13127 (_1!6574 (_ BitVec 64)) (_2!6574 V!31579)) )
))
(declare-datatypes ((List!18918 0))(
  ( (Nil!18915) (Cons!18914 (h!20060 tuple2!13126) (t!26975 List!18918)) )
))
(declare-datatypes ((ListLongMap!11823 0))(
  ( (ListLongMap!11824 (toList!5927 List!18918)) )
))
(declare-fun lt!419239 () ListLongMap!11823)

(declare-fun apply!749 (ListLongMap!11823 (_ BitVec 64)) V!31579)

(assert (=> b!930490 (= res!626645 (= (apply!749 lt!419239 k!1099) v!791))))

(declare-fun b!930491 () Bool)

(declare-fun res!626646 () Bool)

(assert (=> b!930491 (=> (not res!626646) (not e!522504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55868 (_ BitVec 32)) Bool)

(assert (=> b!930491 (= res!626646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930492 () Bool)

(declare-fun res!626647 () Bool)

(assert (=> b!930492 (=> (not res!626647) (not e!522504))))

(declare-datatypes ((List!18919 0))(
  ( (Nil!18916) (Cons!18915 (h!20061 (_ BitVec 64)) (t!26976 List!18919)) )
))
(declare-fun arrayNoDuplicates!0 (array!55868 (_ BitVec 32) List!18919) Bool)

(assert (=> b!930492 (= res!626647 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18916))))

(declare-fun res!626651 () Bool)

(assert (=> start!79240 (=> (not res!626651) (not e!522504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79240 (= res!626651 (validMask!0 mask!1881))))

(assert (=> start!79240 e!522504))

(assert (=> start!79240 true))

(declare-fun tp_is_empty!19961 () Bool)

(assert (=> start!79240 tp_is_empty!19961))

(declare-fun e!522501 () Bool)

(declare-fun array_inv!20920 (array!55870) Bool)

(assert (=> start!79240 (and (array_inv!20920 _values!1231) e!522501)))

(assert (=> start!79240 tp!60799))

(declare-fun array_inv!20921 (array!55868) Bool)

(assert (=> start!79240 (array_inv!20921 _keys!1487)))

(declare-fun b!930493 () Bool)

(declare-fun e!522500 () Bool)

(assert (=> b!930493 (= e!522500 tp_is_empty!19961)))

(declare-fun b!930494 () Bool)

(declare-fun res!626652 () Bool)

(assert (=> b!930494 (=> (not res!626652) (not e!522505))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930494 (= res!626652 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930495 () Bool)

(declare-fun res!626653 () Bool)

(assert (=> b!930495 (=> (not res!626653) (not e!522504))))

(assert (=> b!930495 (= res!626653 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27338 _keys!1487))))))

(declare-fun b!930496 () Bool)

(declare-fun mapRes!31698 () Bool)

(assert (=> b!930496 (= e!522501 (and e!522500 mapRes!31698))))

(declare-fun condMapEmpty!31698 () Bool)

(declare-fun mapDefault!31698 () ValueCell!9499)

