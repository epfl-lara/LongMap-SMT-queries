; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79194 () Bool)

(assert start!79194)

(declare-fun b_free!17425 () Bool)

(declare-fun b_next!17425 () Bool)

(assert (=> start!79194 (= b_free!17425 (not b_next!17425))))

(declare-fun tp!60717 () Bool)

(declare-fun b_and!28465 () Bool)

(assert (=> start!79194 (= tp!60717 b_and!28465)))

(declare-fun b!929789 () Bool)

(declare-fun e!522100 () Bool)

(declare-fun tp_is_empty!19933 () Bool)

(assert (=> b!929789 (= e!522100 tp_is_empty!19933)))

(declare-fun mapIsEmpty!31656 () Bool)

(declare-fun mapRes!31656 () Bool)

(assert (=> mapIsEmpty!31656 mapRes!31656))

(declare-fun res!626207 () Bool)

(declare-fun e!522102 () Bool)

(assert (=> start!79194 (=> (not res!626207) (not e!522102))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79194 (= res!626207 (validMask!0 mask!1881))))

(assert (=> start!79194 e!522102))

(assert (=> start!79194 true))

(assert (=> start!79194 tp_is_empty!19933))

(declare-datatypes ((V!31543 0))(
  ( (V!31544 (val!10017 Int)) )
))
(declare-datatypes ((ValueCell!9485 0))(
  ( (ValueCellFull!9485 (v!12534 V!31543)) (EmptyCell!9485) )
))
(declare-datatypes ((array!55783 0))(
  ( (array!55784 (arr!26837 (Array (_ BitVec 32) ValueCell!9485)) (size!27298 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55783)

(declare-fun e!522104 () Bool)

(declare-fun array_inv!20970 (array!55783) Bool)

(assert (=> start!79194 (and (array_inv!20970 _values!1231) e!522104)))

(assert (=> start!79194 tp!60717))

(declare-datatypes ((array!55785 0))(
  ( (array!55786 (arr!26838 (Array (_ BitVec 32) (_ BitVec 64))) (size!27299 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55785)

(declare-fun array_inv!20971 (array!55785) Bool)

(assert (=> start!79194 (array_inv!20971 _keys!1487)))

(declare-fun b!929790 () Bool)

(declare-fun res!626206 () Bool)

(declare-fun e!522103 () Bool)

(assert (=> b!929790 (=> (not res!626206) (not e!522103))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929790 (= res!626206 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31656 () Bool)

(declare-fun tp!60716 () Bool)

(assert (=> mapNonEmpty!31656 (= mapRes!31656 (and tp!60716 e!522100))))

(declare-fun mapRest!31656 () (Array (_ BitVec 32) ValueCell!9485))

(declare-fun mapValue!31656 () ValueCell!9485)

(declare-fun mapKey!31656 () (_ BitVec 32))

(assert (=> mapNonEmpty!31656 (= (arr!26837 _values!1231) (store mapRest!31656 mapKey!31656 mapValue!31656))))

(declare-fun b!929791 () Bool)

(declare-fun res!626203 () Bool)

(assert (=> b!929791 (=> (not res!626203) (not e!522102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55785 (_ BitVec 32)) Bool)

(assert (=> b!929791 (= res!626203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929792 () Bool)

(assert (=> b!929792 (= e!522102 e!522103)))

(declare-fun res!626205 () Bool)

(assert (=> b!929792 (=> (not res!626205) (not e!522103))))

(declare-datatypes ((tuple2!13154 0))(
  ( (tuple2!13155 (_1!6588 (_ BitVec 64)) (_2!6588 V!31543)) )
))
(declare-datatypes ((List!18913 0))(
  ( (Nil!18910) (Cons!18909 (h!20055 tuple2!13154) (t!26961 List!18913)) )
))
(declare-datatypes ((ListLongMap!11841 0))(
  ( (ListLongMap!11842 (toList!5936 List!18913)) )
))
(declare-fun lt!418936 () ListLongMap!11841)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4941 (ListLongMap!11841 (_ BitVec 64)) Bool)

(assert (=> b!929792 (= res!626205 (contains!4941 lt!418936 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31543)

(declare-fun minValue!1173 () V!31543)

(declare-fun getCurrentListMap!3115 (array!55785 array!55783 (_ BitVec 32) (_ BitVec 32) V!31543 V!31543 (_ BitVec 32) Int) ListLongMap!11841)

(assert (=> b!929792 (= lt!418936 (getCurrentListMap!3115 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929793 () Bool)

(declare-fun res!626202 () Bool)

(assert (=> b!929793 (=> (not res!626202) (not e!522102))))

(assert (=> b!929793 (= res!626202 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27299 _keys!1487))))))

(declare-fun b!929794 () Bool)

(declare-fun res!626200 () Bool)

(assert (=> b!929794 (=> (not res!626200) (not e!522102))))

(declare-datatypes ((List!18914 0))(
  ( (Nil!18911) (Cons!18910 (h!20056 (_ BitVec 64)) (t!26962 List!18914)) )
))
(declare-fun arrayNoDuplicates!0 (array!55785 (_ BitVec 32) List!18914) Bool)

(assert (=> b!929794 (= res!626200 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18911))))

(declare-fun b!929795 () Bool)

(declare-fun e!522101 () Bool)

(assert (=> b!929795 (= e!522104 (and e!522101 mapRes!31656))))

(declare-fun condMapEmpty!31656 () Bool)

(declare-fun mapDefault!31656 () ValueCell!9485)

(assert (=> b!929795 (= condMapEmpty!31656 (= (arr!26837 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9485)) mapDefault!31656)))))

(declare-fun b!929796 () Bool)

(assert (=> b!929796 (= e!522101 tp_is_empty!19933)))

(declare-fun b!929797 () Bool)

(declare-fun res!626204 () Bool)

(assert (=> b!929797 (=> (not res!626204) (not e!522103))))

(declare-fun v!791 () V!31543)

(declare-fun apply!738 (ListLongMap!11841 (_ BitVec 64)) V!31543)

(assert (=> b!929797 (= res!626204 (= (apply!738 lt!418936 k0!1099) v!791))))

(declare-fun b!929798 () Bool)

(assert (=> b!929798 (= e!522103 false)))

(declare-fun lt!418937 () Bool)

(assert (=> b!929798 (= lt!418937 (contains!4941 (getCurrentListMap!3115 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!929799 () Bool)

(declare-fun res!626201 () Bool)

(assert (=> b!929799 (=> (not res!626201) (not e!522102))))

(assert (=> b!929799 (= res!626201 (and (= (size!27298 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27299 _keys!1487) (size!27298 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79194 res!626207) b!929799))

(assert (= (and b!929799 res!626201) b!929791))

(assert (= (and b!929791 res!626203) b!929794))

(assert (= (and b!929794 res!626200) b!929793))

(assert (= (and b!929793 res!626202) b!929792))

(assert (= (and b!929792 res!626205) b!929797))

(assert (= (and b!929797 res!626204) b!929790))

(assert (= (and b!929790 res!626206) b!929798))

(assert (= (and b!929795 condMapEmpty!31656) mapIsEmpty!31656))

(assert (= (and b!929795 (not condMapEmpty!31656)) mapNonEmpty!31656))

(get-info :version)

(assert (= (and mapNonEmpty!31656 ((_ is ValueCellFull!9485) mapValue!31656)) b!929789))

(assert (= (and b!929795 ((_ is ValueCellFull!9485) mapDefault!31656)) b!929796))

(assert (= start!79194 b!929795))

(declare-fun m!863635 () Bool)

(assert (=> mapNonEmpty!31656 m!863635))

(declare-fun m!863637 () Bool)

(assert (=> b!929794 m!863637))

(declare-fun m!863639 () Bool)

(assert (=> start!79194 m!863639))

(declare-fun m!863641 () Bool)

(assert (=> start!79194 m!863641))

(declare-fun m!863643 () Bool)

(assert (=> start!79194 m!863643))

(declare-fun m!863645 () Bool)

(assert (=> b!929798 m!863645))

(assert (=> b!929798 m!863645))

(declare-fun m!863647 () Bool)

(assert (=> b!929798 m!863647))

(declare-fun m!863649 () Bool)

(assert (=> b!929792 m!863649))

(declare-fun m!863651 () Bool)

(assert (=> b!929792 m!863651))

(declare-fun m!863653 () Bool)

(assert (=> b!929791 m!863653))

(declare-fun m!863655 () Bool)

(assert (=> b!929797 m!863655))

(check-sat (not start!79194) (not b!929792) (not b!929794) (not b!929798) (not b!929791) (not b!929797) b_and!28465 (not mapNonEmpty!31656) (not b_next!17425) tp_is_empty!19933)
(check-sat b_and!28465 (not b_next!17425))
