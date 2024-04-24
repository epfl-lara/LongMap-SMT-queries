; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82538 () Bool)

(assert start!82538)

(declare-fun b_free!18637 () Bool)

(declare-fun b_next!18637 () Bool)

(assert (=> start!82538 (= b_free!18637 (not b_next!18637))))

(declare-fun tp!64881 () Bool)

(declare-fun b_and!30135 () Bool)

(assert (=> start!82538 (= tp!64881 b_and!30135)))

(declare-fun b!961325 () Bool)

(declare-fun res!643235 () Bool)

(declare-fun e!541977 () Bool)

(assert (=> b!961325 (=> (not res!643235) (not e!541977))))

(declare-datatypes ((array!58820 0))(
  ( (array!58821 (arr!28279 (Array (_ BitVec 32) (_ BitVec 64))) (size!28759 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58820)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!961325 (= res!643235 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28759 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28759 _keys!1668))))))

(declare-fun b!961326 () Bool)

(declare-fun e!541974 () Bool)

(declare-fun tp_is_empty!21349 () Bool)

(assert (=> b!961326 (= e!541974 tp_is_empty!21349)))

(declare-fun b!961327 () Bool)

(assert (=> b!961327 (= e!541977 false)))

(declare-datatypes ((V!33449 0))(
  ( (V!33450 (val!10725 Int)) )
))
(declare-fun minValue!1328 () V!33449)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10193 0))(
  ( (ValueCellFull!10193 (v!13279 V!33449)) (EmptyCell!10193) )
))
(declare-datatypes ((array!58822 0))(
  ( (array!58823 (arr!28280 (Array (_ BitVec 32) ValueCell!10193)) (size!28760 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58822)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33449)

(declare-fun lt!431008 () Bool)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((tuple2!13812 0))(
  ( (tuple2!13813 (_1!6917 (_ BitVec 64)) (_2!6917 V!33449)) )
))
(declare-datatypes ((List!19642 0))(
  ( (Nil!19639) (Cons!19638 (h!20806 tuple2!13812) (t!27997 List!19642)) )
))
(declare-datatypes ((ListLongMap!12511 0))(
  ( (ListLongMap!12512 (toList!6271 List!19642)) )
))
(declare-fun contains!5383 (ListLongMap!12511 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3504 (array!58820 array!58822 (_ BitVec 32) (_ BitVec 32) V!33449 V!33449 (_ BitVec 32) Int) ListLongMap!12511)

(assert (=> b!961327 (= lt!431008 (contains!5383 (getCurrentListMap!3504 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28279 _keys!1668) i!793)))))

(declare-fun b!961328 () Bool)

(declare-fun res!643234 () Bool)

(assert (=> b!961328 (=> (not res!643234) (not e!541977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58820 (_ BitVec 32)) Bool)

(assert (=> b!961328 (= res!643234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!34003 () Bool)

(declare-fun mapRes!34003 () Bool)

(declare-fun tp!64882 () Bool)

(assert (=> mapNonEmpty!34003 (= mapRes!34003 (and tp!64882 e!541974))))

(declare-fun mapRest!34003 () (Array (_ BitVec 32) ValueCell!10193))

(declare-fun mapKey!34003 () (_ BitVec 32))

(declare-fun mapValue!34003 () ValueCell!10193)

(assert (=> mapNonEmpty!34003 (= (arr!28280 _values!1386) (store mapRest!34003 mapKey!34003 mapValue!34003))))

(declare-fun b!961329 () Bool)

(declare-fun e!541973 () Bool)

(declare-fun e!541976 () Bool)

(assert (=> b!961329 (= e!541973 (and e!541976 mapRes!34003))))

(declare-fun condMapEmpty!34003 () Bool)

(declare-fun mapDefault!34003 () ValueCell!10193)

(assert (=> b!961329 (= condMapEmpty!34003 (= (arr!28280 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10193)) mapDefault!34003)))))

(declare-fun b!961330 () Bool)

(declare-fun res!643236 () Bool)

(assert (=> b!961330 (=> (not res!643236) (not e!541977))))

(assert (=> b!961330 (= res!643236 (and (= (size!28760 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28759 _keys!1668) (size!28760 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!643237 () Bool)

(assert (=> start!82538 (=> (not res!643237) (not e!541977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82538 (= res!643237 (validMask!0 mask!2088))))

(assert (=> start!82538 e!541977))

(assert (=> start!82538 true))

(assert (=> start!82538 tp_is_empty!21349))

(declare-fun array_inv!21999 (array!58820) Bool)

(assert (=> start!82538 (array_inv!21999 _keys!1668)))

(declare-fun array_inv!22000 (array!58822) Bool)

(assert (=> start!82538 (and (array_inv!22000 _values!1386) e!541973)))

(assert (=> start!82538 tp!64881))

(declare-fun b!961331 () Bool)

(declare-fun res!643232 () Bool)

(assert (=> b!961331 (=> (not res!643232) (not e!541977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961331 (= res!643232 (validKeyInArray!0 (select (arr!28279 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!34003 () Bool)

(assert (=> mapIsEmpty!34003 mapRes!34003))

(declare-fun b!961332 () Bool)

(assert (=> b!961332 (= e!541976 tp_is_empty!21349)))

(declare-fun b!961333 () Bool)

(declare-fun res!643233 () Bool)

(assert (=> b!961333 (=> (not res!643233) (not e!541977))))

(declare-datatypes ((List!19643 0))(
  ( (Nil!19640) (Cons!19639 (h!20807 (_ BitVec 64)) (t!27998 List!19643)) )
))
(declare-fun arrayNoDuplicates!0 (array!58820 (_ BitVec 32) List!19643) Bool)

(assert (=> b!961333 (= res!643233 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19640))))

(assert (= (and start!82538 res!643237) b!961330))

(assert (= (and b!961330 res!643236) b!961328))

(assert (= (and b!961328 res!643234) b!961333))

(assert (= (and b!961333 res!643233) b!961325))

(assert (= (and b!961325 res!643235) b!961331))

(assert (= (and b!961331 res!643232) b!961327))

(assert (= (and b!961329 condMapEmpty!34003) mapIsEmpty!34003))

(assert (= (and b!961329 (not condMapEmpty!34003)) mapNonEmpty!34003))

(get-info :version)

(assert (= (and mapNonEmpty!34003 ((_ is ValueCellFull!10193) mapValue!34003)) b!961326))

(assert (= (and b!961329 ((_ is ValueCellFull!10193) mapDefault!34003)) b!961332))

(assert (= start!82538 b!961329))

(declare-fun m!891963 () Bool)

(assert (=> b!961328 m!891963))

(declare-fun m!891965 () Bool)

(assert (=> start!82538 m!891965))

(declare-fun m!891967 () Bool)

(assert (=> start!82538 m!891967))

(declare-fun m!891969 () Bool)

(assert (=> start!82538 m!891969))

(declare-fun m!891971 () Bool)

(assert (=> mapNonEmpty!34003 m!891971))

(declare-fun m!891973 () Bool)

(assert (=> b!961331 m!891973))

(assert (=> b!961331 m!891973))

(declare-fun m!891975 () Bool)

(assert (=> b!961331 m!891975))

(declare-fun m!891977 () Bool)

(assert (=> b!961327 m!891977))

(assert (=> b!961327 m!891973))

(assert (=> b!961327 m!891977))

(assert (=> b!961327 m!891973))

(declare-fun m!891979 () Bool)

(assert (=> b!961327 m!891979))

(declare-fun m!891981 () Bool)

(assert (=> b!961333 m!891981))

(check-sat (not b!961327) (not b!961333) (not b_next!18637) (not b!961331) (not b!961328) (not mapNonEmpty!34003) (not start!82538) b_and!30135 tp_is_empty!21349)
(check-sat b_and!30135 (not b_next!18637))
