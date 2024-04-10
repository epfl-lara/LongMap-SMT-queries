; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74034 () Bool)

(assert start!74034)

(declare-fun b_free!14949 () Bool)

(declare-fun b_next!14949 () Bool)

(assert (=> start!74034 (= b_free!14949 (not b_next!14949))))

(declare-fun tp!52350 () Bool)

(declare-fun b_and!24701 () Bool)

(assert (=> start!74034 (= tp!52350 b_and!24701)))

(declare-fun b!870735 () Bool)

(declare-fun e!484842 () Bool)

(declare-fun tp_is_empty!17085 () Bool)

(assert (=> b!870735 (= e!484842 tp_is_empty!17085)))

(declare-fun b!870736 () Bool)

(declare-fun res!591829 () Bool)

(declare-fun e!484839 () Bool)

(assert (=> b!870736 (=> (not res!591829) (not e!484839))))

(declare-datatypes ((array!50314 0))(
  ( (array!50315 (arr!24188 (Array (_ BitVec 32) (_ BitVec 64))) (size!24628 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50314)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50314 (_ BitVec 32)) Bool)

(assert (=> b!870736 (= res!591829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870737 () Bool)

(declare-fun res!591832 () Bool)

(assert (=> b!870737 (=> (not res!591832) (not e!484839))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870737 (= res!591832 (validKeyInArray!0 k0!854))))

(declare-fun res!591833 () Bool)

(assert (=> start!74034 (=> (not res!591833) (not e!484839))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74034 (= res!591833 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24628 _keys!868))))))

(assert (=> start!74034 e!484839))

(assert (=> start!74034 tp_is_empty!17085))

(assert (=> start!74034 true))

(assert (=> start!74034 tp!52350))

(declare-fun array_inv!19100 (array!50314) Bool)

(assert (=> start!74034 (array_inv!19100 _keys!868)))

(declare-datatypes ((V!27827 0))(
  ( (V!27828 (val!8590 Int)) )
))
(declare-datatypes ((ValueCell!8103 0))(
  ( (ValueCellFull!8103 (v!11015 V!27827)) (EmptyCell!8103) )
))
(declare-datatypes ((array!50316 0))(
  ( (array!50317 (arr!24189 (Array (_ BitVec 32) ValueCell!8103)) (size!24629 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50316)

(declare-fun e!484841 () Bool)

(declare-fun array_inv!19101 (array!50316) Bool)

(assert (=> start!74034 (and (array_inv!19101 _values!688) e!484841)))

(declare-fun mapNonEmpty!27227 () Bool)

(declare-fun mapRes!27227 () Bool)

(declare-fun tp!52351 () Bool)

(declare-fun e!484838 () Bool)

(assert (=> mapNonEmpty!27227 (= mapRes!27227 (and tp!52351 e!484838))))

(declare-fun mapValue!27227 () ValueCell!8103)

(declare-fun mapKey!27227 () (_ BitVec 32))

(declare-fun mapRest!27227 () (Array (_ BitVec 32) ValueCell!8103))

(assert (=> mapNonEmpty!27227 (= (arr!24189 _values!688) (store mapRest!27227 mapKey!27227 mapValue!27227))))

(declare-fun b!870738 () Bool)

(declare-fun res!591831 () Bool)

(assert (=> b!870738 (=> (not res!591831) (not e!484839))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!870738 (= res!591831 (and (= (size!24629 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24628 _keys!868) (size!24629 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870739 () Bool)

(declare-fun res!591827 () Bool)

(assert (=> b!870739 (=> (not res!591827) (not e!484839))))

(declare-datatypes ((List!17203 0))(
  ( (Nil!17200) (Cons!17199 (h!18330 (_ BitVec 64)) (t!24240 List!17203)) )
))
(declare-fun arrayNoDuplicates!0 (array!50314 (_ BitVec 32) List!17203) Bool)

(assert (=> b!870739 (= res!591827 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17200))))

(declare-fun b!870740 () Bool)

(declare-fun res!591830 () Bool)

(assert (=> b!870740 (=> (not res!591830) (not e!484839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870740 (= res!591830 (validMask!0 mask!1196))))

(declare-fun b!870741 () Bool)

(assert (=> b!870741 (= e!484841 (and e!484842 mapRes!27227))))

(declare-fun condMapEmpty!27227 () Bool)

(declare-fun mapDefault!27227 () ValueCell!8103)

(assert (=> b!870741 (= condMapEmpty!27227 (= (arr!24189 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8103)) mapDefault!27227)))))

(declare-fun b!870742 () Bool)

(assert (=> b!870742 (= e!484838 tp_is_empty!17085)))

(declare-fun b!870743 () Bool)

(declare-fun res!591828 () Bool)

(assert (=> b!870743 (=> (not res!591828) (not e!484839))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870743 (= res!591828 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24628 _keys!868))))))

(declare-fun b!870744 () Bool)

(declare-fun e!484843 () Bool)

(assert (=> b!870744 (= e!484839 e!484843)))

(declare-fun res!591825 () Bool)

(assert (=> b!870744 (=> (not res!591825) (not e!484843))))

(assert (=> b!870744 (= res!591825 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11414 0))(
  ( (tuple2!11415 (_1!5718 (_ BitVec 64)) (_2!5718 V!27827)) )
))
(declare-datatypes ((List!17204 0))(
  ( (Nil!17201) (Cons!17200 (h!18331 tuple2!11414) (t!24241 List!17204)) )
))
(declare-datatypes ((ListLongMap!10183 0))(
  ( (ListLongMap!10184 (toList!5107 List!17204)) )
))
(declare-fun lt!395235 () ListLongMap!10183)

(declare-fun lt!395234 () array!50316)

(declare-fun minValue!654 () V!27827)

(declare-fun zeroValue!654 () V!27827)

(declare-fun getCurrentListMapNoExtraKeys!3076 (array!50314 array!50316 (_ BitVec 32) (_ BitVec 32) V!27827 V!27827 (_ BitVec 32) Int) ListLongMap!10183)

(assert (=> b!870744 (= lt!395235 (getCurrentListMapNoExtraKeys!3076 _keys!868 lt!395234 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27827)

(assert (=> b!870744 (= lt!395234 (array!50317 (store (arr!24189 _values!688) i!612 (ValueCellFull!8103 v!557)) (size!24629 _values!688)))))

(declare-fun lt!395236 () ListLongMap!10183)

(assert (=> b!870744 (= lt!395236 (getCurrentListMapNoExtraKeys!3076 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27227 () Bool)

(assert (=> mapIsEmpty!27227 mapRes!27227))

(declare-fun b!870745 () Bool)

(assert (=> b!870745 (= e!484843 (not true))))

(declare-fun +!2444 (ListLongMap!10183 tuple2!11414) ListLongMap!10183)

(assert (=> b!870745 (= (getCurrentListMapNoExtraKeys!3076 _keys!868 lt!395234 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2444 (getCurrentListMapNoExtraKeys!3076 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11415 k0!854 v!557)))))

(declare-datatypes ((Unit!29886 0))(
  ( (Unit!29887) )
))
(declare-fun lt!395233 () Unit!29886)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!638 (array!50314 array!50316 (_ BitVec 32) (_ BitVec 32) V!27827 V!27827 (_ BitVec 32) (_ BitVec 64) V!27827 (_ BitVec 32) Int) Unit!29886)

(assert (=> b!870745 (= lt!395233 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!638 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870746 () Bool)

(declare-fun res!591826 () Bool)

(assert (=> b!870746 (=> (not res!591826) (not e!484839))))

(assert (=> b!870746 (= res!591826 (and (= (select (arr!24188 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74034 res!591833) b!870740))

(assert (= (and b!870740 res!591830) b!870738))

(assert (= (and b!870738 res!591831) b!870736))

(assert (= (and b!870736 res!591829) b!870739))

(assert (= (and b!870739 res!591827) b!870743))

(assert (= (and b!870743 res!591828) b!870737))

(assert (= (and b!870737 res!591832) b!870746))

(assert (= (and b!870746 res!591826) b!870744))

(assert (= (and b!870744 res!591825) b!870745))

(assert (= (and b!870741 condMapEmpty!27227) mapIsEmpty!27227))

(assert (= (and b!870741 (not condMapEmpty!27227)) mapNonEmpty!27227))

(get-info :version)

(assert (= (and mapNonEmpty!27227 ((_ is ValueCellFull!8103) mapValue!27227)) b!870742))

(assert (= (and b!870741 ((_ is ValueCellFull!8103) mapDefault!27227)) b!870735))

(assert (= start!74034 b!870741))

(declare-fun m!812057 () Bool)

(assert (=> b!870740 m!812057))

(declare-fun m!812059 () Bool)

(assert (=> b!870736 m!812059))

(declare-fun m!812061 () Bool)

(assert (=> b!870737 m!812061))

(declare-fun m!812063 () Bool)

(assert (=> b!870739 m!812063))

(declare-fun m!812065 () Bool)

(assert (=> b!870745 m!812065))

(declare-fun m!812067 () Bool)

(assert (=> b!870745 m!812067))

(assert (=> b!870745 m!812067))

(declare-fun m!812069 () Bool)

(assert (=> b!870745 m!812069))

(declare-fun m!812071 () Bool)

(assert (=> b!870745 m!812071))

(declare-fun m!812073 () Bool)

(assert (=> b!870746 m!812073))

(declare-fun m!812075 () Bool)

(assert (=> b!870744 m!812075))

(declare-fun m!812077 () Bool)

(assert (=> b!870744 m!812077))

(declare-fun m!812079 () Bool)

(assert (=> b!870744 m!812079))

(declare-fun m!812081 () Bool)

(assert (=> start!74034 m!812081))

(declare-fun m!812083 () Bool)

(assert (=> start!74034 m!812083))

(declare-fun m!812085 () Bool)

(assert (=> mapNonEmpty!27227 m!812085))

(check-sat (not b!870739) (not b!870737) (not b_next!14949) (not b!870736) (not b!870740) (not start!74034) tp_is_empty!17085 (not b!870745) b_and!24701 (not mapNonEmpty!27227) (not b!870744))
(check-sat b_and!24701 (not b_next!14949))
