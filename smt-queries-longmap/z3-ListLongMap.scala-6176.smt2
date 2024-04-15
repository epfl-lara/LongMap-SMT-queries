; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79146 () Bool)

(assert start!79146)

(declare-fun b_free!17377 () Bool)

(declare-fun b_next!17377 () Bool)

(assert (=> start!79146 (= b_free!17377 (not b_next!17377))))

(declare-fun tp!60572 () Bool)

(declare-fun b_and!28417 () Bool)

(assert (=> start!79146 (= tp!60572 b_and!28417)))

(declare-fun mapIsEmpty!31584 () Bool)

(declare-fun mapRes!31584 () Bool)

(assert (=> mapIsEmpty!31584 mapRes!31584))

(declare-fun b!929004 () Bool)

(declare-fun res!625637 () Bool)

(declare-fun e!521671 () Bool)

(assert (=> b!929004 (=> (not res!625637) (not e!521671))))

(declare-datatypes ((array!55695 0))(
  ( (array!55696 (arr!26793 (Array (_ BitVec 32) (_ BitVec 64))) (size!27254 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55695)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31479 0))(
  ( (V!31480 (val!9993 Int)) )
))
(declare-datatypes ((ValueCell!9461 0))(
  ( (ValueCellFull!9461 (v!12510 V!31479)) (EmptyCell!9461) )
))
(declare-datatypes ((array!55697 0))(
  ( (array!55698 (arr!26794 (Array (_ BitVec 32) ValueCell!9461)) (size!27255 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55697)

(assert (=> b!929004 (= res!625637 (and (= (size!27255 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27254 _keys!1487) (size!27255 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929005 () Bool)

(declare-fun res!625635 () Bool)

(declare-fun e!521673 () Bool)

(assert (=> b!929005 (=> (not res!625635) (not e!521673))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31479)

(declare-datatypes ((tuple2!13112 0))(
  ( (tuple2!13113 (_1!6567 (_ BitVec 64)) (_2!6567 V!31479)) )
))
(declare-datatypes ((List!18878 0))(
  ( (Nil!18875) (Cons!18874 (h!20020 tuple2!13112) (t!26926 List!18878)) )
))
(declare-datatypes ((ListLongMap!11799 0))(
  ( (ListLongMap!11800 (toList!5915 List!18878)) )
))
(declare-fun lt!418799 () ListLongMap!11799)

(declare-fun apply!722 (ListLongMap!11799 (_ BitVec 64)) V!31479)

(assert (=> b!929005 (= res!625635 (= (apply!722 lt!418799 k0!1099) v!791))))

(declare-fun b!929006 () Bool)

(declare-fun res!625633 () Bool)

(assert (=> b!929006 (=> (not res!625633) (not e!521671))))

(declare-datatypes ((List!18879 0))(
  ( (Nil!18876) (Cons!18875 (h!20021 (_ BitVec 64)) (t!26927 List!18879)) )
))
(declare-fun arrayNoDuplicates!0 (array!55695 (_ BitVec 32) List!18879) Bool)

(assert (=> b!929006 (= res!625633 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18876))))

(declare-fun mapNonEmpty!31584 () Bool)

(declare-fun tp!60573 () Bool)

(declare-fun e!521670 () Bool)

(assert (=> mapNonEmpty!31584 (= mapRes!31584 (and tp!60573 e!521670))))

(declare-fun mapKey!31584 () (_ BitVec 32))

(declare-fun mapRest!31584 () (Array (_ BitVec 32) ValueCell!9461))

(declare-fun mapValue!31584 () ValueCell!9461)

(assert (=> mapNonEmpty!31584 (= (arr!26794 _values!1231) (store mapRest!31584 mapKey!31584 mapValue!31584))))

(declare-fun b!929007 () Bool)

(declare-fun res!625636 () Bool)

(assert (=> b!929007 (=> (not res!625636) (not e!521671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55695 (_ BitVec 32)) Bool)

(assert (=> b!929007 (= res!625636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929008 () Bool)

(declare-fun e!521669 () Bool)

(declare-fun e!521672 () Bool)

(assert (=> b!929008 (= e!521669 (and e!521672 mapRes!31584))))

(declare-fun condMapEmpty!31584 () Bool)

(declare-fun mapDefault!31584 () ValueCell!9461)

(assert (=> b!929008 (= condMapEmpty!31584 (= (arr!26794 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9461)) mapDefault!31584)))))

(declare-fun b!929009 () Bool)

(declare-fun res!625634 () Bool)

(assert (=> b!929009 (=> (not res!625634) (not e!521671))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929009 (= res!625634 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27254 _keys!1487))))))

(declare-fun b!929010 () Bool)

(assert (=> b!929010 (= e!521671 e!521673)))

(declare-fun res!625632 () Bool)

(assert (=> b!929010 (=> (not res!625632) (not e!521673))))

(declare-fun contains!4923 (ListLongMap!11799 (_ BitVec 64)) Bool)

(assert (=> b!929010 (= res!625632 (contains!4923 lt!418799 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31479)

(declare-fun minValue!1173 () V!31479)

(declare-fun getCurrentListMap!3097 (array!55695 array!55697 (_ BitVec 32) (_ BitVec 32) V!31479 V!31479 (_ BitVec 32) Int) ListLongMap!11799)

(assert (=> b!929010 (= lt!418799 (getCurrentListMap!3097 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929011 () Bool)

(declare-fun tp_is_empty!19885 () Bool)

(assert (=> b!929011 (= e!521672 tp_is_empty!19885)))

(declare-fun res!625631 () Bool)

(assert (=> start!79146 (=> (not res!625631) (not e!521671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79146 (= res!625631 (validMask!0 mask!1881))))

(assert (=> start!79146 e!521671))

(assert (=> start!79146 true))

(assert (=> start!79146 tp_is_empty!19885))

(declare-fun array_inv!20942 (array!55697) Bool)

(assert (=> start!79146 (and (array_inv!20942 _values!1231) e!521669)))

(assert (=> start!79146 tp!60572))

(declare-fun array_inv!20943 (array!55695) Bool)

(assert (=> start!79146 (array_inv!20943 _keys!1487)))

(declare-fun b!929012 () Bool)

(assert (=> b!929012 (= e!521673 (and (bvsle from!1844 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (size!27254 _keys!1487))))))

(declare-fun b!929013 () Bool)

(assert (=> b!929013 (= e!521670 tp_is_empty!19885)))

(assert (= (and start!79146 res!625631) b!929004))

(assert (= (and b!929004 res!625637) b!929007))

(assert (= (and b!929007 res!625636) b!929006))

(assert (= (and b!929006 res!625633) b!929009))

(assert (= (and b!929009 res!625634) b!929010))

(assert (= (and b!929010 res!625632) b!929005))

(assert (= (and b!929005 res!625635) b!929012))

(assert (= (and b!929008 condMapEmpty!31584) mapIsEmpty!31584))

(assert (= (and b!929008 (not condMapEmpty!31584)) mapNonEmpty!31584))

(get-info :version)

(assert (= (and mapNonEmpty!31584 ((_ is ValueCellFull!9461) mapValue!31584)) b!929013))

(assert (= (and b!929008 ((_ is ValueCellFull!9461) mapDefault!31584)) b!929011))

(assert (= start!79146 b!929008))

(declare-fun m!863119 () Bool)

(assert (=> b!929006 m!863119))

(declare-fun m!863121 () Bool)

(assert (=> mapNonEmpty!31584 m!863121))

(declare-fun m!863123 () Bool)

(assert (=> b!929005 m!863123))

(declare-fun m!863125 () Bool)

(assert (=> b!929007 m!863125))

(declare-fun m!863127 () Bool)

(assert (=> start!79146 m!863127))

(declare-fun m!863129 () Bool)

(assert (=> start!79146 m!863129))

(declare-fun m!863131 () Bool)

(assert (=> start!79146 m!863131))

(declare-fun m!863133 () Bool)

(assert (=> b!929010 m!863133))

(declare-fun m!863135 () Bool)

(assert (=> b!929010 m!863135))

(check-sat (not b!929006) (not start!79146) tp_is_empty!19885 (not b!929010) b_and!28417 (not b!929005) (not b_next!17377) (not b!929007) (not mapNonEmpty!31584))
(check-sat b_and!28417 (not b_next!17377))
