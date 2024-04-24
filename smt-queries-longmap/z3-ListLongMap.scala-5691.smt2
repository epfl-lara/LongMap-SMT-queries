; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74098 () Bool)

(assert start!74098)

(declare-fun b_free!14845 () Bool)

(declare-fun b_next!14845 () Bool)

(assert (=> start!74098 (= b_free!14845 (not b_next!14845))))

(declare-fun tp!52039 () Bool)

(declare-fun b_and!24607 () Bool)

(assert (=> start!74098 (= tp!52039 b_and!24607)))

(declare-fun mapIsEmpty!27071 () Bool)

(declare-fun mapRes!27071 () Bool)

(assert (=> mapIsEmpty!27071 mapRes!27071))

(declare-fun b!869766 () Bool)

(declare-fun res!590768 () Bool)

(declare-fun e!484486 () Bool)

(assert (=> b!869766 (=> (not res!590768) (not e!484486))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50171 0))(
  ( (array!50172 (arr!24112 (Array (_ BitVec 32) (_ BitVec 64))) (size!24553 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50171)

(assert (=> b!869766 (= res!590768 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24553 _keys!868))))))

(declare-fun b!869767 () Bool)

(declare-fun e!484489 () Bool)

(assert (=> b!869767 (= e!484486 e!484489)))

(declare-fun res!590766 () Bool)

(assert (=> b!869767 (=> (not res!590766) (not e!484489))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869767 (= res!590766 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27689 0))(
  ( (V!27690 (val!8538 Int)) )
))
(declare-datatypes ((tuple2!11266 0))(
  ( (tuple2!11267 (_1!5644 (_ BitVec 64)) (_2!5644 V!27689)) )
))
(declare-datatypes ((List!17088 0))(
  ( (Nil!17085) (Cons!17084 (h!18221 tuple2!11266) (t!24117 List!17088)) )
))
(declare-datatypes ((ListLongMap!10037 0))(
  ( (ListLongMap!10038 (toList!5034 List!17088)) )
))
(declare-fun lt!394971 () ListLongMap!10037)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27689)

(declare-fun zeroValue!654 () V!27689)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8051 0))(
  ( (ValueCellFull!8051 (v!10963 V!27689)) (EmptyCell!8051) )
))
(declare-datatypes ((array!50173 0))(
  ( (array!50174 (arr!24113 (Array (_ BitVec 32) ValueCell!8051)) (size!24554 (_ BitVec 32))) )
))
(declare-fun lt!394970 () array!50173)

(declare-fun getCurrentListMapNoExtraKeys!3078 (array!50171 array!50173 (_ BitVec 32) (_ BitVec 32) V!27689 V!27689 (_ BitVec 32) Int) ListLongMap!10037)

