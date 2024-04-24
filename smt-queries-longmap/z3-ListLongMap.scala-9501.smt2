; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112896 () Bool)

(assert start!112896)

(declare-fun b_free!31009 () Bool)

(declare-fun b_next!31009 () Bool)

(assert (=> start!112896 (= b_free!31009 (not b_next!31009))))

(declare-fun tp!108668 () Bool)

(declare-fun b_and!49957 () Bool)

(assert (=> start!112896 (= tp!108668 b_and!49957)))

(declare-fun b!1337780 () Bool)

(declare-fun res!887455 () Bool)

(declare-fun e!761937 () Bool)

(assert (=> b!1337780 (=> (not res!887455) (not e!761937))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1337780 (= res!887455 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337781 () Bool)

(declare-fun res!887458 () Bool)

(assert (=> b!1337781 (=> (not res!887458) (not e!761937))))

(declare-datatypes ((array!90811 0))(
  ( (array!90812 (arr!43866 (Array (_ BitVec 32) (_ BitVec 64))) (size!44417 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90811)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337781 (= res!887458 (validKeyInArray!0 (select (arr!43866 _keys!1590) from!1980)))))

(declare-fun b!1337782 () Bool)

(declare-fun e!761935 () Bool)

(declare-fun tp_is_empty!36919 () Bool)

(assert (=> b!1337782 (= e!761935 tp_is_empty!36919)))

(declare-fun b!1337783 () Bool)

(declare-fun res!887459 () Bool)

(assert (=> b!1337783 (=> (not res!887459) (not e!761937))))

(declare-datatypes ((List!31089 0))(
  ( (Nil!31086) (Cons!31085 (h!32303 (_ BitVec 64)) (t!45371 List!31089)) )
))
(declare-fun arrayNoDuplicates!0 (array!90811 (_ BitVec 32) List!31089) Bool)

(assert (=> b!1337783 (= res!887459 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31086))))

(declare-fun mapIsEmpty!57056 () Bool)

(declare-fun mapRes!57056 () Bool)

(assert (=> mapIsEmpty!57056 mapRes!57056))

(declare-fun b!1337784 () Bool)

(declare-fun res!887461 () Bool)

(assert (=> b!1337784 (=> (not res!887461) (not e!761937))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1337784 (= res!887461 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44417 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337785 () Bool)

(declare-fun e!761938 () Bool)

(assert (=> b!1337785 (= e!761938 tp_is_empty!36919)))

(declare-fun b!1337786 () Bool)

(declare-fun res!887454 () Bool)

(assert (=> b!1337786 (=> (not res!887454) (not e!761937))))

(declare-datatypes ((V!54329 0))(
  ( (V!54330 (val!18534 Int)) )
))
(declare-datatypes ((ValueCell!17561 0))(
  ( (ValueCellFull!17561 (v!21169 V!54329)) (EmptyCell!17561) )
))
(declare-datatypes ((array!90813 0))(
  ( (array!90814 (arr!43867 (Array (_ BitVec 32) ValueCell!17561)) (size!44418 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90813)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1337786 (= res!887454 (and (= (size!44418 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44417 _keys!1590) (size!44418 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337787 () Bool)

(declare-fun e!761936 () Bool)

(assert (=> b!1337787 (= e!761936 (and e!761938 mapRes!57056))))

(declare-fun condMapEmpty!57056 () Bool)

(declare-fun mapDefault!57056 () ValueCell!17561)

(assert (=> b!1337787 (= condMapEmpty!57056 (= (arr!43867 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17561)) mapDefault!57056)))))

(declare-fun b!1337788 () Bool)

(declare-fun res!887456 () Bool)

(assert (=> b!1337788 (=> (not res!887456) (not e!761937))))

(assert (=> b!1337788 (= res!887456 (not (= (select (arr!43866 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1337789 () Bool)

(assert (=> b!1337789 (= e!761937 (not true))))

(declare-datatypes ((tuple2!23944 0))(
  ( (tuple2!23945 (_1!11983 (_ BitVec 64)) (_2!11983 V!54329)) )
))
(declare-datatypes ((List!31090 0))(
  ( (Nil!31087) (Cons!31086 (h!32304 tuple2!23944) (t!45372 List!31090)) )
))
(declare-datatypes ((ListLongMap!21609 0))(
  ( (ListLongMap!21610 (toList!10820 List!31090)) )
))
(declare-fun lt!593256 () ListLongMap!21609)

(declare-fun contains!8997 (ListLongMap!21609 (_ BitVec 64)) Bool)

(assert (=> b!1337789 (contains!8997 lt!593256 k0!1153)))

(declare-datatypes ((Unit!43853 0))(
  ( (Unit!43854) )
))
(declare-fun lt!593257 () Unit!43853)

(declare-fun minValue!1262 () V!54329)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!307 ((_ BitVec 64) (_ BitVec 64) V!54329 ListLongMap!21609) Unit!43853)

(assert (=> b!1337789 (= lt!593257 (lemmaInListMapAfterAddingDiffThenInBefore!307 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!593256))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!54329)

(declare-fun +!4772 (ListLongMap!21609 tuple2!23944) ListLongMap!21609)

(declare-fun getCurrentListMapNoExtraKeys!6421 (array!90811 array!90813 (_ BitVec 32) (_ BitVec 32) V!54329 V!54329 (_ BitVec 32) Int) ListLongMap!21609)

(declare-fun get!22144 (ValueCell!17561 V!54329) V!54329)

(declare-fun dynLambda!3726 (Int (_ BitVec 64)) V!54329)

(assert (=> b!1337789 (= lt!593256 (+!4772 (getCurrentListMapNoExtraKeys!6421 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23945 (select (arr!43866 _keys!1590) from!1980) (get!22144 (select (arr!43867 _values!1320) from!1980) (dynLambda!3726 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!887457 () Bool)

(assert (=> start!112896 (=> (not res!887457) (not e!761937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112896 (= res!887457 (validMask!0 mask!1998))))

(assert (=> start!112896 e!761937))

(declare-fun array_inv!33349 (array!90813) Bool)

(assert (=> start!112896 (and (array_inv!33349 _values!1320) e!761936)))

(assert (=> start!112896 true))

(declare-fun array_inv!33350 (array!90811) Bool)

(assert (=> start!112896 (array_inv!33350 _keys!1590)))

(assert (=> start!112896 tp!108668))

(assert (=> start!112896 tp_is_empty!36919))

(declare-fun b!1337790 () Bool)

(declare-fun res!887460 () Bool)

(assert (=> b!1337790 (=> (not res!887460) (not e!761937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90811 (_ BitVec 32)) Bool)

(assert (=> b!1337790 (= res!887460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337791 () Bool)

(declare-fun res!887453 () Bool)

(assert (=> b!1337791 (=> (not res!887453) (not e!761937))))

(declare-fun getCurrentListMap!5777 (array!90811 array!90813 (_ BitVec 32) (_ BitVec 32) V!54329 V!54329 (_ BitVec 32) Int) ListLongMap!21609)

(assert (=> b!1337791 (= res!887453 (contains!8997 (getCurrentListMap!5777 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!57056 () Bool)

(declare-fun tp!108667 () Bool)

(assert (=> mapNonEmpty!57056 (= mapRes!57056 (and tp!108667 e!761935))))

(declare-fun mapKey!57056 () (_ BitVec 32))

(declare-fun mapValue!57056 () ValueCell!17561)

(declare-fun mapRest!57056 () (Array (_ BitVec 32) ValueCell!17561))

(assert (=> mapNonEmpty!57056 (= (arr!43867 _values!1320) (store mapRest!57056 mapKey!57056 mapValue!57056))))

(assert (= (and start!112896 res!887457) b!1337786))

(assert (= (and b!1337786 res!887454) b!1337790))

(assert (= (and b!1337790 res!887460) b!1337783))

(assert (= (and b!1337783 res!887459) b!1337784))

(assert (= (and b!1337784 res!887461) b!1337791))

(assert (= (and b!1337791 res!887453) b!1337788))

(assert (= (and b!1337788 res!887456) b!1337781))

(assert (= (and b!1337781 res!887458) b!1337780))

(assert (= (and b!1337780 res!887455) b!1337789))

(assert (= (and b!1337787 condMapEmpty!57056) mapIsEmpty!57056))

(assert (= (and b!1337787 (not condMapEmpty!57056)) mapNonEmpty!57056))

(get-info :version)

(assert (= (and mapNonEmpty!57056 ((_ is ValueCellFull!17561) mapValue!57056)) b!1337782))

(assert (= (and b!1337787 ((_ is ValueCellFull!17561) mapDefault!57056)) b!1337785))

(assert (= start!112896 b!1337787))

(declare-fun b_lambda!24161 () Bool)

(assert (=> (not b_lambda!24161) (not b!1337789)))

(declare-fun t!45370 () Bool)

(declare-fun tb!12085 () Bool)

(assert (=> (and start!112896 (= defaultEntry!1323 defaultEntry!1323) t!45370) tb!12085))

(declare-fun result!25251 () Bool)

(assert (=> tb!12085 (= result!25251 tp_is_empty!36919)))

(assert (=> b!1337789 t!45370))

(declare-fun b_and!49959 () Bool)

(assert (= b_and!49957 (and (=> t!45370 result!25251) b_and!49959)))

(declare-fun m!1226163 () Bool)

(assert (=> start!112896 m!1226163))

(declare-fun m!1226165 () Bool)

(assert (=> start!112896 m!1226165))

(declare-fun m!1226167 () Bool)

(assert (=> start!112896 m!1226167))

(declare-fun m!1226169 () Bool)

(assert (=> b!1337783 m!1226169))

(declare-fun m!1226171 () Bool)

(assert (=> b!1337791 m!1226171))

(assert (=> b!1337791 m!1226171))

(declare-fun m!1226173 () Bool)

(assert (=> b!1337791 m!1226173))

(declare-fun m!1226175 () Bool)

(assert (=> b!1337788 m!1226175))

(declare-fun m!1226177 () Bool)

(assert (=> mapNonEmpty!57056 m!1226177))

(assert (=> b!1337781 m!1226175))

(assert (=> b!1337781 m!1226175))

(declare-fun m!1226179 () Bool)

(assert (=> b!1337781 m!1226179))

(declare-fun m!1226181 () Bool)

(assert (=> b!1337789 m!1226181))

(declare-fun m!1226183 () Bool)

(assert (=> b!1337789 m!1226183))

(declare-fun m!1226185 () Bool)

(assert (=> b!1337789 m!1226185))

(declare-fun m!1226187 () Bool)

(assert (=> b!1337789 m!1226187))

(declare-fun m!1226189 () Bool)

(assert (=> b!1337789 m!1226189))

(declare-fun m!1226191 () Bool)

(assert (=> b!1337789 m!1226191))

(assert (=> b!1337789 m!1226181))

(assert (=> b!1337789 m!1226185))

(assert (=> b!1337789 m!1226175))

(assert (=> b!1337789 m!1226187))

(declare-fun m!1226193 () Bool)

(assert (=> b!1337789 m!1226193))

(declare-fun m!1226195 () Bool)

(assert (=> b!1337790 m!1226195))

(check-sat (not start!112896) (not b!1337783) (not b!1337789) (not b_lambda!24161) (not mapNonEmpty!57056) tp_is_empty!36919 b_and!49959 (not b!1337790) (not b_next!31009) (not b!1337791) (not b!1337781))
(check-sat b_and!49959 (not b_next!31009))
