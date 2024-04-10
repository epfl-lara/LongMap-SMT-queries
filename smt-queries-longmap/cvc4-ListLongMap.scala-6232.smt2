; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79668 () Bool)

(assert start!79668)

(declare-fun b_free!17717 () Bool)

(declare-fun b_next!17717 () Bool)

(assert (=> start!79668 (= b_free!17717 (not b_next!17717))))

(declare-fun tp!61607 () Bool)

(declare-fun b_and!29025 () Bool)

(assert (=> start!79668 (= tp!61607 b_and!29025)))

(declare-fun b!936888 () Bool)

(declare-fun e!526077 () Bool)

(declare-fun e!526081 () Bool)

(assert (=> b!936888 (= e!526077 e!526081)))

(declare-fun res!630727 () Bool)

(assert (=> b!936888 (=> (not res!630727) (not e!526081))))

(declare-datatypes ((V!31931 0))(
  ( (V!31932 (val!10163 Int)) )
))
(declare-datatypes ((tuple2!13348 0))(
  ( (tuple2!13349 (_1!6685 (_ BitVec 64)) (_2!6685 V!31931)) )
))
(declare-datatypes ((List!19127 0))(
  ( (Nil!19124) (Cons!19123 (h!20269 tuple2!13348) (t!27388 List!19127)) )
))
(declare-datatypes ((ListLongMap!12045 0))(
  ( (ListLongMap!12046 (toList!6038 List!19127)) )
))
(declare-fun lt!422581 () ListLongMap!12045)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5097 (ListLongMap!12045 (_ BitVec 64)) Bool)

(assert (=> b!936888 (= res!630727 (contains!5097 lt!422581 k!1099))))

(declare-datatypes ((array!56390 0))(
  ( (array!56391 (arr!27135 (Array (_ BitVec 32) (_ BitVec 64))) (size!27594 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56390)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9631 0))(
  ( (ValueCellFull!9631 (v!12688 V!31931)) (EmptyCell!9631) )
))
(declare-datatypes ((array!56392 0))(
  ( (array!56393 (arr!27136 (Array (_ BitVec 32) ValueCell!9631)) (size!27595 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56392)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31931)

(declare-fun minValue!1173 () V!31931)

(declare-fun getCurrentListMap!3273 (array!56390 array!56392 (_ BitVec 32) (_ BitVec 32) V!31931 V!31931 (_ BitVec 32) Int) ListLongMap!12045)

(assert (=> b!936888 (= lt!422581 (getCurrentListMap!3273 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936889 () Bool)

(declare-fun e!526078 () Bool)

(assert (=> b!936889 (= e!526078 false)))

(declare-datatypes ((Unit!31613 0))(
  ( (Unit!31614) )
))
(declare-fun lt!422574 () Unit!31613)

(declare-fun e!526085 () Unit!31613)

(assert (=> b!936889 (= lt!422574 e!526085)))

(declare-fun c!97478 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936889 (= c!97478 (validKeyInArray!0 k!1099))))

(declare-fun b!936890 () Bool)

(declare-fun e!526086 () Bool)

(assert (=> b!936890 (= e!526086 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936891 () Bool)

(declare-fun res!630725 () Bool)

(assert (=> b!936891 (=> (not res!630725) (not e!526077))))

(assert (=> b!936891 (= res!630725 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27594 _keys!1487))))))

(declare-fun b!936892 () Bool)

(declare-fun res!630721 () Bool)

(assert (=> b!936892 (=> (not res!630721) (not e!526077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56390 (_ BitVec 32)) Bool)

(assert (=> b!936892 (= res!630721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936893 () Bool)

(assert (=> b!936893 (= e!526081 e!526078)))

(declare-fun res!630726 () Bool)

(assert (=> b!936893 (=> (not res!630726) (not e!526078))))

(declare-fun lt!422577 () V!31931)

(declare-fun v!791 () V!31931)

(assert (=> b!936893 (= res!630726 (and (= lt!422577 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!840 (ListLongMap!12045 (_ BitVec 64)) V!31931)

(assert (=> b!936893 (= lt!422577 (apply!840 lt!422581 k!1099))))

(declare-fun b!936894 () Bool)

(declare-fun e!526079 () Unit!31613)

(assert (=> b!936894 (= e!526085 e!526079)))

(declare-fun lt!422580 () (_ BitVec 64))

(assert (=> b!936894 (= lt!422580 (select (arr!27135 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97477 () Bool)

(assert (=> b!936894 (= c!97477 (validKeyInArray!0 lt!422580))))

(declare-fun mapNonEmpty!32109 () Bool)

(declare-fun mapRes!32109 () Bool)

(declare-fun tp!61606 () Bool)

(declare-fun e!526080 () Bool)

(assert (=> mapNonEmpty!32109 (= mapRes!32109 (and tp!61606 e!526080))))

(declare-fun mapRest!32109 () (Array (_ BitVec 32) ValueCell!9631))

(declare-fun mapValue!32109 () ValueCell!9631)

(declare-fun mapKey!32109 () (_ BitVec 32))

(assert (=> mapNonEmpty!32109 (= (arr!27136 _values!1231) (store mapRest!32109 mapKey!32109 mapValue!32109))))

(declare-fun b!936895 () Bool)

(declare-fun Unit!31615 () Unit!31613)

(assert (=> b!936895 (= e!526079 Unit!31615)))

(declare-fun res!630724 () Bool)

(assert (=> start!79668 (=> (not res!630724) (not e!526077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79668 (= res!630724 (validMask!0 mask!1881))))

(assert (=> start!79668 e!526077))

(assert (=> start!79668 true))

(declare-fun tp_is_empty!20225 () Bool)

(assert (=> start!79668 tp_is_empty!20225))

(declare-fun e!526082 () Bool)

(declare-fun array_inv!21112 (array!56392) Bool)

(assert (=> start!79668 (and (array_inv!21112 _values!1231) e!526082)))

(assert (=> start!79668 tp!61607))

(declare-fun array_inv!21113 (array!56390) Bool)

(assert (=> start!79668 (array_inv!21113 _keys!1487)))

(declare-fun b!936896 () Bool)

(declare-fun res!630722 () Bool)

(assert (=> b!936896 (=> (not res!630722) (not e!526077))))

(assert (=> b!936896 (= res!630722 (and (= (size!27595 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27594 _keys!1487) (size!27595 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32109 () Bool)

(assert (=> mapIsEmpty!32109 mapRes!32109))

(declare-fun b!936897 () Bool)

(assert (=> b!936897 (= e!526080 tp_is_empty!20225)))

(declare-fun b!936898 () Bool)

(declare-fun e!526083 () Bool)

(assert (=> b!936898 (= e!526082 (and e!526083 mapRes!32109))))

(declare-fun condMapEmpty!32109 () Bool)

(declare-fun mapDefault!32109 () ValueCell!9631)

