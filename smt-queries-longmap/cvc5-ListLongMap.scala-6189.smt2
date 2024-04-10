; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79242 () Bool)

(assert start!79242)

(declare-fun b_free!17455 () Bool)

(declare-fun b_next!17455 () Bool)

(assert (=> start!79242 (= b_free!17455 (not b_next!17455))))

(declare-fun tp!60806 () Bool)

(declare-fun b_and!28521 () Bool)

(assert (=> start!79242 (= tp!60806 b_and!28521)))

(declare-fun b!930519 () Bool)

(declare-fun res!626668 () Bool)

(declare-fun e!522518 () Bool)

(assert (=> b!930519 (=> (not res!626668) (not e!522518))))

(declare-datatypes ((array!55872 0))(
  ( (array!55873 (arr!26881 (Array (_ BitVec 32) (_ BitVec 64))) (size!27340 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55872)

(declare-datatypes ((List!18920 0))(
  ( (Nil!18917) (Cons!18916 (h!20062 (_ BitVec 64)) (t!26977 List!18920)) )
))
(declare-fun arrayNoDuplicates!0 (array!55872 (_ BitVec 32) List!18920) Bool)

(assert (=> b!930519 (= res!626668 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18917))))

(declare-fun b!930520 () Bool)

(declare-fun res!626670 () Bool)

(assert (=> b!930520 (=> (not res!626670) (not e!522518))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930520 (= res!626670 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27340 _keys!1487))))))

(declare-fun b!930521 () Bool)

(declare-fun e!522522 () Bool)

(declare-fun tp_is_empty!19963 () Bool)

(assert (=> b!930521 (= e!522522 tp_is_empty!19963)))

(declare-fun b!930522 () Bool)

(declare-fun e!522521 () Bool)

(assert (=> b!930522 (= e!522521 false)))

(declare-datatypes ((V!31583 0))(
  ( (V!31584 (val!10032 Int)) )
))
(declare-fun lt!419244 () V!31583)

(declare-datatypes ((tuple2!13128 0))(
  ( (tuple2!13129 (_1!6575 (_ BitVec 64)) (_2!6575 V!31583)) )
))
(declare-datatypes ((List!18921 0))(
  ( (Nil!18918) (Cons!18917 (h!20063 tuple2!13128) (t!26978 List!18921)) )
))
(declare-datatypes ((ListLongMap!11825 0))(
  ( (ListLongMap!11826 (toList!5928 List!18921)) )
))
(declare-fun lt!419245 () ListLongMap!11825)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!750 (ListLongMap!11825 (_ BitVec 64)) V!31583)

(assert (=> b!930522 (= lt!419244 (apply!750 lt!419245 k!1099))))

(declare-fun b!930523 () Bool)

(declare-fun res!626669 () Bool)

(assert (=> b!930523 (=> (not res!626669) (not e!522518))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55872 (_ BitVec 32)) Bool)

(assert (=> b!930523 (= res!626669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930524 () Bool)

(assert (=> b!930524 (= e!522518 e!522521)))

(declare-fun res!626666 () Bool)

(assert (=> b!930524 (=> (not res!626666) (not e!522521))))

(declare-fun contains!4978 (ListLongMap!11825 (_ BitVec 64)) Bool)

(assert (=> b!930524 (= res!626666 (contains!4978 lt!419245 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9500 0))(
  ( (ValueCellFull!9500 (v!12550 V!31583)) (EmptyCell!9500) )
))
(declare-datatypes ((array!55874 0))(
  ( (array!55875 (arr!26882 (Array (_ BitVec 32) ValueCell!9500)) (size!27341 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55874)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31583)

(declare-fun minValue!1173 () V!31583)

(declare-fun getCurrentListMap!3169 (array!55872 array!55874 (_ BitVec 32) (_ BitVec 32) V!31583 V!31583 (_ BitVec 32) Int) ListLongMap!11825)

(assert (=> b!930524 (= lt!419245 (getCurrentListMap!3169 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930525 () Bool)

(declare-fun res!626671 () Bool)

(assert (=> b!930525 (=> (not res!626671) (not e!522518))))

(assert (=> b!930525 (= res!626671 (and (= (size!27341 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27340 _keys!1487) (size!27341 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31701 () Bool)

(declare-fun mapRes!31701 () Bool)

(declare-fun tp!60805 () Bool)

(declare-fun e!522523 () Bool)

(assert (=> mapNonEmpty!31701 (= mapRes!31701 (and tp!60805 e!522523))))

(declare-fun mapValue!31701 () ValueCell!9500)

(declare-fun mapRest!31701 () (Array (_ BitVec 32) ValueCell!9500))

(declare-fun mapKey!31701 () (_ BitVec 32))

(assert (=> mapNonEmpty!31701 (= (arr!26882 _values!1231) (store mapRest!31701 mapKey!31701 mapValue!31701))))

(declare-fun b!930527 () Bool)

(assert (=> b!930527 (= e!522523 tp_is_empty!19963)))

(declare-fun mapIsEmpty!31701 () Bool)

(assert (=> mapIsEmpty!31701 mapRes!31701))

(declare-fun b!930526 () Bool)

(declare-fun e!522519 () Bool)

(assert (=> b!930526 (= e!522519 (and e!522522 mapRes!31701))))

(declare-fun condMapEmpty!31701 () Bool)

(declare-fun mapDefault!31701 () ValueCell!9500)

