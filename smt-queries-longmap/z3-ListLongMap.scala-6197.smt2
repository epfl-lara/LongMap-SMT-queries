; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79458 () Bool)

(assert start!79458)

(declare-fun b_free!17503 () Bool)

(declare-fun b_next!17503 () Bool)

(assert (=> start!79458 (= b_free!17503 (not b_next!17503))))

(declare-fun tp!60950 () Bool)

(declare-fun b_and!28579 () Bool)

(assert (=> start!79458 (= tp!60950 b_and!28579)))

(declare-fun mapIsEmpty!31773 () Bool)

(declare-fun mapRes!31773 () Bool)

(assert (=> mapIsEmpty!31773 mapRes!31773))

(declare-fun b!932078 () Bool)

(declare-fun res!627452 () Bool)

(declare-fun e!523535 () Bool)

(assert (=> b!932078 (=> (not res!627452) (not e!523535))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932078 (= res!627452 (validKeyInArray!0 k0!1099))))

(declare-fun b!932079 () Bool)

(declare-fun res!627456 () Bool)

(assert (=> b!932079 (=> (not res!627456) (not e!523535))))

(declare-datatypes ((array!56021 0))(
  ( (array!56022 (arr!26951 (Array (_ BitVec 32) (_ BitVec 64))) (size!27411 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56021)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932079 (= res!627456 (validKeyInArray!0 (select (arr!26951 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!932080 () Bool)

(declare-fun e!523536 () Bool)

(assert (=> b!932080 (= e!523536 e!523535)))

(declare-fun res!627459 () Bool)

(assert (=> b!932080 (=> (not res!627459) (not e!523535))))

(declare-datatypes ((V!31647 0))(
  ( (V!31648 (val!10056 Int)) )
))
(declare-datatypes ((tuple2!13160 0))(
  ( (tuple2!13161 (_1!6591 (_ BitVec 64)) (_2!6591 V!31647)) )
))
(declare-datatypes ((List!18948 0))(
  ( (Nil!18945) (Cons!18944 (h!20096 tuple2!13160) (t!26997 List!18948)) )
))
(declare-datatypes ((ListLongMap!11859 0))(
  ( (ListLongMap!11860 (toList!5945 List!18948)) )
))
(declare-fun lt!419747 () ListLongMap!11859)

(declare-fun contains!5010 (ListLongMap!11859 (_ BitVec 64)) Bool)

(assert (=> b!932080 (= res!627459 (contains!5010 lt!419747 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9524 0))(
  ( (ValueCellFull!9524 (v!12571 V!31647)) (EmptyCell!9524) )
))
(declare-datatypes ((array!56023 0))(
  ( (array!56024 (arr!26952 (Array (_ BitVec 32) ValueCell!9524)) (size!27412 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56023)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31647)

(declare-fun minValue!1173 () V!31647)

(declare-fun getCurrentListMap!3188 (array!56021 array!56023 (_ BitVec 32) (_ BitVec 32) V!31647 V!31647 (_ BitVec 32) Int) ListLongMap!11859)

(assert (=> b!932080 (= lt!419747 (getCurrentListMap!3188 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932081 () Bool)

(declare-fun res!627455 () Bool)

(assert (=> b!932081 (=> (not res!627455) (not e!523536))))

(assert (=> b!932081 (= res!627455 (and (= (size!27412 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27411 _keys!1487) (size!27412 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932082 () Bool)

(declare-fun res!627458 () Bool)

(assert (=> b!932082 (=> (not res!627458) (not e!523535))))

(declare-fun v!791 () V!31647)

(declare-fun apply!778 (ListLongMap!11859 (_ BitVec 64)) V!31647)

(assert (=> b!932082 (= res!627458 (= (apply!778 lt!419747 k0!1099) v!791))))

(declare-fun mapNonEmpty!31773 () Bool)

(declare-fun tp!60951 () Bool)

(declare-fun e!523532 () Bool)

(assert (=> mapNonEmpty!31773 (= mapRes!31773 (and tp!60951 e!523532))))

(declare-fun mapKey!31773 () (_ BitVec 32))

(declare-fun mapValue!31773 () ValueCell!9524)

(declare-fun mapRest!31773 () (Array (_ BitVec 32) ValueCell!9524))

(assert (=> mapNonEmpty!31773 (= (arr!26952 _values!1231) (store mapRest!31773 mapKey!31773 mapValue!31773))))

(declare-fun res!627450 () Bool)

(assert (=> start!79458 (=> (not res!627450) (not e!523536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79458 (= res!627450 (validMask!0 mask!1881))))

(assert (=> start!79458 e!523536))

(assert (=> start!79458 true))

(declare-fun tp_is_empty!20011 () Bool)

(assert (=> start!79458 tp_is_empty!20011))

(declare-fun e!523537 () Bool)

(declare-fun array_inv!21072 (array!56023) Bool)

(assert (=> start!79458 (and (array_inv!21072 _values!1231) e!523537)))

(assert (=> start!79458 tp!60950))

(declare-fun array_inv!21073 (array!56021) Bool)

(assert (=> start!79458 (array_inv!21073 _keys!1487)))

(declare-fun b!932083 () Bool)

(declare-fun res!627454 () Bool)

(assert (=> b!932083 (=> (not res!627454) (not e!523535))))

(assert (=> b!932083 (= res!627454 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932084 () Bool)

(declare-fun res!627453 () Bool)

(assert (=> b!932084 (=> (not res!627453) (not e!523536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56021 (_ BitVec 32)) Bool)

(assert (=> b!932084 (= res!627453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932085 () Bool)

(assert (=> b!932085 (= e!523532 tp_is_empty!20011)))

(declare-fun b!932086 () Bool)

(declare-fun res!627457 () Bool)

(assert (=> b!932086 (=> (not res!627457) (not e!523536))))

(assert (=> b!932086 (= res!627457 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27411 _keys!1487))))))

(declare-fun b!932087 () Bool)

(declare-fun e!523534 () Bool)

(assert (=> b!932087 (= e!523537 (and e!523534 mapRes!31773))))

(declare-fun condMapEmpty!31773 () Bool)

(declare-fun mapDefault!31773 () ValueCell!9524)

(assert (=> b!932087 (= condMapEmpty!31773 (= (arr!26952 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9524)) mapDefault!31773)))))

(declare-fun b!932088 () Bool)

(assert (=> b!932088 (= e!523535 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27411 _keys!1487)))))

(declare-fun b!932089 () Bool)

(assert (=> b!932089 (= e!523534 tp_is_empty!20011)))

(declare-fun b!932090 () Bool)

(declare-fun res!627451 () Bool)

(assert (=> b!932090 (=> (not res!627451) (not e!523536))))

(declare-datatypes ((List!18949 0))(
  ( (Nil!18946) (Cons!18945 (h!20097 (_ BitVec 64)) (t!26998 List!18949)) )
))
(declare-fun arrayNoDuplicates!0 (array!56021 (_ BitVec 32) List!18949) Bool)

(assert (=> b!932090 (= res!627451 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18946))))

(assert (= (and start!79458 res!627450) b!932081))

(assert (= (and b!932081 res!627455) b!932084))

(assert (= (and b!932084 res!627453) b!932090))

(assert (= (and b!932090 res!627451) b!932086))

(assert (= (and b!932086 res!627457) b!932080))

(assert (= (and b!932080 res!627459) b!932082))

(assert (= (and b!932082 res!627458) b!932083))

(assert (= (and b!932083 res!627454) b!932078))

(assert (= (and b!932078 res!627452) b!932079))

(assert (= (and b!932079 res!627456) b!932088))

(assert (= (and b!932087 condMapEmpty!31773) mapIsEmpty!31773))

(assert (= (and b!932087 (not condMapEmpty!31773)) mapNonEmpty!31773))

(get-info :version)

(assert (= (and mapNonEmpty!31773 ((_ is ValueCellFull!9524) mapValue!31773)) b!932085))

(assert (= (and b!932087 ((_ is ValueCellFull!9524) mapDefault!31773)) b!932089))

(assert (= start!79458 b!932087))

(declare-fun m!866431 () Bool)

(assert (=> b!932090 m!866431))

(declare-fun m!866433 () Bool)

(assert (=> mapNonEmpty!31773 m!866433))

(declare-fun m!866435 () Bool)

(assert (=> b!932084 m!866435))

(declare-fun m!866437 () Bool)

(assert (=> b!932079 m!866437))

(assert (=> b!932079 m!866437))

(declare-fun m!866439 () Bool)

(assert (=> b!932079 m!866439))

(declare-fun m!866441 () Bool)

(assert (=> start!79458 m!866441))

(declare-fun m!866443 () Bool)

(assert (=> start!79458 m!866443))

(declare-fun m!866445 () Bool)

(assert (=> start!79458 m!866445))

(declare-fun m!866447 () Bool)

(assert (=> b!932082 m!866447))

(declare-fun m!866449 () Bool)

(assert (=> b!932078 m!866449))

(declare-fun m!866451 () Bool)

(assert (=> b!932080 m!866451))

(declare-fun m!866453 () Bool)

(assert (=> b!932080 m!866453))

(check-sat b_and!28579 (not b_next!17503) (not start!79458) (not b!932090) (not b!932084) (not b!932080) (not b!932079) (not b!932078) tp_is_empty!20011 (not mapNonEmpty!31773) (not b!932082))
(check-sat b_and!28579 (not b_next!17503))
