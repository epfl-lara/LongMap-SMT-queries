; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82336 () Bool)

(assert start!82336)

(declare-fun b_free!18603 () Bool)

(declare-fun b_next!18603 () Bool)

(assert (=> start!82336 (= b_free!18603 (not b_next!18603))))

(declare-fun tp!64779 () Bool)

(declare-fun b_and!30091 () Bool)

(assert (=> start!82336 (= tp!64779 b_and!30091)))

(declare-fun b!959963 () Bool)

(declare-fun e!541139 () Bool)

(declare-fun tp_is_empty!21315 () Bool)

(assert (=> b!959963 (= e!541139 tp_is_empty!21315)))

(declare-fun b!959964 () Bool)

(declare-fun res!642582 () Bool)

(declare-fun e!541136 () Bool)

(assert (=> b!959964 (=> (not res!642582) (not e!541136))))

(declare-datatypes ((array!58721 0))(
  ( (array!58722 (arr!28234 (Array (_ BitVec 32) (_ BitVec 64))) (size!28713 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58721)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959964 (= res!642582 (validKeyInArray!0 (select (arr!28234 _keys!1668) i!793)))))

(declare-fun b!959965 () Bool)

(declare-fun res!642587 () Bool)

(assert (=> b!959965 (=> (not res!642587) (not e!541136))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959965 (= res!642587 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28713 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28713 _keys!1668))))))

(declare-fun b!959966 () Bool)

(declare-fun e!541137 () Bool)

(assert (=> b!959966 (= e!541137 tp_is_empty!21315)))

(declare-fun b!959967 () Bool)

