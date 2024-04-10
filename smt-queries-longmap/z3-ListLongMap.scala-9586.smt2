; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113380 () Bool)

(assert start!113380)

(declare-fun b_free!31431 () Bool)

(declare-fun b_next!31431 () Bool)

(assert (=> start!113380 (= b_free!31431 (not b_next!31431))))

(declare-fun tp!110098 () Bool)

(declare-fun b_and!50715 () Bool)

(assert (=> start!113380 (= tp!110098 b_and!50715)))

(declare-fun b!1345886 () Bool)

(declare-fun res!893082 () Bool)

(declare-fun e!765790 () Bool)

(assert (=> b!1345886 (=> (not res!893082) (not e!765790))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345886 (= res!893082 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!57853 () Bool)

(declare-fun mapRes!57853 () Bool)

(declare-fun tp!110097 () Bool)

(declare-fun e!765787 () Bool)

(assert (=> mapNonEmpty!57853 (= mapRes!57853 (and tp!110097 e!765787))))

(declare-datatypes ((V!55011 0))(
  ( (V!55012 (val!18790 Int)) )
))
(declare-datatypes ((ValueCell!17817 0))(
  ( (ValueCellFull!17817 (v!21438 V!55011)) (EmptyCell!17817) )
))
(declare-fun mapRest!57853 () (Array (_ BitVec 32) ValueCell!17817))

(declare-fun mapKey!57853 () (_ BitVec 32))

(declare-datatypes ((array!91702 0))(
  ( (array!91703 (arr!44307 (Array (_ BitVec 32) ValueCell!17817)) (size!44857 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91702)

(declare-fun mapValue!57853 () ValueCell!17817)

(assert (=> mapNonEmpty!57853 (= (arr!44307 _values!1303) (store mapRest!57853 mapKey!57853 mapValue!57853))))

(declare-fun res!893079 () Bool)

(assert (=> start!113380 (=> (not res!893079) (not e!765790))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113380 (= res!893079 (validMask!0 mask!1977))))

(assert (=> start!113380 e!765790))

(declare-fun tp_is_empty!37431 () Bool)

(assert (=> start!113380 tp_is_empty!37431))

(assert (=> start!113380 true))

(declare-datatypes ((array!91704 0))(
  ( (array!91705 (arr!44308 (Array (_ BitVec 32) (_ BitVec 64))) (size!44858 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91704)

(declare-fun array_inv!33387 (array!91704) Bool)

(assert (=> start!113380 (array_inv!33387 _keys!1571)))

(declare-fun e!765791 () Bool)

(declare-fun array_inv!33388 (array!91702) Bool)

(assert (=> start!113380 (and (array_inv!33388 _values!1303) e!765791)))

(assert (=> start!113380 tp!110098))

(declare-fun b!1345887 () Bool)

(declare-fun res!893080 () Bool)

(assert (=> b!1345887 (=> (not res!893080) (not e!765790))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345887 (= res!893080 (not (= (select (arr!44308 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345888 () Bool)

(declare-fun res!893076 () Bool)

(assert (=> b!1345888 (=> (not res!893076) (not e!765790))))

(declare-fun minValue!1245 () V!55011)

(declare-fun zeroValue!1245 () V!55011)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24224 0))(
  ( (tuple2!24225 (_1!12123 (_ BitVec 64)) (_2!12123 V!55011)) )
))
(declare-datatypes ((List!31380 0))(
  ( (Nil!31377) (Cons!31376 (h!32585 tuple2!24224) (t!45968 List!31380)) )
))
(declare-datatypes ((ListLongMap!21881 0))(
  ( (ListLongMap!21882 (toList!10956 List!31380)) )
))
(declare-fun contains!9132 (ListLongMap!21881 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5908 (array!91704 array!91702 (_ BitVec 32) (_ BitVec 32) V!55011 V!55011 (_ BitVec 32) Int) ListLongMap!21881)

(assert (=> b!1345888 (= res!893076 (contains!9132 (getCurrentListMap!5908 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345889 () Bool)

(declare-fun e!765789 () Bool)

(assert (=> b!1345889 (= e!765791 (and e!765789 mapRes!57853))))

(declare-fun condMapEmpty!57853 () Bool)

(declare-fun mapDefault!57853 () ValueCell!17817)

(assert (=> b!1345889 (= condMapEmpty!57853 (= (arr!44307 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17817)) mapDefault!57853)))))

(declare-fun b!1345890 () Bool)

(assert (=> b!1345890 (= e!765789 tp_is_empty!37431)))

(declare-fun b!1345891 () Bool)

(declare-fun e!765786 () Bool)

(assert (=> b!1345891 (= e!765790 e!765786)))

(declare-fun res!893073 () Bool)

(assert (=> b!1345891 (=> (not res!893073) (not e!765786))))

(declare-fun lt!595441 () ListLongMap!21881)

(declare-fun lt!595443 () V!55011)

(declare-fun +!4836 (ListLongMap!21881 tuple2!24224) ListLongMap!21881)

(assert (=> b!1345891 (= res!893073 (contains!9132 (+!4836 lt!595441 (tuple2!24225 (select (arr!44308 _keys!1571) from!1960) lt!595443)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6478 (array!91704 array!91702 (_ BitVec 32) (_ BitVec 32) V!55011 V!55011 (_ BitVec 32) Int) ListLongMap!21881)

(assert (=> b!1345891 (= lt!595441 (getCurrentListMapNoExtraKeys!6478 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22385 (ValueCell!17817 V!55011) V!55011)

(declare-fun dynLambda!3775 (Int (_ BitVec 64)) V!55011)

(assert (=> b!1345891 (= lt!595443 (get!22385 (select (arr!44307 _values!1303) from!1960) (dynLambda!3775 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1345892 () Bool)

(declare-fun res!893072 () Bool)

(assert (=> b!1345892 (=> (not res!893072) (not e!765790))))

(assert (=> b!1345892 (= res!893072 (and (= (size!44857 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44858 _keys!1571) (size!44857 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345893 () Bool)

(declare-fun res!893075 () Bool)

(assert (=> b!1345893 (=> (not res!893075) (not e!765790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91704 (_ BitVec 32)) Bool)

(assert (=> b!1345893 (= res!893075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345894 () Bool)

(declare-fun res!893078 () Bool)

(assert (=> b!1345894 (=> (not res!893078) (not e!765790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345894 (= res!893078 (validKeyInArray!0 (select (arr!44308 _keys!1571) from!1960)))))

(declare-fun b!1345895 () Bool)

(assert (=> b!1345895 (= e!765787 tp_is_empty!37431)))

(declare-fun b!1345896 () Bool)

(assert (=> b!1345896 (= e!765786 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(assert (=> b!1345896 (contains!9132 lt!595441 k0!1142)))

(declare-datatypes ((Unit!44141 0))(
  ( (Unit!44142) )
))
(declare-fun lt!595442 () Unit!44141)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!401 ((_ BitVec 64) (_ BitVec 64) V!55011 ListLongMap!21881) Unit!44141)

(assert (=> b!1345896 (= lt!595442 (lemmaInListMapAfterAddingDiffThenInBefore!401 k0!1142 (select (arr!44308 _keys!1571) from!1960) lt!595443 lt!595441))))

(declare-fun b!1345897 () Bool)

(declare-fun res!893074 () Bool)

(assert (=> b!1345897 (=> (not res!893074) (not e!765790))))

(assert (=> b!1345897 (= res!893074 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44858 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57853 () Bool)

(assert (=> mapIsEmpty!57853 mapRes!57853))

(declare-fun b!1345898 () Bool)

(declare-fun res!893081 () Bool)

(assert (=> b!1345898 (=> (not res!893081) (not e!765786))))

(assert (=> b!1345898 (= res!893081 (not (= k0!1142 (select (arr!44308 _keys!1571) from!1960))))))

(declare-fun b!1345899 () Bool)

(declare-fun res!893077 () Bool)

(assert (=> b!1345899 (=> (not res!893077) (not e!765790))))

(declare-datatypes ((List!31381 0))(
  ( (Nil!31378) (Cons!31377 (h!32586 (_ BitVec 64)) (t!45969 List!31381)) )
))
(declare-fun arrayNoDuplicates!0 (array!91704 (_ BitVec 32) List!31381) Bool)

(assert (=> b!1345899 (= res!893077 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31378))))

(assert (= (and start!113380 res!893079) b!1345892))

(assert (= (and b!1345892 res!893072) b!1345893))

(assert (= (and b!1345893 res!893075) b!1345899))

(assert (= (and b!1345899 res!893077) b!1345897))

(assert (= (and b!1345897 res!893074) b!1345888))

(assert (= (and b!1345888 res!893076) b!1345887))

(assert (= (and b!1345887 res!893080) b!1345894))

(assert (= (and b!1345894 res!893078) b!1345886))

(assert (= (and b!1345886 res!893082) b!1345891))

(assert (= (and b!1345891 res!893073) b!1345898))

(assert (= (and b!1345898 res!893081) b!1345896))

(assert (= (and b!1345889 condMapEmpty!57853) mapIsEmpty!57853))

(assert (= (and b!1345889 (not condMapEmpty!57853)) mapNonEmpty!57853))

(get-info :version)

(assert (= (and mapNonEmpty!57853 ((_ is ValueCellFull!17817) mapValue!57853)) b!1345895))

(assert (= (and b!1345889 ((_ is ValueCellFull!17817) mapDefault!57853)) b!1345890))

(assert (= start!113380 b!1345889))

(declare-fun b_lambda!24553 () Bool)

(assert (=> (not b_lambda!24553) (not b!1345891)))

(declare-fun t!45967 () Bool)

(declare-fun tb!12391 () Bool)

(assert (=> (and start!113380 (= defaultEntry!1306 defaultEntry!1306) t!45967) tb!12391))

(declare-fun result!25873 () Bool)

(assert (=> tb!12391 (= result!25873 tp_is_empty!37431)))

(assert (=> b!1345891 t!45967))

(declare-fun b_and!50717 () Bool)

(assert (= b_and!50715 (and (=> t!45967 result!25873) b_and!50717)))

(declare-fun m!1233199 () Bool)

(assert (=> b!1345891 m!1233199))

(declare-fun m!1233201 () Bool)

(assert (=> b!1345891 m!1233201))

(declare-fun m!1233203 () Bool)

(assert (=> b!1345891 m!1233203))

(declare-fun m!1233205 () Bool)

(assert (=> b!1345891 m!1233205))

(declare-fun m!1233207 () Bool)

(assert (=> b!1345891 m!1233207))

(declare-fun m!1233209 () Bool)

(assert (=> b!1345891 m!1233209))

(assert (=> b!1345891 m!1233207))

(declare-fun m!1233211 () Bool)

(assert (=> b!1345891 m!1233211))

(assert (=> b!1345891 m!1233199))

(assert (=> b!1345891 m!1233205))

(assert (=> b!1345898 m!1233211))

(declare-fun m!1233213 () Bool)

(assert (=> b!1345893 m!1233213))

(assert (=> b!1345894 m!1233211))

(assert (=> b!1345894 m!1233211))

(declare-fun m!1233215 () Bool)

(assert (=> b!1345894 m!1233215))

(declare-fun m!1233217 () Bool)

(assert (=> start!113380 m!1233217))

(declare-fun m!1233219 () Bool)

(assert (=> start!113380 m!1233219))

(declare-fun m!1233221 () Bool)

(assert (=> start!113380 m!1233221))

(declare-fun m!1233223 () Bool)

(assert (=> b!1345899 m!1233223))

(assert (=> b!1345887 m!1233211))

(declare-fun m!1233225 () Bool)

(assert (=> b!1345896 m!1233225))

(assert (=> b!1345896 m!1233211))

(assert (=> b!1345896 m!1233211))

(declare-fun m!1233227 () Bool)

(assert (=> b!1345896 m!1233227))

(declare-fun m!1233229 () Bool)

(assert (=> b!1345888 m!1233229))

(assert (=> b!1345888 m!1233229))

(declare-fun m!1233231 () Bool)

(assert (=> b!1345888 m!1233231))

(declare-fun m!1233233 () Bool)

(assert (=> mapNonEmpty!57853 m!1233233))

(check-sat tp_is_empty!37431 (not b_next!31431) (not start!113380) (not b!1345893) (not b!1345894) (not b!1345888) (not b!1345899) (not b!1345891) (not b_lambda!24553) b_and!50717 (not b!1345896) (not mapNonEmpty!57853))
(check-sat b_and!50717 (not b_next!31431))
