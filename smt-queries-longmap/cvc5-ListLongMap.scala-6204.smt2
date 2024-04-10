; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79358 () Bool)

(assert start!79358)

(declare-fun b_free!17545 () Bool)

(declare-fun b_next!17545 () Bool)

(assert (=> start!79358 (= b_free!17545 (not b_next!17545))))

(declare-fun tp!61078 () Bool)

(declare-fun b_and!28649 () Bool)

(assert (=> start!79358 (= tp!61078 b_and!28649)))

(declare-fun b!932158 () Bool)

(declare-fun res!627776 () Bool)

(declare-fun e!523490 () Bool)

(assert (=> b!932158 (=> (not res!627776) (not e!523490))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56046 0))(
  ( (array!56047 (arr!26967 (Array (_ BitVec 32) (_ BitVec 64))) (size!27426 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56046)

(assert (=> b!932158 (= res!627776 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27426 _keys!1487))))))

(declare-fun mapNonEmpty!31839 () Bool)

(declare-fun mapRes!31839 () Bool)

(declare-fun tp!61079 () Bool)

(declare-fun e!523487 () Bool)

(assert (=> mapNonEmpty!31839 (= mapRes!31839 (and tp!61079 e!523487))))

(declare-datatypes ((V!31703 0))(
  ( (V!31704 (val!10077 Int)) )
))
(declare-datatypes ((ValueCell!9545 0))(
  ( (ValueCellFull!9545 (v!12596 V!31703)) (EmptyCell!9545) )
))
(declare-fun mapRest!31839 () (Array (_ BitVec 32) ValueCell!9545))

(declare-fun mapValue!31839 () ValueCell!9545)

(declare-fun mapKey!31839 () (_ BitVec 32))

(declare-datatypes ((array!56048 0))(
  ( (array!56049 (arr!26968 (Array (_ BitVec 32) ValueCell!9545)) (size!27427 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56048)

(assert (=> mapNonEmpty!31839 (= (arr!26968 _values!1231) (store mapRest!31839 mapKey!31839 mapValue!31839))))

(declare-fun b!932159 () Bool)

(declare-fun res!627777 () Bool)

(assert (=> b!932159 (=> (not res!627777) (not e!523490))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56046 (_ BitVec 32)) Bool)

(assert (=> b!932159 (= res!627777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932160 () Bool)

(declare-fun res!627784 () Bool)

(declare-fun e!523488 () Bool)

(assert (=> b!932160 (=> (not res!627784) (not e!523488))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932160 (= res!627784 (validKeyInArray!0 k!1099))))

(declare-fun res!627778 () Bool)

(assert (=> start!79358 (=> (not res!627778) (not e!523490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79358 (= res!627778 (validMask!0 mask!1881))))

(assert (=> start!79358 e!523490))

(assert (=> start!79358 true))

(declare-fun tp_is_empty!20053 () Bool)

(assert (=> start!79358 tp_is_empty!20053))

(declare-fun e!523489 () Bool)

(declare-fun array_inv!20990 (array!56048) Bool)

(assert (=> start!79358 (and (array_inv!20990 _values!1231) e!523489)))

(assert (=> start!79358 tp!61078))

(declare-fun array_inv!20991 (array!56046) Bool)

(assert (=> start!79358 (array_inv!20991 _keys!1487)))

(declare-fun b!932161 () Bool)

(assert (=> b!932161 (= e!523490 e!523488)))

(declare-fun res!627780 () Bool)

(assert (=> b!932161 (=> (not res!627780) (not e!523488))))

(declare-datatypes ((tuple2!13200 0))(
  ( (tuple2!13201 (_1!6611 (_ BitVec 64)) (_2!6611 V!31703)) )
))
(declare-datatypes ((List!18986 0))(
  ( (Nil!18983) (Cons!18982 (h!20128 tuple2!13200) (t!27075 List!18986)) )
))
(declare-datatypes ((ListLongMap!11897 0))(
  ( (ListLongMap!11898 (toList!5964 List!18986)) )
))
(declare-fun lt!419774 () ListLongMap!11897)

(declare-fun contains!5013 (ListLongMap!11897 (_ BitVec 64)) Bool)

(assert (=> b!932161 (= res!627780 (contains!5013 lt!419774 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31703)

(declare-fun minValue!1173 () V!31703)

(declare-fun getCurrentListMap!3202 (array!56046 array!56048 (_ BitVec 32) (_ BitVec 32) V!31703 V!31703 (_ BitVec 32) Int) ListLongMap!11897)

(assert (=> b!932161 (= lt!419774 (getCurrentListMap!3202 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31839 () Bool)

(assert (=> mapIsEmpty!31839 mapRes!31839))

(declare-fun b!932162 () Bool)

(declare-fun e!523491 () Bool)

(assert (=> b!932162 (= e!523491 tp_is_empty!20053)))

(declare-fun b!932163 () Bool)

(declare-fun e!523485 () Bool)

(assert (=> b!932163 (= e!523488 e!523485)))

(declare-fun res!627779 () Bool)

(assert (=> b!932163 (=> (not res!627779) (not e!523485))))

(declare-fun lt!419772 () (_ BitVec 64))

(assert (=> b!932163 (= res!627779 (validKeyInArray!0 lt!419772))))

(assert (=> b!932163 (= lt!419772 (select (arr!26967 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932164 () Bool)

(assert (=> b!932164 (= e!523487 tp_is_empty!20053)))

(declare-fun b!932165 () Bool)

(assert (=> b!932165 (= e!523485 (not (or (bvsge (size!27426 _keys!1487) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!27426 _keys!1487)))))))

(declare-fun lt!419770 () tuple2!13200)

(declare-fun +!2771 (ListLongMap!11897 tuple2!13200) ListLongMap!11897)

(assert (=> b!932165 (contains!5013 (+!2771 lt!419774 lt!419770) k!1099)))

(declare-datatypes ((Unit!31457 0))(
  ( (Unit!31458) )
))
(declare-fun lt!419773 () Unit!31457)

(declare-fun lt!419771 () V!31703)

(declare-fun addStillContains!490 (ListLongMap!11897 (_ BitVec 64) V!31703 (_ BitVec 64)) Unit!31457)

(assert (=> b!932165 (= lt!419773 (addStillContains!490 lt!419774 lt!419772 lt!419771 k!1099))))

(assert (=> b!932165 (= (getCurrentListMap!3202 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2771 (getCurrentListMap!3202 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419770))))

(assert (=> b!932165 (= lt!419770 (tuple2!13201 lt!419772 lt!419771))))

(declare-fun get!14179 (ValueCell!9545 V!31703) V!31703)

(declare-fun dynLambda!1560 (Int (_ BitVec 64)) V!31703)

(assert (=> b!932165 (= lt!419771 (get!14179 (select (arr!26968 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1560 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419769 () Unit!31457)

(declare-fun lemmaListMapRecursiveValidKeyArray!161 (array!56046 array!56048 (_ BitVec 32) (_ BitVec 32) V!31703 V!31703 (_ BitVec 32) Int) Unit!31457)

(assert (=> b!932165 (= lt!419769 (lemmaListMapRecursiveValidKeyArray!161 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932166 () Bool)

(assert (=> b!932166 (= e!523489 (and e!523491 mapRes!31839))))

(declare-fun condMapEmpty!31839 () Bool)

(declare-fun mapDefault!31839 () ValueCell!9545)

