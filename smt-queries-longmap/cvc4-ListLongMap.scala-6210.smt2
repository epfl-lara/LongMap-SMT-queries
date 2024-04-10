; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79398 () Bool)

(assert start!79398)

(declare-fun b_free!17585 () Bool)

(declare-fun b_next!17585 () Bool)

(assert (=> start!79398 (= b_free!17585 (not b_next!17585))))

(declare-fun tp!61199 () Bool)

(declare-fun b_and!28729 () Bool)

(assert (=> start!79398 (= tp!61199 b_and!28729)))

(declare-fun mapIsEmpty!31899 () Bool)

(declare-fun mapRes!31899 () Bool)

(assert (=> mapIsEmpty!31899 mapRes!31899))

(declare-fun b!932978 () Bool)

(declare-fun e!523907 () Bool)

(declare-fun tp_is_empty!20093 () Bool)

(assert (=> b!932978 (= e!523907 tp_is_empty!20093)))

(declare-fun b!932979 () Bool)

(declare-fun res!628381 () Bool)

(declare-fun e!523906 () Bool)

(assert (=> b!932979 (=> (not res!628381) (not e!523906))))

(declare-datatypes ((array!56122 0))(
  ( (array!56123 (arr!27005 (Array (_ BitVec 32) (_ BitVec 64))) (size!27464 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56122)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56122 (_ BitVec 32)) Bool)

(assert (=> b!932979 (= res!628381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932980 () Bool)

(declare-fun res!628380 () Bool)

(assert (=> b!932980 (=> (not res!628380) (not e!523906))))

(declare-datatypes ((List!19014 0))(
  ( (Nil!19011) (Cons!19010 (h!20156 (_ BitVec 64)) (t!27143 List!19014)) )
))
(declare-fun arrayNoDuplicates!0 (array!56122 (_ BitVec 32) List!19014) Bool)

(assert (=> b!932980 (= res!628380 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19011))))

(declare-fun b!932981 () Bool)

(declare-fun e!523908 () Bool)

(assert (=> b!932981 (= e!523908 (not true))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932981 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19011)))

(declare-datatypes ((Unit!31483 0))(
  ( (Unit!31484) )
))
(declare-fun lt!420164 () Unit!31483)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56122 (_ BitVec 32) (_ BitVec 32)) Unit!31483)

(assert (=> b!932981 (= lt!420164 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31755 0))(
  ( (V!31756 (val!10097 Int)) )
))
(declare-datatypes ((tuple2!13232 0))(
  ( (tuple2!13233 (_1!6627 (_ BitVec 64)) (_2!6627 V!31755)) )
))
(declare-datatypes ((List!19015 0))(
  ( (Nil!19012) (Cons!19011 (h!20157 tuple2!13232) (t!27144 List!19015)) )
))
(declare-datatypes ((ListLongMap!11929 0))(
  ( (ListLongMap!11930 (toList!5980 List!19015)) )
))
(declare-fun lt!420170 () ListLongMap!11929)

(declare-fun lt!420168 () tuple2!13232)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5029 (ListLongMap!11929 (_ BitVec 64)) Bool)

(declare-fun +!2784 (ListLongMap!11929 tuple2!13232) ListLongMap!11929)

(assert (=> b!932981 (contains!5029 (+!2784 lt!420170 lt!420168) k!1099)))

(declare-fun lt!420166 () Unit!31483)

(declare-fun lt!420165 () (_ BitVec 64))

(declare-fun lt!420169 () V!31755)

(declare-fun addStillContains!503 (ListLongMap!11929 (_ BitVec 64) V!31755 (_ BitVec 64)) Unit!31483)

