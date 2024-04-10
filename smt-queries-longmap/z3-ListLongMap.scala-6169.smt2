; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79124 () Bool)

(assert start!79124)

(declare-fun b_free!17337 () Bool)

(declare-fun b_next!17337 () Bool)

(assert (=> start!79124 (= b_free!17337 (not b_next!17337))))

(declare-fun tp!60451 () Bool)

(declare-fun b_and!28403 () Bool)

(assert (=> start!79124 (= tp!60451 b_and!28403)))

(declare-fun b!928701 () Bool)

(declare-fun res!625382 () Bool)

(declare-fun e!521456 () Bool)

(assert (=> b!928701 (=> (not res!625382) (not e!521456))))

(declare-datatypes ((array!55648 0))(
  ( (array!55649 (arr!26769 (Array (_ BitVec 32) (_ BitVec 64))) (size!27228 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55648)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31425 0))(
  ( (V!31426 (val!9973 Int)) )
))
(declare-datatypes ((ValueCell!9441 0))(
  ( (ValueCellFull!9441 (v!12491 V!31425)) (EmptyCell!9441) )
))
(declare-datatypes ((array!55650 0))(
  ( (array!55651 (arr!26770 (Array (_ BitVec 32) ValueCell!9441)) (size!27229 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55650)

(assert (=> b!928701 (= res!625382 (and (= (size!27229 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27228 _keys!1487) (size!27229 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928702 () Bool)

(declare-fun e!521457 () Bool)

(declare-fun tp_is_empty!19845 () Bool)

(assert (=> b!928702 (= e!521457 tp_is_empty!19845)))

(declare-fun b!928703 () Bool)

(declare-fun res!625383 () Bool)

(assert (=> b!928703 (=> (not res!625383) (not e!521456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55648 (_ BitVec 32)) Bool)

(assert (=> b!928703 (= res!625383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928704 () Bool)

(declare-fun res!625384 () Bool)

(assert (=> b!928704 (=> (not res!625384) (not e!521456))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!928704 (= res!625384 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27228 _keys!1487))))))

(declare-fun mapNonEmpty!31524 () Bool)

(declare-fun mapRes!31524 () Bool)

(declare-fun tp!60452 () Bool)

(assert (=> mapNonEmpty!31524 (= mapRes!31524 (and tp!60452 e!521457))))

(declare-fun mapValue!31524 () ValueCell!9441)

(declare-fun mapKey!31524 () (_ BitVec 32))

(declare-fun mapRest!31524 () (Array (_ BitVec 32) ValueCell!9441))

(assert (=> mapNonEmpty!31524 (= (arr!26770 _values!1231) (store mapRest!31524 mapKey!31524 mapValue!31524))))

(declare-fun b!928705 () Bool)

(declare-fun res!625381 () Bool)

(assert (=> b!928705 (=> (not res!625381) (not e!521456))))

(declare-datatypes ((List!18830 0))(
  ( (Nil!18827) (Cons!18826 (h!19972 (_ BitVec 64)) (t!26887 List!18830)) )
))
(declare-fun arrayNoDuplicates!0 (array!55648 (_ BitVec 32) List!18830) Bool)

(assert (=> b!928705 (= res!625381 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18827))))

(declare-fun b!928706 () Bool)

(declare-fun e!521459 () Bool)

(assert (=> b!928706 (= e!521459 tp_is_empty!19845)))

(declare-fun b!928707 () Bool)

(declare-fun e!521458 () Bool)

(assert (=> b!928707 (= e!521458 false)))

(declare-fun lt!418917 () V!31425)

(declare-datatypes ((tuple2!13032 0))(
  ( (tuple2!13033 (_1!6527 (_ BitVec 64)) (_2!6527 V!31425)) )
))
(declare-datatypes ((List!18831 0))(
  ( (Nil!18828) (Cons!18827 (h!19973 tuple2!13032) (t!26888 List!18831)) )
))
(declare-datatypes ((ListLongMap!11729 0))(
  ( (ListLongMap!11730 (toList!5880 List!18831)) )
))
(declare-fun lt!418918 () ListLongMap!11729)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!709 (ListLongMap!11729 (_ BitVec 64)) V!31425)

(assert (=> b!928707 (= lt!418917 (apply!709 lt!418918 k0!1099))))

(declare-fun b!928708 () Bool)

(declare-fun e!521460 () Bool)

(assert (=> b!928708 (= e!521460 (and e!521459 mapRes!31524))))

(declare-fun condMapEmpty!31524 () Bool)

(declare-fun mapDefault!31524 () ValueCell!9441)

(assert (=> b!928708 (= condMapEmpty!31524 (= (arr!26770 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9441)) mapDefault!31524)))))

(declare-fun res!625379 () Bool)

(assert (=> start!79124 (=> (not res!625379) (not e!521456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79124 (= res!625379 (validMask!0 mask!1881))))

(assert (=> start!79124 e!521456))

(assert (=> start!79124 true))

(declare-fun array_inv!20840 (array!55650) Bool)

(assert (=> start!79124 (and (array_inv!20840 _values!1231) e!521460)))

(assert (=> start!79124 tp!60451))

(declare-fun array_inv!20841 (array!55648) Bool)

(assert (=> start!79124 (array_inv!20841 _keys!1487)))

(assert (=> start!79124 tp_is_empty!19845))

(declare-fun b!928709 () Bool)

(assert (=> b!928709 (= e!521456 e!521458)))

(declare-fun res!625380 () Bool)

(assert (=> b!928709 (=> (not res!625380) (not e!521458))))

(declare-fun contains!4937 (ListLongMap!11729 (_ BitVec 64)) Bool)

(assert (=> b!928709 (= res!625380 (contains!4937 lt!418918 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31425)

(declare-fun minValue!1173 () V!31425)

(declare-fun getCurrentListMap!3128 (array!55648 array!55650 (_ BitVec 32) (_ BitVec 32) V!31425 V!31425 (_ BitVec 32) Int) ListLongMap!11729)

(assert (=> b!928709 (= lt!418918 (getCurrentListMap!3128 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31524 () Bool)

(assert (=> mapIsEmpty!31524 mapRes!31524))

(assert (= (and start!79124 res!625379) b!928701))

(assert (= (and b!928701 res!625382) b!928703))

(assert (= (and b!928703 res!625383) b!928705))

(assert (= (and b!928705 res!625381) b!928704))

(assert (= (and b!928704 res!625384) b!928709))

(assert (= (and b!928709 res!625380) b!928707))

(assert (= (and b!928708 condMapEmpty!31524) mapIsEmpty!31524))

(assert (= (and b!928708 (not condMapEmpty!31524)) mapNonEmpty!31524))

(get-info :version)

(assert (= (and mapNonEmpty!31524 ((_ is ValueCellFull!9441) mapValue!31524)) b!928702))

(assert (= (and b!928708 ((_ is ValueCellFull!9441) mapDefault!31524)) b!928706))

(assert (= start!79124 b!928708))

(declare-fun m!863517 () Bool)

(assert (=> b!928709 m!863517))

(declare-fun m!863519 () Bool)

(assert (=> b!928709 m!863519))

(declare-fun m!863521 () Bool)

(assert (=> b!928705 m!863521))

(declare-fun m!863523 () Bool)

(assert (=> b!928707 m!863523))

(declare-fun m!863525 () Bool)

(assert (=> mapNonEmpty!31524 m!863525))

(declare-fun m!863527 () Bool)

(assert (=> start!79124 m!863527))

(declare-fun m!863529 () Bool)

(assert (=> start!79124 m!863529))

(declare-fun m!863531 () Bool)

(assert (=> start!79124 m!863531))

(declare-fun m!863533 () Bool)

(assert (=> b!928703 m!863533))

(check-sat (not mapNonEmpty!31524) b_and!28403 (not b!928703) tp_is_empty!19845 (not b!928705) (not start!79124) (not b_next!17337) (not b!928709) (not b!928707))
(check-sat b_and!28403 (not b_next!17337))
