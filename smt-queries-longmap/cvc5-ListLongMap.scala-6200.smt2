; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79308 () Bool)

(assert start!79308)

(declare-fun b_free!17521 () Bool)

(declare-fun b_next!17521 () Bool)

(assert (=> start!79308 (= b_free!17521 (not b_next!17521))))

(declare-fun tp!61003 () Bool)

(declare-fun b_and!28593 () Bool)

(assert (=> start!79308 (= tp!61003 b_and!28593)))

(declare-fun b!931496 () Bool)

(declare-fun e!523125 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!31671 0))(
  ( (V!31672 (val!10065 Int)) )
))
(declare-datatypes ((ValueCell!9533 0))(
  ( (ValueCellFull!9533 (v!12583 V!31671)) (EmptyCell!9533) )
))
(declare-datatypes ((array!55998 0))(
  ( (array!55999 (arr!26944 (Array (_ BitVec 32) ValueCell!9533)) (size!27403 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55998)

(assert (=> b!931496 (= e!523125 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27403 _values!1231))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!419445 () (_ BitVec 64))

(declare-datatypes ((array!56000 0))(
  ( (array!56001 (arr!26945 (Array (_ BitVec 32) (_ BitVec 64))) (size!27404 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56000)

(declare-fun zeroValue!1173 () V!31671)

(declare-fun minValue!1173 () V!31671)

(declare-datatypes ((tuple2!13182 0))(
  ( (tuple2!13183 (_1!6602 (_ BitVec 64)) (_2!6602 V!31671)) )
))
(declare-datatypes ((List!18967 0))(
  ( (Nil!18964) (Cons!18963 (h!20109 tuple2!13182) (t!27032 List!18967)) )
))
(declare-datatypes ((ListLongMap!11879 0))(
  ( (ListLongMap!11880 (toList!5955 List!18967)) )
))
(declare-fun getCurrentListMap!3193 (array!56000 array!55998 (_ BitVec 32) (_ BitVec 32) V!31671 V!31671 (_ BitVec 32) Int) ListLongMap!11879)

(declare-fun +!2762 (ListLongMap!11879 tuple2!13182) ListLongMap!11879)

(declare-fun get!14159 (ValueCell!9533 V!31671) V!31671)

(declare-fun dynLambda!1551 (Int (_ BitVec 64)) V!31671)

(assert (=> b!931496 (= (getCurrentListMap!3193 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2762 (getCurrentListMap!3193 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!13183 lt!419445 (get!14159 (select (arr!26944 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1551 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31434 0))(
  ( (Unit!31435) )
))
(declare-fun lt!419444 () Unit!31434)

(declare-fun lemmaListMapRecursiveValidKeyArray!152 (array!56000 array!55998 (_ BitVec 32) (_ BitVec 32) V!31671 V!31671 (_ BitVec 32) Int) Unit!31434)

(assert (=> b!931496 (= lt!419444 (lemmaListMapRecursiveValidKeyArray!152 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931497 () Bool)

(declare-fun e!523124 () Bool)

(declare-fun e!523129 () Bool)

(assert (=> b!931497 (= e!523124 e!523129)))

(declare-fun res!627341 () Bool)

(assert (=> b!931497 (=> (not res!627341) (not e!523129))))

(declare-fun lt!419446 () ListLongMap!11879)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5002 (ListLongMap!11879 (_ BitVec 64)) Bool)

(assert (=> b!931497 (= res!627341 (contains!5002 lt!419446 k!1099))))

(assert (=> b!931497 (= lt!419446 (getCurrentListMap!3193 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931498 () Bool)

(declare-fun res!627348 () Bool)

(assert (=> b!931498 (=> (not res!627348) (not e!523129))))

(assert (=> b!931498 (= res!627348 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31800 () Bool)

(declare-fun mapRes!31800 () Bool)

(declare-fun tp!61004 () Bool)

(declare-fun e!523128 () Bool)

(assert (=> mapNonEmpty!31800 (= mapRes!31800 (and tp!61004 e!523128))))

(declare-fun mapKey!31800 () (_ BitVec 32))

(declare-fun mapRest!31800 () (Array (_ BitVec 32) ValueCell!9533))

(declare-fun mapValue!31800 () ValueCell!9533)

(assert (=> mapNonEmpty!31800 (= (arr!26944 _values!1231) (store mapRest!31800 mapKey!31800 mapValue!31800))))

(declare-fun b!931499 () Bool)

(declare-fun tp_is_empty!20029 () Bool)

(assert (=> b!931499 (= e!523128 tp_is_empty!20029)))

(declare-fun b!931500 () Bool)

(declare-fun res!627340 () Bool)

(assert (=> b!931500 (=> (not res!627340) (not e!523124))))

(assert (=> b!931500 (= res!627340 (and (= (size!27403 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27404 _keys!1487) (size!27403 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931501 () Bool)

(declare-fun e!523127 () Bool)

(assert (=> b!931501 (= e!523127 tp_is_empty!20029)))

(declare-fun res!627343 () Bool)

(assert (=> start!79308 (=> (not res!627343) (not e!523124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79308 (= res!627343 (validMask!0 mask!1881))))

(assert (=> start!79308 e!523124))

(assert (=> start!79308 true))

(assert (=> start!79308 tp_is_empty!20029))

(declare-fun e!523123 () Bool)

(declare-fun array_inv!20972 (array!55998) Bool)

(assert (=> start!79308 (and (array_inv!20972 _values!1231) e!523123)))

(assert (=> start!79308 tp!61003))

(declare-fun array_inv!20973 (array!56000) Bool)

(assert (=> start!79308 (array_inv!20973 _keys!1487)))

(declare-fun b!931502 () Bool)

(declare-fun res!627345 () Bool)

(assert (=> b!931502 (=> (not res!627345) (not e!523124))))

(declare-datatypes ((List!18968 0))(
  ( (Nil!18965) (Cons!18964 (h!20110 (_ BitVec 64)) (t!27033 List!18968)) )
))
(declare-fun arrayNoDuplicates!0 (array!56000 (_ BitVec 32) List!18968) Bool)

(assert (=> b!931502 (= res!627345 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18965))))

(declare-fun b!931503 () Bool)

(declare-fun res!627349 () Bool)

(assert (=> b!931503 (=> (not res!627349) (not e!523129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931503 (= res!627349 (validKeyInArray!0 k!1099))))

(declare-fun mapIsEmpty!31800 () Bool)

(assert (=> mapIsEmpty!31800 mapRes!31800))

(declare-fun b!931504 () Bool)

(assert (=> b!931504 (= e!523123 (and e!523127 mapRes!31800))))

(declare-fun condMapEmpty!31800 () Bool)

(declare-fun mapDefault!31800 () ValueCell!9533)