(assert (=> b!959967 (= e!541136 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33403 0))(
  ( (V!33404 (val!10708 Int)) )
))
(declare-fun minValue!1328 () V!33403)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10176 0))(
  ( (ValueCellFull!10176 (v!13265 V!33403)) (EmptyCell!10176) )
))
(declare-datatypes ((array!58723 0))(
  ( (array!58724 (arr!28235 (Array (_ BitVec 32) ValueCell!10176)) (size!28714 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58723)

(declare-fun lt!430596 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33403)

(declare-datatypes ((tuple2!13812 0))(
  ( (tuple2!13813 (_1!6917 (_ BitVec 64)) (_2!6917 V!33403)) )
))
(declare-datatypes ((List!19633 0))(
  ( (Nil!19630) (Cons!19629 (h!20791 tuple2!13812) (t!27996 List!19633)) )
))
(declare-datatypes ((ListLongMap!12509 0))(
  ( (ListLongMap!12510 (toList!6270 List!19633)) )
))
(declare-fun contains!5369 (ListLongMap!12509 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3503 (array!58721 array!58723 (_ BitVec 32) (_ BitVec 32) V!33403 V!33403 (_ BitVec 32) Int) ListLongMap!12509)

(assert (=> b!959967 (= lt!430596 (contains!5369 (getCurrentListMap!3503 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28234 _keys!1668) i!793)))))

(declare-fun b!959968 () Bool)

(declare-fun res!642583 () Bool)

(assert (=> b!959968 (=> (not res!642583) (not e!541136))))

(declare-datatypes ((List!19634 0))(
  ( (Nil!19631) (Cons!19630 (h!20792 (_ BitVec 64)) (t!27997 List!19634)) )
))
(declare-fun arrayNoDuplicates!0 (array!58721 (_ BitVec 32) List!19634) Bool)

(assert (=> b!959968 (= res!642583 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19631))))

(declare-fun b!959969 () Bool)

(declare-fun res!642584 () Bool)

(assert (=> b!959969 (=> (not res!642584) (not e!541136))))

(assert (=> b!959969 (= res!642584 (and (= (size!28714 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28713 _keys!1668) (size!28714 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33952 () Bool)

(declare-fun mapRes!33952 () Bool)

(declare-fun tp!64778 () Bool)

(assert (=> mapNonEmpty!33952 (= mapRes!33952 (and tp!64778 e!541137))))

(declare-fun mapRest!33952 () (Array (_ BitVec 32) ValueCell!10176))

(declare-fun mapValue!33952 () ValueCell!10176)

(declare-fun mapKey!33952 () (_ BitVec 32))

(assert (=> mapNonEmpty!33952 (= (arr!28235 _values!1386) (store mapRest!33952 mapKey!33952 mapValue!33952))))

(declare-fun b!959971 () Bool)

(declare-fun res!642586 () Bool)

(assert (=> b!959971 (=> (not res!642586) (not e!541136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58721 (_ BitVec 32)) Bool)

(assert (=> b!959971 (= res!642586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33952 () Bool)

(assert (=> mapIsEmpty!33952 mapRes!33952))

(declare-fun res!642585 () Bool)

(assert (=> start!82336 (=> (not res!642585) (not e!541136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82336 (= res!642585 (validMask!0 mask!2088))))

(assert (=> start!82336 e!541136))

(assert (=> start!82336 true))

(assert (=> start!82336 tp_is_empty!21315))

(declare-fun array_inv!21879 (array!58721) Bool)

(assert (=> start!82336 (array_inv!21879 _keys!1668)))

(declare-fun e!541140 () Bool)

(declare-fun array_inv!21880 (array!58723) Bool)

(assert (=> start!82336 (and (array_inv!21880 _values!1386) e!541140)))

(assert (=> start!82336 tp!64779))

(declare-fun b!959970 () Bool)

(assert (=> b!959970 (= e!541140 (and e!541139 mapRes!33952))))

(declare-fun condMapEmpty!33952 () Bool)

(declare-fun mapDefault!33952 () ValueCell!10176)

(assert (=> b!959970 (= condMapEmpty!33952 (= (arr!28235 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10176)) mapDefault!33952)))))

(assert (= (and start!82336 res!642585) b!959969))

(assert (= (and b!959969 res!642584) b!959971))

(assert (= (and b!959971 res!642586) b!959968))

(assert (= (and b!959968 res!642583) b!959965))

(assert (= (and b!959965 res!642587) b!959964))

(assert (= (and b!959964 res!642582) b!959967))

(assert (= (and b!959970 condMapEmpty!33952) mapIsEmpty!33952))

(assert (= (and b!959970 (not condMapEmpty!33952)) mapNonEmpty!33952))

(get-info :version)

(assert (= (and mapNonEmpty!33952 ((_ is ValueCellFull!10176) mapValue!33952)) b!959966))

(assert (= (and b!959970 ((_ is ValueCellFull!10176) mapDefault!33952)) b!959963))

(assert (= start!82336 b!959970))

(declare-fun m!890329 () Bool)

(assert (=> b!959967 m!890329))

(declare-fun m!890331 () Bool)

(assert (=> b!959967 m!890331))

(assert (=> b!959967 m!890329))

(assert (=> b!959967 m!890331))

(declare-fun m!890333 () Bool)

(assert (=> b!959967 m!890333))

(declare-fun m!890335 () Bool)

(assert (=> start!82336 m!890335))

(declare-fun m!890337 () Bool)

(assert (=> start!82336 m!890337))

(declare-fun m!890339 () Bool)

(assert (=> start!82336 m!890339))

(declare-fun m!890341 () Bool)

(assert (=> b!959968 m!890341))

(declare-fun m!890343 () Bool)

(assert (=> mapNonEmpty!33952 m!890343))

(assert (=> b!959964 m!890331))

(assert (=> b!959964 m!890331))

(declare-fun m!890345 () Bool)

(assert (=> b!959964 m!890345))

(declare-fun m!890347 () Bool)

(assert (=> b!959971 m!890347))

(check-sat tp_is_empty!21315 (not start!82336) b_and!30091 (not b!959968) (not mapNonEmpty!33952) (not b!959964) (not b!959967) (not b_next!18603) (not b!959971))
(check-sat b_and!30091 (not b_next!18603))
