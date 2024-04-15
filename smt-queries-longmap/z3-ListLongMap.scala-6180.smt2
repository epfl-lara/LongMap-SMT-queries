; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79170 () Bool)

(assert start!79170)

(declare-fun b_free!17401 () Bool)

(declare-fun b_next!17401 () Bool)

(assert (=> start!79170 (= b_free!17401 (not b_next!17401))))

(declare-fun tp!60645 () Bool)

(declare-fun b_and!28441 () Bool)

(assert (=> start!79170 (= tp!60645 b_and!28441)))

(declare-fun b!929393 () Bool)

(declare-fun res!625914 () Bool)

(declare-fun e!521886 () Bool)

(assert (=> b!929393 (=> (not res!625914) (not e!521886))))

(declare-datatypes ((array!55737 0))(
  ( (array!55738 (arr!26814 (Array (_ BitVec 32) (_ BitVec 64))) (size!27275 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55737)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31511 0))(
  ( (V!31512 (val!10005 Int)) )
))
(declare-datatypes ((ValueCell!9473 0))(
  ( (ValueCellFull!9473 (v!12522 V!31511)) (EmptyCell!9473) )
))
(declare-datatypes ((array!55739 0))(
  ( (array!55740 (arr!26815 (Array (_ BitVec 32) ValueCell!9473)) (size!27276 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55739)

(assert (=> b!929393 (= res!625914 (and (= (size!27276 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27275 _keys!1487) (size!27276 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929394 () Bool)

(declare-fun e!521884 () Bool)

(assert (=> b!929394 (= e!521884 false)))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!418865 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!31511)

(declare-fun minValue!1173 () V!31511)

(declare-datatypes ((tuple2!13134 0))(
  ( (tuple2!13135 (_1!6578 (_ BitVec 64)) (_2!6578 V!31511)) )
))
(declare-datatypes ((List!18896 0))(
  ( (Nil!18893) (Cons!18892 (h!20038 tuple2!13134) (t!26944 List!18896)) )
))
(declare-datatypes ((ListLongMap!11821 0))(
  ( (ListLongMap!11822 (toList!5926 List!18896)) )
))
(declare-fun contains!4932 (ListLongMap!11821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3106 (array!55737 array!55739 (_ BitVec 32) (_ BitVec 32) V!31511 V!31511 (_ BitVec 32) Int) ListLongMap!11821)

(assert (=> b!929394 (= lt!418865 (contains!4932 (getCurrentListMap!3106 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!929395 () Bool)

(declare-fun res!625919 () Bool)

(assert (=> b!929395 (=> (not res!625919) (not e!521884))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929395 (= res!625919 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun res!625916 () Bool)

(assert (=> start!79170 (=> (not res!625916) (not e!521886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79170 (= res!625916 (validMask!0 mask!1881))))

(assert (=> start!79170 e!521886))

(assert (=> start!79170 true))

(declare-fun tp_is_empty!19909 () Bool)

(assert (=> start!79170 tp_is_empty!19909))

(declare-fun e!521888 () Bool)

(declare-fun array_inv!20954 (array!55739) Bool)

(assert (=> start!79170 (and (array_inv!20954 _values!1231) e!521888)))

(assert (=> start!79170 tp!60645))

(declare-fun array_inv!20955 (array!55737) Bool)

(assert (=> start!79170 (array_inv!20955 _keys!1487)))

(declare-fun b!929396 () Bool)

(assert (=> b!929396 (= e!521886 e!521884)))

(declare-fun res!625912 () Bool)

(assert (=> b!929396 (=> (not res!625912) (not e!521884))))

(declare-fun lt!418864 () ListLongMap!11821)

(assert (=> b!929396 (= res!625912 (contains!4932 lt!418864 k0!1099))))

(assert (=> b!929396 (= lt!418864 (getCurrentListMap!3106 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929397 () Bool)

(declare-fun e!521885 () Bool)

(assert (=> b!929397 (= e!521885 tp_is_empty!19909)))

(declare-fun b!929398 () Bool)

(declare-fun e!521887 () Bool)

(assert (=> b!929398 (= e!521887 tp_is_empty!19909)))

(declare-fun mapNonEmpty!31620 () Bool)

(declare-fun mapRes!31620 () Bool)

(declare-fun tp!60644 () Bool)

(assert (=> mapNonEmpty!31620 (= mapRes!31620 (and tp!60644 e!521887))))

(declare-fun mapKey!31620 () (_ BitVec 32))

(declare-fun mapRest!31620 () (Array (_ BitVec 32) ValueCell!9473))

(declare-fun mapValue!31620 () ValueCell!9473)

(assert (=> mapNonEmpty!31620 (= (arr!26815 _values!1231) (store mapRest!31620 mapKey!31620 mapValue!31620))))

(declare-fun b!929399 () Bool)

(declare-fun res!625918 () Bool)

(assert (=> b!929399 (=> (not res!625918) (not e!521886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55737 (_ BitVec 32)) Bool)

(assert (=> b!929399 (= res!625918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929400 () Bool)

(declare-fun res!625915 () Bool)

(assert (=> b!929400 (=> (not res!625915) (not e!521886))))

(assert (=> b!929400 (= res!625915 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27275 _keys!1487))))))

(declare-fun mapIsEmpty!31620 () Bool)

(assert (=> mapIsEmpty!31620 mapRes!31620))

(declare-fun b!929401 () Bool)

(declare-fun res!625917 () Bool)

(assert (=> b!929401 (=> (not res!625917) (not e!521884))))

(declare-fun v!791 () V!31511)

(declare-fun apply!730 (ListLongMap!11821 (_ BitVec 64)) V!31511)

(assert (=> b!929401 (= res!625917 (= (apply!730 lt!418864 k0!1099) v!791))))

(declare-fun b!929402 () Bool)

(declare-fun res!625913 () Bool)

(assert (=> b!929402 (=> (not res!625913) (not e!521886))))

(declare-datatypes ((List!18897 0))(
  ( (Nil!18894) (Cons!18893 (h!20039 (_ BitVec 64)) (t!26945 List!18897)) )
))
(declare-fun arrayNoDuplicates!0 (array!55737 (_ BitVec 32) List!18897) Bool)

(assert (=> b!929402 (= res!625913 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18894))))

(declare-fun b!929403 () Bool)

(assert (=> b!929403 (= e!521888 (and e!521885 mapRes!31620))))

(declare-fun condMapEmpty!31620 () Bool)

(declare-fun mapDefault!31620 () ValueCell!9473)

(assert (=> b!929403 (= condMapEmpty!31620 (= (arr!26815 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9473)) mapDefault!31620)))))

(assert (= (and start!79170 res!625916) b!929393))

(assert (= (and b!929393 res!625914) b!929399))

(assert (= (and b!929399 res!625918) b!929402))

(assert (= (and b!929402 res!625913) b!929400))

(assert (= (and b!929400 res!625915) b!929396))

(assert (= (and b!929396 res!625912) b!929401))

(assert (= (and b!929401 res!625917) b!929395))

(assert (= (and b!929395 res!625919) b!929394))

(assert (= (and b!929403 condMapEmpty!31620) mapIsEmpty!31620))

(assert (= (and b!929403 (not condMapEmpty!31620)) mapNonEmpty!31620))

(get-info :version)

(assert (= (and mapNonEmpty!31620 ((_ is ValueCellFull!9473) mapValue!31620)) b!929398))

(assert (= (and b!929403 ((_ is ValueCellFull!9473) mapDefault!31620)) b!929397))

(assert (= start!79170 b!929403))

(declare-fun m!863371 () Bool)

(assert (=> b!929396 m!863371))

(declare-fun m!863373 () Bool)

(assert (=> b!929396 m!863373))

(declare-fun m!863375 () Bool)

(assert (=> mapNonEmpty!31620 m!863375))

(declare-fun m!863377 () Bool)

(assert (=> b!929399 m!863377))

(declare-fun m!863379 () Bool)

(assert (=> b!929401 m!863379))

(declare-fun m!863381 () Bool)

(assert (=> b!929394 m!863381))

(assert (=> b!929394 m!863381))

(declare-fun m!863383 () Bool)

(assert (=> b!929394 m!863383))

(declare-fun m!863385 () Bool)

(assert (=> start!79170 m!863385))

(declare-fun m!863387 () Bool)

(assert (=> start!79170 m!863387))

(declare-fun m!863389 () Bool)

(assert (=> start!79170 m!863389))

(declare-fun m!863391 () Bool)

(assert (=> b!929402 m!863391))

(check-sat (not b!929399) tp_is_empty!19909 b_and!28441 (not b!929394) (not b!929402) (not mapNonEmpty!31620) (not b!929396) (not b!929401) (not start!79170) (not b_next!17401))
(check-sat b_and!28441 (not b_next!17401))
