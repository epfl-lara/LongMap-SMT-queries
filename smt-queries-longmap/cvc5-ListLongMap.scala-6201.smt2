; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79314 () Bool)

(assert start!79314)

(declare-fun b_free!17527 () Bool)

(declare-fun b_next!17527 () Bool)

(assert (=> start!79314 (= b_free!17527 (not b_next!17527))))

(declare-fun tp!61021 () Bool)

(declare-fun b_and!28605 () Bool)

(assert (=> start!79314 (= tp!61021 b_and!28605)))

(declare-fun b!931619 () Bool)

(declare-fun res!627436 () Bool)

(declare-fun e!523188 () Bool)

(assert (=> b!931619 (=> (not res!627436) (not e!523188))))

(declare-datatypes ((array!56010 0))(
  ( (array!56011 (arr!26950 (Array (_ BitVec 32) (_ BitVec 64))) (size!27409 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56010)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!31679 0))(
  ( (V!31680 (val!10068 Int)) )
))
(declare-datatypes ((ValueCell!9536 0))(
  ( (ValueCellFull!9536 (v!12586 V!31679)) (EmptyCell!9536) )
))
(declare-datatypes ((array!56012 0))(
  ( (array!56013 (arr!26951 (Array (_ BitVec 32) ValueCell!9536)) (size!27410 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56012)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931619 (= res!627436 (and (= (size!27410 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27409 _keys!1487) (size!27410 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31809 () Bool)

(declare-fun mapRes!31809 () Bool)

(assert (=> mapIsEmpty!31809 mapRes!31809))

(declare-fun b!931620 () Bool)

(declare-fun e!523189 () Bool)

(declare-fun tp_is_empty!20035 () Bool)

(assert (=> b!931620 (= e!523189 tp_is_empty!20035)))

(declare-fun b!931621 () Bool)

(declare-fun res!627434 () Bool)

(declare-fun e!523186 () Bool)

(assert (=> b!931621 (=> (not res!627434) (not e!523186))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931621 (= res!627434 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31809 () Bool)

(declare-fun tp!61022 () Bool)

(assert (=> mapNonEmpty!31809 (= mapRes!31809 (and tp!61022 e!523189))))

(declare-fun mapValue!31809 () ValueCell!9536)

(declare-fun mapRest!31809 () (Array (_ BitVec 32) ValueCell!9536))

(declare-fun mapKey!31809 () (_ BitVec 32))

(assert (=> mapNonEmpty!31809 (= (arr!26951 _values!1231) (store mapRest!31809 mapKey!31809 mapValue!31809))))

(declare-fun b!931622 () Bool)

(declare-fun res!627432 () Bool)

(assert (=> b!931622 (=> (not res!627432) (not e!523188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56010 (_ BitVec 32)) Bool)

(assert (=> b!931622 (= res!627432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931623 () Bool)

(declare-fun res!627437 () Bool)

(assert (=> b!931623 (=> (not res!627437) (not e!523186))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31679)

(declare-datatypes ((tuple2!13186 0))(
  ( (tuple2!13187 (_1!6604 (_ BitVec 64)) (_2!6604 V!31679)) )
))
(declare-datatypes ((List!18972 0))(
  ( (Nil!18969) (Cons!18968 (h!20114 tuple2!13186) (t!27043 List!18972)) )
))
(declare-datatypes ((ListLongMap!11883 0))(
  ( (ListLongMap!11884 (toList!5957 List!18972)) )
))
(declare-fun lt!419473 () ListLongMap!11883)

(declare-fun apply!774 (ListLongMap!11883 (_ BitVec 64)) V!31679)

(assert (=> b!931623 (= res!627437 (= (apply!774 lt!419473 k!1099) v!791))))

(declare-fun b!931624 () Bool)

(assert (=> b!931624 (= e!523188 e!523186)))

(declare-fun res!627430 () Bool)

(assert (=> b!931624 (=> (not res!627430) (not e!523186))))

(declare-fun contains!5004 (ListLongMap!11883 (_ BitVec 64)) Bool)

(assert (=> b!931624 (= res!627430 (contains!5004 lt!419473 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31679)

(declare-fun minValue!1173 () V!31679)

(declare-fun getCurrentListMap!3195 (array!56010 array!56012 (_ BitVec 32) (_ BitVec 32) V!31679 V!31679 (_ BitVec 32) Int) ListLongMap!11883)

(assert (=> b!931624 (= lt!419473 (getCurrentListMap!3195 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931625 () Bool)

(declare-fun res!627438 () Bool)

(assert (=> b!931625 (=> (not res!627438) (not e!523188))))

(declare-datatypes ((List!18973 0))(
  ( (Nil!18970) (Cons!18969 (h!20115 (_ BitVec 64)) (t!27044 List!18973)) )
))
(declare-fun arrayNoDuplicates!0 (array!56010 (_ BitVec 32) List!18973) Bool)

(assert (=> b!931625 (= res!627438 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18970))))

(declare-fun b!931626 () Bool)

(declare-fun e!523190 () Bool)

(assert (=> b!931626 (= e!523190 (not true))))

(declare-fun lt!419471 () (_ BitVec 64))

(declare-fun +!2764 (ListLongMap!11883 tuple2!13186) ListLongMap!11883)

(declare-fun get!14163 (ValueCell!9536 V!31679) V!31679)

(declare-fun dynLambda!1553 (Int (_ BitVec 64)) V!31679)

(assert (=> b!931626 (= (getCurrentListMap!3195 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2764 (getCurrentListMap!3195 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!13187 lt!419471 (get!14163 (select (arr!26951 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1553 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31438 0))(
  ( (Unit!31439) )
))
(declare-fun lt!419472 () Unit!31438)

(declare-fun lemmaListMapRecursiveValidKeyArray!154 (array!56010 array!56012 (_ BitVec 32) (_ BitVec 32) V!31679 V!31679 (_ BitVec 32) Int) Unit!31438)

(assert (=> b!931626 (= lt!419472 (lemmaListMapRecursiveValidKeyArray!154 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931627 () Bool)

(declare-fun res!627431 () Bool)

(assert (=> b!931627 (=> (not res!627431) (not e!523186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931627 (= res!627431 (validKeyInArray!0 k!1099))))

(declare-fun b!931628 () Bool)

(assert (=> b!931628 (= e!523186 e!523190)))

(declare-fun res!627435 () Bool)

(assert (=> b!931628 (=> (not res!627435) (not e!523190))))

(assert (=> b!931628 (= res!627435 (validKeyInArray!0 lt!419471))))

(assert (=> b!931628 (= lt!419471 (select (arr!26950 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!627433 () Bool)

(assert (=> start!79314 (=> (not res!627433) (not e!523188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79314 (= res!627433 (validMask!0 mask!1881))))

(assert (=> start!79314 e!523188))

(assert (=> start!79314 true))

(assert (=> start!79314 tp_is_empty!20035))

(declare-fun e!523191 () Bool)

(declare-fun array_inv!20978 (array!56012) Bool)

(assert (=> start!79314 (and (array_inv!20978 _values!1231) e!523191)))

(assert (=> start!79314 tp!61021))

(declare-fun array_inv!20979 (array!56010) Bool)

(assert (=> start!79314 (array_inv!20979 _keys!1487)))

(declare-fun b!931629 () Bool)

(declare-fun res!627439 () Bool)

(assert (=> b!931629 (=> (not res!627439) (not e!523188))))

(assert (=> b!931629 (= res!627439 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27409 _keys!1487))))))

(declare-fun b!931630 () Bool)

(declare-fun e!523187 () Bool)

(assert (=> b!931630 (= e!523191 (and e!523187 mapRes!31809))))

(declare-fun condMapEmpty!31809 () Bool)

(declare-fun mapDefault!31809 () ValueCell!9536)

