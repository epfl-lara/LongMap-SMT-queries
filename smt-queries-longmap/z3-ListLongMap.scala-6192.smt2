; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79428 () Bool)

(assert start!79428)

(declare-fun b_free!17473 () Bool)

(declare-fun b_next!17473 () Bool)

(assert (=> start!79428 (= b_free!17473 (not b_next!17473))))

(declare-fun tp!60861 () Bool)

(declare-fun b_and!28549 () Bool)

(assert (=> start!79428 (= tp!60861 b_and!28549)))

(declare-fun mapNonEmpty!31728 () Bool)

(declare-fun mapRes!31728 () Bool)

(declare-fun tp!60860 () Bool)

(declare-fun e!523263 () Bool)

(assert (=> mapNonEmpty!31728 (= mapRes!31728 (and tp!60860 e!523263))))

(declare-datatypes ((V!31607 0))(
  ( (V!31608 (val!10041 Int)) )
))
(declare-datatypes ((ValueCell!9509 0))(
  ( (ValueCellFull!9509 (v!12556 V!31607)) (EmptyCell!9509) )
))
(declare-fun mapValue!31728 () ValueCell!9509)

(declare-fun mapKey!31728 () (_ BitVec 32))

(declare-datatypes ((array!55967 0))(
  ( (array!55968 (arr!26924 (Array (_ BitVec 32) ValueCell!9509)) (size!27384 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55967)

(declare-fun mapRest!31728 () (Array (_ BitVec 32) ValueCell!9509))

(assert (=> mapNonEmpty!31728 (= (arr!26924 _values!1231) (store mapRest!31728 mapKey!31728 mapValue!31728))))

(declare-fun b!931665 () Bool)

(declare-fun res!627175 () Bool)

(declare-fun e!523264 () Bool)

(assert (=> b!931665 (=> (not res!627175) (not e!523264))))

(declare-datatypes ((array!55969 0))(
  ( (array!55970 (arr!26925 (Array (_ BitVec 32) (_ BitVec 64))) (size!27385 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55969)

(declare-datatypes ((List!18927 0))(
  ( (Nil!18924) (Cons!18923 (h!20075 (_ BitVec 64)) (t!26976 List!18927)) )
))
(declare-fun arrayNoDuplicates!0 (array!55969 (_ BitVec 32) List!18927) Bool)

(assert (=> b!931665 (= res!627175 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18924))))

(declare-fun res!627174 () Bool)

(assert (=> start!79428 (=> (not res!627174) (not e!523264))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79428 (= res!627174 (validMask!0 mask!1881))))

(assert (=> start!79428 e!523264))

(assert (=> start!79428 true))

(declare-fun e!523265 () Bool)

(declare-fun array_inv!21052 (array!55967) Bool)

(assert (=> start!79428 (and (array_inv!21052 _values!1231) e!523265)))

(assert (=> start!79428 tp!60861))

(declare-fun array_inv!21053 (array!55969) Bool)

(assert (=> start!79428 (array_inv!21053 _keys!1487)))

(declare-fun tp_is_empty!19981 () Bool)

(assert (=> start!79428 tp_is_empty!19981))

(declare-fun mapIsEmpty!31728 () Bool)

(assert (=> mapIsEmpty!31728 mapRes!31728))

(declare-fun b!931666 () Bool)

(declare-fun e!523266 () Bool)

(assert (=> b!931666 (= e!523266 false)))

(declare-fun lt!419659 () V!31607)

(declare-datatypes ((tuple2!13138 0))(
  ( (tuple2!13139 (_1!6580 (_ BitVec 64)) (_2!6580 V!31607)) )
))
(declare-datatypes ((List!18928 0))(
  ( (Nil!18925) (Cons!18924 (h!20076 tuple2!13138) (t!26977 List!18928)) )
))
(declare-datatypes ((ListLongMap!11837 0))(
  ( (ListLongMap!11838 (toList!5934 List!18928)) )
))
(declare-fun lt!419660 () ListLongMap!11837)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!770 (ListLongMap!11837 (_ BitVec 64)) V!31607)

(assert (=> b!931666 (= lt!419659 (apply!770 lt!419660 k0!1099))))

(declare-fun b!931667 () Bool)

(assert (=> b!931667 (= e!523263 tp_is_empty!19981)))

(declare-fun b!931668 () Bool)

(declare-fun e!523262 () Bool)

(assert (=> b!931668 (= e!523265 (and e!523262 mapRes!31728))))

(declare-fun condMapEmpty!31728 () Bool)

(declare-fun mapDefault!31728 () ValueCell!9509)

(assert (=> b!931668 (= condMapEmpty!31728 (= (arr!26924 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9509)) mapDefault!31728)))))

(declare-fun b!931669 () Bool)

(declare-fun res!627173 () Bool)

(assert (=> b!931669 (=> (not res!627173) (not e!523264))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931669 (= res!627173 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27385 _keys!1487))))))

(declare-fun b!931670 () Bool)

(assert (=> b!931670 (= e!523262 tp_is_empty!19981)))

(declare-fun b!931671 () Bool)

(declare-fun res!627177 () Bool)

(assert (=> b!931671 (=> (not res!627177) (not e!523264))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931671 (= res!627177 (and (= (size!27384 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27385 _keys!1487) (size!27384 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931672 () Bool)

(declare-fun res!627172 () Bool)

(assert (=> b!931672 (=> (not res!627172) (not e!523264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55969 (_ BitVec 32)) Bool)

(assert (=> b!931672 (= res!627172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931673 () Bool)

(assert (=> b!931673 (= e!523264 e!523266)))

(declare-fun res!627176 () Bool)

(assert (=> b!931673 (=> (not res!627176) (not e!523266))))

(declare-fun contains!5000 (ListLongMap!11837 (_ BitVec 64)) Bool)

(assert (=> b!931673 (= res!627176 (contains!5000 lt!419660 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31607)

(declare-fun minValue!1173 () V!31607)

(declare-fun getCurrentListMap!3178 (array!55969 array!55967 (_ BitVec 32) (_ BitVec 32) V!31607 V!31607 (_ BitVec 32) Int) ListLongMap!11837)

(assert (=> b!931673 (= lt!419660 (getCurrentListMap!3178 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79428 res!627174) b!931671))

(assert (= (and b!931671 res!627177) b!931672))

(assert (= (and b!931672 res!627172) b!931665))

(assert (= (and b!931665 res!627175) b!931669))

(assert (= (and b!931669 res!627173) b!931673))

(assert (= (and b!931673 res!627176) b!931666))

(assert (= (and b!931668 condMapEmpty!31728) mapIsEmpty!31728))

(assert (= (and b!931668 (not condMapEmpty!31728)) mapNonEmpty!31728))

(get-info :version)

(assert (= (and mapNonEmpty!31728 ((_ is ValueCellFull!9509) mapValue!31728)) b!931667))

(assert (= (and b!931668 ((_ is ValueCellFull!9509) mapDefault!31728)) b!931670))

(assert (= start!79428 b!931668))

(declare-fun m!866161 () Bool)

(assert (=> mapNonEmpty!31728 m!866161))

(declare-fun m!866163 () Bool)

(assert (=> b!931673 m!866163))

(declare-fun m!866165 () Bool)

(assert (=> b!931673 m!866165))

(declare-fun m!866167 () Bool)

(assert (=> b!931665 m!866167))

(declare-fun m!866169 () Bool)

(assert (=> start!79428 m!866169))

(declare-fun m!866171 () Bool)

(assert (=> start!79428 m!866171))

(declare-fun m!866173 () Bool)

(assert (=> start!79428 m!866173))

(declare-fun m!866175 () Bool)

(assert (=> b!931672 m!866175))

(declare-fun m!866177 () Bool)

(assert (=> b!931666 m!866177))

(check-sat (not b_next!17473) (not b!931666) (not b!931672) (not b!931673) (not b!931665) (not mapNonEmpty!31728) b_and!28549 tp_is_empty!19981 (not start!79428))
(check-sat b_and!28549 (not b_next!17473))
