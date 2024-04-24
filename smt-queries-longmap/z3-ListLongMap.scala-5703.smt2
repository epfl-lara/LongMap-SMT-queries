; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74170 () Bool)

(assert start!74170)

(declare-fun b_free!14917 () Bool)

(declare-fun b_next!14917 () Bool)

(assert (=> start!74170 (= b_free!14917 (not b_next!14917))))

(declare-fun tp!52256 () Bool)

(declare-fun b_and!24679 () Bool)

(assert (=> start!74170 (= tp!52256 b_and!24679)))

(declare-fun b!871062 () Bool)

(declare-fun res!591744 () Bool)

(declare-fun e!485135 () Bool)

(assert (=> b!871062 (=> (not res!591744) (not e!485135))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50309 0))(
  ( (array!50310 (arr!24181 (Array (_ BitVec 32) (_ BitVec 64))) (size!24622 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50309)

(declare-datatypes ((V!27785 0))(
  ( (V!27786 (val!8574 Int)) )
))
(declare-datatypes ((ValueCell!8087 0))(
  ( (ValueCellFull!8087 (v!10999 V!27785)) (EmptyCell!8087) )
))
(declare-datatypes ((array!50311 0))(
  ( (array!50312 (arr!24182 (Array (_ BitVec 32) ValueCell!8087)) (size!24623 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50311)

(assert (=> b!871062 (= res!591744 (and (= (size!24623 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24622 _keys!868) (size!24623 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871063 () Bool)

(declare-fun res!591745 () Bool)

(assert (=> b!871063 (=> (not res!591745) (not e!485135))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!871063 (= res!591745 (and (= (select (arr!24181 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871064 () Bool)

(declare-fun e!485133 () Bool)

(declare-fun e!485132 () Bool)

(declare-fun mapRes!27179 () Bool)

(assert (=> b!871064 (= e!485133 (and e!485132 mapRes!27179))))

(declare-fun condMapEmpty!27179 () Bool)

(declare-fun mapDefault!27179 () ValueCell!8087)

(assert (=> b!871064 (= condMapEmpty!27179 (= (arr!24182 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8087)) mapDefault!27179)))))

(declare-fun b!871065 () Bool)

(declare-fun tp_is_empty!17053 () Bool)

(assert (=> b!871065 (= e!485132 tp_is_empty!17053)))

(declare-fun b!871066 () Bool)

(declare-fun res!591739 () Bool)

(assert (=> b!871066 (=> (not res!591739) (not e!485135))))

(declare-datatypes ((List!17139 0))(
  ( (Nil!17136) (Cons!17135 (h!18272 (_ BitVec 64)) (t!24168 List!17139)) )
))
(declare-fun arrayNoDuplicates!0 (array!50309 (_ BitVec 32) List!17139) Bool)

(assert (=> b!871066 (= res!591739 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17136))))

(declare-fun b!871067 () Bool)

(declare-fun e!485134 () Bool)

(assert (=> b!871067 (= e!485134 (not true))))

(declare-fun v!557 () V!27785)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!395402 () array!50311)

(declare-fun minValue!654 () V!27785)

(declare-fun zeroValue!654 () V!27785)

(declare-datatypes ((tuple2!11320 0))(
  ( (tuple2!11321 (_1!5671 (_ BitVec 64)) (_2!5671 V!27785)) )
))
(declare-datatypes ((List!17140 0))(
  ( (Nil!17137) (Cons!17136 (h!18273 tuple2!11320) (t!24169 List!17140)) )
))
(declare-datatypes ((ListLongMap!10091 0))(
  ( (ListLongMap!10092 (toList!5061 List!17140)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3105 (array!50309 array!50311 (_ BitVec 32) (_ BitVec 32) V!27785 V!27785 (_ BitVec 32) Int) ListLongMap!10091)

(declare-fun +!2454 (ListLongMap!10091 tuple2!11320) ListLongMap!10091)

(assert (=> b!871067 (= (getCurrentListMapNoExtraKeys!3105 _keys!868 lt!395402 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2454 (getCurrentListMapNoExtraKeys!3105 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11321 k0!854 v!557)))))

(declare-datatypes ((Unit!29858 0))(
  ( (Unit!29859) )
))
(declare-fun lt!395403 () Unit!29858)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!625 (array!50309 array!50311 (_ BitVec 32) (_ BitVec 32) V!27785 V!27785 (_ BitVec 32) (_ BitVec 64) V!27785 (_ BitVec 32) Int) Unit!29858)

(assert (=> b!871067 (= lt!395403 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!625 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871068 () Bool)

(declare-fun e!485136 () Bool)

(assert (=> b!871068 (= e!485136 tp_is_empty!17053)))

(declare-fun b!871069 () Bool)

(declare-fun res!591738 () Bool)

(assert (=> b!871069 (=> (not res!591738) (not e!485135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50309 (_ BitVec 32)) Bool)

(assert (=> b!871069 (= res!591738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871070 () Bool)

(declare-fun res!591742 () Bool)

(assert (=> b!871070 (=> (not res!591742) (not e!485135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871070 (= res!591742 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27179 () Bool)

(declare-fun tp!52255 () Bool)

(assert (=> mapNonEmpty!27179 (= mapRes!27179 (and tp!52255 e!485136))))

(declare-fun mapKey!27179 () (_ BitVec 32))

(declare-fun mapRest!27179 () (Array (_ BitVec 32) ValueCell!8087))

(declare-fun mapValue!27179 () ValueCell!8087)

(assert (=> mapNonEmpty!27179 (= (arr!24182 _values!688) (store mapRest!27179 mapKey!27179 mapValue!27179))))

(declare-fun b!871071 () Bool)

(declare-fun res!591737 () Bool)

(assert (=> b!871071 (=> (not res!591737) (not e!485135))))

(assert (=> b!871071 (= res!591737 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24622 _keys!868))))))

(declare-fun mapIsEmpty!27179 () Bool)

(assert (=> mapIsEmpty!27179 mapRes!27179))

(declare-fun res!591741 () Bool)

(assert (=> start!74170 (=> (not res!591741) (not e!485135))))

(assert (=> start!74170 (= res!591741 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24622 _keys!868))))))

(assert (=> start!74170 e!485135))

(assert (=> start!74170 tp_is_empty!17053))

(assert (=> start!74170 true))

(assert (=> start!74170 tp!52256))

(declare-fun array_inv!19154 (array!50309) Bool)

(assert (=> start!74170 (array_inv!19154 _keys!868)))

(declare-fun array_inv!19155 (array!50311) Bool)

(assert (=> start!74170 (and (array_inv!19155 _values!688) e!485133)))

(declare-fun b!871072 () Bool)

(assert (=> b!871072 (= e!485135 e!485134)))

(declare-fun res!591740 () Bool)

(assert (=> b!871072 (=> (not res!591740) (not e!485134))))

(assert (=> b!871072 (= res!591740 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395405 () ListLongMap!10091)

(assert (=> b!871072 (= lt!395405 (getCurrentListMapNoExtraKeys!3105 _keys!868 lt!395402 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871072 (= lt!395402 (array!50312 (store (arr!24182 _values!688) i!612 (ValueCellFull!8087 v!557)) (size!24623 _values!688)))))

(declare-fun lt!395404 () ListLongMap!10091)

(assert (=> b!871072 (= lt!395404 (getCurrentListMapNoExtraKeys!3105 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871073 () Bool)

(declare-fun res!591743 () Bool)

(assert (=> b!871073 (=> (not res!591743) (not e!485135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871073 (= res!591743 (validMask!0 mask!1196))))

(assert (= (and start!74170 res!591741) b!871073))

(assert (= (and b!871073 res!591743) b!871062))

(assert (= (and b!871062 res!591744) b!871069))

(assert (= (and b!871069 res!591738) b!871066))

(assert (= (and b!871066 res!591739) b!871071))

(assert (= (and b!871071 res!591737) b!871070))

(assert (= (and b!871070 res!591742) b!871063))

(assert (= (and b!871063 res!591745) b!871072))

(assert (= (and b!871072 res!591740) b!871067))

(assert (= (and b!871064 condMapEmpty!27179) mapIsEmpty!27179))

(assert (= (and b!871064 (not condMapEmpty!27179)) mapNonEmpty!27179))

(get-info :version)

(assert (= (and mapNonEmpty!27179 ((_ is ValueCellFull!8087) mapValue!27179)) b!871068))

(assert (= (and b!871064 ((_ is ValueCellFull!8087) mapDefault!27179)) b!871065))

(assert (= start!74170 b!871064))

(declare-fun m!812867 () Bool)

(assert (=> b!871066 m!812867))

(declare-fun m!812869 () Bool)

(assert (=> b!871072 m!812869))

(declare-fun m!812871 () Bool)

(assert (=> b!871072 m!812871))

(declare-fun m!812873 () Bool)

(assert (=> b!871072 m!812873))

(declare-fun m!812875 () Bool)

(assert (=> b!871073 m!812875))

(declare-fun m!812877 () Bool)

(assert (=> b!871067 m!812877))

(declare-fun m!812879 () Bool)

(assert (=> b!871067 m!812879))

(assert (=> b!871067 m!812879))

(declare-fun m!812881 () Bool)

(assert (=> b!871067 m!812881))

(declare-fun m!812883 () Bool)

(assert (=> b!871067 m!812883))

(declare-fun m!812885 () Bool)

(assert (=> b!871070 m!812885))

(declare-fun m!812887 () Bool)

(assert (=> b!871069 m!812887))

(declare-fun m!812889 () Bool)

(assert (=> b!871063 m!812889))

(declare-fun m!812891 () Bool)

(assert (=> mapNonEmpty!27179 m!812891))

(declare-fun m!812893 () Bool)

(assert (=> start!74170 m!812893))

(declare-fun m!812895 () Bool)

(assert (=> start!74170 m!812895))

(check-sat (not b!871072) tp_is_empty!17053 (not b!871067) (not b!871070) (not b!871066) (not b!871069) (not start!74170) (not b_next!14917) (not mapNonEmpty!27179) b_and!24679 (not b!871073))
(check-sat b_and!24679 (not b_next!14917))
