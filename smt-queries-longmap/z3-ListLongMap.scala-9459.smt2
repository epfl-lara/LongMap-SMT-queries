; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112364 () Bool)

(assert start!112364)

(declare-fun b_free!30759 () Bool)

(declare-fun b_next!30759 () Bool)

(assert (=> start!112364 (= b_free!30759 (not b_next!30759))))

(declare-fun tp!107913 () Bool)

(declare-fun b_and!49573 () Bool)

(assert (=> start!112364 (= tp!107913 b_and!49573)))

(declare-fun b!1331983 () Bool)

(declare-fun res!883906 () Bool)

(declare-fun e!758893 () Bool)

(assert (=> b!1331983 (=> (not res!883906) (not e!758893))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331983 (= res!883906 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331984 () Bool)

(declare-fun e!758894 () Bool)

(declare-fun tp_is_empty!36669 () Bool)

(assert (=> b!1331984 (= e!758894 tp_is_empty!36669)))

(declare-fun b!1331985 () Bool)

(declare-fun res!883907 () Bool)

(assert (=> b!1331985 (=> (not res!883907) (not e!758893))))

(declare-datatypes ((V!53995 0))(
  ( (V!53996 (val!18409 Int)) )
))
(declare-datatypes ((ValueCell!17436 0))(
  ( (ValueCellFull!17436 (v!21046 V!53995)) (EmptyCell!17436) )
))
(declare-datatypes ((array!90218 0))(
  ( (array!90219 (arr!43575 (Array (_ BitVec 32) ValueCell!17436)) (size!44125 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90218)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90220 0))(
  ( (array!90221 (arr!43576 (Array (_ BitVec 32) (_ BitVec 64))) (size!44126 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90220)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53995)

(declare-fun zeroValue!1262 () V!53995)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23720 0))(
  ( (tuple2!23721 (_1!11871 (_ BitVec 64)) (_2!11871 V!53995)) )
))
(declare-datatypes ((List!30867 0))(
  ( (Nil!30864) (Cons!30863 (h!32072 tuple2!23720) (t!45039 List!30867)) )
))
(declare-datatypes ((ListLongMap!21377 0))(
  ( (ListLongMap!21378 (toList!10704 List!30867)) )
))
(declare-fun contains!8868 (ListLongMap!21377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5686 (array!90220 array!90218 (_ BitVec 32) (_ BitVec 32) V!53995 V!53995 (_ BitVec 32) Int) ListLongMap!21377)

(assert (=> b!1331985 (= res!883907 (contains!8868 (getCurrentListMap!5686 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331986 () Bool)

(declare-fun res!883904 () Bool)

(assert (=> b!1331986 (=> (not res!883904) (not e!758893))))

(declare-datatypes ((List!30868 0))(
  ( (Nil!30865) (Cons!30864 (h!32073 (_ BitVec 64)) (t!45040 List!30868)) )
))
(declare-fun arrayNoDuplicates!0 (array!90220 (_ BitVec 32) List!30868) Bool)

(assert (=> b!1331986 (= res!883904 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30865))))

(declare-fun b!1331987 () Bool)

(declare-fun res!883911 () Bool)

(assert (=> b!1331987 (=> (not res!883911) (not e!758893))))

(assert (=> b!1331987 (= res!883911 (and (= (size!44125 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44126 _keys!1590) (size!44125 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!883908 () Bool)

(assert (=> start!112364 (=> (not res!883908) (not e!758893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112364 (= res!883908 (validMask!0 mask!1998))))

(assert (=> start!112364 e!758893))

(declare-fun e!758896 () Bool)

(declare-fun array_inv!32867 (array!90218) Bool)

(assert (=> start!112364 (and (array_inv!32867 _values!1320) e!758896)))

(assert (=> start!112364 true))

(declare-fun array_inv!32868 (array!90220) Bool)

(assert (=> start!112364 (array_inv!32868 _keys!1590)))

(assert (=> start!112364 tp!107913))

(assert (=> start!112364 tp_is_empty!36669))

(declare-fun b!1331988 () Bool)

(declare-fun res!883910 () Bool)

(assert (=> b!1331988 (=> (not res!883910) (not e!758893))))

(assert (=> b!1331988 (= res!883910 (not (= (select (arr!43576 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapIsEmpty!56677 () Bool)

(declare-fun mapRes!56677 () Bool)

(assert (=> mapIsEmpty!56677 mapRes!56677))

(declare-fun b!1331989 () Bool)

(declare-fun e!758892 () Bool)

(assert (=> b!1331989 (= e!758896 (and e!758892 mapRes!56677))))

(declare-fun condMapEmpty!56677 () Bool)

(declare-fun mapDefault!56677 () ValueCell!17436)

(assert (=> b!1331989 (= condMapEmpty!56677 (= (arr!43575 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17436)) mapDefault!56677)))))

(declare-fun b!1331990 () Bool)

(declare-fun res!883905 () Bool)

(assert (=> b!1331990 (=> (not res!883905) (not e!758893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90220 (_ BitVec 32)) Bool)

(assert (=> b!1331990 (= res!883905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331991 () Bool)

(assert (=> b!1331991 (= e!758892 tp_is_empty!36669)))

(declare-fun b!1331992 () Bool)

(assert (=> b!1331992 (= e!758893 (not true))))

(declare-fun lt!591793 () ListLongMap!21377)

(declare-fun +!4698 (ListLongMap!21377 tuple2!23720) ListLongMap!21377)

(assert (=> b!1331992 (contains!8868 (+!4698 lt!591793 (tuple2!23721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43845 0))(
  ( (Unit!43846) )
))
(declare-fun lt!591796 () Unit!43845)

(declare-fun addStillContains!1177 (ListLongMap!21377 (_ BitVec 64) V!53995 (_ BitVec 64)) Unit!43845)

(assert (=> b!1331992 (= lt!591796 (addStillContains!1177 lt!591793 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1331992 (contains!8868 lt!591793 k0!1153)))

(declare-fun lt!591795 () Unit!43845)

(declare-fun lt!591791 () V!53995)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!285 ((_ BitVec 64) (_ BitVec 64) V!53995 ListLongMap!21377) Unit!43845)

(assert (=> b!1331992 (= lt!591795 (lemmaInListMapAfterAddingDiffThenInBefore!285 k0!1153 (select (arr!43576 _keys!1590) from!1980) lt!591791 lt!591793))))

(declare-fun lt!591794 () ListLongMap!21377)

(assert (=> b!1331992 (contains!8868 lt!591794 k0!1153)))

(declare-fun lt!591792 () Unit!43845)

(assert (=> b!1331992 (= lt!591792 (lemmaInListMapAfterAddingDiffThenInBefore!285 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591794))))

(assert (=> b!1331992 (= lt!591794 (+!4698 lt!591793 (tuple2!23721 (select (arr!43576 _keys!1590) from!1980) lt!591791)))))

(declare-fun get!21980 (ValueCell!17436 V!53995) V!53995)

(declare-fun dynLambda!3637 (Int (_ BitVec 64)) V!53995)

(assert (=> b!1331992 (= lt!591791 (get!21980 (select (arr!43575 _values!1320) from!1980) (dynLambda!3637 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6336 (array!90220 array!90218 (_ BitVec 32) (_ BitVec 32) V!53995 V!53995 (_ BitVec 32) Int) ListLongMap!21377)

(assert (=> b!1331992 (= lt!591793 (getCurrentListMapNoExtraKeys!6336 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331993 () Bool)

(declare-fun res!883903 () Bool)

(assert (=> b!1331993 (=> (not res!883903) (not e!758893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331993 (= res!883903 (validKeyInArray!0 (select (arr!43576 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56677 () Bool)

(declare-fun tp!107914 () Bool)

(assert (=> mapNonEmpty!56677 (= mapRes!56677 (and tp!107914 e!758894))))

(declare-fun mapKey!56677 () (_ BitVec 32))

(declare-fun mapValue!56677 () ValueCell!17436)

(declare-fun mapRest!56677 () (Array (_ BitVec 32) ValueCell!17436))

(assert (=> mapNonEmpty!56677 (= (arr!43575 _values!1320) (store mapRest!56677 mapKey!56677 mapValue!56677))))

(declare-fun b!1331994 () Bool)

(declare-fun res!883909 () Bool)

(assert (=> b!1331994 (=> (not res!883909) (not e!758893))))

(assert (=> b!1331994 (= res!883909 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44126 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112364 res!883908) b!1331987))

(assert (= (and b!1331987 res!883911) b!1331990))

(assert (= (and b!1331990 res!883905) b!1331986))

(assert (= (and b!1331986 res!883904) b!1331994))

(assert (= (and b!1331994 res!883909) b!1331985))

(assert (= (and b!1331985 res!883907) b!1331988))

(assert (= (and b!1331988 res!883910) b!1331993))

(assert (= (and b!1331993 res!883903) b!1331983))

(assert (= (and b!1331983 res!883906) b!1331992))

(assert (= (and b!1331989 condMapEmpty!56677) mapIsEmpty!56677))

(assert (= (and b!1331989 (not condMapEmpty!56677)) mapNonEmpty!56677))

(get-info :version)

(assert (= (and mapNonEmpty!56677 ((_ is ValueCellFull!17436) mapValue!56677)) b!1331984))

(assert (= (and b!1331989 ((_ is ValueCellFull!17436) mapDefault!56677)) b!1331991))

(assert (= start!112364 b!1331989))

(declare-fun b_lambda!24019 () Bool)

(assert (=> (not b_lambda!24019) (not b!1331992)))

(declare-fun t!45038 () Bool)

(declare-fun tb!11975 () Bool)

(assert (=> (and start!112364 (= defaultEntry!1323 defaultEntry!1323) t!45038) tb!11975))

(declare-fun result!25021 () Bool)

(assert (=> tb!11975 (= result!25021 tp_is_empty!36669)))

(assert (=> b!1331992 t!45038))

(declare-fun b_and!49575 () Bool)

(assert (= b_and!49573 (and (=> t!45038 result!25021) b_and!49575)))

(declare-fun m!1220723 () Bool)

(assert (=> start!112364 m!1220723))

(declare-fun m!1220725 () Bool)

(assert (=> start!112364 m!1220725))

(declare-fun m!1220727 () Bool)

(assert (=> start!112364 m!1220727))

(declare-fun m!1220729 () Bool)

(assert (=> b!1331992 m!1220729))

(declare-fun m!1220731 () Bool)

(assert (=> b!1331992 m!1220731))

(declare-fun m!1220733 () Bool)

(assert (=> b!1331992 m!1220733))

(assert (=> b!1331992 m!1220731))

(declare-fun m!1220735 () Bool)

(assert (=> b!1331992 m!1220735))

(declare-fun m!1220737 () Bool)

(assert (=> b!1331992 m!1220737))

(declare-fun m!1220739 () Bool)

(assert (=> b!1331992 m!1220739))

(declare-fun m!1220741 () Bool)

(assert (=> b!1331992 m!1220741))

(declare-fun m!1220743 () Bool)

(assert (=> b!1331992 m!1220743))

(declare-fun m!1220745 () Bool)

(assert (=> b!1331992 m!1220745))

(declare-fun m!1220747 () Bool)

(assert (=> b!1331992 m!1220747))

(assert (=> b!1331992 m!1220729))

(declare-fun m!1220749 () Bool)

(assert (=> b!1331992 m!1220749))

(declare-fun m!1220751 () Bool)

(assert (=> b!1331992 m!1220751))

(assert (=> b!1331992 m!1220733))

(declare-fun m!1220753 () Bool)

(assert (=> b!1331992 m!1220753))

(assert (=> b!1331992 m!1220743))

(declare-fun m!1220755 () Bool)

(assert (=> b!1331990 m!1220755))

(declare-fun m!1220757 () Bool)

(assert (=> b!1331986 m!1220757))

(assert (=> b!1331988 m!1220743))

(declare-fun m!1220759 () Bool)

(assert (=> mapNonEmpty!56677 m!1220759))

(assert (=> b!1331993 m!1220743))

(assert (=> b!1331993 m!1220743))

(declare-fun m!1220761 () Bool)

(assert (=> b!1331993 m!1220761))

(declare-fun m!1220763 () Bool)

(assert (=> b!1331985 m!1220763))

(assert (=> b!1331985 m!1220763))

(declare-fun m!1220765 () Bool)

(assert (=> b!1331985 m!1220765))

(check-sat (not b!1331992) (not b_next!30759) tp_is_empty!36669 b_and!49575 (not b!1331993) (not b!1331985) (not b!1331990) (not start!112364) (not b!1331986) (not mapNonEmpty!56677) (not b_lambda!24019))
(check-sat b_and!49575 (not b_next!30759))
