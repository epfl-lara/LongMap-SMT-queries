; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83812 () Bool)

(assert start!83812)

(declare-fun b_free!19639 () Bool)

(declare-fun b_next!19639 () Bool)

(assert (=> start!83812 (= b_free!19639 (not b_next!19639))))

(declare-fun tp!68359 () Bool)

(declare-fun b_and!31341 () Bool)

(assert (=> start!83812 (= tp!68359 b_and!31341)))

(declare-fun b!978987 () Bool)

(declare-fun res!655210 () Bool)

(declare-fun e!551858 () Bool)

(assert (=> b!978987 (=> (not res!655210) (not e!551858))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35161 0))(
  ( (V!35162 (val!11367 Int)) )
))
(declare-datatypes ((ValueCell!10835 0))(
  ( (ValueCellFull!10835 (v!13928 V!35161)) (EmptyCell!10835) )
))
(declare-datatypes ((array!61208 0))(
  ( (array!61209 (arr!29462 (Array (_ BitVec 32) ValueCell!10835)) (size!29943 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61208)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61210 0))(
  ( (array!61211 (arr!29463 (Array (_ BitVec 32) (_ BitVec 64))) (size!29944 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61210)

(assert (=> b!978987 (= res!655210 (and (= (size!29943 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29944 _keys!1544) (size!29943 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978988 () Bool)

(declare-fun e!551855 () Bool)

(assert (=> b!978988 (= e!551855 true)))

(declare-datatypes ((tuple2!14640 0))(
  ( (tuple2!14641 (_1!7331 (_ BitVec 64)) (_2!7331 V!35161)) )
))
(declare-datatypes ((List!20466 0))(
  ( (Nil!20463) (Cons!20462 (h!21624 tuple2!14640) (t!29052 List!20466)) )
))
(declare-datatypes ((ListLongMap!13327 0))(
  ( (ListLongMap!13328 (toList!6679 List!20466)) )
))
(declare-fun lt!434042 () ListLongMap!13327)

(declare-fun lt!434038 () tuple2!14640)

(declare-fun lt!434040 () tuple2!14640)

(declare-fun lt!434039 () ListLongMap!13327)

(declare-fun +!2979 (ListLongMap!13327 tuple2!14640) ListLongMap!13327)

(assert (=> b!978988 (= lt!434042 (+!2979 (+!2979 lt!434039 lt!434038) lt!434040))))

(declare-fun zeroValue!1220 () V!35161)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!434037 () V!35161)

(declare-datatypes ((Unit!32424 0))(
  ( (Unit!32425) )
))
(declare-fun lt!434034 () Unit!32424)

(declare-fun addCommutativeForDiffKeys!583 (ListLongMap!13327 (_ BitVec 64) V!35161 (_ BitVec 64) V!35161) Unit!32424)

(assert (=> b!978988 (= lt!434034 (addCommutativeForDiffKeys!583 lt!434039 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29463 _keys!1544) from!1932) lt!434037))))

(declare-fun b!978989 () Bool)

(declare-fun e!551854 () Bool)

(declare-fun e!551856 () Bool)

(declare-fun mapRes!35978 () Bool)

(assert (=> b!978989 (= e!551854 (and e!551856 mapRes!35978))))

(declare-fun condMapEmpty!35978 () Bool)

(declare-fun mapDefault!35978 () ValueCell!10835)

(assert (=> b!978989 (= condMapEmpty!35978 (= (arr!29462 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10835)) mapDefault!35978)))))

(declare-fun b!978990 () Bool)

(declare-fun res!655208 () Bool)

(assert (=> b!978990 (=> (not res!655208) (not e!551858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978990 (= res!655208 (validKeyInArray!0 (select (arr!29463 _keys!1544) from!1932)))))

(declare-fun res!655211 () Bool)

(assert (=> start!83812 (=> (not res!655211) (not e!551858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83812 (= res!655211 (validMask!0 mask!1948))))

(assert (=> start!83812 e!551858))

(assert (=> start!83812 true))

(declare-fun tp_is_empty!22633 () Bool)

(assert (=> start!83812 tp_is_empty!22633))

(declare-fun array_inv!22813 (array!61208) Bool)

(assert (=> start!83812 (and (array_inv!22813 _values!1278) e!551854)))

(assert (=> start!83812 tp!68359))

(declare-fun array_inv!22814 (array!61210) Bool)

(assert (=> start!83812 (array_inv!22814 _keys!1544)))

(declare-fun mapIsEmpty!35978 () Bool)

(assert (=> mapIsEmpty!35978 mapRes!35978))

(declare-fun b!978991 () Bool)

(declare-fun res!655213 () Bool)

(assert (=> b!978991 (=> (not res!655213) (not e!551858))))

(assert (=> b!978991 (= res!655213 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978992 () Bool)

(assert (=> b!978992 (= e!551856 tp_is_empty!22633)))

(declare-fun b!978993 () Bool)

(assert (=> b!978993 (= e!551858 (not e!551855))))

(declare-fun res!655209 () Bool)

(assert (=> b!978993 (=> res!655209 e!551855)))

(assert (=> b!978993 (= res!655209 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29463 _keys!1544) from!1932)))))

(declare-fun lt!434041 () tuple2!14640)

(declare-fun lt!434036 () ListLongMap!13327)

(assert (=> b!978993 (= (+!2979 lt!434036 lt!434038) (+!2979 lt!434042 lt!434041))))

(declare-fun lt!434035 () ListLongMap!13327)

(assert (=> b!978993 (= lt!434042 (+!2979 lt!434035 lt!434038))))

(assert (=> b!978993 (= lt!434038 (tuple2!14641 (select (arr!29463 _keys!1544) from!1932) lt!434037))))

(assert (=> b!978993 (= lt!434036 (+!2979 lt!434035 lt!434041))))

(declare-fun minValue!1220 () V!35161)

(assert (=> b!978993 (= lt!434041 (tuple2!14641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434043 () Unit!32424)

(assert (=> b!978993 (= lt!434043 (addCommutativeForDiffKeys!583 lt!434035 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29463 _keys!1544) from!1932) lt!434037))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15275 (ValueCell!10835 V!35161) V!35161)

(declare-fun dynLambda!1731 (Int (_ BitVec 64)) V!35161)

(assert (=> b!978993 (= lt!434037 (get!15275 (select (arr!29462 _values!1278) from!1932) (dynLambda!1731 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!978993 (= lt!434035 (+!2979 lt!434039 lt!434040))))

(assert (=> b!978993 (= lt!434040 (tuple2!14641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3398 (array!61210 array!61208 (_ BitVec 32) (_ BitVec 32) V!35161 V!35161 (_ BitVec 32) Int) ListLongMap!13327)

(assert (=> b!978993 (= lt!434039 (getCurrentListMapNoExtraKeys!3398 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!978994 () Bool)

(declare-fun e!551853 () Bool)

(assert (=> b!978994 (= e!551853 tp_is_empty!22633)))

(declare-fun mapNonEmpty!35978 () Bool)

(declare-fun tp!68360 () Bool)

(assert (=> mapNonEmpty!35978 (= mapRes!35978 (and tp!68360 e!551853))))

(declare-fun mapRest!35978 () (Array (_ BitVec 32) ValueCell!10835))

(declare-fun mapKey!35978 () (_ BitVec 32))

(declare-fun mapValue!35978 () ValueCell!10835)

(assert (=> mapNonEmpty!35978 (= (arr!29462 _values!1278) (store mapRest!35978 mapKey!35978 mapValue!35978))))

(declare-fun b!978995 () Bool)

(declare-fun res!655214 () Bool)

(assert (=> b!978995 (=> (not res!655214) (not e!551858))))

(declare-datatypes ((List!20467 0))(
  ( (Nil!20464) (Cons!20463 (h!21625 (_ BitVec 64)) (t!29053 List!20467)) )
))
(declare-fun arrayNoDuplicates!0 (array!61210 (_ BitVec 32) List!20467) Bool)

(assert (=> b!978995 (= res!655214 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20464))))

(declare-fun b!978996 () Bool)

(declare-fun res!655215 () Bool)

(assert (=> b!978996 (=> (not res!655215) (not e!551858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61210 (_ BitVec 32)) Bool)

(assert (=> b!978996 (= res!655215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978997 () Bool)

(declare-fun res!655212 () Bool)

(assert (=> b!978997 (=> (not res!655212) (not e!551858))))

(assert (=> b!978997 (= res!655212 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29944 _keys!1544))))))

(assert (= (and start!83812 res!655211) b!978987))

(assert (= (and b!978987 res!655210) b!978996))

(assert (= (and b!978996 res!655215) b!978995))

(assert (= (and b!978995 res!655214) b!978997))

(assert (= (and b!978997 res!655212) b!978990))

(assert (= (and b!978990 res!655208) b!978991))

(assert (= (and b!978991 res!655213) b!978993))

(assert (= (and b!978993 (not res!655209)) b!978988))

(assert (= (and b!978989 condMapEmpty!35978) mapIsEmpty!35978))

(assert (= (and b!978989 (not condMapEmpty!35978)) mapNonEmpty!35978))

(get-info :version)

(assert (= (and mapNonEmpty!35978 ((_ is ValueCellFull!10835) mapValue!35978)) b!978994))

(assert (= (and b!978989 ((_ is ValueCellFull!10835) mapDefault!35978)) b!978992))

(assert (= start!83812 b!978989))

(declare-fun b_lambda!14665 () Bool)

(assert (=> (not b_lambda!14665) (not b!978993)))

(declare-fun t!29051 () Bool)

(declare-fun tb!6437 () Bool)

(assert (=> (and start!83812 (= defaultEntry!1281 defaultEntry!1281) t!29051) tb!6437))

(declare-fun result!12871 () Bool)

(assert (=> tb!6437 (= result!12871 tp_is_empty!22633)))

(assert (=> b!978993 t!29051))

(declare-fun b_and!31343 () Bool)

(assert (= b_and!31341 (and (=> t!29051 result!12871) b_and!31343)))

(declare-fun m!905735 () Bool)

(assert (=> b!978996 m!905735))

(declare-fun m!905737 () Bool)

(assert (=> mapNonEmpty!35978 m!905737))

(declare-fun m!905739 () Bool)

(assert (=> b!978990 m!905739))

(assert (=> b!978990 m!905739))

(declare-fun m!905741 () Bool)

(assert (=> b!978990 m!905741))

(declare-fun m!905743 () Bool)

(assert (=> b!978988 m!905743))

(assert (=> b!978988 m!905743))

(declare-fun m!905745 () Bool)

(assert (=> b!978988 m!905745))

(assert (=> b!978988 m!905739))

(assert (=> b!978988 m!905739))

(declare-fun m!905747 () Bool)

(assert (=> b!978988 m!905747))

(assert (=> b!978993 m!905739))

(declare-fun m!905749 () Bool)

(assert (=> b!978993 m!905749))

(declare-fun m!905751 () Bool)

(assert (=> b!978993 m!905751))

(declare-fun m!905753 () Bool)

(assert (=> b!978993 m!905753))

(assert (=> b!978993 m!905739))

(declare-fun m!905755 () Bool)

(assert (=> b!978993 m!905755))

(declare-fun m!905757 () Bool)

(assert (=> b!978993 m!905757))

(declare-fun m!905759 () Bool)

(assert (=> b!978993 m!905759))

(declare-fun m!905761 () Bool)

(assert (=> b!978993 m!905761))

(declare-fun m!905763 () Bool)

(assert (=> b!978993 m!905763))

(declare-fun m!905765 () Bool)

(assert (=> b!978993 m!905765))

(assert (=> b!978993 m!905749))

(assert (=> b!978993 m!905765))

(declare-fun m!905767 () Bool)

(assert (=> b!978993 m!905767))

(declare-fun m!905769 () Bool)

(assert (=> b!978995 m!905769))

(declare-fun m!905771 () Bool)

(assert (=> start!83812 m!905771))

(declare-fun m!905773 () Bool)

(assert (=> start!83812 m!905773))

(declare-fun m!905775 () Bool)

(assert (=> start!83812 m!905775))

(check-sat (not b_next!19639) (not b_lambda!14665) (not mapNonEmpty!35978) (not start!83812) (not b!978988) tp_is_empty!22633 b_and!31343 (not b!978993) (not b!978995) (not b!978996) (not b!978990))
(check-sat b_and!31343 (not b_next!19639))
