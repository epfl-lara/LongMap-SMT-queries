; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79520 () Bool)

(assert start!79520)

(declare-fun b_free!17659 () Bool)

(declare-fun b_next!17659 () Bool)

(assert (=> start!79520 (= b_free!17659 (not b_next!17659))))

(declare-fun tp!61428 () Bool)

(declare-fun b_and!28867 () Bool)

(assert (=> start!79520 (= tp!61428 b_and!28867)))

(declare-fun b!934763 () Bool)

(declare-fun res!629564 () Bool)

(declare-fun e!524859 () Bool)

(assert (=> b!934763 (=> (not res!629564) (not e!524859))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934763 (= res!629564 (validKeyInArray!0 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!934764 () Bool)

(declare-fun e!524860 () Bool)

(declare-datatypes ((array!56239 0))(
  ( (array!56240 (arr!27062 (Array (_ BitVec 32) (_ BitVec 64))) (size!27523 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56239)

(declare-fun arrayContainsKey!0 (array!56239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934764 (= e!524860 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!934765 () Bool)

(declare-fun res!629565 () Bool)

(declare-fun e!524863 () Bool)

(assert (=> b!934765 (=> (not res!629565) (not e!524863))))

(assert (=> b!934765 (= res!629565 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27523 _keys!1487))))))

(declare-fun b!934766 () Bool)

(declare-fun e!524855 () Bool)

(declare-fun e!524856 () Bool)

(assert (=> b!934766 (= e!524855 e!524856)))

(declare-fun res!629571 () Bool)

(assert (=> b!934766 (=> (not res!629571) (not e!524856))))

(declare-datatypes ((List!19102 0))(
  ( (Nil!19099) (Cons!19098 (h!20244 (_ BitVec 64)) (t!27296 List!19102)) )
))
(declare-fun contains!5035 (List!19102 (_ BitVec 64)) Bool)

(assert (=> b!934766 (= res!629571 (not (contains!5035 Nil!19099 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!934767 () Bool)

(declare-fun res!629576 () Bool)

(assert (=> b!934767 (=> (not res!629576) (not e!524863))))

(declare-fun arrayNoDuplicates!0 (array!56239 (_ BitVec 32) List!19102) Bool)

(assert (=> b!934767 (= res!629576 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19099))))

(declare-fun mapIsEmpty!32016 () Bool)

(declare-fun mapRes!32016 () Bool)

(assert (=> mapIsEmpty!32016 mapRes!32016))

(declare-fun b!934768 () Bool)

(declare-fun res!629574 () Bool)

(assert (=> b!934768 (=> (not res!629574) (not e!524859))))

(assert (=> b!934768 (= res!629574 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934769 () Bool)

(declare-fun e!524862 () Bool)

(assert (=> b!934769 (= e!524862 (not e!524855))))

(declare-fun res!629566 () Bool)

(assert (=> b!934769 (=> res!629566 e!524855)))

(assert (=> b!934769 (= res!629566 (or (bvsge (size!27523 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27523 _keys!1487))))))

(assert (=> b!934769 e!524860))

(declare-fun c!97161 () Bool)

(assert (=> b!934769 (= c!97161 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((Unit!31452 0))(
  ( (Unit!31453) )
))
(declare-fun lt!421090 () Unit!31452)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31855 0))(
  ( (V!31856 (val!10134 Int)) )
))
(declare-datatypes ((ValueCell!9602 0))(
  ( (ValueCellFull!9602 (v!12654 V!31855)) (EmptyCell!9602) )
))
(declare-datatypes ((array!56241 0))(
  ( (array!56242 (arr!27063 (Array (_ BitVec 32) ValueCell!9602)) (size!27524 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56241)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31855)

(declare-fun minValue!1173 () V!31855)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!283 (array!56239 array!56241 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 64) (_ BitVec 32) Int) Unit!31452)

(assert (=> b!934769 (= lt!421090 (lemmaListMapContainsThenArrayContainsFrom!283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!934769 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19099)))

(declare-fun lt!421087 () Unit!31452)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56239 (_ BitVec 32) (_ BitVec 32)) Unit!31452)

(assert (=> b!934769 (= lt!421087 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13354 0))(
  ( (tuple2!13355 (_1!6688 (_ BitVec 64)) (_2!6688 V!31855)) )
))
(declare-datatypes ((List!19103 0))(
  ( (Nil!19100) (Cons!19099 (h!20245 tuple2!13354) (t!27297 List!19103)) )
))
(declare-datatypes ((ListLongMap!12041 0))(
  ( (ListLongMap!12042 (toList!6036 List!19103)) )
))
(declare-fun lt!421088 () ListLongMap!12041)

(declare-fun lt!421091 () tuple2!13354)

(declare-fun contains!5036 (ListLongMap!12041 (_ BitVec 64)) Bool)

(declare-fun +!2836 (ListLongMap!12041 tuple2!13354) ListLongMap!12041)

(assert (=> b!934769 (contains!5036 (+!2836 lt!421088 lt!421091) k0!1099)))

(declare-fun lt!421093 () V!31855)

(declare-fun lt!421094 () Unit!31452)

(declare-fun lt!421089 () (_ BitVec 64))

(declare-fun addStillContains!525 (ListLongMap!12041 (_ BitVec 64) V!31855 (_ BitVec 64)) Unit!31452)

(assert (=> b!934769 (= lt!421094 (addStillContains!525 lt!421088 lt!421089 lt!421093 k0!1099))))

(declare-fun getCurrentListMap!3206 (array!56239 array!56241 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 32) Int) ListLongMap!12041)

(assert (=> b!934769 (= (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2836 (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421091))))

(assert (=> b!934769 (= lt!421091 (tuple2!13355 lt!421089 lt!421093))))

(declare-fun get!14260 (ValueCell!9602 V!31855) V!31855)

(declare-fun dynLambda!1592 (Int (_ BitVec 64)) V!31855)

(assert (=> b!934769 (= lt!421093 (get!14260 (select (arr!27063 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1592 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421092 () Unit!31452)

(declare-fun lemmaListMapRecursiveValidKeyArray!200 (array!56239 array!56241 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 32) Int) Unit!31452)

(assert (=> b!934769 (= lt!421092 (lemmaListMapRecursiveValidKeyArray!200 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934770 () Bool)

(declare-fun res!629568 () Bool)

(assert (=> b!934770 (=> res!629568 e!524855)))

(declare-fun noDuplicate!1359 (List!19102) Bool)

(assert (=> b!934770 (= res!629568 (not (noDuplicate!1359 Nil!19099)))))

(declare-fun b!934771 () Bool)

(assert (=> b!934771 (= e!524860 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!934772 () Bool)

(assert (=> b!934772 (= e!524859 e!524862)))

(declare-fun res!629575 () Bool)

(assert (=> b!934772 (=> (not res!629575) (not e!524862))))

(assert (=> b!934772 (= res!629575 (validKeyInArray!0 lt!421089))))

(assert (=> b!934772 (= lt!421089 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934773 () Bool)

(declare-fun e!524864 () Bool)

(declare-fun tp_is_empty!20167 () Bool)

(assert (=> b!934773 (= e!524864 tp_is_empty!20167)))

(declare-fun b!934774 () Bool)

(declare-fun res!629567 () Bool)

(assert (=> b!934774 (=> (not res!629567) (not e!524863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56239 (_ BitVec 32)) Bool)

(assert (=> b!934774 (= res!629567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!629572 () Bool)

(assert (=> start!79520 (=> (not res!629572) (not e!524863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79520 (= res!629572 (validMask!0 mask!1881))))

(assert (=> start!79520 e!524863))

(assert (=> start!79520 true))

(assert (=> start!79520 tp_is_empty!20167))

(declare-fun e!524857 () Bool)

(declare-fun array_inv!21122 (array!56241) Bool)

(assert (=> start!79520 (and (array_inv!21122 _values!1231) e!524857)))

(assert (=> start!79520 tp!61428))

(declare-fun array_inv!21123 (array!56239) Bool)

(assert (=> start!79520 (array_inv!21123 _keys!1487)))

(declare-fun b!934775 () Bool)

(assert (=> b!934775 (= e!524856 (not (contains!5035 Nil!19099 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!934776 () Bool)

(assert (=> b!934776 (= e!524857 (and e!524864 mapRes!32016))))

(declare-fun condMapEmpty!32016 () Bool)

(declare-fun mapDefault!32016 () ValueCell!9602)

(assert (=> b!934776 (= condMapEmpty!32016 (= (arr!27063 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9602)) mapDefault!32016)))))

(declare-fun b!934777 () Bool)

(declare-fun res!629573 () Bool)

(assert (=> b!934777 (=> (not res!629573) (not e!524863))))

(assert (=> b!934777 (= res!629573 (and (= (size!27524 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27523 _keys!1487) (size!27524 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934778 () Bool)

(declare-fun e!524861 () Bool)

(assert (=> b!934778 (= e!524861 tp_is_empty!20167)))

(declare-fun mapNonEmpty!32016 () Bool)

(declare-fun tp!61427 () Bool)

(assert (=> mapNonEmpty!32016 (= mapRes!32016 (and tp!61427 e!524861))))

(declare-fun mapValue!32016 () ValueCell!9602)

(declare-fun mapKey!32016 () (_ BitVec 32))

(declare-fun mapRest!32016 () (Array (_ BitVec 32) ValueCell!9602))

(assert (=> mapNonEmpty!32016 (= (arr!27063 _values!1231) (store mapRest!32016 mapKey!32016 mapValue!32016))))

(declare-fun b!934779 () Bool)

(assert (=> b!934779 (= e!524863 e!524859)))

(declare-fun res!629569 () Bool)

(assert (=> b!934779 (=> (not res!629569) (not e!524859))))

(assert (=> b!934779 (= res!629569 (contains!5036 lt!421088 k0!1099))))

(assert (=> b!934779 (= lt!421088 (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934780 () Bool)

(declare-fun res!629570 () Bool)

(assert (=> b!934780 (=> (not res!629570) (not e!524859))))

(declare-fun v!791 () V!31855)

(declare-fun apply!816 (ListLongMap!12041 (_ BitVec 64)) V!31855)

(assert (=> b!934780 (= res!629570 (= (apply!816 lt!421088 k0!1099) v!791))))

(assert (= (and start!79520 res!629572) b!934777))

(assert (= (and b!934777 res!629573) b!934774))

(assert (= (and b!934774 res!629567) b!934767))

(assert (= (and b!934767 res!629576) b!934765))

(assert (= (and b!934765 res!629565) b!934779))

(assert (= (and b!934779 res!629569) b!934780))

(assert (= (and b!934780 res!629570) b!934768))

(assert (= (and b!934768 res!629574) b!934763))

(assert (= (and b!934763 res!629564) b!934772))

(assert (= (and b!934772 res!629575) b!934769))

(assert (= (and b!934769 c!97161) b!934764))

(assert (= (and b!934769 (not c!97161)) b!934771))

(assert (= (and b!934769 (not res!629566)) b!934770))

(assert (= (and b!934770 (not res!629568)) b!934766))

(assert (= (and b!934766 res!629571) b!934775))

(assert (= (and b!934776 condMapEmpty!32016) mapIsEmpty!32016))

(assert (= (and b!934776 (not condMapEmpty!32016)) mapNonEmpty!32016))

(get-info :version)

(assert (= (and mapNonEmpty!32016 ((_ is ValueCellFull!9602) mapValue!32016)) b!934778))

(assert (= (and b!934776 ((_ is ValueCellFull!9602) mapDefault!32016)) b!934773))

(assert (= start!79520 b!934776))

(declare-fun b_lambda!14011 () Bool)

(assert (=> (not b_lambda!14011) (not b!934769)))

(declare-fun t!27295 () Bool)

(declare-fun tb!6045 () Bool)

(assert (=> (and start!79520 (= defaultEntry!1235 defaultEntry!1235) t!27295) tb!6045))

(declare-fun result!11927 () Bool)

(assert (=> tb!6045 (= result!11927 tp_is_empty!20167)))

(assert (=> b!934769 t!27295))

(declare-fun b_and!28869 () Bool)

(assert (= b_and!28867 (and (=> t!27295 result!11927) b_and!28869)))

(declare-fun m!868627 () Bool)

(assert (=> b!934780 m!868627))

(declare-fun m!868629 () Bool)

(assert (=> b!934774 m!868629))

(declare-fun m!868631 () Bool)

(assert (=> b!934775 m!868631))

(declare-fun m!868633 () Bool)

(assert (=> b!934767 m!868633))

(declare-fun m!868635 () Bool)

(assert (=> mapNonEmpty!32016 m!868635))

(declare-fun m!868637 () Bool)

(assert (=> b!934764 m!868637))

(declare-fun m!868639 () Bool)

(assert (=> b!934772 m!868639))

(declare-fun m!868641 () Bool)

(assert (=> b!934772 m!868641))

(declare-fun m!868643 () Bool)

(assert (=> b!934770 m!868643))

(declare-fun m!868645 () Bool)

(assert (=> b!934763 m!868645))

(declare-fun m!868647 () Bool)

(assert (=> start!79520 m!868647))

(declare-fun m!868649 () Bool)

(assert (=> start!79520 m!868649))

(declare-fun m!868651 () Bool)

(assert (=> start!79520 m!868651))

(declare-fun m!868653 () Bool)

(assert (=> b!934769 m!868653))

(declare-fun m!868655 () Bool)

(assert (=> b!934769 m!868655))

(declare-fun m!868657 () Bool)

(assert (=> b!934769 m!868657))

(declare-fun m!868659 () Bool)

(assert (=> b!934769 m!868659))

(declare-fun m!868661 () Bool)

(assert (=> b!934769 m!868661))

(declare-fun m!868663 () Bool)

(assert (=> b!934769 m!868663))

(declare-fun m!868665 () Bool)

(assert (=> b!934769 m!868665))

(declare-fun m!868667 () Bool)

(assert (=> b!934769 m!868667))

(declare-fun m!868669 () Bool)

(assert (=> b!934769 m!868669))

(declare-fun m!868671 () Bool)

(assert (=> b!934769 m!868671))

(declare-fun m!868673 () Bool)

(assert (=> b!934769 m!868673))

(assert (=> b!934769 m!868661))

(assert (=> b!934769 m!868663))

(assert (=> b!934769 m!868659))

(declare-fun m!868675 () Bool)

(assert (=> b!934769 m!868675))

(assert (=> b!934769 m!868653))

(declare-fun m!868677 () Bool)

(assert (=> b!934769 m!868677))

(declare-fun m!868679 () Bool)

(assert (=> b!934766 m!868679))

(declare-fun m!868681 () Bool)

(assert (=> b!934779 m!868681))

(declare-fun m!868683 () Bool)

(assert (=> b!934779 m!868683))

(check-sat (not b!934775) tp_is_empty!20167 (not b!934774) (not b!934766) (not b_next!17659) (not b!934772) (not b!934763) b_and!28869 (not mapNonEmpty!32016) (not b!934780) (not b!934770) (not b!934767) (not start!79520) (not b!934764) (not b!934769) (not b_lambda!14011) (not b!934779))
(check-sat b_and!28869 (not b_next!17659))
(get-model)

(declare-fun b_lambda!14017 () Bool)

(assert (= b_lambda!14011 (or (and start!79520 b_free!17659) b_lambda!14017)))

(check-sat (not b!934775) (not b!934774) (not b!934766) (not b_next!17659) (not b!934772) (not b!934763) b_and!28869 (not mapNonEmpty!32016) (not b!934780) (not b!934770) (not b!934767) (not start!79520) (not b!934779) (not b_lambda!14017) tp_is_empty!20167 (not b!934764) (not b!934769))
(check-sat b_and!28869 (not b_next!17659))
(get-model)

(declare-fun d!112997 () Bool)

(declare-fun lt!421145 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!404 (List!19102) (InoxSet (_ BitVec 64)))

(assert (=> d!112997 (= lt!421145 (select (content!404 Nil!19099) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!524929 () Bool)

(assert (=> d!112997 (= lt!421145 e!524929)))

(declare-fun res!629660 () Bool)

(assert (=> d!112997 (=> (not res!629660) (not e!524929))))

(assert (=> d!112997 (= res!629660 ((_ is Cons!19098) Nil!19099))))

(assert (=> d!112997 (= (contains!5035 Nil!19099 #b0000000000000000000000000000000000000000000000000000000000000000) lt!421145)))

(declare-fun b!934899 () Bool)

(declare-fun e!524930 () Bool)

(assert (=> b!934899 (= e!524929 e!524930)))

(declare-fun res!629659 () Bool)

(assert (=> b!934899 (=> res!629659 e!524930)))

(assert (=> b!934899 (= res!629659 (= (h!20244 Nil!19099) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934900 () Bool)

(assert (=> b!934900 (= e!524930 (contains!5035 (t!27296 Nil!19099) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!112997 res!629660) b!934899))

(assert (= (and b!934899 (not res!629659)) b!934900))

(declare-fun m!868801 () Bool)

(assert (=> d!112997 m!868801))

(declare-fun m!868803 () Bool)

(assert (=> d!112997 m!868803))

(declare-fun m!868805 () Bool)

(assert (=> b!934900 m!868805))

(assert (=> b!934766 d!112997))

(declare-fun b!934909 () Bool)

(declare-fun e!524938 () Bool)

(declare-fun e!524939 () Bool)

(assert (=> b!934909 (= e!524938 e!524939)))

(declare-fun lt!421154 () (_ BitVec 64))

(assert (=> b!934909 (= lt!421154 (select (arr!27062 _keys!1487) #b00000000000000000000000000000000))))

(declare-fun lt!421153 () Unit!31452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56239 (_ BitVec 64) (_ BitVec 32)) Unit!31452)

(assert (=> b!934909 (= lt!421153 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!421154 #b00000000000000000000000000000000))))

(assert (=> b!934909 (arrayContainsKey!0 _keys!1487 lt!421154 #b00000000000000000000000000000000)))

(declare-fun lt!421152 () Unit!31452)

(assert (=> b!934909 (= lt!421152 lt!421153)))

(declare-fun res!629665 () Bool)

(declare-datatypes ((SeekEntryResult!8979 0))(
  ( (MissingZero!8979 (index!38287 (_ BitVec 32))) (Found!8979 (index!38288 (_ BitVec 32))) (Intermediate!8979 (undefined!9791 Bool) (index!38289 (_ BitVec 32)) (x!80195 (_ BitVec 32))) (Undefined!8979) (MissingVacant!8979 (index!38290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56239 (_ BitVec 32)) SeekEntryResult!8979)

(assert (=> b!934909 (= res!629665 (= (seekEntryOrOpen!0 (select (arr!27062 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8979 #b00000000000000000000000000000000)))))

(assert (=> b!934909 (=> (not res!629665) (not e!524939))))

(declare-fun d!112999 () Bool)

(declare-fun res!629666 () Bool)

(declare-fun e!524937 () Bool)

(assert (=> d!112999 (=> res!629666 e!524937)))

(assert (=> d!112999 (= res!629666 (bvsge #b00000000000000000000000000000000 (size!27523 _keys!1487)))))

(assert (=> d!112999 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!524937)))

(declare-fun b!934910 () Bool)

(declare-fun call!40651 () Bool)

(assert (=> b!934910 (= e!524938 call!40651)))

(declare-fun b!934911 () Bool)

(assert (=> b!934911 (= e!524939 call!40651)))

(declare-fun bm!40648 () Bool)

(assert (=> bm!40648 (= call!40651 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!934912 () Bool)

(assert (=> b!934912 (= e!524937 e!524938)))

(declare-fun c!97170 () Bool)

(assert (=> b!934912 (= c!97170 (validKeyInArray!0 (select (arr!27062 _keys!1487) #b00000000000000000000000000000000)))))

(assert (= (and d!112999 (not res!629666)) b!934912))

(assert (= (and b!934912 c!97170) b!934909))

(assert (= (and b!934912 (not c!97170)) b!934910))

(assert (= (and b!934909 res!629665) b!934911))

(assert (= (or b!934911 b!934910) bm!40648))

(declare-fun m!868807 () Bool)

(assert (=> b!934909 m!868807))

(declare-fun m!868809 () Bool)

(assert (=> b!934909 m!868809))

(declare-fun m!868811 () Bool)

(assert (=> b!934909 m!868811))

(assert (=> b!934909 m!868807))

(declare-fun m!868813 () Bool)

(assert (=> b!934909 m!868813))

(declare-fun m!868815 () Bool)

(assert (=> bm!40648 m!868815))

(assert (=> b!934912 m!868807))

(assert (=> b!934912 m!868807))

(declare-fun m!868817 () Bool)

(assert (=> b!934912 m!868817))

(assert (=> b!934774 d!112999))

(declare-fun d!113001 () Bool)

(declare-fun lt!421155 () Bool)

(assert (=> d!113001 (= lt!421155 (select (content!404 Nil!19099) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!524940 () Bool)

(assert (=> d!113001 (= lt!421155 e!524940)))

(declare-fun res!629668 () Bool)

(assert (=> d!113001 (=> (not res!629668) (not e!524940))))

(assert (=> d!113001 (= res!629668 ((_ is Cons!19098) Nil!19099))))

(assert (=> d!113001 (= (contains!5035 Nil!19099 #b1000000000000000000000000000000000000000000000000000000000000000) lt!421155)))

(declare-fun b!934913 () Bool)

(declare-fun e!524941 () Bool)

(assert (=> b!934913 (= e!524940 e!524941)))

(declare-fun res!629667 () Bool)

(assert (=> b!934913 (=> res!629667 e!524941)))

(assert (=> b!934913 (= res!629667 (= (h!20244 Nil!19099) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934914 () Bool)

(assert (=> b!934914 (= e!524941 (contains!5035 (t!27296 Nil!19099) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!113001 res!629668) b!934913))

(assert (= (and b!934913 (not res!629667)) b!934914))

(assert (=> d!113001 m!868801))

(declare-fun m!868819 () Bool)

(assert (=> d!113001 m!868819))

(declare-fun m!868821 () Bool)

(assert (=> b!934914 m!868821))

(assert (=> b!934775 d!113001))

(declare-fun b!934925 () Bool)

(declare-fun e!524950 () Bool)

(declare-fun e!524952 () Bool)

(assert (=> b!934925 (= e!524950 e!524952)))

(declare-fun c!97173 () Bool)

(assert (=> b!934925 (= c!97173 (validKeyInArray!0 (select (arr!27062 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!934926 () Bool)

(declare-fun call!40654 () Bool)

(assert (=> b!934926 (= e!524952 call!40654)))

(declare-fun b!934927 () Bool)

(declare-fun e!524953 () Bool)

(assert (=> b!934927 (= e!524953 (contains!5035 Nil!19099 (select (arr!27062 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun b!934928 () Bool)

(assert (=> b!934928 (= e!524952 call!40654)))

(declare-fun b!934929 () Bool)

(declare-fun e!524951 () Bool)

(assert (=> b!934929 (= e!524951 e!524950)))

(declare-fun res!629677 () Bool)

(assert (=> b!934929 (=> (not res!629677) (not e!524950))))

(assert (=> b!934929 (= res!629677 (not e!524953))))

(declare-fun res!629676 () Bool)

(assert (=> b!934929 (=> (not res!629676) (not e!524953))))

(assert (=> b!934929 (= res!629676 (validKeyInArray!0 (select (arr!27062 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun d!113003 () Bool)

(declare-fun res!629675 () Bool)

(assert (=> d!113003 (=> res!629675 e!524951)))

(assert (=> d!113003 (= res!629675 (bvsge #b00000000000000000000000000000000 (size!27523 _keys!1487)))))

(assert (=> d!113003 (= (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19099) e!524951)))

(declare-fun bm!40651 () Bool)

(assert (=> bm!40651 (= call!40654 (arrayNoDuplicates!0 _keys!1487 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!97173 (Cons!19098 (select (arr!27062 _keys!1487) #b00000000000000000000000000000000) Nil!19099) Nil!19099)))))

(assert (= (and d!113003 (not res!629675)) b!934929))

(assert (= (and b!934929 res!629676) b!934927))

(assert (= (and b!934929 res!629677) b!934925))

(assert (= (and b!934925 c!97173) b!934928))

(assert (= (and b!934925 (not c!97173)) b!934926))

(assert (= (or b!934928 b!934926) bm!40651))

(assert (=> b!934925 m!868807))

(assert (=> b!934925 m!868807))

(assert (=> b!934925 m!868817))

(assert (=> b!934927 m!868807))

(assert (=> b!934927 m!868807))

(declare-fun m!868823 () Bool)

(assert (=> b!934927 m!868823))

(assert (=> b!934929 m!868807))

(assert (=> b!934929 m!868807))

(assert (=> b!934929 m!868817))

(assert (=> bm!40651 m!868807))

(declare-fun m!868825 () Bool)

(assert (=> bm!40651 m!868825))

(assert (=> b!934767 d!113003))

(declare-fun d!113005 () Bool)

(declare-fun res!629682 () Bool)

(declare-fun e!524958 () Bool)

(assert (=> d!113005 (=> res!629682 e!524958)))

(assert (=> d!113005 (= res!629682 ((_ is Nil!19099) Nil!19099))))

(assert (=> d!113005 (= (noDuplicate!1359 Nil!19099) e!524958)))

(declare-fun b!934934 () Bool)

(declare-fun e!524959 () Bool)

(assert (=> b!934934 (= e!524958 e!524959)))

(declare-fun res!629683 () Bool)

(assert (=> b!934934 (=> (not res!629683) (not e!524959))))

(assert (=> b!934934 (= res!629683 (not (contains!5035 (t!27296 Nil!19099) (h!20244 Nil!19099))))))

(declare-fun b!934935 () Bool)

(assert (=> b!934935 (= e!524959 (noDuplicate!1359 (t!27296 Nil!19099)))))

(assert (= (and d!113005 (not res!629682)) b!934934))

(assert (= (and b!934934 res!629683) b!934935))

(declare-fun m!868827 () Bool)

(assert (=> b!934934 m!868827))

(declare-fun m!868829 () Bool)

(assert (=> b!934935 m!868829))

(assert (=> b!934770 d!113005))

(declare-fun d!113007 () Bool)

(declare-datatypes ((Option!490 0))(
  ( (Some!489 (v!12658 V!31855)) (None!488) )
))
(declare-fun get!14263 (Option!490) V!31855)

(declare-fun getValueByKey!484 (List!19103 (_ BitVec 64)) Option!490)

(assert (=> d!113007 (= (apply!816 lt!421088 k0!1099) (get!14263 (getValueByKey!484 (toList!6036 lt!421088) k0!1099)))))

(declare-fun bs!26218 () Bool)

(assert (= bs!26218 d!113007))

(declare-fun m!868831 () Bool)

(assert (=> bs!26218 m!868831))

(assert (=> bs!26218 m!868831))

(declare-fun m!868833 () Bool)

(assert (=> bs!26218 m!868833))

(assert (=> b!934780 d!113007))

(declare-fun d!113009 () Bool)

(declare-fun e!524962 () Bool)

(assert (=> d!113009 e!524962))

(declare-fun res!629688 () Bool)

(assert (=> d!113009 (=> (not res!629688) (not e!524962))))

(declare-fun lt!421164 () ListLongMap!12041)

(assert (=> d!113009 (= res!629688 (contains!5036 lt!421164 (_1!6688 lt!421091)))))

(declare-fun lt!421166 () List!19103)

(assert (=> d!113009 (= lt!421164 (ListLongMap!12042 lt!421166))))

(declare-fun lt!421165 () Unit!31452)

(declare-fun lt!421167 () Unit!31452)

(assert (=> d!113009 (= lt!421165 lt!421167)))

(assert (=> d!113009 (= (getValueByKey!484 lt!421166 (_1!6688 lt!421091)) (Some!489 (_2!6688 lt!421091)))))

(declare-fun lemmaContainsTupThenGetReturnValue!258 (List!19103 (_ BitVec 64) V!31855) Unit!31452)

(assert (=> d!113009 (= lt!421167 (lemmaContainsTupThenGetReturnValue!258 lt!421166 (_1!6688 lt!421091) (_2!6688 lt!421091)))))

(declare-fun insertStrictlySorted!315 (List!19103 (_ BitVec 64) V!31855) List!19103)

(assert (=> d!113009 (= lt!421166 (insertStrictlySorted!315 (toList!6036 (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235)) (_1!6688 lt!421091) (_2!6688 lt!421091)))))

(assert (=> d!113009 (= (+!2836 (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421091) lt!421164)))

(declare-fun b!934940 () Bool)

(declare-fun res!629689 () Bool)

(assert (=> b!934940 (=> (not res!629689) (not e!524962))))

(assert (=> b!934940 (= res!629689 (= (getValueByKey!484 (toList!6036 lt!421164) (_1!6688 lt!421091)) (Some!489 (_2!6688 lt!421091))))))

(declare-fun b!934941 () Bool)

(declare-fun contains!5041 (List!19103 tuple2!13354) Bool)

(assert (=> b!934941 (= e!524962 (contains!5041 (toList!6036 lt!421164) lt!421091))))

(assert (= (and d!113009 res!629688) b!934940))

(assert (= (and b!934940 res!629689) b!934941))

(declare-fun m!868835 () Bool)

(assert (=> d!113009 m!868835))

(declare-fun m!868837 () Bool)

(assert (=> d!113009 m!868837))

(declare-fun m!868839 () Bool)

(assert (=> d!113009 m!868839))

(declare-fun m!868841 () Bool)

(assert (=> d!113009 m!868841))

(declare-fun m!868843 () Bool)

(assert (=> b!934940 m!868843))

(declare-fun m!868845 () Bool)

(assert (=> b!934941 m!868845))

(assert (=> b!934769 d!113009))

(declare-fun b!934984 () Bool)

(declare-fun e!524994 () Bool)

(declare-fun e!524997 () Bool)

(assert (=> b!934984 (= e!524994 e!524997)))

(declare-fun res!629713 () Bool)

(declare-fun call!40669 () Bool)

(assert (=> b!934984 (= res!629713 call!40669)))

(assert (=> b!934984 (=> (not res!629713) (not e!524997))))

(declare-fun b!934985 () Bool)

(declare-fun e!524999 () Bool)

(declare-fun e!524990 () Bool)

(assert (=> b!934985 (= e!524999 e!524990)))

(declare-fun res!629715 () Bool)

(assert (=> b!934985 (=> (not res!629715) (not e!524990))))

(declare-fun lt!421216 () ListLongMap!12041)

(assert (=> b!934985 (= res!629715 (contains!5036 lt!421216 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!934985 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27523 _keys!1487)))))

(declare-fun b!934986 () Bool)

(assert (=> b!934986 (= e!524994 (not call!40669))))

(declare-fun bm!40666 () Bool)

(assert (=> bm!40666 (= call!40669 (contains!5036 lt!421216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40667 () Bool)

(declare-fun call!40675 () ListLongMap!12041)

(declare-fun call!40674 () ListLongMap!12041)

(assert (=> bm!40667 (= call!40675 call!40674)))

(declare-fun b!934987 () Bool)

(declare-fun c!97188 () Bool)

(assert (=> b!934987 (= c!97188 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!524989 () ListLongMap!12041)

(declare-fun e!524991 () ListLongMap!12041)

(assert (=> b!934987 (= e!524989 e!524991)))

(declare-fun b!934988 () Bool)

(declare-fun e!524996 () Bool)

(assert (=> b!934988 (= e!524996 (validKeyInArray!0 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!934989 () Bool)

(declare-fun e!524998 () ListLongMap!12041)

(assert (=> b!934989 (= e!524998 e!524989)))

(declare-fun c!97189 () Bool)

(assert (=> b!934989 (= c!97189 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40668 () Bool)

(declare-fun call!40671 () ListLongMap!12041)

(declare-fun call!40673 () ListLongMap!12041)

(assert (=> bm!40668 (= call!40671 call!40673)))

(declare-fun b!934990 () Bool)

(declare-fun res!629709 () Bool)

(declare-fun e!525001 () Bool)

(assert (=> b!934990 (=> (not res!629709) (not e!525001))))

(assert (=> b!934990 (= res!629709 e!524994)))

(declare-fun c!97191 () Bool)

(assert (=> b!934990 (= c!97191 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!934991 () Bool)

(assert (=> b!934991 (= e!524991 call!40671)))

(declare-fun b!934992 () Bool)

(declare-fun e!524993 () Unit!31452)

(declare-fun lt!421225 () Unit!31452)

(assert (=> b!934992 (= e!524993 lt!421225)))

(declare-fun lt!421218 () ListLongMap!12041)

(declare-fun getCurrentListMapNoExtraKeys!3337 (array!56239 array!56241 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 32) Int) ListLongMap!12041)

(assert (=> b!934992 (= lt!421218 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421213 () (_ BitVec 64))

(assert (=> b!934992 (= lt!421213 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421223 () (_ BitVec 64))

(assert (=> b!934992 (= lt!421223 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421217 () Unit!31452)

(assert (=> b!934992 (= lt!421217 (addStillContains!525 lt!421218 lt!421213 zeroValue!1173 lt!421223))))

(assert (=> b!934992 (contains!5036 (+!2836 lt!421218 (tuple2!13355 lt!421213 zeroValue!1173)) lt!421223)))

(declare-fun lt!421224 () Unit!31452)

(assert (=> b!934992 (= lt!421224 lt!421217)))

(declare-fun lt!421232 () ListLongMap!12041)

(assert (=> b!934992 (= lt!421232 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421215 () (_ BitVec 64))

(assert (=> b!934992 (= lt!421215 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421233 () (_ BitVec 64))

(assert (=> b!934992 (= lt!421233 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421230 () Unit!31452)

(declare-fun addApplyDifferent!415 (ListLongMap!12041 (_ BitVec 64) V!31855 (_ BitVec 64)) Unit!31452)

(assert (=> b!934992 (= lt!421230 (addApplyDifferent!415 lt!421232 lt!421215 minValue!1173 lt!421233))))

(assert (=> b!934992 (= (apply!816 (+!2836 lt!421232 (tuple2!13355 lt!421215 minValue!1173)) lt!421233) (apply!816 lt!421232 lt!421233))))

(declare-fun lt!421226 () Unit!31452)

(assert (=> b!934992 (= lt!421226 lt!421230)))

(declare-fun lt!421231 () ListLongMap!12041)

(assert (=> b!934992 (= lt!421231 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421227 () (_ BitVec 64))

(assert (=> b!934992 (= lt!421227 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421214 () (_ BitVec 64))

(assert (=> b!934992 (= lt!421214 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421212 () Unit!31452)

(assert (=> b!934992 (= lt!421212 (addApplyDifferent!415 lt!421231 lt!421227 zeroValue!1173 lt!421214))))

(assert (=> b!934992 (= (apply!816 (+!2836 lt!421231 (tuple2!13355 lt!421227 zeroValue!1173)) lt!421214) (apply!816 lt!421231 lt!421214))))

(declare-fun lt!421220 () Unit!31452)

(assert (=> b!934992 (= lt!421220 lt!421212)))

(declare-fun lt!421221 () ListLongMap!12041)

(assert (=> b!934992 (= lt!421221 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun lt!421229 () (_ BitVec 64))

(assert (=> b!934992 (= lt!421229 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421219 () (_ BitVec 64))

(assert (=> b!934992 (= lt!421219 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!934992 (= lt!421225 (addApplyDifferent!415 lt!421221 lt!421229 minValue!1173 lt!421219))))

(assert (=> b!934992 (= (apply!816 (+!2836 lt!421221 (tuple2!13355 lt!421229 minValue!1173)) lt!421219) (apply!816 lt!421221 lt!421219))))

(declare-fun b!934993 () Bool)

(declare-fun e!525000 () Bool)

(assert (=> b!934993 (= e!525000 (validKeyInArray!0 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun bm!40669 () Bool)

(declare-fun call!40670 () ListLongMap!12041)

(assert (=> bm!40669 (= call!40670 call!40675)))

(declare-fun b!934994 () Bool)

(assert (=> b!934994 (= e!524991 call!40670)))

(declare-fun b!934995 () Bool)

(assert (=> b!934995 (= e!524990 (= (apply!816 lt!421216 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))) (get!14260 (select (arr!27063 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1592 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934995 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27524 _values!1231)))))

(assert (=> b!934995 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27523 _keys!1487)))))

(declare-fun b!934996 () Bool)

(declare-fun e!524995 () Bool)

(assert (=> b!934996 (= e!524995 (= (apply!816 lt!421216 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40670 () Bool)

(declare-fun call!40672 () Bool)

(assert (=> bm!40670 (= call!40672 (contains!5036 lt!421216 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!934997 () Bool)

(declare-fun e!524992 () Bool)

(assert (=> b!934997 (= e!524992 e!524995)))

(declare-fun res!629708 () Bool)

(assert (=> b!934997 (= res!629708 call!40672)))

(assert (=> b!934997 (=> (not res!629708) (not e!524995))))

(declare-fun b!934998 () Bool)

(assert (=> b!934998 (= e!525001 e!524992)))

(declare-fun c!97187 () Bool)

(assert (=> b!934998 (= c!97187 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!934999 () Bool)

(assert (=> b!934999 (= e!524998 (+!2836 call!40673 (tuple2!13355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935000 () Bool)

(declare-fun Unit!31458 () Unit!31452)

(assert (=> b!935000 (= e!524993 Unit!31458)))

(declare-fun bm!40671 () Bool)

(declare-fun c!97190 () Bool)

(assert (=> bm!40671 (= call!40673 (+!2836 (ite c!97190 call!40674 (ite c!97189 call!40675 call!40670)) (ite (or c!97190 c!97189) (tuple2!13355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935001 () Bool)

(declare-fun res!629714 () Bool)

(assert (=> b!935001 (=> (not res!629714) (not e!525001))))

(assert (=> b!935001 (= res!629714 e!524999)))

(declare-fun res!629711 () Bool)

(assert (=> b!935001 (=> res!629711 e!524999)))

(assert (=> b!935001 (= res!629711 (not e!525000))))

(declare-fun res!629710 () Bool)

(assert (=> b!935001 (=> (not res!629710) (not e!525000))))

(assert (=> b!935001 (= res!629710 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27523 _keys!1487)))))

(declare-fun b!935002 () Bool)

(assert (=> b!935002 (= e!524989 call!40671)))

(declare-fun b!935003 () Bool)

(assert (=> b!935003 (= e!524997 (= (apply!816 lt!421216 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40672 () Bool)

(assert (=> bm!40672 (= call!40674 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun d!113011 () Bool)

(assert (=> d!113011 e!525001))

(declare-fun res!629716 () Bool)

(assert (=> d!113011 (=> (not res!629716) (not e!525001))))

(assert (=> d!113011 (= res!629716 (or (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27523 _keys!1487)) (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27523 _keys!1487)))))))

(declare-fun lt!421228 () ListLongMap!12041)

(assert (=> d!113011 (= lt!421216 lt!421228)))

(declare-fun lt!421222 () Unit!31452)

(assert (=> d!113011 (= lt!421222 e!524993)))

(declare-fun c!97186 () Bool)

(assert (=> d!113011 (= c!97186 e!524996)))

(declare-fun res!629712 () Bool)

(assert (=> d!113011 (=> (not res!629712) (not e!524996))))

(assert (=> d!113011 (= res!629712 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27523 _keys!1487)))))

(assert (=> d!113011 (= lt!421228 e!524998)))

(assert (=> d!113011 (= c!97190 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113011 (validMask!0 mask!1881)))

(assert (=> d!113011 (= (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421216)))

(declare-fun b!935004 () Bool)

(assert (=> b!935004 (= e!524992 (not call!40672))))

(assert (= (and d!113011 c!97190) b!934999))

(assert (= (and d!113011 (not c!97190)) b!934989))

(assert (= (and b!934989 c!97189) b!935002))

(assert (= (and b!934989 (not c!97189)) b!934987))

(assert (= (and b!934987 c!97188) b!934991))

(assert (= (and b!934987 (not c!97188)) b!934994))

(assert (= (or b!934991 b!934994) bm!40669))

(assert (= (or b!935002 bm!40669) bm!40667))

(assert (= (or b!935002 b!934991) bm!40668))

(assert (= (or b!934999 bm!40667) bm!40672))

(assert (= (or b!934999 bm!40668) bm!40671))

(assert (= (and d!113011 res!629712) b!934988))

(assert (= (and d!113011 c!97186) b!934992))

(assert (= (and d!113011 (not c!97186)) b!935000))

(assert (= (and d!113011 res!629716) b!935001))

(assert (= (and b!935001 res!629710) b!934993))

(assert (= (and b!935001 (not res!629711)) b!934985))

(assert (= (and b!934985 res!629715) b!934995))

(assert (= (and b!935001 res!629714) b!934990))

(assert (= (and b!934990 c!97191) b!934984))

(assert (= (and b!934990 (not c!97191)) b!934986))

(assert (= (and b!934984 res!629713) b!935003))

(assert (= (or b!934984 b!934986) bm!40666))

(assert (= (and b!934990 res!629709) b!934998))

(assert (= (and b!934998 c!97187) b!934997))

(assert (= (and b!934998 (not c!97187)) b!935004))

(assert (= (and b!934997 res!629708) b!934996))

(assert (= (or b!934997 b!935004) bm!40670))

(declare-fun b_lambda!14019 () Bool)

(assert (=> (not b_lambda!14019) (not b!934995)))

(assert (=> b!934995 t!27295))

(declare-fun b_and!28879 () Bool)

(assert (= b_and!28869 (and (=> t!27295 result!11927) b_and!28879)))

(assert (=> b!934995 m!868663))

(assert (=> b!934995 m!868661))

(assert (=> b!934995 m!868663))

(assert (=> b!934995 m!868665))

(assert (=> b!934995 m!868661))

(assert (=> b!934995 m!868641))

(assert (=> b!934995 m!868641))

(declare-fun m!868847 () Bool)

(assert (=> b!934995 m!868847))

(declare-fun m!868849 () Bool)

(assert (=> bm!40666 m!868849))

(assert (=> b!934985 m!868641))

(assert (=> b!934985 m!868641))

(declare-fun m!868851 () Bool)

(assert (=> b!934985 m!868851))

(declare-fun m!868853 () Bool)

(assert (=> b!934996 m!868853))

(declare-fun m!868855 () Bool)

(assert (=> b!934999 m!868855))

(assert (=> b!934988 m!868641))

(assert (=> b!934988 m!868641))

(declare-fun m!868857 () Bool)

(assert (=> b!934988 m!868857))

(declare-fun m!868859 () Bool)

(assert (=> bm!40670 m!868859))

(declare-fun m!868861 () Bool)

(assert (=> b!934992 m!868861))

(declare-fun m!868863 () Bool)

(assert (=> b!934992 m!868863))

(declare-fun m!868865 () Bool)

(assert (=> b!934992 m!868865))

(declare-fun m!868867 () Bool)

(assert (=> b!934992 m!868867))

(assert (=> b!934992 m!868861))

(declare-fun m!868869 () Bool)

(assert (=> b!934992 m!868869))

(declare-fun m!868871 () Bool)

(assert (=> b!934992 m!868871))

(declare-fun m!868873 () Bool)

(assert (=> b!934992 m!868873))

(declare-fun m!868875 () Bool)

(assert (=> b!934992 m!868875))

(declare-fun m!868877 () Bool)

(assert (=> b!934992 m!868877))

(declare-fun m!868879 () Bool)

(assert (=> b!934992 m!868879))

(assert (=> b!934992 m!868875))

(declare-fun m!868881 () Bool)

(assert (=> b!934992 m!868881))

(declare-fun m!868883 () Bool)

(assert (=> b!934992 m!868883))

(assert (=> b!934992 m!868871))

(assert (=> b!934992 m!868883))

(declare-fun m!868885 () Bool)

(assert (=> b!934992 m!868885))

(declare-fun m!868887 () Bool)

(assert (=> b!934992 m!868887))

(declare-fun m!868889 () Bool)

(assert (=> b!934992 m!868889))

(declare-fun m!868891 () Bool)

(assert (=> b!934992 m!868891))

(assert (=> b!934992 m!868641))

(declare-fun m!868893 () Bool)

(assert (=> b!935003 m!868893))

(assert (=> d!113011 m!868647))

(declare-fun m!868895 () Bool)

(assert (=> bm!40671 m!868895))

(assert (=> bm!40672 m!868869))

(assert (=> b!934993 m!868641))

(assert (=> b!934993 m!868641))

(assert (=> b!934993 m!868857))

(assert (=> b!934769 d!113011))

(declare-fun b!935005 () Bool)

(declare-fun e!525007 () Bool)

(declare-fun e!525010 () Bool)

(assert (=> b!935005 (= e!525007 e!525010)))

(declare-fun res!629722 () Bool)

(declare-fun call!40676 () Bool)

(assert (=> b!935005 (= res!629722 call!40676)))

(assert (=> b!935005 (=> (not res!629722) (not e!525010))))

(declare-fun b!935006 () Bool)

(declare-fun e!525012 () Bool)

(declare-fun e!525003 () Bool)

(assert (=> b!935006 (= e!525012 e!525003)))

(declare-fun res!629724 () Bool)

(assert (=> b!935006 (=> (not res!629724) (not e!525003))))

(declare-fun lt!421238 () ListLongMap!12041)

(assert (=> b!935006 (= res!629724 (contains!5036 lt!421238 (select (arr!27062 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(assert (=> b!935006 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27523 _keys!1487)))))

(declare-fun b!935007 () Bool)

(assert (=> b!935007 (= e!525007 (not call!40676))))

(declare-fun bm!40673 () Bool)

(assert (=> bm!40673 (= call!40676 (contains!5036 lt!421238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40674 () Bool)

(declare-fun call!40682 () ListLongMap!12041)

(declare-fun call!40681 () ListLongMap!12041)

(assert (=> bm!40674 (= call!40682 call!40681)))

(declare-fun b!935008 () Bool)

(declare-fun c!97194 () Bool)

(assert (=> b!935008 (= c!97194 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525002 () ListLongMap!12041)

(declare-fun e!525004 () ListLongMap!12041)

(assert (=> b!935008 (= e!525002 e!525004)))

(declare-fun b!935009 () Bool)

(declare-fun e!525009 () Bool)

(assert (=> b!935009 (= e!525009 (validKeyInArray!0 (select (arr!27062 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun b!935010 () Bool)

(declare-fun e!525011 () ListLongMap!12041)

(assert (=> b!935010 (= e!525011 e!525002)))

(declare-fun c!97195 () Bool)

(assert (=> b!935010 (= c!97195 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40675 () Bool)

(declare-fun call!40678 () ListLongMap!12041)

(declare-fun call!40680 () ListLongMap!12041)

(assert (=> bm!40675 (= call!40678 call!40680)))

(declare-fun b!935011 () Bool)

(declare-fun res!629718 () Bool)

(declare-fun e!525014 () Bool)

(assert (=> b!935011 (=> (not res!629718) (not e!525014))))

(assert (=> b!935011 (= res!629718 e!525007)))

(declare-fun c!97197 () Bool)

(assert (=> b!935011 (= c!97197 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!935012 () Bool)

(assert (=> b!935012 (= e!525004 call!40678)))

(declare-fun b!935013 () Bool)

(declare-fun e!525006 () Unit!31452)

(declare-fun lt!421247 () Unit!31452)

(assert (=> b!935013 (= e!525006 lt!421247)))

(declare-fun lt!421240 () ListLongMap!12041)

(assert (=> b!935013 (= lt!421240 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421235 () (_ BitVec 64))

(assert (=> b!935013 (= lt!421235 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421245 () (_ BitVec 64))

(assert (=> b!935013 (= lt!421245 (select (arr!27062 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421239 () Unit!31452)

(assert (=> b!935013 (= lt!421239 (addStillContains!525 lt!421240 lt!421235 zeroValue!1173 lt!421245))))

(assert (=> b!935013 (contains!5036 (+!2836 lt!421240 (tuple2!13355 lt!421235 zeroValue!1173)) lt!421245)))

(declare-fun lt!421246 () Unit!31452)

(assert (=> b!935013 (= lt!421246 lt!421239)))

(declare-fun lt!421254 () ListLongMap!12041)

(assert (=> b!935013 (= lt!421254 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421237 () (_ BitVec 64))

(assert (=> b!935013 (= lt!421237 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421255 () (_ BitVec 64))

(assert (=> b!935013 (= lt!421255 (select (arr!27062 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421252 () Unit!31452)

(assert (=> b!935013 (= lt!421252 (addApplyDifferent!415 lt!421254 lt!421237 minValue!1173 lt!421255))))

(assert (=> b!935013 (= (apply!816 (+!2836 lt!421254 (tuple2!13355 lt!421237 minValue!1173)) lt!421255) (apply!816 lt!421254 lt!421255))))

(declare-fun lt!421248 () Unit!31452)

(assert (=> b!935013 (= lt!421248 lt!421252)))

(declare-fun lt!421253 () ListLongMap!12041)

(assert (=> b!935013 (= lt!421253 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421249 () (_ BitVec 64))

(assert (=> b!935013 (= lt!421249 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421236 () (_ BitVec 64))

(assert (=> b!935013 (= lt!421236 (select (arr!27062 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun lt!421234 () Unit!31452)

(assert (=> b!935013 (= lt!421234 (addApplyDifferent!415 lt!421253 lt!421249 zeroValue!1173 lt!421236))))

(assert (=> b!935013 (= (apply!816 (+!2836 lt!421253 (tuple2!13355 lt!421249 zeroValue!1173)) lt!421236) (apply!816 lt!421253 lt!421236))))

(declare-fun lt!421242 () Unit!31452)

(assert (=> b!935013 (= lt!421242 lt!421234)))

(declare-fun lt!421243 () ListLongMap!12041)

(assert (=> b!935013 (= lt!421243 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun lt!421251 () (_ BitVec 64))

(assert (=> b!935013 (= lt!421251 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421241 () (_ BitVec 64))

(assert (=> b!935013 (= lt!421241 (select (arr!27062 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))))))

(assert (=> b!935013 (= lt!421247 (addApplyDifferent!415 lt!421243 lt!421251 minValue!1173 lt!421241))))

(assert (=> b!935013 (= (apply!816 (+!2836 lt!421243 (tuple2!13355 lt!421251 minValue!1173)) lt!421241) (apply!816 lt!421243 lt!421241))))

(declare-fun b!935014 () Bool)

(declare-fun e!525013 () Bool)

(assert (=> b!935014 (= e!525013 (validKeyInArray!0 (select (arr!27062 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))))))

(declare-fun bm!40676 () Bool)

(declare-fun call!40677 () ListLongMap!12041)

(assert (=> bm!40676 (= call!40677 call!40682)))

(declare-fun b!935015 () Bool)

(assert (=> b!935015 (= e!525004 call!40677)))

(declare-fun b!935016 () Bool)

(assert (=> b!935016 (= e!525003 (= (apply!816 lt!421238 (select (arr!27062 _keys!1487) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)))) (get!14260 (select (arr!27063 _values!1231) (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001))) (dynLambda!1592 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935016 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27524 _values!1231)))))

(assert (=> b!935016 (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27523 _keys!1487)))))

(declare-fun b!935017 () Bool)

(declare-fun e!525008 () Bool)

(assert (=> b!935017 (= e!525008 (= (apply!816 lt!421238 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40677 () Bool)

(declare-fun call!40679 () Bool)

(assert (=> bm!40677 (= call!40679 (contains!5036 lt!421238 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935018 () Bool)

(declare-fun e!525005 () Bool)

(assert (=> b!935018 (= e!525005 e!525008)))

(declare-fun res!629717 () Bool)

(assert (=> b!935018 (= res!629717 call!40679)))

(assert (=> b!935018 (=> (not res!629717) (not e!525008))))

(declare-fun b!935019 () Bool)

(assert (=> b!935019 (= e!525014 e!525005)))

(declare-fun c!97193 () Bool)

(assert (=> b!935019 (= c!97193 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935020 () Bool)

(assert (=> b!935020 (= e!525011 (+!2836 call!40680 (tuple2!13355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935021 () Bool)

(declare-fun Unit!31459 () Unit!31452)

(assert (=> b!935021 (= e!525006 Unit!31459)))

(declare-fun bm!40678 () Bool)

(declare-fun c!97196 () Bool)

(assert (=> bm!40678 (= call!40680 (+!2836 (ite c!97196 call!40681 (ite c!97195 call!40682 call!40677)) (ite (or c!97196 c!97195) (tuple2!13355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935022 () Bool)

(declare-fun res!629723 () Bool)

(assert (=> b!935022 (=> (not res!629723) (not e!525014))))

(assert (=> b!935022 (= res!629723 e!525012)))

(declare-fun res!629720 () Bool)

(assert (=> b!935022 (=> res!629720 e!525012)))

(assert (=> b!935022 (= res!629720 (not e!525013))))

(declare-fun res!629719 () Bool)

(assert (=> b!935022 (=> (not res!629719) (not e!525013))))

(assert (=> b!935022 (= res!629719 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27523 _keys!1487)))))

(declare-fun b!935023 () Bool)

(assert (=> b!935023 (= e!525002 call!40678)))

(declare-fun b!935024 () Bool)

(assert (=> b!935024 (= e!525010 (= (apply!816 lt!421238 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40679 () Bool)

(assert (=> bm!40679 (= call!40681 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235))))

(declare-fun d!113013 () Bool)

(assert (=> d!113013 e!525014))

(declare-fun res!629725 () Bool)

(assert (=> d!113013 (=> (not res!629725) (not e!525014))))

(assert (=> d!113013 (= res!629725 (or (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27523 _keys!1487)) (and (bvsge (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27523 _keys!1487)))))))

(declare-fun lt!421250 () ListLongMap!12041)

(assert (=> d!113013 (= lt!421238 lt!421250)))

(declare-fun lt!421244 () Unit!31452)

(assert (=> d!113013 (= lt!421244 e!525006)))

(declare-fun c!97192 () Bool)

(assert (=> d!113013 (= c!97192 e!525009)))

(declare-fun res!629721 () Bool)

(assert (=> d!113013 (=> (not res!629721) (not e!525009))))

(assert (=> d!113013 (= res!629721 (bvslt (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) (size!27523 _keys!1487)))))

(assert (=> d!113013 (= lt!421250 e!525011)))

(assert (=> d!113013 (= c!97196 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113013 (validMask!0 mask!1881)))

(assert (=> d!113013 (= (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421238)))

(declare-fun b!935025 () Bool)

(assert (=> b!935025 (= e!525005 (not call!40679))))

(assert (= (and d!113013 c!97196) b!935020))

(assert (= (and d!113013 (not c!97196)) b!935010))

(assert (= (and b!935010 c!97195) b!935023))

(assert (= (and b!935010 (not c!97195)) b!935008))

(assert (= (and b!935008 c!97194) b!935012))

(assert (= (and b!935008 (not c!97194)) b!935015))

(assert (= (or b!935012 b!935015) bm!40676))

(assert (= (or b!935023 bm!40676) bm!40674))

(assert (= (or b!935023 b!935012) bm!40675))

(assert (= (or b!935020 bm!40674) bm!40679))

(assert (= (or b!935020 bm!40675) bm!40678))

(assert (= (and d!113013 res!629721) b!935009))

(assert (= (and d!113013 c!97192) b!935013))

(assert (= (and d!113013 (not c!97192)) b!935021))

(assert (= (and d!113013 res!629725) b!935022))

(assert (= (and b!935022 res!629719) b!935014))

(assert (= (and b!935022 (not res!629720)) b!935006))

(assert (= (and b!935006 res!629724) b!935016))

(assert (= (and b!935022 res!629723) b!935011))

(assert (= (and b!935011 c!97197) b!935005))

(assert (= (and b!935011 (not c!97197)) b!935007))

(assert (= (and b!935005 res!629722) b!935024))

(assert (= (or b!935005 b!935007) bm!40673))

(assert (= (and b!935011 res!629718) b!935019))

(assert (= (and b!935019 c!97193) b!935018))

(assert (= (and b!935019 (not c!97193)) b!935025))

(assert (= (and b!935018 res!629717) b!935017))

(assert (= (or b!935018 b!935025) bm!40677))

(declare-fun b_lambda!14021 () Bool)

(assert (=> (not b_lambda!14021) (not b!935016)))

(assert (=> b!935016 t!27295))

(declare-fun b_and!28881 () Bool)

(assert (= b_and!28879 (and (=> t!27295 result!11927) b_and!28881)))

(assert (=> b!935016 m!868663))

(declare-fun m!868897 () Bool)

(assert (=> b!935016 m!868897))

(assert (=> b!935016 m!868663))

(declare-fun m!868899 () Bool)

(assert (=> b!935016 m!868899))

(assert (=> b!935016 m!868897))

(declare-fun m!868901 () Bool)

(assert (=> b!935016 m!868901))

(assert (=> b!935016 m!868901))

(declare-fun m!868903 () Bool)

(assert (=> b!935016 m!868903))

(declare-fun m!868905 () Bool)

(assert (=> bm!40673 m!868905))

(assert (=> b!935006 m!868901))

(assert (=> b!935006 m!868901))

(declare-fun m!868907 () Bool)

(assert (=> b!935006 m!868907))

(declare-fun m!868909 () Bool)

(assert (=> b!935017 m!868909))

(declare-fun m!868911 () Bool)

(assert (=> b!935020 m!868911))

(assert (=> b!935009 m!868901))

(assert (=> b!935009 m!868901))

(declare-fun m!868913 () Bool)

(assert (=> b!935009 m!868913))

(declare-fun m!868915 () Bool)

(assert (=> bm!40677 m!868915))

(declare-fun m!868917 () Bool)

(assert (=> b!935013 m!868917))

(declare-fun m!868919 () Bool)

(assert (=> b!935013 m!868919))

(declare-fun m!868921 () Bool)

(assert (=> b!935013 m!868921))

(declare-fun m!868923 () Bool)

(assert (=> b!935013 m!868923))

(assert (=> b!935013 m!868917))

(declare-fun m!868925 () Bool)

(assert (=> b!935013 m!868925))

(declare-fun m!868927 () Bool)

(assert (=> b!935013 m!868927))

(declare-fun m!868929 () Bool)

(assert (=> b!935013 m!868929))

(declare-fun m!868931 () Bool)

(assert (=> b!935013 m!868931))

(declare-fun m!868933 () Bool)

(assert (=> b!935013 m!868933))

(declare-fun m!868935 () Bool)

(assert (=> b!935013 m!868935))

(assert (=> b!935013 m!868931))

(declare-fun m!868937 () Bool)

(assert (=> b!935013 m!868937))

(declare-fun m!868939 () Bool)

(assert (=> b!935013 m!868939))

(assert (=> b!935013 m!868927))

(assert (=> b!935013 m!868939))

(declare-fun m!868941 () Bool)

(assert (=> b!935013 m!868941))

(declare-fun m!868943 () Bool)

(assert (=> b!935013 m!868943))

(declare-fun m!868945 () Bool)

(assert (=> b!935013 m!868945))

(declare-fun m!868947 () Bool)

(assert (=> b!935013 m!868947))

(assert (=> b!935013 m!868901))

(declare-fun m!868949 () Bool)

(assert (=> b!935024 m!868949))

(assert (=> d!113013 m!868647))

(declare-fun m!868951 () Bool)

(assert (=> bm!40678 m!868951))

(assert (=> bm!40679 m!868925))

(assert (=> b!935014 m!868901))

(assert (=> b!935014 m!868901))

(assert (=> b!935014 m!868913))

(assert (=> b!934769 d!113013))

(declare-fun d!113015 () Bool)

(declare-fun e!525015 () Bool)

(assert (=> d!113015 e!525015))

(declare-fun res!629726 () Bool)

(assert (=> d!113015 (=> (not res!629726) (not e!525015))))

(declare-fun lt!421256 () ListLongMap!12041)

(assert (=> d!113015 (= res!629726 (contains!5036 lt!421256 (_1!6688 lt!421091)))))

(declare-fun lt!421258 () List!19103)

(assert (=> d!113015 (= lt!421256 (ListLongMap!12042 lt!421258))))

(declare-fun lt!421257 () Unit!31452)

(declare-fun lt!421259 () Unit!31452)

(assert (=> d!113015 (= lt!421257 lt!421259)))

(assert (=> d!113015 (= (getValueByKey!484 lt!421258 (_1!6688 lt!421091)) (Some!489 (_2!6688 lt!421091)))))

(assert (=> d!113015 (= lt!421259 (lemmaContainsTupThenGetReturnValue!258 lt!421258 (_1!6688 lt!421091) (_2!6688 lt!421091)))))

(assert (=> d!113015 (= lt!421258 (insertStrictlySorted!315 (toList!6036 lt!421088) (_1!6688 lt!421091) (_2!6688 lt!421091)))))

(assert (=> d!113015 (= (+!2836 lt!421088 lt!421091) lt!421256)))

(declare-fun b!935026 () Bool)

(declare-fun res!629727 () Bool)

(assert (=> b!935026 (=> (not res!629727) (not e!525015))))

(assert (=> b!935026 (= res!629727 (= (getValueByKey!484 (toList!6036 lt!421256) (_1!6688 lt!421091)) (Some!489 (_2!6688 lt!421091))))))

(declare-fun b!935027 () Bool)

(assert (=> b!935027 (= e!525015 (contains!5041 (toList!6036 lt!421256) lt!421091))))

(assert (= (and d!113015 res!629726) b!935026))

(assert (= (and b!935026 res!629727) b!935027))

(declare-fun m!868953 () Bool)

(assert (=> d!113015 m!868953))

(declare-fun m!868955 () Bool)

(assert (=> d!113015 m!868955))

(declare-fun m!868957 () Bool)

(assert (=> d!113015 m!868957))

(declare-fun m!868959 () Bool)

(assert (=> d!113015 m!868959))

(declare-fun m!868961 () Bool)

(assert (=> b!935026 m!868961))

(declare-fun m!868963 () Bool)

(assert (=> b!935027 m!868963))

(assert (=> b!934769 d!113015))

(declare-fun d!113017 () Bool)

(assert (=> d!113017 (contains!5036 (+!2836 lt!421088 (tuple2!13355 lt!421089 lt!421093)) k0!1099)))

(declare-fun lt!421262 () Unit!31452)

(declare-fun choose!1556 (ListLongMap!12041 (_ BitVec 64) V!31855 (_ BitVec 64)) Unit!31452)

(assert (=> d!113017 (= lt!421262 (choose!1556 lt!421088 lt!421089 lt!421093 k0!1099))))

(assert (=> d!113017 (contains!5036 lt!421088 k0!1099)))

(assert (=> d!113017 (= (addStillContains!525 lt!421088 lt!421089 lt!421093 k0!1099) lt!421262)))

(declare-fun bs!26219 () Bool)

(assert (= bs!26219 d!113017))

(declare-fun m!868965 () Bool)

(assert (=> bs!26219 m!868965))

(assert (=> bs!26219 m!868965))

(declare-fun m!868967 () Bool)

(assert (=> bs!26219 m!868967))

(declare-fun m!868969 () Bool)

(assert (=> bs!26219 m!868969))

(assert (=> bs!26219 m!868681))

(assert (=> b!934769 d!113017))

(declare-fun d!113019 () Bool)

(declare-fun e!525018 () Bool)

(assert (=> d!113019 e!525018))

(declare-fun res!629730 () Bool)

(assert (=> d!113019 (=> (not res!629730) (not e!525018))))

(assert (=> d!113019 (= res!629730 (and (bvsge (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27523 _keys!1487)) (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27524 _values!1231))))))

(declare-fun lt!421265 () Unit!31452)

(declare-fun choose!1557 (array!56239 array!56241 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 32) Int) Unit!31452)

(assert (=> d!113019 (= lt!421265 (choose!1557 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> d!113019 (validMask!0 mask!1881)))

(assert (=> d!113019 (= (lemmaListMapRecursiveValidKeyArray!200 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) lt!421265)))

(declare-fun b!935031 () Bool)

(assert (=> b!935031 (= e!525018 (= (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2836 (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1235) (tuple2!13355 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) (get!14260 (select (arr!27063 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1592 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!113019 res!629730) b!935031))

(declare-fun b_lambda!14023 () Bool)

(assert (=> (not b_lambda!14023) (not b!935031)))

(assert (=> b!935031 t!27295))

(declare-fun b_and!28883 () Bool)

(assert (= b_and!28881 (and (=> t!27295 result!11927) b_and!28883)))

(declare-fun m!868971 () Bool)

(assert (=> d!113019 m!868971))

(assert (=> d!113019 m!868647))

(declare-fun m!868973 () Bool)

(assert (=> b!935031 m!868973))

(declare-fun m!868975 () Bool)

(assert (=> b!935031 m!868975))

(assert (=> b!935031 m!868661))

(assert (=> b!935031 m!868663))

(assert (=> b!935031 m!868641))

(assert (=> b!935031 m!868973))

(assert (=> b!935031 m!868661))

(assert (=> b!935031 m!868663))

(assert (=> b!935031 m!868665))

(assert (=> b!935031 m!868667))

(assert (=> b!934769 d!113019))

(declare-fun b!935032 () Bool)

(declare-fun e!525019 () Bool)

(declare-fun e!525021 () Bool)

(assert (=> b!935032 (= e!525019 e!525021)))

(declare-fun c!97198 () Bool)

(assert (=> b!935032 (= c!97198 (validKeyInArray!0 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935033 () Bool)

(declare-fun call!40683 () Bool)

(assert (=> b!935033 (= e!525021 call!40683)))

(declare-fun b!935034 () Bool)

(declare-fun e!525022 () Bool)

(assert (=> b!935034 (= e!525022 (contains!5035 Nil!19099 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun b!935035 () Bool)

(assert (=> b!935035 (= e!525021 call!40683)))

(declare-fun b!935036 () Bool)

(declare-fun e!525020 () Bool)

(assert (=> b!935036 (= e!525020 e!525019)))

(declare-fun res!629733 () Bool)

(assert (=> b!935036 (=> (not res!629733) (not e!525019))))

(assert (=> b!935036 (= res!629733 (not e!525022))))

(declare-fun res!629732 () Bool)

(assert (=> b!935036 (=> (not res!629732) (not e!525022))))

(assert (=> b!935036 (= res!629732 (validKeyInArray!0 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun d!113021 () Bool)

(declare-fun res!629731 () Bool)

(assert (=> d!113021 (=> res!629731 e!525020)))

(assert (=> d!113021 (= res!629731 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27523 _keys!1487)))))

(assert (=> d!113021 (= (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19099) e!525020)))

(declare-fun bm!40680 () Bool)

(assert (=> bm!40680 (= call!40683 (arrayNoDuplicates!0 _keys!1487 (bvadd (bvsub from!1844 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (ite c!97198 (Cons!19098 (select (arr!27062 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)) Nil!19099) Nil!19099)))))

(assert (= (and d!113021 (not res!629731)) b!935036))

(assert (= (and b!935036 res!629732) b!935034))

(assert (= (and b!935036 res!629733) b!935032))

(assert (= (and b!935032 c!97198) b!935035))

(assert (= (and b!935032 (not c!97198)) b!935033))

(assert (= (or b!935035 b!935033) bm!40680))

(assert (=> b!935032 m!868641))

(assert (=> b!935032 m!868641))

(assert (=> b!935032 m!868857))

(assert (=> b!935034 m!868641))

(assert (=> b!935034 m!868641))

(declare-fun m!868977 () Bool)

(assert (=> b!935034 m!868977))

(assert (=> b!935036 m!868641))

(assert (=> b!935036 m!868641))

(assert (=> b!935036 m!868857))

(assert (=> bm!40680 m!868641))

(declare-fun m!868979 () Bool)

(assert (=> bm!40680 m!868979))

(assert (=> b!934769 d!113021))

(declare-fun d!113023 () Bool)

(declare-fun e!525025 () Bool)

(assert (=> d!113023 e!525025))

(declare-fun c!97201 () Bool)

(assert (=> d!113023 (= c!97201 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421268 () Unit!31452)

(declare-fun choose!1558 (array!56239 array!56241 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 64) (_ BitVec 32) Int) Unit!31452)

(assert (=> d!113023 (= lt!421268 (choose!1558 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> d!113023 (validMask!0 mask!1881)))

(assert (=> d!113023 (= (lemmaListMapContainsThenArrayContainsFrom!283 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235) lt!421268)))

(declare-fun b!935041 () Bool)

(assert (=> b!935041 (= e!525025 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935042 () Bool)

(assert (=> b!935042 (= e!525025 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!113023 c!97201) b!935041))

(assert (= (and d!113023 (not c!97201)) b!935042))

(declare-fun m!868981 () Bool)

(assert (=> d!113023 m!868981))

(assert (=> d!113023 m!868647))

(assert (=> b!935041 m!868637))

(assert (=> b!934769 d!113023))

(declare-fun d!113025 () Bool)

(declare-fun e!525030 () Bool)

(assert (=> d!113025 e!525030))

(declare-fun res!629736 () Bool)

(assert (=> d!113025 (=> res!629736 e!525030)))

(declare-fun lt!421278 () Bool)

(assert (=> d!113025 (= res!629736 (not lt!421278))))

(declare-fun lt!421279 () Bool)

(assert (=> d!113025 (= lt!421278 lt!421279)))

(declare-fun lt!421277 () Unit!31452)

(declare-fun e!525031 () Unit!31452)

(assert (=> d!113025 (= lt!421277 e!525031)))

(declare-fun c!97204 () Bool)

(assert (=> d!113025 (= c!97204 lt!421279)))

(declare-fun containsKey!448 (List!19103 (_ BitVec 64)) Bool)

(assert (=> d!113025 (= lt!421279 (containsKey!448 (toList!6036 (+!2836 lt!421088 lt!421091)) k0!1099))))

(assert (=> d!113025 (= (contains!5036 (+!2836 lt!421088 lt!421091) k0!1099) lt!421278)))

(declare-fun b!935049 () Bool)

(declare-fun lt!421280 () Unit!31452)

(assert (=> b!935049 (= e!525031 lt!421280)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!343 (List!19103 (_ BitVec 64)) Unit!31452)

(assert (=> b!935049 (= lt!421280 (lemmaContainsKeyImpliesGetValueByKeyDefined!343 (toList!6036 (+!2836 lt!421088 lt!421091)) k0!1099))))

(declare-fun isDefined!356 (Option!490) Bool)

(assert (=> b!935049 (isDefined!356 (getValueByKey!484 (toList!6036 (+!2836 lt!421088 lt!421091)) k0!1099))))

(declare-fun b!935050 () Bool)

(declare-fun Unit!31460 () Unit!31452)

(assert (=> b!935050 (= e!525031 Unit!31460)))

(declare-fun b!935051 () Bool)

(assert (=> b!935051 (= e!525030 (isDefined!356 (getValueByKey!484 (toList!6036 (+!2836 lt!421088 lt!421091)) k0!1099)))))

(assert (= (and d!113025 c!97204) b!935049))

(assert (= (and d!113025 (not c!97204)) b!935050))

(assert (= (and d!113025 (not res!629736)) b!935051))

(declare-fun m!868983 () Bool)

(assert (=> d!113025 m!868983))

(declare-fun m!868985 () Bool)

(assert (=> b!935049 m!868985))

(declare-fun m!868987 () Bool)

(assert (=> b!935049 m!868987))

(assert (=> b!935049 m!868987))

(declare-fun m!868989 () Bool)

(assert (=> b!935049 m!868989))

(assert (=> b!935051 m!868987))

(assert (=> b!935051 m!868987))

(assert (=> b!935051 m!868989))

(assert (=> b!934769 d!113025))

(declare-fun d!113027 () Bool)

(declare-fun c!97207 () Bool)

(assert (=> d!113027 (= c!97207 ((_ is ValueCellFull!9602) (select (arr!27063 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001))))))

(declare-fun e!525034 () V!31855)

(assert (=> d!113027 (= (get!14260 (select (arr!27063 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1592 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)) e!525034)))

(declare-fun b!935056 () Bool)

(declare-fun get!14264 (ValueCell!9602 V!31855) V!31855)

(assert (=> b!935056 (= e!525034 (get!14264 (select (arr!27063 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1592 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!935057 () Bool)

(declare-fun get!14265 (ValueCell!9602 V!31855) V!31855)

(assert (=> b!935057 (= e!525034 (get!14265 (select (arr!27063 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1592 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!113027 c!97207) b!935056))

(assert (= (and d!113027 (not c!97207)) b!935057))

(assert (=> b!935056 m!868661))

(assert (=> b!935056 m!868663))

(declare-fun m!868991 () Bool)

(assert (=> b!935056 m!868991))

(assert (=> b!935057 m!868661))

(assert (=> b!935057 m!868663))

(declare-fun m!868993 () Bool)

(assert (=> b!935057 m!868993))

(assert (=> b!934769 d!113027))

(declare-fun d!113029 () Bool)

(assert (=> d!113029 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19099)))

(declare-fun lt!421283 () Unit!31452)

(declare-fun choose!39 (array!56239 (_ BitVec 32) (_ BitVec 32)) Unit!31452)

(assert (=> d!113029 (= lt!421283 (choose!39 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> d!113029 (bvslt (size!27523 _keys!1487) #b01111111111111111111111111111111)))

(assert (=> d!113029 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)) lt!421283)))

(declare-fun bs!26220 () Bool)

(assert (= bs!26220 d!113029))

(assert (=> bs!26220 m!868669))

(declare-fun m!868995 () Bool)

(assert (=> bs!26220 m!868995))

(assert (=> b!934769 d!113029))

(declare-fun d!113031 () Bool)

(declare-fun e!525035 () Bool)

(assert (=> d!113031 e!525035))

(declare-fun res!629737 () Bool)

(assert (=> d!113031 (=> res!629737 e!525035)))

(declare-fun lt!421285 () Bool)

(assert (=> d!113031 (= res!629737 (not lt!421285))))

(declare-fun lt!421286 () Bool)

(assert (=> d!113031 (= lt!421285 lt!421286)))

(declare-fun lt!421284 () Unit!31452)

(declare-fun e!525036 () Unit!31452)

(assert (=> d!113031 (= lt!421284 e!525036)))

(declare-fun c!97208 () Bool)

(assert (=> d!113031 (= c!97208 lt!421286)))

(assert (=> d!113031 (= lt!421286 (containsKey!448 (toList!6036 lt!421088) k0!1099))))

(assert (=> d!113031 (= (contains!5036 lt!421088 k0!1099) lt!421285)))

(declare-fun b!935058 () Bool)

(declare-fun lt!421287 () Unit!31452)

(assert (=> b!935058 (= e!525036 lt!421287)))

(assert (=> b!935058 (= lt!421287 (lemmaContainsKeyImpliesGetValueByKeyDefined!343 (toList!6036 lt!421088) k0!1099))))

(assert (=> b!935058 (isDefined!356 (getValueByKey!484 (toList!6036 lt!421088) k0!1099))))

(declare-fun b!935059 () Bool)

(declare-fun Unit!31461 () Unit!31452)

(assert (=> b!935059 (= e!525036 Unit!31461)))

(declare-fun b!935060 () Bool)

(assert (=> b!935060 (= e!525035 (isDefined!356 (getValueByKey!484 (toList!6036 lt!421088) k0!1099)))))

(assert (= (and d!113031 c!97208) b!935058))

(assert (= (and d!113031 (not c!97208)) b!935059))

(assert (= (and d!113031 (not res!629737)) b!935060))

(declare-fun m!868997 () Bool)

(assert (=> d!113031 m!868997))

(declare-fun m!868999 () Bool)

(assert (=> b!935058 m!868999))

(assert (=> b!935058 m!868831))

(assert (=> b!935058 m!868831))

(declare-fun m!869001 () Bool)

(assert (=> b!935058 m!869001))

(assert (=> b!935060 m!868831))

(assert (=> b!935060 m!868831))

(assert (=> b!935060 m!869001))

(assert (=> b!934779 d!113031))

(declare-fun b!935061 () Bool)

(declare-fun e!525042 () Bool)

(declare-fun e!525045 () Bool)

(assert (=> b!935061 (= e!525042 e!525045)))

(declare-fun res!629743 () Bool)

(declare-fun call!40684 () Bool)

(assert (=> b!935061 (= res!629743 call!40684)))

(assert (=> b!935061 (=> (not res!629743) (not e!525045))))

(declare-fun b!935062 () Bool)

(declare-fun e!525047 () Bool)

(declare-fun e!525038 () Bool)

(assert (=> b!935062 (= e!525047 e!525038)))

(declare-fun res!629745 () Bool)

(assert (=> b!935062 (=> (not res!629745) (not e!525038))))

(declare-fun lt!421292 () ListLongMap!12041)

(assert (=> b!935062 (= res!629745 (contains!5036 lt!421292 (select (arr!27062 _keys!1487) from!1844)))))

(assert (=> b!935062 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27523 _keys!1487)))))

(declare-fun b!935063 () Bool)

(assert (=> b!935063 (= e!525042 (not call!40684))))

(declare-fun bm!40681 () Bool)

(assert (=> bm!40681 (= call!40684 (contains!5036 lt!421292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40682 () Bool)

(declare-fun call!40690 () ListLongMap!12041)

(declare-fun call!40689 () ListLongMap!12041)

(assert (=> bm!40682 (= call!40690 call!40689)))

(declare-fun b!935064 () Bool)

(declare-fun c!97211 () Bool)

(assert (=> b!935064 (= c!97211 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!525037 () ListLongMap!12041)

(declare-fun e!525039 () ListLongMap!12041)

(assert (=> b!935064 (= e!525037 e!525039)))

(declare-fun b!935065 () Bool)

(declare-fun e!525044 () Bool)

(assert (=> b!935065 (= e!525044 (validKeyInArray!0 (select (arr!27062 _keys!1487) from!1844)))))

(declare-fun b!935066 () Bool)

(declare-fun e!525046 () ListLongMap!12041)

(assert (=> b!935066 (= e!525046 e!525037)))

(declare-fun c!97212 () Bool)

(assert (=> b!935066 (= c!97212 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40683 () Bool)

(declare-fun call!40686 () ListLongMap!12041)

(declare-fun call!40688 () ListLongMap!12041)

(assert (=> bm!40683 (= call!40686 call!40688)))

(declare-fun b!935067 () Bool)

(declare-fun res!629739 () Bool)

(declare-fun e!525049 () Bool)

(assert (=> b!935067 (=> (not res!629739) (not e!525049))))

(assert (=> b!935067 (= res!629739 e!525042)))

(declare-fun c!97214 () Bool)

(assert (=> b!935067 (= c!97214 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!935068 () Bool)

(assert (=> b!935068 (= e!525039 call!40686)))

(declare-fun b!935069 () Bool)

(declare-fun e!525041 () Unit!31452)

(declare-fun lt!421301 () Unit!31452)

(assert (=> b!935069 (= e!525041 lt!421301)))

(declare-fun lt!421294 () ListLongMap!12041)

(assert (=> b!935069 (= lt!421294 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421289 () (_ BitVec 64))

(assert (=> b!935069 (= lt!421289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421299 () (_ BitVec 64))

(assert (=> b!935069 (= lt!421299 (select (arr!27062 _keys!1487) from!1844))))

(declare-fun lt!421293 () Unit!31452)

(assert (=> b!935069 (= lt!421293 (addStillContains!525 lt!421294 lt!421289 zeroValue!1173 lt!421299))))

(assert (=> b!935069 (contains!5036 (+!2836 lt!421294 (tuple2!13355 lt!421289 zeroValue!1173)) lt!421299)))

(declare-fun lt!421300 () Unit!31452)

(assert (=> b!935069 (= lt!421300 lt!421293)))

(declare-fun lt!421308 () ListLongMap!12041)

(assert (=> b!935069 (= lt!421308 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421291 () (_ BitVec 64))

(assert (=> b!935069 (= lt!421291 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421309 () (_ BitVec 64))

(assert (=> b!935069 (= lt!421309 (select (arr!27062 _keys!1487) from!1844))))

(declare-fun lt!421306 () Unit!31452)

(assert (=> b!935069 (= lt!421306 (addApplyDifferent!415 lt!421308 lt!421291 minValue!1173 lt!421309))))

(assert (=> b!935069 (= (apply!816 (+!2836 lt!421308 (tuple2!13355 lt!421291 minValue!1173)) lt!421309) (apply!816 lt!421308 lt!421309))))

(declare-fun lt!421302 () Unit!31452)

(assert (=> b!935069 (= lt!421302 lt!421306)))

(declare-fun lt!421307 () ListLongMap!12041)

(assert (=> b!935069 (= lt!421307 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421303 () (_ BitVec 64))

(assert (=> b!935069 (= lt!421303 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421290 () (_ BitVec 64))

(assert (=> b!935069 (= lt!421290 (select (arr!27062 _keys!1487) from!1844))))

(declare-fun lt!421288 () Unit!31452)

(assert (=> b!935069 (= lt!421288 (addApplyDifferent!415 lt!421307 lt!421303 zeroValue!1173 lt!421290))))

(assert (=> b!935069 (= (apply!816 (+!2836 lt!421307 (tuple2!13355 lt!421303 zeroValue!1173)) lt!421290) (apply!816 lt!421307 lt!421290))))

(declare-fun lt!421296 () Unit!31452)

(assert (=> b!935069 (= lt!421296 lt!421288)))

(declare-fun lt!421297 () ListLongMap!12041)

(assert (=> b!935069 (= lt!421297 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun lt!421305 () (_ BitVec 64))

(assert (=> b!935069 (= lt!421305 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421295 () (_ BitVec 64))

(assert (=> b!935069 (= lt!421295 (select (arr!27062 _keys!1487) from!1844))))

(assert (=> b!935069 (= lt!421301 (addApplyDifferent!415 lt!421297 lt!421305 minValue!1173 lt!421295))))

(assert (=> b!935069 (= (apply!816 (+!2836 lt!421297 (tuple2!13355 lt!421305 minValue!1173)) lt!421295) (apply!816 lt!421297 lt!421295))))

(declare-fun b!935070 () Bool)

(declare-fun e!525048 () Bool)

(assert (=> b!935070 (= e!525048 (validKeyInArray!0 (select (arr!27062 _keys!1487) from!1844)))))

(declare-fun bm!40684 () Bool)

(declare-fun call!40685 () ListLongMap!12041)

(assert (=> bm!40684 (= call!40685 call!40690)))

(declare-fun b!935071 () Bool)

(assert (=> b!935071 (= e!525039 call!40685)))

(declare-fun b!935072 () Bool)

(assert (=> b!935072 (= e!525038 (= (apply!816 lt!421292 (select (arr!27062 _keys!1487) from!1844)) (get!14260 (select (arr!27063 _values!1231) from!1844) (dynLambda!1592 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!935072 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27524 _values!1231)))))

(assert (=> b!935072 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27523 _keys!1487)))))

(declare-fun b!935073 () Bool)

(declare-fun e!525043 () Bool)

(assert (=> b!935073 (= e!525043 (= (apply!816 lt!421292 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1173))))

(declare-fun bm!40685 () Bool)

(declare-fun call!40687 () Bool)

(assert (=> bm!40685 (= call!40687 (contains!5036 lt!421292 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935074 () Bool)

(declare-fun e!525040 () Bool)

(assert (=> b!935074 (= e!525040 e!525043)))

(declare-fun res!629738 () Bool)

(assert (=> b!935074 (= res!629738 call!40687)))

(assert (=> b!935074 (=> (not res!629738) (not e!525043))))

(declare-fun b!935075 () Bool)

(assert (=> b!935075 (= e!525049 e!525040)))

(declare-fun c!97210 () Bool)

(assert (=> b!935075 (= c!97210 (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!935076 () Bool)

(assert (=> b!935076 (= e!525046 (+!2836 call!40688 (tuple2!13355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173)))))

(declare-fun b!935077 () Bool)

(declare-fun Unit!31462 () Unit!31452)

(assert (=> b!935077 (= e!525041 Unit!31462)))

(declare-fun bm!40686 () Bool)

(declare-fun c!97213 () Bool)

(assert (=> bm!40686 (= call!40688 (+!2836 (ite c!97213 call!40689 (ite c!97212 call!40690 call!40685)) (ite (or c!97213 c!97212) (tuple2!13355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1173) (tuple2!13355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1173))))))

(declare-fun b!935078 () Bool)

(declare-fun res!629744 () Bool)

(assert (=> b!935078 (=> (not res!629744) (not e!525049))))

(assert (=> b!935078 (= res!629744 e!525047)))

(declare-fun res!629741 () Bool)

(assert (=> b!935078 (=> res!629741 e!525047)))

(assert (=> b!935078 (= res!629741 (not e!525048))))

(declare-fun res!629740 () Bool)

(assert (=> b!935078 (=> (not res!629740) (not e!525048))))

(assert (=> b!935078 (= res!629740 (bvslt from!1844 (size!27523 _keys!1487)))))

(declare-fun b!935079 () Bool)

(assert (=> b!935079 (= e!525037 call!40686)))

(declare-fun b!935080 () Bool)

(assert (=> b!935080 (= e!525045 (= (apply!816 lt!421292 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1173))))

(declare-fun bm!40687 () Bool)

(assert (=> bm!40687 (= call!40689 (getCurrentListMapNoExtraKeys!3337 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun d!113033 () Bool)

(assert (=> d!113033 e!525049))

(declare-fun res!629746 () Bool)

(assert (=> d!113033 (=> (not res!629746) (not e!525049))))

(assert (=> d!113033 (= res!629746 (or (bvsge from!1844 (size!27523 _keys!1487)) (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27523 _keys!1487)))))))

(declare-fun lt!421304 () ListLongMap!12041)

(assert (=> d!113033 (= lt!421292 lt!421304)))

(declare-fun lt!421298 () Unit!31452)

(assert (=> d!113033 (= lt!421298 e!525041)))

(declare-fun c!97209 () Bool)

(assert (=> d!113033 (= c!97209 e!525044)))

(declare-fun res!629742 () Bool)

(assert (=> d!113033 (=> (not res!629742) (not e!525044))))

(assert (=> d!113033 (= res!629742 (bvslt from!1844 (size!27523 _keys!1487)))))

(assert (=> d!113033 (= lt!421304 e!525046)))

(assert (=> d!113033 (= c!97213 (and (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!113033 (validMask!0 mask!1881)))

(assert (=> d!113033 (= (getCurrentListMap!3206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) lt!421292)))

(declare-fun b!935081 () Bool)

(assert (=> b!935081 (= e!525040 (not call!40687))))

(assert (= (and d!113033 c!97213) b!935076))

(assert (= (and d!113033 (not c!97213)) b!935066))

(assert (= (and b!935066 c!97212) b!935079))

(assert (= (and b!935066 (not c!97212)) b!935064))

(assert (= (and b!935064 c!97211) b!935068))

(assert (= (and b!935064 (not c!97211)) b!935071))

(assert (= (or b!935068 b!935071) bm!40684))

(assert (= (or b!935079 bm!40684) bm!40682))

(assert (= (or b!935079 b!935068) bm!40683))

(assert (= (or b!935076 bm!40682) bm!40687))

(assert (= (or b!935076 bm!40683) bm!40686))

(assert (= (and d!113033 res!629742) b!935065))

(assert (= (and d!113033 c!97209) b!935069))

(assert (= (and d!113033 (not c!97209)) b!935077))

(assert (= (and d!113033 res!629746) b!935078))

(assert (= (and b!935078 res!629740) b!935070))

(assert (= (and b!935078 (not res!629741)) b!935062))

(assert (= (and b!935062 res!629745) b!935072))

(assert (= (and b!935078 res!629744) b!935067))

(assert (= (and b!935067 c!97214) b!935061))

(assert (= (and b!935067 (not c!97214)) b!935063))

(assert (= (and b!935061 res!629743) b!935080))

(assert (= (or b!935061 b!935063) bm!40681))

(assert (= (and b!935067 res!629739) b!935075))

(assert (= (and b!935075 c!97210) b!935074))

(assert (= (and b!935075 (not c!97210)) b!935081))

(assert (= (and b!935074 res!629738) b!935073))

(assert (= (or b!935074 b!935081) bm!40685))

(declare-fun b_lambda!14025 () Bool)

(assert (=> (not b_lambda!14025) (not b!935072)))

(assert (=> b!935072 t!27295))

(declare-fun b_and!28885 () Bool)

(assert (= b_and!28883 (and (=> t!27295 result!11927) b_and!28885)))

(assert (=> b!935072 m!868663))

(declare-fun m!869003 () Bool)

(assert (=> b!935072 m!869003))

(assert (=> b!935072 m!868663))

(declare-fun m!869005 () Bool)

(assert (=> b!935072 m!869005))

(assert (=> b!935072 m!869003))

(declare-fun m!869007 () Bool)

(assert (=> b!935072 m!869007))

(assert (=> b!935072 m!869007))

(declare-fun m!869009 () Bool)

(assert (=> b!935072 m!869009))

(declare-fun m!869011 () Bool)

(assert (=> bm!40681 m!869011))

(assert (=> b!935062 m!869007))

(assert (=> b!935062 m!869007))

(declare-fun m!869013 () Bool)

(assert (=> b!935062 m!869013))

(declare-fun m!869015 () Bool)

(assert (=> b!935073 m!869015))

(declare-fun m!869017 () Bool)

(assert (=> b!935076 m!869017))

(assert (=> b!935065 m!869007))

(assert (=> b!935065 m!869007))

(declare-fun m!869019 () Bool)

(assert (=> b!935065 m!869019))

(declare-fun m!869021 () Bool)

(assert (=> bm!40685 m!869021))

(declare-fun m!869023 () Bool)

(assert (=> b!935069 m!869023))

(declare-fun m!869025 () Bool)

(assert (=> b!935069 m!869025))

(declare-fun m!869027 () Bool)

(assert (=> b!935069 m!869027))

(declare-fun m!869029 () Bool)

(assert (=> b!935069 m!869029))

(assert (=> b!935069 m!869023))

(declare-fun m!869031 () Bool)

(assert (=> b!935069 m!869031))

(declare-fun m!869033 () Bool)

(assert (=> b!935069 m!869033))

(declare-fun m!869035 () Bool)

(assert (=> b!935069 m!869035))

(declare-fun m!869037 () Bool)

(assert (=> b!935069 m!869037))

(declare-fun m!869039 () Bool)

(assert (=> b!935069 m!869039))

(declare-fun m!869041 () Bool)

(assert (=> b!935069 m!869041))

(assert (=> b!935069 m!869037))

(declare-fun m!869043 () Bool)

(assert (=> b!935069 m!869043))

(declare-fun m!869045 () Bool)

(assert (=> b!935069 m!869045))

(assert (=> b!935069 m!869033))

(assert (=> b!935069 m!869045))

(declare-fun m!869047 () Bool)

(assert (=> b!935069 m!869047))

(declare-fun m!869049 () Bool)

(assert (=> b!935069 m!869049))

(declare-fun m!869051 () Bool)

(assert (=> b!935069 m!869051))

(declare-fun m!869053 () Bool)

(assert (=> b!935069 m!869053))

(assert (=> b!935069 m!869007))

(declare-fun m!869055 () Bool)

(assert (=> b!935080 m!869055))

(assert (=> d!113033 m!868647))

(declare-fun m!869057 () Bool)

(assert (=> bm!40686 m!869057))

(assert (=> bm!40687 m!869031))

(assert (=> b!935070 m!869007))

(assert (=> b!935070 m!869007))

(assert (=> b!935070 m!869019))

(assert (=> b!934779 d!113033))

(declare-fun d!113035 () Bool)

(assert (=> d!113035 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!79520 d!113035))

(declare-fun d!113037 () Bool)

(assert (=> d!113037 (= (array_inv!21122 _values!1231) (bvsge (size!27524 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!79520 d!113037))

(declare-fun d!113039 () Bool)

(assert (=> d!113039 (= (array_inv!21123 _keys!1487) (bvsge (size!27523 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!79520 d!113039))

(declare-fun d!113041 () Bool)

(assert (=> d!113041 (= (validKeyInArray!0 k0!1099) (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934763 d!113041))

(declare-fun d!113043 () Bool)

(declare-fun res!629751 () Bool)

(declare-fun e!525054 () Bool)

(assert (=> d!113043 (=> res!629751 e!525054)))

(assert (=> d!113043 (= res!629751 (= (select (arr!27062 _keys!1487) from!1844) k0!1099))))

(assert (=> d!113043 (= (arrayContainsKey!0 _keys!1487 k0!1099 from!1844) e!525054)))

(declare-fun b!935086 () Bool)

(declare-fun e!525055 () Bool)

(assert (=> b!935086 (= e!525054 e!525055)))

(declare-fun res!629752 () Bool)

(assert (=> b!935086 (=> (not res!629752) (not e!525055))))

(assert (=> b!935086 (= res!629752 (bvslt (bvadd from!1844 #b00000000000000000000000000000001) (size!27523 _keys!1487)))))

(declare-fun b!935087 () Bool)

(assert (=> b!935087 (= e!525055 (arrayContainsKey!0 _keys!1487 k0!1099 (bvadd from!1844 #b00000000000000000000000000000001)))))

(assert (= (and d!113043 (not res!629751)) b!935086))

(assert (= (and b!935086 res!629752) b!935087))

(assert (=> d!113043 m!869007))

(declare-fun m!869059 () Bool)

(assert (=> b!935087 m!869059))

(assert (=> b!934764 d!113043))

(declare-fun d!113045 () Bool)

(assert (=> d!113045 (= (validKeyInArray!0 lt!421089) (and (not (= lt!421089 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!421089 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!934772 d!113045))

(declare-fun mapIsEmpty!32025 () Bool)

(declare-fun mapRes!32025 () Bool)

(assert (=> mapIsEmpty!32025 mapRes!32025))

(declare-fun condMapEmpty!32025 () Bool)

(declare-fun mapDefault!32025 () ValueCell!9602)

(assert (=> mapNonEmpty!32016 (= condMapEmpty!32025 (= mapRest!32016 ((as const (Array (_ BitVec 32) ValueCell!9602)) mapDefault!32025)))))

(declare-fun e!525061 () Bool)

(assert (=> mapNonEmpty!32016 (= tp!61427 (and e!525061 mapRes!32025))))

(declare-fun b!935094 () Bool)

(declare-fun e!525060 () Bool)

(assert (=> b!935094 (= e!525060 tp_is_empty!20167)))

(declare-fun b!935095 () Bool)

(assert (=> b!935095 (= e!525061 tp_is_empty!20167)))

(declare-fun mapNonEmpty!32025 () Bool)

(declare-fun tp!61443 () Bool)

(assert (=> mapNonEmpty!32025 (= mapRes!32025 (and tp!61443 e!525060))))

(declare-fun mapValue!32025 () ValueCell!9602)

(declare-fun mapKey!32025 () (_ BitVec 32))

(declare-fun mapRest!32025 () (Array (_ BitVec 32) ValueCell!9602))

(assert (=> mapNonEmpty!32025 (= mapRest!32016 (store mapRest!32025 mapKey!32025 mapValue!32025))))

(assert (= (and mapNonEmpty!32016 condMapEmpty!32025) mapIsEmpty!32025))

(assert (= (and mapNonEmpty!32016 (not condMapEmpty!32025)) mapNonEmpty!32025))

(assert (= (and mapNonEmpty!32025 ((_ is ValueCellFull!9602) mapValue!32025)) b!935094))

(assert (= (and mapNonEmpty!32016 ((_ is ValueCellFull!9602) mapDefault!32025)) b!935095))

(declare-fun m!869061 () Bool)

(assert (=> mapNonEmpty!32025 m!869061))

(declare-fun b_lambda!14027 () Bool)

(assert (= b_lambda!14021 (or (and start!79520 b_free!17659) b_lambda!14027)))

(declare-fun b_lambda!14029 () Bool)

(assert (= b_lambda!14023 (or (and start!79520 b_free!17659) b_lambda!14029)))

(declare-fun b_lambda!14031 () Bool)

(assert (= b_lambda!14025 (or (and start!79520 b_free!17659) b_lambda!14031)))

(declare-fun b_lambda!14033 () Bool)

(assert (= b_lambda!14019 (or (and start!79520 b_free!17659) b_lambda!14033)))

(check-sat (not b!935070) (not b!935087) (not b!934914) (not b!934935) (not bm!40670) (not bm!40678) (not b!934995) (not b_lambda!14033) tp_is_empty!20167 (not b!935031) (not bm!40677) (not mapNonEmpty!32025) (not b!935058) (not b_lambda!14017) (not b!935072) (not d!113025) (not bm!40685) (not d!113013) (not b!935041) (not b!935036) (not b!934927) (not bm!40672) (not b!935073) (not d!113019) (not b!934909) (not b!935016) (not d!113023) (not d!113009) (not b!935013) (not b!935032) (not bm!40648) (not b!935076) (not b!934993) b_and!28885 (not b!935009) (not b!934992) (not d!113015) (not d!113011) (not b!935006) (not bm!40681) (not b!935014) (not b!934988) (not b!935062) (not b!934985) (not bm!40687) (not b_next!17659) (not bm!40679) (not b!935051) (not b!934929) (not d!113033) (not b!935080) (not b!935069) (not b!934940) (not b!934941) (not bm!40673) (not d!113001) (not b!935060) (not d!112997) (not b!934934) (not d!113007) (not b!935017) (not b!935026) (not b!935027) (not b!934999) (not bm!40666) (not b!935057) (not b!935049) (not b!934925) (not b!934900) (not b!935056) (not bm!40671) (not b_lambda!14029) (not b_lambda!14031) (not b!935020) (not bm!40651) (not bm!40680) (not d!113017) (not b!934912) (not b!935065) (not b!935034) (not bm!40686) (not b!935024) (not b!934996) (not d!113031) (not d!113029) (not b_lambda!14027) (not b!935003))
(check-sat b_and!28885 (not b_next!17659))
