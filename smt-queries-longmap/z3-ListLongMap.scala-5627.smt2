; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73714 () Bool)

(assert start!73714)

(declare-fun b_free!14461 () Bool)

(declare-fun b_next!14461 () Bool)

(assert (=> start!73714 (= b_free!14461 (not b_next!14461))))

(declare-fun tp!50888 () Bool)

(declare-fun b_and!23911 () Bool)

(assert (=> start!73714 (= tp!50888 b_and!23911)))

(declare-fun b!860716 () Bool)

(declare-fun e!479728 () Bool)

(assert (=> b!860716 (= e!479728 true)))

(declare-fun lt!387844 () Bool)

(declare-datatypes ((List!16790 0))(
  ( (Nil!16787) (Cons!16786 (h!17923 (_ BitVec 64)) (t!23509 List!16790)) )
))
(declare-fun contains!4204 (List!16790 (_ BitVec 64)) Bool)

(assert (=> b!860716 (= lt!387844 (contains!4204 Nil!16787 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860717 () Bool)

(declare-fun res!584589 () Bool)

(declare-fun e!479723 () Bool)

(assert (=> b!860717 (=> (not res!584589) (not e!479723))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49423 0))(
  ( (array!49424 (arr!23738 (Array (_ BitVec 32) (_ BitVec 64))) (size!24179 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49423)

(declare-datatypes ((V!27177 0))(
  ( (V!27178 (val!8346 Int)) )
))
(declare-datatypes ((ValueCell!7859 0))(
  ( (ValueCellFull!7859 (v!10771 V!27177)) (EmptyCell!7859) )
))
(declare-datatypes ((array!49425 0))(
  ( (array!49426 (arr!23739 (Array (_ BitVec 32) ValueCell!7859)) (size!24180 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49425)

(assert (=> b!860717 (= res!584589 (and (= (size!24180 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24179 _keys!868) (size!24180 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860719 () Bool)

(declare-fun res!584596 () Bool)

(assert (=> b!860719 (=> (not res!584596) (not e!479723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860719 (= res!584596 (validMask!0 mask!1196))))

(declare-fun b!860720 () Bool)

(declare-fun e!479726 () Bool)

(assert (=> b!860720 (= e!479726 e!479728)))

(declare-fun res!584593 () Bool)

(assert (=> b!860720 (=> res!584593 e!479728)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!860720 (= res!584593 (or (bvsge (size!24179 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24179 _keys!868)) (bvsge from!1053 (size!24179 _keys!868))))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!49423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860720 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29316 0))(
  ( (Unit!29317) )
))
(declare-fun lt!387845 () Unit!29316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49423 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29316)

(assert (=> b!860720 (= lt!387845 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!49423 (_ BitVec 32) List!16790) Bool)

(assert (=> b!860720 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16787)))

(declare-fun lt!387839 () Unit!29316)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49423 (_ BitVec 32) (_ BitVec 32)) Unit!29316)

(assert (=> b!860720 (= lt!387839 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapIsEmpty!26495 () Bool)

(declare-fun mapRes!26495 () Bool)

(assert (=> mapIsEmpty!26495 mapRes!26495))

(declare-fun b!860721 () Bool)

(declare-fun e!479725 () Bool)

(assert (=> b!860721 (= e!479723 e!479725)))

(declare-fun res!584584 () Bool)

(assert (=> b!860721 (=> (not res!584584) (not e!479725))))

(assert (=> b!860721 (= res!584584 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387836 () array!49425)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10950 0))(
  ( (tuple2!10951 (_1!5486 (_ BitVec 64)) (_2!5486 V!27177)) )
))
(declare-datatypes ((List!16791 0))(
  ( (Nil!16788) (Cons!16787 (h!17924 tuple2!10950) (t!23510 List!16791)) )
))
(declare-datatypes ((ListLongMap!9721 0))(
  ( (ListLongMap!9722 (toList!4876 List!16791)) )
))
(declare-fun lt!387841 () ListLongMap!9721)

(declare-fun minValue!654 () V!27177)

(declare-fun zeroValue!654 () V!27177)

(declare-fun getCurrentListMapNoExtraKeys!2930 (array!49423 array!49425 (_ BitVec 32) (_ BitVec 32) V!27177 V!27177 (_ BitVec 32) Int) ListLongMap!9721)

(assert (=> b!860721 (= lt!387841 (getCurrentListMapNoExtraKeys!2930 _keys!868 lt!387836 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27177)

(assert (=> b!860721 (= lt!387836 (array!49426 (store (arr!23739 _values!688) i!612 (ValueCellFull!7859 v!557)) (size!24180 _values!688)))))

(declare-fun lt!387843 () ListLongMap!9721)

(assert (=> b!860721 (= lt!387843 (getCurrentListMapNoExtraKeys!2930 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860722 () Bool)

(declare-fun res!584590 () Bool)

(assert (=> b!860722 (=> (not res!584590) (not e!479723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860722 (= res!584590 (validKeyInArray!0 k0!854))))

(declare-fun b!860723 () Bool)

(declare-fun res!584588 () Bool)

(assert (=> b!860723 (=> (not res!584588) (not e!479723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49423 (_ BitVec 32)) Bool)

(assert (=> b!860723 (= res!584588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860724 () Bool)

(declare-fun res!584594 () Bool)

(assert (=> b!860724 (=> (not res!584594) (not e!479723))))

(assert (=> b!860724 (= res!584594 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24179 _keys!868))))))

(declare-fun b!860725 () Bool)

(declare-fun res!584595 () Bool)

(assert (=> b!860725 (=> res!584595 e!479728)))

(assert (=> b!860725 (= res!584595 (contains!4204 Nil!16787 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860718 () Bool)

(declare-fun res!584583 () Bool)

(assert (=> b!860718 (=> res!584583 e!479728)))

(declare-fun noDuplicate!1310 (List!16790) Bool)

(assert (=> b!860718 (= res!584583 (not (noDuplicate!1310 Nil!16787)))))

(declare-fun res!584592 () Bool)

(assert (=> start!73714 (=> (not res!584592) (not e!479723))))

(assert (=> start!73714 (= res!584592 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24179 _keys!868))))))

(assert (=> start!73714 e!479723))

(declare-fun tp_is_empty!16597 () Bool)

(assert (=> start!73714 tp_is_empty!16597))

(assert (=> start!73714 true))

(assert (=> start!73714 tp!50888))

(declare-fun array_inv!18842 (array!49423) Bool)

(assert (=> start!73714 (array_inv!18842 _keys!868)))

(declare-fun e!479727 () Bool)

(declare-fun array_inv!18843 (array!49425) Bool)

(assert (=> start!73714 (and (array_inv!18843 _values!688) e!479727)))

(declare-fun b!860726 () Bool)

(declare-fun e!479721 () Bool)

(assert (=> b!860726 (= e!479721 e!479726)))

(declare-fun res!584585 () Bool)

(assert (=> b!860726 (=> res!584585 e!479726)))

(assert (=> b!860726 (= res!584585 (not (= (select (arr!23738 _keys!868) from!1053) k0!854)))))

(declare-fun lt!387842 () ListLongMap!9721)

(declare-fun +!2281 (ListLongMap!9721 tuple2!10950) ListLongMap!9721)

(declare-fun get!12518 (ValueCell!7859 V!27177) V!27177)

(declare-fun dynLambda!1114 (Int (_ BitVec 64)) V!27177)

(assert (=> b!860726 (= lt!387841 (+!2281 lt!387842 (tuple2!10951 (select (arr!23738 _keys!868) from!1053) (get!12518 (select (arr!23739 _values!688) from!1053) (dynLambda!1114 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860727 () Bool)

(declare-fun e!479722 () Bool)

(assert (=> b!860727 (= e!479722 tp_is_empty!16597)))

(declare-fun mapNonEmpty!26495 () Bool)

(declare-fun tp!50887 () Bool)

(declare-fun e!479724 () Bool)

(assert (=> mapNonEmpty!26495 (= mapRes!26495 (and tp!50887 e!479724))))

(declare-fun mapValue!26495 () ValueCell!7859)

(declare-fun mapRest!26495 () (Array (_ BitVec 32) ValueCell!7859))

(declare-fun mapKey!26495 () (_ BitVec 32))

(assert (=> mapNonEmpty!26495 (= (arr!23739 _values!688) (store mapRest!26495 mapKey!26495 mapValue!26495))))

(declare-fun b!860728 () Bool)

(assert (=> b!860728 (= e!479724 tp_is_empty!16597)))

(declare-fun b!860729 () Bool)

(declare-fun res!584591 () Bool)

(assert (=> b!860729 (=> (not res!584591) (not e!479723))))

(assert (=> b!860729 (= res!584591 (and (= (select (arr!23738 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860730 () Bool)

(assert (=> b!860730 (= e!479727 (and e!479722 mapRes!26495))))

(declare-fun condMapEmpty!26495 () Bool)

(declare-fun mapDefault!26495 () ValueCell!7859)

(assert (=> b!860730 (= condMapEmpty!26495 (= (arr!23739 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7859)) mapDefault!26495)))))

(declare-fun b!860731 () Bool)

(declare-fun res!584586 () Bool)

(assert (=> b!860731 (=> (not res!584586) (not e!479723))))

(assert (=> b!860731 (= res!584586 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16787))))

(declare-fun b!860732 () Bool)

(assert (=> b!860732 (= e!479725 (not e!479721))))

(declare-fun res!584587 () Bool)

(assert (=> b!860732 (=> res!584587 e!479721)))

(assert (=> b!860732 (= res!584587 (not (validKeyInArray!0 (select (arr!23738 _keys!868) from!1053))))))

(declare-fun lt!387838 () ListLongMap!9721)

(assert (=> b!860732 (= lt!387838 lt!387842)))

(declare-fun lt!387840 () ListLongMap!9721)

(assert (=> b!860732 (= lt!387842 (+!2281 lt!387840 (tuple2!10951 k0!854 v!557)))))

(assert (=> b!860732 (= lt!387838 (getCurrentListMapNoExtraKeys!2930 _keys!868 lt!387836 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860732 (= lt!387840 (getCurrentListMapNoExtraKeys!2930 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387837 () Unit!29316)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!474 (array!49423 array!49425 (_ BitVec 32) (_ BitVec 32) V!27177 V!27177 (_ BitVec 32) (_ BitVec 64) V!27177 (_ BitVec 32) Int) Unit!29316)

(assert (=> b!860732 (= lt!387837 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!474 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73714 res!584592) b!860719))

(assert (= (and b!860719 res!584596) b!860717))

(assert (= (and b!860717 res!584589) b!860723))

(assert (= (and b!860723 res!584588) b!860731))

(assert (= (and b!860731 res!584586) b!860724))

(assert (= (and b!860724 res!584594) b!860722))

(assert (= (and b!860722 res!584590) b!860729))

(assert (= (and b!860729 res!584591) b!860721))

(assert (= (and b!860721 res!584584) b!860732))

(assert (= (and b!860732 (not res!584587)) b!860726))

(assert (= (and b!860726 (not res!584585)) b!860720))

(assert (= (and b!860720 (not res!584593)) b!860718))

(assert (= (and b!860718 (not res!584583)) b!860725))

(assert (= (and b!860725 (not res!584595)) b!860716))

(assert (= (and b!860730 condMapEmpty!26495) mapIsEmpty!26495))

(assert (= (and b!860730 (not condMapEmpty!26495)) mapNonEmpty!26495))

(get-info :version)

(assert (= (and mapNonEmpty!26495 ((_ is ValueCellFull!7859) mapValue!26495)) b!860728))

(assert (= (and b!860730 ((_ is ValueCellFull!7859) mapDefault!26495)) b!860727))

(assert (= start!73714 b!860730))

(declare-fun b_lambda!11827 () Bool)

(assert (=> (not b_lambda!11827) (not b!860726)))

(declare-fun t!23508 () Bool)

(declare-fun tb!4575 () Bool)

(assert (=> (and start!73714 (= defaultEntry!696 defaultEntry!696) t!23508) tb!4575))

(declare-fun result!8769 () Bool)

(assert (=> tb!4575 (= result!8769 tp_is_empty!16597)))

(assert (=> b!860726 t!23508))

(declare-fun b_and!23913 () Bool)

(assert (= b_and!23911 (and (=> t!23508 result!8769) b_and!23913)))

(declare-fun m!801875 () Bool)

(assert (=> b!860726 m!801875))

(declare-fun m!801877 () Bool)

(assert (=> b!860726 m!801877))

(declare-fun m!801879 () Bool)

(assert (=> b!860726 m!801879))

(declare-fun m!801881 () Bool)

(assert (=> b!860726 m!801881))

(assert (=> b!860726 m!801877))

(declare-fun m!801883 () Bool)

(assert (=> b!860726 m!801883))

(assert (=> b!860726 m!801879))

(declare-fun m!801885 () Bool)

(assert (=> start!73714 m!801885))

(declare-fun m!801887 () Bool)

(assert (=> start!73714 m!801887))

(declare-fun m!801889 () Bool)

(assert (=> mapNonEmpty!26495 m!801889))

(declare-fun m!801891 () Bool)

(assert (=> b!860719 m!801891))

(declare-fun m!801893 () Bool)

(assert (=> b!860723 m!801893))

(declare-fun m!801895 () Bool)

(assert (=> b!860731 m!801895))

(declare-fun m!801897 () Bool)

(assert (=> b!860729 m!801897))

(declare-fun m!801899 () Bool)

(assert (=> b!860721 m!801899))

(declare-fun m!801901 () Bool)

(assert (=> b!860721 m!801901))

(declare-fun m!801903 () Bool)

(assert (=> b!860721 m!801903))

(declare-fun m!801905 () Bool)

(assert (=> b!860732 m!801905))

(declare-fun m!801907 () Bool)

(assert (=> b!860732 m!801907))

(declare-fun m!801909 () Bool)

(assert (=> b!860732 m!801909))

(assert (=> b!860732 m!801883))

(declare-fun m!801911 () Bool)

(assert (=> b!860732 m!801911))

(assert (=> b!860732 m!801883))

(declare-fun m!801913 () Bool)

(assert (=> b!860732 m!801913))

(declare-fun m!801915 () Bool)

(assert (=> b!860716 m!801915))

(declare-fun m!801917 () Bool)

(assert (=> b!860720 m!801917))

(declare-fun m!801919 () Bool)

(assert (=> b!860720 m!801919))

(declare-fun m!801921 () Bool)

(assert (=> b!860720 m!801921))

(declare-fun m!801923 () Bool)

(assert (=> b!860720 m!801923))

(declare-fun m!801925 () Bool)

(assert (=> b!860722 m!801925))

(declare-fun m!801927 () Bool)

(assert (=> b!860718 m!801927))

(declare-fun m!801929 () Bool)

(assert (=> b!860725 m!801929))

(check-sat (not b!860720) tp_is_empty!16597 (not b_lambda!11827) (not b!860725) (not b!860718) b_and!23913 (not start!73714) (not b!860722) (not b!860723) (not b!860731) (not b_next!14461) (not b!860726) (not b!860719) (not b!860716) (not mapNonEmpty!26495) (not b!860732) (not b!860721))
(check-sat b_and!23913 (not b_next!14461))
