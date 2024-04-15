; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79200 () Bool)

(assert start!79200)

(declare-fun b_free!17431 () Bool)

(declare-fun b_next!17431 () Bool)

(assert (=> start!79200 (= b_free!17431 (not b_next!17431))))

(declare-fun tp!60735 () Bool)

(declare-fun b_and!28471 () Bool)

(assert (=> start!79200 (= tp!60735 b_and!28471)))

(declare-fun res!626274 () Bool)

(declare-fun e!522159 () Bool)

(assert (=> start!79200 (=> (not res!626274) (not e!522159))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79200 (= res!626274 (validMask!0 mask!1881))))

(assert (=> start!79200 e!522159))

(assert (=> start!79200 true))

(declare-fun tp_is_empty!19939 () Bool)

(assert (=> start!79200 tp_is_empty!19939))

(declare-datatypes ((V!31551 0))(
  ( (V!31552 (val!10020 Int)) )
))
(declare-datatypes ((ValueCell!9488 0))(
  ( (ValueCellFull!9488 (v!12537 V!31551)) (EmptyCell!9488) )
))
(declare-datatypes ((array!55791 0))(
  ( (array!55792 (arr!26841 (Array (_ BitVec 32) ValueCell!9488)) (size!27302 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55791)

(declare-fun e!522158 () Bool)

(declare-fun array_inv!20972 (array!55791) Bool)

(assert (=> start!79200 (and (array_inv!20972 _values!1231) e!522158)))

(assert (=> start!79200 tp!60735))

(declare-datatypes ((array!55793 0))(
  ( (array!55794 (arr!26842 (Array (_ BitVec 32) (_ BitVec 64))) (size!27303 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55793)

(declare-fun array_inv!20973 (array!55793) Bool)

(assert (=> start!79200 (array_inv!20973 _keys!1487)))

(declare-fun b!929890 () Bool)

(declare-fun e!522157 () Bool)

(assert (=> b!929890 (= e!522159 e!522157)))

(declare-fun res!626277 () Bool)

(assert (=> b!929890 (=> (not res!626277) (not e!522157))))

(declare-datatypes ((tuple2!13156 0))(
  ( (tuple2!13157 (_1!6589 (_ BitVec 64)) (_2!6589 V!31551)) )
))
(declare-datatypes ((List!18915 0))(
  ( (Nil!18912) (Cons!18911 (h!20057 tuple2!13156) (t!26963 List!18915)) )
))
(declare-datatypes ((ListLongMap!11843 0))(
  ( (ListLongMap!11844 (toList!5937 List!18915)) )
))
(declare-fun lt!418952 () ListLongMap!11843)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4942 (ListLongMap!11843 (_ BitVec 64)) Bool)

(assert (=> b!929890 (= res!626277 (contains!4942 lt!418952 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31551)

(declare-fun minValue!1173 () V!31551)

(declare-fun getCurrentListMap!3116 (array!55793 array!55791 (_ BitVec 32) (_ BitVec 32) V!31551 V!31551 (_ BitVec 32) Int) ListLongMap!11843)

(assert (=> b!929890 (= lt!418952 (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929891 () Bool)

(declare-fun res!626280 () Bool)

(assert (=> b!929891 (=> (not res!626280) (not e!522157))))

(assert (=> b!929891 (= res!626280 (contains!4942 (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun mapNonEmpty!31665 () Bool)

(declare-fun mapRes!31665 () Bool)

(declare-fun tp!60734 () Bool)

(declare-fun e!522155 () Bool)

(assert (=> mapNonEmpty!31665 (= mapRes!31665 (and tp!60734 e!522155))))

(declare-fun mapKey!31665 () (_ BitVec 32))

(declare-fun mapRest!31665 () (Array (_ BitVec 32) ValueCell!9488))

(declare-fun mapValue!31665 () ValueCell!9488)

(assert (=> mapNonEmpty!31665 (= (arr!26841 _values!1231) (store mapRest!31665 mapKey!31665 mapValue!31665))))

(declare-fun b!929892 () Bool)

(declare-fun res!626278 () Bool)

(assert (=> b!929892 (=> (not res!626278) (not e!522159))))

(assert (=> b!929892 (= res!626278 (and (= (size!27302 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27303 _keys!1487) (size!27302 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929893 () Bool)

(declare-fun e!522154 () Bool)

(assert (=> b!929893 (= e!522158 (and e!522154 mapRes!31665))))

(declare-fun condMapEmpty!31665 () Bool)

(declare-fun mapDefault!31665 () ValueCell!9488)

(assert (=> b!929893 (= condMapEmpty!31665 (= (arr!26841 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9488)) mapDefault!31665)))))

(declare-fun b!929894 () Bool)

(declare-fun res!626281 () Bool)

(assert (=> b!929894 (=> (not res!626281) (not e!522159))))

(declare-datatypes ((List!18916 0))(
  ( (Nil!18913) (Cons!18912 (h!20058 (_ BitVec 64)) (t!26964 List!18916)) )
))
(declare-fun arrayNoDuplicates!0 (array!55793 (_ BitVec 32) List!18916) Bool)

(assert (=> b!929894 (= res!626281 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18913))))

(declare-fun b!929895 () Bool)

(assert (=> b!929895 (= e!522155 tp_is_empty!19939)))

(declare-fun b!929896 () Bool)

(assert (=> b!929896 (= e!522154 tp_is_empty!19939)))

(declare-fun b!929897 () Bool)

(declare-fun res!626282 () Bool)

(assert (=> b!929897 (=> (not res!626282) (not e!522159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55793 (_ BitVec 32)) Bool)

(assert (=> b!929897 (= res!626282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929898 () Bool)

(declare-fun res!626276 () Bool)

(assert (=> b!929898 (=> (not res!626276) (not e!522159))))

(assert (=> b!929898 (= res!626276 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27303 _keys!1487))))))

(declare-fun b!929899 () Bool)

(declare-fun res!626275 () Bool)

(assert (=> b!929899 (=> (not res!626275) (not e!522157))))

(assert (=> b!929899 (= res!626275 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31665 () Bool)

(assert (=> mapIsEmpty!31665 mapRes!31665))

(declare-fun b!929900 () Bool)

(declare-fun res!626279 () Bool)

(assert (=> b!929900 (=> (not res!626279) (not e!522157))))

(declare-fun v!791 () V!31551)

(declare-fun apply!739 (ListLongMap!11843 (_ BitVec 64)) V!31551)

(assert (=> b!929900 (= res!626279 (= (apply!739 lt!418952 k0!1099) v!791))))

(declare-fun b!929901 () Bool)

(assert (=> b!929901 (= e!522157 (bvsgt #b00000000000000000000000000000000 (size!27303 _keys!1487)))))

(assert (= (and start!79200 res!626274) b!929892))

(assert (= (and b!929892 res!626278) b!929897))

(assert (= (and b!929897 res!626282) b!929894))

(assert (= (and b!929894 res!626281) b!929898))

(assert (= (and b!929898 res!626276) b!929890))

(assert (= (and b!929890 res!626277) b!929900))

(assert (= (and b!929900 res!626279) b!929899))

(assert (= (and b!929899 res!626275) b!929891))

(assert (= (and b!929891 res!626280) b!929901))

(assert (= (and b!929893 condMapEmpty!31665) mapIsEmpty!31665))

(assert (= (and b!929893 (not condMapEmpty!31665)) mapNonEmpty!31665))

(get-info :version)

(assert (= (and mapNonEmpty!31665 ((_ is ValueCellFull!9488) mapValue!31665)) b!929895))

(assert (= (and b!929893 ((_ is ValueCellFull!9488) mapDefault!31665)) b!929896))

(assert (= start!79200 b!929893))

(declare-fun m!863701 () Bool)

(assert (=> b!929891 m!863701))

(assert (=> b!929891 m!863701))

(declare-fun m!863703 () Bool)

(assert (=> b!929891 m!863703))

(declare-fun m!863705 () Bool)

(assert (=> mapNonEmpty!31665 m!863705))

(declare-fun m!863707 () Bool)

(assert (=> b!929900 m!863707))

(declare-fun m!863709 () Bool)

(assert (=> b!929897 m!863709))

(declare-fun m!863711 () Bool)

(assert (=> b!929894 m!863711))

(declare-fun m!863713 () Bool)

(assert (=> b!929890 m!863713))

(declare-fun m!863715 () Bool)

(assert (=> b!929890 m!863715))

(declare-fun m!863717 () Bool)

(assert (=> start!79200 m!863717))

(declare-fun m!863719 () Bool)

(assert (=> start!79200 m!863719))

(declare-fun m!863721 () Bool)

(assert (=> start!79200 m!863721))

(check-sat (not b!929891) (not b_next!17431) (not start!79200) (not mapNonEmpty!31665) (not b!929900) (not b!929894) (not b!929897) (not b!929890) b_and!28471 tp_is_empty!19939)
(check-sat b_and!28471 (not b_next!17431))
