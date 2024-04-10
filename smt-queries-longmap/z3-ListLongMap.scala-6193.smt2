; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79268 () Bool)

(assert start!79268)

(declare-fun b_free!17481 () Bool)

(declare-fun b_next!17481 () Bool)

(assert (=> start!79268 (= b_free!17481 (not b_next!17481))))

(declare-fun tp!60883 () Bool)

(declare-fun b_and!28547 () Bool)

(assert (=> start!79268 (= tp!60883 b_and!28547)))

(declare-fun mapNonEmpty!31740 () Bool)

(declare-fun mapRes!31740 () Bool)

(declare-fun tp!60884 () Bool)

(declare-fun e!522753 () Bool)

(assert (=> mapNonEmpty!31740 (= mapRes!31740 (and tp!60884 e!522753))))

(declare-fun mapKey!31740 () (_ BitVec 32))

(declare-datatypes ((V!31617 0))(
  ( (V!31618 (val!10045 Int)) )
))
(declare-datatypes ((ValueCell!9513 0))(
  ( (ValueCellFull!9513 (v!12563 V!31617)) (EmptyCell!9513) )
))
(declare-fun mapRest!31740 () (Array (_ BitVec 32) ValueCell!9513))

(declare-fun mapValue!31740 () ValueCell!9513)

