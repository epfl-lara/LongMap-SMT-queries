; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79380 () Bool)

(assert start!79380)

(declare-fun b_free!17567 () Bool)

(declare-fun b_next!17567 () Bool)

(assert (=> start!79380 (= b_free!17567 (not b_next!17567))))

(declare-fun tp!61145 () Bool)

(declare-fun b_and!28693 () Bool)

(assert (=> start!79380 (= tp!61145 b_and!28693)))

(declare-fun res!628109 () Bool)

(declare-fun e!523718 () Bool)

(assert (=> start!79380 (=> (not res!628109) (not e!523718))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79380 (= res!628109 (validMask!0 mask!1881))))

(assert (=> start!79380 e!523718))

(assert (=> start!79380 true))

(declare-fun tp_is_empty!20075 () Bool)

(assert (=> start!79380 tp_is_empty!20075))

(declare-datatypes ((V!31731 0))(
  ( (V!31732 (val!10088 Int)) )
))
(declare-datatypes ((ValueCell!9556 0))(
  ( (ValueCellFull!9556 (v!12607 V!31731)) (EmptyCell!9556) )
))
(declare-datatypes ((array!56088 0))(
  ( (array!56089 (arr!26988 (Array (_ BitVec 32) ValueCell!9556)) (size!27447 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56088)

(declare-fun e!523717 () Bool)

(declare-fun array_inv!21006 (array!56088) Bool)

(assert (=> start!79380 (and (array_inv!21006 _values!1231) e!523717)))

(assert (=> start!79380 tp!61145))

(declare-datatypes ((array!56090 0))(
  ( (array!56091 (arr!26989 (Array (_ BitVec 32) (_ BitVec 64))) (size!27448 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56090)

(declare-fun array_inv!21007 (array!56090) Bool)

(assert (=> start!79380 (array_inv!21007 _keys!1487)))

(declare-fun b!932609 () Bool)

(declare-fun res!628112 () Bool)

(assert (=> b!932609 (=> (not res!628112) (not e!523718))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!932609 (= res!628112 (and (= (size!27447 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27448 _keys!1487) (size!27447 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932610 () Bool)

(declare-fun res!628111 () Bool)

(declare-fun e!523720 () Bool)

(assert (=> b!932610 (=> (not res!628111) (not e!523720))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31731)

(declare-datatypes ((tuple2!13218 0))(
  ( (tuple2!13219 (_1!6620 (_ BitVec 64)) (_2!6620 V!31731)) )
))
(declare-datatypes ((List!19001 0))(
  ( (Nil!18998) (Cons!18997 (h!20143 tuple2!13218) (t!27112 List!19001)) )
))
(declare-datatypes ((ListLongMap!11915 0))(
  ( (ListLongMap!11916 (toList!5973 List!19001)) )
))
(declare-fun lt!419977 () ListLongMap!11915)

(declare-fun apply!786 (ListLongMap!11915 (_ BitVec 64)) V!31731)

(assert (=> b!932610 (= res!628111 (= (apply!786 lt!419977 k!1099) v!791))))

(declare-fun b!932611 () Bool)

(assert (=> b!932611 (= e!523718 e!523720)))

(declare-fun res!628110 () Bool)

(assert (=> b!932611 (=> (not res!628110) (not e!523720))))

(declare-fun contains!5022 (ListLongMap!11915 (_ BitVec 64)) Bool)

(assert (=> b!932611 (= res!628110 (contains!5022 lt!419977 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31731)

(declare-fun minValue!1173 () V!31731)

(declare-fun getCurrentListMap!3211 (array!56090 array!56088 (_ BitVec 32) (_ BitVec 32) V!31731 V!31731 (_ BitVec 32) Int) ListLongMap!11915)

(assert (=> b!932611 (= lt!419977 (getCurrentListMap!3211 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932612 () Bool)

(declare-fun e!523721 () Bool)

(declare-fun mapRes!31872 () Bool)

(assert (=> b!932612 (= e!523717 (and e!523721 mapRes!31872))))

(declare-fun condMapEmpty!31872 () Bool)

(declare-fun mapDefault!31872 () ValueCell!9556)

