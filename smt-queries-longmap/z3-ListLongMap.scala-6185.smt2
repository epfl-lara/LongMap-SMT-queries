; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79386 () Bool)

(assert start!79386)

(declare-fun b_free!17431 () Bool)

(declare-fun b_next!17431 () Bool)

(assert (=> start!79386 (= b_free!17431 (not b_next!17431))))

(declare-fun tp!60735 () Bool)

(declare-fun b_and!28507 () Bool)

(assert (=> start!79386 (= tp!60735 b_and!28507)))

(declare-fun mapIsEmpty!31665 () Bool)

(declare-fun mapRes!31665 () Bool)

(assert (=> mapIsEmpty!31665 mapRes!31665))

(declare-fun b!931032 () Bool)

(declare-fun res!626728 () Bool)

(declare-fun e!522889 () Bool)

(assert (=> b!931032 (=> (not res!626728) (not e!522889))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55883 0))(
  ( (array!55884 (arr!26882 (Array (_ BitVec 32) (_ BitVec 64))) (size!27342 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55883)

(assert (=> b!931032 (= res!626728 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27342 _keys!1487))))))

(declare-fun b!931033 () Bool)

(declare-fun res!626735 () Bool)

(declare-fun e!522887 () Bool)

(assert (=> b!931033 (=> (not res!626735) (not e!522887))))

(declare-datatypes ((V!31551 0))(
  ( (V!31552 (val!10020 Int)) )
))
(declare-fun v!791 () V!31551)

(declare-datatypes ((tuple2!13102 0))(
  ( (tuple2!13103 (_1!6562 (_ BitVec 64)) (_2!6562 V!31551)) )
))
(declare-datatypes ((List!18894 0))(
  ( (Nil!18891) (Cons!18890 (h!20042 tuple2!13102) (t!26943 List!18894)) )
))
(declare-datatypes ((ListLongMap!11801 0))(
  ( (ListLongMap!11802 (toList!5916 List!18894)) )
))
(declare-fun lt!419549 () ListLongMap!11801)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!756 (ListLongMap!11801 (_ BitVec 64)) V!31551)

(assert (=> b!931033 (= res!626735 (= (apply!756 lt!419549 k0!1099) v!791))))

(declare-fun mapNonEmpty!31665 () Bool)

(declare-fun tp!60734 () Bool)

(declare-fun e!522886 () Bool)

(assert (=> mapNonEmpty!31665 (= mapRes!31665 (and tp!60734 e!522886))))

(declare-fun mapKey!31665 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9488 0))(
  ( (ValueCellFull!9488 (v!12535 V!31551)) (EmptyCell!9488) )
))
(declare-fun mapValue!31665 () ValueCell!9488)

(declare-fun mapRest!31665 () (Array (_ BitVec 32) ValueCell!9488))

