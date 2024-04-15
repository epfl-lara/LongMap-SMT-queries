; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79152 () Bool)

(assert start!79152)

(declare-fun b_free!17383 () Bool)

(declare-fun b_next!17383 () Bool)

(assert (=> start!79152 (= b_free!17383 (not b_next!17383))))

(declare-fun tp!60591 () Bool)

(declare-fun b_and!28423 () Bool)

(assert (=> start!79152 (= tp!60591 b_and!28423)))

(declare-fun b!929096 () Bool)

(declare-fun res!625700 () Bool)

(declare-fun e!521725 () Bool)

(assert (=> b!929096 (=> (not res!625700) (not e!521725))))

(declare-datatypes ((array!55703 0))(
  ( (array!55704 (arr!26797 (Array (_ BitVec 32) (_ BitVec 64))) (size!27258 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55703)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31487 0))(
  ( (V!31488 (val!9996 Int)) )
))
(declare-datatypes ((ValueCell!9464 0))(
  ( (ValueCellFull!9464 (v!12513 V!31487)) (EmptyCell!9464) )
))
(declare-datatypes ((array!55705 0))(
  ( (array!55706 (arr!26798 (Array (_ BitVec 32) ValueCell!9464)) (size!27259 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55705)

(assert (=> b!929096 (= res!625700 (and (= (size!27259 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27258 _keys!1487) (size!27259 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929097 () Bool)

(declare-fun e!521726 () Bool)

(declare-fun e!521722 () Bool)

(declare-fun mapRes!31593 () Bool)

(assert (=> b!929097 (= e!521726 (and e!521722 mapRes!31593))))

(declare-fun condMapEmpty!31593 () Bool)

(declare-fun mapDefault!31593 () ValueCell!9464)

(assert (=> b!929097 (= condMapEmpty!31593 (= (arr!26798 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9464)) mapDefault!31593)))))

(declare-fun mapIsEmpty!31593 () Bool)

(assert (=> mapIsEmpty!31593 mapRes!31593))

(declare-fun b!929098 () Bool)

(declare-fun res!625696 () Bool)

(assert (=> b!929098 (=> (not res!625696) (not e!521725))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929098 (= res!625696 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27258 _keys!1487))))))

(declare-fun b!929099 () Bool)

(declare-fun res!625703 () Bool)

(assert (=> b!929099 (=> (not res!625703) (not e!521725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55703 (_ BitVec 32)) Bool)

(assert (=> b!929099 (= res!625703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929100 () Bool)

(declare-fun tp_is_empty!19891 () Bool)

(assert (=> b!929100 (= e!521722 tp_is_empty!19891)))

(declare-fun mapNonEmpty!31593 () Bool)

(declare-fun tp!60590 () Bool)

(declare-fun e!521724 () Bool)

(assert (=> mapNonEmpty!31593 (= mapRes!31593 (and tp!60590 e!521724))))

(declare-fun mapRest!31593 () (Array (_ BitVec 32) ValueCell!9464))

(declare-fun mapValue!31593 () ValueCell!9464)

(declare-fun mapKey!31593 () (_ BitVec 32))

(assert (=> mapNonEmpty!31593 (= (arr!26798 _values!1231) (store mapRest!31593 mapKey!31593 mapValue!31593))))

(declare-fun res!625702 () Bool)

(assert (=> start!79152 (=> (not res!625702) (not e!521725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79152 (= res!625702 (validMask!0 mask!1881))))

(assert (=> start!79152 e!521725))

(assert (=> start!79152 true))

(assert (=> start!79152 tp_is_empty!19891))

(declare-fun array_inv!20944 (array!55705) Bool)

(assert (=> start!79152 (and (array_inv!20944 _values!1231) e!521726)))

(assert (=> start!79152 tp!60591))

(declare-fun array_inv!20945 (array!55703) Bool)

(assert (=> start!79152 (array_inv!20945 _keys!1487)))

(declare-fun b!929101 () Bool)

(declare-fun e!521727 () Bool)

(assert (=> b!929101 (= e!521727 false)))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!418810 () Bool)

(declare-fun zeroValue!1173 () V!31487)

(declare-fun minValue!1173 () V!31487)

(declare-datatypes ((tuple2!13116 0))(
  ( (tuple2!13117 (_1!6569 (_ BitVec 64)) (_2!6569 V!31487)) )
))
(declare-datatypes ((List!18881 0))(
  ( (Nil!18878) (Cons!18877 (h!20023 tuple2!13116) (t!26929 List!18881)) )
))
(declare-datatypes ((ListLongMap!11803 0))(
  ( (ListLongMap!11804 (toList!5917 List!18881)) )
))
(declare-fun contains!4924 (ListLongMap!11803 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3098 (array!55703 array!55705 (_ BitVec 32) (_ BitVec 32) V!31487 V!31487 (_ BitVec 32) Int) ListLongMap!11803)

(assert (=> b!929101 (= lt!418810 (contains!4924 (getCurrentListMap!3098 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!929102 () Bool)

(declare-fun res!625699 () Bool)

(assert (=> b!929102 (=> (not res!625699) (not e!521727))))

(declare-fun v!791 () V!31487)

(declare-fun lt!418811 () ListLongMap!11803)

(declare-fun apply!724 (ListLongMap!11803 (_ BitVec 64)) V!31487)

(assert (=> b!929102 (= res!625699 (= (apply!724 lt!418811 k0!1099) v!791))))

(declare-fun b!929103 () Bool)

(assert (=> b!929103 (= e!521725 e!521727)))

(declare-fun res!625697 () Bool)

(assert (=> b!929103 (=> (not res!625697) (not e!521727))))

(assert (=> b!929103 (= res!625697 (contains!4924 lt!418811 k0!1099))))

(assert (=> b!929103 (= lt!418811 (getCurrentListMap!3098 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929104 () Bool)

(declare-fun res!625701 () Bool)

(assert (=> b!929104 (=> (not res!625701) (not e!521725))))

(declare-datatypes ((List!18882 0))(
  ( (Nil!18879) (Cons!18878 (h!20024 (_ BitVec 64)) (t!26930 List!18882)) )
))
(declare-fun arrayNoDuplicates!0 (array!55703 (_ BitVec 32) List!18882) Bool)

(assert (=> b!929104 (= res!625701 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18879))))

(declare-fun b!929105 () Bool)

(declare-fun res!625698 () Bool)

(assert (=> b!929105 (=> (not res!625698) (not e!521727))))

(assert (=> b!929105 (= res!625698 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929106 () Bool)

(assert (=> b!929106 (= e!521724 tp_is_empty!19891)))

(assert (= (and start!79152 res!625702) b!929096))

(assert (= (and b!929096 res!625700) b!929099))

(assert (= (and b!929099 res!625703) b!929104))

(assert (= (and b!929104 res!625701) b!929098))

(assert (= (and b!929098 res!625696) b!929103))

(assert (= (and b!929103 res!625697) b!929102))

(assert (= (and b!929102 res!625699) b!929105))

(assert (= (and b!929105 res!625698) b!929101))

(assert (= (and b!929097 condMapEmpty!31593) mapIsEmpty!31593))

(assert (= (and b!929097 (not condMapEmpty!31593)) mapNonEmpty!31593))

(get-info :version)

(assert (= (and mapNonEmpty!31593 ((_ is ValueCellFull!9464) mapValue!31593)) b!929106))

(assert (= (and b!929097 ((_ is ValueCellFull!9464) mapDefault!31593)) b!929100))

(assert (= start!79152 b!929097))

(declare-fun m!863173 () Bool)

(assert (=> b!929102 m!863173))

(declare-fun m!863175 () Bool)

(assert (=> b!929101 m!863175))

(assert (=> b!929101 m!863175))

(declare-fun m!863177 () Bool)

(assert (=> b!929101 m!863177))

(declare-fun m!863179 () Bool)

(assert (=> b!929099 m!863179))

(declare-fun m!863181 () Bool)

(assert (=> mapNonEmpty!31593 m!863181))

(declare-fun m!863183 () Bool)

(assert (=> start!79152 m!863183))

(declare-fun m!863185 () Bool)

(assert (=> start!79152 m!863185))

(declare-fun m!863187 () Bool)

(assert (=> start!79152 m!863187))

(declare-fun m!863189 () Bool)

(assert (=> b!929103 m!863189))

(declare-fun m!863191 () Bool)

(assert (=> b!929103 m!863191))

(declare-fun m!863193 () Bool)

(assert (=> b!929104 m!863193))

(check-sat (not b!929101) (not b_next!17383) (not b!929103) (not start!79152) tp_is_empty!19891 b_and!28423 (not b!929104) (not b!929102) (not b!929099) (not mapNonEmpty!31593))
(check-sat b_and!28423 (not b_next!17383))