(declare-datatypes ((array!55918 0))(
  ( (array!55919 (arr!26904 (Array (_ BitVec 32) ValueCell!9513)) (size!27363 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55918)

(assert (=> mapNonEmpty!31740 (= (arr!26904 _values!1231) (store mapRest!31740 mapKey!31740 mapValue!31740))))

(declare-fun b!930870 () Bool)

(declare-fun res!626900 () Bool)

(declare-fun e!522752 () Bool)

(assert (=> b!930870 (=> (not res!626900) (not e!522752))))

(declare-datatypes ((array!55920 0))(
  ( (array!55921 (arr!26905 (Array (_ BitVec 32) (_ BitVec 64))) (size!27364 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55920)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930870 (= res!626900 (and (= (size!27363 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27364 _keys!1487) (size!27363 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930871 () Bool)

(declare-fun e!522757 () Bool)

(assert (=> b!930871 (= e!522757 false)))

(declare-fun lt!419323 () V!31617)

(declare-datatypes ((tuple2!13148 0))(
  ( (tuple2!13149 (_1!6585 (_ BitVec 64)) (_2!6585 V!31617)) )
))
(declare-datatypes ((List!18938 0))(
  ( (Nil!18935) (Cons!18934 (h!20080 tuple2!13148) (t!26995 List!18938)) )
))
(declare-datatypes ((ListLongMap!11845 0))(
  ( (ListLongMap!11846 (toList!5938 List!18938)) )
))
(declare-fun lt!419322 () ListLongMap!11845)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!760 (ListLongMap!11845 (_ BitVec 64)) V!31617)

(assert (=> b!930871 (= lt!419323 (apply!760 lt!419322 k0!1099))))

(declare-fun b!930872 () Bool)

(declare-fun e!522754 () Bool)

(declare-fun tp_is_empty!19989 () Bool)

(assert (=> b!930872 (= e!522754 tp_is_empty!19989)))

(declare-fun b!930873 () Bool)

(assert (=> b!930873 (= e!522752 e!522757)))

(declare-fun res!626902 () Bool)

(assert (=> b!930873 (=> (not res!626902) (not e!522757))))

(declare-fun contains!4986 (ListLongMap!11845 (_ BitVec 64)) Bool)

(assert (=> b!930873 (= res!626902 (contains!4986 lt!419322 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31617)

(declare-fun minValue!1173 () V!31617)

(declare-fun getCurrentListMap!3177 (array!55920 array!55918 (_ BitVec 32) (_ BitVec 32) V!31617 V!31617 (_ BitVec 32) Int) ListLongMap!11845)

(assert (=> b!930873 (= lt!419322 (getCurrentListMap!3177 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930874 () Bool)

(declare-fun res!626903 () Bool)

(assert (=> b!930874 (=> (not res!626903) (not e!522752))))

(assert (=> b!930874 (= res!626903 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27364 _keys!1487))))))

(declare-fun res!626905 () Bool)

(assert (=> start!79268 (=> (not res!626905) (not e!522752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79268 (= res!626905 (validMask!0 mask!1881))))

(assert (=> start!79268 e!522752))

(assert (=> start!79268 true))

(declare-fun e!522756 () Bool)

(declare-fun array_inv!20938 (array!55918) Bool)

(assert (=> start!79268 (and (array_inv!20938 _values!1231) e!522756)))

(assert (=> start!79268 tp!60883))

(declare-fun array_inv!20939 (array!55920) Bool)

(assert (=> start!79268 (array_inv!20939 _keys!1487)))

(assert (=> start!79268 tp_is_empty!19989))

(declare-fun b!930875 () Bool)

(assert (=> b!930875 (= e!522756 (and e!522754 mapRes!31740))))

(declare-fun condMapEmpty!31740 () Bool)

(declare-fun mapDefault!31740 () ValueCell!9513)

(assert (=> b!930875 (= condMapEmpty!31740 (= (arr!26904 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9513)) mapDefault!31740)))))

(declare-fun b!930876 () Bool)

(assert (=> b!930876 (= e!522753 tp_is_empty!19989)))

(declare-fun b!930877 () Bool)

(declare-fun res!626904 () Bool)

(assert (=> b!930877 (=> (not res!626904) (not e!522752))))

(declare-datatypes ((List!18939 0))(
  ( (Nil!18936) (Cons!18935 (h!20081 (_ BitVec 64)) (t!26996 List!18939)) )
))
(declare-fun arrayNoDuplicates!0 (array!55920 (_ BitVec 32) List!18939) Bool)

(assert (=> b!930877 (= res!626904 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18936))))

(declare-fun mapIsEmpty!31740 () Bool)

(assert (=> mapIsEmpty!31740 mapRes!31740))

(declare-fun b!930878 () Bool)

(declare-fun res!626901 () Bool)

(assert (=> b!930878 (=> (not res!626901) (not e!522752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55920 (_ BitVec 32)) Bool)

(assert (=> b!930878 (= res!626901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79268 res!626905) b!930870))

(assert (= (and b!930870 res!626900) b!930878))

(assert (= (and b!930878 res!626901) b!930877))

(assert (= (and b!930877 res!626904) b!930874))

(assert (= (and b!930874 res!626903) b!930873))

(assert (= (and b!930873 res!626902) b!930871))

(assert (= (and b!930875 condMapEmpty!31740) mapIsEmpty!31740))

(assert (= (and b!930875 (not condMapEmpty!31740)) mapNonEmpty!31740))

(get-info :version)

(assert (= (and mapNonEmpty!31740 ((_ is ValueCellFull!9513) mapValue!31740)) b!930876))

(assert (= (and b!930875 ((_ is ValueCellFull!9513) mapDefault!31740)) b!930872))

(assert (= start!79268 b!930875))

(declare-fun m!864939 () Bool)

(assert (=> mapNonEmpty!31740 m!864939))

(declare-fun m!864941 () Bool)

(assert (=> b!930877 m!864941))

(declare-fun m!864943 () Bool)

(assert (=> start!79268 m!864943))

(declare-fun m!864945 () Bool)

(assert (=> start!79268 m!864945))

(declare-fun m!864947 () Bool)

(assert (=> start!79268 m!864947))

(declare-fun m!864949 () Bool)

(assert (=> b!930878 m!864949))

(declare-fun m!864951 () Bool)

(assert (=> b!930871 m!864951))

(declare-fun m!864953 () Bool)

(assert (=> b!930873 m!864953))

(declare-fun m!864955 () Bool)

(assert (=> b!930873 m!864955))

(check-sat (not b!930877) (not b!930871) (not mapNonEmpty!31740) (not start!79268) b_and!28547 (not b_next!17481) (not b!930878) tp_is_empty!19989 (not b!930873))
(check-sat b_and!28547 (not b_next!17481))
