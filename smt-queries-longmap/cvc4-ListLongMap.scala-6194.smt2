; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79276 () Bool)

(assert start!79276)

(declare-fun b_free!17489 () Bool)

(declare-fun b_next!17489 () Bool)

(assert (=> start!79276 (= b_free!17489 (not b_next!17489))))

(declare-fun tp!60907 () Bool)

(declare-fun b_and!28555 () Bool)

(assert (=> start!79276 (= tp!60907 b_and!28555)))

(declare-fun b!930978 () Bool)

(declare-fun e!522827 () Bool)

(declare-fun tp_is_empty!19997 () Bool)

(assert (=> b!930978 (= e!522827 tp_is_empty!19997)))

(declare-fun mapNonEmpty!31752 () Bool)

(declare-fun mapRes!31752 () Bool)

(declare-fun tp!60908 () Bool)

(declare-fun e!522826 () Bool)

(assert (=> mapNonEmpty!31752 (= mapRes!31752 (and tp!60908 e!522826))))

(declare-fun mapKey!31752 () (_ BitVec 32))

(declare-datatypes ((V!31627 0))(
  ( (V!31628 (val!10049 Int)) )
))
(declare-datatypes ((ValueCell!9517 0))(
  ( (ValueCellFull!9517 (v!12567 V!31627)) (EmptyCell!9517) )
))
(declare-fun mapValue!31752 () ValueCell!9517)

(declare-fun mapRest!31752 () (Array (_ BitVec 32) ValueCell!9517))

(declare-datatypes ((array!55934 0))(
  ( (array!55935 (arr!26912 (Array (_ BitVec 32) ValueCell!9517)) (size!27371 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55934)

(assert (=> mapNonEmpty!31752 (= (arr!26912 _values!1231) (store mapRest!31752 mapKey!31752 mapValue!31752))))

(declare-fun b!930979 () Bool)

(declare-fun res!626976 () Bool)

(declare-fun e!522829 () Bool)

(assert (=> b!930979 (=> (not res!626976) (not e!522829))))

(declare-datatypes ((array!55936 0))(
  ( (array!55937 (arr!26913 (Array (_ BitVec 32) (_ BitVec 64))) (size!27372 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55936)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930979 (= res!626976 (and (= (size!27371 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27372 _keys!1487) (size!27371 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31752 () Bool)

(assert (=> mapIsEmpty!31752 mapRes!31752))

(declare-fun res!626977 () Bool)

(assert (=> start!79276 (=> (not res!626977) (not e!522829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79276 (= res!626977 (validMask!0 mask!1881))))

(assert (=> start!79276 e!522829))

(assert (=> start!79276 true))

(declare-fun e!522824 () Bool)

(declare-fun array_inv!20944 (array!55934) Bool)

(assert (=> start!79276 (and (array_inv!20944 _values!1231) e!522824)))

(assert (=> start!79276 tp!60907))

(declare-fun array_inv!20945 (array!55936) Bool)

(assert (=> start!79276 (array_inv!20945 _keys!1487)))

(assert (=> start!79276 tp_is_empty!19997))

(declare-fun b!930980 () Bool)

(declare-fun e!522825 () Bool)

(assert (=> b!930980 (= e!522829 e!522825)))

(declare-fun res!626972 () Bool)

(assert (=> b!930980 (=> (not res!626972) (not e!522825))))

(declare-datatypes ((tuple2!13156 0))(
  ( (tuple2!13157 (_1!6589 (_ BitVec 64)) (_2!6589 V!31627)) )
))
(declare-datatypes ((List!18944 0))(
  ( (Nil!18941) (Cons!18940 (h!20086 tuple2!13156) (t!27001 List!18944)) )
))
(declare-datatypes ((ListLongMap!11853 0))(
  ( (ListLongMap!11854 (toList!5942 List!18944)) )
))
(declare-fun lt!419347 () ListLongMap!11853)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4990 (ListLongMap!11853 (_ BitVec 64)) Bool)

(assert (=> b!930980 (= res!626972 (contains!4990 lt!419347 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31627)

(declare-fun minValue!1173 () V!31627)

(declare-fun getCurrentListMap!3181 (array!55936 array!55934 (_ BitVec 32) (_ BitVec 32) V!31627 V!31627 (_ BitVec 32) Int) ListLongMap!11853)

(assert (=> b!930980 (= lt!419347 (getCurrentListMap!3181 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930981 () Bool)

(declare-fun res!626973 () Bool)

(assert (=> b!930981 (=> (not res!626973) (not e!522829))))

(declare-datatypes ((List!18945 0))(
  ( (Nil!18942) (Cons!18941 (h!20087 (_ BitVec 64)) (t!27002 List!18945)) )
))
(declare-fun arrayNoDuplicates!0 (array!55936 (_ BitVec 32) List!18945) Bool)

(assert (=> b!930981 (= res!626973 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18942))))

(declare-fun b!930982 () Bool)

(assert (=> b!930982 (= e!522826 tp_is_empty!19997)))

(declare-fun b!930983 () Bool)

(declare-fun res!626975 () Bool)

(assert (=> b!930983 (=> (not res!626975) (not e!522829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55936 (_ BitVec 32)) Bool)

(assert (=> b!930983 (= res!626975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930984 () Bool)

(assert (=> b!930984 (= e!522825 false)))

(declare-fun lt!419346 () V!31627)

(declare-fun apply!763 (ListLongMap!11853 (_ BitVec 64)) V!31627)

(assert (=> b!930984 (= lt!419346 (apply!763 lt!419347 k!1099))))

(declare-fun b!930985 () Bool)

(declare-fun res!626974 () Bool)

(assert (=> b!930985 (=> (not res!626974) (not e!522829))))

(assert (=> b!930985 (= res!626974 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27372 _keys!1487))))))

(declare-fun b!930986 () Bool)

(assert (=> b!930986 (= e!522824 (and e!522827 mapRes!31752))))

(declare-fun condMapEmpty!31752 () Bool)

(declare-fun mapDefault!31752 () ValueCell!9517)

