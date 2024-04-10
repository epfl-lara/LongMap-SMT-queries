; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84204 () Bool)

(assert start!84204)

(declare-fun b_free!19905 () Bool)

(declare-fun b_next!19905 () Bool)

(assert (=> start!84204 (= b_free!19905 (not b_next!19905))))

(declare-fun tp!69318 () Bool)

(declare-fun b_and!31887 () Bool)

(assert (=> start!84204 (= tp!69318 b_and!31887)))

(declare-fun b!984877 () Bool)

(declare-fun e!555191 () Bool)

(declare-fun tp_is_empty!23007 () Bool)

(assert (=> b!984877 (= e!555191 tp_is_empty!23007)))

(declare-fun mapIsEmpty!36539 () Bool)

(declare-fun mapRes!36539 () Bool)

(assert (=> mapIsEmpty!36539 mapRes!36539))

(declare-fun b!984879 () Bool)

(declare-fun res!659036 () Bool)

(declare-fun e!555188 () Bool)

(assert (=> b!984879 (=> (not res!659036) (not e!555188))))

(declare-datatypes ((array!61993 0))(
  ( (array!61994 (arr!29854 (Array (_ BitVec 32) (_ BitVec 64))) (size!30333 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61993)

(declare-datatypes ((List!20672 0))(
  ( (Nil!20669) (Cons!20668 (h!21830 (_ BitVec 64)) (t!29521 List!20672)) )
))
(declare-fun arrayNoDuplicates!0 (array!61993 (_ BitVec 32) List!20672) Bool)

(assert (=> b!984879 (= res!659036 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20669))))

(declare-fun mapNonEmpty!36539 () Bool)

(declare-fun tp!69319 () Bool)

(declare-fun e!555189 () Bool)

(assert (=> mapNonEmpty!36539 (= mapRes!36539 (and tp!69319 e!555189))))

(declare-datatypes ((V!35659 0))(
  ( (V!35660 (val!11554 Int)) )
))
(declare-datatypes ((ValueCell!11022 0))(
  ( (ValueCellFull!11022 (v!14116 V!35659)) (EmptyCell!11022) )
))
(declare-fun mapRest!36539 () (Array (_ BitVec 32) ValueCell!11022))

(declare-datatypes ((array!61995 0))(
  ( (array!61996 (arr!29855 (Array (_ BitVec 32) ValueCell!11022)) (size!30334 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61995)

(declare-fun mapKey!36539 () (_ BitVec 32))

(declare-fun mapValue!36539 () ValueCell!11022)

(assert (=> mapNonEmpty!36539 (= (arr!29855 _values!1278) (store mapRest!36539 mapKey!36539 mapValue!36539))))

(declare-fun b!984880 () Bool)

(declare-fun res!659037 () Bool)

(assert (=> b!984880 (=> (not res!659037) (not e!555188))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61993 (_ BitVec 32)) Bool)

(assert (=> b!984880 (= res!659037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984881 () Bool)

(declare-fun res!659034 () Bool)

(assert (=> b!984881 (=> (not res!659034) (not e!555188))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984881 (= res!659034 (validKeyInArray!0 (select (arr!29854 _keys!1544) from!1932)))))

(declare-fun b!984882 () Bool)

(declare-fun e!555187 () Bool)

(assert (=> b!984882 (= e!555187 (not true))))

(declare-datatypes ((tuple2!14780 0))(
  ( (tuple2!14781 (_1!7401 (_ BitVec 64)) (_2!7401 V!35659)) )
))
(declare-datatypes ((List!20673 0))(
  ( (Nil!20670) (Cons!20669 (h!21831 tuple2!14780) (t!29522 List!20673)) )
))
(declare-datatypes ((ListLongMap!13477 0))(
  ( (ListLongMap!13478 (toList!6754 List!20673)) )
))
(declare-fun lt!437006 () ListLongMap!13477)

(declare-fun lt!437002 () tuple2!14780)

(declare-fun lt!437003 () tuple2!14780)

(declare-fun +!3045 (ListLongMap!13477 tuple2!14780) ListLongMap!13477)

(assert (=> b!984882 (= (+!3045 (+!3045 lt!437006 lt!437002) lt!437003) (+!3045 (+!3045 lt!437006 lt!437003) lt!437002))))

(declare-fun lt!437004 () V!35659)

(assert (=> b!984882 (= lt!437003 (tuple2!14781 (select (arr!29854 _keys!1544) from!1932) lt!437004))))

(declare-fun minValue!1220 () V!35659)

(assert (=> b!984882 (= lt!437002 (tuple2!14781 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32729 0))(
  ( (Unit!32730) )
))
(declare-fun lt!437005 () Unit!32729)

(declare-fun addCommutativeForDiffKeys!673 (ListLongMap!13477 (_ BitVec 64) V!35659 (_ BitVec 64) V!35659) Unit!32729)

(assert (=> b!984882 (= lt!437005 (addCommutativeForDiffKeys!673 lt!437006 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29854 _keys!1544) from!1932) lt!437004))))

(declare-fun b!984883 () Bool)

(declare-fun res!659035 () Bool)

(assert (=> b!984883 (=> (not res!659035) (not e!555188))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984883 (= res!659035 (and (= (size!30334 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30333 _keys!1544) (size!30334 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984884 () Bool)

(declare-fun res!659038 () Bool)

(assert (=> b!984884 (=> (not res!659038) (not e!555188))))

(assert (=> b!984884 (= res!659038 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984885 () Bool)

(assert (=> b!984885 (= e!555188 e!555187)))

(declare-fun res!659033 () Bool)

(assert (=> b!984885 (=> (not res!659033) (not e!555187))))

(assert (=> b!984885 (= res!659033 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29854 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15489 (ValueCell!11022 V!35659) V!35659)

(declare-fun dynLambda!1826 (Int (_ BitVec 64)) V!35659)

(assert (=> b!984885 (= lt!437004 (get!15489 (select (arr!29855 _values!1278) from!1932) (dynLambda!1826 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35659)

(declare-fun getCurrentListMapNoExtraKeys!3446 (array!61993 array!61995 (_ BitVec 32) (_ BitVec 32) V!35659 V!35659 (_ BitVec 32) Int) ListLongMap!13477)

(assert (=> b!984885 (= lt!437006 (getCurrentListMapNoExtraKeys!3446 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984878 () Bool)

(declare-fun e!555192 () Bool)

(assert (=> b!984878 (= e!555192 (and e!555191 mapRes!36539))))

(declare-fun condMapEmpty!36539 () Bool)

(declare-fun mapDefault!36539 () ValueCell!11022)

(assert (=> b!984878 (= condMapEmpty!36539 (= (arr!29855 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11022)) mapDefault!36539)))))

(declare-fun res!659032 () Bool)

(assert (=> start!84204 (=> (not res!659032) (not e!555188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84204 (= res!659032 (validMask!0 mask!1948))))

(assert (=> start!84204 e!555188))

(assert (=> start!84204 true))

(assert (=> start!84204 tp_is_empty!23007))

(declare-fun array_inv!23079 (array!61995) Bool)

(assert (=> start!84204 (and (array_inv!23079 _values!1278) e!555192)))

(assert (=> start!84204 tp!69318))

(declare-fun array_inv!23080 (array!61993) Bool)

(assert (=> start!84204 (array_inv!23080 _keys!1544)))

(declare-fun b!984886 () Bool)

(assert (=> b!984886 (= e!555189 tp_is_empty!23007)))

(declare-fun b!984887 () Bool)

(declare-fun res!659039 () Bool)

(assert (=> b!984887 (=> (not res!659039) (not e!555188))))

(assert (=> b!984887 (= res!659039 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30333 _keys!1544))))))

(assert (= (and start!84204 res!659032) b!984883))

(assert (= (and b!984883 res!659035) b!984880))

(assert (= (and b!984880 res!659037) b!984879))

(assert (= (and b!984879 res!659036) b!984887))

(assert (= (and b!984887 res!659039) b!984881))

(assert (= (and b!984881 res!659034) b!984884))

(assert (= (and b!984884 res!659038) b!984885))

(assert (= (and b!984885 res!659033) b!984882))

(assert (= (and b!984878 condMapEmpty!36539) mapIsEmpty!36539))

(assert (= (and b!984878 (not condMapEmpty!36539)) mapNonEmpty!36539))

(get-info :version)

(assert (= (and mapNonEmpty!36539 ((_ is ValueCellFull!11022) mapValue!36539)) b!984886))

(assert (= (and b!984878 ((_ is ValueCellFull!11022) mapDefault!36539)) b!984877))

(assert (= start!84204 b!984878))

(declare-fun b_lambda!14937 () Bool)

(assert (=> (not b_lambda!14937) (not b!984885)))

(declare-fun t!29520 () Bool)

(declare-fun tb!6699 () Bool)

(assert (=> (and start!84204 (= defaultEntry!1281 defaultEntry!1281) t!29520) tb!6699))

(declare-fun result!13387 () Bool)

(assert (=> tb!6699 (= result!13387 tp_is_empty!23007)))

(assert (=> b!984885 t!29520))

(declare-fun b_and!31889 () Bool)

(assert (= b_and!31887 (and (=> t!29520 result!13387) b_and!31889)))

(declare-fun m!911951 () Bool)

(assert (=> b!984880 m!911951))

(declare-fun m!911953 () Bool)

(assert (=> b!984885 m!911953))

(declare-fun m!911955 () Bool)

(assert (=> b!984885 m!911955))

(declare-fun m!911957 () Bool)

(assert (=> b!984885 m!911957))

(declare-fun m!911959 () Bool)

(assert (=> b!984885 m!911959))

(assert (=> b!984885 m!911955))

(assert (=> b!984885 m!911959))

(declare-fun m!911961 () Bool)

(assert (=> b!984885 m!911961))

(declare-fun m!911963 () Bool)

(assert (=> mapNonEmpty!36539 m!911963))

(declare-fun m!911965 () Bool)

(assert (=> start!84204 m!911965))

(declare-fun m!911967 () Bool)

(assert (=> start!84204 m!911967))

(declare-fun m!911969 () Bool)

(assert (=> start!84204 m!911969))

(assert (=> b!984881 m!911953))

(assert (=> b!984881 m!911953))

(declare-fun m!911971 () Bool)

(assert (=> b!984881 m!911971))

(assert (=> b!984882 m!911953))

(declare-fun m!911973 () Bool)

(assert (=> b!984882 m!911973))

(declare-fun m!911975 () Bool)

(assert (=> b!984882 m!911975))

(assert (=> b!984882 m!911953))

(declare-fun m!911977 () Bool)

(assert (=> b!984882 m!911977))

(declare-fun m!911979 () Bool)

(assert (=> b!984882 m!911979))

(assert (=> b!984882 m!911973))

(assert (=> b!984882 m!911979))

(declare-fun m!911981 () Bool)

(assert (=> b!984882 m!911981))

(declare-fun m!911983 () Bool)

(assert (=> b!984879 m!911983))

(check-sat (not b!984879) (not b_next!19905) (not b!984881) (not b!984880) (not start!84204) (not b_lambda!14937) (not mapNonEmpty!36539) b_and!31889 tp_is_empty!23007 (not b!984885) (not b!984882))
(check-sat b_and!31889 (not b_next!19905))
