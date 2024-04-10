; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79316 () Bool)

(assert start!79316)

(declare-fun b_free!17529 () Bool)

(declare-fun b_next!17529 () Bool)

(assert (=> start!79316 (= b_free!17529 (not b_next!17529))))

(declare-fun tp!61027 () Bool)

(declare-fun b_and!28609 () Bool)

(assert (=> start!79316 (= tp!61027 b_and!28609)))

(declare-fun b!931660 () Bool)

(declare-fun e!523211 () Bool)

(declare-fun e!523208 () Bool)

(declare-fun mapRes!31812 () Bool)

(assert (=> b!931660 (= e!523211 (and e!523208 mapRes!31812))))

(declare-fun condMapEmpty!31812 () Bool)

(declare-datatypes ((V!31681 0))(
  ( (V!31682 (val!10069 Int)) )
))
(declare-datatypes ((ValueCell!9537 0))(
  ( (ValueCellFull!9537 (v!12587 V!31681)) (EmptyCell!9537) )
))
(declare-datatypes ((array!56014 0))(
  ( (array!56015 (arr!26952 (Array (_ BitVec 32) ValueCell!9537)) (size!27411 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56014)

(declare-fun mapDefault!31812 () ValueCell!9537)

(assert (=> b!931660 (= condMapEmpty!31812 (= (arr!26952 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9537)) mapDefault!31812)))))

(declare-fun mapIsEmpty!31812 () Bool)

(assert (=> mapIsEmpty!31812 mapRes!31812))

(declare-fun b!931661 () Bool)

(declare-fun tp_is_empty!20037 () Bool)

(assert (=> b!931661 (= e!523208 tp_is_empty!20037)))

(declare-fun mapNonEmpty!31812 () Bool)

(declare-fun tp!61028 () Bool)

(declare-fun e!523210 () Bool)

(assert (=> mapNonEmpty!31812 (= mapRes!31812 (and tp!61028 e!523210))))

(declare-fun mapValue!31812 () ValueCell!9537)

(declare-fun mapRest!31812 () (Array (_ BitVec 32) ValueCell!9537))

(declare-fun mapKey!31812 () (_ BitVec 32))

(assert (=> mapNonEmpty!31812 (= (arr!26952 _values!1231) (store mapRest!31812 mapKey!31812 mapValue!31812))))

(declare-fun b!931662 () Bool)

(declare-fun res!627465 () Bool)

(declare-fun e!523212 () Bool)

(assert (=> b!931662 (=> (not res!627465) (not e!523212))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931662 (= res!627465 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931663 () Bool)

(declare-fun res!627461 () Bool)

(assert (=> b!931663 (=> (not res!627461) (not e!523212))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31681)

(declare-datatypes ((tuple2!13188 0))(
  ( (tuple2!13189 (_1!6605 (_ BitVec 64)) (_2!6605 V!31681)) )
))
(declare-datatypes ((List!18974 0))(
  ( (Nil!18971) (Cons!18970 (h!20116 tuple2!13188) (t!27047 List!18974)) )
))
(declare-datatypes ((ListLongMap!11885 0))(
  ( (ListLongMap!11886 (toList!5958 List!18974)) )
))
(declare-fun lt!419480 () ListLongMap!11885)

(declare-fun apply!775 (ListLongMap!11885 (_ BitVec 64)) V!31681)

(assert (=> b!931663 (= res!627461 (= (apply!775 lt!419480 k0!1099) v!791))))

(declare-fun b!931664 () Bool)

(declare-fun e!523207 () Bool)

(assert (=> b!931664 (= e!523207 e!523212)))

(declare-fun res!627467 () Bool)

(assert (=> b!931664 (=> (not res!627467) (not e!523212))))

(declare-fun contains!5005 (ListLongMap!11885 (_ BitVec 64)) Bool)

(assert (=> b!931664 (= res!627467 (contains!5005 lt!419480 k0!1099))))

(declare-datatypes ((array!56016 0))(
  ( (array!56017 (arr!26953 (Array (_ BitVec 32) (_ BitVec 64))) (size!27412 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56016)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31681)

(declare-fun minValue!1173 () V!31681)

(declare-fun getCurrentListMap!3196 (array!56016 array!56014 (_ BitVec 32) (_ BitVec 32) V!31681 V!31681 (_ BitVec 32) Int) ListLongMap!11885)

(assert (=> b!931664 (= lt!419480 (getCurrentListMap!3196 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931665 () Bool)

(declare-fun e!523213 () Bool)

(assert (=> b!931665 (= e!523212 e!523213)))

(declare-fun res!627469 () Bool)

(assert (=> b!931665 (=> (not res!627469) (not e!523213))))

(declare-fun lt!419481 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931665 (= res!627469 (validKeyInArray!0 lt!419481))))

(assert (=> b!931665 (= lt!419481 (select (arr!26953 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!627468 () Bool)

(assert (=> start!79316 (=> (not res!627468) (not e!523207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79316 (= res!627468 (validMask!0 mask!1881))))

(assert (=> start!79316 e!523207))

(assert (=> start!79316 true))

(assert (=> start!79316 tp_is_empty!20037))

(declare-fun array_inv!20980 (array!56014) Bool)

(assert (=> start!79316 (and (array_inv!20980 _values!1231) e!523211)))

(assert (=> start!79316 tp!61027))

(declare-fun array_inv!20981 (array!56016) Bool)

(assert (=> start!79316 (array_inv!20981 _keys!1487)))

(declare-fun b!931666 () Bool)

(assert (=> b!931666 (= e!523213 (not true))))

(declare-fun +!2765 (ListLongMap!11885 tuple2!13188) ListLongMap!11885)

(declare-fun get!14164 (ValueCell!9537 V!31681) V!31681)

(declare-fun dynLambda!1554 (Int (_ BitVec 64)) V!31681)

(assert (=> b!931666 (= (getCurrentListMap!3196 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2765 (getCurrentListMap!3196 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!13189 lt!419481 (get!14164 (select (arr!26952 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1554 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31440 0))(
  ( (Unit!31441) )
))
(declare-fun lt!419482 () Unit!31440)

(declare-fun lemmaListMapRecursiveValidKeyArray!155 (array!56016 array!56014 (_ BitVec 32) (_ BitVec 32) V!31681 V!31681 (_ BitVec 32) Int) Unit!31440)

(assert (=> b!931666 (= lt!419482 (lemmaListMapRecursiveValidKeyArray!155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931667 () Bool)

(declare-fun res!627462 () Bool)

(assert (=> b!931667 (=> (not res!627462) (not e!523207))))

(declare-datatypes ((List!18975 0))(
  ( (Nil!18972) (Cons!18971 (h!20117 (_ BitVec 64)) (t!27048 List!18975)) )
))
(declare-fun arrayNoDuplicates!0 (array!56016 (_ BitVec 32) List!18975) Bool)

(assert (=> b!931667 (= res!627462 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18972))))

(declare-fun b!931668 () Bool)

(declare-fun res!627460 () Bool)

(assert (=> b!931668 (=> (not res!627460) (not e!523207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56016 (_ BitVec 32)) Bool)

(assert (=> b!931668 (= res!627460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931669 () Bool)

(declare-fun res!627463 () Bool)

(assert (=> b!931669 (=> (not res!627463) (not e!523207))))

(assert (=> b!931669 (= res!627463 (and (= (size!27411 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27412 _keys!1487) (size!27411 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931670 () Bool)

(declare-fun res!627466 () Bool)

(assert (=> b!931670 (=> (not res!627466) (not e!523212))))

(assert (=> b!931670 (= res!627466 (validKeyInArray!0 k0!1099))))

(declare-fun b!931671 () Bool)

(declare-fun res!627464 () Bool)

(assert (=> b!931671 (=> (not res!627464) (not e!523207))))

(assert (=> b!931671 (= res!627464 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27412 _keys!1487))))))

(declare-fun b!931672 () Bool)

(assert (=> b!931672 (= e!523210 tp_is_empty!20037)))

(assert (= (and start!79316 res!627468) b!931669))

(assert (= (and b!931669 res!627463) b!931668))

(assert (= (and b!931668 res!627460) b!931667))

(assert (= (and b!931667 res!627462) b!931671))

(assert (= (and b!931671 res!627464) b!931664))

(assert (= (and b!931664 res!627467) b!931663))

(assert (= (and b!931663 res!627461) b!931662))

(assert (= (and b!931662 res!627465) b!931670))

(assert (= (and b!931670 res!627466) b!931665))

(assert (= (and b!931665 res!627469) b!931666))

(assert (= (and b!931660 condMapEmpty!31812) mapIsEmpty!31812))

(assert (= (and b!931660 (not condMapEmpty!31812)) mapNonEmpty!31812))

(get-info :version)

(assert (= (and mapNonEmpty!31812 ((_ is ValueCellFull!9537) mapValue!31812)) b!931672))

(assert (= (and b!931660 ((_ is ValueCellFull!9537) mapDefault!31812)) b!931661))

(assert (= start!79316 b!931660))

(declare-fun b_lambda!13845 () Bool)

(assert (=> (not b_lambda!13845) (not b!931666)))

(declare-fun t!27046 () Bool)

(declare-fun tb!5923 () Bool)

(assert (=> (and start!79316 (= defaultEntry!1235 defaultEntry!1235) t!27046) tb!5923))

(declare-fun result!11669 () Bool)

(assert (=> tb!5923 (= result!11669 tp_is_empty!20037)))

(assert (=> b!931666 t!27046))

(declare-fun b_and!28611 () Bool)

(assert (= b_and!28609 (and (=> t!27046 result!11669) b_and!28611)))

(declare-fun m!865529 () Bool)

(assert (=> b!931663 m!865529))

(declare-fun m!865531 () Bool)

(assert (=> b!931666 m!865531))

(declare-fun m!865533 () Bool)

(assert (=> b!931666 m!865533))

(assert (=> b!931666 m!865531))

(assert (=> b!931666 m!865533))

(declare-fun m!865535 () Bool)

(assert (=> b!931666 m!865535))

(declare-fun m!865537 () Bool)

(assert (=> b!931666 m!865537))

(declare-fun m!865539 () Bool)

(assert (=> b!931666 m!865539))

(declare-fun m!865541 () Bool)

(assert (=> b!931666 m!865541))

(assert (=> b!931666 m!865539))

(declare-fun m!865543 () Bool)

(assert (=> b!931666 m!865543))

(declare-fun m!865545 () Bool)

(assert (=> b!931667 m!865545))

(declare-fun m!865547 () Bool)

(assert (=> b!931670 m!865547))

(declare-fun m!865549 () Bool)

(assert (=> b!931668 m!865549))

(declare-fun m!865551 () Bool)

(assert (=> b!931664 m!865551))

(declare-fun m!865553 () Bool)

(assert (=> b!931664 m!865553))

(declare-fun m!865555 () Bool)

(assert (=> start!79316 m!865555))

(declare-fun m!865557 () Bool)

(assert (=> start!79316 m!865557))

(declare-fun m!865559 () Bool)

(assert (=> start!79316 m!865559))

(declare-fun m!865561 () Bool)

(assert (=> mapNonEmpty!31812 m!865561))

(declare-fun m!865563 () Bool)

(assert (=> b!931665 m!865563))

(declare-fun m!865565 () Bool)

(assert (=> b!931665 m!865565))

(check-sat b_and!28611 (not b_lambda!13845) (not b!931670) (not b!931663) (not mapNonEmpty!31812) (not start!79316) (not b!931666) (not b!931667) (not b!931668) tp_is_empty!20037 (not b!931665) (not b!931664) (not b_next!17529))
(check-sat b_and!28611 (not b_next!17529))
