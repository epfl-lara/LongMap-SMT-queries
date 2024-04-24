; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79380 () Bool)

(assert start!79380)

(declare-fun b_free!17425 () Bool)

(declare-fun b_next!17425 () Bool)

(assert (=> start!79380 (= b_free!17425 (not b_next!17425))))

(declare-fun tp!60717 () Bool)

(declare-fun b_and!28501 () Bool)

(assert (=> start!79380 (= tp!60717 b_and!28501)))

(declare-fun b!930931 () Bool)

(declare-fun e!522835 () Bool)

(declare-fun e!522831 () Bool)

(declare-fun mapRes!31656 () Bool)

(assert (=> b!930931 (= e!522835 (and e!522831 mapRes!31656))))

(declare-fun condMapEmpty!31656 () Bool)

(declare-datatypes ((V!31543 0))(
  ( (V!31544 (val!10017 Int)) )
))
(declare-datatypes ((ValueCell!9485 0))(
  ( (ValueCellFull!9485 (v!12532 V!31543)) (EmptyCell!9485) )
))
(declare-datatypes ((array!55871 0))(
  ( (array!55872 (arr!26876 (Array (_ BitVec 32) ValueCell!9485)) (size!27336 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55871)

(declare-fun mapDefault!31656 () ValueCell!9485)

(assert (=> b!930931 (= condMapEmpty!31656 (= (arr!26876 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9485)) mapDefault!31656)))))

(declare-fun b!930932 () Bool)

(declare-fun e!522834 () Bool)

(declare-fun tp_is_empty!19933 () Bool)

(assert (=> b!930932 (= e!522834 tp_is_empty!19933)))

(declare-fun mapNonEmpty!31656 () Bool)

(declare-fun tp!60716 () Bool)

(assert (=> mapNonEmpty!31656 (= mapRes!31656 (and tp!60716 e!522834))))

(declare-fun mapRest!31656 () (Array (_ BitVec 32) ValueCell!9485))

(declare-fun mapValue!31656 () ValueCell!9485)

(declare-fun mapKey!31656 () (_ BitVec 32))

(assert (=> mapNonEmpty!31656 (= (arr!26876 _values!1231) (store mapRest!31656 mapKey!31656 mapValue!31656))))

(declare-fun res!626656 () Bool)

(declare-fun e!522833 () Bool)

(assert (=> start!79380 (=> (not res!626656) (not e!522833))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79380 (= res!626656 (validMask!0 mask!1881))))

(assert (=> start!79380 e!522833))

(assert (=> start!79380 true))

(assert (=> start!79380 tp_is_empty!19933))

(declare-fun array_inv!21020 (array!55871) Bool)

(assert (=> start!79380 (and (array_inv!21020 _values!1231) e!522835)))

(assert (=> start!79380 tp!60717))

(declare-datatypes ((array!55873 0))(
  ( (array!55874 (arr!26877 (Array (_ BitVec 32) (_ BitVec 64))) (size!27337 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55873)

(declare-fun array_inv!21021 (array!55873) Bool)

(assert (=> start!79380 (array_inv!21021 _keys!1487)))

(declare-fun b!930933 () Bool)

(declare-fun e!522830 () Bool)

(assert (=> b!930933 (= e!522833 e!522830)))

(declare-fun res!626657 () Bool)

(assert (=> b!930933 (=> (not res!626657) (not e!522830))))

(declare-datatypes ((tuple2!13098 0))(
  ( (tuple2!13099 (_1!6560 (_ BitVec 64)) (_2!6560 V!31543)) )
))
(declare-datatypes ((List!18890 0))(
  ( (Nil!18887) (Cons!18886 (h!20038 tuple2!13098) (t!26939 List!18890)) )
))
(declare-datatypes ((ListLongMap!11797 0))(
  ( (ListLongMap!11798 (toList!5914 List!18890)) )
))
(declare-fun lt!419533 () ListLongMap!11797)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4982 (ListLongMap!11797 (_ BitVec 64)) Bool)

(assert (=> b!930933 (= res!626657 (contains!4982 lt!419533 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31543)

(declare-fun minValue!1173 () V!31543)

(declare-fun getCurrentListMap!3160 (array!55873 array!55871 (_ BitVec 32) (_ BitVec 32) V!31543 V!31543 (_ BitVec 32) Int) ListLongMap!11797)

(assert (=> b!930933 (= lt!419533 (getCurrentListMap!3160 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930934 () Bool)

(declare-fun res!626654 () Bool)

(assert (=> b!930934 (=> (not res!626654) (not e!522833))))

(assert (=> b!930934 (= res!626654 (and (= (size!27336 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27337 _keys!1487) (size!27336 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930935 () Bool)

(assert (=> b!930935 (= e!522831 tp_is_empty!19933)))

(declare-fun b!930936 () Bool)

(assert (=> b!930936 (= e!522830 false)))

(declare-fun lt!419534 () Bool)

(assert (=> b!930936 (= lt!419534 (contains!4982 (getCurrentListMap!3160 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun mapIsEmpty!31656 () Bool)

(assert (=> mapIsEmpty!31656 mapRes!31656))

(declare-fun b!930937 () Bool)

(declare-fun res!626658 () Bool)

(assert (=> b!930937 (=> (not res!626658) (not e!522833))))

(declare-datatypes ((List!18891 0))(
  ( (Nil!18888) (Cons!18887 (h!20039 (_ BitVec 64)) (t!26940 List!18891)) )
))
(declare-fun arrayNoDuplicates!0 (array!55873 (_ BitVec 32) List!18891) Bool)

(assert (=> b!930937 (= res!626658 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18888))))

(declare-fun b!930938 () Bool)

(declare-fun res!626660 () Bool)

(assert (=> b!930938 (=> (not res!626660) (not e!522830))))

(assert (=> b!930938 (= res!626660 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930939 () Bool)

(declare-fun res!626655 () Bool)

(assert (=> b!930939 (=> (not res!626655) (not e!522833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55873 (_ BitVec 32)) Bool)

(assert (=> b!930939 (= res!626655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930940 () Bool)

(declare-fun res!626661 () Bool)

(assert (=> b!930940 (=> (not res!626661) (not e!522833))))

(assert (=> b!930940 (= res!626661 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27337 _keys!1487))))))

(declare-fun b!930941 () Bool)

(declare-fun res!626659 () Bool)

(assert (=> b!930941 (=> (not res!626659) (not e!522830))))

(declare-fun v!791 () V!31543)

(declare-fun apply!754 (ListLongMap!11797 (_ BitVec 64)) V!31543)

(assert (=> b!930941 (= res!626659 (= (apply!754 lt!419533 k0!1099) v!791))))

(assert (= (and start!79380 res!626656) b!930934))

(assert (= (and b!930934 res!626654) b!930939))

(assert (= (and b!930939 res!626655) b!930937))

(assert (= (and b!930937 res!626658) b!930940))

(assert (= (and b!930940 res!626661) b!930933))

(assert (= (and b!930933 res!626657) b!930941))

(assert (= (and b!930941 res!626659) b!930938))

(assert (= (and b!930938 res!626660) b!930936))

(assert (= (and b!930931 condMapEmpty!31656) mapIsEmpty!31656))

(assert (= (and b!930931 (not condMapEmpty!31656)) mapNonEmpty!31656))

(get-info :version)

(assert (= (and mapNonEmpty!31656 ((_ is ValueCellFull!9485) mapValue!31656)) b!930932))

(assert (= (and b!930931 ((_ is ValueCellFull!9485) mapDefault!31656)) b!930935))

(assert (= start!79380 b!930931))

(declare-fun m!865687 () Bool)

(assert (=> b!930939 m!865687))

(declare-fun m!865689 () Bool)

(assert (=> b!930936 m!865689))

(assert (=> b!930936 m!865689))

(declare-fun m!865691 () Bool)

(assert (=> b!930936 m!865691))

(declare-fun m!865693 () Bool)

(assert (=> mapNonEmpty!31656 m!865693))

(declare-fun m!865695 () Bool)

(assert (=> b!930941 m!865695))

(declare-fun m!865697 () Bool)

(assert (=> b!930937 m!865697))

(declare-fun m!865699 () Bool)

(assert (=> start!79380 m!865699))

(declare-fun m!865701 () Bool)

(assert (=> start!79380 m!865701))

(declare-fun m!865703 () Bool)

(assert (=> start!79380 m!865703))

(declare-fun m!865705 () Bool)

(assert (=> b!930933 m!865705))

(declare-fun m!865707 () Bool)

(assert (=> b!930933 m!865707))

(check-sat (not b_next!17425) (not start!79380) (not b!930939) (not b!930936) (not mapNonEmpty!31656) tp_is_empty!19933 b_and!28501 (not b!930933) (not b!930937) (not b!930941))
(check-sat b_and!28501 (not b_next!17425))
