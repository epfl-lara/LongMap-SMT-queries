; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79386 () Bool)

(assert start!79386)

(declare-fun b_free!17573 () Bool)

(declare-fun b_next!17573 () Bool)

(assert (=> start!79386 (= b_free!17573 (not b_next!17573))))

(declare-fun tp!61163 () Bool)

(declare-fun b_and!28705 () Bool)

(assert (=> start!79386 (= tp!61163 b_and!28705)))

(declare-fun b!932732 () Bool)

(declare-fun e!523779 () Bool)

(declare-fun e!523785 () Bool)

(assert (=> b!932732 (= e!523779 e!523785)))

(declare-fun res!628197 () Bool)

(assert (=> b!932732 (=> (not res!628197) (not e!523785))))

(declare-fun lt!420043 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932732 (= res!628197 (validKeyInArray!0 lt!420043))))

(declare-datatypes ((array!56100 0))(
  ( (array!56101 (arr!26994 (Array (_ BitVec 32) (_ BitVec 64))) (size!27453 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56100)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932732 (= lt!420043 (select (arr!26994 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31881 () Bool)

(declare-fun mapRes!31881 () Bool)

(assert (=> mapIsEmpty!31881 mapRes!31881))

(declare-fun res!628200 () Bool)

(declare-fun e!523780 () Bool)

(assert (=> start!79386 (=> (not res!628200) (not e!523780))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79386 (= res!628200 (validMask!0 mask!1881))))

(assert (=> start!79386 e!523780))

(assert (=> start!79386 true))

(declare-fun tp_is_empty!20081 () Bool)

(assert (=> start!79386 tp_is_empty!20081))

(declare-datatypes ((V!31739 0))(
  ( (V!31740 (val!10091 Int)) )
))
(declare-datatypes ((ValueCell!9559 0))(
  ( (ValueCellFull!9559 (v!12610 V!31739)) (EmptyCell!9559) )
))
(declare-datatypes ((array!56102 0))(
  ( (array!56103 (arr!26995 (Array (_ BitVec 32) ValueCell!9559)) (size!27454 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56102)

(declare-fun e!523781 () Bool)

(declare-fun array_inv!21010 (array!56102) Bool)

(assert (=> start!79386 (and (array_inv!21010 _values!1231) e!523781)))

(assert (=> start!79386 tp!61163))

(declare-fun array_inv!21011 (array!56100) Bool)

(assert (=> start!79386 (array_inv!21011 _keys!1487)))

(declare-fun b!932733 () Bool)

(declare-fun res!628196 () Bool)

(assert (=> b!932733 (=> (not res!628196) (not e!523780))))

(assert (=> b!932733 (= res!628196 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27453 _keys!1487))))))

(declare-fun b!932734 () Bool)

(declare-fun res!628199 () Bool)

(assert (=> b!932734 (=> (not res!628199) (not e!523779))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((tuple2!13224 0))(
  ( (tuple2!13225 (_1!6623 (_ BitVec 64)) (_2!6623 V!31739)) )
))
(declare-datatypes ((List!19006 0))(
  ( (Nil!19003) (Cons!19002 (h!20148 tuple2!13224) (t!27123 List!19006)) )
))
(declare-datatypes ((ListLongMap!11921 0))(
  ( (ListLongMap!11922 (toList!5976 List!19006)) )
))
(declare-fun lt!420042 () ListLongMap!11921)

(declare-fun v!791 () V!31739)

(declare-fun apply!789 (ListLongMap!11921 (_ BitVec 64)) V!31739)

(assert (=> b!932734 (= res!628199 (= (apply!789 lt!420042 k!1099) v!791))))

(declare-fun b!932735 () Bool)

(declare-fun e!523783 () Bool)

(assert (=> b!932735 (= e!523783 tp_is_empty!20081)))

(declare-fun b!932736 () Bool)

(declare-fun res!628202 () Bool)

(assert (=> b!932736 (=> (not res!628202) (not e!523780))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!932736 (= res!628202 (and (= (size!27454 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27453 _keys!1487) (size!27454 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932737 () Bool)

(declare-fun res!628198 () Bool)

(assert (=> b!932737 (=> (not res!628198) (not e!523779))))

(assert (=> b!932737 (= res!628198 (validKeyInArray!0 k!1099))))

(declare-fun b!932738 () Bool)

(assert (=> b!932738 (= e!523785 (not true))))

(declare-datatypes ((List!19007 0))(
  ( (Nil!19004) (Cons!19003 (h!20149 (_ BitVec 64)) (t!27124 List!19007)) )
))
(declare-fun arrayNoDuplicates!0 (array!56100 (_ BitVec 32) List!19007) Bool)

(assert (=> b!932738 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19004)))

(declare-datatypes ((Unit!31475 0))(
  ( (Unit!31476) )
))
(declare-fun lt!420040 () Unit!31475)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56100 (_ BitVec 32) (_ BitVec 32)) Unit!31475)

(assert (=> b!932738 (= lt!420040 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420041 () tuple2!13224)

(declare-fun contains!5025 (ListLongMap!11921 (_ BitVec 64)) Bool)

(declare-fun +!2780 (ListLongMap!11921 tuple2!13224) ListLongMap!11921)

(assert (=> b!932738 (contains!5025 (+!2780 lt!420042 lt!420041) k!1099)))

(declare-fun lt!420038 () V!31739)

(declare-fun lt!420039 () Unit!31475)

(declare-fun addStillContains!499 (ListLongMap!11921 (_ BitVec 64) V!31739 (_ BitVec 64)) Unit!31475)

(assert (=> b!932738 (= lt!420039 (addStillContains!499 lt!420042 lt!420043 lt!420038 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31739)

(declare-fun minValue!1173 () V!31739)

(declare-fun getCurrentListMap!3214 (array!56100 array!56102 (_ BitVec 32) (_ BitVec 32) V!31739 V!31739 (_ BitVec 32) Int) ListLongMap!11921)

(assert (=> b!932738 (= (getCurrentListMap!3214 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2780 (getCurrentListMap!3214 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420041))))

(assert (=> b!932738 (= lt!420041 (tuple2!13225 lt!420043 lt!420038))))

(declare-fun get!14196 (ValueCell!9559 V!31739) V!31739)

(declare-fun dynLambda!1569 (Int (_ BitVec 64)) V!31739)

(assert (=> b!932738 (= lt!420038 (get!14196 (select (arr!26995 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1569 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420044 () Unit!31475)

(declare-fun lemmaListMapRecursiveValidKeyArray!170 (array!56100 array!56102 (_ BitVec 32) (_ BitVec 32) V!31739 V!31739 (_ BitVec 32) Int) Unit!31475)

(assert (=> b!932738 (= lt!420044 (lemmaListMapRecursiveValidKeyArray!170 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932739 () Bool)

(declare-fun res!628204 () Bool)

(assert (=> b!932739 (=> (not res!628204) (not e!523780))))

(assert (=> b!932739 (= res!628204 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19004))))

(declare-fun b!932740 () Bool)

(declare-fun e!523784 () Bool)

(assert (=> b!932740 (= e!523784 tp_is_empty!20081)))

(declare-fun b!932741 () Bool)

(assert (=> b!932741 (= e!523780 e!523779)))

(declare-fun res!628195 () Bool)

(assert (=> b!932741 (=> (not res!628195) (not e!523779))))

(assert (=> b!932741 (= res!628195 (contains!5025 lt!420042 k!1099))))

(assert (=> b!932741 (= lt!420042 (getCurrentListMap!3214 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932742 () Bool)

(assert (=> b!932742 (= e!523781 (and e!523783 mapRes!31881))))

(declare-fun condMapEmpty!31881 () Bool)

(declare-fun mapDefault!31881 () ValueCell!9559)