(declare-datatypes ((array!55885 0))(
  ( (array!55886 (arr!26883 (Array (_ BitVec 32) ValueCell!9488)) (size!27343 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55885)

(assert (=> mapNonEmpty!31665 (= (arr!26883 _values!1231) (store mapRest!31665 mapKey!31665 mapValue!31665))))

(declare-fun b!931034 () Bool)

(declare-fun res!626730 () Bool)

(assert (=> b!931034 (=> (not res!626730) (not e!522887))))

(assert (=> b!931034 (= res!626730 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931035 () Bool)

(declare-fun tp_is_empty!19939 () Bool)

(assert (=> b!931035 (= e!522886 tp_is_empty!19939)))

(declare-fun res!626734 () Bool)

(assert (=> start!79386 (=> (not res!626734) (not e!522889))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79386 (= res!626734 (validMask!0 mask!1881))))

(assert (=> start!79386 e!522889))

(assert (=> start!79386 true))

(assert (=> start!79386 tp_is_empty!19939))

(declare-fun e!522884 () Bool)

(declare-fun array_inv!21024 (array!55885) Bool)

(assert (=> start!79386 (and (array_inv!21024 _values!1231) e!522884)))

(assert (=> start!79386 tp!60735))

(declare-fun array_inv!21025 (array!55883) Bool)

(assert (=> start!79386 (array_inv!21025 _keys!1487)))

(declare-fun b!931036 () Bool)

(assert (=> b!931036 (= e!522887 (bvsgt #b00000000000000000000000000000000 (size!27342 _keys!1487)))))

(declare-fun b!931037 () Bool)

(declare-fun e!522888 () Bool)

(assert (=> b!931037 (= e!522884 (and e!522888 mapRes!31665))))

(declare-fun condMapEmpty!31665 () Bool)

(declare-fun mapDefault!31665 () ValueCell!9488)

(assert (=> b!931037 (= condMapEmpty!31665 (= (arr!26883 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9488)) mapDefault!31665)))))

(declare-fun b!931038 () Bool)

(declare-fun res!626729 () Bool)

(assert (=> b!931038 (=> (not res!626729) (not e!522889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55883 (_ BitVec 32)) Bool)

(assert (=> b!931038 (= res!626729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931039 () Bool)

(declare-fun res!626731 () Bool)

(assert (=> b!931039 (=> (not res!626731) (not e!522889))))

(declare-datatypes ((List!18895 0))(
  ( (Nil!18892) (Cons!18891 (h!20043 (_ BitVec 64)) (t!26944 List!18895)) )
))
(declare-fun arrayNoDuplicates!0 (array!55883 (_ BitVec 32) List!18895) Bool)

(assert (=> b!931039 (= res!626731 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18892))))

(declare-fun b!931040 () Bool)

(assert (=> b!931040 (= e!522889 e!522887)))

(declare-fun res!626736 () Bool)

(assert (=> b!931040 (=> (not res!626736) (not e!522887))))

(declare-fun contains!4983 (ListLongMap!11801 (_ BitVec 64)) Bool)

(assert (=> b!931040 (= res!626736 (contains!4983 lt!419549 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31551)

(declare-fun minValue!1173 () V!31551)

(declare-fun getCurrentListMap!3161 (array!55883 array!55885 (_ BitVec 32) (_ BitVec 32) V!31551 V!31551 (_ BitVec 32) Int) ListLongMap!11801)

(assert (=> b!931040 (= lt!419549 (getCurrentListMap!3161 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931041 () Bool)

(assert (=> b!931041 (= e!522888 tp_is_empty!19939)))

(declare-fun b!931042 () Bool)

(declare-fun res!626733 () Bool)

(assert (=> b!931042 (=> (not res!626733) (not e!522887))))

(assert (=> b!931042 (= res!626733 (contains!4983 (getCurrentListMap!3161 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!931043 () Bool)

(declare-fun res!626732 () Bool)

(assert (=> b!931043 (=> (not res!626732) (not e!522889))))

(assert (=> b!931043 (= res!626732 (and (= (size!27343 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27342 _keys!1487) (size!27343 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79386 res!626734) b!931043))

(assert (= (and b!931043 res!626732) b!931038))

(assert (= (and b!931038 res!626729) b!931039))

(assert (= (and b!931039 res!626731) b!931032))

(assert (= (and b!931032 res!626728) b!931040))

(assert (= (and b!931040 res!626736) b!931033))

(assert (= (and b!931033 res!626735) b!931034))

(assert (= (and b!931034 res!626730) b!931042))

(assert (= (and b!931042 res!626733) b!931036))

(assert (= (and b!931037 condMapEmpty!31665) mapIsEmpty!31665))

(assert (= (and b!931037 (not condMapEmpty!31665)) mapNonEmpty!31665))

(get-info :version)

(assert (= (and mapNonEmpty!31665 ((_ is ValueCellFull!9488) mapValue!31665)) b!931035))

(assert (= (and b!931037 ((_ is ValueCellFull!9488) mapDefault!31665)) b!931041))

(assert (= start!79386 b!931037))

(declare-fun m!865753 () Bool)

(assert (=> b!931038 m!865753))

(declare-fun m!865755 () Bool)

(assert (=> start!79386 m!865755))

(declare-fun m!865757 () Bool)

(assert (=> start!79386 m!865757))

(declare-fun m!865759 () Bool)

(assert (=> start!79386 m!865759))

(declare-fun m!865761 () Bool)

(assert (=> b!931033 m!865761))

(declare-fun m!865763 () Bool)

(assert (=> b!931040 m!865763))

(declare-fun m!865765 () Bool)

(assert (=> b!931040 m!865765))

(declare-fun m!865767 () Bool)

(assert (=> mapNonEmpty!31665 m!865767))

(declare-fun m!865769 () Bool)

(assert (=> b!931039 m!865769))

(declare-fun m!865771 () Bool)

(assert (=> b!931042 m!865771))

(assert (=> b!931042 m!865771))

(declare-fun m!865773 () Bool)

(assert (=> b!931042 m!865773))

(check-sat tp_is_empty!19939 (not b!931033) (not b!931038) (not mapNonEmpty!31665) (not start!79386) (not b!931040) (not b!931042) b_and!28507 (not b_next!17431) (not b!931039))
(check-sat b_and!28507 (not b_next!17431))