(assert (=> b!932981 (= lt!420166 (addStillContains!503 lt!420170 lt!420165 lt!420169 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9565 0))(
  ( (ValueCellFull!9565 (v!12616 V!31755)) (EmptyCell!9565) )
))
(declare-datatypes ((array!56124 0))(
  ( (array!56125 (arr!27006 (Array (_ BitVec 32) ValueCell!9565)) (size!27465 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56124)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31755)

(declare-fun minValue!1173 () V!31755)

(declare-fun getCurrentListMap!3218 (array!56122 array!56124 (_ BitVec 32) (_ BitVec 32) V!31755 V!31755 (_ BitVec 32) Int) ListLongMap!11929)

(assert (=> b!932981 (= (getCurrentListMap!3218 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2784 (getCurrentListMap!3218 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420168))))

(assert (=> b!932981 (= lt!420168 (tuple2!13233 lt!420165 lt!420169))))

(declare-fun get!14204 (ValueCell!9565 V!31755) V!31755)

(declare-fun dynLambda!1573 (Int (_ BitVec 64)) V!31755)

(assert (=> b!932981 (= lt!420169 (get!14204 (select (arr!27006 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1573 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420167 () Unit!31483)

(declare-fun lemmaListMapRecursiveValidKeyArray!174 (array!56122 array!56124 (_ BitVec 32) (_ BitVec 32) V!31755 V!31755 (_ BitVec 32) Int) Unit!31483)

(assert (=> b!932981 (= lt!420167 (lemmaListMapRecursiveValidKeyArray!174 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932982 () Bool)

(declare-fun res!628382 () Bool)

(assert (=> b!932982 (=> (not res!628382) (not e!523906))))

(assert (=> b!932982 (= res!628382 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27464 _keys!1487))))))

(declare-fun res!628375 () Bool)

(assert (=> start!79398 (=> (not res!628375) (not e!523906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79398 (= res!628375 (validMask!0 mask!1881))))

(assert (=> start!79398 e!523906))

(assert (=> start!79398 true))

(assert (=> start!79398 tp_is_empty!20093))

(declare-fun e!523911 () Bool)

(declare-fun array_inv!21018 (array!56124) Bool)

(assert (=> start!79398 (and (array_inv!21018 _values!1231) e!523911)))

(assert (=> start!79398 tp!61199))

(declare-fun array_inv!21019 (array!56122) Bool)

(assert (=> start!79398 (array_inv!21019 _keys!1487)))

(declare-fun b!932983 () Bool)

(declare-fun e!523905 () Bool)

(assert (=> b!932983 (= e!523905 tp_is_empty!20093)))

(declare-fun b!932984 () Bool)

(declare-fun res!628379 () Bool)

(declare-fun e!523909 () Bool)

(assert (=> b!932984 (=> (not res!628379) (not e!523909))))

(declare-fun v!791 () V!31755)

(declare-fun apply!793 (ListLongMap!11929 (_ BitVec 64)) V!31755)

(assert (=> b!932984 (= res!628379 (= (apply!793 lt!420170 k!1099) v!791))))

(declare-fun mapNonEmpty!31899 () Bool)

(declare-fun tp!61198 () Bool)

(assert (=> mapNonEmpty!31899 (= mapRes!31899 (and tp!61198 e!523905))))

(declare-fun mapRest!31899 () (Array (_ BitVec 32) ValueCell!9565))

(declare-fun mapKey!31899 () (_ BitVec 32))

(declare-fun mapValue!31899 () ValueCell!9565)

(assert (=> mapNonEmpty!31899 (= (arr!27006 _values!1231) (store mapRest!31899 mapKey!31899 mapValue!31899))))

(declare-fun b!932985 () Bool)

(declare-fun res!628384 () Bool)

(assert (=> b!932985 (=> (not res!628384) (not e!523909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932985 (= res!628384 (validKeyInArray!0 k!1099))))

(declare-fun b!932986 () Bool)

(assert (=> b!932986 (= e!523906 e!523909)))

(declare-fun res!628378 () Bool)

(assert (=> b!932986 (=> (not res!628378) (not e!523909))))

(assert (=> b!932986 (= res!628378 (contains!5029 lt!420170 k!1099))))

(assert (=> b!932986 (= lt!420170 (getCurrentListMap!3218 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932987 () Bool)

(declare-fun res!628377 () Bool)

(assert (=> b!932987 (=> (not res!628377) (not e!523909))))

(assert (=> b!932987 (= res!628377 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932988 () Bool)

(assert (=> b!932988 (= e!523909 e!523908)))

(declare-fun res!628376 () Bool)

(assert (=> b!932988 (=> (not res!628376) (not e!523908))))

(assert (=> b!932988 (= res!628376 (validKeyInArray!0 lt!420165))))

(assert (=> b!932988 (= lt!420165 (select (arr!27005 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932989 () Bool)

(declare-fun res!628383 () Bool)

(assert (=> b!932989 (=> (not res!628383) (not e!523906))))

(assert (=> b!932989 (= res!628383 (and (= (size!27465 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27464 _keys!1487) (size!27465 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932990 () Bool)

(assert (=> b!932990 (= e!523911 (and e!523907 mapRes!31899))))

(declare-fun condMapEmpty!31899 () Bool)

(declare-fun mapDefault!31899 () ValueCell!9565)

