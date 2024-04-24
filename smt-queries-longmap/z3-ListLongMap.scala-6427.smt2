; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82526 () Bool)

(assert start!82526)

(declare-fun b_free!18625 () Bool)

(declare-fun b_next!18625 () Bool)

(assert (=> start!82526 (= b_free!18625 (not b_next!18625))))

(declare-fun tp!64846 () Bool)

(declare-fun b_and!30123 () Bool)

(assert (=> start!82526 (= tp!64846 b_and!30123)))

(declare-fun b!961163 () Bool)

(declare-fun res!643124 () Bool)

(declare-fun e!541884 () Bool)

(assert (=> b!961163 (=> (not res!643124) (not e!541884))))

(declare-datatypes ((array!58796 0))(
  ( (array!58797 (arr!28267 (Array (_ BitVec 32) (_ BitVec 64))) (size!28747 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58796)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961163 (= res!643124 (validKeyInArray!0 (select (arr!28267 _keys!1668) i!793)))))

(declare-fun b!961164 () Bool)

(declare-fun res!643128 () Bool)

(assert (=> b!961164 (=> (not res!643128) (not e!541884))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!961164 (= res!643128 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28747 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28747 _keys!1668))))))

(declare-fun mapIsEmpty!33985 () Bool)

(declare-fun mapRes!33985 () Bool)

(assert (=> mapIsEmpty!33985 mapRes!33985))

(declare-fun b!961165 () Bool)

(declare-fun e!541886 () Bool)

(declare-fun e!541883 () Bool)

(assert (=> b!961165 (= e!541886 (and e!541883 mapRes!33985))))

(declare-fun condMapEmpty!33985 () Bool)

