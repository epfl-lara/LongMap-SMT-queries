; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133556 () Bool)

(assert start!133556)

(declare-fun b_free!32023 () Bool)

(declare-fun b_next!32023 () Bool)

(assert (=> start!133556 (= b_free!32023 (not b_next!32023))))

(declare-fun tp!113194 () Bool)

(declare-fun b_and!51539 () Bool)

(assert (=> start!133556 (= tp!113194 b_and!51539)))

(declare-fun b!1561805 () Bool)

(declare-fun e!870309 () Bool)

(declare-fun e!870306 () Bool)

(declare-fun mapRes!59409 () Bool)

(assert (=> b!1561805 (= e!870309 (and e!870306 mapRes!59409))))

(declare-fun condMapEmpty!59409 () Bool)

(declare-datatypes ((V!59793 0))(
  ( (V!59794 (val!19428 Int)) )
))
(declare-datatypes ((ValueCell!18314 0))(
  ( (ValueCellFull!18314 (v!22176 V!59793)) (EmptyCell!18314) )
))
(declare-datatypes ((array!104006 0))(
  ( (array!104007 (arr!50196 (Array (_ BitVec 32) ValueCell!18314)) (size!50748 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104006)

(declare-fun mapDefault!59409 () ValueCell!18314)

(assert (=> b!1561805 (= condMapEmpty!59409 (= (arr!50196 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18314)) mapDefault!59409)))))

(declare-fun mapIsEmpty!59409 () Bool)

(assert (=> mapIsEmpty!59409 mapRes!59409))

(declare-fun b!1561806 () Bool)

(declare-fun tp_is_empty!38689 () Bool)

(assert (=> b!1561806 (= e!870306 tp_is_empty!38689)))

(declare-fun mapNonEmpty!59409 () Bool)

(declare-fun tp!113193 () Bool)

(declare-fun e!870310 () Bool)

(assert (=> mapNonEmpty!59409 (= mapRes!59409 (and tp!113193 e!870310))))

(declare-fun mapValue!59409 () ValueCell!18314)

(declare-fun mapKey!59409 () (_ BitVec 32))

(declare-fun mapRest!59409 () (Array (_ BitVec 32) ValueCell!18314))

(assert (=> mapNonEmpty!59409 (= (arr!50196 _values!487) (store mapRest!59409 mapKey!59409 mapValue!59409))))

(declare-fun b!1561807 () Bool)

(declare-fun res!1067925 () Bool)

(declare-fun e!870308 () Bool)

(assert (=> b!1561807 (=> (not res!1067925) (not e!870308))))

(declare-datatypes ((array!104008 0))(
  ( (array!104009 (arr!50197 (Array (_ BitVec 32) (_ BitVec 64))) (size!50749 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104008)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104008 (_ BitVec 32)) Bool)

(assert (=> b!1561807 (= res!1067925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561809 () Bool)

(declare-fun res!1067924 () Bool)

(assert (=> b!1561809 (=> (not res!1067924) (not e!870308))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561809 (= res!1067924 (validKeyInArray!0 (select (arr!50197 _keys!637) from!782)))))

(declare-fun b!1561810 () Bool)

(declare-fun res!1067921 () Bool)

(assert (=> b!1561810 (=> (not res!1067921) (not e!870308))))

(declare-datatypes ((List!36506 0))(
  ( (Nil!36503) (Cons!36502 (h!37949 (_ BitVec 64)) (t!51311 List!36506)) )
))
(declare-fun arrayNoDuplicates!0 (array!104008 (_ BitVec 32) List!36506) Bool)

(assert (=> b!1561810 (= res!1067921 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36503))))

(declare-fun b!1561811 () Bool)

(assert (=> b!1561811 (= e!870310 tp_is_empty!38689)))

(declare-fun b!1561812 () Bool)

(declare-fun res!1067922 () Bool)

(assert (=> b!1561812 (=> (not res!1067922) (not e!870308))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561812 (= res!1067922 (and (= (size!50748 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50749 _keys!637) (size!50748 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561813 () Bool)

(declare-fun res!1067923 () Bool)

(assert (=> b!1561813 (=> (not res!1067923) (not e!870308))))

(assert (=> b!1561813 (= res!1067923 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50749 _keys!637)) (bvslt from!782 (size!50749 _keys!637))))))

(declare-fun b!1561808 () Bool)

(assert (=> b!1561808 (= e!870308 (not true))))

(declare-fun lt!671210 () Bool)

(declare-datatypes ((tuple2!25166 0))(
  ( (tuple2!25167 (_1!12594 (_ BitVec 64)) (_2!12594 V!59793)) )
))
(declare-datatypes ((List!36507 0))(
  ( (Nil!36504) (Cons!36503 (h!37950 tuple2!25166) (t!51312 List!36507)) )
))
(declare-datatypes ((ListLongMap!22601 0))(
  ( (ListLongMap!22602 (toList!11316 List!36507)) )
))
(declare-fun lt!671211 () ListLongMap!22601)

(declare-fun contains!10226 (ListLongMap!22601 (_ BitVec 64)) Bool)

(assert (=> b!1561808 (= lt!671210 (contains!10226 lt!671211 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561808 (not (contains!10226 lt!671211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671213 () V!59793)

(declare-fun lt!671209 () ListLongMap!22601)

(declare-fun +!5081 (ListLongMap!22601 tuple2!25166) ListLongMap!22601)

(assert (=> b!1561808 (= lt!671211 (+!5081 lt!671209 (tuple2!25167 (select (arr!50197 _keys!637) from!782) lt!671213)))))

(declare-datatypes ((Unit!51770 0))(
  ( (Unit!51771) )
))
(declare-fun lt!671212 () Unit!51770)

(declare-fun addStillNotContains!528 (ListLongMap!22601 (_ BitVec 64) V!59793 (_ BitVec 64)) Unit!51770)

(assert (=> b!1561808 (= lt!671212 (addStillNotContains!528 lt!671209 (select (arr!50197 _keys!637) from!782) lt!671213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26234 (ValueCell!18314 V!59793) V!59793)

(declare-fun dynLambda!3857 (Int (_ BitVec 64)) V!59793)

(assert (=> b!1561808 (= lt!671213 (get!26234 (select (arr!50196 _values!487) from!782) (dynLambda!3857 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59793)

(declare-fun minValue!453 () V!59793)

(declare-fun getCurrentListMapNoExtraKeys!6690 (array!104008 array!104006 (_ BitVec 32) (_ BitVec 32) V!59793 V!59793 (_ BitVec 32) Int) ListLongMap!22601)

(assert (=> b!1561808 (= lt!671209 (getCurrentListMapNoExtraKeys!6690 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1067920 () Bool)

(assert (=> start!133556 (=> (not res!1067920) (not e!870308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133556 (= res!1067920 (validMask!0 mask!947))))

(assert (=> start!133556 e!870308))

(assert (=> start!133556 tp!113194))

(assert (=> start!133556 tp_is_empty!38689))

(assert (=> start!133556 true))

(declare-fun array_inv!39201 (array!104008) Bool)

(assert (=> start!133556 (array_inv!39201 _keys!637)))

(declare-fun array_inv!39202 (array!104006) Bool)

(assert (=> start!133556 (and (array_inv!39202 _values!487) e!870309)))

(assert (= (and start!133556 res!1067920) b!1561812))

(assert (= (and b!1561812 res!1067922) b!1561807))

(assert (= (and b!1561807 res!1067925) b!1561810))

(assert (= (and b!1561810 res!1067921) b!1561813))

(assert (= (and b!1561813 res!1067923) b!1561809))

(assert (= (and b!1561809 res!1067924) b!1561808))

(assert (= (and b!1561805 condMapEmpty!59409) mapIsEmpty!59409))

(assert (= (and b!1561805 (not condMapEmpty!59409)) mapNonEmpty!59409))

(get-info :version)

(assert (= (and mapNonEmpty!59409 ((_ is ValueCellFull!18314) mapValue!59409)) b!1561811))

(assert (= (and b!1561805 ((_ is ValueCellFull!18314) mapDefault!59409)) b!1561806))

(assert (= start!133556 b!1561805))

(declare-fun b_lambda!24887 () Bool)

(assert (=> (not b_lambda!24887) (not b!1561808)))

(declare-fun t!51310 () Bool)

(declare-fun tb!12559 () Bool)

(assert (=> (and start!133556 (= defaultEntry!495 defaultEntry!495) t!51310) tb!12559))

(declare-fun result!26407 () Bool)

(assert (=> tb!12559 (= result!26407 tp_is_empty!38689)))

(assert (=> b!1561808 t!51310))

(declare-fun b_and!51541 () Bool)

(assert (= b_and!51539 (and (=> t!51310 result!26407) b_and!51541)))

(declare-fun m!1436949 () Bool)

(assert (=> b!1561807 m!1436949))

(declare-fun m!1436951 () Bool)

(assert (=> b!1561810 m!1436951))

(declare-fun m!1436953 () Bool)

(assert (=> b!1561809 m!1436953))

(assert (=> b!1561809 m!1436953))

(declare-fun m!1436955 () Bool)

(assert (=> b!1561809 m!1436955))

(declare-fun m!1436957 () Bool)

(assert (=> b!1561808 m!1436957))

(declare-fun m!1436959 () Bool)

(assert (=> b!1561808 m!1436959))

(declare-fun m!1436961 () Bool)

(assert (=> b!1561808 m!1436961))

(declare-fun m!1436963 () Bool)

(assert (=> b!1561808 m!1436963))

(assert (=> b!1561808 m!1436953))

(declare-fun m!1436965 () Bool)

(assert (=> b!1561808 m!1436965))

(assert (=> b!1561808 m!1436957))

(assert (=> b!1561808 m!1436953))

(assert (=> b!1561808 m!1436959))

(declare-fun m!1436967 () Bool)

(assert (=> b!1561808 m!1436967))

(declare-fun m!1436969 () Bool)

(assert (=> b!1561808 m!1436969))

(declare-fun m!1436971 () Bool)

(assert (=> b!1561808 m!1436971))

(declare-fun m!1436973 () Bool)

(assert (=> mapNonEmpty!59409 m!1436973))

(declare-fun m!1436975 () Bool)

(assert (=> start!133556 m!1436975))

(declare-fun m!1436977 () Bool)

(assert (=> start!133556 m!1436977))

(declare-fun m!1436979 () Bool)

(assert (=> start!133556 m!1436979))

(check-sat (not b!1561807) (not b!1561808) (not b!1561810) (not mapNonEmpty!59409) (not b!1561809) tp_is_empty!38689 b_and!51541 (not b_lambda!24887) (not start!133556) (not b_next!32023))
(check-sat b_and!51541 (not b_next!32023))
