; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113314 () Bool)

(assert start!113314)

(declare-fun b_free!31141 () Bool)

(declare-fun b_next!31141 () Bool)

(assert (=> start!113314 (= b_free!31141 (not b_next!31141))))

(declare-fun tp!109228 () Bool)

(declare-fun b_and!50191 () Bool)

(assert (=> start!113314 (= tp!109228 b_and!50191)))

(declare-fun b!1341872 () Bool)

(declare-fun res!889819 () Bool)

(declare-fun e!764379 () Bool)

(assert (=> b!1341872 (=> (not res!889819) (not e!764379))))

(declare-datatypes ((V!54625 0))(
  ( (V!54626 (val!18645 Int)) )
))
(declare-fun minValue!1245 () V!54625)

(declare-datatypes ((array!91255 0))(
  ( (array!91256 (arr!44079 (Array (_ BitVec 32) (_ BitVec 64))) (size!44630 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91255)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17672 0))(
  ( (ValueCellFull!17672 (v!21288 V!54625)) (EmptyCell!17672) )
))
(declare-datatypes ((array!91257 0))(
  ( (array!91258 (arr!44080 (Array (_ BitVec 32) ValueCell!17672)) (size!44631 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91257)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54625)

(declare-datatypes ((tuple2!24056 0))(
  ( (tuple2!24057 (_1!12039 (_ BitVec 64)) (_2!12039 V!54625)) )
))
(declare-datatypes ((List!31213 0))(
  ( (Nil!31210) (Cons!31209 (h!32427 tuple2!24056) (t!45557 List!31213)) )
))
(declare-datatypes ((ListLongMap!21721 0))(
  ( (ListLongMap!21722 (toList!10876 List!31213)) )
))
(declare-fun contains!9064 (ListLongMap!21721 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5828 (array!91255 array!91257 (_ BitVec 32) (_ BitVec 32) V!54625 V!54625 (_ BitVec 32) Int) ListLongMap!21721)

(assert (=> b!1341872 (= res!889819 (contains!9064 (getCurrentListMap!5828 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57418 () Bool)

(declare-fun mapRes!57418 () Bool)

(declare-fun tp!109227 () Bool)

(declare-fun e!764381 () Bool)

(assert (=> mapNonEmpty!57418 (= mapRes!57418 (and tp!109227 e!764381))))

(declare-fun mapKey!57418 () (_ BitVec 32))

(declare-fun mapValue!57418 () ValueCell!17672)

(declare-fun mapRest!57418 () (Array (_ BitVec 32) ValueCell!17672))

(assert (=> mapNonEmpty!57418 (= (arr!44080 _values!1303) (store mapRest!57418 mapKey!57418 mapValue!57418))))

(declare-fun b!1341873 () Bool)

(declare-fun res!889818 () Bool)

(assert (=> b!1341873 (=> (not res!889818) (not e!764379))))

(declare-datatypes ((List!31214 0))(
  ( (Nil!31211) (Cons!31210 (h!32428 (_ BitVec 64)) (t!45558 List!31214)) )
))
(declare-fun arrayNoDuplicates!0 (array!91255 (_ BitVec 32) List!31214) Bool)

(assert (=> b!1341873 (= res!889818 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31211))))

(declare-fun b!1341874 () Bool)

(declare-fun res!889822 () Bool)

(assert (=> b!1341874 (=> (not res!889822) (not e!764379))))

(assert (=> b!1341874 (= res!889822 (and (= (size!44631 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44630 _keys!1571) (size!44631 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341875 () Bool)

(declare-fun res!889824 () Bool)

(assert (=> b!1341875 (=> (not res!889824) (not e!764379))))

(assert (=> b!1341875 (= res!889824 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44630 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341876 () Bool)

(declare-fun res!889820 () Bool)

(assert (=> b!1341876 (=> (not res!889820) (not e!764379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341876 (= res!889820 (validKeyInArray!0 (select (arr!44079 _keys!1571) from!1960)))))

(declare-fun b!1341877 () Bool)

(declare-fun e!764380 () Bool)

(declare-fun e!764378 () Bool)

(assert (=> b!1341877 (= e!764380 (and e!764378 mapRes!57418))))

(declare-fun condMapEmpty!57418 () Bool)

(declare-fun mapDefault!57418 () ValueCell!17672)

(assert (=> b!1341877 (= condMapEmpty!57418 (= (arr!44080 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17672)) mapDefault!57418)))))

(declare-fun b!1341879 () Bool)

(declare-fun res!889823 () Bool)

(assert (=> b!1341879 (=> (not res!889823) (not e!764379))))

(assert (=> b!1341879 (= res!889823 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341880 () Bool)

(declare-fun res!889826 () Bool)

(assert (=> b!1341880 (=> (not res!889826) (not e!764379))))

(assert (=> b!1341880 (= res!889826 (not (= (select (arr!44079 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341881 () Bool)

(declare-fun res!889825 () Bool)

(assert (=> b!1341881 (=> (not res!889825) (not e!764379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91255 (_ BitVec 32)) Bool)

(assert (=> b!1341881 (= res!889825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57418 () Bool)

(assert (=> mapIsEmpty!57418 mapRes!57418))

(declare-fun res!889821 () Bool)

(assert (=> start!113314 (=> (not res!889821) (not e!764379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113314 (= res!889821 (validMask!0 mask!1977))))

(assert (=> start!113314 e!764379))

(declare-fun tp_is_empty!37141 () Bool)

(assert (=> start!113314 tp_is_empty!37141))

(assert (=> start!113314 true))

(declare-fun array_inv!33497 (array!91255) Bool)

(assert (=> start!113314 (array_inv!33497 _keys!1571)))

(declare-fun array_inv!33498 (array!91257) Bool)

(assert (=> start!113314 (and (array_inv!33498 _values!1303) e!764380)))

(assert (=> start!113314 tp!109228))

(declare-fun b!1341878 () Bool)

(assert (=> b!1341878 (= e!764379 (not true))))

(declare-fun lt!594484 () ListLongMap!21721)

(assert (=> b!1341878 (contains!9064 lt!594484 k0!1142)))

(declare-datatypes ((Unit!43932 0))(
  ( (Unit!43933) )
))
(declare-fun lt!594485 () Unit!43932)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!322 ((_ BitVec 64) (_ BitVec 64) V!54625 ListLongMap!21721) Unit!43932)

(assert (=> b!1341878 (= lt!594485 (lemmaInListMapAfterAddingDiffThenInBefore!322 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594484))))

(declare-fun +!4796 (ListLongMap!21721 tuple2!24056) ListLongMap!21721)

(declare-fun getCurrentListMapNoExtraKeys!6445 (array!91255 array!91257 (_ BitVec 32) (_ BitVec 32) V!54625 V!54625 (_ BitVec 32) Int) ListLongMap!21721)

(declare-fun get!22252 (ValueCell!17672 V!54625) V!54625)

(declare-fun dynLambda!3750 (Int (_ BitVec 64)) V!54625)

(assert (=> b!1341878 (= lt!594484 (+!4796 (getCurrentListMapNoExtraKeys!6445 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24057 (select (arr!44079 _keys!1571) from!1960) (get!22252 (select (arr!44080 _values!1303) from!1960) (dynLambda!3750 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341882 () Bool)

(assert (=> b!1341882 (= e!764378 tp_is_empty!37141)))

(declare-fun b!1341883 () Bool)

(assert (=> b!1341883 (= e!764381 tp_is_empty!37141)))

(assert (= (and start!113314 res!889821) b!1341874))

(assert (= (and b!1341874 res!889822) b!1341881))

(assert (= (and b!1341881 res!889825) b!1341873))

(assert (= (and b!1341873 res!889818) b!1341875))

(assert (= (and b!1341875 res!889824) b!1341872))

(assert (= (and b!1341872 res!889819) b!1341880))

(assert (= (and b!1341880 res!889826) b!1341876))

(assert (= (and b!1341876 res!889820) b!1341879))

(assert (= (and b!1341879 res!889823) b!1341878))

(assert (= (and b!1341877 condMapEmpty!57418) mapIsEmpty!57418))

(assert (= (and b!1341877 (not condMapEmpty!57418)) mapNonEmpty!57418))

(get-info :version)

(assert (= (and mapNonEmpty!57418 ((_ is ValueCellFull!17672) mapValue!57418)) b!1341883))

(assert (= (and b!1341877 ((_ is ValueCellFull!17672) mapDefault!57418)) b!1341882))

(assert (= start!113314 b!1341877))

(declare-fun b_lambda!24311 () Bool)

(assert (=> (not b_lambda!24311) (not b!1341878)))

(declare-fun t!45556 () Bool)

(declare-fun tb!12147 () Bool)

(assert (=> (and start!113314 (= defaultEntry!1306 defaultEntry!1306) t!45556) tb!12147))

(declare-fun result!25393 () Bool)

(assert (=> tb!12147 (= result!25393 tp_is_empty!37141)))

(assert (=> b!1341878 t!45556))

(declare-fun b_and!50193 () Bool)

(assert (= b_and!50191 (and (=> t!45556 result!25393) b_and!50193)))

(declare-fun m!1229913 () Bool)

(assert (=> b!1341872 m!1229913))

(assert (=> b!1341872 m!1229913))

(declare-fun m!1229915 () Bool)

(assert (=> b!1341872 m!1229915))

(declare-fun m!1229917 () Bool)

(assert (=> start!113314 m!1229917))

(declare-fun m!1229919 () Bool)

(assert (=> start!113314 m!1229919))

(declare-fun m!1229921 () Bool)

(assert (=> start!113314 m!1229921))

(declare-fun m!1229923 () Bool)

(assert (=> b!1341876 m!1229923))

(assert (=> b!1341876 m!1229923))

(declare-fun m!1229925 () Bool)

(assert (=> b!1341876 m!1229925))

(declare-fun m!1229927 () Bool)

(assert (=> mapNonEmpty!57418 m!1229927))

(assert (=> b!1341880 m!1229923))

(declare-fun m!1229929 () Bool)

(assert (=> b!1341873 m!1229929))

(declare-fun m!1229931 () Bool)

(assert (=> b!1341878 m!1229931))

(declare-fun m!1229933 () Bool)

(assert (=> b!1341878 m!1229933))

(declare-fun m!1229935 () Bool)

(assert (=> b!1341878 m!1229935))

(declare-fun m!1229937 () Bool)

(assert (=> b!1341878 m!1229937))

(assert (=> b!1341878 m!1229931))

(declare-fun m!1229939 () Bool)

(assert (=> b!1341878 m!1229939))

(assert (=> b!1341878 m!1229933))

(assert (=> b!1341878 m!1229935))

(declare-fun m!1229941 () Bool)

(assert (=> b!1341878 m!1229941))

(declare-fun m!1229943 () Bool)

(assert (=> b!1341878 m!1229943))

(assert (=> b!1341878 m!1229923))

(declare-fun m!1229945 () Bool)

(assert (=> b!1341881 m!1229945))

(check-sat tp_is_empty!37141 b_and!50193 (not b!1341878) (not b!1341876) (not b_lambda!24311) (not b_next!31141) (not b!1341881) (not mapNonEmpty!57418) (not b!1341872) (not start!113314) (not b!1341873))
(check-sat b_and!50193 (not b_next!31141))
