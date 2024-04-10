; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79502 () Bool)

(assert start!79502)

(declare-fun b_free!17657 () Bool)

(declare-fun b_next!17657 () Bool)

(assert (=> start!79502 (= b_free!17657 (not b_next!17657))))

(declare-fun tp!61418 () Bool)

(declare-fun b_and!28881 () Bool)

(assert (=> start!79502 (= tp!61418 b_and!28881)))

(declare-fun b!934755 () Bool)

(declare-fun res!629554 () Bool)

(declare-fun e!524853 () Bool)

(assert (=> b!934755 (=> (not res!629554) (not e!524853))))

(declare-datatypes ((array!56268 0))(
  ( (array!56269 (arr!27077 (Array (_ BitVec 32) (_ BitVec 64))) (size!27536 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56268)

(declare-datatypes ((List!19076 0))(
  ( (Nil!19073) (Cons!19072 (h!20218 (_ BitVec 64)) (t!27277 List!19076)) )
))
(declare-fun arrayNoDuplicates!0 (array!56268 (_ BitVec 32) List!19076) Bool)

(assert (=> b!934755 (= res!629554 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19073))))

(declare-fun mapIsEmpty!32010 () Bool)

(declare-fun mapRes!32010 () Bool)

(assert (=> mapIsEmpty!32010 mapRes!32010))

(declare-fun b!934756 () Bool)

(declare-fun e!524850 () Bool)

(assert (=> b!934756 (= e!524853 e!524850)))

(declare-fun res!629550 () Bool)

(assert (=> b!934756 (=> (not res!629550) (not e!524850))))

(declare-datatypes ((V!31851 0))(
  ( (V!31852 (val!10133 Int)) )
))
(declare-datatypes ((tuple2!13296 0))(
  ( (tuple2!13297 (_1!6659 (_ BitVec 64)) (_2!6659 V!31851)) )
))
(declare-datatypes ((List!19077 0))(
  ( (Nil!19074) (Cons!19073 (h!20219 tuple2!13296) (t!27278 List!19077)) )
))
(declare-datatypes ((ListLongMap!11993 0))(
  ( (ListLongMap!11994 (toList!6012 List!19077)) )
))
(declare-fun lt!421140 () ListLongMap!11993)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5062 (ListLongMap!11993 (_ BitVec 64)) Bool)

(assert (=> b!934756 (= res!629550 (contains!5062 lt!421140 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9601 0))(
  ( (ValueCellFull!9601 (v!12653 V!31851)) (EmptyCell!9601) )
))
(declare-datatypes ((array!56270 0))(
  ( (array!56271 (arr!27078 (Array (_ BitVec 32) ValueCell!9601)) (size!27537 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56270)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31851)

(declare-fun minValue!1173 () V!31851)

(declare-fun getCurrentListMap!3249 (array!56268 array!56270 (_ BitVec 32) (_ BitVec 32) V!31851 V!31851 (_ BitVec 32) Int) ListLongMap!11993)

(assert (=> b!934756 (= lt!421140 (getCurrentListMap!3249 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934757 () Bool)

(declare-fun res!629555 () Bool)

(assert (=> b!934757 (=> (not res!629555) (not e!524850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934757 (= res!629555 (validKeyInArray!0 k!1099))))

(declare-fun mapNonEmpty!32010 () Bool)

(declare-fun tp!61417 () Bool)

(declare-fun e!524846 () Bool)

(assert (=> mapNonEmpty!32010 (= mapRes!32010 (and tp!61417 e!524846))))

(declare-fun mapRest!32010 () (Array (_ BitVec 32) ValueCell!9601))

(declare-fun mapValue!32010 () ValueCell!9601)

(declare-fun mapKey!32010 () (_ BitVec 32))

(assert (=> mapNonEmpty!32010 (= (arr!27078 _values!1231) (store mapRest!32010 mapKey!32010 mapValue!32010))))

(declare-fun b!934758 () Bool)

(declare-fun res!629553 () Bool)

(assert (=> b!934758 (=> (not res!629553) (not e!524850))))

(assert (=> b!934758 (= res!629553 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934759 () Bool)

(declare-fun e!524852 () Bool)

(assert (=> b!934759 (= e!524850 e!524852)))

(declare-fun res!629547 () Bool)

(assert (=> b!934759 (=> (not res!629547) (not e!524852))))

(declare-fun lt!421136 () (_ BitVec 64))

(assert (=> b!934759 (= res!629547 (validKeyInArray!0 lt!421136))))

(assert (=> b!934759 (= lt!421136 (select (arr!27077 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!629551 () Bool)

(assert (=> start!79502 (=> (not res!629551) (not e!524853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79502 (= res!629551 (validMask!0 mask!1881))))

(assert (=> start!79502 e!524853))

(assert (=> start!79502 true))

(declare-fun tp_is_empty!20165 () Bool)

(assert (=> start!79502 tp_is_empty!20165))

(declare-fun e!524849 () Bool)

(declare-fun array_inv!21072 (array!56270) Bool)

(assert (=> start!79502 (and (array_inv!21072 _values!1231) e!524849)))

(assert (=> start!79502 tp!61418))

(declare-fun array_inv!21073 (array!56268) Bool)

(assert (=> start!79502 (array_inv!21073 _keys!1487)))

(declare-fun b!934760 () Bool)

(declare-fun res!629557 () Bool)

(assert (=> b!934760 (=> (not res!629557) (not e!524853))))

(assert (=> b!934760 (= res!629557 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27536 _keys!1487))))))

(declare-fun b!934761 () Bool)

(declare-fun res!629548 () Bool)

(assert (=> b!934761 (=> (not res!629548) (not e!524850))))

(declare-fun v!791 () V!31851)

(declare-fun apply!815 (ListLongMap!11993 (_ BitVec 64)) V!31851)

(assert (=> b!934761 (= res!629548 (= (apply!815 lt!421140 k!1099) v!791))))

(declare-fun b!934762 () Bool)

(declare-fun e!524851 () Bool)

(assert (=> b!934762 (= e!524849 (and e!524851 mapRes!32010))))

(declare-fun condMapEmpty!32010 () Bool)

(declare-fun mapDefault!32010 () ValueCell!9601)