(assert (=> b!869767 (= lt!394971 (getCurrentListMapNoExtraKeys!3078 _keys!868 lt!394970 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27689)

(declare-fun _values!688 () array!50173)

(assert (=> b!869767 (= lt!394970 (array!50174 (store (arr!24113 _values!688) i!612 (ValueCellFull!8051 v!557)) (size!24554 _values!688)))))

(declare-fun lt!394973 () ListLongMap!10037)

(assert (=> b!869767 (= lt!394973 (getCurrentListMapNoExtraKeys!3078 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869768 () Bool)

(declare-fun e!484488 () Bool)

(declare-fun tp_is_empty!16981 () Bool)

(assert (=> b!869768 (= e!484488 tp_is_empty!16981)))

(declare-fun res!590773 () Bool)

(assert (=> start!74098 (=> (not res!590773) (not e!484486))))

(assert (=> start!74098 (= res!590773 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24553 _keys!868))))))

(assert (=> start!74098 e!484486))

(assert (=> start!74098 tp_is_empty!16981))

(assert (=> start!74098 true))

(assert (=> start!74098 tp!52039))

(declare-fun array_inv!19102 (array!50171) Bool)

(assert (=> start!74098 (array_inv!19102 _keys!868)))

(declare-fun e!484484 () Bool)

(declare-fun array_inv!19103 (array!50173) Bool)

(assert (=> start!74098 (and (array_inv!19103 _values!688) e!484484)))

(declare-fun b!869769 () Bool)

(declare-fun e!484485 () Bool)

(assert (=> b!869769 (= e!484485 tp_is_empty!16981)))

(declare-fun b!869770 () Bool)

(declare-fun res!590770 () Bool)

(assert (=> b!869770 (=> (not res!590770) (not e!484486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50171 (_ BitVec 32)) Bool)

(assert (=> b!869770 (= res!590770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869771 () Bool)

(declare-fun res!590767 () Bool)

(assert (=> b!869771 (=> (not res!590767) (not e!484486))))

(declare-datatypes ((List!17089 0))(
  ( (Nil!17086) (Cons!17085 (h!18222 (_ BitVec 64)) (t!24118 List!17089)) )
))
(declare-fun arrayNoDuplicates!0 (array!50171 (_ BitVec 32) List!17089) Bool)

(assert (=> b!869771 (= res!590767 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17086))))

(declare-fun b!869772 () Bool)

(declare-fun res!590772 () Bool)

(assert (=> b!869772 (=> (not res!590772) (not e!484486))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!869772 (= res!590772 (and (= (select (arr!24112 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27071 () Bool)

(declare-fun tp!52040 () Bool)

(assert (=> mapNonEmpty!27071 (= mapRes!27071 (and tp!52040 e!484485))))

(declare-fun mapRest!27071 () (Array (_ BitVec 32) ValueCell!8051))

(declare-fun mapKey!27071 () (_ BitVec 32))

(declare-fun mapValue!27071 () ValueCell!8051)

(assert (=> mapNonEmpty!27071 (= (arr!24113 _values!688) (store mapRest!27071 mapKey!27071 mapValue!27071))))

(declare-fun b!869773 () Bool)

(assert (=> b!869773 (= e!484484 (and e!484488 mapRes!27071))))

(declare-fun condMapEmpty!27071 () Bool)

(declare-fun mapDefault!27071 () ValueCell!8051)

(assert (=> b!869773 (= condMapEmpty!27071 (= (arr!24113 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8051)) mapDefault!27071)))))

(declare-fun b!869774 () Bool)

(declare-fun res!590771 () Bool)

(assert (=> b!869774 (=> (not res!590771) (not e!484486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869774 (= res!590771 (validKeyInArray!0 k0!854))))

(declare-fun b!869775 () Bool)

(declare-fun res!590769 () Bool)

(assert (=> b!869775 (=> (not res!590769) (not e!484486))))

(assert (=> b!869775 (= res!590769 (and (= (size!24554 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24553 _keys!868) (size!24554 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869776 () Bool)

(assert (=> b!869776 (= e!484489 (not true))))

(declare-fun +!2430 (ListLongMap!10037 tuple2!11266) ListLongMap!10037)

(assert (=> b!869776 (= (getCurrentListMapNoExtraKeys!3078 _keys!868 lt!394970 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2430 (getCurrentListMapNoExtraKeys!3078 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11267 k0!854 v!557)))))

(declare-datatypes ((Unit!29810 0))(
  ( (Unit!29811) )
))
(declare-fun lt!394972 () Unit!29810)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!601 (array!50171 array!50173 (_ BitVec 32) (_ BitVec 32) V!27689 V!27689 (_ BitVec 32) (_ BitVec 64) V!27689 (_ BitVec 32) Int) Unit!29810)

(assert (=> b!869776 (= lt!394972 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!601 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869777 () Bool)

(declare-fun res!590765 () Bool)

(assert (=> b!869777 (=> (not res!590765) (not e!484486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869777 (= res!590765 (validMask!0 mask!1196))))

(assert (= (and start!74098 res!590773) b!869777))

(assert (= (and b!869777 res!590765) b!869775))

(assert (= (and b!869775 res!590769) b!869770))

(assert (= (and b!869770 res!590770) b!869771))

(assert (= (and b!869771 res!590767) b!869766))

(assert (= (and b!869766 res!590768) b!869774))

(assert (= (and b!869774 res!590771) b!869772))

(assert (= (and b!869772 res!590772) b!869767))

(assert (= (and b!869767 res!590766) b!869776))

(assert (= (and b!869773 condMapEmpty!27071) mapIsEmpty!27071))

(assert (= (and b!869773 (not condMapEmpty!27071)) mapNonEmpty!27071))

(get-info :version)

(assert (= (and mapNonEmpty!27071 ((_ is ValueCellFull!8051) mapValue!27071)) b!869769))

(assert (= (and b!869773 ((_ is ValueCellFull!8051) mapDefault!27071)) b!869768))

(assert (= start!74098 b!869773))

(declare-fun m!811787 () Bool)

(assert (=> b!869774 m!811787))

(declare-fun m!811789 () Bool)

(assert (=> b!869771 m!811789))

(declare-fun m!811791 () Bool)

(assert (=> mapNonEmpty!27071 m!811791))

(declare-fun m!811793 () Bool)

(assert (=> b!869767 m!811793))

(declare-fun m!811795 () Bool)

(assert (=> b!869767 m!811795))

(declare-fun m!811797 () Bool)

(assert (=> b!869767 m!811797))

(declare-fun m!811799 () Bool)

(assert (=> start!74098 m!811799))

(declare-fun m!811801 () Bool)

(assert (=> start!74098 m!811801))

(declare-fun m!811803 () Bool)

(assert (=> b!869770 m!811803))

(declare-fun m!811805 () Bool)

(assert (=> b!869772 m!811805))

(declare-fun m!811807 () Bool)

(assert (=> b!869776 m!811807))

(declare-fun m!811809 () Bool)

(assert (=> b!869776 m!811809))

(assert (=> b!869776 m!811809))

(declare-fun m!811811 () Bool)

(assert (=> b!869776 m!811811))

(declare-fun m!811813 () Bool)

(assert (=> b!869776 m!811813))

(declare-fun m!811815 () Bool)

(assert (=> b!869777 m!811815))

(check-sat (not b!869777) tp_is_empty!16981 (not b!869771) (not start!74098) (not mapNonEmpty!27071) (not b_next!14845) (not b!869776) (not b!869770) (not b!869774) b_and!24607 (not b!869767))
(check-sat b_and!24607 (not b_next!14845))