(declare-datatypes ((V!33433 0))(
  ( (V!33434 (val!10719 Int)) )
))
(declare-datatypes ((ValueCell!10187 0))(
  ( (ValueCellFull!10187 (v!13273 V!33433)) (EmptyCell!10187) )
))
(declare-datatypes ((array!58798 0))(
  ( (array!58799 (arr!28268 (Array (_ BitVec 32) ValueCell!10187)) (size!28748 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58798)

(declare-fun mapDefault!33985 () ValueCell!10187)

(assert (=> b!961165 (= condMapEmpty!33985 (= (arr!28268 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10187)) mapDefault!33985)))))

(declare-fun b!961166 () Bool)

(declare-fun e!541887 () Bool)

(declare-fun tp_is_empty!21337 () Bool)

(assert (=> b!961166 (= e!541887 tp_is_empty!21337)))

(declare-fun res!643125 () Bool)

(assert (=> start!82526 (=> (not res!643125) (not e!541884))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82526 (= res!643125 (validMask!0 mask!2088))))

(assert (=> start!82526 e!541884))

(assert (=> start!82526 true))

(assert (=> start!82526 tp_is_empty!21337))

(declare-fun array_inv!21989 (array!58796) Bool)

(assert (=> start!82526 (array_inv!21989 _keys!1668)))

(declare-fun array_inv!21990 (array!58798) Bool)

(assert (=> start!82526 (and (array_inv!21990 _values!1386) e!541886)))

(assert (=> start!82526 tp!64846))

(declare-fun b!961167 () Bool)

(assert (=> b!961167 (= e!541884 false)))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun minValue!1328 () V!33433)

(declare-fun lt!430990 () Bool)

(declare-fun zeroValue!1328 () V!33433)

(declare-datatypes ((tuple2!13808 0))(
  ( (tuple2!13809 (_1!6915 (_ BitVec 64)) (_2!6915 V!33433)) )
))
(declare-datatypes ((List!19637 0))(
  ( (Nil!19634) (Cons!19633 (h!20801 tuple2!13808) (t!27992 List!19637)) )
))
(declare-datatypes ((ListLongMap!12507 0))(
  ( (ListLongMap!12508 (toList!6269 List!19637)) )
))
(declare-fun contains!5381 (ListLongMap!12507 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3502 (array!58796 array!58798 (_ BitVec 32) (_ BitVec 32) V!33433 V!33433 (_ BitVec 32) Int) ListLongMap!12507)

(assert (=> b!961167 (= lt!430990 (contains!5381 (getCurrentListMap!3502 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28267 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33985 () Bool)

(declare-fun tp!64845 () Bool)

(assert (=> mapNonEmpty!33985 (= mapRes!33985 (and tp!64845 e!541887))))

(declare-fun mapRest!33985 () (Array (_ BitVec 32) ValueCell!10187))

(declare-fun mapValue!33985 () ValueCell!10187)

(declare-fun mapKey!33985 () (_ BitVec 32))

(assert (=> mapNonEmpty!33985 (= (arr!28268 _values!1386) (store mapRest!33985 mapKey!33985 mapValue!33985))))

(declare-fun b!961168 () Bool)

(declare-fun res!643129 () Bool)

(assert (=> b!961168 (=> (not res!643129) (not e!541884))))

(assert (=> b!961168 (= res!643129 (and (= (size!28748 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28747 _keys!1668) (size!28748 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!961169 () Bool)

(declare-fun res!643127 () Bool)

(assert (=> b!961169 (=> (not res!643127) (not e!541884))))

(declare-datatypes ((List!19638 0))(
  ( (Nil!19635) (Cons!19634 (h!20802 (_ BitVec 64)) (t!27993 List!19638)) )
))
(declare-fun arrayNoDuplicates!0 (array!58796 (_ BitVec 32) List!19638) Bool)

(assert (=> b!961169 (= res!643127 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19635))))

(declare-fun b!961170 () Bool)

(assert (=> b!961170 (= e!541883 tp_is_empty!21337)))

(declare-fun b!961171 () Bool)

(declare-fun res!643126 () Bool)

(assert (=> b!961171 (=> (not res!643126) (not e!541884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58796 (_ BitVec 32)) Bool)

(assert (=> b!961171 (= res!643126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82526 res!643125) b!961168))

(assert (= (and b!961168 res!643129) b!961171))

(assert (= (and b!961171 res!643126) b!961169))

(assert (= (and b!961169 res!643127) b!961164))

(assert (= (and b!961164 res!643128) b!961163))

(assert (= (and b!961163 res!643124) b!961167))

(assert (= (and b!961165 condMapEmpty!33985) mapIsEmpty!33985))

(assert (= (and b!961165 (not condMapEmpty!33985)) mapNonEmpty!33985))

(get-info :version)

(assert (= (and mapNonEmpty!33985 ((_ is ValueCellFull!10187) mapValue!33985)) b!961166))

(assert (= (and b!961165 ((_ is ValueCellFull!10187) mapDefault!33985)) b!961170))

(assert (= start!82526 b!961165))

(declare-fun m!891843 () Bool)

(assert (=> b!961171 m!891843))

(declare-fun m!891845 () Bool)

(assert (=> b!961167 m!891845))

(declare-fun m!891847 () Bool)

(assert (=> b!961167 m!891847))

(assert (=> b!961167 m!891845))

(assert (=> b!961167 m!891847))

(declare-fun m!891849 () Bool)

(assert (=> b!961167 m!891849))

(declare-fun m!891851 () Bool)

(assert (=> b!961169 m!891851))

(declare-fun m!891853 () Bool)

(assert (=> mapNonEmpty!33985 m!891853))

(assert (=> b!961163 m!891847))

(assert (=> b!961163 m!891847))

(declare-fun m!891855 () Bool)

(assert (=> b!961163 m!891855))

(declare-fun m!891857 () Bool)

(assert (=> start!82526 m!891857))

(declare-fun m!891859 () Bool)

(assert (=> start!82526 m!891859))

(declare-fun m!891861 () Bool)

(assert (=> start!82526 m!891861))

(check-sat (not mapNonEmpty!33985) (not start!82526) (not b!961171) b_and!30123 (not b!961167) (not b!961169) tp_is_empty!21337 (not b!961163) (not b_next!18625))
(check-sat b_and!30123 (not b_next!18625))
