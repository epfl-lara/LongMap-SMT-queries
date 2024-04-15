; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84436 () Bool)

(assert start!84436)

(declare-fun b_free!20005 () Bool)

(declare-fun b_next!20005 () Bool)

(assert (=> start!84436 (= b_free!20005 (not b_next!20005))))

(declare-fun tp!69796 () Bool)

(declare-fun b_and!32051 () Bool)

(assert (=> start!84436 (= tp!69796 b_and!32051)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35945 0))(
  ( (V!35946 (val!11661 Int)) )
))
(declare-fun minValue!1220 () V!35945)

(declare-datatypes ((ValueCell!11129 0))(
  ( (ValueCellFull!11129 (v!14224 V!35945)) (EmptyCell!11129) )
))
(declare-datatypes ((array!62334 0))(
  ( (array!62335 (arr!30023 (Array (_ BitVec 32) ValueCell!11129)) (size!30504 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62334)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun e!556852 () Bool)

(declare-fun zeroValue!1220 () V!35945)

(declare-datatypes ((tuple2!14934 0))(
  ( (tuple2!14935 (_1!7478 (_ BitVec 64)) (_2!7478 V!35945)) )
))
(declare-fun lt!437809 () tuple2!14934)

(declare-fun b!987566 () Bool)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62336 0))(
  ( (array!62337 (arr!30024 (Array (_ BitVec 32) (_ BitVec 64))) (size!30505 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62336)

(declare-datatypes ((List!20822 0))(
  ( (Nil!20819) (Cons!20818 (h!21980 tuple2!14934) (t!29746 List!20822)) )
))
(declare-datatypes ((ListLongMap!13621 0))(
  ( (ListLongMap!13622 (toList!6826 List!20822)) )
))
(declare-fun getCurrentListMap!3811 (array!62336 array!62334 (_ BitVec 32) (_ BitVec 32) V!35945 V!35945 (_ BitVec 32) Int) ListLongMap!13621)

(declare-fun +!3102 (ListLongMap!13621 tuple2!14934) ListLongMap!13621)

(assert (=> b!987566 (= e!556852 (= (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3102 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!437809)))))

(declare-fun lt!437806 () ListLongMap!13621)

(declare-fun lt!437808 () tuple2!14934)

(declare-fun lt!437805 () ListLongMap!13621)

(assert (=> b!987566 (= lt!437805 (+!3102 (+!3102 lt!437806 lt!437809) lt!437808))))

(declare-datatypes ((Unit!32656 0))(
  ( (Unit!32657) )
))
(declare-fun lt!437800 () Unit!32656)

(declare-fun lt!437804 () V!35945)

(declare-fun addCommutativeForDiffKeys!698 (ListLongMap!13621 (_ BitVec 64) V!35945 (_ BitVec 64) V!35945) Unit!32656)

(assert (=> b!987566 (= lt!437800 (addCommutativeForDiffKeys!698 lt!437806 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30024 _keys!1544) from!1932) lt!437804))))

(declare-fun b!987567 () Bool)

(declare-fun res!660714 () Bool)

(declare-fun e!556851 () Bool)

(assert (=> b!987567 (=> (not res!660714) (not e!556851))))

(assert (=> b!987567 (= res!660714 (and (= (size!30504 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30505 _keys!1544) (size!30504 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987568 () Bool)

(declare-fun e!556853 () Bool)

(declare-fun tp_is_empty!23221 () Bool)

(assert (=> b!987568 (= e!556853 tp_is_empty!23221)))

(declare-fun b!987570 () Bool)

(declare-fun res!660712 () Bool)

(assert (=> b!987570 (=> (not res!660712) (not e!556851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62336 (_ BitVec 32)) Bool)

(assert (=> b!987570 (= res!660712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987571 () Bool)

(declare-fun res!660713 () Bool)

(assert (=> b!987571 (=> (not res!660713) (not e!556851))))

(declare-datatypes ((List!20823 0))(
  ( (Nil!20820) (Cons!20819 (h!21981 (_ BitVec 64)) (t!29747 List!20823)) )
))
(declare-fun arrayNoDuplicates!0 (array!62336 (_ BitVec 32) List!20823) Bool)

(assert (=> b!987571 (= res!660713 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20820))))

(declare-fun mapNonEmpty!36866 () Bool)

(declare-fun mapRes!36866 () Bool)

(declare-fun tp!69797 () Bool)

(assert (=> mapNonEmpty!36866 (= mapRes!36866 (and tp!69797 e!556853))))

(declare-fun mapKey!36866 () (_ BitVec 32))

(declare-fun mapRest!36866 () (Array (_ BitVec 32) ValueCell!11129))

(declare-fun mapValue!36866 () ValueCell!11129)

(assert (=> mapNonEmpty!36866 (= (arr!30023 _values!1278) (store mapRest!36866 mapKey!36866 mapValue!36866))))

(declare-fun b!987572 () Bool)

(declare-fun res!660716 () Bool)

(assert (=> b!987572 (=> (not res!660716) (not e!556851))))

(assert (=> b!987572 (= res!660716 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987573 () Bool)

(declare-fun e!556854 () Bool)

(assert (=> b!987573 (= e!556854 tp_is_empty!23221)))

(declare-fun b!987574 () Bool)

(assert (=> b!987574 (= e!556851 (not e!556852))))

(declare-fun res!660711 () Bool)

(assert (=> b!987574 (=> res!660711 e!556852)))

(assert (=> b!987574 (= res!660711 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30024 _keys!1544) from!1932)))))

(declare-fun lt!437802 () tuple2!14934)

(declare-fun lt!437803 () ListLongMap!13621)

(assert (=> b!987574 (= (+!3102 lt!437803 lt!437809) (+!3102 lt!437805 lt!437802))))

(declare-fun lt!437801 () ListLongMap!13621)

(assert (=> b!987574 (= lt!437805 (+!3102 lt!437801 lt!437809))))

(assert (=> b!987574 (= lt!437809 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))

(assert (=> b!987574 (= lt!437803 (+!3102 lt!437801 lt!437802))))

(assert (=> b!987574 (= lt!437802 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!437807 () Unit!32656)

(assert (=> b!987574 (= lt!437807 (addCommutativeForDiffKeys!698 lt!437801 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30024 _keys!1544) from!1932) lt!437804))))

(declare-fun get!15592 (ValueCell!11129 V!35945) V!35945)

(declare-fun dynLambda!1850 (Int (_ BitVec 64)) V!35945)

(assert (=> b!987574 (= lt!437804 (get!15592 (select (arr!30023 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!987574 (= lt!437801 (+!3102 lt!437806 lt!437808))))

(assert (=> b!987574 (= lt!437808 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3529 (array!62336 array!62334 (_ BitVec 32) (_ BitVec 32) V!35945 V!35945 (_ BitVec 32) Int) ListLongMap!13621)

(assert (=> b!987574 (= lt!437806 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36866 () Bool)

(assert (=> mapIsEmpty!36866 mapRes!36866))

(declare-fun res!660715 () Bool)

(assert (=> start!84436 (=> (not res!660715) (not e!556851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84436 (= res!660715 (validMask!0 mask!1948))))

(assert (=> start!84436 e!556851))

(assert (=> start!84436 true))

(assert (=> start!84436 tp_is_empty!23221))

(declare-fun e!556850 () Bool)

(declare-fun array_inv!23201 (array!62334) Bool)

(assert (=> start!84436 (and (array_inv!23201 _values!1278) e!556850)))

(assert (=> start!84436 tp!69796))

(declare-fun array_inv!23202 (array!62336) Bool)

(assert (=> start!84436 (array_inv!23202 _keys!1544)))

(declare-fun b!987569 () Bool)

(declare-fun res!660709 () Bool)

(assert (=> b!987569 (=> (not res!660709) (not e!556851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987569 (= res!660709 (validKeyInArray!0 (select (arr!30024 _keys!1544) from!1932)))))

(declare-fun b!987575 () Bool)

(declare-fun res!660710 () Bool)

(assert (=> b!987575 (=> (not res!660710) (not e!556851))))

(assert (=> b!987575 (= res!660710 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30505 _keys!1544))))))

(declare-fun b!987576 () Bool)

(assert (=> b!987576 (= e!556850 (and e!556854 mapRes!36866))))

(declare-fun condMapEmpty!36866 () Bool)

(declare-fun mapDefault!36866 () ValueCell!11129)

(assert (=> b!987576 (= condMapEmpty!36866 (= (arr!30023 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11129)) mapDefault!36866)))))

(assert (= (and start!84436 res!660715) b!987567))

(assert (= (and b!987567 res!660714) b!987570))

(assert (= (and b!987570 res!660712) b!987571))

(assert (= (and b!987571 res!660713) b!987575))

(assert (= (and b!987575 res!660710) b!987569))

(assert (= (and b!987569 res!660709) b!987572))

(assert (= (and b!987572 res!660716) b!987574))

(assert (= (and b!987574 (not res!660711)) b!987566))

(assert (= (and b!987576 condMapEmpty!36866) mapIsEmpty!36866))

(assert (= (and b!987576 (not condMapEmpty!36866)) mapNonEmpty!36866))

(get-info :version)

(assert (= (and mapNonEmpty!36866 ((_ is ValueCellFull!11129) mapValue!36866)) b!987568))

(assert (= (and b!987576 ((_ is ValueCellFull!11129) mapDefault!36866)) b!987573))

(assert (= start!84436 b!987576))

(declare-fun b_lambda!15019 () Bool)

(assert (=> (not b_lambda!15019) (not b!987574)))

(declare-fun t!29745 () Bool)

(declare-fun tb!6775 () Bool)

(assert (=> (and start!84436 (= defaultEntry!1281 defaultEntry!1281) t!29745) tb!6775))

(declare-fun result!13551 () Bool)

(assert (=> tb!6775 (= result!13551 tp_is_empty!23221)))

(assert (=> b!987574 t!29745))

(declare-fun b_and!32053 () Bool)

(assert (= b_and!32051 (and (=> t!29745 result!13551) b_and!32053)))

(declare-fun m!913733 () Bool)

(assert (=> b!987570 m!913733))

(declare-fun m!913735 () Bool)

(assert (=> b!987571 m!913735))

(declare-fun m!913737 () Bool)

(assert (=> b!987574 m!913737))

(declare-fun m!913739 () Bool)

(assert (=> b!987574 m!913739))

(declare-fun m!913741 () Bool)

(assert (=> b!987574 m!913741))

(assert (=> b!987574 m!913739))

(declare-fun m!913743 () Bool)

(assert (=> b!987574 m!913743))

(declare-fun m!913745 () Bool)

(assert (=> b!987574 m!913745))

(declare-fun m!913747 () Bool)

(assert (=> b!987574 m!913747))

(declare-fun m!913749 () Bool)

(assert (=> b!987574 m!913749))

(declare-fun m!913751 () Bool)

(assert (=> b!987574 m!913751))

(declare-fun m!913753 () Bool)

(assert (=> b!987574 m!913753))

(declare-fun m!913755 () Bool)

(assert (=> b!987574 m!913755))

(assert (=> b!987574 m!913741))

(assert (=> b!987574 m!913755))

(declare-fun m!913757 () Bool)

(assert (=> b!987574 m!913757))

(assert (=> b!987566 m!913739))

(declare-fun m!913759 () Bool)

(assert (=> b!987566 m!913759))

(declare-fun m!913761 () Bool)

(assert (=> b!987566 m!913761))

(declare-fun m!913763 () Bool)

(assert (=> b!987566 m!913763))

(declare-fun m!913765 () Bool)

(assert (=> b!987566 m!913765))

(assert (=> b!987566 m!913763))

(assert (=> b!987566 m!913759))

(assert (=> b!987566 m!913739))

(declare-fun m!913767 () Bool)

(assert (=> b!987566 m!913767))

(declare-fun m!913769 () Bool)

(assert (=> b!987566 m!913769))

(assert (=> b!987569 m!913739))

(assert (=> b!987569 m!913739))

(declare-fun m!913771 () Bool)

(assert (=> b!987569 m!913771))

(declare-fun m!913773 () Bool)

(assert (=> start!84436 m!913773))

(declare-fun m!913775 () Bool)

(assert (=> start!84436 m!913775))

(declare-fun m!913777 () Bool)

(assert (=> start!84436 m!913777))

(declare-fun m!913779 () Bool)

(assert (=> mapNonEmpty!36866 m!913779))

(check-sat (not b_lambda!15019) tp_is_empty!23221 b_and!32053 (not b!987571) (not b!987570) (not b!987574) (not b!987569) (not start!84436) (not b!987566) (not mapNonEmpty!36866) (not b_next!20005))
(check-sat b_and!32053 (not b_next!20005))
(get-model)

(declare-fun b_lambda!15025 () Bool)

(assert (= b_lambda!15019 (or (and start!84436 b_free!20005) b_lambda!15025)))

(check-sat tp_is_empty!23221 b_and!32053 (not b!987571) (not b!987570) (not b!987574) (not b_lambda!15025) (not b!987569) (not start!84436) (not b!987566) (not mapNonEmpty!36866) (not b_next!20005))
(check-sat b_and!32053 (not b_next!20005))
(get-model)

(declare-fun d!116761 () Bool)

(declare-fun res!660772 () Bool)

(declare-fun e!556900 () Bool)

(assert (=> d!116761 (=> res!660772 e!556900)))

(assert (=> d!116761 (= res!660772 (bvsge #b00000000000000000000000000000000 (size!30505 _keys!1544)))))

(assert (=> d!116761 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20820) e!556900)))

(declare-fun b!987659 () Bool)

(declare-fun e!556902 () Bool)

(declare-fun call!41788 () Bool)

(assert (=> b!987659 (= e!556902 call!41788)))

(declare-fun b!987660 () Bool)

(assert (=> b!987660 (= e!556902 call!41788)))

(declare-fun b!987661 () Bool)

(declare-fun e!556901 () Bool)

(declare-fun contains!5685 (List!20823 (_ BitVec 64)) Bool)

(assert (=> b!987661 (= e!556901 (contains!5685 Nil!20820 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41785 () Bool)

(declare-fun c!99999 () Bool)

(assert (=> bm!41785 (= call!41788 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99999 (Cons!20819 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) Nil!20820) Nil!20820)))))

(declare-fun b!987662 () Bool)

(declare-fun e!556899 () Bool)

(assert (=> b!987662 (= e!556900 e!556899)))

(declare-fun res!660773 () Bool)

(assert (=> b!987662 (=> (not res!660773) (not e!556899))))

(assert (=> b!987662 (= res!660773 (not e!556901))))

(declare-fun res!660771 () Bool)

(assert (=> b!987662 (=> (not res!660771) (not e!556901))))

(assert (=> b!987662 (= res!660771 (validKeyInArray!0 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!987663 () Bool)

(assert (=> b!987663 (= e!556899 e!556902)))

(assert (=> b!987663 (= c!99999 (validKeyInArray!0 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!116761 (not res!660772)) b!987662))

(assert (= (and b!987662 res!660771) b!987661))

(assert (= (and b!987662 res!660773) b!987663))

(assert (= (and b!987663 c!99999) b!987660))

(assert (= (and b!987663 (not c!99999)) b!987659))

(assert (= (or b!987660 b!987659) bm!41785))

(declare-fun m!913877 () Bool)

(assert (=> b!987661 m!913877))

(assert (=> b!987661 m!913877))

(declare-fun m!913879 () Bool)

(assert (=> b!987661 m!913879))

(assert (=> bm!41785 m!913877))

(declare-fun m!913881 () Bool)

(assert (=> bm!41785 m!913881))

(assert (=> b!987662 m!913877))

(assert (=> b!987662 m!913877))

(declare-fun m!913883 () Bool)

(assert (=> b!987662 m!913883))

(assert (=> b!987663 m!913877))

(assert (=> b!987663 m!913877))

(assert (=> b!987663 m!913883))

(assert (=> b!987571 d!116761))

(declare-fun b!987672 () Bool)

(declare-fun e!556909 () Bool)

(declare-fun call!41791 () Bool)

(assert (=> b!987672 (= e!556909 call!41791)))

(declare-fun d!116763 () Bool)

(declare-fun res!660779 () Bool)

(declare-fun e!556910 () Bool)

(assert (=> d!116763 (=> res!660779 e!556910)))

(assert (=> d!116763 (= res!660779 (bvsge #b00000000000000000000000000000000 (size!30505 _keys!1544)))))

(assert (=> d!116763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!556910)))

(declare-fun b!987673 () Bool)

(declare-fun e!556911 () Bool)

(assert (=> b!987673 (= e!556909 e!556911)))

(declare-fun lt!437876 () (_ BitVec 64))

(assert (=> b!987673 (= lt!437876 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!437878 () Unit!32656)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62336 (_ BitVec 64) (_ BitVec 32)) Unit!32656)

(assert (=> b!987673 (= lt!437878 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!437876 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!987673 (arrayContainsKey!0 _keys!1544 lt!437876 #b00000000000000000000000000000000)))

(declare-fun lt!437877 () Unit!32656)

(assert (=> b!987673 (= lt!437877 lt!437878)))

(declare-fun res!660778 () Bool)

(declare-datatypes ((SeekEntryResult!9203 0))(
  ( (MissingZero!9203 (index!39183 (_ BitVec 32))) (Found!9203 (index!39184 (_ BitVec 32))) (Intermediate!9203 (undefined!10015 Bool) (index!39185 (_ BitVec 32)) (x!85988 (_ BitVec 32))) (Undefined!9203) (MissingVacant!9203 (index!39186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62336 (_ BitVec 32)) SeekEntryResult!9203)

(assert (=> b!987673 (= res!660778 (= (seekEntryOrOpen!0 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9203 #b00000000000000000000000000000000)))))

(assert (=> b!987673 (=> (not res!660778) (not e!556911))))

(declare-fun b!987674 () Bool)

(assert (=> b!987674 (= e!556911 call!41791)))

(declare-fun bm!41788 () Bool)

(assert (=> bm!41788 (= call!41791 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!987675 () Bool)

(assert (=> b!987675 (= e!556910 e!556909)))

(declare-fun c!100002 () Bool)

(assert (=> b!987675 (= c!100002 (validKeyInArray!0 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!116763 (not res!660779)) b!987675))

(assert (= (and b!987675 c!100002) b!987673))

(assert (= (and b!987675 (not c!100002)) b!987672))

(assert (= (and b!987673 res!660778) b!987674))

(assert (= (or b!987674 b!987672) bm!41788))

(assert (=> b!987673 m!913877))

(declare-fun m!913885 () Bool)

(assert (=> b!987673 m!913885))

(declare-fun m!913887 () Bool)

(assert (=> b!987673 m!913887))

(assert (=> b!987673 m!913877))

(declare-fun m!913889 () Bool)

(assert (=> b!987673 m!913889))

(declare-fun m!913891 () Bool)

(assert (=> bm!41788 m!913891))

(assert (=> b!987675 m!913877))

(assert (=> b!987675 m!913877))

(assert (=> b!987675 m!913883))

(assert (=> b!987570 d!116763))

(declare-fun d!116765 () Bool)

(declare-fun e!556914 () Bool)

(assert (=> d!116765 e!556914))

(declare-fun res!660785 () Bool)

(assert (=> d!116765 (=> (not res!660785) (not e!556914))))

(declare-fun lt!437890 () ListLongMap!13621)

(declare-fun contains!5686 (ListLongMap!13621 (_ BitVec 64)) Bool)

(assert (=> d!116765 (= res!660785 (contains!5686 lt!437890 (_1!7478 lt!437809)))))

(declare-fun lt!437887 () List!20822)

(assert (=> d!116765 (= lt!437890 (ListLongMap!13622 lt!437887))))

(declare-fun lt!437888 () Unit!32656)

(declare-fun lt!437889 () Unit!32656)

(assert (=> d!116765 (= lt!437888 lt!437889)))

(declare-datatypes ((Option!521 0))(
  ( (Some!520 (v!14227 V!35945)) (None!519) )
))
(declare-fun getValueByKey!515 (List!20822 (_ BitVec 64)) Option!521)

(assert (=> d!116765 (= (getValueByKey!515 lt!437887 (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809)))))

(declare-fun lemmaContainsTupThenGetReturnValue!272 (List!20822 (_ BitVec 64) V!35945) Unit!32656)

(assert (=> d!116765 (= lt!437889 (lemmaContainsTupThenGetReturnValue!272 lt!437887 (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(declare-fun insertStrictlySorted!329 (List!20822 (_ BitVec 64) V!35945) List!20822)

(assert (=> d!116765 (= lt!437887 (insertStrictlySorted!329 (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(assert (=> d!116765 (= (+!3102 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!437809) lt!437890)))

(declare-fun b!987680 () Bool)

(declare-fun res!660784 () Bool)

(assert (=> b!987680 (=> (not res!660784) (not e!556914))))

(assert (=> b!987680 (= res!660784 (= (getValueByKey!515 (toList!6826 lt!437890) (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809))))))

(declare-fun b!987681 () Bool)

(declare-fun contains!5687 (List!20822 tuple2!14934) Bool)

(assert (=> b!987681 (= e!556914 (contains!5687 (toList!6826 lt!437890) lt!437809))))

(assert (= (and d!116765 res!660785) b!987680))

(assert (= (and b!987680 res!660784) b!987681))

(declare-fun m!913893 () Bool)

(assert (=> d!116765 m!913893))

(declare-fun m!913895 () Bool)

(assert (=> d!116765 m!913895))

(declare-fun m!913897 () Bool)

(assert (=> d!116765 m!913897))

(declare-fun m!913899 () Bool)

(assert (=> d!116765 m!913899))

(declare-fun m!913901 () Bool)

(assert (=> b!987680 m!913901))

(declare-fun m!913903 () Bool)

(assert (=> b!987681 m!913903))

(assert (=> b!987566 d!116765))

(declare-fun d!116767 () Bool)

(declare-fun e!556915 () Bool)

(assert (=> d!116767 e!556915))

(declare-fun res!660787 () Bool)

(assert (=> d!116767 (=> (not res!660787) (not e!556915))))

(declare-fun lt!437894 () ListLongMap!13621)

(assert (=> d!116767 (= res!660787 (contains!5686 lt!437894 (_1!7478 lt!437808)))))

(declare-fun lt!437891 () List!20822)

(assert (=> d!116767 (= lt!437894 (ListLongMap!13622 lt!437891))))

(declare-fun lt!437892 () Unit!32656)

(declare-fun lt!437893 () Unit!32656)

(assert (=> d!116767 (= lt!437892 lt!437893)))

(assert (=> d!116767 (= (getValueByKey!515 lt!437891 (_1!7478 lt!437808)) (Some!520 (_2!7478 lt!437808)))))

(assert (=> d!116767 (= lt!437893 (lemmaContainsTupThenGetReturnValue!272 lt!437891 (_1!7478 lt!437808) (_2!7478 lt!437808)))))

(assert (=> d!116767 (= lt!437891 (insertStrictlySorted!329 (toList!6826 (+!3102 lt!437806 lt!437809)) (_1!7478 lt!437808) (_2!7478 lt!437808)))))

(assert (=> d!116767 (= (+!3102 (+!3102 lt!437806 lt!437809) lt!437808) lt!437894)))

(declare-fun b!987682 () Bool)

(declare-fun res!660786 () Bool)

(assert (=> b!987682 (=> (not res!660786) (not e!556915))))

(assert (=> b!987682 (= res!660786 (= (getValueByKey!515 (toList!6826 lt!437894) (_1!7478 lt!437808)) (Some!520 (_2!7478 lt!437808))))))

(declare-fun b!987683 () Bool)

(assert (=> b!987683 (= e!556915 (contains!5687 (toList!6826 lt!437894) lt!437808))))

(assert (= (and d!116767 res!660787) b!987682))

(assert (= (and b!987682 res!660786) b!987683))

(declare-fun m!913905 () Bool)

(assert (=> d!116767 m!913905))

(declare-fun m!913907 () Bool)

(assert (=> d!116767 m!913907))

(declare-fun m!913909 () Bool)

(assert (=> d!116767 m!913909))

(declare-fun m!913911 () Bool)

(assert (=> d!116767 m!913911))

(declare-fun m!913913 () Bool)

(assert (=> b!987682 m!913913))

(declare-fun m!913915 () Bool)

(assert (=> b!987683 m!913915))

(assert (=> b!987566 d!116767))

(declare-fun b!987726 () Bool)

(declare-fun e!556946 () ListLongMap!13621)

(declare-fun call!41807 () ListLongMap!13621)

(assert (=> b!987726 (= e!556946 call!41807)))

(declare-fun bm!41803 () Bool)

(declare-fun call!41808 () ListLongMap!13621)

(declare-fun call!41812 () ListLongMap!13621)

(assert (=> bm!41803 (= call!41808 call!41812)))

(declare-fun b!987728 () Bool)

(declare-fun e!556943 () ListLongMap!13621)

(declare-fun e!556953 () ListLongMap!13621)

(assert (=> b!987728 (= e!556943 e!556953)))

(declare-fun c!100020 () Bool)

(assert (=> b!987728 (= c!100020 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!987729 () Bool)

(declare-fun call!41810 () ListLongMap!13621)

(assert (=> b!987729 (= e!556943 (+!3102 call!41810 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!987730 () Bool)

(declare-fun call!41811 () ListLongMap!13621)

(assert (=> b!987730 (= e!556946 call!41811)))

(declare-fun b!987731 () Bool)

(declare-fun e!556948 () Bool)

(assert (=> b!987731 (= e!556948 (validKeyInArray!0 (select (arr!30024 _keys!1544) from!1932)))))

(declare-fun b!987732 () Bool)

(declare-fun res!660811 () Bool)

(declare-fun e!556951 () Bool)

(assert (=> b!987732 (=> (not res!660811) (not e!556951))))

(declare-fun e!556950 () Bool)

(assert (=> b!987732 (= res!660811 e!556950)))

(declare-fun c!100019 () Bool)

(assert (=> b!987732 (= c!100019 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41804 () Bool)

(assert (=> bm!41804 (= call!41812 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun bm!41805 () Bool)

(assert (=> bm!41805 (= call!41811 call!41808)))

(declare-fun b!987733 () Bool)

(declare-fun e!556954 () Bool)

(declare-fun e!556952 () Bool)

(assert (=> b!987733 (= e!556954 e!556952)))

(declare-fun res!660807 () Bool)

(declare-fun call!41806 () Bool)

(assert (=> b!987733 (= res!660807 call!41806)))

(assert (=> b!987733 (=> (not res!660807) (not e!556952))))

(declare-fun bm!41806 () Bool)

(declare-fun lt!437947 () ListLongMap!13621)

(assert (=> bm!41806 (= call!41806 (contains!5686 lt!437947 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!987734 () Bool)

(declare-fun res!660812 () Bool)

(assert (=> b!987734 (=> (not res!660812) (not e!556951))))

(declare-fun e!556944 () Bool)

(assert (=> b!987734 (= res!660812 e!556944)))

(declare-fun res!660813 () Bool)

(assert (=> b!987734 (=> res!660813 e!556944)))

(declare-fun e!556947 () Bool)

(assert (=> b!987734 (= res!660813 (not e!556947))))

(declare-fun res!660814 () Bool)

(assert (=> b!987734 (=> (not res!660814) (not e!556947))))

(assert (=> b!987734 (= res!660814 (bvslt from!1932 (size!30505 _keys!1544)))))

(declare-fun b!987735 () Bool)

(declare-fun apply!886 (ListLongMap!13621 (_ BitVec 64)) V!35945)

(assert (=> b!987735 (= e!556952 (= (apply!886 lt!437947 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!987736 () Bool)

(declare-fun e!556949 () Unit!32656)

(declare-fun Unit!32660 () Unit!32656)

(assert (=> b!987736 (= e!556949 Unit!32660)))

(declare-fun b!987737 () Bool)

(declare-fun lt!437952 () Unit!32656)

(assert (=> b!987737 (= e!556949 lt!437952)))

(declare-fun lt!437958 () ListLongMap!13621)

(assert (=> b!987737 (= lt!437958 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!437953 () (_ BitVec 64))

(assert (=> b!987737 (= lt!437953 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!437940 () (_ BitVec 64))

(assert (=> b!987737 (= lt!437940 (select (arr!30024 _keys!1544) from!1932))))

(declare-fun lt!437949 () Unit!32656)

(declare-fun addStillContains!607 (ListLongMap!13621 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32656)

(assert (=> b!987737 (= lt!437949 (addStillContains!607 lt!437958 lt!437953 zeroValue!1220 lt!437940))))

(assert (=> b!987737 (contains!5686 (+!3102 lt!437958 (tuple2!14935 lt!437953 zeroValue!1220)) lt!437940)))

(declare-fun lt!437955 () Unit!32656)

(assert (=> b!987737 (= lt!437955 lt!437949)))

(declare-fun lt!437939 () ListLongMap!13621)

(assert (=> b!987737 (= lt!437939 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!437948 () (_ BitVec 64))

(assert (=> b!987737 (= lt!437948 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!437942 () (_ BitVec 64))

(assert (=> b!987737 (= lt!437942 (select (arr!30024 _keys!1544) from!1932))))

(declare-fun lt!437945 () Unit!32656)

(declare-fun addApplyDifferent!463 (ListLongMap!13621 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32656)

(assert (=> b!987737 (= lt!437945 (addApplyDifferent!463 lt!437939 lt!437948 minValue!1220 lt!437942))))

(assert (=> b!987737 (= (apply!886 (+!3102 lt!437939 (tuple2!14935 lt!437948 minValue!1220)) lt!437942) (apply!886 lt!437939 lt!437942))))

(declare-fun lt!437959 () Unit!32656)

(assert (=> b!987737 (= lt!437959 lt!437945)))

(declare-fun lt!437944 () ListLongMap!13621)

(assert (=> b!987737 (= lt!437944 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!437946 () (_ BitVec 64))

(assert (=> b!987737 (= lt!437946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!437950 () (_ BitVec 64))

(assert (=> b!987737 (= lt!437950 (select (arr!30024 _keys!1544) from!1932))))

(declare-fun lt!437956 () Unit!32656)

(assert (=> b!987737 (= lt!437956 (addApplyDifferent!463 lt!437944 lt!437946 zeroValue!1220 lt!437950))))

(assert (=> b!987737 (= (apply!886 (+!3102 lt!437944 (tuple2!14935 lt!437946 zeroValue!1220)) lt!437950) (apply!886 lt!437944 lt!437950))))

(declare-fun lt!437954 () Unit!32656)

(assert (=> b!987737 (= lt!437954 lt!437956)))

(declare-fun lt!437943 () ListLongMap!13621)

(assert (=> b!987737 (= lt!437943 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!437941 () (_ BitVec 64))

(assert (=> b!987737 (= lt!437941 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!437960 () (_ BitVec 64))

(assert (=> b!987737 (= lt!437960 (select (arr!30024 _keys!1544) from!1932))))

(assert (=> b!987737 (= lt!437952 (addApplyDifferent!463 lt!437943 lt!437941 minValue!1220 lt!437960))))

(assert (=> b!987737 (= (apply!886 (+!3102 lt!437943 (tuple2!14935 lt!437941 minValue!1220)) lt!437960) (apply!886 lt!437943 lt!437960))))

(declare-fun b!987738 () Bool)

(declare-fun e!556942 () Bool)

(assert (=> b!987738 (= e!556942 (= (apply!886 lt!437947 (select (arr!30024 _keys!1544) from!1932)) (get!15592 (select (arr!30023 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987738 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30504 _values!1278)))))

(assert (=> b!987738 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30505 _keys!1544)))))

(declare-fun b!987739 () Bool)

(assert (=> b!987739 (= e!556951 e!556954)))

(declare-fun c!100018 () Bool)

(assert (=> b!987739 (= c!100018 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!987740 () Bool)

(assert (=> b!987740 (= e!556944 e!556942)))

(declare-fun res!660810 () Bool)

(assert (=> b!987740 (=> (not res!660810) (not e!556942))))

(assert (=> b!987740 (= res!660810 (contains!5686 lt!437947 (select (arr!30024 _keys!1544) from!1932)))))

(assert (=> b!987740 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30505 _keys!1544)))))

(declare-fun c!100016 () Bool)

(declare-fun bm!41807 () Bool)

(assert (=> bm!41807 (= call!41810 (+!3102 (ite c!100016 call!41812 (ite c!100020 call!41808 call!41811)) (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun bm!41808 () Bool)

(assert (=> bm!41808 (= call!41807 call!41810)))

(declare-fun b!987741 () Bool)

(declare-fun call!41809 () Bool)

(assert (=> b!987741 (= e!556950 (not call!41809))))

(declare-fun d!116769 () Bool)

(assert (=> d!116769 e!556951))

(declare-fun res!660806 () Bool)

(assert (=> d!116769 (=> (not res!660806) (not e!556951))))

(assert (=> d!116769 (= res!660806 (or (bvsge from!1932 (size!30505 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30505 _keys!1544)))))))

(declare-fun lt!437951 () ListLongMap!13621)

(assert (=> d!116769 (= lt!437947 lt!437951)))

(declare-fun lt!437957 () Unit!32656)

(assert (=> d!116769 (= lt!437957 e!556949)))

(declare-fun c!100015 () Bool)

(assert (=> d!116769 (= c!100015 e!556948)))

(declare-fun res!660808 () Bool)

(assert (=> d!116769 (=> (not res!660808) (not e!556948))))

(assert (=> d!116769 (= res!660808 (bvslt from!1932 (size!30505 _keys!1544)))))

(assert (=> d!116769 (= lt!437951 e!556943)))

(assert (=> d!116769 (= c!100016 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!116769 (validMask!0 mask!1948)))

(assert (=> d!116769 (= (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!437947)))

(declare-fun b!987727 () Bool)

(assert (=> b!987727 (= e!556953 call!41807)))

(declare-fun bm!41809 () Bool)

(assert (=> bm!41809 (= call!41809 (contains!5686 lt!437947 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!987742 () Bool)

(assert (=> b!987742 (= e!556947 (validKeyInArray!0 (select (arr!30024 _keys!1544) from!1932)))))

(declare-fun b!987743 () Bool)

(assert (=> b!987743 (= e!556954 (not call!41806))))

(declare-fun b!987744 () Bool)

(declare-fun e!556945 () Bool)

(assert (=> b!987744 (= e!556950 e!556945)))

(declare-fun res!660809 () Bool)

(assert (=> b!987744 (= res!660809 call!41809)))

(assert (=> b!987744 (=> (not res!660809) (not e!556945))))

(declare-fun b!987745 () Bool)

(assert (=> b!987745 (= e!556945 (= (apply!886 lt!437947 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!987746 () Bool)

(declare-fun c!100017 () Bool)

(assert (=> b!987746 (= c!100017 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!987746 (= e!556953 e!556946)))

(assert (= (and d!116769 c!100016) b!987729))

(assert (= (and d!116769 (not c!100016)) b!987728))

(assert (= (and b!987728 c!100020) b!987727))

(assert (= (and b!987728 (not c!100020)) b!987746))

(assert (= (and b!987746 c!100017) b!987726))

(assert (= (and b!987746 (not c!100017)) b!987730))

(assert (= (or b!987726 b!987730) bm!41805))

(assert (= (or b!987727 bm!41805) bm!41803))

(assert (= (or b!987727 b!987726) bm!41808))

(assert (= (or b!987729 bm!41803) bm!41804))

(assert (= (or b!987729 bm!41808) bm!41807))

(assert (= (and d!116769 res!660808) b!987731))

(assert (= (and d!116769 c!100015) b!987737))

(assert (= (and d!116769 (not c!100015)) b!987736))

(assert (= (and d!116769 res!660806) b!987734))

(assert (= (and b!987734 res!660814) b!987742))

(assert (= (and b!987734 (not res!660813)) b!987740))

(assert (= (and b!987740 res!660810) b!987738))

(assert (= (and b!987734 res!660812) b!987732))

(assert (= (and b!987732 c!100019) b!987744))

(assert (= (and b!987732 (not c!100019)) b!987741))

(assert (= (and b!987744 res!660809) b!987745))

(assert (= (or b!987744 b!987741) bm!41809))

(assert (= (and b!987732 res!660811) b!987739))

(assert (= (and b!987739 c!100018) b!987733))

(assert (= (and b!987739 (not c!100018)) b!987743))

(assert (= (and b!987733 res!660807) b!987735))

(assert (= (or b!987733 b!987743) bm!41806))

(declare-fun b_lambda!15027 () Bool)

(assert (=> (not b_lambda!15027) (not b!987738)))

(assert (=> b!987738 t!29745))

(declare-fun b_and!32063 () Bool)

(assert (= b_and!32053 (and (=> t!29745 result!13551) b_and!32063)))

(assert (=> b!987740 m!913739))

(assert (=> b!987740 m!913739))

(declare-fun m!913917 () Bool)

(assert (=> b!987740 m!913917))

(declare-fun m!913919 () Bool)

(assert (=> bm!41809 m!913919))

(declare-fun m!913921 () Bool)

(assert (=> bm!41807 m!913921))

(declare-fun m!913923 () Bool)

(assert (=> b!987735 m!913923))

(assert (=> b!987731 m!913739))

(assert (=> b!987731 m!913739))

(assert (=> b!987731 m!913771))

(declare-fun m!913925 () Bool)

(assert (=> bm!41804 m!913925))

(declare-fun m!913927 () Bool)

(assert (=> b!987729 m!913927))

(declare-fun m!913929 () Bool)

(assert (=> b!987745 m!913929))

(declare-fun m!913931 () Bool)

(assert (=> bm!41806 m!913931))

(assert (=> b!987738 m!913741))

(assert (=> b!987738 m!913755))

(assert (=> b!987738 m!913757))

(assert (=> b!987738 m!913741))

(assert (=> b!987738 m!913739))

(declare-fun m!913933 () Bool)

(assert (=> b!987738 m!913933))

(assert (=> b!987738 m!913739))

(assert (=> b!987738 m!913755))

(assert (=> b!987742 m!913739))

(assert (=> b!987742 m!913739))

(assert (=> b!987742 m!913771))

(assert (=> d!116769 m!913773))

(declare-fun m!913935 () Bool)

(assert (=> b!987737 m!913935))

(declare-fun m!913937 () Bool)

(assert (=> b!987737 m!913937))

(declare-fun m!913939 () Bool)

(assert (=> b!987737 m!913939))

(declare-fun m!913941 () Bool)

(assert (=> b!987737 m!913941))

(declare-fun m!913943 () Bool)

(assert (=> b!987737 m!913943))

(declare-fun m!913945 () Bool)

(assert (=> b!987737 m!913945))

(declare-fun m!913947 () Bool)

(assert (=> b!987737 m!913947))

(declare-fun m!913949 () Bool)

(assert (=> b!987737 m!913949))

(assert (=> b!987737 m!913739))

(declare-fun m!913951 () Bool)

(assert (=> b!987737 m!913951))

(assert (=> b!987737 m!913925))

(declare-fun m!913953 () Bool)

(assert (=> b!987737 m!913953))

(assert (=> b!987737 m!913943))

(assert (=> b!987737 m!913947))

(declare-fun m!913955 () Bool)

(assert (=> b!987737 m!913955))

(declare-fun m!913957 () Bool)

(assert (=> b!987737 m!913957))

(declare-fun m!913959 () Bool)

(assert (=> b!987737 m!913959))

(assert (=> b!987737 m!913949))

(declare-fun m!913961 () Bool)

(assert (=> b!987737 m!913961))

(declare-fun m!913963 () Bool)

(assert (=> b!987737 m!913963))

(assert (=> b!987737 m!913935))

(assert (=> b!987566 d!116769))

(declare-fun d!116771 () Bool)

(declare-fun e!556955 () Bool)

(assert (=> d!116771 e!556955))

(declare-fun res!660816 () Bool)

(assert (=> d!116771 (=> (not res!660816) (not e!556955))))

(declare-fun lt!437964 () ListLongMap!13621)

(assert (=> d!116771 (= res!660816 (contains!5686 lt!437964 (_1!7478 lt!437809)))))

(declare-fun lt!437961 () List!20822)

(assert (=> d!116771 (= lt!437964 (ListLongMap!13622 lt!437961))))

(declare-fun lt!437962 () Unit!32656)

(declare-fun lt!437963 () Unit!32656)

(assert (=> d!116771 (= lt!437962 lt!437963)))

(assert (=> d!116771 (= (getValueByKey!515 lt!437961 (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809)))))

(assert (=> d!116771 (= lt!437963 (lemmaContainsTupThenGetReturnValue!272 lt!437961 (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(assert (=> d!116771 (= lt!437961 (insertStrictlySorted!329 (toList!6826 lt!437806) (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(assert (=> d!116771 (= (+!3102 lt!437806 lt!437809) lt!437964)))

(declare-fun b!987747 () Bool)

(declare-fun res!660815 () Bool)

(assert (=> b!987747 (=> (not res!660815) (not e!556955))))

(assert (=> b!987747 (= res!660815 (= (getValueByKey!515 (toList!6826 lt!437964) (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809))))))

(declare-fun b!987748 () Bool)

(assert (=> b!987748 (= e!556955 (contains!5687 (toList!6826 lt!437964) lt!437809))))

(assert (= (and d!116771 res!660816) b!987747))

(assert (= (and b!987747 res!660815) b!987748))

(declare-fun m!913965 () Bool)

(assert (=> d!116771 m!913965))

(declare-fun m!913967 () Bool)

(assert (=> d!116771 m!913967))

(declare-fun m!913969 () Bool)

(assert (=> d!116771 m!913969))

(declare-fun m!913971 () Bool)

(assert (=> d!116771 m!913971))

(declare-fun m!913973 () Bool)

(assert (=> b!987747 m!913973))

(declare-fun m!913975 () Bool)

(assert (=> b!987748 m!913975))

(assert (=> b!987566 d!116771))

(declare-fun b!987749 () Bool)

(declare-fun e!556960 () ListLongMap!13621)

(declare-fun call!41814 () ListLongMap!13621)

(assert (=> b!987749 (= e!556960 call!41814)))

(declare-fun bm!41810 () Bool)

(declare-fun call!41815 () ListLongMap!13621)

(declare-fun call!41819 () ListLongMap!13621)

(assert (=> bm!41810 (= call!41815 call!41819)))

(declare-fun b!987751 () Bool)

(declare-fun e!556957 () ListLongMap!13621)

(declare-fun e!556967 () ListLongMap!13621)

(assert (=> b!987751 (= e!556957 e!556967)))

(declare-fun c!100026 () Bool)

(assert (=> b!987751 (= c!100026 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!987752 () Bool)

(declare-fun call!41817 () ListLongMap!13621)

(assert (=> b!987752 (= e!556957 (+!3102 call!41817 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun b!987753 () Bool)

(declare-fun call!41818 () ListLongMap!13621)

(assert (=> b!987753 (= e!556960 call!41818)))

(declare-fun b!987754 () Bool)

(declare-fun e!556962 () Bool)

(assert (=> b!987754 (= e!556962 (validKeyInArray!0 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!987755 () Bool)

(declare-fun res!660822 () Bool)

(declare-fun e!556965 () Bool)

(assert (=> b!987755 (=> (not res!660822) (not e!556965))))

(declare-fun e!556964 () Bool)

(assert (=> b!987755 (= res!660822 e!556964)))

(declare-fun c!100025 () Bool)

(assert (=> b!987755 (= c!100025 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41811 () Bool)

(assert (=> bm!41811 (= call!41819 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun bm!41812 () Bool)

(assert (=> bm!41812 (= call!41818 call!41815)))

(declare-fun b!987756 () Bool)

(declare-fun e!556968 () Bool)

(declare-fun e!556966 () Bool)

(assert (=> b!987756 (= e!556968 e!556966)))

(declare-fun res!660818 () Bool)

(declare-fun call!41813 () Bool)

(assert (=> b!987756 (= res!660818 call!41813)))

(assert (=> b!987756 (=> (not res!660818) (not e!556966))))

(declare-fun bm!41813 () Bool)

(declare-fun lt!437973 () ListLongMap!13621)

(assert (=> bm!41813 (= call!41813 (contains!5686 lt!437973 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!987757 () Bool)

(declare-fun res!660823 () Bool)

(assert (=> b!987757 (=> (not res!660823) (not e!556965))))

(declare-fun e!556958 () Bool)

(assert (=> b!987757 (= res!660823 e!556958)))

(declare-fun res!660824 () Bool)

(assert (=> b!987757 (=> res!660824 e!556958)))

(declare-fun e!556961 () Bool)

(assert (=> b!987757 (= res!660824 (not e!556961))))

(declare-fun res!660825 () Bool)

(assert (=> b!987757 (=> (not res!660825) (not e!556961))))

(assert (=> b!987757 (= res!660825 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30505 _keys!1544)))))

(declare-fun b!987758 () Bool)

(assert (=> b!987758 (= e!556966 (= (apply!886 lt!437973 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!987759 () Bool)

(declare-fun e!556963 () Unit!32656)

(declare-fun Unit!32661 () Unit!32656)

(assert (=> b!987759 (= e!556963 Unit!32661)))

(declare-fun b!987760 () Bool)

(declare-fun lt!437978 () Unit!32656)

(assert (=> b!987760 (= e!556963 lt!437978)))

(declare-fun lt!437984 () ListLongMap!13621)

(assert (=> b!987760 (= lt!437984 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!437979 () (_ BitVec 64))

(assert (=> b!987760 (= lt!437979 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!437966 () (_ BitVec 64))

(assert (=> b!987760 (= lt!437966 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!437975 () Unit!32656)

(assert (=> b!987760 (= lt!437975 (addStillContains!607 lt!437984 lt!437979 zeroValue!1220 lt!437966))))

(assert (=> b!987760 (contains!5686 (+!3102 lt!437984 (tuple2!14935 lt!437979 zeroValue!1220)) lt!437966)))

(declare-fun lt!437981 () Unit!32656)

(assert (=> b!987760 (= lt!437981 lt!437975)))

(declare-fun lt!437965 () ListLongMap!13621)

(assert (=> b!987760 (= lt!437965 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!437974 () (_ BitVec 64))

(assert (=> b!987760 (= lt!437974 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!437968 () (_ BitVec 64))

(assert (=> b!987760 (= lt!437968 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!437971 () Unit!32656)

(assert (=> b!987760 (= lt!437971 (addApplyDifferent!463 lt!437965 lt!437974 minValue!1220 lt!437968))))

(assert (=> b!987760 (= (apply!886 (+!3102 lt!437965 (tuple2!14935 lt!437974 minValue!1220)) lt!437968) (apply!886 lt!437965 lt!437968))))

(declare-fun lt!437985 () Unit!32656)

(assert (=> b!987760 (= lt!437985 lt!437971)))

(declare-fun lt!437970 () ListLongMap!13621)

(assert (=> b!987760 (= lt!437970 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!437972 () (_ BitVec 64))

(assert (=> b!987760 (= lt!437972 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!437976 () (_ BitVec 64))

(assert (=> b!987760 (= lt!437976 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!437982 () Unit!32656)

(assert (=> b!987760 (= lt!437982 (addApplyDifferent!463 lt!437970 lt!437972 zeroValue!1220 lt!437976))))

(assert (=> b!987760 (= (apply!886 (+!3102 lt!437970 (tuple2!14935 lt!437972 zeroValue!1220)) lt!437976) (apply!886 lt!437970 lt!437976))))

(declare-fun lt!437980 () Unit!32656)

(assert (=> b!987760 (= lt!437980 lt!437982)))

(declare-fun lt!437969 () ListLongMap!13621)

(assert (=> b!987760 (= lt!437969 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!437967 () (_ BitVec 64))

(assert (=> b!987760 (= lt!437967 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!437986 () (_ BitVec 64))

(assert (=> b!987760 (= lt!437986 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!987760 (= lt!437978 (addApplyDifferent!463 lt!437969 lt!437967 minValue!1220 lt!437986))))

(assert (=> b!987760 (= (apply!886 (+!3102 lt!437969 (tuple2!14935 lt!437967 minValue!1220)) lt!437986) (apply!886 lt!437969 lt!437986))))

(declare-fun e!556956 () Bool)

(declare-fun b!987761 () Bool)

(assert (=> b!987761 (= e!556956 (= (apply!886 lt!437973 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987761 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30504 _values!1278)))))

(assert (=> b!987761 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30505 _keys!1544)))))

(declare-fun b!987762 () Bool)

(assert (=> b!987762 (= e!556965 e!556968)))

(declare-fun c!100024 () Bool)

(assert (=> b!987762 (= c!100024 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!987763 () Bool)

(assert (=> b!987763 (= e!556958 e!556956)))

(declare-fun res!660821 () Bool)

(assert (=> b!987763 (=> (not res!660821) (not e!556956))))

(assert (=> b!987763 (= res!660821 (contains!5686 lt!437973 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!987763 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30505 _keys!1544)))))

(declare-fun bm!41814 () Bool)

(declare-fun c!100022 () Bool)

(assert (=> bm!41814 (= call!41817 (+!3102 (ite c!100022 call!41819 (ite c!100026 call!41815 call!41818)) (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun bm!41815 () Bool)

(assert (=> bm!41815 (= call!41814 call!41817)))

(declare-fun b!987764 () Bool)

(declare-fun call!41816 () Bool)

(assert (=> b!987764 (= e!556964 (not call!41816))))

(declare-fun d!116773 () Bool)

(assert (=> d!116773 e!556965))

(declare-fun res!660817 () Bool)

(assert (=> d!116773 (=> (not res!660817) (not e!556965))))

(assert (=> d!116773 (= res!660817 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30505 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30505 _keys!1544)))))))

(declare-fun lt!437977 () ListLongMap!13621)

(assert (=> d!116773 (= lt!437973 lt!437977)))

(declare-fun lt!437983 () Unit!32656)

(assert (=> d!116773 (= lt!437983 e!556963)))

(declare-fun c!100021 () Bool)

(assert (=> d!116773 (= c!100021 e!556962)))

(declare-fun res!660819 () Bool)

(assert (=> d!116773 (=> (not res!660819) (not e!556962))))

(assert (=> d!116773 (= res!660819 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30505 _keys!1544)))))

(assert (=> d!116773 (= lt!437977 e!556957)))

(assert (=> d!116773 (= c!100022 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!116773 (validMask!0 mask!1948)))

(assert (=> d!116773 (= (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!437973)))

(declare-fun b!987750 () Bool)

(assert (=> b!987750 (= e!556967 call!41814)))

(declare-fun bm!41816 () Bool)

(assert (=> bm!41816 (= call!41816 (contains!5686 lt!437973 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!987765 () Bool)

(assert (=> b!987765 (= e!556961 (validKeyInArray!0 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!987766 () Bool)

(assert (=> b!987766 (= e!556968 (not call!41813))))

(declare-fun b!987767 () Bool)

(declare-fun e!556959 () Bool)

(assert (=> b!987767 (= e!556964 e!556959)))

(declare-fun res!660820 () Bool)

(assert (=> b!987767 (= res!660820 call!41816)))

(assert (=> b!987767 (=> (not res!660820) (not e!556959))))

(declare-fun b!987768 () Bool)

(assert (=> b!987768 (= e!556959 (= (apply!886 lt!437973 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!987769 () Bool)

(declare-fun c!100023 () Bool)

(assert (=> b!987769 (= c!100023 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!987769 (= e!556967 e!556960)))

(assert (= (and d!116773 c!100022) b!987752))

(assert (= (and d!116773 (not c!100022)) b!987751))

(assert (= (and b!987751 c!100026) b!987750))

(assert (= (and b!987751 (not c!100026)) b!987769))

(assert (= (and b!987769 c!100023) b!987749))

(assert (= (and b!987769 (not c!100023)) b!987753))

(assert (= (or b!987749 b!987753) bm!41812))

(assert (= (or b!987750 bm!41812) bm!41810))

(assert (= (or b!987750 b!987749) bm!41815))

(assert (= (or b!987752 bm!41810) bm!41811))

(assert (= (or b!987752 bm!41815) bm!41814))

(assert (= (and d!116773 res!660819) b!987754))

(assert (= (and d!116773 c!100021) b!987760))

(assert (= (and d!116773 (not c!100021)) b!987759))

(assert (= (and d!116773 res!660817) b!987757))

(assert (= (and b!987757 res!660825) b!987765))

(assert (= (and b!987757 (not res!660824)) b!987763))

(assert (= (and b!987763 res!660821) b!987761))

(assert (= (and b!987757 res!660823) b!987755))

(assert (= (and b!987755 c!100025) b!987767))

(assert (= (and b!987755 (not c!100025)) b!987764))

(assert (= (and b!987767 res!660820) b!987768))

(assert (= (or b!987767 b!987764) bm!41816))

(assert (= (and b!987755 res!660822) b!987762))

(assert (= (and b!987762 c!100024) b!987756))

(assert (= (and b!987762 (not c!100024)) b!987766))

(assert (= (and b!987756 res!660818) b!987758))

(assert (= (or b!987756 b!987766) bm!41813))

(declare-fun b_lambda!15029 () Bool)

(assert (=> (not b_lambda!15029) (not b!987761)))

(assert (=> b!987761 t!29745))

(declare-fun b_and!32065 () Bool)

(assert (= b_and!32063 (and (=> t!29745 result!13551) b_and!32065)))

(declare-fun m!913977 () Bool)

(assert (=> b!987763 m!913977))

(assert (=> b!987763 m!913977))

(declare-fun m!913979 () Bool)

(assert (=> b!987763 m!913979))

(declare-fun m!913981 () Bool)

(assert (=> bm!41816 m!913981))

(declare-fun m!913983 () Bool)

(assert (=> bm!41814 m!913983))

(declare-fun m!913985 () Bool)

(assert (=> b!987758 m!913985))

(assert (=> b!987754 m!913977))

(assert (=> b!987754 m!913977))

(declare-fun m!913987 () Bool)

(assert (=> b!987754 m!913987))

(assert (=> bm!41811 m!913745))

(declare-fun m!913989 () Bool)

(assert (=> b!987752 m!913989))

(declare-fun m!913991 () Bool)

(assert (=> b!987768 m!913991))

(declare-fun m!913993 () Bool)

(assert (=> bm!41813 m!913993))

(declare-fun m!913995 () Bool)

(assert (=> b!987761 m!913995))

(assert (=> b!987761 m!913755))

(declare-fun m!913997 () Bool)

(assert (=> b!987761 m!913997))

(assert (=> b!987761 m!913995))

(assert (=> b!987761 m!913977))

(declare-fun m!913999 () Bool)

(assert (=> b!987761 m!913999))

(assert (=> b!987761 m!913977))

(assert (=> b!987761 m!913755))

(assert (=> b!987765 m!913977))

(assert (=> b!987765 m!913977))

(assert (=> b!987765 m!913987))

(assert (=> d!116773 m!913773))

(declare-fun m!914001 () Bool)

(assert (=> b!987760 m!914001))

(declare-fun m!914003 () Bool)

(assert (=> b!987760 m!914003))

(declare-fun m!914005 () Bool)

(assert (=> b!987760 m!914005))

(declare-fun m!914007 () Bool)

(assert (=> b!987760 m!914007))

(declare-fun m!914009 () Bool)

(assert (=> b!987760 m!914009))

(declare-fun m!914011 () Bool)

(assert (=> b!987760 m!914011))

(declare-fun m!914013 () Bool)

(assert (=> b!987760 m!914013))

(declare-fun m!914015 () Bool)

(assert (=> b!987760 m!914015))

(assert (=> b!987760 m!913977))

(declare-fun m!914017 () Bool)

(assert (=> b!987760 m!914017))

(assert (=> b!987760 m!913745))

(declare-fun m!914019 () Bool)

(assert (=> b!987760 m!914019))

(assert (=> b!987760 m!914009))

(assert (=> b!987760 m!914013))

(declare-fun m!914021 () Bool)

(assert (=> b!987760 m!914021))

(declare-fun m!914023 () Bool)

(assert (=> b!987760 m!914023))

(declare-fun m!914025 () Bool)

(assert (=> b!987760 m!914025))

(assert (=> b!987760 m!914015))

(declare-fun m!914027 () Bool)

(assert (=> b!987760 m!914027))

(declare-fun m!914029 () Bool)

(assert (=> b!987760 m!914029))

(assert (=> b!987760 m!914001))

(assert (=> b!987566 d!116773))

(declare-fun d!116775 () Bool)

(assert (=> d!116775 (= (+!3102 (+!3102 lt!437806 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (+!3102 (+!3102 lt!437806 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun lt!437989 () Unit!32656)

(declare-fun choose!1614 (ListLongMap!13621 (_ BitVec 64) V!35945 (_ BitVec 64) V!35945) Unit!32656)

(assert (=> d!116775 (= lt!437989 (choose!1614 lt!437806 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30024 _keys!1544) from!1932) lt!437804))))

(assert (=> d!116775 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30024 _keys!1544) from!1932)))))

(assert (=> d!116775 (= (addCommutativeForDiffKeys!698 lt!437806 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30024 _keys!1544) from!1932) lt!437804) lt!437989)))

(declare-fun bs!27998 () Bool)

(assert (= bs!27998 d!116775))

(declare-fun m!914031 () Bool)

(assert (=> bs!27998 m!914031))

(declare-fun m!914033 () Bool)

(assert (=> bs!27998 m!914033))

(declare-fun m!914035 () Bool)

(assert (=> bs!27998 m!914035))

(assert (=> bs!27998 m!913739))

(declare-fun m!914037 () Bool)

(assert (=> bs!27998 m!914037))

(assert (=> bs!27998 m!914031))

(declare-fun m!914039 () Bool)

(assert (=> bs!27998 m!914039))

(assert (=> bs!27998 m!914033))

(assert (=> b!987566 d!116775))

(declare-fun d!116777 () Bool)

(declare-fun e!556969 () Bool)

(assert (=> d!116777 e!556969))

(declare-fun res!660827 () Bool)

(assert (=> d!116777 (=> (not res!660827) (not e!556969))))

(declare-fun lt!437993 () ListLongMap!13621)

(assert (=> d!116777 (= res!660827 (contains!5686 lt!437993 (_1!7478 lt!437802)))))

(declare-fun lt!437990 () List!20822)

(assert (=> d!116777 (= lt!437993 (ListLongMap!13622 lt!437990))))

(declare-fun lt!437991 () Unit!32656)

(declare-fun lt!437992 () Unit!32656)

(assert (=> d!116777 (= lt!437991 lt!437992)))

(assert (=> d!116777 (= (getValueByKey!515 lt!437990 (_1!7478 lt!437802)) (Some!520 (_2!7478 lt!437802)))))

(assert (=> d!116777 (= lt!437992 (lemmaContainsTupThenGetReturnValue!272 lt!437990 (_1!7478 lt!437802) (_2!7478 lt!437802)))))

(assert (=> d!116777 (= lt!437990 (insertStrictlySorted!329 (toList!6826 lt!437805) (_1!7478 lt!437802) (_2!7478 lt!437802)))))

(assert (=> d!116777 (= (+!3102 lt!437805 lt!437802) lt!437993)))

(declare-fun b!987770 () Bool)

(declare-fun res!660826 () Bool)

(assert (=> b!987770 (=> (not res!660826) (not e!556969))))

(assert (=> b!987770 (= res!660826 (= (getValueByKey!515 (toList!6826 lt!437993) (_1!7478 lt!437802)) (Some!520 (_2!7478 lt!437802))))))

(declare-fun b!987771 () Bool)

(assert (=> b!987771 (= e!556969 (contains!5687 (toList!6826 lt!437993) lt!437802))))

(assert (= (and d!116777 res!660827) b!987770))

(assert (= (and b!987770 res!660826) b!987771))

(declare-fun m!914041 () Bool)

(assert (=> d!116777 m!914041))

(declare-fun m!914043 () Bool)

(assert (=> d!116777 m!914043))

(declare-fun m!914045 () Bool)

(assert (=> d!116777 m!914045))

(declare-fun m!914047 () Bool)

(assert (=> d!116777 m!914047))

(declare-fun m!914049 () Bool)

(assert (=> b!987770 m!914049))

(declare-fun m!914051 () Bool)

(assert (=> b!987771 m!914051))

(assert (=> b!987574 d!116777))

(declare-fun d!116779 () Bool)

(declare-fun c!100029 () Bool)

(assert (=> d!116779 (= c!100029 ((_ is ValueCellFull!11129) (select (arr!30023 _values!1278) from!1932)))))

(declare-fun e!556972 () V!35945)

(assert (=> d!116779 (= (get!15592 (select (arr!30023 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!556972)))

(declare-fun b!987776 () Bool)

(declare-fun get!15594 (ValueCell!11129 V!35945) V!35945)

(assert (=> b!987776 (= e!556972 (get!15594 (select (arr!30023 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!987777 () Bool)

(declare-fun get!15595 (ValueCell!11129 V!35945) V!35945)

(assert (=> b!987777 (= e!556972 (get!15595 (select (arr!30023 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116779 c!100029) b!987776))

(assert (= (and d!116779 (not c!100029)) b!987777))

(assert (=> b!987776 m!913741))

(assert (=> b!987776 m!913755))

(declare-fun m!914053 () Bool)

(assert (=> b!987776 m!914053))

(assert (=> b!987777 m!913741))

(assert (=> b!987777 m!913755))

(declare-fun m!914055 () Bool)

(assert (=> b!987777 m!914055))

(assert (=> b!987574 d!116779))

(declare-fun d!116781 () Bool)

(assert (=> d!116781 (= (+!3102 (+!3102 lt!437801 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (+!3102 (+!3102 lt!437801 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun lt!437994 () Unit!32656)

(assert (=> d!116781 (= lt!437994 (choose!1614 lt!437801 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30024 _keys!1544) from!1932) lt!437804))))

(assert (=> d!116781 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30024 _keys!1544) from!1932)))))

(assert (=> d!116781 (= (addCommutativeForDiffKeys!698 lt!437801 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30024 _keys!1544) from!1932) lt!437804) lt!437994)))

(declare-fun bs!27999 () Bool)

(assert (= bs!27999 d!116781))

(declare-fun m!914057 () Bool)

(assert (=> bs!27999 m!914057))

(declare-fun m!914059 () Bool)

(assert (=> bs!27999 m!914059))

(declare-fun m!914061 () Bool)

(assert (=> bs!27999 m!914061))

(assert (=> bs!27999 m!913739))

(declare-fun m!914063 () Bool)

(assert (=> bs!27999 m!914063))

(assert (=> bs!27999 m!914057))

(declare-fun m!914065 () Bool)

(assert (=> bs!27999 m!914065))

(assert (=> bs!27999 m!914059))

(assert (=> b!987574 d!116781))

(declare-fun b!987802 () Bool)

(declare-fun e!556992 () Bool)

(declare-fun e!556990 () Bool)

(assert (=> b!987802 (= e!556992 e!556990)))

(declare-fun c!100040 () Bool)

(assert (=> b!987802 (= c!100040 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30505 _keys!1544)))))

(declare-fun call!41822 () ListLongMap!13621)

(declare-fun bm!41819 () Bool)

(assert (=> bm!41819 (= call!41822 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!987803 () Bool)

(declare-fun e!556991 () Bool)

(assert (=> b!987803 (= e!556991 e!556992)))

(declare-fun c!100039 () Bool)

(declare-fun e!556988 () Bool)

(assert (=> b!987803 (= c!100039 e!556988)))

(declare-fun res!660838 () Bool)

(assert (=> b!987803 (=> (not res!660838) (not e!556988))))

(assert (=> b!987803 (= res!660838 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30505 _keys!1544)))))

(declare-fun b!987804 () Bool)

(declare-fun e!556993 () ListLongMap!13621)

(assert (=> b!987804 (= e!556993 (ListLongMap!13622 Nil!20819))))

(declare-fun b!987805 () Bool)

(declare-fun res!660837 () Bool)

(assert (=> b!987805 (=> (not res!660837) (not e!556991))))

(declare-fun lt!438013 () ListLongMap!13621)

(assert (=> b!987805 (= res!660837 (not (contains!5686 lt!438013 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!987806 () Bool)

(declare-fun e!556987 () ListLongMap!13621)

(assert (=> b!987806 (= e!556987 call!41822)))

(declare-fun b!987807 () Bool)

(assert (=> b!987807 (= e!556990 (= lt!438013 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun d!116783 () Bool)

(assert (=> d!116783 e!556991))

(declare-fun res!660836 () Bool)

(assert (=> d!116783 (=> (not res!660836) (not e!556991))))

(assert (=> d!116783 (= res!660836 (not (contains!5686 lt!438013 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!116783 (= lt!438013 e!556993)))

(declare-fun c!100038 () Bool)

(assert (=> d!116783 (= c!100038 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30505 _keys!1544)))))

(assert (=> d!116783 (validMask!0 mask!1948)))

(assert (=> d!116783 (= (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438013)))

(declare-fun b!987808 () Bool)

(assert (=> b!987808 (= e!556988 (validKeyInArray!0 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!987808 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!987809 () Bool)

(assert (=> b!987809 (= e!556993 e!556987)))

(declare-fun c!100041 () Bool)

(assert (=> b!987809 (= c!100041 (validKeyInArray!0 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!987810 () Bool)

(declare-fun e!556989 () Bool)

(assert (=> b!987810 (= e!556992 e!556989)))

(assert (=> b!987810 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30505 _keys!1544)))))

(declare-fun res!660839 () Bool)

(assert (=> b!987810 (= res!660839 (contains!5686 lt!438013 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!987810 (=> (not res!660839) (not e!556989))))

(declare-fun b!987811 () Bool)

(declare-fun isEmpty!725 (ListLongMap!13621) Bool)

(assert (=> b!987811 (= e!556990 (isEmpty!725 lt!438013))))

(declare-fun b!987812 () Bool)

(assert (=> b!987812 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30505 _keys!1544)))))

(assert (=> b!987812 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30504 _values!1278)))))

(assert (=> b!987812 (= e!556989 (= (apply!886 lt!438013 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!987813 () Bool)

(declare-fun lt!438011 () Unit!32656)

(declare-fun lt!438014 () Unit!32656)

(assert (=> b!987813 (= lt!438011 lt!438014)))

(declare-fun lt!438009 () ListLongMap!13621)

(declare-fun lt!438010 () (_ BitVec 64))

(declare-fun lt!438015 () V!35945)

(declare-fun lt!438012 () (_ BitVec 64))

(assert (=> b!987813 (not (contains!5686 (+!3102 lt!438009 (tuple2!14935 lt!438012 lt!438015)) lt!438010))))

(declare-fun addStillNotContains!233 (ListLongMap!13621 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32656)

(assert (=> b!987813 (= lt!438014 (addStillNotContains!233 lt!438009 lt!438012 lt!438015 lt!438010))))

(assert (=> b!987813 (= lt!438010 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!987813 (= lt!438015 (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!987813 (= lt!438012 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!987813 (= lt!438009 call!41822)))

(assert (=> b!987813 (= e!556987 (+!3102 call!41822 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!116783 c!100038) b!987804))

(assert (= (and d!116783 (not c!100038)) b!987809))

(assert (= (and b!987809 c!100041) b!987813))

(assert (= (and b!987809 (not c!100041)) b!987806))

(assert (= (or b!987813 b!987806) bm!41819))

(assert (= (and d!116783 res!660836) b!987805))

(assert (= (and b!987805 res!660837) b!987803))

(assert (= (and b!987803 res!660838) b!987808))

(assert (= (and b!987803 c!100039) b!987810))

(assert (= (and b!987803 (not c!100039)) b!987802))

(assert (= (and b!987810 res!660839) b!987812))

(assert (= (and b!987802 c!100040) b!987807))

(assert (= (and b!987802 (not c!100040)) b!987811))

(declare-fun b_lambda!15031 () Bool)

(assert (=> (not b_lambda!15031) (not b!987812)))

(assert (=> b!987812 t!29745))

(declare-fun b_and!32067 () Bool)

(assert (= b_and!32065 (and (=> t!29745 result!13551) b_and!32067)))

(declare-fun b_lambda!15033 () Bool)

(assert (=> (not b_lambda!15033) (not b!987813)))

(assert (=> b!987813 t!29745))

(declare-fun b_and!32069 () Bool)

(assert (= b_and!32067 (and (=> t!29745 result!13551) b_and!32069)))

(declare-fun m!914067 () Bool)

(assert (=> b!987805 m!914067))

(assert (=> b!987809 m!913977))

(assert (=> b!987809 m!913977))

(assert (=> b!987809 m!913987))

(declare-fun m!914069 () Bool)

(assert (=> b!987813 m!914069))

(assert (=> b!987813 m!913995))

(declare-fun m!914071 () Bool)

(assert (=> b!987813 m!914071))

(declare-fun m!914073 () Bool)

(assert (=> b!987813 m!914073))

(assert (=> b!987813 m!913977))

(assert (=> b!987813 m!913755))

(assert (=> b!987813 m!914071))

(declare-fun m!914075 () Bool)

(assert (=> b!987813 m!914075))

(assert (=> b!987813 m!913995))

(assert (=> b!987813 m!913755))

(assert (=> b!987813 m!913997))

(declare-fun m!914077 () Bool)

(assert (=> b!987811 m!914077))

(declare-fun m!914079 () Bool)

(assert (=> bm!41819 m!914079))

(assert (=> b!987812 m!913995))

(assert (=> b!987812 m!913995))

(assert (=> b!987812 m!913755))

(assert (=> b!987812 m!913997))

(assert (=> b!987812 m!913977))

(assert (=> b!987812 m!913977))

(declare-fun m!914081 () Bool)

(assert (=> b!987812 m!914081))

(assert (=> b!987812 m!913755))

(assert (=> b!987807 m!914079))

(assert (=> b!987810 m!913977))

(assert (=> b!987810 m!913977))

(declare-fun m!914083 () Bool)

(assert (=> b!987810 m!914083))

(declare-fun m!914085 () Bool)

(assert (=> d!116783 m!914085))

(assert (=> d!116783 m!913773))

(assert (=> b!987808 m!913977))

(assert (=> b!987808 m!913977))

(assert (=> b!987808 m!913987))

(assert (=> b!987574 d!116783))

(declare-fun d!116785 () Bool)

(declare-fun e!556994 () Bool)

(assert (=> d!116785 e!556994))

(declare-fun res!660841 () Bool)

(assert (=> d!116785 (=> (not res!660841) (not e!556994))))

(declare-fun lt!438019 () ListLongMap!13621)

(assert (=> d!116785 (= res!660841 (contains!5686 lt!438019 (_1!7478 lt!437809)))))

(declare-fun lt!438016 () List!20822)

(assert (=> d!116785 (= lt!438019 (ListLongMap!13622 lt!438016))))

(declare-fun lt!438017 () Unit!32656)

(declare-fun lt!438018 () Unit!32656)

(assert (=> d!116785 (= lt!438017 lt!438018)))

(assert (=> d!116785 (= (getValueByKey!515 lt!438016 (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809)))))

(assert (=> d!116785 (= lt!438018 (lemmaContainsTupThenGetReturnValue!272 lt!438016 (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(assert (=> d!116785 (= lt!438016 (insertStrictlySorted!329 (toList!6826 lt!437801) (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(assert (=> d!116785 (= (+!3102 lt!437801 lt!437809) lt!438019)))

(declare-fun b!987814 () Bool)

(declare-fun res!660840 () Bool)

(assert (=> b!987814 (=> (not res!660840) (not e!556994))))

(assert (=> b!987814 (= res!660840 (= (getValueByKey!515 (toList!6826 lt!438019) (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809))))))

(declare-fun b!987815 () Bool)

(assert (=> b!987815 (= e!556994 (contains!5687 (toList!6826 lt!438019) lt!437809))))

(assert (= (and d!116785 res!660841) b!987814))

(assert (= (and b!987814 res!660840) b!987815))

(declare-fun m!914087 () Bool)

(assert (=> d!116785 m!914087))

(declare-fun m!914089 () Bool)

(assert (=> d!116785 m!914089))

(declare-fun m!914091 () Bool)

(assert (=> d!116785 m!914091))

(declare-fun m!914093 () Bool)

(assert (=> d!116785 m!914093))

(declare-fun m!914095 () Bool)

(assert (=> b!987814 m!914095))

(declare-fun m!914097 () Bool)

(assert (=> b!987815 m!914097))

(assert (=> b!987574 d!116785))

(declare-fun d!116787 () Bool)

(declare-fun e!556995 () Bool)

(assert (=> d!116787 e!556995))

(declare-fun res!660843 () Bool)

(assert (=> d!116787 (=> (not res!660843) (not e!556995))))

(declare-fun lt!438023 () ListLongMap!13621)

(assert (=> d!116787 (= res!660843 (contains!5686 lt!438023 (_1!7478 lt!437809)))))

(declare-fun lt!438020 () List!20822)

(assert (=> d!116787 (= lt!438023 (ListLongMap!13622 lt!438020))))

(declare-fun lt!438021 () Unit!32656)

(declare-fun lt!438022 () Unit!32656)

(assert (=> d!116787 (= lt!438021 lt!438022)))

(assert (=> d!116787 (= (getValueByKey!515 lt!438020 (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809)))))

(assert (=> d!116787 (= lt!438022 (lemmaContainsTupThenGetReturnValue!272 lt!438020 (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(assert (=> d!116787 (= lt!438020 (insertStrictlySorted!329 (toList!6826 lt!437803) (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(assert (=> d!116787 (= (+!3102 lt!437803 lt!437809) lt!438023)))

(declare-fun b!987816 () Bool)

(declare-fun res!660842 () Bool)

(assert (=> b!987816 (=> (not res!660842) (not e!556995))))

(assert (=> b!987816 (= res!660842 (= (getValueByKey!515 (toList!6826 lt!438023) (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809))))))

(declare-fun b!987817 () Bool)

(assert (=> b!987817 (= e!556995 (contains!5687 (toList!6826 lt!438023) lt!437809))))

(assert (= (and d!116787 res!660843) b!987816))

(assert (= (and b!987816 res!660842) b!987817))

(declare-fun m!914099 () Bool)

(assert (=> d!116787 m!914099))

(declare-fun m!914101 () Bool)

(assert (=> d!116787 m!914101))

(declare-fun m!914103 () Bool)

(assert (=> d!116787 m!914103))

(declare-fun m!914105 () Bool)

(assert (=> d!116787 m!914105))

(declare-fun m!914107 () Bool)

(assert (=> b!987816 m!914107))

(declare-fun m!914109 () Bool)

(assert (=> b!987817 m!914109))

(assert (=> b!987574 d!116787))

(declare-fun d!116789 () Bool)

(declare-fun e!556996 () Bool)

(assert (=> d!116789 e!556996))

(declare-fun res!660845 () Bool)

(assert (=> d!116789 (=> (not res!660845) (not e!556996))))

(declare-fun lt!438027 () ListLongMap!13621)

(assert (=> d!116789 (= res!660845 (contains!5686 lt!438027 (_1!7478 lt!437808)))))

(declare-fun lt!438024 () List!20822)

(assert (=> d!116789 (= lt!438027 (ListLongMap!13622 lt!438024))))

(declare-fun lt!438025 () Unit!32656)

(declare-fun lt!438026 () Unit!32656)

(assert (=> d!116789 (= lt!438025 lt!438026)))

(assert (=> d!116789 (= (getValueByKey!515 lt!438024 (_1!7478 lt!437808)) (Some!520 (_2!7478 lt!437808)))))

(assert (=> d!116789 (= lt!438026 (lemmaContainsTupThenGetReturnValue!272 lt!438024 (_1!7478 lt!437808) (_2!7478 lt!437808)))))

(assert (=> d!116789 (= lt!438024 (insertStrictlySorted!329 (toList!6826 lt!437806) (_1!7478 lt!437808) (_2!7478 lt!437808)))))

(assert (=> d!116789 (= (+!3102 lt!437806 lt!437808) lt!438027)))

(declare-fun b!987818 () Bool)

(declare-fun res!660844 () Bool)

(assert (=> b!987818 (=> (not res!660844) (not e!556996))))

(assert (=> b!987818 (= res!660844 (= (getValueByKey!515 (toList!6826 lt!438027) (_1!7478 lt!437808)) (Some!520 (_2!7478 lt!437808))))))

(declare-fun b!987819 () Bool)

(assert (=> b!987819 (= e!556996 (contains!5687 (toList!6826 lt!438027) lt!437808))))

(assert (= (and d!116789 res!660845) b!987818))

(assert (= (and b!987818 res!660844) b!987819))

(declare-fun m!914111 () Bool)

(assert (=> d!116789 m!914111))

(declare-fun m!914113 () Bool)

(assert (=> d!116789 m!914113))

(declare-fun m!914115 () Bool)

(assert (=> d!116789 m!914115))

(declare-fun m!914117 () Bool)

(assert (=> d!116789 m!914117))

(declare-fun m!914119 () Bool)

(assert (=> b!987818 m!914119))

(declare-fun m!914121 () Bool)

(assert (=> b!987819 m!914121))

(assert (=> b!987574 d!116789))

(declare-fun d!116791 () Bool)

(declare-fun e!556997 () Bool)

(assert (=> d!116791 e!556997))

(declare-fun res!660847 () Bool)

(assert (=> d!116791 (=> (not res!660847) (not e!556997))))

(declare-fun lt!438031 () ListLongMap!13621)

(assert (=> d!116791 (= res!660847 (contains!5686 lt!438031 (_1!7478 lt!437802)))))

(declare-fun lt!438028 () List!20822)

(assert (=> d!116791 (= lt!438031 (ListLongMap!13622 lt!438028))))

(declare-fun lt!438029 () Unit!32656)

(declare-fun lt!438030 () Unit!32656)

(assert (=> d!116791 (= lt!438029 lt!438030)))

(assert (=> d!116791 (= (getValueByKey!515 lt!438028 (_1!7478 lt!437802)) (Some!520 (_2!7478 lt!437802)))))

(assert (=> d!116791 (= lt!438030 (lemmaContainsTupThenGetReturnValue!272 lt!438028 (_1!7478 lt!437802) (_2!7478 lt!437802)))))

(assert (=> d!116791 (= lt!438028 (insertStrictlySorted!329 (toList!6826 lt!437801) (_1!7478 lt!437802) (_2!7478 lt!437802)))))

(assert (=> d!116791 (= (+!3102 lt!437801 lt!437802) lt!438031)))

(declare-fun b!987820 () Bool)

(declare-fun res!660846 () Bool)

(assert (=> b!987820 (=> (not res!660846) (not e!556997))))

(assert (=> b!987820 (= res!660846 (= (getValueByKey!515 (toList!6826 lt!438031) (_1!7478 lt!437802)) (Some!520 (_2!7478 lt!437802))))))

(declare-fun b!987821 () Bool)

(assert (=> b!987821 (= e!556997 (contains!5687 (toList!6826 lt!438031) lt!437802))))

(assert (= (and d!116791 res!660847) b!987820))

(assert (= (and b!987820 res!660846) b!987821))

(declare-fun m!914123 () Bool)

(assert (=> d!116791 m!914123))

(declare-fun m!914125 () Bool)

(assert (=> d!116791 m!914125))

(declare-fun m!914127 () Bool)

(assert (=> d!116791 m!914127))

(declare-fun m!914129 () Bool)

(assert (=> d!116791 m!914129))

(declare-fun m!914131 () Bool)

(assert (=> b!987820 m!914131))

(declare-fun m!914133 () Bool)

(assert (=> b!987821 m!914133))

(assert (=> b!987574 d!116791))

(declare-fun d!116793 () Bool)

(assert (=> d!116793 (= (validKeyInArray!0 (select (arr!30024 _keys!1544) from!1932)) (and (not (= (select (arr!30024 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30024 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987569 d!116793))

(declare-fun d!116795 () Bool)

(assert (=> d!116795 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84436 d!116795))

(declare-fun d!116797 () Bool)

(assert (=> d!116797 (= (array_inv!23201 _values!1278) (bvsge (size!30504 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84436 d!116797))

(declare-fun d!116799 () Bool)

(assert (=> d!116799 (= (array_inv!23202 _keys!1544) (bvsge (size!30505 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84436 d!116799))

(declare-fun mapNonEmpty!36875 () Bool)

(declare-fun mapRes!36875 () Bool)

(declare-fun tp!69812 () Bool)

(declare-fun e!557003 () Bool)

(assert (=> mapNonEmpty!36875 (= mapRes!36875 (and tp!69812 e!557003))))

(declare-fun mapValue!36875 () ValueCell!11129)

(declare-fun mapRest!36875 () (Array (_ BitVec 32) ValueCell!11129))

(declare-fun mapKey!36875 () (_ BitVec 32))

(assert (=> mapNonEmpty!36875 (= mapRest!36866 (store mapRest!36875 mapKey!36875 mapValue!36875))))

(declare-fun mapIsEmpty!36875 () Bool)

(assert (=> mapIsEmpty!36875 mapRes!36875))

(declare-fun condMapEmpty!36875 () Bool)

(declare-fun mapDefault!36875 () ValueCell!11129)

(assert (=> mapNonEmpty!36866 (= condMapEmpty!36875 (= mapRest!36866 ((as const (Array (_ BitVec 32) ValueCell!11129)) mapDefault!36875)))))

(declare-fun e!557002 () Bool)

(assert (=> mapNonEmpty!36866 (= tp!69797 (and e!557002 mapRes!36875))))

(declare-fun b!987829 () Bool)

(assert (=> b!987829 (= e!557002 tp_is_empty!23221)))

(declare-fun b!987828 () Bool)

(assert (=> b!987828 (= e!557003 tp_is_empty!23221)))

(assert (= (and mapNonEmpty!36866 condMapEmpty!36875) mapIsEmpty!36875))

(assert (= (and mapNonEmpty!36866 (not condMapEmpty!36875)) mapNonEmpty!36875))

(assert (= (and mapNonEmpty!36875 ((_ is ValueCellFull!11129) mapValue!36875)) b!987828))

(assert (= (and mapNonEmpty!36866 ((_ is ValueCellFull!11129) mapDefault!36875)) b!987829))

(declare-fun m!914135 () Bool)

(assert (=> mapNonEmpty!36875 m!914135))

(declare-fun b_lambda!15035 () Bool)

(assert (= b_lambda!15033 (or (and start!84436 b_free!20005) b_lambda!15035)))

(declare-fun b_lambda!15037 () Bool)

(assert (= b_lambda!15027 (or (and start!84436 b_free!20005) b_lambda!15037)))

(declare-fun b_lambda!15039 () Bool)

(assert (= b_lambda!15031 (or (and start!84436 b_free!20005) b_lambda!15039)))

(declare-fun b_lambda!15041 () Bool)

(assert (= b_lambda!15029 (or (and start!84436 b_free!20005) b_lambda!15041)))

(check-sat (not bm!41806) (not b_lambda!15035) (not b!987819) (not bm!41816) (not b!987777) (not b!987771) (not b!987816) (not b!987683) (not bm!41819) (not d!116791) (not b!987745) (not b_lambda!15039) (not bm!41809) (not b!987760) (not b!987680) (not d!116771) (not d!116765) tp_is_empty!23221 (not b!987763) (not d!116767) b_and!32069 (not b!987758) (not d!116781) (not b!987818) (not d!116783) (not b!987820) (not b!987737) (not b!987673) (not bm!41807) (not b!987815) (not bm!41814) (not b!987817) (not b!987663) (not b!987661) (not b!987811) (not b!987682) (not b!987776) (not b!987770) (not b!987809) (not b!987662) (not b_lambda!15025) (not b!987768) (not bm!41811) (not bm!41785) (not d!116789) (not b!987805) (not b!987812) (not b!987681) (not b!987813) (not b!987742) (not b!987748) (not b!987747) (not b!987735) (not b!987761) (not b!987810) (not b!987765) (not bm!41813) (not d!116769) (not b!987807) (not b!987808) (not bm!41788) (not b!987740) (not bm!41804) (not b!987752) (not b!987738) (not d!116777) (not b!987675) (not b!987821) (not b!987814) (not mapNonEmpty!36875) (not d!116785) (not d!116787) (not b_lambda!15037) (not b!987754) (not d!116773) (not b!987729) (not d!116775) (not b!987731) (not b_lambda!15041) (not b_next!20005))
(check-sat b_and!32069 (not b_next!20005))
(get-model)

(declare-fun d!116801 () Bool)

(declare-fun lt!438034 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!416 (List!20822) (InoxSet tuple2!14934))

(assert (=> d!116801 (= lt!438034 (select (content!416 (toList!6826 lt!438027)) lt!437808))))

(declare-fun e!557009 () Bool)

(assert (=> d!116801 (= lt!438034 e!557009)))

(declare-fun res!660852 () Bool)

(assert (=> d!116801 (=> (not res!660852) (not e!557009))))

(assert (=> d!116801 (= res!660852 ((_ is Cons!20818) (toList!6826 lt!438027)))))

(assert (=> d!116801 (= (contains!5687 (toList!6826 lt!438027) lt!437808) lt!438034)))

(declare-fun b!987834 () Bool)

(declare-fun e!557008 () Bool)

(assert (=> b!987834 (= e!557009 e!557008)))

(declare-fun res!660853 () Bool)

(assert (=> b!987834 (=> res!660853 e!557008)))

(assert (=> b!987834 (= res!660853 (= (h!21980 (toList!6826 lt!438027)) lt!437808))))

(declare-fun b!987835 () Bool)

(assert (=> b!987835 (= e!557008 (contains!5687 (t!29746 (toList!6826 lt!438027)) lt!437808))))

(assert (= (and d!116801 res!660852) b!987834))

(assert (= (and b!987834 (not res!660853)) b!987835))

(declare-fun m!914137 () Bool)

(assert (=> d!116801 m!914137))

(declare-fun m!914139 () Bool)

(assert (=> d!116801 m!914139))

(declare-fun m!914141 () Bool)

(assert (=> b!987835 m!914141))

(assert (=> b!987819 d!116801))

(assert (=> b!987742 d!116793))

(declare-fun d!116803 () Bool)

(declare-fun get!15596 (Option!521) V!35945)

(assert (=> d!116803 (= (apply!886 lt!438013 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15596 (getValueByKey!515 (toList!6826 lt!438013) (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28000 () Bool)

(assert (= bs!28000 d!116803))

(assert (=> bs!28000 m!913977))

(declare-fun m!914143 () Bool)

(assert (=> bs!28000 m!914143))

(assert (=> bs!28000 m!914143))

(declare-fun m!914145 () Bool)

(assert (=> bs!28000 m!914145))

(assert (=> b!987812 d!116803))

(declare-fun d!116805 () Bool)

(declare-fun c!100042 () Bool)

(assert (=> d!116805 (= c!100042 ((_ is ValueCellFull!11129) (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!557010 () V!35945)

(assert (=> d!116805 (= (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!557010)))

(declare-fun b!987836 () Bool)

(assert (=> b!987836 (= e!557010 (get!15594 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!987837 () Bool)

(assert (=> b!987837 (= e!557010 (get!15595 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116805 c!100042) b!987836))

(assert (= (and d!116805 (not c!100042)) b!987837))

(assert (=> b!987836 m!913995))

(assert (=> b!987836 m!913755))

(declare-fun m!914147 () Bool)

(assert (=> b!987836 m!914147))

(assert (=> b!987837 m!913995))

(assert (=> b!987837 m!913755))

(declare-fun m!914149 () Bool)

(assert (=> b!987837 m!914149))

(assert (=> b!987812 d!116805))

(declare-fun d!116807 () Bool)

(assert (=> d!116807 (arrayContainsKey!0 _keys!1544 lt!437876 #b00000000000000000000000000000000)))

(declare-fun lt!438037 () Unit!32656)

(declare-fun choose!13 (array!62336 (_ BitVec 64) (_ BitVec 32)) Unit!32656)

(assert (=> d!116807 (= lt!438037 (choose!13 _keys!1544 lt!437876 #b00000000000000000000000000000000))))

(assert (=> d!116807 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!116807 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!437876 #b00000000000000000000000000000000) lt!438037)))

(declare-fun bs!28001 () Bool)

(assert (= bs!28001 d!116807))

(assert (=> bs!28001 m!913887))

(declare-fun m!914151 () Bool)

(assert (=> bs!28001 m!914151))

(assert (=> b!987673 d!116807))

(declare-fun d!116809 () Bool)

(declare-fun res!660858 () Bool)

(declare-fun e!557015 () Bool)

(assert (=> d!116809 (=> res!660858 e!557015)))

(assert (=> d!116809 (= res!660858 (= (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) lt!437876))))

(assert (=> d!116809 (= (arrayContainsKey!0 _keys!1544 lt!437876 #b00000000000000000000000000000000) e!557015)))

(declare-fun b!987842 () Bool)

(declare-fun e!557016 () Bool)

(assert (=> b!987842 (= e!557015 e!557016)))

(declare-fun res!660859 () Bool)

(assert (=> b!987842 (=> (not res!660859) (not e!557016))))

(assert (=> b!987842 (= res!660859 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30505 _keys!1544)))))

(declare-fun b!987843 () Bool)

(assert (=> b!987843 (= e!557016 (arrayContainsKey!0 _keys!1544 lt!437876 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!116809 (not res!660858)) b!987842))

(assert (= (and b!987842 res!660859) b!987843))

(assert (=> d!116809 m!913877))

(declare-fun m!914153 () Bool)

(assert (=> b!987843 m!914153))

(assert (=> b!987673 d!116809))

(declare-fun b!987856 () Bool)

(declare-fun e!557025 () SeekEntryResult!9203)

(assert (=> b!987856 (= e!557025 Undefined!9203)))

(declare-fun b!987857 () Bool)

(declare-fun e!557023 () SeekEntryResult!9203)

(assert (=> b!987857 (= e!557025 e!557023)))

(declare-fun lt!438044 () (_ BitVec 64))

(declare-fun lt!438046 () SeekEntryResult!9203)

(assert (=> b!987857 (= lt!438044 (select (arr!30024 _keys!1544) (index!39185 lt!438046)))))

(declare-fun c!100049 () Bool)

(assert (=> b!987857 (= c!100049 (= lt!438044 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!987858 () Bool)

(declare-fun e!557024 () SeekEntryResult!9203)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62336 (_ BitVec 32)) SeekEntryResult!9203)

(assert (=> b!987858 (= e!557024 (seekKeyOrZeroReturnVacant!0 (x!85988 lt!438046) (index!39185 lt!438046) (index!39185 lt!438046) (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(declare-fun b!987859 () Bool)

(declare-fun c!100050 () Bool)

(assert (=> b!987859 (= c!100050 (= lt!438044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!987859 (= e!557023 e!557024)))

(declare-fun d!116811 () Bool)

(declare-fun lt!438045 () SeekEntryResult!9203)

(assert (=> d!116811 (and (or ((_ is Undefined!9203) lt!438045) (not ((_ is Found!9203) lt!438045)) (and (bvsge (index!39184 lt!438045) #b00000000000000000000000000000000) (bvslt (index!39184 lt!438045) (size!30505 _keys!1544)))) (or ((_ is Undefined!9203) lt!438045) ((_ is Found!9203) lt!438045) (not ((_ is MissingZero!9203) lt!438045)) (and (bvsge (index!39183 lt!438045) #b00000000000000000000000000000000) (bvslt (index!39183 lt!438045) (size!30505 _keys!1544)))) (or ((_ is Undefined!9203) lt!438045) ((_ is Found!9203) lt!438045) ((_ is MissingZero!9203) lt!438045) (not ((_ is MissingVacant!9203) lt!438045)) (and (bvsge (index!39186 lt!438045) #b00000000000000000000000000000000) (bvslt (index!39186 lt!438045) (size!30505 _keys!1544)))) (or ((_ is Undefined!9203) lt!438045) (ite ((_ is Found!9203) lt!438045) (= (select (arr!30024 _keys!1544) (index!39184 lt!438045)) (select (arr!30024 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9203) lt!438045) (= (select (arr!30024 _keys!1544) (index!39183 lt!438045)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9203) lt!438045) (= (select (arr!30024 _keys!1544) (index!39186 lt!438045)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!116811 (= lt!438045 e!557025)))

(declare-fun c!100051 () Bool)

(assert (=> d!116811 (= c!100051 (and ((_ is Intermediate!9203) lt!438046) (undefined!10015 lt!438046)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62336 (_ BitVec 32)) SeekEntryResult!9203)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!116811 (= lt!438046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!116811 (validMask!0 mask!1948)))

(assert (=> d!116811 (= (seekEntryOrOpen!0 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!438045)))

(declare-fun b!987860 () Bool)

(assert (=> b!987860 (= e!557023 (Found!9203 (index!39185 lt!438046)))))

(declare-fun b!987861 () Bool)

(assert (=> b!987861 (= e!557024 (MissingZero!9203 (index!39185 lt!438046)))))

(assert (= (and d!116811 c!100051) b!987856))

(assert (= (and d!116811 (not c!100051)) b!987857))

(assert (= (and b!987857 c!100049) b!987860))

(assert (= (and b!987857 (not c!100049)) b!987859))

(assert (= (and b!987859 c!100050) b!987861))

(assert (= (and b!987859 (not c!100050)) b!987858))

(declare-fun m!914155 () Bool)

(assert (=> b!987857 m!914155))

(assert (=> b!987858 m!913877))

(declare-fun m!914157 () Bool)

(assert (=> b!987858 m!914157))

(assert (=> d!116811 m!913773))

(declare-fun m!914159 () Bool)

(assert (=> d!116811 m!914159))

(declare-fun m!914161 () Bool)

(assert (=> d!116811 m!914161))

(assert (=> d!116811 m!913877))

(declare-fun m!914163 () Bool)

(assert (=> d!116811 m!914163))

(declare-fun m!914165 () Bool)

(assert (=> d!116811 m!914165))

(declare-fun m!914167 () Bool)

(assert (=> d!116811 m!914167))

(assert (=> d!116811 m!913877))

(assert (=> d!116811 m!914161))

(assert (=> b!987673 d!116811))

(declare-fun b!987862 () Bool)

(declare-fun e!557026 () Bool)

(declare-fun call!41823 () Bool)

(assert (=> b!987862 (= e!557026 call!41823)))

(declare-fun d!116813 () Bool)

(declare-fun res!660861 () Bool)

(declare-fun e!557027 () Bool)

(assert (=> d!116813 (=> res!660861 e!557027)))

(assert (=> d!116813 (= res!660861 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30505 _keys!1544)))))

(assert (=> d!116813 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!557027)))

(declare-fun b!987863 () Bool)

(declare-fun e!557028 () Bool)

(assert (=> b!987863 (= e!557026 e!557028)))

(declare-fun lt!438047 () (_ BitVec 64))

(assert (=> b!987863 (= lt!438047 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!438049 () Unit!32656)

(assert (=> b!987863 (= lt!438049 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438047 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!987863 (arrayContainsKey!0 _keys!1544 lt!438047 #b00000000000000000000000000000000)))

(declare-fun lt!438048 () Unit!32656)

(assert (=> b!987863 (= lt!438048 lt!438049)))

(declare-fun res!660860 () Bool)

(assert (=> b!987863 (= res!660860 (= (seekEntryOrOpen!0 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9203 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!987863 (=> (not res!660860) (not e!557028))))

(declare-fun b!987864 () Bool)

(assert (=> b!987864 (= e!557028 call!41823)))

(declare-fun bm!41820 () Bool)

(assert (=> bm!41820 (= call!41823 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!987865 () Bool)

(assert (=> b!987865 (= e!557027 e!557026)))

(declare-fun c!100052 () Bool)

(assert (=> b!987865 (= c!100052 (validKeyInArray!0 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!116813 (not res!660861)) b!987865))

(assert (= (and b!987865 c!100052) b!987863))

(assert (= (and b!987865 (not c!100052)) b!987862))

(assert (= (and b!987863 res!660860) b!987864))

(assert (= (or b!987864 b!987862) bm!41820))

(declare-fun m!914169 () Bool)

(assert (=> b!987863 m!914169))

(declare-fun m!914171 () Bool)

(assert (=> b!987863 m!914171))

(declare-fun m!914173 () Bool)

(assert (=> b!987863 m!914173))

(assert (=> b!987863 m!914169))

(declare-fun m!914175 () Bool)

(assert (=> b!987863 m!914175))

(declare-fun m!914177 () Bool)

(assert (=> bm!41820 m!914177))

(assert (=> b!987865 m!914169))

(assert (=> b!987865 m!914169))

(declare-fun m!914179 () Bool)

(assert (=> b!987865 m!914179))

(assert (=> bm!41788 d!116813))

(declare-fun d!116815 () Bool)

(declare-fun lt!438050 () Bool)

(assert (=> d!116815 (= lt!438050 (select (content!416 (toList!6826 lt!437890)) lt!437809))))

(declare-fun e!557030 () Bool)

(assert (=> d!116815 (= lt!438050 e!557030)))

(declare-fun res!660862 () Bool)

(assert (=> d!116815 (=> (not res!660862) (not e!557030))))

(assert (=> d!116815 (= res!660862 ((_ is Cons!20818) (toList!6826 lt!437890)))))

(assert (=> d!116815 (= (contains!5687 (toList!6826 lt!437890) lt!437809) lt!438050)))

(declare-fun b!987866 () Bool)

(declare-fun e!557029 () Bool)

(assert (=> b!987866 (= e!557030 e!557029)))

(declare-fun res!660863 () Bool)

(assert (=> b!987866 (=> res!660863 e!557029)))

(assert (=> b!987866 (= res!660863 (= (h!21980 (toList!6826 lt!437890)) lt!437809))))

(declare-fun b!987867 () Bool)

(assert (=> b!987867 (= e!557029 (contains!5687 (t!29746 (toList!6826 lt!437890)) lt!437809))))

(assert (= (and d!116815 res!660862) b!987866))

(assert (= (and b!987866 (not res!660863)) b!987867))

(declare-fun m!914181 () Bool)

(assert (=> d!116815 m!914181))

(declare-fun m!914183 () Bool)

(assert (=> d!116815 m!914183))

(declare-fun m!914185 () Bool)

(assert (=> b!987867 m!914185))

(assert (=> b!987681 d!116815))

(declare-fun d!116817 () Bool)

(declare-fun e!557031 () Bool)

(assert (=> d!116817 e!557031))

(declare-fun res!660865 () Bool)

(assert (=> d!116817 (=> (not res!660865) (not e!557031))))

(declare-fun lt!438054 () ListLongMap!13621)

(assert (=> d!116817 (= res!660865 (contains!5686 lt!438054 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438051 () List!20822)

(assert (=> d!116817 (= lt!438054 (ListLongMap!13622 lt!438051))))

(declare-fun lt!438052 () Unit!32656)

(declare-fun lt!438053 () Unit!32656)

(assert (=> d!116817 (= lt!438052 lt!438053)))

(assert (=> d!116817 (= (getValueByKey!515 lt!438051 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116817 (= lt!438053 (lemmaContainsTupThenGetReturnValue!272 lt!438051 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116817 (= lt!438051 (insertStrictlySorted!329 (toList!6826 call!41810) (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116817 (= (+!3102 call!41810 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438054)))

(declare-fun b!987868 () Bool)

(declare-fun res!660864 () Bool)

(assert (=> b!987868 (=> (not res!660864) (not e!557031))))

(assert (=> b!987868 (= res!660864 (= (getValueByKey!515 (toList!6826 lt!438054) (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!987869 () Bool)

(assert (=> b!987869 (= e!557031 (contains!5687 (toList!6826 lt!438054) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!116817 res!660865) b!987868))

(assert (= (and b!987868 res!660864) b!987869))

(declare-fun m!914187 () Bool)

(assert (=> d!116817 m!914187))

(declare-fun m!914189 () Bool)

(assert (=> d!116817 m!914189))

(declare-fun m!914191 () Bool)

(assert (=> d!116817 m!914191))

(declare-fun m!914193 () Bool)

(assert (=> d!116817 m!914193))

(declare-fun m!914195 () Bool)

(assert (=> b!987868 m!914195))

(declare-fun m!914197 () Bool)

(assert (=> b!987869 m!914197))

(assert (=> b!987729 d!116817))

(declare-fun d!116819 () Bool)

(declare-fun lt!438055 () Bool)

(assert (=> d!116819 (= lt!438055 (select (content!416 (toList!6826 lt!437894)) lt!437808))))

(declare-fun e!557033 () Bool)

(assert (=> d!116819 (= lt!438055 e!557033)))

(declare-fun res!660866 () Bool)

(assert (=> d!116819 (=> (not res!660866) (not e!557033))))

(assert (=> d!116819 (= res!660866 ((_ is Cons!20818) (toList!6826 lt!437894)))))

(assert (=> d!116819 (= (contains!5687 (toList!6826 lt!437894) lt!437808) lt!438055)))

(declare-fun b!987870 () Bool)

(declare-fun e!557032 () Bool)

(assert (=> b!987870 (= e!557033 e!557032)))

(declare-fun res!660867 () Bool)

(assert (=> b!987870 (=> res!660867 e!557032)))

(assert (=> b!987870 (= res!660867 (= (h!21980 (toList!6826 lt!437894)) lt!437808))))

(declare-fun b!987871 () Bool)

(assert (=> b!987871 (= e!557032 (contains!5687 (t!29746 (toList!6826 lt!437894)) lt!437808))))

(assert (= (and d!116819 res!660866) b!987870))

(assert (= (and b!987870 (not res!660867)) b!987871))

(declare-fun m!914199 () Bool)

(assert (=> d!116819 m!914199))

(declare-fun m!914201 () Bool)

(assert (=> d!116819 m!914201))

(declare-fun m!914203 () Bool)

(assert (=> b!987871 m!914203))

(assert (=> b!987683 d!116819))

(declare-fun d!116821 () Bool)

(declare-fun lt!438056 () Bool)

(assert (=> d!116821 (= lt!438056 (select (content!416 (toList!6826 lt!438031)) lt!437802))))

(declare-fun e!557035 () Bool)

(assert (=> d!116821 (= lt!438056 e!557035)))

(declare-fun res!660868 () Bool)

(assert (=> d!116821 (=> (not res!660868) (not e!557035))))

(assert (=> d!116821 (= res!660868 ((_ is Cons!20818) (toList!6826 lt!438031)))))

(assert (=> d!116821 (= (contains!5687 (toList!6826 lt!438031) lt!437802) lt!438056)))

(declare-fun b!987872 () Bool)

(declare-fun e!557034 () Bool)

(assert (=> b!987872 (= e!557035 e!557034)))

(declare-fun res!660869 () Bool)

(assert (=> b!987872 (=> res!660869 e!557034)))

(assert (=> b!987872 (= res!660869 (= (h!21980 (toList!6826 lt!438031)) lt!437802))))

(declare-fun b!987873 () Bool)

(assert (=> b!987873 (= e!557034 (contains!5687 (t!29746 (toList!6826 lt!438031)) lt!437802))))

(assert (= (and d!116821 res!660868) b!987872))

(assert (= (and b!987872 (not res!660869)) b!987873))

(declare-fun m!914205 () Bool)

(assert (=> d!116821 m!914205))

(declare-fun m!914207 () Bool)

(assert (=> d!116821 m!914207))

(declare-fun m!914209 () Bool)

(assert (=> b!987873 m!914209))

(assert (=> b!987821 d!116821))

(declare-fun d!116823 () Bool)

(declare-fun lt!438057 () Bool)

(assert (=> d!116823 (= lt!438057 (select (content!416 (toList!6826 lt!437993)) lt!437802))))

(declare-fun e!557037 () Bool)

(assert (=> d!116823 (= lt!438057 e!557037)))

(declare-fun res!660870 () Bool)

(assert (=> d!116823 (=> (not res!660870) (not e!557037))))

(assert (=> d!116823 (= res!660870 ((_ is Cons!20818) (toList!6826 lt!437993)))))

(assert (=> d!116823 (= (contains!5687 (toList!6826 lt!437993) lt!437802) lt!438057)))

(declare-fun b!987874 () Bool)

(declare-fun e!557036 () Bool)

(assert (=> b!987874 (= e!557037 e!557036)))

(declare-fun res!660871 () Bool)

(assert (=> b!987874 (=> res!660871 e!557036)))

(assert (=> b!987874 (= res!660871 (= (h!21980 (toList!6826 lt!437993)) lt!437802))))

(declare-fun b!987875 () Bool)

(assert (=> b!987875 (= e!557036 (contains!5687 (t!29746 (toList!6826 lt!437993)) lt!437802))))

(assert (= (and d!116823 res!660870) b!987874))

(assert (= (and b!987874 (not res!660871)) b!987875))

(declare-fun m!914211 () Bool)

(assert (=> d!116823 m!914211))

(declare-fun m!914213 () Bool)

(assert (=> d!116823 m!914213))

(declare-fun m!914215 () Bool)

(assert (=> b!987875 m!914215))

(assert (=> b!987771 d!116823))

(declare-fun d!116825 () Bool)

(declare-fun lt!438058 () Bool)

(assert (=> d!116825 (= lt!438058 (select (content!416 (toList!6826 lt!437964)) lt!437809))))

(declare-fun e!557039 () Bool)

(assert (=> d!116825 (= lt!438058 e!557039)))

(declare-fun res!660872 () Bool)

(assert (=> d!116825 (=> (not res!660872) (not e!557039))))

(assert (=> d!116825 (= res!660872 ((_ is Cons!20818) (toList!6826 lt!437964)))))

(assert (=> d!116825 (= (contains!5687 (toList!6826 lt!437964) lt!437809) lt!438058)))

(declare-fun b!987876 () Bool)

(declare-fun e!557038 () Bool)

(assert (=> b!987876 (= e!557039 e!557038)))

(declare-fun res!660873 () Bool)

(assert (=> b!987876 (=> res!660873 e!557038)))

(assert (=> b!987876 (= res!660873 (= (h!21980 (toList!6826 lt!437964)) lt!437809))))

(declare-fun b!987877 () Bool)

(assert (=> b!987877 (= e!557038 (contains!5687 (t!29746 (toList!6826 lt!437964)) lt!437809))))

(assert (= (and d!116825 res!660872) b!987876))

(assert (= (and b!987876 (not res!660873)) b!987877))

(declare-fun m!914217 () Bool)

(assert (=> d!116825 m!914217))

(declare-fun m!914219 () Bool)

(assert (=> d!116825 m!914219))

(declare-fun m!914221 () Bool)

(assert (=> b!987877 m!914221))

(assert (=> b!987748 d!116825))

(declare-fun d!116827 () Bool)

(declare-fun e!557040 () Bool)

(assert (=> d!116827 e!557040))

(declare-fun res!660875 () Bool)

(assert (=> d!116827 (=> (not res!660875) (not e!557040))))

(declare-fun lt!438062 () ListLongMap!13621)

(assert (=> d!116827 (= res!660875 (contains!5686 lt!438062 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438059 () List!20822)

(assert (=> d!116827 (= lt!438062 (ListLongMap!13622 lt!438059))))

(declare-fun lt!438060 () Unit!32656)

(declare-fun lt!438061 () Unit!32656)

(assert (=> d!116827 (= lt!438060 lt!438061)))

(assert (=> d!116827 (= (getValueByKey!515 lt!438059 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116827 (= lt!438061 (lemmaContainsTupThenGetReturnValue!272 lt!438059 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116827 (= lt!438059 (insertStrictlySorted!329 (toList!6826 call!41817) (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116827 (= (+!3102 call!41817 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438062)))

(declare-fun b!987878 () Bool)

(declare-fun res!660874 () Bool)

(assert (=> b!987878 (=> (not res!660874) (not e!557040))))

(assert (=> b!987878 (= res!660874 (= (getValueByKey!515 (toList!6826 lt!438062) (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!987879 () Bool)

(assert (=> b!987879 (= e!557040 (contains!5687 (toList!6826 lt!438062) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!116827 res!660875) b!987878))

(assert (= (and b!987878 res!660874) b!987879))

(declare-fun m!914223 () Bool)

(assert (=> d!116827 m!914223))

(declare-fun m!914225 () Bool)

(assert (=> d!116827 m!914225))

(declare-fun m!914227 () Bool)

(assert (=> d!116827 m!914227))

(declare-fun m!914229 () Bool)

(assert (=> d!116827 m!914229))

(declare-fun m!914231 () Bool)

(assert (=> b!987878 m!914231))

(declare-fun m!914233 () Bool)

(assert (=> b!987879 m!914233))

(assert (=> b!987752 d!116827))

(declare-fun d!116829 () Bool)

(assert (=> d!116829 (= (validKeyInArray!0 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987754 d!116829))

(declare-fun d!116831 () Bool)

(declare-fun e!557041 () Bool)

(assert (=> d!116831 e!557041))

(declare-fun res!660877 () Bool)

(assert (=> d!116831 (=> (not res!660877) (not e!557041))))

(declare-fun lt!438066 () ListLongMap!13621)

(assert (=> d!116831 (= res!660877 (contains!5686 lt!438066 (_1!7478 (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!438063 () List!20822)

(assert (=> d!116831 (= lt!438066 (ListLongMap!13622 lt!438063))))

(declare-fun lt!438064 () Unit!32656)

(declare-fun lt!438065 () Unit!32656)

(assert (=> d!116831 (= lt!438064 lt!438065)))

(assert (=> d!116831 (= (getValueByKey!515 lt!438063 (_1!7478 (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!520 (_2!7478 (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!116831 (= lt!438065 (lemmaContainsTupThenGetReturnValue!272 lt!438063 (_1!7478 (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7478 (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!116831 (= lt!438063 (insertStrictlySorted!329 (toList!6826 (ite c!100016 call!41812 (ite c!100020 call!41808 call!41811))) (_1!7478 (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7478 (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!116831 (= (+!3102 (ite c!100016 call!41812 (ite c!100020 call!41808 call!41811)) (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!438066)))

(declare-fun b!987880 () Bool)

(declare-fun res!660876 () Bool)

(assert (=> b!987880 (=> (not res!660876) (not e!557041))))

(assert (=> b!987880 (= res!660876 (= (getValueByKey!515 (toList!6826 lt!438066) (_1!7478 (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!520 (_2!7478 (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!987881 () Bool)

(assert (=> b!987881 (= e!557041 (contains!5687 (toList!6826 lt!438066) (ite (or c!100016 c!100020) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!116831 res!660877) b!987880))

(assert (= (and b!987880 res!660876) b!987881))

(declare-fun m!914235 () Bool)

(assert (=> d!116831 m!914235))

(declare-fun m!914237 () Bool)

(assert (=> d!116831 m!914237))

(declare-fun m!914239 () Bool)

(assert (=> d!116831 m!914239))

(declare-fun m!914241 () Bool)

(assert (=> d!116831 m!914241))

(declare-fun m!914243 () Bool)

(assert (=> b!987880 m!914243))

(declare-fun m!914245 () Bool)

(assert (=> b!987881 m!914245))

(assert (=> bm!41807 d!116831))

(assert (=> b!987808 d!116829))

(declare-fun d!116833 () Bool)

(declare-fun e!557042 () Bool)

(assert (=> d!116833 e!557042))

(declare-fun res!660879 () Bool)

(assert (=> d!116833 (=> (not res!660879) (not e!557042))))

(declare-fun lt!438070 () ListLongMap!13621)

(assert (=> d!116833 (= res!660879 (contains!5686 lt!438070 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438067 () List!20822)

(assert (=> d!116833 (= lt!438070 (ListLongMap!13622 lt!438067))))

(declare-fun lt!438068 () Unit!32656)

(declare-fun lt!438069 () Unit!32656)

(assert (=> d!116833 (= lt!438068 lt!438069)))

(assert (=> d!116833 (= (getValueByKey!515 lt!438067 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116833 (= lt!438069 (lemmaContainsTupThenGetReturnValue!272 lt!438067 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116833 (= lt!438067 (insertStrictlySorted!329 (toList!6826 (+!3102 lt!437801 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))) (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116833 (= (+!3102 (+!3102 lt!437801 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438070)))

(declare-fun b!987882 () Bool)

(declare-fun res!660878 () Bool)

(assert (=> b!987882 (=> (not res!660878) (not e!557042))))

(assert (=> b!987882 (= res!660878 (= (getValueByKey!515 (toList!6826 lt!438070) (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!987883 () Bool)

(assert (=> b!987883 (= e!557042 (contains!5687 (toList!6826 lt!438070) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!116833 res!660879) b!987882))

(assert (= (and b!987882 res!660878) b!987883))

(declare-fun m!914247 () Bool)

(assert (=> d!116833 m!914247))

(declare-fun m!914249 () Bool)

(assert (=> d!116833 m!914249))

(declare-fun m!914251 () Bool)

(assert (=> d!116833 m!914251))

(declare-fun m!914253 () Bool)

(assert (=> d!116833 m!914253))

(declare-fun m!914255 () Bool)

(assert (=> b!987882 m!914255))

(declare-fun m!914257 () Bool)

(assert (=> b!987883 m!914257))

(assert (=> d!116781 d!116833))

(declare-fun d!116835 () Bool)

(assert (=> d!116835 (= (+!3102 (+!3102 lt!437801 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (+!3102 (+!3102 lt!437801 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (=> d!116835 true))

(declare-fun _$28!184 () Unit!32656)

(assert (=> d!116835 (= (choose!1614 lt!437801 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30024 _keys!1544) from!1932) lt!437804) _$28!184)))

(declare-fun bs!28002 () Bool)

(assert (= bs!28002 d!116835))

(assert (=> bs!28002 m!914057))

(assert (=> bs!28002 m!914057))

(assert (=> bs!28002 m!914065))

(assert (=> bs!28002 m!914059))

(assert (=> bs!28002 m!914059))

(assert (=> bs!28002 m!914061))

(assert (=> d!116781 d!116835))

(declare-fun d!116837 () Bool)

(declare-fun e!557043 () Bool)

(assert (=> d!116837 e!557043))

(declare-fun res!660881 () Bool)

(assert (=> d!116837 (=> (not res!660881) (not e!557043))))

(declare-fun lt!438074 () ListLongMap!13621)

(assert (=> d!116837 (= res!660881 (contains!5686 lt!438074 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438071 () List!20822)

(assert (=> d!116837 (= lt!438074 (ListLongMap!13622 lt!438071))))

(declare-fun lt!438072 () Unit!32656)

(declare-fun lt!438073 () Unit!32656)

(assert (=> d!116837 (= lt!438072 lt!438073)))

(assert (=> d!116837 (= (getValueByKey!515 lt!438071 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116837 (= lt!438073 (lemmaContainsTupThenGetReturnValue!272 lt!438071 (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116837 (= lt!438071 (insertStrictlySorted!329 (toList!6826 lt!437801) (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!116837 (= (+!3102 lt!437801 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438074)))

(declare-fun b!987884 () Bool)

(declare-fun res!660880 () Bool)

(assert (=> b!987884 (=> (not res!660880) (not e!557043))))

(assert (=> b!987884 (= res!660880 (= (getValueByKey!515 (toList!6826 lt!438074) (_1!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!987885 () Bool)

(assert (=> b!987885 (= e!557043 (contains!5687 (toList!6826 lt!438074) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!116837 res!660881) b!987884))

(assert (= (and b!987884 res!660880) b!987885))

(declare-fun m!914259 () Bool)

(assert (=> d!116837 m!914259))

(declare-fun m!914261 () Bool)

(assert (=> d!116837 m!914261))

(declare-fun m!914263 () Bool)

(assert (=> d!116837 m!914263))

(declare-fun m!914265 () Bool)

(assert (=> d!116837 m!914265))

(declare-fun m!914267 () Bool)

(assert (=> b!987884 m!914267))

(declare-fun m!914269 () Bool)

(assert (=> b!987885 m!914269))

(assert (=> d!116781 d!116837))

(declare-fun d!116839 () Bool)

(declare-fun e!557044 () Bool)

(assert (=> d!116839 e!557044))

(declare-fun res!660883 () Bool)

(assert (=> d!116839 (=> (not res!660883) (not e!557044))))

(declare-fun lt!438078 () ListLongMap!13621)

(assert (=> d!116839 (= res!660883 (contains!5686 lt!438078 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(declare-fun lt!438075 () List!20822)

(assert (=> d!116839 (= lt!438078 (ListLongMap!13622 lt!438075))))

(declare-fun lt!438076 () Unit!32656)

(declare-fun lt!438077 () Unit!32656)

(assert (=> d!116839 (= lt!438076 lt!438077)))

(assert (=> d!116839 (= (getValueByKey!515 lt!438075 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))) (Some!520 (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116839 (= lt!438077 (lemmaContainsTupThenGetReturnValue!272 lt!438075 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116839 (= lt!438075 (insertStrictlySorted!329 (toList!6826 lt!437801) (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116839 (= (+!3102 lt!437801 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) lt!438078)))

(declare-fun b!987886 () Bool)

(declare-fun res!660882 () Bool)

(assert (=> b!987886 (=> (not res!660882) (not e!557044))))

(assert (=> b!987886 (= res!660882 (= (getValueByKey!515 (toList!6826 lt!438078) (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))) (Some!520 (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)))))))

(declare-fun b!987887 () Bool)

(assert (=> b!987887 (= e!557044 (contains!5687 (toList!6826 lt!438078) (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)))))

(assert (= (and d!116839 res!660883) b!987886))

(assert (= (and b!987886 res!660882) b!987887))

(declare-fun m!914271 () Bool)

(assert (=> d!116839 m!914271))

(declare-fun m!914273 () Bool)

(assert (=> d!116839 m!914273))

(declare-fun m!914275 () Bool)

(assert (=> d!116839 m!914275))

(declare-fun m!914277 () Bool)

(assert (=> d!116839 m!914277))

(declare-fun m!914279 () Bool)

(assert (=> b!987886 m!914279))

(declare-fun m!914281 () Bool)

(assert (=> b!987887 m!914281))

(assert (=> d!116781 d!116839))

(declare-fun d!116841 () Bool)

(declare-fun e!557045 () Bool)

(assert (=> d!116841 e!557045))

(declare-fun res!660885 () Bool)

(assert (=> d!116841 (=> (not res!660885) (not e!557045))))

(declare-fun lt!438082 () ListLongMap!13621)

(assert (=> d!116841 (= res!660885 (contains!5686 lt!438082 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(declare-fun lt!438079 () List!20822)

(assert (=> d!116841 (= lt!438082 (ListLongMap!13622 lt!438079))))

(declare-fun lt!438080 () Unit!32656)

(declare-fun lt!438081 () Unit!32656)

(assert (=> d!116841 (= lt!438080 lt!438081)))

(assert (=> d!116841 (= (getValueByKey!515 lt!438079 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))) (Some!520 (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116841 (= lt!438081 (lemmaContainsTupThenGetReturnValue!272 lt!438079 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116841 (= lt!438079 (insertStrictlySorted!329 (toList!6826 (+!3102 lt!437801 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116841 (= (+!3102 (+!3102 lt!437801 (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) lt!438082)))

(declare-fun b!987888 () Bool)

(declare-fun res!660884 () Bool)

(assert (=> b!987888 (=> (not res!660884) (not e!557045))))

(assert (=> b!987888 (= res!660884 (= (getValueByKey!515 (toList!6826 lt!438082) (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))) (Some!520 (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)))))))

(declare-fun b!987889 () Bool)

(assert (=> b!987889 (= e!557045 (contains!5687 (toList!6826 lt!438082) (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)))))

(assert (= (and d!116841 res!660885) b!987888))

(assert (= (and b!987888 res!660884) b!987889))

(declare-fun m!914283 () Bool)

(assert (=> d!116841 m!914283))

(declare-fun m!914285 () Bool)

(assert (=> d!116841 m!914285))

(declare-fun m!914287 () Bool)

(assert (=> d!116841 m!914287))

(declare-fun m!914289 () Bool)

(assert (=> d!116841 m!914289))

(declare-fun m!914291 () Bool)

(assert (=> b!987888 m!914291))

(declare-fun m!914293 () Bool)

(assert (=> b!987889 m!914293))

(assert (=> d!116781 d!116841))

(declare-fun d!116843 () Bool)

(declare-fun e!557051 () Bool)

(assert (=> d!116843 e!557051))

(declare-fun res!660888 () Bool)

(assert (=> d!116843 (=> res!660888 e!557051)))

(declare-fun lt!438092 () Bool)

(assert (=> d!116843 (= res!660888 (not lt!438092))))

(declare-fun lt!438094 () Bool)

(assert (=> d!116843 (= lt!438092 lt!438094)))

(declare-fun lt!438091 () Unit!32656)

(declare-fun e!557050 () Unit!32656)

(assert (=> d!116843 (= lt!438091 e!557050)))

(declare-fun c!100055 () Bool)

(assert (=> d!116843 (= c!100055 lt!438094)))

(declare-fun containsKey!477 (List!20822 (_ BitVec 64)) Bool)

(assert (=> d!116843 (= lt!438094 (containsKey!477 (toList!6826 lt!438013) (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!116843 (= (contains!5686 lt!438013 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!438092)))

(declare-fun b!987896 () Bool)

(declare-fun lt!438093 () Unit!32656)

(assert (=> b!987896 (= e!557050 lt!438093)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!372 (List!20822 (_ BitVec 64)) Unit!32656)

(assert (=> b!987896 (= lt!438093 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!438013) (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun isDefined!385 (Option!521) Bool)

(assert (=> b!987896 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438013) (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!987897 () Bool)

(declare-fun Unit!32662 () Unit!32656)

(assert (=> b!987897 (= e!557050 Unit!32662)))

(declare-fun b!987898 () Bool)

(assert (=> b!987898 (= e!557051 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438013) (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!116843 c!100055) b!987896))

(assert (= (and d!116843 (not c!100055)) b!987897))

(assert (= (and d!116843 (not res!660888)) b!987898))

(assert (=> d!116843 m!913977))

(declare-fun m!914295 () Bool)

(assert (=> d!116843 m!914295))

(assert (=> b!987896 m!913977))

(declare-fun m!914297 () Bool)

(assert (=> b!987896 m!914297))

(assert (=> b!987896 m!913977))

(assert (=> b!987896 m!914143))

(assert (=> b!987896 m!914143))

(declare-fun m!914299 () Bool)

(assert (=> b!987896 m!914299))

(assert (=> b!987898 m!913977))

(assert (=> b!987898 m!914143))

(assert (=> b!987898 m!914143))

(assert (=> b!987898 m!914299))

(assert (=> b!987810 d!116843))

(declare-fun d!116845 () Bool)

(declare-fun lt!438095 () Bool)

(assert (=> d!116845 (= lt!438095 (select (content!416 (toList!6826 lt!438019)) lt!437809))))

(declare-fun e!557053 () Bool)

(assert (=> d!116845 (= lt!438095 e!557053)))

(declare-fun res!660889 () Bool)

(assert (=> d!116845 (=> (not res!660889) (not e!557053))))

(assert (=> d!116845 (= res!660889 ((_ is Cons!20818) (toList!6826 lt!438019)))))

(assert (=> d!116845 (= (contains!5687 (toList!6826 lt!438019) lt!437809) lt!438095)))

(declare-fun b!987899 () Bool)

(declare-fun e!557052 () Bool)

(assert (=> b!987899 (= e!557053 e!557052)))

(declare-fun res!660890 () Bool)

(assert (=> b!987899 (=> res!660890 e!557052)))

(assert (=> b!987899 (= res!660890 (= (h!21980 (toList!6826 lt!438019)) lt!437809))))

(declare-fun b!987900 () Bool)

(assert (=> b!987900 (= e!557052 (contains!5687 (t!29746 (toList!6826 lt!438019)) lt!437809))))

(assert (= (and d!116845 res!660889) b!987899))

(assert (= (and b!987899 (not res!660890)) b!987900))

(declare-fun m!914301 () Bool)

(assert (=> d!116845 m!914301))

(declare-fun m!914303 () Bool)

(assert (=> d!116845 m!914303))

(declare-fun m!914305 () Bool)

(assert (=> b!987900 m!914305))

(assert (=> b!987815 d!116845))

(declare-fun d!116847 () Bool)

(declare-fun lt!438096 () Bool)

(assert (=> d!116847 (= lt!438096 (select (content!416 (toList!6826 lt!438023)) lt!437809))))

(declare-fun e!557055 () Bool)

(assert (=> d!116847 (= lt!438096 e!557055)))

(declare-fun res!660891 () Bool)

(assert (=> d!116847 (=> (not res!660891) (not e!557055))))

(assert (=> d!116847 (= res!660891 ((_ is Cons!20818) (toList!6826 lt!438023)))))

(assert (=> d!116847 (= (contains!5687 (toList!6826 lt!438023) lt!437809) lt!438096)))

(declare-fun b!987901 () Bool)

(declare-fun e!557054 () Bool)

(assert (=> b!987901 (= e!557055 e!557054)))

(declare-fun res!660892 () Bool)

(assert (=> b!987901 (=> res!660892 e!557054)))

(assert (=> b!987901 (= res!660892 (= (h!21980 (toList!6826 lt!438023)) lt!437809))))

(declare-fun b!987902 () Bool)

(assert (=> b!987902 (= e!557054 (contains!5687 (t!29746 (toList!6826 lt!438023)) lt!437809))))

(assert (= (and d!116847 res!660891) b!987901))

(assert (= (and b!987901 (not res!660892)) b!987902))

(declare-fun m!914307 () Bool)

(assert (=> d!116847 m!914307))

(declare-fun m!914309 () Bool)

(assert (=> d!116847 m!914309))

(declare-fun m!914311 () Bool)

(assert (=> b!987902 m!914311))

(assert (=> b!987817 d!116847))

(assert (=> bm!41811 d!116783))

(declare-fun d!116849 () Bool)

(declare-fun e!557057 () Bool)

(assert (=> d!116849 e!557057))

(declare-fun res!660893 () Bool)

(assert (=> d!116849 (=> res!660893 e!557057)))

(declare-fun lt!438098 () Bool)

(assert (=> d!116849 (= res!660893 (not lt!438098))))

(declare-fun lt!438100 () Bool)

(assert (=> d!116849 (= lt!438098 lt!438100)))

(declare-fun lt!438097 () Unit!32656)

(declare-fun e!557056 () Unit!32656)

(assert (=> d!116849 (= lt!438097 e!557056)))

(declare-fun c!100056 () Bool)

(assert (=> d!116849 (= c!100056 lt!438100)))

(assert (=> d!116849 (= lt!438100 (containsKey!477 (toList!6826 lt!438023) (_1!7478 lt!437809)))))

(assert (=> d!116849 (= (contains!5686 lt!438023 (_1!7478 lt!437809)) lt!438098)))

(declare-fun b!987903 () Bool)

(declare-fun lt!438099 () Unit!32656)

(assert (=> b!987903 (= e!557056 lt!438099)))

(assert (=> b!987903 (= lt!438099 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!438023) (_1!7478 lt!437809)))))

(assert (=> b!987903 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438023) (_1!7478 lt!437809)))))

(declare-fun b!987904 () Bool)

(declare-fun Unit!32663 () Unit!32656)

(assert (=> b!987904 (= e!557056 Unit!32663)))

(declare-fun b!987905 () Bool)

(assert (=> b!987905 (= e!557057 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438023) (_1!7478 lt!437809))))))

(assert (= (and d!116849 c!100056) b!987903))

(assert (= (and d!116849 (not c!100056)) b!987904))

(assert (= (and d!116849 (not res!660893)) b!987905))

(declare-fun m!914313 () Bool)

(assert (=> d!116849 m!914313))

(declare-fun m!914315 () Bool)

(assert (=> b!987903 m!914315))

(assert (=> b!987903 m!914107))

(assert (=> b!987903 m!914107))

(declare-fun m!914317 () Bool)

(assert (=> b!987903 m!914317))

(assert (=> b!987905 m!914107))

(assert (=> b!987905 m!914107))

(assert (=> b!987905 m!914317))

(assert (=> d!116787 d!116849))

(declare-fun b!987915 () Bool)

(declare-fun e!557062 () Option!521)

(declare-fun e!557063 () Option!521)

(assert (=> b!987915 (= e!557062 e!557063)))

(declare-fun c!100062 () Bool)

(assert (=> b!987915 (= c!100062 (and ((_ is Cons!20818) lt!438020) (not (= (_1!7478 (h!21980 lt!438020)) (_1!7478 lt!437809)))))))

(declare-fun b!987916 () Bool)

(assert (=> b!987916 (= e!557063 (getValueByKey!515 (t!29746 lt!438020) (_1!7478 lt!437809)))))

(declare-fun b!987917 () Bool)

(assert (=> b!987917 (= e!557063 None!519)))

(declare-fun d!116851 () Bool)

(declare-fun c!100061 () Bool)

(assert (=> d!116851 (= c!100061 (and ((_ is Cons!20818) lt!438020) (= (_1!7478 (h!21980 lt!438020)) (_1!7478 lt!437809))))))

(assert (=> d!116851 (= (getValueByKey!515 lt!438020 (_1!7478 lt!437809)) e!557062)))

(declare-fun b!987914 () Bool)

(assert (=> b!987914 (= e!557062 (Some!520 (_2!7478 (h!21980 lt!438020))))))

(assert (= (and d!116851 c!100061) b!987914))

(assert (= (and d!116851 (not c!100061)) b!987915))

(assert (= (and b!987915 c!100062) b!987916))

(assert (= (and b!987915 (not c!100062)) b!987917))

(declare-fun m!914319 () Bool)

(assert (=> b!987916 m!914319))

(assert (=> d!116787 d!116851))

(declare-fun d!116853 () Bool)

(assert (=> d!116853 (= (getValueByKey!515 lt!438020 (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809)))))

(declare-fun lt!438103 () Unit!32656)

(declare-fun choose!1615 (List!20822 (_ BitVec 64) V!35945) Unit!32656)

(assert (=> d!116853 (= lt!438103 (choose!1615 lt!438020 (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(declare-fun e!557066 () Bool)

(assert (=> d!116853 e!557066))

(declare-fun res!660898 () Bool)

(assert (=> d!116853 (=> (not res!660898) (not e!557066))))

(declare-fun isStrictlySorted!511 (List!20822) Bool)

(assert (=> d!116853 (= res!660898 (isStrictlySorted!511 lt!438020))))

(assert (=> d!116853 (= (lemmaContainsTupThenGetReturnValue!272 lt!438020 (_1!7478 lt!437809) (_2!7478 lt!437809)) lt!438103)))

(declare-fun b!987922 () Bool)

(declare-fun res!660899 () Bool)

(assert (=> b!987922 (=> (not res!660899) (not e!557066))))

(assert (=> b!987922 (= res!660899 (containsKey!477 lt!438020 (_1!7478 lt!437809)))))

(declare-fun b!987923 () Bool)

(assert (=> b!987923 (= e!557066 (contains!5687 lt!438020 (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809))))))

(assert (= (and d!116853 res!660898) b!987922))

(assert (= (and b!987922 res!660899) b!987923))

(assert (=> d!116853 m!914101))

(declare-fun m!914321 () Bool)

(assert (=> d!116853 m!914321))

(declare-fun m!914323 () Bool)

(assert (=> d!116853 m!914323))

(declare-fun m!914325 () Bool)

(assert (=> b!987922 m!914325))

(declare-fun m!914327 () Bool)

(assert (=> b!987923 m!914327))

(assert (=> d!116787 d!116853))

(declare-fun b!987944 () Bool)

(declare-fun e!557079 () List!20822)

(declare-fun call!41832 () List!20822)

(assert (=> b!987944 (= e!557079 call!41832)))

(declare-fun b!987945 () Bool)

(declare-fun e!557080 () List!20822)

(assert (=> b!987945 (= e!557080 (insertStrictlySorted!329 (t!29746 (toList!6826 lt!437803)) (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(declare-fun b!987946 () Bool)

(declare-fun e!557078 () List!20822)

(assert (=> b!987946 (= e!557078 e!557079)))

(declare-fun c!100072 () Bool)

(assert (=> b!987946 (= c!100072 (and ((_ is Cons!20818) (toList!6826 lt!437803)) (= (_1!7478 (h!21980 (toList!6826 lt!437803))) (_1!7478 lt!437809))))))

(declare-fun b!987947 () Bool)

(declare-fun res!660904 () Bool)

(declare-fun e!557081 () Bool)

(assert (=> b!987947 (=> (not res!660904) (not e!557081))))

(declare-fun lt!438106 () List!20822)

(assert (=> b!987947 (= res!660904 (containsKey!477 lt!438106 (_1!7478 lt!437809)))))

(declare-fun b!987948 () Bool)

(declare-fun call!41830 () List!20822)

(assert (=> b!987948 (= e!557078 call!41830)))

(declare-fun d!116855 () Bool)

(assert (=> d!116855 e!557081))

(declare-fun res!660905 () Bool)

(assert (=> d!116855 (=> (not res!660905) (not e!557081))))

(assert (=> d!116855 (= res!660905 (isStrictlySorted!511 lt!438106))))

(assert (=> d!116855 (= lt!438106 e!557078)))

(declare-fun c!100071 () Bool)

(assert (=> d!116855 (= c!100071 (and ((_ is Cons!20818) (toList!6826 lt!437803)) (bvslt (_1!7478 (h!21980 (toList!6826 lt!437803))) (_1!7478 lt!437809))))))

(assert (=> d!116855 (isStrictlySorted!511 (toList!6826 lt!437803))))

(assert (=> d!116855 (= (insertStrictlySorted!329 (toList!6826 lt!437803) (_1!7478 lt!437809) (_2!7478 lt!437809)) lt!438106)))

(declare-fun b!987949 () Bool)

(declare-fun c!100074 () Bool)

(assert (=> b!987949 (= c!100074 (and ((_ is Cons!20818) (toList!6826 lt!437803)) (bvsgt (_1!7478 (h!21980 (toList!6826 lt!437803))) (_1!7478 lt!437809))))))

(declare-fun e!557077 () List!20822)

(assert (=> b!987949 (= e!557079 e!557077)))

(declare-fun b!987950 () Bool)

(declare-fun call!41831 () List!20822)

(assert (=> b!987950 (= e!557077 call!41831)))

(declare-fun b!987951 () Bool)

(assert (=> b!987951 (= e!557080 (ite c!100072 (t!29746 (toList!6826 lt!437803)) (ite c!100074 (Cons!20818 (h!21980 (toList!6826 lt!437803)) (t!29746 (toList!6826 lt!437803))) Nil!20819)))))

(declare-fun bm!41827 () Bool)

(assert (=> bm!41827 (= call!41831 call!41832)))

(declare-fun bm!41828 () Bool)

(assert (=> bm!41828 (= call!41832 call!41830)))

(declare-fun bm!41829 () Bool)

(declare-fun $colon$colon!555 (List!20822 tuple2!14934) List!20822)

(assert (=> bm!41829 (= call!41830 ($colon$colon!555 e!557080 (ite c!100071 (h!21980 (toList!6826 lt!437803)) (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809)))))))

(declare-fun c!100073 () Bool)

(assert (=> bm!41829 (= c!100073 c!100071)))

(declare-fun b!987952 () Bool)

(assert (=> b!987952 (= e!557077 call!41831)))

(declare-fun b!987953 () Bool)

(assert (=> b!987953 (= e!557081 (contains!5687 lt!438106 (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809))))))

(assert (= (and d!116855 c!100071) b!987948))

(assert (= (and d!116855 (not c!100071)) b!987946))

(assert (= (and b!987946 c!100072) b!987944))

(assert (= (and b!987946 (not c!100072)) b!987949))

(assert (= (and b!987949 c!100074) b!987952))

(assert (= (and b!987949 (not c!100074)) b!987950))

(assert (= (or b!987952 b!987950) bm!41827))

(assert (= (or b!987944 bm!41827) bm!41828))

(assert (= (or b!987948 bm!41828) bm!41829))

(assert (= (and bm!41829 c!100073) b!987945))

(assert (= (and bm!41829 (not c!100073)) b!987951))

(assert (= (and d!116855 res!660905) b!987947))

(assert (= (and b!987947 res!660904) b!987953))

(declare-fun m!914329 () Bool)

(assert (=> b!987953 m!914329))

(declare-fun m!914331 () Bool)

(assert (=> bm!41829 m!914331))

(declare-fun m!914333 () Bool)

(assert (=> b!987945 m!914333))

(declare-fun m!914335 () Bool)

(assert (=> d!116855 m!914335))

(declare-fun m!914337 () Bool)

(assert (=> d!116855 m!914337))

(declare-fun m!914339 () Bool)

(assert (=> b!987947 m!914339))

(assert (=> d!116787 d!116855))

(declare-fun d!116857 () Bool)

(assert (=> d!116857 (= (get!15594 (select (arr!30023 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14224 (select (arr!30023 _values!1278) from!1932)))))

(assert (=> b!987776 d!116857))

(declare-fun d!116859 () Bool)

(declare-fun e!557083 () Bool)

(assert (=> d!116859 e!557083))

(declare-fun res!660906 () Bool)

(assert (=> d!116859 (=> res!660906 e!557083)))

(declare-fun lt!438108 () Bool)

(assert (=> d!116859 (= res!660906 (not lt!438108))))

(declare-fun lt!438110 () Bool)

(assert (=> d!116859 (= lt!438108 lt!438110)))

(declare-fun lt!438107 () Unit!32656)

(declare-fun e!557082 () Unit!32656)

(assert (=> d!116859 (= lt!438107 e!557082)))

(declare-fun c!100075 () Bool)

(assert (=> d!116859 (= c!100075 lt!438110)))

(assert (=> d!116859 (= lt!438110 (containsKey!477 (toList!6826 lt!437973) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116859 (= (contains!5686 lt!437973 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438108)))

(declare-fun b!987954 () Bool)

(declare-fun lt!438109 () Unit!32656)

(assert (=> b!987954 (= e!557082 lt!438109)))

(assert (=> b!987954 (= lt!438109 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!437973) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!987954 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437973) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!987955 () Bool)

(declare-fun Unit!32664 () Unit!32656)

(assert (=> b!987955 (= e!557082 Unit!32664)))

(declare-fun b!987956 () Bool)

(assert (=> b!987956 (= e!557083 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437973) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116859 c!100075) b!987954))

(assert (= (and d!116859 (not c!100075)) b!987955))

(assert (= (and d!116859 (not res!660906)) b!987956))

(declare-fun m!914341 () Bool)

(assert (=> d!116859 m!914341))

(declare-fun m!914343 () Bool)

(assert (=> b!987954 m!914343))

(declare-fun m!914345 () Bool)

(assert (=> b!987954 m!914345))

(assert (=> b!987954 m!914345))

(declare-fun m!914347 () Bool)

(assert (=> b!987954 m!914347))

(assert (=> b!987956 m!914345))

(assert (=> b!987956 m!914345))

(assert (=> b!987956 m!914347))

(assert (=> bm!41816 d!116859))

(declare-fun d!116861 () Bool)

(declare-fun e!557085 () Bool)

(assert (=> d!116861 e!557085))

(declare-fun res!660907 () Bool)

(assert (=> d!116861 (=> res!660907 e!557085)))

(declare-fun lt!438112 () Bool)

(assert (=> d!116861 (= res!660907 (not lt!438112))))

(declare-fun lt!438114 () Bool)

(assert (=> d!116861 (= lt!438112 lt!438114)))

(declare-fun lt!438111 () Unit!32656)

(declare-fun e!557084 () Unit!32656)

(assert (=> d!116861 (= lt!438111 e!557084)))

(declare-fun c!100076 () Bool)

(assert (=> d!116861 (= c!100076 lt!438114)))

(assert (=> d!116861 (= lt!438114 (containsKey!477 (toList!6826 lt!438027) (_1!7478 lt!437808)))))

(assert (=> d!116861 (= (contains!5686 lt!438027 (_1!7478 lt!437808)) lt!438112)))

(declare-fun b!987957 () Bool)

(declare-fun lt!438113 () Unit!32656)

(assert (=> b!987957 (= e!557084 lt!438113)))

(assert (=> b!987957 (= lt!438113 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!438027) (_1!7478 lt!437808)))))

(assert (=> b!987957 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438027) (_1!7478 lt!437808)))))

(declare-fun b!987958 () Bool)

(declare-fun Unit!32665 () Unit!32656)

(assert (=> b!987958 (= e!557084 Unit!32665)))

(declare-fun b!987959 () Bool)

(assert (=> b!987959 (= e!557085 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438027) (_1!7478 lt!437808))))))

(assert (= (and d!116861 c!100076) b!987957))

(assert (= (and d!116861 (not c!100076)) b!987958))

(assert (= (and d!116861 (not res!660907)) b!987959))

(declare-fun m!914349 () Bool)

(assert (=> d!116861 m!914349))

(declare-fun m!914351 () Bool)

(assert (=> b!987957 m!914351))

(assert (=> b!987957 m!914119))

(assert (=> b!987957 m!914119))

(declare-fun m!914353 () Bool)

(assert (=> b!987957 m!914353))

(assert (=> b!987959 m!914119))

(assert (=> b!987959 m!914119))

(assert (=> b!987959 m!914353))

(assert (=> d!116789 d!116861))

(declare-fun b!987961 () Bool)

(declare-fun e!557086 () Option!521)

(declare-fun e!557087 () Option!521)

(assert (=> b!987961 (= e!557086 e!557087)))

(declare-fun c!100078 () Bool)

(assert (=> b!987961 (= c!100078 (and ((_ is Cons!20818) lt!438024) (not (= (_1!7478 (h!21980 lt!438024)) (_1!7478 lt!437808)))))))

(declare-fun b!987962 () Bool)

(assert (=> b!987962 (= e!557087 (getValueByKey!515 (t!29746 lt!438024) (_1!7478 lt!437808)))))

(declare-fun b!987963 () Bool)

(assert (=> b!987963 (= e!557087 None!519)))

(declare-fun d!116863 () Bool)

(declare-fun c!100077 () Bool)

(assert (=> d!116863 (= c!100077 (and ((_ is Cons!20818) lt!438024) (= (_1!7478 (h!21980 lt!438024)) (_1!7478 lt!437808))))))

(assert (=> d!116863 (= (getValueByKey!515 lt!438024 (_1!7478 lt!437808)) e!557086)))

(declare-fun b!987960 () Bool)

(assert (=> b!987960 (= e!557086 (Some!520 (_2!7478 (h!21980 lt!438024))))))

(assert (= (and d!116863 c!100077) b!987960))

(assert (= (and d!116863 (not c!100077)) b!987961))

(assert (= (and b!987961 c!100078) b!987962))

(assert (= (and b!987961 (not c!100078)) b!987963))

(declare-fun m!914355 () Bool)

(assert (=> b!987962 m!914355))

(assert (=> d!116789 d!116863))

(declare-fun d!116865 () Bool)

(assert (=> d!116865 (= (getValueByKey!515 lt!438024 (_1!7478 lt!437808)) (Some!520 (_2!7478 lt!437808)))))

(declare-fun lt!438115 () Unit!32656)

(assert (=> d!116865 (= lt!438115 (choose!1615 lt!438024 (_1!7478 lt!437808) (_2!7478 lt!437808)))))

(declare-fun e!557088 () Bool)

(assert (=> d!116865 e!557088))

(declare-fun res!660908 () Bool)

(assert (=> d!116865 (=> (not res!660908) (not e!557088))))

(assert (=> d!116865 (= res!660908 (isStrictlySorted!511 lt!438024))))

(assert (=> d!116865 (= (lemmaContainsTupThenGetReturnValue!272 lt!438024 (_1!7478 lt!437808) (_2!7478 lt!437808)) lt!438115)))

(declare-fun b!987964 () Bool)

(declare-fun res!660909 () Bool)

(assert (=> b!987964 (=> (not res!660909) (not e!557088))))

(assert (=> b!987964 (= res!660909 (containsKey!477 lt!438024 (_1!7478 lt!437808)))))

(declare-fun b!987965 () Bool)

(assert (=> b!987965 (= e!557088 (contains!5687 lt!438024 (tuple2!14935 (_1!7478 lt!437808) (_2!7478 lt!437808))))))

(assert (= (and d!116865 res!660908) b!987964))

(assert (= (and b!987964 res!660909) b!987965))

(assert (=> d!116865 m!914113))

(declare-fun m!914357 () Bool)

(assert (=> d!116865 m!914357))

(declare-fun m!914359 () Bool)

(assert (=> d!116865 m!914359))

(declare-fun m!914361 () Bool)

(assert (=> b!987964 m!914361))

(declare-fun m!914363 () Bool)

(assert (=> b!987965 m!914363))

(assert (=> d!116789 d!116865))

(declare-fun b!987966 () Bool)

(declare-fun e!557091 () List!20822)

(declare-fun call!41835 () List!20822)

(assert (=> b!987966 (= e!557091 call!41835)))

(declare-fun b!987967 () Bool)

(declare-fun e!557092 () List!20822)

(assert (=> b!987967 (= e!557092 (insertStrictlySorted!329 (t!29746 (toList!6826 lt!437806)) (_1!7478 lt!437808) (_2!7478 lt!437808)))))

(declare-fun b!987968 () Bool)

(declare-fun e!557090 () List!20822)

(assert (=> b!987968 (= e!557090 e!557091)))

(declare-fun c!100080 () Bool)

(assert (=> b!987968 (= c!100080 (and ((_ is Cons!20818) (toList!6826 lt!437806)) (= (_1!7478 (h!21980 (toList!6826 lt!437806))) (_1!7478 lt!437808))))))

(declare-fun b!987969 () Bool)

(declare-fun res!660910 () Bool)

(declare-fun e!557093 () Bool)

(assert (=> b!987969 (=> (not res!660910) (not e!557093))))

(declare-fun lt!438116 () List!20822)

(assert (=> b!987969 (= res!660910 (containsKey!477 lt!438116 (_1!7478 lt!437808)))))

(declare-fun b!987970 () Bool)

(declare-fun call!41833 () List!20822)

(assert (=> b!987970 (= e!557090 call!41833)))

(declare-fun d!116867 () Bool)

(assert (=> d!116867 e!557093))

(declare-fun res!660911 () Bool)

(assert (=> d!116867 (=> (not res!660911) (not e!557093))))

(assert (=> d!116867 (= res!660911 (isStrictlySorted!511 lt!438116))))

(assert (=> d!116867 (= lt!438116 e!557090)))

(declare-fun c!100079 () Bool)

(assert (=> d!116867 (= c!100079 (and ((_ is Cons!20818) (toList!6826 lt!437806)) (bvslt (_1!7478 (h!21980 (toList!6826 lt!437806))) (_1!7478 lt!437808))))))

(assert (=> d!116867 (isStrictlySorted!511 (toList!6826 lt!437806))))

(assert (=> d!116867 (= (insertStrictlySorted!329 (toList!6826 lt!437806) (_1!7478 lt!437808) (_2!7478 lt!437808)) lt!438116)))

(declare-fun b!987971 () Bool)

(declare-fun c!100082 () Bool)

(assert (=> b!987971 (= c!100082 (and ((_ is Cons!20818) (toList!6826 lt!437806)) (bvsgt (_1!7478 (h!21980 (toList!6826 lt!437806))) (_1!7478 lt!437808))))))

(declare-fun e!557089 () List!20822)

(assert (=> b!987971 (= e!557091 e!557089)))

(declare-fun b!987972 () Bool)

(declare-fun call!41834 () List!20822)

(assert (=> b!987972 (= e!557089 call!41834)))

(declare-fun b!987973 () Bool)

(assert (=> b!987973 (= e!557092 (ite c!100080 (t!29746 (toList!6826 lt!437806)) (ite c!100082 (Cons!20818 (h!21980 (toList!6826 lt!437806)) (t!29746 (toList!6826 lt!437806))) Nil!20819)))))

(declare-fun bm!41830 () Bool)

(assert (=> bm!41830 (= call!41834 call!41835)))

(declare-fun bm!41831 () Bool)

(assert (=> bm!41831 (= call!41835 call!41833)))

(declare-fun bm!41832 () Bool)

(assert (=> bm!41832 (= call!41833 ($colon$colon!555 e!557092 (ite c!100079 (h!21980 (toList!6826 lt!437806)) (tuple2!14935 (_1!7478 lt!437808) (_2!7478 lt!437808)))))))

(declare-fun c!100081 () Bool)

(assert (=> bm!41832 (= c!100081 c!100079)))

(declare-fun b!987974 () Bool)

(assert (=> b!987974 (= e!557089 call!41834)))

(declare-fun b!987975 () Bool)

(assert (=> b!987975 (= e!557093 (contains!5687 lt!438116 (tuple2!14935 (_1!7478 lt!437808) (_2!7478 lt!437808))))))

(assert (= (and d!116867 c!100079) b!987970))

(assert (= (and d!116867 (not c!100079)) b!987968))

(assert (= (and b!987968 c!100080) b!987966))

(assert (= (and b!987968 (not c!100080)) b!987971))

(assert (= (and b!987971 c!100082) b!987974))

(assert (= (and b!987971 (not c!100082)) b!987972))

(assert (= (or b!987974 b!987972) bm!41830))

(assert (= (or b!987966 bm!41830) bm!41831))

(assert (= (or b!987970 bm!41831) bm!41832))

(assert (= (and bm!41832 c!100081) b!987967))

(assert (= (and bm!41832 (not c!100081)) b!987973))

(assert (= (and d!116867 res!660911) b!987969))

(assert (= (and b!987969 res!660910) b!987975))

(declare-fun m!914365 () Bool)

(assert (=> b!987975 m!914365))

(declare-fun m!914367 () Bool)

(assert (=> bm!41832 m!914367))

(declare-fun m!914369 () Bool)

(assert (=> b!987967 m!914369))

(declare-fun m!914371 () Bool)

(assert (=> d!116867 m!914371))

(declare-fun m!914373 () Bool)

(assert (=> d!116867 m!914373))

(declare-fun m!914375 () Bool)

(assert (=> b!987969 m!914375))

(assert (=> d!116789 d!116867))

(declare-fun d!116869 () Bool)

(assert (=> d!116869 (= (+!3102 (+!3102 lt!437806 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (+!3102 (+!3102 lt!437806 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (=> d!116869 true))

(declare-fun _$28!185 () Unit!32656)

(assert (=> d!116869 (= (choose!1614 lt!437806 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30024 _keys!1544) from!1932) lt!437804) _$28!185)))

(declare-fun bs!28003 () Bool)

(assert (= bs!28003 d!116869))

(assert (=> bs!28003 m!914031))

(assert (=> bs!28003 m!914031))

(assert (=> bs!28003 m!914039))

(assert (=> bs!28003 m!914033))

(assert (=> bs!28003 m!914033))

(assert (=> bs!28003 m!914035))

(assert (=> d!116775 d!116869))

(declare-fun d!116871 () Bool)

(declare-fun e!557094 () Bool)

(assert (=> d!116871 e!557094))

(declare-fun res!660913 () Bool)

(assert (=> d!116871 (=> (not res!660913) (not e!557094))))

(declare-fun lt!438120 () ListLongMap!13621)

(assert (=> d!116871 (= res!660913 (contains!5686 lt!438120 (_1!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!438117 () List!20822)

(assert (=> d!116871 (= lt!438120 (ListLongMap!13622 lt!438117))))

(declare-fun lt!438118 () Unit!32656)

(declare-fun lt!438119 () Unit!32656)

(assert (=> d!116871 (= lt!438118 lt!438119)))

(assert (=> d!116871 (= (getValueByKey!515 lt!438117 (_1!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116871 (= lt!438119 (lemmaContainsTupThenGetReturnValue!272 lt!438117 (_1!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116871 (= lt!438117 (insertStrictlySorted!329 (toList!6826 lt!437806) (_1!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116871 (= (+!3102 lt!437806 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!438120)))

(declare-fun b!987976 () Bool)

(declare-fun res!660912 () Bool)

(assert (=> b!987976 (=> (not res!660912) (not e!557094))))

(assert (=> b!987976 (= res!660912 (= (getValueByKey!515 (toList!6826 lt!438120) (_1!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!987977 () Bool)

(assert (=> b!987977 (= e!557094 (contains!5687 (toList!6826 lt!438120) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!116871 res!660913) b!987976))

(assert (= (and b!987976 res!660912) b!987977))

(declare-fun m!914377 () Bool)

(assert (=> d!116871 m!914377))

(declare-fun m!914379 () Bool)

(assert (=> d!116871 m!914379))

(declare-fun m!914381 () Bool)

(assert (=> d!116871 m!914381))

(declare-fun m!914383 () Bool)

(assert (=> d!116871 m!914383))

(declare-fun m!914385 () Bool)

(assert (=> b!987976 m!914385))

(declare-fun m!914387 () Bool)

(assert (=> b!987977 m!914387))

(assert (=> d!116775 d!116871))

(declare-fun d!116873 () Bool)

(declare-fun e!557095 () Bool)

(assert (=> d!116873 e!557095))

(declare-fun res!660915 () Bool)

(assert (=> d!116873 (=> (not res!660915) (not e!557095))))

(declare-fun lt!438124 () ListLongMap!13621)

(assert (=> d!116873 (= res!660915 (contains!5686 lt!438124 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(declare-fun lt!438121 () List!20822)

(assert (=> d!116873 (= lt!438124 (ListLongMap!13622 lt!438121))))

(declare-fun lt!438122 () Unit!32656)

(declare-fun lt!438123 () Unit!32656)

(assert (=> d!116873 (= lt!438122 lt!438123)))

(assert (=> d!116873 (= (getValueByKey!515 lt!438121 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))) (Some!520 (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116873 (= lt!438123 (lemmaContainsTupThenGetReturnValue!272 lt!438121 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116873 (= lt!438121 (insertStrictlySorted!329 (toList!6826 (+!3102 lt!437806 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116873 (= (+!3102 (+!3102 lt!437806 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) lt!438124)))

(declare-fun b!987978 () Bool)

(declare-fun res!660914 () Bool)

(assert (=> b!987978 (=> (not res!660914) (not e!557095))))

(assert (=> b!987978 (= res!660914 (= (getValueByKey!515 (toList!6826 lt!438124) (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))) (Some!520 (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)))))))

(declare-fun b!987979 () Bool)

(assert (=> b!987979 (= e!557095 (contains!5687 (toList!6826 lt!438124) (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)))))

(assert (= (and d!116873 res!660915) b!987978))

(assert (= (and b!987978 res!660914) b!987979))

(declare-fun m!914389 () Bool)

(assert (=> d!116873 m!914389))

(declare-fun m!914391 () Bool)

(assert (=> d!116873 m!914391))

(declare-fun m!914393 () Bool)

(assert (=> d!116873 m!914393))

(declare-fun m!914395 () Bool)

(assert (=> d!116873 m!914395))

(declare-fun m!914397 () Bool)

(assert (=> b!987978 m!914397))

(declare-fun m!914399 () Bool)

(assert (=> b!987979 m!914399))

(assert (=> d!116775 d!116873))

(declare-fun d!116875 () Bool)

(declare-fun e!557096 () Bool)

(assert (=> d!116875 e!557096))

(declare-fun res!660917 () Bool)

(assert (=> d!116875 (=> (not res!660917) (not e!557096))))

(declare-fun lt!438128 () ListLongMap!13621)

(assert (=> d!116875 (= res!660917 (contains!5686 lt!438128 (_1!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!438125 () List!20822)

(assert (=> d!116875 (= lt!438128 (ListLongMap!13622 lt!438125))))

(declare-fun lt!438126 () Unit!32656)

(declare-fun lt!438127 () Unit!32656)

(assert (=> d!116875 (= lt!438126 lt!438127)))

(assert (=> d!116875 (= (getValueByKey!515 lt!438125 (_1!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116875 (= lt!438127 (lemmaContainsTupThenGetReturnValue!272 lt!438125 (_1!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116875 (= lt!438125 (insertStrictlySorted!329 (toList!6826 (+!3102 lt!437806 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))) (_1!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116875 (= (+!3102 (+!3102 lt!437806 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!438128)))

(declare-fun b!987980 () Bool)

(declare-fun res!660916 () Bool)

(assert (=> b!987980 (=> (not res!660916) (not e!557096))))

(assert (=> b!987980 (= res!660916 (= (getValueByKey!515 (toList!6826 lt!438128) (_1!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!987981 () Bool)

(assert (=> b!987981 (= e!557096 (contains!5687 (toList!6826 lt!438128) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!116875 res!660917) b!987980))

(assert (= (and b!987980 res!660916) b!987981))

(declare-fun m!914401 () Bool)

(assert (=> d!116875 m!914401))

(declare-fun m!914403 () Bool)

(assert (=> d!116875 m!914403))

(declare-fun m!914405 () Bool)

(assert (=> d!116875 m!914405))

(declare-fun m!914407 () Bool)

(assert (=> d!116875 m!914407))

(declare-fun m!914409 () Bool)

(assert (=> b!987980 m!914409))

(declare-fun m!914411 () Bool)

(assert (=> b!987981 m!914411))

(assert (=> d!116775 d!116875))

(declare-fun d!116877 () Bool)

(declare-fun e!557097 () Bool)

(assert (=> d!116877 e!557097))

(declare-fun res!660919 () Bool)

(assert (=> d!116877 (=> (not res!660919) (not e!557097))))

(declare-fun lt!438132 () ListLongMap!13621)

(assert (=> d!116877 (= res!660919 (contains!5686 lt!438132 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(declare-fun lt!438129 () List!20822)

(assert (=> d!116877 (= lt!438132 (ListLongMap!13622 lt!438129))))

(declare-fun lt!438130 () Unit!32656)

(declare-fun lt!438131 () Unit!32656)

(assert (=> d!116877 (= lt!438130 lt!438131)))

(assert (=> d!116877 (= (getValueByKey!515 lt!438129 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))) (Some!520 (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116877 (= lt!438131 (lemmaContainsTupThenGetReturnValue!272 lt!438129 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116877 (= lt!438129 (insertStrictlySorted!329 (toList!6826 lt!437806) (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))))))

(assert (=> d!116877 (= (+!3102 lt!437806 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)) lt!438132)))

(declare-fun b!987982 () Bool)

(declare-fun res!660918 () Bool)

(assert (=> b!987982 (=> (not res!660918) (not e!557097))))

(assert (=> b!987982 (= res!660918 (= (getValueByKey!515 (toList!6826 lt!438132) (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804))) (Some!520 (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)))))))

(declare-fun b!987983 () Bool)

(assert (=> b!987983 (= e!557097 (contains!5687 (toList!6826 lt!438132) (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) lt!437804)))))

(assert (= (and d!116877 res!660919) b!987982))

(assert (= (and b!987982 res!660918) b!987983))

(declare-fun m!914413 () Bool)

(assert (=> d!116877 m!914413))

(declare-fun m!914415 () Bool)

(assert (=> d!116877 m!914415))

(declare-fun m!914417 () Bool)

(assert (=> d!116877 m!914417))

(declare-fun m!914419 () Bool)

(assert (=> d!116877 m!914419))

(declare-fun m!914421 () Bool)

(assert (=> b!987982 m!914421))

(declare-fun m!914423 () Bool)

(assert (=> b!987983 m!914423))

(assert (=> d!116775 d!116877))

(declare-fun d!116879 () Bool)

(declare-fun e!557099 () Bool)

(assert (=> d!116879 e!557099))

(declare-fun res!660920 () Bool)

(assert (=> d!116879 (=> res!660920 e!557099)))

(declare-fun lt!438134 () Bool)

(assert (=> d!116879 (= res!660920 (not lt!438134))))

(declare-fun lt!438136 () Bool)

(assert (=> d!116879 (= lt!438134 lt!438136)))

(declare-fun lt!438133 () Unit!32656)

(declare-fun e!557098 () Unit!32656)

(assert (=> d!116879 (= lt!438133 e!557098)))

(declare-fun c!100083 () Bool)

(assert (=> d!116879 (= c!100083 lt!438136)))

(assert (=> d!116879 (= lt!438136 (containsKey!477 (toList!6826 lt!437993) (_1!7478 lt!437802)))))

(assert (=> d!116879 (= (contains!5686 lt!437993 (_1!7478 lt!437802)) lt!438134)))

(declare-fun b!987984 () Bool)

(declare-fun lt!438135 () Unit!32656)

(assert (=> b!987984 (= e!557098 lt!438135)))

(assert (=> b!987984 (= lt!438135 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!437993) (_1!7478 lt!437802)))))

(assert (=> b!987984 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437993) (_1!7478 lt!437802)))))

(declare-fun b!987985 () Bool)

(declare-fun Unit!32666 () Unit!32656)

(assert (=> b!987985 (= e!557098 Unit!32666)))

(declare-fun b!987986 () Bool)

(assert (=> b!987986 (= e!557099 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437993) (_1!7478 lt!437802))))))

(assert (= (and d!116879 c!100083) b!987984))

(assert (= (and d!116879 (not c!100083)) b!987985))

(assert (= (and d!116879 (not res!660920)) b!987986))

(declare-fun m!914425 () Bool)

(assert (=> d!116879 m!914425))

(declare-fun m!914427 () Bool)

(assert (=> b!987984 m!914427))

(assert (=> b!987984 m!914049))

(assert (=> b!987984 m!914049))

(declare-fun m!914429 () Bool)

(assert (=> b!987984 m!914429))

(assert (=> b!987986 m!914049))

(assert (=> b!987986 m!914049))

(assert (=> b!987986 m!914429))

(assert (=> d!116777 d!116879))

(declare-fun b!987988 () Bool)

(declare-fun e!557100 () Option!521)

(declare-fun e!557101 () Option!521)

(assert (=> b!987988 (= e!557100 e!557101)))

(declare-fun c!100085 () Bool)

(assert (=> b!987988 (= c!100085 (and ((_ is Cons!20818) lt!437990) (not (= (_1!7478 (h!21980 lt!437990)) (_1!7478 lt!437802)))))))

(declare-fun b!987989 () Bool)

(assert (=> b!987989 (= e!557101 (getValueByKey!515 (t!29746 lt!437990) (_1!7478 lt!437802)))))

(declare-fun b!987990 () Bool)

(assert (=> b!987990 (= e!557101 None!519)))

(declare-fun d!116881 () Bool)

(declare-fun c!100084 () Bool)

(assert (=> d!116881 (= c!100084 (and ((_ is Cons!20818) lt!437990) (= (_1!7478 (h!21980 lt!437990)) (_1!7478 lt!437802))))))

(assert (=> d!116881 (= (getValueByKey!515 lt!437990 (_1!7478 lt!437802)) e!557100)))

(declare-fun b!987987 () Bool)

(assert (=> b!987987 (= e!557100 (Some!520 (_2!7478 (h!21980 lt!437990))))))

(assert (= (and d!116881 c!100084) b!987987))

(assert (= (and d!116881 (not c!100084)) b!987988))

(assert (= (and b!987988 c!100085) b!987989))

(assert (= (and b!987988 (not c!100085)) b!987990))

(declare-fun m!914431 () Bool)

(assert (=> b!987989 m!914431))

(assert (=> d!116777 d!116881))

(declare-fun d!116883 () Bool)

(assert (=> d!116883 (= (getValueByKey!515 lt!437990 (_1!7478 lt!437802)) (Some!520 (_2!7478 lt!437802)))))

(declare-fun lt!438137 () Unit!32656)

(assert (=> d!116883 (= lt!438137 (choose!1615 lt!437990 (_1!7478 lt!437802) (_2!7478 lt!437802)))))

(declare-fun e!557102 () Bool)

(assert (=> d!116883 e!557102))

(declare-fun res!660921 () Bool)

(assert (=> d!116883 (=> (not res!660921) (not e!557102))))

(assert (=> d!116883 (= res!660921 (isStrictlySorted!511 lt!437990))))

(assert (=> d!116883 (= (lemmaContainsTupThenGetReturnValue!272 lt!437990 (_1!7478 lt!437802) (_2!7478 lt!437802)) lt!438137)))

(declare-fun b!987991 () Bool)

(declare-fun res!660922 () Bool)

(assert (=> b!987991 (=> (not res!660922) (not e!557102))))

(assert (=> b!987991 (= res!660922 (containsKey!477 lt!437990 (_1!7478 lt!437802)))))

(declare-fun b!987992 () Bool)

(assert (=> b!987992 (= e!557102 (contains!5687 lt!437990 (tuple2!14935 (_1!7478 lt!437802) (_2!7478 lt!437802))))))

(assert (= (and d!116883 res!660921) b!987991))

(assert (= (and b!987991 res!660922) b!987992))

(assert (=> d!116883 m!914043))

(declare-fun m!914433 () Bool)

(assert (=> d!116883 m!914433))

(declare-fun m!914435 () Bool)

(assert (=> d!116883 m!914435))

(declare-fun m!914437 () Bool)

(assert (=> b!987991 m!914437))

(declare-fun m!914439 () Bool)

(assert (=> b!987992 m!914439))

(assert (=> d!116777 d!116883))

(declare-fun b!987993 () Bool)

(declare-fun e!557105 () List!20822)

(declare-fun call!41838 () List!20822)

(assert (=> b!987993 (= e!557105 call!41838)))

(declare-fun b!987994 () Bool)

(declare-fun e!557106 () List!20822)

(assert (=> b!987994 (= e!557106 (insertStrictlySorted!329 (t!29746 (toList!6826 lt!437805)) (_1!7478 lt!437802) (_2!7478 lt!437802)))))

(declare-fun b!987995 () Bool)

(declare-fun e!557104 () List!20822)

(assert (=> b!987995 (= e!557104 e!557105)))

(declare-fun c!100087 () Bool)

(assert (=> b!987995 (= c!100087 (and ((_ is Cons!20818) (toList!6826 lt!437805)) (= (_1!7478 (h!21980 (toList!6826 lt!437805))) (_1!7478 lt!437802))))))

(declare-fun b!987996 () Bool)

(declare-fun res!660923 () Bool)

(declare-fun e!557107 () Bool)

(assert (=> b!987996 (=> (not res!660923) (not e!557107))))

(declare-fun lt!438138 () List!20822)

(assert (=> b!987996 (= res!660923 (containsKey!477 lt!438138 (_1!7478 lt!437802)))))

(declare-fun b!987997 () Bool)

(declare-fun call!41836 () List!20822)

(assert (=> b!987997 (= e!557104 call!41836)))

(declare-fun d!116885 () Bool)

(assert (=> d!116885 e!557107))

(declare-fun res!660924 () Bool)

(assert (=> d!116885 (=> (not res!660924) (not e!557107))))

(assert (=> d!116885 (= res!660924 (isStrictlySorted!511 lt!438138))))

(assert (=> d!116885 (= lt!438138 e!557104)))

(declare-fun c!100086 () Bool)

(assert (=> d!116885 (= c!100086 (and ((_ is Cons!20818) (toList!6826 lt!437805)) (bvslt (_1!7478 (h!21980 (toList!6826 lt!437805))) (_1!7478 lt!437802))))))

(assert (=> d!116885 (isStrictlySorted!511 (toList!6826 lt!437805))))

(assert (=> d!116885 (= (insertStrictlySorted!329 (toList!6826 lt!437805) (_1!7478 lt!437802) (_2!7478 lt!437802)) lt!438138)))

(declare-fun b!987998 () Bool)

(declare-fun c!100089 () Bool)

(assert (=> b!987998 (= c!100089 (and ((_ is Cons!20818) (toList!6826 lt!437805)) (bvsgt (_1!7478 (h!21980 (toList!6826 lt!437805))) (_1!7478 lt!437802))))))

(declare-fun e!557103 () List!20822)

(assert (=> b!987998 (= e!557105 e!557103)))

(declare-fun b!987999 () Bool)

(declare-fun call!41837 () List!20822)

(assert (=> b!987999 (= e!557103 call!41837)))

(declare-fun b!988000 () Bool)

(assert (=> b!988000 (= e!557106 (ite c!100087 (t!29746 (toList!6826 lt!437805)) (ite c!100089 (Cons!20818 (h!21980 (toList!6826 lt!437805)) (t!29746 (toList!6826 lt!437805))) Nil!20819)))))

(declare-fun bm!41833 () Bool)

(assert (=> bm!41833 (= call!41837 call!41838)))

(declare-fun bm!41834 () Bool)

(assert (=> bm!41834 (= call!41838 call!41836)))

(declare-fun bm!41835 () Bool)

(assert (=> bm!41835 (= call!41836 ($colon$colon!555 e!557106 (ite c!100086 (h!21980 (toList!6826 lt!437805)) (tuple2!14935 (_1!7478 lt!437802) (_2!7478 lt!437802)))))))

(declare-fun c!100088 () Bool)

(assert (=> bm!41835 (= c!100088 c!100086)))

(declare-fun b!988001 () Bool)

(assert (=> b!988001 (= e!557103 call!41837)))

(declare-fun b!988002 () Bool)

(assert (=> b!988002 (= e!557107 (contains!5687 lt!438138 (tuple2!14935 (_1!7478 lt!437802) (_2!7478 lt!437802))))))

(assert (= (and d!116885 c!100086) b!987997))

(assert (= (and d!116885 (not c!100086)) b!987995))

(assert (= (and b!987995 c!100087) b!987993))

(assert (= (and b!987995 (not c!100087)) b!987998))

(assert (= (and b!987998 c!100089) b!988001))

(assert (= (and b!987998 (not c!100089)) b!987999))

(assert (= (or b!988001 b!987999) bm!41833))

(assert (= (or b!987993 bm!41833) bm!41834))

(assert (= (or b!987997 bm!41834) bm!41835))

(assert (= (and bm!41835 c!100088) b!987994))

(assert (= (and bm!41835 (not c!100088)) b!988000))

(assert (= (and d!116885 res!660924) b!987996))

(assert (= (and b!987996 res!660923) b!988002))

(declare-fun m!914441 () Bool)

(assert (=> b!988002 m!914441))

(declare-fun m!914443 () Bool)

(assert (=> bm!41835 m!914443))

(declare-fun m!914445 () Bool)

(assert (=> b!987994 m!914445))

(declare-fun m!914447 () Bool)

(assert (=> d!116885 m!914447))

(declare-fun m!914449 () Bool)

(assert (=> d!116885 m!914449))

(declare-fun m!914451 () Bool)

(assert (=> b!987996 m!914451))

(assert (=> d!116777 d!116885))

(declare-fun d!116887 () Bool)

(assert (=> d!116887 (= (apply!886 lt!437947 (select (arr!30024 _keys!1544) from!1932)) (get!15596 (getValueByKey!515 (toList!6826 lt!437947) (select (arr!30024 _keys!1544) from!1932))))))

(declare-fun bs!28004 () Bool)

(assert (= bs!28004 d!116887))

(assert (=> bs!28004 m!913739))

(declare-fun m!914453 () Bool)

(assert (=> bs!28004 m!914453))

(assert (=> bs!28004 m!914453))

(declare-fun m!914455 () Bool)

(assert (=> bs!28004 m!914455))

(assert (=> b!987738 d!116887))

(assert (=> b!987738 d!116779))

(declare-fun d!116889 () Bool)

(declare-fun e!557109 () Bool)

(assert (=> d!116889 e!557109))

(declare-fun res!660925 () Bool)

(assert (=> d!116889 (=> res!660925 e!557109)))

(declare-fun lt!438140 () Bool)

(assert (=> d!116889 (= res!660925 (not lt!438140))))

(declare-fun lt!438142 () Bool)

(assert (=> d!116889 (= lt!438140 lt!438142)))

(declare-fun lt!438139 () Unit!32656)

(declare-fun e!557108 () Unit!32656)

(assert (=> d!116889 (= lt!438139 e!557108)))

(declare-fun c!100090 () Bool)

(assert (=> d!116889 (= c!100090 lt!438142)))

(assert (=> d!116889 (= lt!438142 (containsKey!477 (toList!6826 lt!437894) (_1!7478 lt!437808)))))

(assert (=> d!116889 (= (contains!5686 lt!437894 (_1!7478 lt!437808)) lt!438140)))

(declare-fun b!988003 () Bool)

(declare-fun lt!438141 () Unit!32656)

(assert (=> b!988003 (= e!557108 lt!438141)))

(assert (=> b!988003 (= lt!438141 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!437894) (_1!7478 lt!437808)))))

(assert (=> b!988003 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437894) (_1!7478 lt!437808)))))

(declare-fun b!988004 () Bool)

(declare-fun Unit!32667 () Unit!32656)

(assert (=> b!988004 (= e!557108 Unit!32667)))

(declare-fun b!988005 () Bool)

(assert (=> b!988005 (= e!557109 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437894) (_1!7478 lt!437808))))))

(assert (= (and d!116889 c!100090) b!988003))

(assert (= (and d!116889 (not c!100090)) b!988004))

(assert (= (and d!116889 (not res!660925)) b!988005))

(declare-fun m!914457 () Bool)

(assert (=> d!116889 m!914457))

(declare-fun m!914459 () Bool)

(assert (=> b!988003 m!914459))

(assert (=> b!988003 m!913913))

(assert (=> b!988003 m!913913))

(declare-fun m!914461 () Bool)

(assert (=> b!988003 m!914461))

(assert (=> b!988005 m!913913))

(assert (=> b!988005 m!913913))

(assert (=> b!988005 m!914461))

(assert (=> d!116767 d!116889))

(declare-fun b!988007 () Bool)

(declare-fun e!557110 () Option!521)

(declare-fun e!557111 () Option!521)

(assert (=> b!988007 (= e!557110 e!557111)))

(declare-fun c!100092 () Bool)

(assert (=> b!988007 (= c!100092 (and ((_ is Cons!20818) lt!437891) (not (= (_1!7478 (h!21980 lt!437891)) (_1!7478 lt!437808)))))))

(declare-fun b!988008 () Bool)

(assert (=> b!988008 (= e!557111 (getValueByKey!515 (t!29746 lt!437891) (_1!7478 lt!437808)))))

(declare-fun b!988009 () Bool)

(assert (=> b!988009 (= e!557111 None!519)))

(declare-fun d!116891 () Bool)

(declare-fun c!100091 () Bool)

(assert (=> d!116891 (= c!100091 (and ((_ is Cons!20818) lt!437891) (= (_1!7478 (h!21980 lt!437891)) (_1!7478 lt!437808))))))

(assert (=> d!116891 (= (getValueByKey!515 lt!437891 (_1!7478 lt!437808)) e!557110)))

(declare-fun b!988006 () Bool)

(assert (=> b!988006 (= e!557110 (Some!520 (_2!7478 (h!21980 lt!437891))))))

(assert (= (and d!116891 c!100091) b!988006))

(assert (= (and d!116891 (not c!100091)) b!988007))

(assert (= (and b!988007 c!100092) b!988008))

(assert (= (and b!988007 (not c!100092)) b!988009))

(declare-fun m!914463 () Bool)

(assert (=> b!988008 m!914463))

(assert (=> d!116767 d!116891))

(declare-fun d!116893 () Bool)

(assert (=> d!116893 (= (getValueByKey!515 lt!437891 (_1!7478 lt!437808)) (Some!520 (_2!7478 lt!437808)))))

(declare-fun lt!438143 () Unit!32656)

(assert (=> d!116893 (= lt!438143 (choose!1615 lt!437891 (_1!7478 lt!437808) (_2!7478 lt!437808)))))

(declare-fun e!557112 () Bool)

(assert (=> d!116893 e!557112))

(declare-fun res!660926 () Bool)

(assert (=> d!116893 (=> (not res!660926) (not e!557112))))

(assert (=> d!116893 (= res!660926 (isStrictlySorted!511 lt!437891))))

(assert (=> d!116893 (= (lemmaContainsTupThenGetReturnValue!272 lt!437891 (_1!7478 lt!437808) (_2!7478 lt!437808)) lt!438143)))

(declare-fun b!988010 () Bool)

(declare-fun res!660927 () Bool)

(assert (=> b!988010 (=> (not res!660927) (not e!557112))))

(assert (=> b!988010 (= res!660927 (containsKey!477 lt!437891 (_1!7478 lt!437808)))))

(declare-fun b!988011 () Bool)

(assert (=> b!988011 (= e!557112 (contains!5687 lt!437891 (tuple2!14935 (_1!7478 lt!437808) (_2!7478 lt!437808))))))

(assert (= (and d!116893 res!660926) b!988010))

(assert (= (and b!988010 res!660927) b!988011))

(assert (=> d!116893 m!913907))

(declare-fun m!914465 () Bool)

(assert (=> d!116893 m!914465))

(declare-fun m!914467 () Bool)

(assert (=> d!116893 m!914467))

(declare-fun m!914469 () Bool)

(assert (=> b!988010 m!914469))

(declare-fun m!914471 () Bool)

(assert (=> b!988011 m!914471))

(assert (=> d!116767 d!116893))

(declare-fun b!988012 () Bool)

(declare-fun e!557115 () List!20822)

(declare-fun call!41841 () List!20822)

(assert (=> b!988012 (= e!557115 call!41841)))

(declare-fun b!988013 () Bool)

(declare-fun e!557116 () List!20822)

(assert (=> b!988013 (= e!557116 (insertStrictlySorted!329 (t!29746 (toList!6826 (+!3102 lt!437806 lt!437809))) (_1!7478 lt!437808) (_2!7478 lt!437808)))))

(declare-fun b!988014 () Bool)

(declare-fun e!557114 () List!20822)

(assert (=> b!988014 (= e!557114 e!557115)))

(declare-fun c!100094 () Bool)

(assert (=> b!988014 (= c!100094 (and ((_ is Cons!20818) (toList!6826 (+!3102 lt!437806 lt!437809))) (= (_1!7478 (h!21980 (toList!6826 (+!3102 lt!437806 lt!437809)))) (_1!7478 lt!437808))))))

(declare-fun b!988015 () Bool)

(declare-fun res!660928 () Bool)

(declare-fun e!557117 () Bool)

(assert (=> b!988015 (=> (not res!660928) (not e!557117))))

(declare-fun lt!438144 () List!20822)

(assert (=> b!988015 (= res!660928 (containsKey!477 lt!438144 (_1!7478 lt!437808)))))

(declare-fun b!988016 () Bool)

(declare-fun call!41839 () List!20822)

(assert (=> b!988016 (= e!557114 call!41839)))

(declare-fun d!116895 () Bool)

(assert (=> d!116895 e!557117))

(declare-fun res!660929 () Bool)

(assert (=> d!116895 (=> (not res!660929) (not e!557117))))

(assert (=> d!116895 (= res!660929 (isStrictlySorted!511 lt!438144))))

(assert (=> d!116895 (= lt!438144 e!557114)))

(declare-fun c!100093 () Bool)

(assert (=> d!116895 (= c!100093 (and ((_ is Cons!20818) (toList!6826 (+!3102 lt!437806 lt!437809))) (bvslt (_1!7478 (h!21980 (toList!6826 (+!3102 lt!437806 lt!437809)))) (_1!7478 lt!437808))))))

(assert (=> d!116895 (isStrictlySorted!511 (toList!6826 (+!3102 lt!437806 lt!437809)))))

(assert (=> d!116895 (= (insertStrictlySorted!329 (toList!6826 (+!3102 lt!437806 lt!437809)) (_1!7478 lt!437808) (_2!7478 lt!437808)) lt!438144)))

(declare-fun c!100096 () Bool)

(declare-fun b!988017 () Bool)

(assert (=> b!988017 (= c!100096 (and ((_ is Cons!20818) (toList!6826 (+!3102 lt!437806 lt!437809))) (bvsgt (_1!7478 (h!21980 (toList!6826 (+!3102 lt!437806 lt!437809)))) (_1!7478 lt!437808))))))

(declare-fun e!557113 () List!20822)

(assert (=> b!988017 (= e!557115 e!557113)))

(declare-fun b!988018 () Bool)

(declare-fun call!41840 () List!20822)

(assert (=> b!988018 (= e!557113 call!41840)))

(declare-fun b!988019 () Bool)

(assert (=> b!988019 (= e!557116 (ite c!100094 (t!29746 (toList!6826 (+!3102 lt!437806 lt!437809))) (ite c!100096 (Cons!20818 (h!21980 (toList!6826 (+!3102 lt!437806 lt!437809))) (t!29746 (toList!6826 (+!3102 lt!437806 lt!437809)))) Nil!20819)))))

(declare-fun bm!41836 () Bool)

(assert (=> bm!41836 (= call!41840 call!41841)))

(declare-fun bm!41837 () Bool)

(assert (=> bm!41837 (= call!41841 call!41839)))

(declare-fun bm!41838 () Bool)

(assert (=> bm!41838 (= call!41839 ($colon$colon!555 e!557116 (ite c!100093 (h!21980 (toList!6826 (+!3102 lt!437806 lt!437809))) (tuple2!14935 (_1!7478 lt!437808) (_2!7478 lt!437808)))))))

(declare-fun c!100095 () Bool)

(assert (=> bm!41838 (= c!100095 c!100093)))

(declare-fun b!988020 () Bool)

(assert (=> b!988020 (= e!557113 call!41840)))

(declare-fun b!988021 () Bool)

(assert (=> b!988021 (= e!557117 (contains!5687 lt!438144 (tuple2!14935 (_1!7478 lt!437808) (_2!7478 lt!437808))))))

(assert (= (and d!116895 c!100093) b!988016))

(assert (= (and d!116895 (not c!100093)) b!988014))

(assert (= (and b!988014 c!100094) b!988012))

(assert (= (and b!988014 (not c!100094)) b!988017))

(assert (= (and b!988017 c!100096) b!988020))

(assert (= (and b!988017 (not c!100096)) b!988018))

(assert (= (or b!988020 b!988018) bm!41836))

(assert (= (or b!988012 bm!41836) bm!41837))

(assert (= (or b!988016 bm!41837) bm!41838))

(assert (= (and bm!41838 c!100095) b!988013))

(assert (= (and bm!41838 (not c!100095)) b!988019))

(assert (= (and d!116895 res!660929) b!988015))

(assert (= (and b!988015 res!660928) b!988021))

(declare-fun m!914473 () Bool)

(assert (=> b!988021 m!914473))

(declare-fun m!914475 () Bool)

(assert (=> bm!41838 m!914475))

(declare-fun m!914477 () Bool)

(assert (=> b!988013 m!914477))

(declare-fun m!914479 () Bool)

(assert (=> d!116895 m!914479))

(declare-fun m!914481 () Bool)

(assert (=> d!116895 m!914481))

(declare-fun m!914483 () Bool)

(assert (=> b!988015 m!914483))

(assert (=> d!116767 d!116895))

(declare-fun d!116897 () Bool)

(declare-fun e!557119 () Bool)

(assert (=> d!116897 e!557119))

(declare-fun res!660930 () Bool)

(assert (=> d!116897 (=> res!660930 e!557119)))

(declare-fun lt!438146 () Bool)

(assert (=> d!116897 (= res!660930 (not lt!438146))))

(declare-fun lt!438148 () Bool)

(assert (=> d!116897 (= lt!438146 lt!438148)))

(declare-fun lt!438145 () Unit!32656)

(declare-fun e!557118 () Unit!32656)

(assert (=> d!116897 (= lt!438145 e!557118)))

(declare-fun c!100097 () Bool)

(assert (=> d!116897 (= c!100097 lt!438148)))

(assert (=> d!116897 (= lt!438148 (containsKey!477 (toList!6826 lt!438013) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116897 (= (contains!5686 lt!438013 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438146)))

(declare-fun b!988022 () Bool)

(declare-fun lt!438147 () Unit!32656)

(assert (=> b!988022 (= e!557118 lt!438147)))

(assert (=> b!988022 (= lt!438147 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!438013) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988022 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438013) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988023 () Bool)

(declare-fun Unit!32668 () Unit!32656)

(assert (=> b!988023 (= e!557118 Unit!32668)))

(declare-fun b!988024 () Bool)

(assert (=> b!988024 (= e!557119 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116897 c!100097) b!988022))

(assert (= (and d!116897 (not c!100097)) b!988023))

(assert (= (and d!116897 (not res!660930)) b!988024))

(declare-fun m!914485 () Bool)

(assert (=> d!116897 m!914485))

(declare-fun m!914487 () Bool)

(assert (=> b!988022 m!914487))

(declare-fun m!914489 () Bool)

(assert (=> b!988022 m!914489))

(assert (=> b!988022 m!914489))

(declare-fun m!914491 () Bool)

(assert (=> b!988022 m!914491))

(assert (=> b!988024 m!914489))

(assert (=> b!988024 m!914489))

(assert (=> b!988024 m!914491))

(assert (=> b!987805 d!116897))

(declare-fun d!116899 () Bool)

(declare-fun e!557121 () Bool)

(assert (=> d!116899 e!557121))

(declare-fun res!660931 () Bool)

(assert (=> d!116899 (=> res!660931 e!557121)))

(declare-fun lt!438150 () Bool)

(assert (=> d!116899 (= res!660931 (not lt!438150))))

(declare-fun lt!438152 () Bool)

(assert (=> d!116899 (= lt!438150 lt!438152)))

(declare-fun lt!438149 () Unit!32656)

(declare-fun e!557120 () Unit!32656)

(assert (=> d!116899 (= lt!438149 e!557120)))

(declare-fun c!100098 () Bool)

(assert (=> d!116899 (= c!100098 lt!438152)))

(assert (=> d!116899 (= lt!438152 (containsKey!477 (toList!6826 lt!438031) (_1!7478 lt!437802)))))

(assert (=> d!116899 (= (contains!5686 lt!438031 (_1!7478 lt!437802)) lt!438150)))

(declare-fun b!988025 () Bool)

(declare-fun lt!438151 () Unit!32656)

(assert (=> b!988025 (= e!557120 lt!438151)))

(assert (=> b!988025 (= lt!438151 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!438031) (_1!7478 lt!437802)))))

(assert (=> b!988025 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438031) (_1!7478 lt!437802)))))

(declare-fun b!988026 () Bool)

(declare-fun Unit!32669 () Unit!32656)

(assert (=> b!988026 (= e!557120 Unit!32669)))

(declare-fun b!988027 () Bool)

(assert (=> b!988027 (= e!557121 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438031) (_1!7478 lt!437802))))))

(assert (= (and d!116899 c!100098) b!988025))

(assert (= (and d!116899 (not c!100098)) b!988026))

(assert (= (and d!116899 (not res!660931)) b!988027))

(declare-fun m!914493 () Bool)

(assert (=> d!116899 m!914493))

(declare-fun m!914495 () Bool)

(assert (=> b!988025 m!914495))

(assert (=> b!988025 m!914131))

(assert (=> b!988025 m!914131))

(declare-fun m!914497 () Bool)

(assert (=> b!988025 m!914497))

(assert (=> b!988027 m!914131))

(assert (=> b!988027 m!914131))

(assert (=> b!988027 m!914497))

(assert (=> d!116791 d!116899))

(declare-fun b!988029 () Bool)

(declare-fun e!557122 () Option!521)

(declare-fun e!557123 () Option!521)

(assert (=> b!988029 (= e!557122 e!557123)))

(declare-fun c!100100 () Bool)

(assert (=> b!988029 (= c!100100 (and ((_ is Cons!20818) lt!438028) (not (= (_1!7478 (h!21980 lt!438028)) (_1!7478 lt!437802)))))))

(declare-fun b!988030 () Bool)

(assert (=> b!988030 (= e!557123 (getValueByKey!515 (t!29746 lt!438028) (_1!7478 lt!437802)))))

(declare-fun b!988031 () Bool)

(assert (=> b!988031 (= e!557123 None!519)))

(declare-fun d!116901 () Bool)

(declare-fun c!100099 () Bool)

(assert (=> d!116901 (= c!100099 (and ((_ is Cons!20818) lt!438028) (= (_1!7478 (h!21980 lt!438028)) (_1!7478 lt!437802))))))

(assert (=> d!116901 (= (getValueByKey!515 lt!438028 (_1!7478 lt!437802)) e!557122)))

(declare-fun b!988028 () Bool)

(assert (=> b!988028 (= e!557122 (Some!520 (_2!7478 (h!21980 lt!438028))))))

(assert (= (and d!116901 c!100099) b!988028))

(assert (= (and d!116901 (not c!100099)) b!988029))

(assert (= (and b!988029 c!100100) b!988030))

(assert (= (and b!988029 (not c!100100)) b!988031))

(declare-fun m!914499 () Bool)

(assert (=> b!988030 m!914499))

(assert (=> d!116791 d!116901))

(declare-fun d!116903 () Bool)

(assert (=> d!116903 (= (getValueByKey!515 lt!438028 (_1!7478 lt!437802)) (Some!520 (_2!7478 lt!437802)))))

(declare-fun lt!438153 () Unit!32656)

(assert (=> d!116903 (= lt!438153 (choose!1615 lt!438028 (_1!7478 lt!437802) (_2!7478 lt!437802)))))

(declare-fun e!557124 () Bool)

(assert (=> d!116903 e!557124))

(declare-fun res!660932 () Bool)

(assert (=> d!116903 (=> (not res!660932) (not e!557124))))

(assert (=> d!116903 (= res!660932 (isStrictlySorted!511 lt!438028))))

(assert (=> d!116903 (= (lemmaContainsTupThenGetReturnValue!272 lt!438028 (_1!7478 lt!437802) (_2!7478 lt!437802)) lt!438153)))

(declare-fun b!988032 () Bool)

(declare-fun res!660933 () Bool)

(assert (=> b!988032 (=> (not res!660933) (not e!557124))))

(assert (=> b!988032 (= res!660933 (containsKey!477 lt!438028 (_1!7478 lt!437802)))))

(declare-fun b!988033 () Bool)

(assert (=> b!988033 (= e!557124 (contains!5687 lt!438028 (tuple2!14935 (_1!7478 lt!437802) (_2!7478 lt!437802))))))

(assert (= (and d!116903 res!660932) b!988032))

(assert (= (and b!988032 res!660933) b!988033))

(assert (=> d!116903 m!914125))

(declare-fun m!914501 () Bool)

(assert (=> d!116903 m!914501))

(declare-fun m!914503 () Bool)

(assert (=> d!116903 m!914503))

(declare-fun m!914505 () Bool)

(assert (=> b!988032 m!914505))

(declare-fun m!914507 () Bool)

(assert (=> b!988033 m!914507))

(assert (=> d!116791 d!116903))

(declare-fun b!988034 () Bool)

(declare-fun e!557127 () List!20822)

(declare-fun call!41844 () List!20822)

(assert (=> b!988034 (= e!557127 call!41844)))

(declare-fun b!988035 () Bool)

(declare-fun e!557128 () List!20822)

(assert (=> b!988035 (= e!557128 (insertStrictlySorted!329 (t!29746 (toList!6826 lt!437801)) (_1!7478 lt!437802) (_2!7478 lt!437802)))))

(declare-fun b!988036 () Bool)

(declare-fun e!557126 () List!20822)

(assert (=> b!988036 (= e!557126 e!557127)))

(declare-fun c!100102 () Bool)

(assert (=> b!988036 (= c!100102 (and ((_ is Cons!20818) (toList!6826 lt!437801)) (= (_1!7478 (h!21980 (toList!6826 lt!437801))) (_1!7478 lt!437802))))))

(declare-fun b!988037 () Bool)

(declare-fun res!660934 () Bool)

(declare-fun e!557129 () Bool)

(assert (=> b!988037 (=> (not res!660934) (not e!557129))))

(declare-fun lt!438154 () List!20822)

(assert (=> b!988037 (= res!660934 (containsKey!477 lt!438154 (_1!7478 lt!437802)))))

(declare-fun b!988038 () Bool)

(declare-fun call!41842 () List!20822)

(assert (=> b!988038 (= e!557126 call!41842)))

(declare-fun d!116905 () Bool)

(assert (=> d!116905 e!557129))

(declare-fun res!660935 () Bool)

(assert (=> d!116905 (=> (not res!660935) (not e!557129))))

(assert (=> d!116905 (= res!660935 (isStrictlySorted!511 lt!438154))))

(assert (=> d!116905 (= lt!438154 e!557126)))

(declare-fun c!100101 () Bool)

(assert (=> d!116905 (= c!100101 (and ((_ is Cons!20818) (toList!6826 lt!437801)) (bvslt (_1!7478 (h!21980 (toList!6826 lt!437801))) (_1!7478 lt!437802))))))

(assert (=> d!116905 (isStrictlySorted!511 (toList!6826 lt!437801))))

(assert (=> d!116905 (= (insertStrictlySorted!329 (toList!6826 lt!437801) (_1!7478 lt!437802) (_2!7478 lt!437802)) lt!438154)))

(declare-fun b!988039 () Bool)

(declare-fun c!100104 () Bool)

(assert (=> b!988039 (= c!100104 (and ((_ is Cons!20818) (toList!6826 lt!437801)) (bvsgt (_1!7478 (h!21980 (toList!6826 lt!437801))) (_1!7478 lt!437802))))))

(declare-fun e!557125 () List!20822)

(assert (=> b!988039 (= e!557127 e!557125)))

(declare-fun b!988040 () Bool)

(declare-fun call!41843 () List!20822)

(assert (=> b!988040 (= e!557125 call!41843)))

(declare-fun b!988041 () Bool)

(assert (=> b!988041 (= e!557128 (ite c!100102 (t!29746 (toList!6826 lt!437801)) (ite c!100104 (Cons!20818 (h!21980 (toList!6826 lt!437801)) (t!29746 (toList!6826 lt!437801))) Nil!20819)))))

(declare-fun bm!41839 () Bool)

(assert (=> bm!41839 (= call!41843 call!41844)))

(declare-fun bm!41840 () Bool)

(assert (=> bm!41840 (= call!41844 call!41842)))

(declare-fun bm!41841 () Bool)

(assert (=> bm!41841 (= call!41842 ($colon$colon!555 e!557128 (ite c!100101 (h!21980 (toList!6826 lt!437801)) (tuple2!14935 (_1!7478 lt!437802) (_2!7478 lt!437802)))))))

(declare-fun c!100103 () Bool)

(assert (=> bm!41841 (= c!100103 c!100101)))

(declare-fun b!988042 () Bool)

(assert (=> b!988042 (= e!557125 call!41843)))

(declare-fun b!988043 () Bool)

(assert (=> b!988043 (= e!557129 (contains!5687 lt!438154 (tuple2!14935 (_1!7478 lt!437802) (_2!7478 lt!437802))))))

(assert (= (and d!116905 c!100101) b!988038))

(assert (= (and d!116905 (not c!100101)) b!988036))

(assert (= (and b!988036 c!100102) b!988034))

(assert (= (and b!988036 (not c!100102)) b!988039))

(assert (= (and b!988039 c!100104) b!988042))

(assert (= (and b!988039 (not c!100104)) b!988040))

(assert (= (or b!988042 b!988040) bm!41839))

(assert (= (or b!988034 bm!41839) bm!41840))

(assert (= (or b!988038 bm!41840) bm!41841))

(assert (= (and bm!41841 c!100103) b!988035))

(assert (= (and bm!41841 (not c!100103)) b!988041))

(assert (= (and d!116905 res!660935) b!988037))

(assert (= (and b!988037 res!660934) b!988043))

(declare-fun m!914509 () Bool)

(assert (=> b!988043 m!914509))

(declare-fun m!914511 () Bool)

(assert (=> bm!41841 m!914511))

(declare-fun m!914513 () Bool)

(assert (=> b!988035 m!914513))

(declare-fun m!914515 () Bool)

(assert (=> d!116905 m!914515))

(declare-fun m!914517 () Bool)

(assert (=> d!116905 m!914517))

(declare-fun m!914519 () Bool)

(assert (=> b!988037 m!914519))

(assert (=> d!116791 d!116905))

(assert (=> b!987731 d!116793))

(declare-fun d!116907 () Bool)

(declare-fun res!660937 () Bool)

(declare-fun e!557131 () Bool)

(assert (=> d!116907 (=> res!660937 e!557131)))

(assert (=> d!116907 (= res!660937 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30505 _keys!1544)))))

(assert (=> d!116907 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99999 (Cons!20819 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) Nil!20820) Nil!20820)) e!557131)))

(declare-fun b!988044 () Bool)

(declare-fun e!557133 () Bool)

(declare-fun call!41845 () Bool)

(assert (=> b!988044 (= e!557133 call!41845)))

(declare-fun b!988045 () Bool)

(assert (=> b!988045 (= e!557133 call!41845)))

(declare-fun b!988046 () Bool)

(declare-fun e!557132 () Bool)

(assert (=> b!988046 (= e!557132 (contains!5685 (ite c!99999 (Cons!20819 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) Nil!20820) Nil!20820) (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!100105 () Bool)

(declare-fun bm!41842 () Bool)

(assert (=> bm!41842 (= call!41845 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100105 (Cons!20819 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!99999 (Cons!20819 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) Nil!20820) Nil!20820)) (ite c!99999 (Cons!20819 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) Nil!20820) Nil!20820))))))

(declare-fun b!988047 () Bool)

(declare-fun e!557130 () Bool)

(assert (=> b!988047 (= e!557131 e!557130)))

(declare-fun res!660938 () Bool)

(assert (=> b!988047 (=> (not res!660938) (not e!557130))))

(assert (=> b!988047 (= res!660938 (not e!557132))))

(declare-fun res!660936 () Bool)

(assert (=> b!988047 (=> (not res!660936) (not e!557132))))

(assert (=> b!988047 (= res!660936 (validKeyInArray!0 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!988048 () Bool)

(assert (=> b!988048 (= e!557130 e!557133)))

(assert (=> b!988048 (= c!100105 (validKeyInArray!0 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!116907 (not res!660937)) b!988047))

(assert (= (and b!988047 res!660936) b!988046))

(assert (= (and b!988047 res!660938) b!988048))

(assert (= (and b!988048 c!100105) b!988045))

(assert (= (and b!988048 (not c!100105)) b!988044))

(assert (= (or b!988045 b!988044) bm!41842))

(assert (=> b!988046 m!914169))

(assert (=> b!988046 m!914169))

(declare-fun m!914521 () Bool)

(assert (=> b!988046 m!914521))

(assert (=> bm!41842 m!914169))

(declare-fun m!914523 () Bool)

(assert (=> bm!41842 m!914523))

(assert (=> b!988047 m!914169))

(assert (=> b!988047 m!914169))

(assert (=> b!988047 m!914179))

(assert (=> b!988048 m!914169))

(assert (=> b!988048 m!914169))

(assert (=> b!988048 m!914179))

(assert (=> bm!41785 d!116907))

(declare-fun b!988049 () Bool)

(declare-fun e!557139 () Bool)

(declare-fun e!557137 () Bool)

(assert (=> b!988049 (= e!557139 e!557137)))

(declare-fun c!100108 () Bool)

(assert (=> b!988049 (= c!100108 (bvslt from!1932 (size!30505 _keys!1544)))))

(declare-fun bm!41843 () Bool)

(declare-fun call!41846 () ListLongMap!13621)

(assert (=> bm!41843 (= call!41846 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!988050 () Bool)

(declare-fun e!557138 () Bool)

(assert (=> b!988050 (= e!557138 e!557139)))

(declare-fun c!100107 () Bool)

(declare-fun e!557135 () Bool)

(assert (=> b!988050 (= c!100107 e!557135)))

(declare-fun res!660941 () Bool)

(assert (=> b!988050 (=> (not res!660941) (not e!557135))))

(assert (=> b!988050 (= res!660941 (bvslt from!1932 (size!30505 _keys!1544)))))

(declare-fun b!988051 () Bool)

(declare-fun e!557140 () ListLongMap!13621)

(assert (=> b!988051 (= e!557140 (ListLongMap!13622 Nil!20819))))

(declare-fun b!988052 () Bool)

(declare-fun res!660940 () Bool)

(assert (=> b!988052 (=> (not res!660940) (not e!557138))))

(declare-fun lt!438159 () ListLongMap!13621)

(assert (=> b!988052 (= res!660940 (not (contains!5686 lt!438159 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988053 () Bool)

(declare-fun e!557134 () ListLongMap!13621)

(assert (=> b!988053 (= e!557134 call!41846)))

(declare-fun b!988054 () Bool)

(assert (=> b!988054 (= e!557137 (= lt!438159 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun d!116909 () Bool)

(assert (=> d!116909 e!557138))

(declare-fun res!660939 () Bool)

(assert (=> d!116909 (=> (not res!660939) (not e!557138))))

(assert (=> d!116909 (= res!660939 (not (contains!5686 lt!438159 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!116909 (= lt!438159 e!557140)))

(declare-fun c!100106 () Bool)

(assert (=> d!116909 (= c!100106 (bvsge from!1932 (size!30505 _keys!1544)))))

(assert (=> d!116909 (validMask!0 mask!1948)))

(assert (=> d!116909 (= (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!438159)))

(declare-fun b!988055 () Bool)

(assert (=> b!988055 (= e!557135 (validKeyInArray!0 (select (arr!30024 _keys!1544) from!1932)))))

(assert (=> b!988055 (bvsge from!1932 #b00000000000000000000000000000000)))

(declare-fun b!988056 () Bool)

(assert (=> b!988056 (= e!557140 e!557134)))

(declare-fun c!100109 () Bool)

(assert (=> b!988056 (= c!100109 (validKeyInArray!0 (select (arr!30024 _keys!1544) from!1932)))))

(declare-fun b!988057 () Bool)

(declare-fun e!557136 () Bool)

(assert (=> b!988057 (= e!557139 e!557136)))

(assert (=> b!988057 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30505 _keys!1544)))))

(declare-fun res!660942 () Bool)

(assert (=> b!988057 (= res!660942 (contains!5686 lt!438159 (select (arr!30024 _keys!1544) from!1932)))))

(assert (=> b!988057 (=> (not res!660942) (not e!557136))))

(declare-fun b!988058 () Bool)

(assert (=> b!988058 (= e!557137 (isEmpty!725 lt!438159))))

(declare-fun b!988059 () Bool)

(assert (=> b!988059 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30505 _keys!1544)))))

(assert (=> b!988059 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30504 _values!1278)))))

(assert (=> b!988059 (= e!557136 (= (apply!886 lt!438159 (select (arr!30024 _keys!1544) from!1932)) (get!15592 (select (arr!30023 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!988060 () Bool)

(declare-fun lt!438157 () Unit!32656)

(declare-fun lt!438160 () Unit!32656)

(assert (=> b!988060 (= lt!438157 lt!438160)))

(declare-fun lt!438158 () (_ BitVec 64))

(declare-fun lt!438156 () (_ BitVec 64))

(declare-fun lt!438155 () ListLongMap!13621)

(declare-fun lt!438161 () V!35945)

(assert (=> b!988060 (not (contains!5686 (+!3102 lt!438155 (tuple2!14935 lt!438158 lt!438161)) lt!438156))))

(assert (=> b!988060 (= lt!438160 (addStillNotContains!233 lt!438155 lt!438158 lt!438161 lt!438156))))

(assert (=> b!988060 (= lt!438156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!988060 (= lt!438161 (get!15592 (select (arr!30023 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!988060 (= lt!438158 (select (arr!30024 _keys!1544) from!1932))))

(assert (=> b!988060 (= lt!438155 call!41846)))

(assert (=> b!988060 (= e!557134 (+!3102 call!41846 (tuple2!14935 (select (arr!30024 _keys!1544) from!1932) (get!15592 (select (arr!30023 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!116909 c!100106) b!988051))

(assert (= (and d!116909 (not c!100106)) b!988056))

(assert (= (and b!988056 c!100109) b!988060))

(assert (= (and b!988056 (not c!100109)) b!988053))

(assert (= (or b!988060 b!988053) bm!41843))

(assert (= (and d!116909 res!660939) b!988052))

(assert (= (and b!988052 res!660940) b!988050))

(assert (= (and b!988050 res!660941) b!988055))

(assert (= (and b!988050 c!100107) b!988057))

(assert (= (and b!988050 (not c!100107)) b!988049))

(assert (= (and b!988057 res!660942) b!988059))

(assert (= (and b!988049 c!100108) b!988054))

(assert (= (and b!988049 (not c!100108)) b!988058))

(declare-fun b_lambda!15043 () Bool)

(assert (=> (not b_lambda!15043) (not b!988059)))

(assert (=> b!988059 t!29745))

(declare-fun b_and!32071 () Bool)

(assert (= b_and!32069 (and (=> t!29745 result!13551) b_and!32071)))

(declare-fun b_lambda!15045 () Bool)

(assert (=> (not b_lambda!15045) (not b!988060)))

(assert (=> b!988060 t!29745))

(declare-fun b_and!32073 () Bool)

(assert (= b_and!32071 (and (=> t!29745 result!13551) b_and!32073)))

(declare-fun m!914525 () Bool)

(assert (=> b!988052 m!914525))

(assert (=> b!988056 m!913739))

(assert (=> b!988056 m!913739))

(assert (=> b!988056 m!913771))

(declare-fun m!914527 () Bool)

(assert (=> b!988060 m!914527))

(assert (=> b!988060 m!913741))

(declare-fun m!914529 () Bool)

(assert (=> b!988060 m!914529))

(declare-fun m!914531 () Bool)

(assert (=> b!988060 m!914531))

(assert (=> b!988060 m!913739))

(assert (=> b!988060 m!913755))

(assert (=> b!988060 m!914529))

(declare-fun m!914533 () Bool)

(assert (=> b!988060 m!914533))

(assert (=> b!988060 m!913741))

(assert (=> b!988060 m!913755))

(assert (=> b!988060 m!913757))

(declare-fun m!914535 () Bool)

(assert (=> b!988058 m!914535))

(declare-fun m!914537 () Bool)

(assert (=> bm!41843 m!914537))

(assert (=> b!988059 m!913741))

(assert (=> b!988059 m!913741))

(assert (=> b!988059 m!913755))

(assert (=> b!988059 m!913757))

(assert (=> b!988059 m!913739))

(assert (=> b!988059 m!913739))

(declare-fun m!914539 () Bool)

(assert (=> b!988059 m!914539))

(assert (=> b!988059 m!913755))

(assert (=> b!988054 m!914537))

(assert (=> b!988057 m!913739))

(assert (=> b!988057 m!913739))

(declare-fun m!914541 () Bool)

(assert (=> b!988057 m!914541))

(declare-fun m!914543 () Bool)

(assert (=> d!116909 m!914543))

(assert (=> d!116909 m!913773))

(assert (=> b!988055 m!913739))

(assert (=> b!988055 m!913739))

(assert (=> b!988055 m!913771))

(assert (=> bm!41804 d!116909))

(declare-fun d!116911 () Bool)

(assert (=> d!116911 (= (validKeyInArray!0 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30024 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987663 d!116911))

(declare-fun d!116913 () Bool)

(assert (=> d!116913 (= (apply!886 lt!437973 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15596 (getValueByKey!515 (toList!6826 lt!437973) (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28005 () Bool)

(assert (= bs!28005 d!116913))

(assert (=> bs!28005 m!913977))

(declare-fun m!914545 () Bool)

(assert (=> bs!28005 m!914545))

(assert (=> bs!28005 m!914545))

(declare-fun m!914547 () Bool)

(assert (=> bs!28005 m!914547))

(assert (=> b!987761 d!116913))

(assert (=> b!987761 d!116805))

(declare-fun d!116915 () Bool)

(declare-fun e!557142 () Bool)

(assert (=> d!116915 e!557142))

(declare-fun res!660943 () Bool)

(assert (=> d!116915 (=> res!660943 e!557142)))

(declare-fun lt!438163 () Bool)

(assert (=> d!116915 (= res!660943 (not lt!438163))))

(declare-fun lt!438165 () Bool)

(assert (=> d!116915 (= lt!438163 lt!438165)))

(declare-fun lt!438162 () Unit!32656)

(declare-fun e!557141 () Unit!32656)

(assert (=> d!116915 (= lt!438162 e!557141)))

(declare-fun c!100110 () Bool)

(assert (=> d!116915 (= c!100110 lt!438165)))

(assert (=> d!116915 (= lt!438165 (containsKey!477 (toList!6826 lt!437973) (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!116915 (= (contains!5686 lt!437973 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!438163)))

(declare-fun b!988061 () Bool)

(declare-fun lt!438164 () Unit!32656)

(assert (=> b!988061 (= e!557141 lt!438164)))

(assert (=> b!988061 (= lt!438164 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!437973) (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988061 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437973) (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!988062 () Bool)

(declare-fun Unit!32670 () Unit!32656)

(assert (=> b!988062 (= e!557141 Unit!32670)))

(declare-fun b!988063 () Bool)

(assert (=> b!988063 (= e!557142 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437973) (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!116915 c!100110) b!988061))

(assert (= (and d!116915 (not c!100110)) b!988062))

(assert (= (and d!116915 (not res!660943)) b!988063))

(assert (=> d!116915 m!913977))

(declare-fun m!914549 () Bool)

(assert (=> d!116915 m!914549))

(assert (=> b!988061 m!913977))

(declare-fun m!914551 () Bool)

(assert (=> b!988061 m!914551))

(assert (=> b!988061 m!913977))

(assert (=> b!988061 m!914545))

(assert (=> b!988061 m!914545))

(declare-fun m!914553 () Bool)

(assert (=> b!988061 m!914553))

(assert (=> b!988063 m!913977))

(assert (=> b!988063 m!914545))

(assert (=> b!988063 m!914545))

(assert (=> b!988063 m!914553))

(assert (=> b!987763 d!116915))

(declare-fun d!116917 () Bool)

(declare-fun e!557144 () Bool)

(assert (=> d!116917 e!557144))

(declare-fun res!660944 () Bool)

(assert (=> d!116917 (=> res!660944 e!557144)))

(declare-fun lt!438167 () Bool)

(assert (=> d!116917 (= res!660944 (not lt!438167))))

(declare-fun lt!438169 () Bool)

(assert (=> d!116917 (= lt!438167 lt!438169)))

(declare-fun lt!438166 () Unit!32656)

(declare-fun e!557143 () Unit!32656)

(assert (=> d!116917 (= lt!438166 e!557143)))

(declare-fun c!100111 () Bool)

(assert (=> d!116917 (= c!100111 lt!438169)))

(assert (=> d!116917 (= lt!438169 (containsKey!477 (toList!6826 lt!438019) (_1!7478 lt!437809)))))

(assert (=> d!116917 (= (contains!5686 lt!438019 (_1!7478 lt!437809)) lt!438167)))

(declare-fun b!988064 () Bool)

(declare-fun lt!438168 () Unit!32656)

(assert (=> b!988064 (= e!557143 lt!438168)))

(assert (=> b!988064 (= lt!438168 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!438019) (_1!7478 lt!437809)))))

(assert (=> b!988064 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438019) (_1!7478 lt!437809)))))

(declare-fun b!988065 () Bool)

(declare-fun Unit!32671 () Unit!32656)

(assert (=> b!988065 (= e!557143 Unit!32671)))

(declare-fun b!988066 () Bool)

(assert (=> b!988066 (= e!557144 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438019) (_1!7478 lt!437809))))))

(assert (= (and d!116917 c!100111) b!988064))

(assert (= (and d!116917 (not c!100111)) b!988065))

(assert (= (and d!116917 (not res!660944)) b!988066))

(declare-fun m!914555 () Bool)

(assert (=> d!116917 m!914555))

(declare-fun m!914557 () Bool)

(assert (=> b!988064 m!914557))

(assert (=> b!988064 m!914095))

(assert (=> b!988064 m!914095))

(declare-fun m!914559 () Bool)

(assert (=> b!988064 m!914559))

(assert (=> b!988066 m!914095))

(assert (=> b!988066 m!914095))

(assert (=> b!988066 m!914559))

(assert (=> d!116785 d!116917))

(declare-fun b!988068 () Bool)

(declare-fun e!557145 () Option!521)

(declare-fun e!557146 () Option!521)

(assert (=> b!988068 (= e!557145 e!557146)))

(declare-fun c!100113 () Bool)

(assert (=> b!988068 (= c!100113 (and ((_ is Cons!20818) lt!438016) (not (= (_1!7478 (h!21980 lt!438016)) (_1!7478 lt!437809)))))))

(declare-fun b!988069 () Bool)

(assert (=> b!988069 (= e!557146 (getValueByKey!515 (t!29746 lt!438016) (_1!7478 lt!437809)))))

(declare-fun b!988070 () Bool)

(assert (=> b!988070 (= e!557146 None!519)))

(declare-fun d!116919 () Bool)

(declare-fun c!100112 () Bool)

(assert (=> d!116919 (= c!100112 (and ((_ is Cons!20818) lt!438016) (= (_1!7478 (h!21980 lt!438016)) (_1!7478 lt!437809))))))

(assert (=> d!116919 (= (getValueByKey!515 lt!438016 (_1!7478 lt!437809)) e!557145)))

(declare-fun b!988067 () Bool)

(assert (=> b!988067 (= e!557145 (Some!520 (_2!7478 (h!21980 lt!438016))))))

(assert (= (and d!116919 c!100112) b!988067))

(assert (= (and d!116919 (not c!100112)) b!988068))

(assert (= (and b!988068 c!100113) b!988069))

(assert (= (and b!988068 (not c!100113)) b!988070))

(declare-fun m!914561 () Bool)

(assert (=> b!988069 m!914561))

(assert (=> d!116785 d!116919))

(declare-fun d!116921 () Bool)

(assert (=> d!116921 (= (getValueByKey!515 lt!438016 (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809)))))

(declare-fun lt!438170 () Unit!32656)

(assert (=> d!116921 (= lt!438170 (choose!1615 lt!438016 (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(declare-fun e!557147 () Bool)

(assert (=> d!116921 e!557147))

(declare-fun res!660945 () Bool)

(assert (=> d!116921 (=> (not res!660945) (not e!557147))))

(assert (=> d!116921 (= res!660945 (isStrictlySorted!511 lt!438016))))

(assert (=> d!116921 (= (lemmaContainsTupThenGetReturnValue!272 lt!438016 (_1!7478 lt!437809) (_2!7478 lt!437809)) lt!438170)))

(declare-fun b!988071 () Bool)

(declare-fun res!660946 () Bool)

(assert (=> b!988071 (=> (not res!660946) (not e!557147))))

(assert (=> b!988071 (= res!660946 (containsKey!477 lt!438016 (_1!7478 lt!437809)))))

(declare-fun b!988072 () Bool)

(assert (=> b!988072 (= e!557147 (contains!5687 lt!438016 (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809))))))

(assert (= (and d!116921 res!660945) b!988071))

(assert (= (and b!988071 res!660946) b!988072))

(assert (=> d!116921 m!914089))

(declare-fun m!914563 () Bool)

(assert (=> d!116921 m!914563))

(declare-fun m!914565 () Bool)

(assert (=> d!116921 m!914565))

(declare-fun m!914567 () Bool)

(assert (=> b!988071 m!914567))

(declare-fun m!914569 () Bool)

(assert (=> b!988072 m!914569))

(assert (=> d!116785 d!116921))

(declare-fun b!988073 () Bool)

(declare-fun e!557150 () List!20822)

(declare-fun call!41849 () List!20822)

(assert (=> b!988073 (= e!557150 call!41849)))

(declare-fun b!988074 () Bool)

(declare-fun e!557151 () List!20822)

(assert (=> b!988074 (= e!557151 (insertStrictlySorted!329 (t!29746 (toList!6826 lt!437801)) (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(declare-fun b!988075 () Bool)

(declare-fun e!557149 () List!20822)

(assert (=> b!988075 (= e!557149 e!557150)))

(declare-fun c!100115 () Bool)

(assert (=> b!988075 (= c!100115 (and ((_ is Cons!20818) (toList!6826 lt!437801)) (= (_1!7478 (h!21980 (toList!6826 lt!437801))) (_1!7478 lt!437809))))))

(declare-fun b!988076 () Bool)

(declare-fun res!660947 () Bool)

(declare-fun e!557152 () Bool)

(assert (=> b!988076 (=> (not res!660947) (not e!557152))))

(declare-fun lt!438171 () List!20822)

(assert (=> b!988076 (= res!660947 (containsKey!477 lt!438171 (_1!7478 lt!437809)))))

(declare-fun b!988077 () Bool)

(declare-fun call!41847 () List!20822)

(assert (=> b!988077 (= e!557149 call!41847)))

(declare-fun d!116923 () Bool)

(assert (=> d!116923 e!557152))

(declare-fun res!660948 () Bool)

(assert (=> d!116923 (=> (not res!660948) (not e!557152))))

(assert (=> d!116923 (= res!660948 (isStrictlySorted!511 lt!438171))))

(assert (=> d!116923 (= lt!438171 e!557149)))

(declare-fun c!100114 () Bool)

(assert (=> d!116923 (= c!100114 (and ((_ is Cons!20818) (toList!6826 lt!437801)) (bvslt (_1!7478 (h!21980 (toList!6826 lt!437801))) (_1!7478 lt!437809))))))

(assert (=> d!116923 (isStrictlySorted!511 (toList!6826 lt!437801))))

(assert (=> d!116923 (= (insertStrictlySorted!329 (toList!6826 lt!437801) (_1!7478 lt!437809) (_2!7478 lt!437809)) lt!438171)))

(declare-fun b!988078 () Bool)

(declare-fun c!100117 () Bool)

(assert (=> b!988078 (= c!100117 (and ((_ is Cons!20818) (toList!6826 lt!437801)) (bvsgt (_1!7478 (h!21980 (toList!6826 lt!437801))) (_1!7478 lt!437809))))))

(declare-fun e!557148 () List!20822)

(assert (=> b!988078 (= e!557150 e!557148)))

(declare-fun b!988079 () Bool)

(declare-fun call!41848 () List!20822)

(assert (=> b!988079 (= e!557148 call!41848)))

(declare-fun b!988080 () Bool)

(assert (=> b!988080 (= e!557151 (ite c!100115 (t!29746 (toList!6826 lt!437801)) (ite c!100117 (Cons!20818 (h!21980 (toList!6826 lt!437801)) (t!29746 (toList!6826 lt!437801))) Nil!20819)))))

(declare-fun bm!41844 () Bool)

(assert (=> bm!41844 (= call!41848 call!41849)))

(declare-fun bm!41845 () Bool)

(assert (=> bm!41845 (= call!41849 call!41847)))

(declare-fun bm!41846 () Bool)

(assert (=> bm!41846 (= call!41847 ($colon$colon!555 e!557151 (ite c!100114 (h!21980 (toList!6826 lt!437801)) (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809)))))))

(declare-fun c!100116 () Bool)

(assert (=> bm!41846 (= c!100116 c!100114)))

(declare-fun b!988081 () Bool)

(assert (=> b!988081 (= e!557148 call!41848)))

(declare-fun b!988082 () Bool)

(assert (=> b!988082 (= e!557152 (contains!5687 lt!438171 (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809))))))

(assert (= (and d!116923 c!100114) b!988077))

(assert (= (and d!116923 (not c!100114)) b!988075))

(assert (= (and b!988075 c!100115) b!988073))

(assert (= (and b!988075 (not c!100115)) b!988078))

(assert (= (and b!988078 c!100117) b!988081))

(assert (= (and b!988078 (not c!100117)) b!988079))

(assert (= (or b!988081 b!988079) bm!41844))

(assert (= (or b!988073 bm!41844) bm!41845))

(assert (= (or b!988077 bm!41845) bm!41846))

(assert (= (and bm!41846 c!100116) b!988074))

(assert (= (and bm!41846 (not c!100116)) b!988080))

(assert (= (and d!116923 res!660948) b!988076))

(assert (= (and b!988076 res!660947) b!988082))

(declare-fun m!914571 () Bool)

(assert (=> b!988082 m!914571))

(declare-fun m!914573 () Bool)

(assert (=> bm!41846 m!914573))

(declare-fun m!914575 () Bool)

(assert (=> b!988074 m!914575))

(declare-fun m!914577 () Bool)

(assert (=> d!116923 m!914577))

(assert (=> d!116923 m!914517))

(declare-fun m!914579 () Bool)

(assert (=> b!988076 m!914579))

(assert (=> d!116785 d!116923))

(declare-fun d!116925 () Bool)

(declare-fun e!557154 () Bool)

(assert (=> d!116925 e!557154))

(declare-fun res!660949 () Bool)

(assert (=> d!116925 (=> res!660949 e!557154)))

(declare-fun lt!438173 () Bool)

(assert (=> d!116925 (= res!660949 (not lt!438173))))

(declare-fun lt!438175 () Bool)

(assert (=> d!116925 (= lt!438173 lt!438175)))

(declare-fun lt!438172 () Unit!32656)

(declare-fun e!557153 () Unit!32656)

(assert (=> d!116925 (= lt!438172 e!557153)))

(declare-fun c!100118 () Bool)

(assert (=> d!116925 (= c!100118 lt!438175)))

(assert (=> d!116925 (= lt!438175 (containsKey!477 (toList!6826 lt!438013) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116925 (= (contains!5686 lt!438013 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438173)))

(declare-fun b!988083 () Bool)

(declare-fun lt!438174 () Unit!32656)

(assert (=> b!988083 (= e!557153 lt!438174)))

(assert (=> b!988083 (= lt!438174 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!438013) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988083 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438013) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988084 () Bool)

(declare-fun Unit!32672 () Unit!32656)

(assert (=> b!988084 (= e!557153 Unit!32672)))

(declare-fun b!988085 () Bool)

(assert (=> b!988085 (= e!557154 (isDefined!385 (getValueByKey!515 (toList!6826 lt!438013) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116925 c!100118) b!988083))

(assert (= (and d!116925 (not c!100118)) b!988084))

(assert (= (and d!116925 (not res!660949)) b!988085))

(declare-fun m!914581 () Bool)

(assert (=> d!116925 m!914581))

(declare-fun m!914583 () Bool)

(assert (=> b!988083 m!914583))

(declare-fun m!914585 () Bool)

(assert (=> b!988083 m!914585))

(assert (=> b!988083 m!914585))

(declare-fun m!914587 () Bool)

(assert (=> b!988083 m!914587))

(assert (=> b!988085 m!914585))

(assert (=> b!988085 m!914585))

(assert (=> b!988085 m!914587))

(assert (=> d!116783 d!116925))

(assert (=> d!116783 d!116795))

(declare-fun b!988087 () Bool)

(declare-fun e!557155 () Option!521)

(declare-fun e!557156 () Option!521)

(assert (=> b!988087 (= e!557155 e!557156)))

(declare-fun c!100120 () Bool)

(assert (=> b!988087 (= c!100120 (and ((_ is Cons!20818) (toList!6826 lt!437890)) (not (= (_1!7478 (h!21980 (toList!6826 lt!437890))) (_1!7478 lt!437809)))))))

(declare-fun b!988088 () Bool)

(assert (=> b!988088 (= e!557156 (getValueByKey!515 (t!29746 (toList!6826 lt!437890)) (_1!7478 lt!437809)))))

(declare-fun b!988089 () Bool)

(assert (=> b!988089 (= e!557156 None!519)))

(declare-fun d!116927 () Bool)

(declare-fun c!100119 () Bool)

(assert (=> d!116927 (= c!100119 (and ((_ is Cons!20818) (toList!6826 lt!437890)) (= (_1!7478 (h!21980 (toList!6826 lt!437890))) (_1!7478 lt!437809))))))

(assert (=> d!116927 (= (getValueByKey!515 (toList!6826 lt!437890) (_1!7478 lt!437809)) e!557155)))

(declare-fun b!988086 () Bool)

(assert (=> b!988086 (= e!557155 (Some!520 (_2!7478 (h!21980 (toList!6826 lt!437890)))))))

(assert (= (and d!116927 c!100119) b!988086))

(assert (= (and d!116927 (not c!100119)) b!988087))

(assert (= (and b!988087 c!100120) b!988088))

(assert (= (and b!988087 (not c!100120)) b!988089))

(declare-fun m!914589 () Bool)

(assert (=> b!988088 m!914589))

(assert (=> b!987680 d!116927))

(declare-fun b!988091 () Bool)

(declare-fun e!557157 () Option!521)

(declare-fun e!557158 () Option!521)

(assert (=> b!988091 (= e!557157 e!557158)))

(declare-fun c!100122 () Bool)

(assert (=> b!988091 (= c!100122 (and ((_ is Cons!20818) (toList!6826 lt!438027)) (not (= (_1!7478 (h!21980 (toList!6826 lt!438027))) (_1!7478 lt!437808)))))))

(declare-fun b!988092 () Bool)

(assert (=> b!988092 (= e!557158 (getValueByKey!515 (t!29746 (toList!6826 lt!438027)) (_1!7478 lt!437808)))))

(declare-fun b!988093 () Bool)

(assert (=> b!988093 (= e!557158 None!519)))

(declare-fun d!116929 () Bool)

(declare-fun c!100121 () Bool)

(assert (=> d!116929 (= c!100121 (and ((_ is Cons!20818) (toList!6826 lt!438027)) (= (_1!7478 (h!21980 (toList!6826 lt!438027))) (_1!7478 lt!437808))))))

(assert (=> d!116929 (= (getValueByKey!515 (toList!6826 lt!438027) (_1!7478 lt!437808)) e!557157)))

(declare-fun b!988090 () Bool)

(assert (=> b!988090 (= e!557157 (Some!520 (_2!7478 (h!21980 (toList!6826 lt!438027)))))))

(assert (= (and d!116929 c!100121) b!988090))

(assert (= (and d!116929 (not c!100121)) b!988091))

(assert (= (and b!988091 c!100122) b!988092))

(assert (= (and b!988091 (not c!100122)) b!988093))

(declare-fun m!914591 () Bool)

(assert (=> b!988092 m!914591))

(assert (=> b!987818 d!116929))

(declare-fun d!116931 () Bool)

(declare-fun e!557160 () Bool)

(assert (=> d!116931 e!557160))

(declare-fun res!660950 () Bool)

(assert (=> d!116931 (=> res!660950 e!557160)))

(declare-fun lt!438177 () Bool)

(assert (=> d!116931 (= res!660950 (not lt!438177))))

(declare-fun lt!438179 () Bool)

(assert (=> d!116931 (= lt!438177 lt!438179)))

(declare-fun lt!438176 () Unit!32656)

(declare-fun e!557159 () Unit!32656)

(assert (=> d!116931 (= lt!438176 e!557159)))

(declare-fun c!100123 () Bool)

(assert (=> d!116931 (= c!100123 lt!438179)))

(assert (=> d!116931 (= lt!438179 (containsKey!477 (toList!6826 lt!437947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116931 (= (contains!5686 lt!437947 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438177)))

(declare-fun b!988094 () Bool)

(declare-fun lt!438178 () Unit!32656)

(assert (=> b!988094 (= e!557159 lt!438178)))

(assert (=> b!988094 (= lt!438178 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!437947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988094 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437947) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988095 () Bool)

(declare-fun Unit!32673 () Unit!32656)

(assert (=> b!988095 (= e!557159 Unit!32673)))

(declare-fun b!988096 () Bool)

(assert (=> b!988096 (= e!557160 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116931 c!100123) b!988094))

(assert (= (and d!116931 (not c!100123)) b!988095))

(assert (= (and d!116931 (not res!660950)) b!988096))

(declare-fun m!914593 () Bool)

(assert (=> d!116931 m!914593))

(declare-fun m!914595 () Bool)

(assert (=> b!988094 m!914595))

(declare-fun m!914597 () Bool)

(assert (=> b!988094 m!914597))

(assert (=> b!988094 m!914597))

(declare-fun m!914599 () Bool)

(assert (=> b!988094 m!914599))

(assert (=> b!988096 m!914597))

(assert (=> b!988096 m!914597))

(assert (=> b!988096 m!914599))

(assert (=> bm!41809 d!116931))

(declare-fun b!988098 () Bool)

(declare-fun e!557161 () Option!521)

(declare-fun e!557162 () Option!521)

(assert (=> b!988098 (= e!557161 e!557162)))

(declare-fun c!100125 () Bool)

(assert (=> b!988098 (= c!100125 (and ((_ is Cons!20818) (toList!6826 lt!437993)) (not (= (_1!7478 (h!21980 (toList!6826 lt!437993))) (_1!7478 lt!437802)))))))

(declare-fun b!988099 () Bool)

(assert (=> b!988099 (= e!557162 (getValueByKey!515 (t!29746 (toList!6826 lt!437993)) (_1!7478 lt!437802)))))

(declare-fun b!988100 () Bool)

(assert (=> b!988100 (= e!557162 None!519)))

(declare-fun d!116933 () Bool)

(declare-fun c!100124 () Bool)

(assert (=> d!116933 (= c!100124 (and ((_ is Cons!20818) (toList!6826 lt!437993)) (= (_1!7478 (h!21980 (toList!6826 lt!437993))) (_1!7478 lt!437802))))))

(assert (=> d!116933 (= (getValueByKey!515 (toList!6826 lt!437993) (_1!7478 lt!437802)) e!557161)))

(declare-fun b!988097 () Bool)

(assert (=> b!988097 (= e!557161 (Some!520 (_2!7478 (h!21980 (toList!6826 lt!437993)))))))

(assert (= (and d!116933 c!100124) b!988097))

(assert (= (and d!116933 (not c!100124)) b!988098))

(assert (= (and b!988098 c!100125) b!988099))

(assert (= (and b!988098 (not c!100125)) b!988100))

(declare-fun m!914601 () Bool)

(assert (=> b!988099 m!914601))

(assert (=> b!987770 d!116933))

(declare-fun b!988102 () Bool)

(declare-fun e!557163 () Option!521)

(declare-fun e!557164 () Option!521)

(assert (=> b!988102 (= e!557163 e!557164)))

(declare-fun c!100127 () Bool)

(assert (=> b!988102 (= c!100127 (and ((_ is Cons!20818) (toList!6826 lt!437894)) (not (= (_1!7478 (h!21980 (toList!6826 lt!437894))) (_1!7478 lt!437808)))))))

(declare-fun b!988103 () Bool)

(assert (=> b!988103 (= e!557164 (getValueByKey!515 (t!29746 (toList!6826 lt!437894)) (_1!7478 lt!437808)))))

(declare-fun b!988104 () Bool)

(assert (=> b!988104 (= e!557164 None!519)))

(declare-fun d!116935 () Bool)

(declare-fun c!100126 () Bool)

(assert (=> d!116935 (= c!100126 (and ((_ is Cons!20818) (toList!6826 lt!437894)) (= (_1!7478 (h!21980 (toList!6826 lt!437894))) (_1!7478 lt!437808))))))

(assert (=> d!116935 (= (getValueByKey!515 (toList!6826 lt!437894) (_1!7478 lt!437808)) e!557163)))

(declare-fun b!988101 () Bool)

(assert (=> b!988101 (= e!557163 (Some!520 (_2!7478 (h!21980 (toList!6826 lt!437894)))))))

(assert (= (and d!116935 c!100126) b!988101))

(assert (= (and d!116935 (not c!100126)) b!988102))

(assert (= (and b!988102 c!100127) b!988103))

(assert (= (and b!988102 (not c!100127)) b!988104))

(declare-fun m!914603 () Bool)

(assert (=> b!988103 m!914603))

(assert (=> b!987682 d!116935))

(declare-fun d!116937 () Bool)

(assert (=> d!116937 (not (contains!5686 (+!3102 lt!438009 (tuple2!14935 lt!438012 lt!438015)) lt!438010))))

(declare-fun lt!438182 () Unit!32656)

(declare-fun choose!1616 (ListLongMap!13621 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32656)

(assert (=> d!116937 (= lt!438182 (choose!1616 lt!438009 lt!438012 lt!438015 lt!438010))))

(declare-fun e!557167 () Bool)

(assert (=> d!116937 e!557167))

(declare-fun res!660953 () Bool)

(assert (=> d!116937 (=> (not res!660953) (not e!557167))))

(assert (=> d!116937 (= res!660953 (not (contains!5686 lt!438009 lt!438010)))))

(assert (=> d!116937 (= (addStillNotContains!233 lt!438009 lt!438012 lt!438015 lt!438010) lt!438182)))

(declare-fun b!988108 () Bool)

(assert (=> b!988108 (= e!557167 (not (= lt!438012 lt!438010)))))

(assert (= (and d!116937 res!660953) b!988108))

(assert (=> d!116937 m!914071))

(assert (=> d!116937 m!914071))

(assert (=> d!116937 m!914075))

(declare-fun m!914605 () Bool)

(assert (=> d!116937 m!914605))

(declare-fun m!914607 () Bool)

(assert (=> d!116937 m!914607))

(assert (=> b!987813 d!116937))

(declare-fun d!116939 () Bool)

(declare-fun e!557168 () Bool)

(assert (=> d!116939 e!557168))

(declare-fun res!660955 () Bool)

(assert (=> d!116939 (=> (not res!660955) (not e!557168))))

(declare-fun lt!438186 () ListLongMap!13621)

(assert (=> d!116939 (= res!660955 (contains!5686 lt!438186 (_1!7478 (tuple2!14935 lt!438012 lt!438015))))))

(declare-fun lt!438183 () List!20822)

(assert (=> d!116939 (= lt!438186 (ListLongMap!13622 lt!438183))))

(declare-fun lt!438184 () Unit!32656)

(declare-fun lt!438185 () Unit!32656)

(assert (=> d!116939 (= lt!438184 lt!438185)))

(assert (=> d!116939 (= (getValueByKey!515 lt!438183 (_1!7478 (tuple2!14935 lt!438012 lt!438015))) (Some!520 (_2!7478 (tuple2!14935 lt!438012 lt!438015))))))

(assert (=> d!116939 (= lt!438185 (lemmaContainsTupThenGetReturnValue!272 lt!438183 (_1!7478 (tuple2!14935 lt!438012 lt!438015)) (_2!7478 (tuple2!14935 lt!438012 lt!438015))))))

(assert (=> d!116939 (= lt!438183 (insertStrictlySorted!329 (toList!6826 lt!438009) (_1!7478 (tuple2!14935 lt!438012 lt!438015)) (_2!7478 (tuple2!14935 lt!438012 lt!438015))))))

(assert (=> d!116939 (= (+!3102 lt!438009 (tuple2!14935 lt!438012 lt!438015)) lt!438186)))

(declare-fun b!988109 () Bool)

(declare-fun res!660954 () Bool)

(assert (=> b!988109 (=> (not res!660954) (not e!557168))))

(assert (=> b!988109 (= res!660954 (= (getValueByKey!515 (toList!6826 lt!438186) (_1!7478 (tuple2!14935 lt!438012 lt!438015))) (Some!520 (_2!7478 (tuple2!14935 lt!438012 lt!438015)))))))

(declare-fun b!988110 () Bool)

(assert (=> b!988110 (= e!557168 (contains!5687 (toList!6826 lt!438186) (tuple2!14935 lt!438012 lt!438015)))))

(assert (= (and d!116939 res!660955) b!988109))

(assert (= (and b!988109 res!660954) b!988110))

(declare-fun m!914609 () Bool)

(assert (=> d!116939 m!914609))

(declare-fun m!914611 () Bool)

(assert (=> d!116939 m!914611))

(declare-fun m!914613 () Bool)

(assert (=> d!116939 m!914613))

(declare-fun m!914615 () Bool)

(assert (=> d!116939 m!914615))

(declare-fun m!914617 () Bool)

(assert (=> b!988109 m!914617))

(declare-fun m!914619 () Bool)

(assert (=> b!988110 m!914619))

(assert (=> b!987813 d!116939))

(declare-fun d!116941 () Bool)

(declare-fun e!557170 () Bool)

(assert (=> d!116941 e!557170))

(declare-fun res!660956 () Bool)

(assert (=> d!116941 (=> res!660956 e!557170)))

(declare-fun lt!438188 () Bool)

(assert (=> d!116941 (= res!660956 (not lt!438188))))

(declare-fun lt!438190 () Bool)

(assert (=> d!116941 (= lt!438188 lt!438190)))

(declare-fun lt!438187 () Unit!32656)

(declare-fun e!557169 () Unit!32656)

(assert (=> d!116941 (= lt!438187 e!557169)))

(declare-fun c!100128 () Bool)

(assert (=> d!116941 (= c!100128 lt!438190)))

(assert (=> d!116941 (= lt!438190 (containsKey!477 (toList!6826 (+!3102 lt!438009 (tuple2!14935 lt!438012 lt!438015))) lt!438010))))

(assert (=> d!116941 (= (contains!5686 (+!3102 lt!438009 (tuple2!14935 lt!438012 lt!438015)) lt!438010) lt!438188)))

(declare-fun b!988111 () Bool)

(declare-fun lt!438189 () Unit!32656)

(assert (=> b!988111 (= e!557169 lt!438189)))

(assert (=> b!988111 (= lt!438189 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 (+!3102 lt!438009 (tuple2!14935 lt!438012 lt!438015))) lt!438010))))

(assert (=> b!988111 (isDefined!385 (getValueByKey!515 (toList!6826 (+!3102 lt!438009 (tuple2!14935 lt!438012 lt!438015))) lt!438010))))

(declare-fun b!988112 () Bool)

(declare-fun Unit!32674 () Unit!32656)

(assert (=> b!988112 (= e!557169 Unit!32674)))

(declare-fun b!988113 () Bool)

(assert (=> b!988113 (= e!557170 (isDefined!385 (getValueByKey!515 (toList!6826 (+!3102 lt!438009 (tuple2!14935 lt!438012 lt!438015))) lt!438010)))))

(assert (= (and d!116941 c!100128) b!988111))

(assert (= (and d!116941 (not c!100128)) b!988112))

(assert (= (and d!116941 (not res!660956)) b!988113))

(declare-fun m!914621 () Bool)

(assert (=> d!116941 m!914621))

(declare-fun m!914623 () Bool)

(assert (=> b!988111 m!914623))

(declare-fun m!914625 () Bool)

(assert (=> b!988111 m!914625))

(assert (=> b!988111 m!914625))

(declare-fun m!914627 () Bool)

(assert (=> b!988111 m!914627))

(assert (=> b!988113 m!914625))

(assert (=> b!988113 m!914625))

(assert (=> b!988113 m!914627))

(assert (=> b!987813 d!116941))

(declare-fun d!116943 () Bool)

(declare-fun e!557171 () Bool)

(assert (=> d!116943 e!557171))

(declare-fun res!660958 () Bool)

(assert (=> d!116943 (=> (not res!660958) (not e!557171))))

(declare-fun lt!438194 () ListLongMap!13621)

(assert (=> d!116943 (= res!660958 (contains!5686 lt!438194 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!438191 () List!20822)

(assert (=> d!116943 (= lt!438194 (ListLongMap!13622 lt!438191))))

(declare-fun lt!438192 () Unit!32656)

(declare-fun lt!438193 () Unit!32656)

(assert (=> d!116943 (= lt!438192 lt!438193)))

(assert (=> d!116943 (= (getValueByKey!515 lt!438191 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!520 (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!116943 (= lt!438193 (lemmaContainsTupThenGetReturnValue!272 lt!438191 (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!116943 (= lt!438191 (insertStrictlySorted!329 (toList!6826 call!41822) (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!116943 (= (+!3102 call!41822 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!438194)))

(declare-fun b!988114 () Bool)

(declare-fun res!660957 () Bool)

(assert (=> b!988114 (=> (not res!660957) (not e!557171))))

(assert (=> b!988114 (= res!660957 (= (getValueByKey!515 (toList!6826 lt!438194) (_1!7478 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!520 (_2!7478 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!988115 () Bool)

(assert (=> b!988115 (= e!557171 (contains!5687 (toList!6826 lt!438194) (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!116943 res!660958) b!988114))

(assert (= (and b!988114 res!660957) b!988115))

(declare-fun m!914629 () Bool)

(assert (=> d!116943 m!914629))

(declare-fun m!914631 () Bool)

(assert (=> d!116943 m!914631))

(declare-fun m!914633 () Bool)

(assert (=> d!116943 m!914633))

(declare-fun m!914635 () Bool)

(assert (=> d!116943 m!914635))

(declare-fun m!914637 () Bool)

(assert (=> b!988114 m!914637))

(declare-fun m!914639 () Bool)

(assert (=> b!988115 m!914639))

(assert (=> b!987813 d!116943))

(assert (=> b!987813 d!116805))

(declare-fun b!988117 () Bool)

(declare-fun e!557172 () Option!521)

(declare-fun e!557173 () Option!521)

(assert (=> b!988117 (= e!557172 e!557173)))

(declare-fun c!100130 () Bool)

(assert (=> b!988117 (= c!100130 (and ((_ is Cons!20818) (toList!6826 lt!438031)) (not (= (_1!7478 (h!21980 (toList!6826 lt!438031))) (_1!7478 lt!437802)))))))

(declare-fun b!988118 () Bool)

(assert (=> b!988118 (= e!557173 (getValueByKey!515 (t!29746 (toList!6826 lt!438031)) (_1!7478 lt!437802)))))

(declare-fun b!988119 () Bool)

(assert (=> b!988119 (= e!557173 None!519)))

(declare-fun d!116945 () Bool)

(declare-fun c!100129 () Bool)

(assert (=> d!116945 (= c!100129 (and ((_ is Cons!20818) (toList!6826 lt!438031)) (= (_1!7478 (h!21980 (toList!6826 lt!438031))) (_1!7478 lt!437802))))))

(assert (=> d!116945 (= (getValueByKey!515 (toList!6826 lt!438031) (_1!7478 lt!437802)) e!557172)))

(declare-fun b!988116 () Bool)

(assert (=> b!988116 (= e!557172 (Some!520 (_2!7478 (h!21980 (toList!6826 lt!438031)))))))

(assert (= (and d!116945 c!100129) b!988116))

(assert (= (and d!116945 (not c!100129)) b!988117))

(assert (= (and b!988117 c!100130) b!988118))

(assert (= (and b!988117 (not c!100130)) b!988119))

(declare-fun m!914641 () Bool)

(assert (=> b!988118 m!914641))

(assert (=> b!987820 d!116945))

(declare-fun d!116947 () Bool)

(declare-fun e!557175 () Bool)

(assert (=> d!116947 e!557175))

(declare-fun res!660959 () Bool)

(assert (=> d!116947 (=> res!660959 e!557175)))

(declare-fun lt!438196 () Bool)

(assert (=> d!116947 (= res!660959 (not lt!438196))))

(declare-fun lt!438198 () Bool)

(assert (=> d!116947 (= lt!438196 lt!438198)))

(declare-fun lt!438195 () Unit!32656)

(declare-fun e!557174 () Unit!32656)

(assert (=> d!116947 (= lt!438195 e!557174)))

(declare-fun c!100131 () Bool)

(assert (=> d!116947 (= c!100131 lt!438198)))

(assert (=> d!116947 (= lt!438198 (containsKey!477 (toList!6826 lt!437973) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116947 (= (contains!5686 lt!437973 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438196)))

(declare-fun b!988120 () Bool)

(declare-fun lt!438197 () Unit!32656)

(assert (=> b!988120 (= e!557174 lt!438197)))

(assert (=> b!988120 (= lt!438197 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!437973) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988120 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437973) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988121 () Bool)

(declare-fun Unit!32675 () Unit!32656)

(assert (=> b!988121 (= e!557174 Unit!32675)))

(declare-fun b!988122 () Bool)

(assert (=> b!988122 (= e!557175 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437973) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116947 c!100131) b!988120))

(assert (= (and d!116947 (not c!100131)) b!988121))

(assert (= (and d!116947 (not res!660959)) b!988122))

(declare-fun m!914643 () Bool)

(assert (=> d!116947 m!914643))

(declare-fun m!914645 () Bool)

(assert (=> b!988120 m!914645))

(declare-fun m!914647 () Bool)

(assert (=> b!988120 m!914647))

(assert (=> b!988120 m!914647))

(declare-fun m!914649 () Bool)

(assert (=> b!988120 m!914649))

(assert (=> b!988122 m!914647))

(assert (=> b!988122 m!914647))

(assert (=> b!988122 m!914649))

(assert (=> bm!41813 d!116947))

(assert (=> b!987675 d!116911))

(declare-fun d!116949 () Bool)

(assert (=> d!116949 (= (apply!886 lt!437973 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15596 (getValueByKey!515 (toList!6826 lt!437973) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28006 () Bool)

(assert (= bs!28006 d!116949))

(assert (=> bs!28006 m!914647))

(assert (=> bs!28006 m!914647))

(declare-fun m!914651 () Bool)

(assert (=> bs!28006 m!914651))

(assert (=> b!987758 d!116949))

(declare-fun b!988124 () Bool)

(declare-fun e!557176 () Option!521)

(declare-fun e!557177 () Option!521)

(assert (=> b!988124 (= e!557176 e!557177)))

(declare-fun c!100133 () Bool)

(assert (=> b!988124 (= c!100133 (and ((_ is Cons!20818) (toList!6826 lt!437964)) (not (= (_1!7478 (h!21980 (toList!6826 lt!437964))) (_1!7478 lt!437809)))))))

(declare-fun b!988125 () Bool)

(assert (=> b!988125 (= e!557177 (getValueByKey!515 (t!29746 (toList!6826 lt!437964)) (_1!7478 lt!437809)))))

(declare-fun b!988126 () Bool)

(assert (=> b!988126 (= e!557177 None!519)))

(declare-fun d!116951 () Bool)

(declare-fun c!100132 () Bool)

(assert (=> d!116951 (= c!100132 (and ((_ is Cons!20818) (toList!6826 lt!437964)) (= (_1!7478 (h!21980 (toList!6826 lt!437964))) (_1!7478 lt!437809))))))

(assert (=> d!116951 (= (getValueByKey!515 (toList!6826 lt!437964) (_1!7478 lt!437809)) e!557176)))

(declare-fun b!988123 () Bool)

(assert (=> b!988123 (= e!557176 (Some!520 (_2!7478 (h!21980 (toList!6826 lt!437964)))))))

(assert (= (and d!116951 c!100132) b!988123))

(assert (= (and d!116951 (not c!100132)) b!988124))

(assert (= (and b!988124 c!100133) b!988125))

(assert (= (and b!988124 (not c!100133)) b!988126))

(declare-fun m!914653 () Bool)

(assert (=> b!988125 m!914653))

(assert (=> b!987747 d!116951))

(declare-fun d!116953 () Bool)

(declare-fun lt!438201 () Bool)

(declare-fun content!417 (List!20823) (InoxSet (_ BitVec 64)))

(assert (=> d!116953 (= lt!438201 (select (content!417 Nil!20820) (select (arr!30024 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!557183 () Bool)

(assert (=> d!116953 (= lt!438201 e!557183)))

(declare-fun res!660965 () Bool)

(assert (=> d!116953 (=> (not res!660965) (not e!557183))))

(assert (=> d!116953 (= res!660965 ((_ is Cons!20819) Nil!20820))))

(assert (=> d!116953 (= (contains!5685 Nil!20820 (select (arr!30024 _keys!1544) #b00000000000000000000000000000000)) lt!438201)))

(declare-fun b!988131 () Bool)

(declare-fun e!557182 () Bool)

(assert (=> b!988131 (= e!557183 e!557182)))

(declare-fun res!660964 () Bool)

(assert (=> b!988131 (=> res!660964 e!557182)))

(assert (=> b!988131 (= res!660964 (= (h!21981 Nil!20820) (select (arr!30024 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988132 () Bool)

(assert (=> b!988132 (= e!557182 (contains!5685 (t!29747 Nil!20820) (select (arr!30024 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!116953 res!660965) b!988131))

(assert (= (and b!988131 (not res!660964)) b!988132))

(declare-fun m!914655 () Bool)

(assert (=> d!116953 m!914655))

(assert (=> d!116953 m!913877))

(declare-fun m!914657 () Bool)

(assert (=> d!116953 m!914657))

(assert (=> b!988132 m!913877))

(declare-fun m!914659 () Bool)

(assert (=> b!988132 m!914659))

(assert (=> b!987661 d!116953))

(declare-fun d!116955 () Bool)

(assert (=> d!116955 (= (apply!886 lt!437947 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15596 (getValueByKey!515 (toList!6826 lt!437947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28007 () Bool)

(assert (= bs!28007 d!116955))

(assert (=> bs!28007 m!914597))

(assert (=> bs!28007 m!914597))

(declare-fun m!914661 () Bool)

(assert (=> bs!28007 m!914661))

(assert (=> b!987745 d!116955))

(declare-fun b!988133 () Bool)

(declare-fun e!557189 () Bool)

(declare-fun e!557187 () Bool)

(assert (=> b!988133 (= e!557189 e!557187)))

(declare-fun c!100136 () Bool)

(assert (=> b!988133 (= c!100136 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30505 _keys!1544)))))

(declare-fun bm!41847 () Bool)

(declare-fun call!41850 () ListLongMap!13621)

(assert (=> bm!41847 (= call!41850 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!988134 () Bool)

(declare-fun e!557188 () Bool)

(assert (=> b!988134 (= e!557188 e!557189)))

(declare-fun c!100135 () Bool)

(declare-fun e!557185 () Bool)

(assert (=> b!988134 (= c!100135 e!557185)))

(declare-fun res!660968 () Bool)

(assert (=> b!988134 (=> (not res!660968) (not e!557185))))

(assert (=> b!988134 (= res!660968 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30505 _keys!1544)))))

(declare-fun b!988135 () Bool)

(declare-fun e!557190 () ListLongMap!13621)

(assert (=> b!988135 (= e!557190 (ListLongMap!13622 Nil!20819))))

(declare-fun b!988136 () Bool)

(declare-fun res!660967 () Bool)

(assert (=> b!988136 (=> (not res!660967) (not e!557188))))

(declare-fun lt!438206 () ListLongMap!13621)

(assert (=> b!988136 (= res!660967 (not (contains!5686 lt!438206 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988137 () Bool)

(declare-fun e!557184 () ListLongMap!13621)

(assert (=> b!988137 (= e!557184 call!41850)))

(declare-fun b!988138 () Bool)

(assert (=> b!988138 (= e!557187 (= lt!438206 (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun d!116957 () Bool)

(assert (=> d!116957 e!557188))

(declare-fun res!660966 () Bool)

(assert (=> d!116957 (=> (not res!660966) (not e!557188))))

(assert (=> d!116957 (= res!660966 (not (contains!5686 lt!438206 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!116957 (= lt!438206 e!557190)))

(declare-fun c!100134 () Bool)

(assert (=> d!116957 (= c!100134 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30505 _keys!1544)))))

(assert (=> d!116957 (validMask!0 mask!1948)))

(assert (=> d!116957 (= (getCurrentListMapNoExtraKeys!3529 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281) lt!438206)))

(declare-fun b!988139 () Bool)

(assert (=> b!988139 (= e!557185 (validKeyInArray!0 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!988139 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!988140 () Bool)

(assert (=> b!988140 (= e!557190 e!557184)))

(declare-fun c!100137 () Bool)

(assert (=> b!988140 (= c!100137 (validKeyInArray!0 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(declare-fun b!988141 () Bool)

(declare-fun e!557186 () Bool)

(assert (=> b!988141 (= e!557189 e!557186)))

(assert (=> b!988141 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30505 _keys!1544)))))

(declare-fun res!660969 () Bool)

(assert (=> b!988141 (= res!660969 (contains!5686 lt!438206 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!988141 (=> (not res!660969) (not e!557186))))

(declare-fun b!988142 () Bool)

(assert (=> b!988142 (= e!557187 (isEmpty!725 lt!438206))))

(declare-fun b!988143 () Bool)

(assert (=> b!988143 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30505 _keys!1544)))))

(assert (=> b!988143 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30504 _values!1278)))))

(assert (=> b!988143 (= e!557186 (= (apply!886 lt!438206 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!988144 () Bool)

(declare-fun lt!438204 () Unit!32656)

(declare-fun lt!438207 () Unit!32656)

(assert (=> b!988144 (= lt!438204 lt!438207)))

(declare-fun lt!438205 () (_ BitVec 64))

(declare-fun lt!438203 () (_ BitVec 64))

(declare-fun lt!438202 () ListLongMap!13621)

(declare-fun lt!438208 () V!35945)

(assert (=> b!988144 (not (contains!5686 (+!3102 lt!438202 (tuple2!14935 lt!438205 lt!438208)) lt!438203))))

(assert (=> b!988144 (= lt!438207 (addStillNotContains!233 lt!438202 lt!438205 lt!438208 lt!438203))))

(assert (=> b!988144 (= lt!438203 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!988144 (= lt!438208 (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!988144 (= lt!438205 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)))))

(assert (=> b!988144 (= lt!438202 call!41850)))

(assert (=> b!988144 (= e!557184 (+!3102 call!41850 (tuple2!14935 (select (arr!30024 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (get!15592 (select (arr!30023 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!116957 c!100134) b!988135))

(assert (= (and d!116957 (not c!100134)) b!988140))

(assert (= (and b!988140 c!100137) b!988144))

(assert (= (and b!988140 (not c!100137)) b!988137))

(assert (= (or b!988144 b!988137) bm!41847))

(assert (= (and d!116957 res!660966) b!988136))

(assert (= (and b!988136 res!660967) b!988134))

(assert (= (and b!988134 res!660968) b!988139))

(assert (= (and b!988134 c!100135) b!988141))

(assert (= (and b!988134 (not c!100135)) b!988133))

(assert (= (and b!988141 res!660969) b!988143))

(assert (= (and b!988133 c!100136) b!988138))

(assert (= (and b!988133 (not c!100136)) b!988142))

(declare-fun b_lambda!15047 () Bool)

(assert (=> (not b_lambda!15047) (not b!988143)))

(assert (=> b!988143 t!29745))

(declare-fun b_and!32075 () Bool)

(assert (= b_and!32073 (and (=> t!29745 result!13551) b_and!32075)))

(declare-fun b_lambda!15049 () Bool)

(assert (=> (not b_lambda!15049) (not b!988144)))

(assert (=> b!988144 t!29745))

(declare-fun b_and!32077 () Bool)

(assert (= b_and!32075 (and (=> t!29745 result!13551) b_and!32077)))

(declare-fun m!914663 () Bool)

(assert (=> b!988136 m!914663))

(declare-fun m!914665 () Bool)

(assert (=> b!988140 m!914665))

(assert (=> b!988140 m!914665))

(declare-fun m!914667 () Bool)

(assert (=> b!988140 m!914667))

(declare-fun m!914669 () Bool)

(assert (=> b!988144 m!914669))

(declare-fun m!914671 () Bool)

(assert (=> b!988144 m!914671))

(declare-fun m!914673 () Bool)

(assert (=> b!988144 m!914673))

(declare-fun m!914675 () Bool)

(assert (=> b!988144 m!914675))

(assert (=> b!988144 m!914665))

(assert (=> b!988144 m!913755))

(assert (=> b!988144 m!914673))

(declare-fun m!914677 () Bool)

(assert (=> b!988144 m!914677))

(assert (=> b!988144 m!914671))

(assert (=> b!988144 m!913755))

(declare-fun m!914679 () Bool)

(assert (=> b!988144 m!914679))

(declare-fun m!914681 () Bool)

(assert (=> b!988142 m!914681))

(declare-fun m!914683 () Bool)

(assert (=> bm!41847 m!914683))

(assert (=> b!988143 m!914671))

(assert (=> b!988143 m!914671))

(assert (=> b!988143 m!913755))

(assert (=> b!988143 m!914679))

(assert (=> b!988143 m!914665))

(assert (=> b!988143 m!914665))

(declare-fun m!914685 () Bool)

(assert (=> b!988143 m!914685))

(assert (=> b!988143 m!913755))

(assert (=> b!988138 m!914683))

(assert (=> b!988141 m!914665))

(assert (=> b!988141 m!914665))

(declare-fun m!914687 () Bool)

(assert (=> b!988141 m!914687))

(declare-fun m!914689 () Bool)

(assert (=> d!116957 m!914689))

(assert (=> d!116957 m!913773))

(assert (=> b!988139 m!914665))

(assert (=> b!988139 m!914665))

(assert (=> b!988139 m!914667))

(assert (=> b!987807 d!116957))

(declare-fun d!116959 () Bool)

(assert (=> d!116959 (= (apply!886 lt!437973 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15596 (getValueByKey!515 (toList!6826 lt!437973) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28008 () Bool)

(assert (= bs!28008 d!116959))

(assert (=> bs!28008 m!914345))

(assert (=> bs!28008 m!914345))

(declare-fun m!914691 () Bool)

(assert (=> bs!28008 m!914691))

(assert (=> b!987768 d!116959))

(declare-fun d!116961 () Bool)

(declare-fun e!557192 () Bool)

(assert (=> d!116961 e!557192))

(declare-fun res!660970 () Bool)

(assert (=> d!116961 (=> res!660970 e!557192)))

(declare-fun lt!438210 () Bool)

(assert (=> d!116961 (= res!660970 (not lt!438210))))

(declare-fun lt!438212 () Bool)

(assert (=> d!116961 (= lt!438210 lt!438212)))

(declare-fun lt!438209 () Unit!32656)

(declare-fun e!557191 () Unit!32656)

(assert (=> d!116961 (= lt!438209 e!557191)))

(declare-fun c!100138 () Bool)

(assert (=> d!116961 (= c!100138 lt!438212)))

(assert (=> d!116961 (= lt!438212 (containsKey!477 (toList!6826 lt!437964) (_1!7478 lt!437809)))))

(assert (=> d!116961 (= (contains!5686 lt!437964 (_1!7478 lt!437809)) lt!438210)))

(declare-fun b!988145 () Bool)

(declare-fun lt!438211 () Unit!32656)

(assert (=> b!988145 (= e!557191 lt!438211)))

(assert (=> b!988145 (= lt!438211 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!437964) (_1!7478 lt!437809)))))

(assert (=> b!988145 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437964) (_1!7478 lt!437809)))))

(declare-fun b!988146 () Bool)

(declare-fun Unit!32676 () Unit!32656)

(assert (=> b!988146 (= e!557191 Unit!32676)))

(declare-fun b!988147 () Bool)

(assert (=> b!988147 (= e!557192 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437964) (_1!7478 lt!437809))))))

(assert (= (and d!116961 c!100138) b!988145))

(assert (= (and d!116961 (not c!100138)) b!988146))

(assert (= (and d!116961 (not res!660970)) b!988147))

(declare-fun m!914693 () Bool)

(assert (=> d!116961 m!914693))

(declare-fun m!914695 () Bool)

(assert (=> b!988145 m!914695))

(assert (=> b!988145 m!913973))

(assert (=> b!988145 m!913973))

(declare-fun m!914697 () Bool)

(assert (=> b!988145 m!914697))

(assert (=> b!988147 m!913973))

(assert (=> b!988147 m!913973))

(assert (=> b!988147 m!914697))

(assert (=> d!116771 d!116961))

(declare-fun b!988149 () Bool)

(declare-fun e!557193 () Option!521)

(declare-fun e!557194 () Option!521)

(assert (=> b!988149 (= e!557193 e!557194)))

(declare-fun c!100140 () Bool)

(assert (=> b!988149 (= c!100140 (and ((_ is Cons!20818) lt!437961) (not (= (_1!7478 (h!21980 lt!437961)) (_1!7478 lt!437809)))))))

(declare-fun b!988150 () Bool)

(assert (=> b!988150 (= e!557194 (getValueByKey!515 (t!29746 lt!437961) (_1!7478 lt!437809)))))

(declare-fun b!988151 () Bool)

(assert (=> b!988151 (= e!557194 None!519)))

(declare-fun d!116963 () Bool)

(declare-fun c!100139 () Bool)

(assert (=> d!116963 (= c!100139 (and ((_ is Cons!20818) lt!437961) (= (_1!7478 (h!21980 lt!437961)) (_1!7478 lt!437809))))))

(assert (=> d!116963 (= (getValueByKey!515 lt!437961 (_1!7478 lt!437809)) e!557193)))

(declare-fun b!988148 () Bool)

(assert (=> b!988148 (= e!557193 (Some!520 (_2!7478 (h!21980 lt!437961))))))

(assert (= (and d!116963 c!100139) b!988148))

(assert (= (and d!116963 (not c!100139)) b!988149))

(assert (= (and b!988149 c!100140) b!988150))

(assert (= (and b!988149 (not c!100140)) b!988151))

(declare-fun m!914699 () Bool)

(assert (=> b!988150 m!914699))

(assert (=> d!116771 d!116963))

(declare-fun d!116965 () Bool)

(assert (=> d!116965 (= (getValueByKey!515 lt!437961 (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809)))))

(declare-fun lt!438213 () Unit!32656)

(assert (=> d!116965 (= lt!438213 (choose!1615 lt!437961 (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(declare-fun e!557195 () Bool)

(assert (=> d!116965 e!557195))

(declare-fun res!660971 () Bool)

(assert (=> d!116965 (=> (not res!660971) (not e!557195))))

(assert (=> d!116965 (= res!660971 (isStrictlySorted!511 lt!437961))))

(assert (=> d!116965 (= (lemmaContainsTupThenGetReturnValue!272 lt!437961 (_1!7478 lt!437809) (_2!7478 lt!437809)) lt!438213)))

(declare-fun b!988152 () Bool)

(declare-fun res!660972 () Bool)

(assert (=> b!988152 (=> (not res!660972) (not e!557195))))

(assert (=> b!988152 (= res!660972 (containsKey!477 lt!437961 (_1!7478 lt!437809)))))

(declare-fun b!988153 () Bool)

(assert (=> b!988153 (= e!557195 (contains!5687 lt!437961 (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809))))))

(assert (= (and d!116965 res!660971) b!988152))

(assert (= (and b!988152 res!660972) b!988153))

(assert (=> d!116965 m!913967))

(declare-fun m!914701 () Bool)

(assert (=> d!116965 m!914701))

(declare-fun m!914703 () Bool)

(assert (=> d!116965 m!914703))

(declare-fun m!914705 () Bool)

(assert (=> b!988152 m!914705))

(declare-fun m!914707 () Bool)

(assert (=> b!988153 m!914707))

(assert (=> d!116771 d!116965))

(declare-fun b!988154 () Bool)

(declare-fun e!557198 () List!20822)

(declare-fun call!41853 () List!20822)

(assert (=> b!988154 (= e!557198 call!41853)))

(declare-fun b!988155 () Bool)

(declare-fun e!557199 () List!20822)

(assert (=> b!988155 (= e!557199 (insertStrictlySorted!329 (t!29746 (toList!6826 lt!437806)) (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(declare-fun b!988156 () Bool)

(declare-fun e!557197 () List!20822)

(assert (=> b!988156 (= e!557197 e!557198)))

(declare-fun c!100142 () Bool)

(assert (=> b!988156 (= c!100142 (and ((_ is Cons!20818) (toList!6826 lt!437806)) (= (_1!7478 (h!21980 (toList!6826 lt!437806))) (_1!7478 lt!437809))))))

(declare-fun b!988157 () Bool)

(declare-fun res!660973 () Bool)

(declare-fun e!557200 () Bool)

(assert (=> b!988157 (=> (not res!660973) (not e!557200))))

(declare-fun lt!438214 () List!20822)

(assert (=> b!988157 (= res!660973 (containsKey!477 lt!438214 (_1!7478 lt!437809)))))

(declare-fun b!988158 () Bool)

(declare-fun call!41851 () List!20822)

(assert (=> b!988158 (= e!557197 call!41851)))

(declare-fun d!116967 () Bool)

(assert (=> d!116967 e!557200))

(declare-fun res!660974 () Bool)

(assert (=> d!116967 (=> (not res!660974) (not e!557200))))

(assert (=> d!116967 (= res!660974 (isStrictlySorted!511 lt!438214))))

(assert (=> d!116967 (= lt!438214 e!557197)))

(declare-fun c!100141 () Bool)

(assert (=> d!116967 (= c!100141 (and ((_ is Cons!20818) (toList!6826 lt!437806)) (bvslt (_1!7478 (h!21980 (toList!6826 lt!437806))) (_1!7478 lt!437809))))))

(assert (=> d!116967 (isStrictlySorted!511 (toList!6826 lt!437806))))

(assert (=> d!116967 (= (insertStrictlySorted!329 (toList!6826 lt!437806) (_1!7478 lt!437809) (_2!7478 lt!437809)) lt!438214)))

(declare-fun b!988159 () Bool)

(declare-fun c!100144 () Bool)

(assert (=> b!988159 (= c!100144 (and ((_ is Cons!20818) (toList!6826 lt!437806)) (bvsgt (_1!7478 (h!21980 (toList!6826 lt!437806))) (_1!7478 lt!437809))))))

(declare-fun e!557196 () List!20822)

(assert (=> b!988159 (= e!557198 e!557196)))

(declare-fun b!988160 () Bool)

(declare-fun call!41852 () List!20822)

(assert (=> b!988160 (= e!557196 call!41852)))

(declare-fun b!988161 () Bool)

(assert (=> b!988161 (= e!557199 (ite c!100142 (t!29746 (toList!6826 lt!437806)) (ite c!100144 (Cons!20818 (h!21980 (toList!6826 lt!437806)) (t!29746 (toList!6826 lt!437806))) Nil!20819)))))

(declare-fun bm!41848 () Bool)

(assert (=> bm!41848 (= call!41852 call!41853)))

(declare-fun bm!41849 () Bool)

(assert (=> bm!41849 (= call!41853 call!41851)))

(declare-fun bm!41850 () Bool)

(assert (=> bm!41850 (= call!41851 ($colon$colon!555 e!557199 (ite c!100141 (h!21980 (toList!6826 lt!437806)) (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809)))))))

(declare-fun c!100143 () Bool)

(assert (=> bm!41850 (= c!100143 c!100141)))

(declare-fun b!988162 () Bool)

(assert (=> b!988162 (= e!557196 call!41852)))

(declare-fun b!988163 () Bool)

(assert (=> b!988163 (= e!557200 (contains!5687 lt!438214 (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809))))))

(assert (= (and d!116967 c!100141) b!988158))

(assert (= (and d!116967 (not c!100141)) b!988156))

(assert (= (and b!988156 c!100142) b!988154))

(assert (= (and b!988156 (not c!100142)) b!988159))

(assert (= (and b!988159 c!100144) b!988162))

(assert (= (and b!988159 (not c!100144)) b!988160))

(assert (= (or b!988162 b!988160) bm!41848))

(assert (= (or b!988154 bm!41848) bm!41849))

(assert (= (or b!988158 bm!41849) bm!41850))

(assert (= (and bm!41850 c!100143) b!988155))

(assert (= (and bm!41850 (not c!100143)) b!988161))

(assert (= (and d!116967 res!660974) b!988157))

(assert (= (and b!988157 res!660973) b!988163))

(declare-fun m!914709 () Bool)

(assert (=> b!988163 m!914709))

(declare-fun m!914711 () Bool)

(assert (=> bm!41850 m!914711))

(declare-fun m!914713 () Bool)

(assert (=> b!988155 m!914713))

(declare-fun m!914715 () Bool)

(assert (=> d!116967 m!914715))

(assert (=> d!116967 m!914373))

(declare-fun m!914717 () Bool)

(assert (=> b!988157 m!914717))

(assert (=> d!116771 d!116967))

(declare-fun b!988165 () Bool)

(declare-fun e!557201 () Option!521)

(declare-fun e!557202 () Option!521)

(assert (=> b!988165 (= e!557201 e!557202)))

(declare-fun c!100146 () Bool)

(assert (=> b!988165 (= c!100146 (and ((_ is Cons!20818) (toList!6826 lt!438019)) (not (= (_1!7478 (h!21980 (toList!6826 lt!438019))) (_1!7478 lt!437809)))))))

(declare-fun b!988166 () Bool)

(assert (=> b!988166 (= e!557202 (getValueByKey!515 (t!29746 (toList!6826 lt!438019)) (_1!7478 lt!437809)))))

(declare-fun b!988167 () Bool)

(assert (=> b!988167 (= e!557202 None!519)))

(declare-fun d!116969 () Bool)

(declare-fun c!100145 () Bool)

(assert (=> d!116969 (= c!100145 (and ((_ is Cons!20818) (toList!6826 lt!438019)) (= (_1!7478 (h!21980 (toList!6826 lt!438019))) (_1!7478 lt!437809))))))

(assert (=> d!116969 (= (getValueByKey!515 (toList!6826 lt!438019) (_1!7478 lt!437809)) e!557201)))

(declare-fun b!988164 () Bool)

(assert (=> b!988164 (= e!557201 (Some!520 (_2!7478 (h!21980 (toList!6826 lt!438019)))))))

(assert (= (and d!116969 c!100145) b!988164))

(assert (= (and d!116969 (not c!100145)) b!988165))

(assert (= (and b!988165 c!100146) b!988166))

(assert (= (and b!988165 (not c!100146)) b!988167))

(declare-fun m!914719 () Bool)

(assert (=> b!988166 m!914719))

(assert (=> b!987814 d!116969))

(assert (=> d!116773 d!116795))

(declare-fun d!116971 () Bool)

(declare-fun e!557204 () Bool)

(assert (=> d!116971 e!557204))

(declare-fun res!660975 () Bool)

(assert (=> d!116971 (=> res!660975 e!557204)))

(declare-fun lt!438216 () Bool)

(assert (=> d!116971 (= res!660975 (not lt!438216))))

(declare-fun lt!438218 () Bool)

(assert (=> d!116971 (= lt!438216 lt!438218)))

(declare-fun lt!438215 () Unit!32656)

(declare-fun e!557203 () Unit!32656)

(assert (=> d!116971 (= lt!438215 e!557203)))

(declare-fun c!100147 () Bool)

(assert (=> d!116971 (= c!100147 lt!438218)))

(assert (=> d!116971 (= lt!438218 (containsKey!477 (toList!6826 lt!437947) (select (arr!30024 _keys!1544) from!1932)))))

(assert (=> d!116971 (= (contains!5686 lt!437947 (select (arr!30024 _keys!1544) from!1932)) lt!438216)))

(declare-fun b!988168 () Bool)

(declare-fun lt!438217 () Unit!32656)

(assert (=> b!988168 (= e!557203 lt!438217)))

(assert (=> b!988168 (= lt!438217 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!437947) (select (arr!30024 _keys!1544) from!1932)))))

(assert (=> b!988168 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437947) (select (arr!30024 _keys!1544) from!1932)))))

(declare-fun b!988169 () Bool)

(declare-fun Unit!32677 () Unit!32656)

(assert (=> b!988169 (= e!557203 Unit!32677)))

(declare-fun b!988170 () Bool)

(assert (=> b!988170 (= e!557204 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437947) (select (arr!30024 _keys!1544) from!1932))))))

(assert (= (and d!116971 c!100147) b!988168))

(assert (= (and d!116971 (not c!100147)) b!988169))

(assert (= (and d!116971 (not res!660975)) b!988170))

(assert (=> d!116971 m!913739))

(declare-fun m!914721 () Bool)

(assert (=> d!116971 m!914721))

(assert (=> b!988168 m!913739))

(declare-fun m!914723 () Bool)

(assert (=> b!988168 m!914723))

(assert (=> b!988168 m!913739))

(assert (=> b!988168 m!914453))

(assert (=> b!988168 m!914453))

(declare-fun m!914725 () Bool)

(assert (=> b!988168 m!914725))

(assert (=> b!988170 m!913739))

(assert (=> b!988170 m!914453))

(assert (=> b!988170 m!914453))

(assert (=> b!988170 m!914725))

(assert (=> b!987740 d!116971))

(assert (=> d!116769 d!116795))

(declare-fun b!988172 () Bool)

(declare-fun e!557205 () Option!521)

(declare-fun e!557206 () Option!521)

(assert (=> b!988172 (= e!557205 e!557206)))

(declare-fun c!100149 () Bool)

(assert (=> b!988172 (= c!100149 (and ((_ is Cons!20818) (toList!6826 lt!438023)) (not (= (_1!7478 (h!21980 (toList!6826 lt!438023))) (_1!7478 lt!437809)))))))

(declare-fun b!988173 () Bool)

(assert (=> b!988173 (= e!557206 (getValueByKey!515 (t!29746 (toList!6826 lt!438023)) (_1!7478 lt!437809)))))

(declare-fun b!988174 () Bool)

(assert (=> b!988174 (= e!557206 None!519)))

(declare-fun d!116973 () Bool)

(declare-fun c!100148 () Bool)

(assert (=> d!116973 (= c!100148 (and ((_ is Cons!20818) (toList!6826 lt!438023)) (= (_1!7478 (h!21980 (toList!6826 lt!438023))) (_1!7478 lt!437809))))))

(assert (=> d!116973 (= (getValueByKey!515 (toList!6826 lt!438023) (_1!7478 lt!437809)) e!557205)))

(declare-fun b!988171 () Bool)

(assert (=> b!988171 (= e!557205 (Some!520 (_2!7478 (h!21980 (toList!6826 lt!438023)))))))

(assert (= (and d!116973 c!100148) b!988171))

(assert (= (and d!116973 (not c!100148)) b!988172))

(assert (= (and b!988172 c!100149) b!988173))

(assert (= (and b!988172 (not c!100149)) b!988174))

(declare-fun m!914727 () Bool)

(assert (=> b!988173 m!914727))

(assert (=> b!987816 d!116973))

(assert (=> b!987809 d!116829))

(declare-fun d!116975 () Bool)

(declare-fun isEmpty!726 (List!20822) Bool)

(assert (=> d!116975 (= (isEmpty!725 lt!438013) (isEmpty!726 (toList!6826 lt!438013)))))

(declare-fun bs!28009 () Bool)

(assert (= bs!28009 d!116975))

(declare-fun m!914729 () Bool)

(assert (=> bs!28009 m!914729))

(assert (=> b!987811 d!116975))

(assert (=> bm!41819 d!116957))

(declare-fun d!116977 () Bool)

(assert (=> d!116977 (= (get!15595 (select (arr!30023 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!987777 d!116977))

(declare-fun d!116979 () Bool)

(assert (=> d!116979 (= (apply!886 lt!437947 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15596 (getValueByKey!515 (toList!6826 lt!437947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28010 () Bool)

(assert (= bs!28010 d!116979))

(declare-fun m!914731 () Bool)

(assert (=> bs!28010 m!914731))

(assert (=> bs!28010 m!914731))

(declare-fun m!914733 () Bool)

(assert (=> bs!28010 m!914733))

(assert (=> b!987735 d!116979))

(declare-fun d!116981 () Bool)

(assert (=> d!116981 (contains!5686 (+!3102 lt!437958 (tuple2!14935 lt!437953 zeroValue!1220)) lt!437940)))

(declare-fun lt!438221 () Unit!32656)

(declare-fun choose!1617 (ListLongMap!13621 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32656)

(assert (=> d!116981 (= lt!438221 (choose!1617 lt!437958 lt!437953 zeroValue!1220 lt!437940))))

(assert (=> d!116981 (contains!5686 lt!437958 lt!437940)))

(assert (=> d!116981 (= (addStillContains!607 lt!437958 lt!437953 zeroValue!1220 lt!437940) lt!438221)))

(declare-fun bs!28011 () Bool)

(assert (= bs!28011 d!116981))

(assert (=> bs!28011 m!913949))

(assert (=> bs!28011 m!913949))

(assert (=> bs!28011 m!913961))

(declare-fun m!914735 () Bool)

(assert (=> bs!28011 m!914735))

(declare-fun m!914737 () Bool)

(assert (=> bs!28011 m!914737))

(assert (=> b!987737 d!116981))

(declare-fun d!116983 () Bool)

(assert (=> d!116983 (= (apply!886 (+!3102 lt!437939 (tuple2!14935 lt!437948 minValue!1220)) lt!437942) (apply!886 lt!437939 lt!437942))))

(declare-fun lt!438224 () Unit!32656)

(declare-fun choose!1618 (ListLongMap!13621 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32656)

(assert (=> d!116983 (= lt!438224 (choose!1618 lt!437939 lt!437948 minValue!1220 lt!437942))))

(declare-fun e!557209 () Bool)

(assert (=> d!116983 e!557209))

(declare-fun res!660978 () Bool)

(assert (=> d!116983 (=> (not res!660978) (not e!557209))))

(assert (=> d!116983 (= res!660978 (contains!5686 lt!437939 lt!437942))))

(assert (=> d!116983 (= (addApplyDifferent!463 lt!437939 lt!437948 minValue!1220 lt!437942) lt!438224)))

(declare-fun b!988179 () Bool)

(assert (=> b!988179 (= e!557209 (not (= lt!437942 lt!437948)))))

(assert (= (and d!116983 res!660978) b!988179))

(assert (=> d!116983 m!913959))

(declare-fun m!914739 () Bool)

(assert (=> d!116983 m!914739))

(assert (=> d!116983 m!913943))

(assert (=> d!116983 m!913945))

(assert (=> d!116983 m!913943))

(declare-fun m!914741 () Bool)

(assert (=> d!116983 m!914741))

(assert (=> b!987737 d!116983))

(declare-fun d!116985 () Bool)

(declare-fun e!557210 () Bool)

(assert (=> d!116985 e!557210))

(declare-fun res!660980 () Bool)

(assert (=> d!116985 (=> (not res!660980) (not e!557210))))

(declare-fun lt!438228 () ListLongMap!13621)

(assert (=> d!116985 (= res!660980 (contains!5686 lt!438228 (_1!7478 (tuple2!14935 lt!437953 zeroValue!1220))))))

(declare-fun lt!438225 () List!20822)

(assert (=> d!116985 (= lt!438228 (ListLongMap!13622 lt!438225))))

(declare-fun lt!438226 () Unit!32656)

(declare-fun lt!438227 () Unit!32656)

(assert (=> d!116985 (= lt!438226 lt!438227)))

(assert (=> d!116985 (= (getValueByKey!515 lt!438225 (_1!7478 (tuple2!14935 lt!437953 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437953 zeroValue!1220))))))

(assert (=> d!116985 (= lt!438227 (lemmaContainsTupThenGetReturnValue!272 lt!438225 (_1!7478 (tuple2!14935 lt!437953 zeroValue!1220)) (_2!7478 (tuple2!14935 lt!437953 zeroValue!1220))))))

(assert (=> d!116985 (= lt!438225 (insertStrictlySorted!329 (toList!6826 lt!437958) (_1!7478 (tuple2!14935 lt!437953 zeroValue!1220)) (_2!7478 (tuple2!14935 lt!437953 zeroValue!1220))))))

(assert (=> d!116985 (= (+!3102 lt!437958 (tuple2!14935 lt!437953 zeroValue!1220)) lt!438228)))

(declare-fun b!988180 () Bool)

(declare-fun res!660979 () Bool)

(assert (=> b!988180 (=> (not res!660979) (not e!557210))))

(assert (=> b!988180 (= res!660979 (= (getValueByKey!515 (toList!6826 lt!438228) (_1!7478 (tuple2!14935 lt!437953 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437953 zeroValue!1220)))))))

(declare-fun b!988181 () Bool)

(assert (=> b!988181 (= e!557210 (contains!5687 (toList!6826 lt!438228) (tuple2!14935 lt!437953 zeroValue!1220)))))

(assert (= (and d!116985 res!660980) b!988180))

(assert (= (and b!988180 res!660979) b!988181))

(declare-fun m!914743 () Bool)

(assert (=> d!116985 m!914743))

(declare-fun m!914745 () Bool)

(assert (=> d!116985 m!914745))

(declare-fun m!914747 () Bool)

(assert (=> d!116985 m!914747))

(declare-fun m!914749 () Bool)

(assert (=> d!116985 m!914749))

(declare-fun m!914751 () Bool)

(assert (=> b!988180 m!914751))

(declare-fun m!914753 () Bool)

(assert (=> b!988181 m!914753))

(assert (=> b!987737 d!116985))

(declare-fun d!116987 () Bool)

(assert (=> d!116987 (= (apply!886 (+!3102 lt!437944 (tuple2!14935 lt!437946 zeroValue!1220)) lt!437950) (get!15596 (getValueByKey!515 (toList!6826 (+!3102 lt!437944 (tuple2!14935 lt!437946 zeroValue!1220))) lt!437950)))))

(declare-fun bs!28012 () Bool)

(assert (= bs!28012 d!116987))

(declare-fun m!914755 () Bool)

(assert (=> bs!28012 m!914755))

(assert (=> bs!28012 m!914755))

(declare-fun m!914757 () Bool)

(assert (=> bs!28012 m!914757))

(assert (=> b!987737 d!116987))

(declare-fun d!116989 () Bool)

(declare-fun e!557211 () Bool)

(assert (=> d!116989 e!557211))

(declare-fun res!660982 () Bool)

(assert (=> d!116989 (=> (not res!660982) (not e!557211))))

(declare-fun lt!438232 () ListLongMap!13621)

(assert (=> d!116989 (= res!660982 (contains!5686 lt!438232 (_1!7478 (tuple2!14935 lt!437948 minValue!1220))))))

(declare-fun lt!438229 () List!20822)

(assert (=> d!116989 (= lt!438232 (ListLongMap!13622 lt!438229))))

(declare-fun lt!438230 () Unit!32656)

(declare-fun lt!438231 () Unit!32656)

(assert (=> d!116989 (= lt!438230 lt!438231)))

(assert (=> d!116989 (= (getValueByKey!515 lt!438229 (_1!7478 (tuple2!14935 lt!437948 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437948 minValue!1220))))))

(assert (=> d!116989 (= lt!438231 (lemmaContainsTupThenGetReturnValue!272 lt!438229 (_1!7478 (tuple2!14935 lt!437948 minValue!1220)) (_2!7478 (tuple2!14935 lt!437948 minValue!1220))))))

(assert (=> d!116989 (= lt!438229 (insertStrictlySorted!329 (toList!6826 lt!437939) (_1!7478 (tuple2!14935 lt!437948 minValue!1220)) (_2!7478 (tuple2!14935 lt!437948 minValue!1220))))))

(assert (=> d!116989 (= (+!3102 lt!437939 (tuple2!14935 lt!437948 minValue!1220)) lt!438232)))

(declare-fun b!988182 () Bool)

(declare-fun res!660981 () Bool)

(assert (=> b!988182 (=> (not res!660981) (not e!557211))))

(assert (=> b!988182 (= res!660981 (= (getValueByKey!515 (toList!6826 lt!438232) (_1!7478 (tuple2!14935 lt!437948 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437948 minValue!1220)))))))

(declare-fun b!988183 () Bool)

(assert (=> b!988183 (= e!557211 (contains!5687 (toList!6826 lt!438232) (tuple2!14935 lt!437948 minValue!1220)))))

(assert (= (and d!116989 res!660982) b!988182))

(assert (= (and b!988182 res!660981) b!988183))

(declare-fun m!914759 () Bool)

(assert (=> d!116989 m!914759))

(declare-fun m!914761 () Bool)

(assert (=> d!116989 m!914761))

(declare-fun m!914763 () Bool)

(assert (=> d!116989 m!914763))

(declare-fun m!914765 () Bool)

(assert (=> d!116989 m!914765))

(declare-fun m!914767 () Bool)

(assert (=> b!988182 m!914767))

(declare-fun m!914769 () Bool)

(assert (=> b!988183 m!914769))

(assert (=> b!987737 d!116989))

(declare-fun d!116991 () Bool)

(assert (=> d!116991 (= (apply!886 lt!437943 lt!437960) (get!15596 (getValueByKey!515 (toList!6826 lt!437943) lt!437960)))))

(declare-fun bs!28013 () Bool)

(assert (= bs!28013 d!116991))

(declare-fun m!914771 () Bool)

(assert (=> bs!28013 m!914771))

(assert (=> bs!28013 m!914771))

(declare-fun m!914773 () Bool)

(assert (=> bs!28013 m!914773))

(assert (=> b!987737 d!116991))

(declare-fun d!116993 () Bool)

(assert (=> d!116993 (= (apply!886 (+!3102 lt!437944 (tuple2!14935 lt!437946 zeroValue!1220)) lt!437950) (apply!886 lt!437944 lt!437950))))

(declare-fun lt!438233 () Unit!32656)

(assert (=> d!116993 (= lt!438233 (choose!1618 lt!437944 lt!437946 zeroValue!1220 lt!437950))))

(declare-fun e!557212 () Bool)

(assert (=> d!116993 e!557212))

(declare-fun res!660983 () Bool)

(assert (=> d!116993 (=> (not res!660983) (not e!557212))))

(assert (=> d!116993 (= res!660983 (contains!5686 lt!437944 lt!437950))))

(assert (=> d!116993 (= (addApplyDifferent!463 lt!437944 lt!437946 zeroValue!1220 lt!437950) lt!438233)))

(declare-fun b!988184 () Bool)

(assert (=> b!988184 (= e!557212 (not (= lt!437950 lt!437946)))))

(assert (= (and d!116993 res!660983) b!988184))

(assert (=> d!116993 m!913951))

(declare-fun m!914775 () Bool)

(assert (=> d!116993 m!914775))

(assert (=> d!116993 m!913947))

(assert (=> d!116993 m!913955))

(assert (=> d!116993 m!913947))

(declare-fun m!914777 () Bool)

(assert (=> d!116993 m!914777))

(assert (=> b!987737 d!116993))

(declare-fun d!116995 () Bool)

(assert (=> d!116995 (= (apply!886 (+!3102 lt!437939 (tuple2!14935 lt!437948 minValue!1220)) lt!437942) (get!15596 (getValueByKey!515 (toList!6826 (+!3102 lt!437939 (tuple2!14935 lt!437948 minValue!1220))) lt!437942)))))

(declare-fun bs!28014 () Bool)

(assert (= bs!28014 d!116995))

(declare-fun m!914779 () Bool)

(assert (=> bs!28014 m!914779))

(assert (=> bs!28014 m!914779))

(declare-fun m!914781 () Bool)

(assert (=> bs!28014 m!914781))

(assert (=> b!987737 d!116995))

(assert (=> b!987737 d!116909))

(declare-fun d!116997 () Bool)

(declare-fun e!557214 () Bool)

(assert (=> d!116997 e!557214))

(declare-fun res!660984 () Bool)

(assert (=> d!116997 (=> res!660984 e!557214)))

(declare-fun lt!438235 () Bool)

(assert (=> d!116997 (= res!660984 (not lt!438235))))

(declare-fun lt!438237 () Bool)

(assert (=> d!116997 (= lt!438235 lt!438237)))

(declare-fun lt!438234 () Unit!32656)

(declare-fun e!557213 () Unit!32656)

(assert (=> d!116997 (= lt!438234 e!557213)))

(declare-fun c!100150 () Bool)

(assert (=> d!116997 (= c!100150 lt!438237)))

(assert (=> d!116997 (= lt!438237 (containsKey!477 (toList!6826 (+!3102 lt!437958 (tuple2!14935 lt!437953 zeroValue!1220))) lt!437940))))

(assert (=> d!116997 (= (contains!5686 (+!3102 lt!437958 (tuple2!14935 lt!437953 zeroValue!1220)) lt!437940) lt!438235)))

(declare-fun b!988185 () Bool)

(declare-fun lt!438236 () Unit!32656)

(assert (=> b!988185 (= e!557213 lt!438236)))

(assert (=> b!988185 (= lt!438236 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 (+!3102 lt!437958 (tuple2!14935 lt!437953 zeroValue!1220))) lt!437940))))

(assert (=> b!988185 (isDefined!385 (getValueByKey!515 (toList!6826 (+!3102 lt!437958 (tuple2!14935 lt!437953 zeroValue!1220))) lt!437940))))

(declare-fun b!988186 () Bool)

(declare-fun Unit!32678 () Unit!32656)

(assert (=> b!988186 (= e!557213 Unit!32678)))

(declare-fun b!988187 () Bool)

(assert (=> b!988187 (= e!557214 (isDefined!385 (getValueByKey!515 (toList!6826 (+!3102 lt!437958 (tuple2!14935 lt!437953 zeroValue!1220))) lt!437940)))))

(assert (= (and d!116997 c!100150) b!988185))

(assert (= (and d!116997 (not c!100150)) b!988186))

(assert (= (and d!116997 (not res!660984)) b!988187))

(declare-fun m!914783 () Bool)

(assert (=> d!116997 m!914783))

(declare-fun m!914785 () Bool)

(assert (=> b!988185 m!914785))

(declare-fun m!914787 () Bool)

(assert (=> b!988185 m!914787))

(assert (=> b!988185 m!914787))

(declare-fun m!914789 () Bool)

(assert (=> b!988185 m!914789))

(assert (=> b!988187 m!914787))

(assert (=> b!988187 m!914787))

(assert (=> b!988187 m!914789))

(assert (=> b!987737 d!116997))

(declare-fun d!116999 () Bool)

(assert (=> d!116999 (= (apply!886 lt!437939 lt!437942) (get!15596 (getValueByKey!515 (toList!6826 lt!437939) lt!437942)))))

(declare-fun bs!28015 () Bool)

(assert (= bs!28015 d!116999))

(declare-fun m!914791 () Bool)

(assert (=> bs!28015 m!914791))

(assert (=> bs!28015 m!914791))

(declare-fun m!914793 () Bool)

(assert (=> bs!28015 m!914793))

(assert (=> b!987737 d!116999))

(declare-fun d!117001 () Bool)

(assert (=> d!117001 (= (apply!886 lt!437944 lt!437950) (get!15596 (getValueByKey!515 (toList!6826 lt!437944) lt!437950)))))

(declare-fun bs!28016 () Bool)

(assert (= bs!28016 d!117001))

(declare-fun m!914795 () Bool)

(assert (=> bs!28016 m!914795))

(assert (=> bs!28016 m!914795))

(declare-fun m!914797 () Bool)

(assert (=> bs!28016 m!914797))

(assert (=> b!987737 d!117001))

(declare-fun d!117003 () Bool)

(declare-fun e!557215 () Bool)

(assert (=> d!117003 e!557215))

(declare-fun res!660986 () Bool)

(assert (=> d!117003 (=> (not res!660986) (not e!557215))))

(declare-fun lt!438241 () ListLongMap!13621)

(assert (=> d!117003 (= res!660986 (contains!5686 lt!438241 (_1!7478 (tuple2!14935 lt!437946 zeroValue!1220))))))

(declare-fun lt!438238 () List!20822)

(assert (=> d!117003 (= lt!438241 (ListLongMap!13622 lt!438238))))

(declare-fun lt!438239 () Unit!32656)

(declare-fun lt!438240 () Unit!32656)

(assert (=> d!117003 (= lt!438239 lt!438240)))

(assert (=> d!117003 (= (getValueByKey!515 lt!438238 (_1!7478 (tuple2!14935 lt!437946 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437946 zeroValue!1220))))))

(assert (=> d!117003 (= lt!438240 (lemmaContainsTupThenGetReturnValue!272 lt!438238 (_1!7478 (tuple2!14935 lt!437946 zeroValue!1220)) (_2!7478 (tuple2!14935 lt!437946 zeroValue!1220))))))

(assert (=> d!117003 (= lt!438238 (insertStrictlySorted!329 (toList!6826 lt!437944) (_1!7478 (tuple2!14935 lt!437946 zeroValue!1220)) (_2!7478 (tuple2!14935 lt!437946 zeroValue!1220))))))

(assert (=> d!117003 (= (+!3102 lt!437944 (tuple2!14935 lt!437946 zeroValue!1220)) lt!438241)))

(declare-fun b!988188 () Bool)

(declare-fun res!660985 () Bool)

(assert (=> b!988188 (=> (not res!660985) (not e!557215))))

(assert (=> b!988188 (= res!660985 (= (getValueByKey!515 (toList!6826 lt!438241) (_1!7478 (tuple2!14935 lt!437946 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437946 zeroValue!1220)))))))

(declare-fun b!988189 () Bool)

(assert (=> b!988189 (= e!557215 (contains!5687 (toList!6826 lt!438241) (tuple2!14935 lt!437946 zeroValue!1220)))))

(assert (= (and d!117003 res!660986) b!988188))

(assert (= (and b!988188 res!660985) b!988189))

(declare-fun m!914799 () Bool)

(assert (=> d!117003 m!914799))

(declare-fun m!914801 () Bool)

(assert (=> d!117003 m!914801))

(declare-fun m!914803 () Bool)

(assert (=> d!117003 m!914803))

(declare-fun m!914805 () Bool)

(assert (=> d!117003 m!914805))

(declare-fun m!914807 () Bool)

(assert (=> b!988188 m!914807))

(declare-fun m!914809 () Bool)

(assert (=> b!988189 m!914809))

(assert (=> b!987737 d!117003))

(declare-fun d!117005 () Bool)

(declare-fun e!557216 () Bool)

(assert (=> d!117005 e!557216))

(declare-fun res!660988 () Bool)

(assert (=> d!117005 (=> (not res!660988) (not e!557216))))

(declare-fun lt!438245 () ListLongMap!13621)

(assert (=> d!117005 (= res!660988 (contains!5686 lt!438245 (_1!7478 (tuple2!14935 lt!437941 minValue!1220))))))

(declare-fun lt!438242 () List!20822)

(assert (=> d!117005 (= lt!438245 (ListLongMap!13622 lt!438242))))

(declare-fun lt!438243 () Unit!32656)

(declare-fun lt!438244 () Unit!32656)

(assert (=> d!117005 (= lt!438243 lt!438244)))

(assert (=> d!117005 (= (getValueByKey!515 lt!438242 (_1!7478 (tuple2!14935 lt!437941 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437941 minValue!1220))))))

(assert (=> d!117005 (= lt!438244 (lemmaContainsTupThenGetReturnValue!272 lt!438242 (_1!7478 (tuple2!14935 lt!437941 minValue!1220)) (_2!7478 (tuple2!14935 lt!437941 minValue!1220))))))

(assert (=> d!117005 (= lt!438242 (insertStrictlySorted!329 (toList!6826 lt!437943) (_1!7478 (tuple2!14935 lt!437941 minValue!1220)) (_2!7478 (tuple2!14935 lt!437941 minValue!1220))))))

(assert (=> d!117005 (= (+!3102 lt!437943 (tuple2!14935 lt!437941 minValue!1220)) lt!438245)))

(declare-fun b!988190 () Bool)

(declare-fun res!660987 () Bool)

(assert (=> b!988190 (=> (not res!660987) (not e!557216))))

(assert (=> b!988190 (= res!660987 (= (getValueByKey!515 (toList!6826 lt!438245) (_1!7478 (tuple2!14935 lt!437941 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437941 minValue!1220)))))))

(declare-fun b!988191 () Bool)

(assert (=> b!988191 (= e!557216 (contains!5687 (toList!6826 lt!438245) (tuple2!14935 lt!437941 minValue!1220)))))

(assert (= (and d!117005 res!660988) b!988190))

(assert (= (and b!988190 res!660987) b!988191))

(declare-fun m!914811 () Bool)

(assert (=> d!117005 m!914811))

(declare-fun m!914813 () Bool)

(assert (=> d!117005 m!914813))

(declare-fun m!914815 () Bool)

(assert (=> d!117005 m!914815))

(declare-fun m!914817 () Bool)

(assert (=> d!117005 m!914817))

(declare-fun m!914819 () Bool)

(assert (=> b!988190 m!914819))

(declare-fun m!914821 () Bool)

(assert (=> b!988191 m!914821))

(assert (=> b!987737 d!117005))

(declare-fun d!117007 () Bool)

(assert (=> d!117007 (= (apply!886 (+!3102 lt!437943 (tuple2!14935 lt!437941 minValue!1220)) lt!437960) (apply!886 lt!437943 lt!437960))))

(declare-fun lt!438246 () Unit!32656)

(assert (=> d!117007 (= lt!438246 (choose!1618 lt!437943 lt!437941 minValue!1220 lt!437960))))

(declare-fun e!557217 () Bool)

(assert (=> d!117007 e!557217))

(declare-fun res!660989 () Bool)

(assert (=> d!117007 (=> (not res!660989) (not e!557217))))

(assert (=> d!117007 (= res!660989 (contains!5686 lt!437943 lt!437960))))

(assert (=> d!117007 (= (addApplyDifferent!463 lt!437943 lt!437941 minValue!1220 lt!437960) lt!438246)))

(declare-fun b!988192 () Bool)

(assert (=> b!988192 (= e!557217 (not (= lt!437960 lt!437941)))))

(assert (= (and d!117007 res!660989) b!988192))

(assert (=> d!117007 m!913957))

(declare-fun m!914823 () Bool)

(assert (=> d!117007 m!914823))

(assert (=> d!117007 m!913935))

(assert (=> d!117007 m!913937))

(assert (=> d!117007 m!913935))

(declare-fun m!914825 () Bool)

(assert (=> d!117007 m!914825))

(assert (=> b!987737 d!117007))

(declare-fun d!117009 () Bool)

(assert (=> d!117009 (= (apply!886 (+!3102 lt!437943 (tuple2!14935 lt!437941 minValue!1220)) lt!437960) (get!15596 (getValueByKey!515 (toList!6826 (+!3102 lt!437943 (tuple2!14935 lt!437941 minValue!1220))) lt!437960)))))

(declare-fun bs!28017 () Bool)

(assert (= bs!28017 d!117009))

(declare-fun m!914827 () Bool)

(assert (=> bs!28017 m!914827))

(assert (=> bs!28017 m!914827))

(declare-fun m!914829 () Bool)

(assert (=> bs!28017 m!914829))

(assert (=> b!987737 d!117009))

(declare-fun d!117011 () Bool)

(declare-fun e!557219 () Bool)

(assert (=> d!117011 e!557219))

(declare-fun res!660990 () Bool)

(assert (=> d!117011 (=> res!660990 e!557219)))

(declare-fun lt!438248 () Bool)

(assert (=> d!117011 (= res!660990 (not lt!438248))))

(declare-fun lt!438250 () Bool)

(assert (=> d!117011 (= lt!438248 lt!438250)))

(declare-fun lt!438247 () Unit!32656)

(declare-fun e!557218 () Unit!32656)

(assert (=> d!117011 (= lt!438247 e!557218)))

(declare-fun c!100151 () Bool)

(assert (=> d!117011 (= c!100151 lt!438250)))

(assert (=> d!117011 (= lt!438250 (containsKey!477 (toList!6826 lt!437890) (_1!7478 lt!437809)))))

(assert (=> d!117011 (= (contains!5686 lt!437890 (_1!7478 lt!437809)) lt!438248)))

(declare-fun b!988193 () Bool)

(declare-fun lt!438249 () Unit!32656)

(assert (=> b!988193 (= e!557218 lt!438249)))

(assert (=> b!988193 (= lt!438249 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!437890) (_1!7478 lt!437809)))))

(assert (=> b!988193 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437890) (_1!7478 lt!437809)))))

(declare-fun b!988194 () Bool)

(declare-fun Unit!32679 () Unit!32656)

(assert (=> b!988194 (= e!557218 Unit!32679)))

(declare-fun b!988195 () Bool)

(assert (=> b!988195 (= e!557219 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437890) (_1!7478 lt!437809))))))

(assert (= (and d!117011 c!100151) b!988193))

(assert (= (and d!117011 (not c!100151)) b!988194))

(assert (= (and d!117011 (not res!660990)) b!988195))

(declare-fun m!914831 () Bool)

(assert (=> d!117011 m!914831))

(declare-fun m!914833 () Bool)

(assert (=> b!988193 m!914833))

(assert (=> b!988193 m!913901))

(assert (=> b!988193 m!913901))

(declare-fun m!914835 () Bool)

(assert (=> b!988193 m!914835))

(assert (=> b!988195 m!913901))

(assert (=> b!988195 m!913901))

(assert (=> b!988195 m!914835))

(assert (=> d!116765 d!117011))

(declare-fun b!988197 () Bool)

(declare-fun e!557220 () Option!521)

(declare-fun e!557221 () Option!521)

(assert (=> b!988197 (= e!557220 e!557221)))

(declare-fun c!100153 () Bool)

(assert (=> b!988197 (= c!100153 (and ((_ is Cons!20818) lt!437887) (not (= (_1!7478 (h!21980 lt!437887)) (_1!7478 lt!437809)))))))

(declare-fun b!988198 () Bool)

(assert (=> b!988198 (= e!557221 (getValueByKey!515 (t!29746 lt!437887) (_1!7478 lt!437809)))))

(declare-fun b!988199 () Bool)

(assert (=> b!988199 (= e!557221 None!519)))

(declare-fun d!117013 () Bool)

(declare-fun c!100152 () Bool)

(assert (=> d!117013 (= c!100152 (and ((_ is Cons!20818) lt!437887) (= (_1!7478 (h!21980 lt!437887)) (_1!7478 lt!437809))))))

(assert (=> d!117013 (= (getValueByKey!515 lt!437887 (_1!7478 lt!437809)) e!557220)))

(declare-fun b!988196 () Bool)

(assert (=> b!988196 (= e!557220 (Some!520 (_2!7478 (h!21980 lt!437887))))))

(assert (= (and d!117013 c!100152) b!988196))

(assert (= (and d!117013 (not c!100152)) b!988197))

(assert (= (and b!988197 c!100153) b!988198))

(assert (= (and b!988197 (not c!100153)) b!988199))

(declare-fun m!914837 () Bool)

(assert (=> b!988198 m!914837))

(assert (=> d!116765 d!117013))

(declare-fun d!117015 () Bool)

(assert (=> d!117015 (= (getValueByKey!515 lt!437887 (_1!7478 lt!437809)) (Some!520 (_2!7478 lt!437809)))))

(declare-fun lt!438251 () Unit!32656)

(assert (=> d!117015 (= lt!438251 (choose!1615 lt!437887 (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(declare-fun e!557222 () Bool)

(assert (=> d!117015 e!557222))

(declare-fun res!660991 () Bool)

(assert (=> d!117015 (=> (not res!660991) (not e!557222))))

(assert (=> d!117015 (= res!660991 (isStrictlySorted!511 lt!437887))))

(assert (=> d!117015 (= (lemmaContainsTupThenGetReturnValue!272 lt!437887 (_1!7478 lt!437809) (_2!7478 lt!437809)) lt!438251)))

(declare-fun b!988200 () Bool)

(declare-fun res!660992 () Bool)

(assert (=> b!988200 (=> (not res!660992) (not e!557222))))

(assert (=> b!988200 (= res!660992 (containsKey!477 lt!437887 (_1!7478 lt!437809)))))

(declare-fun b!988201 () Bool)

(assert (=> b!988201 (= e!557222 (contains!5687 lt!437887 (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809))))))

(assert (= (and d!117015 res!660991) b!988200))

(assert (= (and b!988200 res!660992) b!988201))

(assert (=> d!117015 m!913895))

(declare-fun m!914839 () Bool)

(assert (=> d!117015 m!914839))

(declare-fun m!914841 () Bool)

(assert (=> d!117015 m!914841))

(declare-fun m!914843 () Bool)

(assert (=> b!988200 m!914843))

(declare-fun m!914845 () Bool)

(assert (=> b!988201 m!914845))

(assert (=> d!116765 d!117015))

(declare-fun b!988202 () Bool)

(declare-fun e!557225 () List!20822)

(declare-fun call!41856 () List!20822)

(assert (=> b!988202 (= e!557225 call!41856)))

(declare-fun e!557226 () List!20822)

(declare-fun b!988203 () Bool)

(assert (=> b!988203 (= e!557226 (insertStrictlySorted!329 (t!29746 (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7478 lt!437809) (_2!7478 lt!437809)))))

(declare-fun b!988204 () Bool)

(declare-fun e!557224 () List!20822)

(assert (=> b!988204 (= e!557224 e!557225)))

(declare-fun c!100155 () Bool)

(assert (=> b!988204 (= c!100155 (and ((_ is Cons!20818) (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7478 (h!21980 (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7478 lt!437809))))))

(declare-fun b!988205 () Bool)

(declare-fun res!660993 () Bool)

(declare-fun e!557227 () Bool)

(assert (=> b!988205 (=> (not res!660993) (not e!557227))))

(declare-fun lt!438252 () List!20822)

(assert (=> b!988205 (= res!660993 (containsKey!477 lt!438252 (_1!7478 lt!437809)))))

(declare-fun b!988206 () Bool)

(declare-fun call!41854 () List!20822)

(assert (=> b!988206 (= e!557224 call!41854)))

(declare-fun d!117017 () Bool)

(assert (=> d!117017 e!557227))

(declare-fun res!660994 () Bool)

(assert (=> d!117017 (=> (not res!660994) (not e!557227))))

(assert (=> d!117017 (= res!660994 (isStrictlySorted!511 lt!438252))))

(assert (=> d!117017 (= lt!438252 e!557224)))

(declare-fun c!100154 () Bool)

(assert (=> d!117017 (= c!100154 (and ((_ is Cons!20818) (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7478 (h!21980 (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7478 lt!437809))))))

(assert (=> d!117017 (isStrictlySorted!511 (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!117017 (= (insertStrictlySorted!329 (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7478 lt!437809) (_2!7478 lt!437809)) lt!438252)))

(declare-fun c!100157 () Bool)

(declare-fun b!988207 () Bool)

(assert (=> b!988207 (= c!100157 (and ((_ is Cons!20818) (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7478 (h!21980 (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7478 lt!437809))))))

(declare-fun e!557223 () List!20822)

(assert (=> b!988207 (= e!557225 e!557223)))

(declare-fun b!988208 () Bool)

(declare-fun call!41855 () List!20822)

(assert (=> b!988208 (= e!557223 call!41855)))

(declare-fun b!988209 () Bool)

(assert (=> b!988209 (= e!557226 (ite c!100155 (t!29746 (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100157 (Cons!20818 (h!21980 (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29746 (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20819)))))

(declare-fun bm!41851 () Bool)

(assert (=> bm!41851 (= call!41855 call!41856)))

(declare-fun bm!41852 () Bool)

(assert (=> bm!41852 (= call!41856 call!41854)))

(declare-fun bm!41853 () Bool)

(assert (=> bm!41853 (= call!41854 ($colon$colon!555 e!557226 (ite c!100154 (h!21980 (toList!6826 (getCurrentListMap!3811 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809)))))))

(declare-fun c!100156 () Bool)

(assert (=> bm!41853 (= c!100156 c!100154)))

(declare-fun b!988210 () Bool)

(assert (=> b!988210 (= e!557223 call!41855)))

(declare-fun b!988211 () Bool)

(assert (=> b!988211 (= e!557227 (contains!5687 lt!438252 (tuple2!14935 (_1!7478 lt!437809) (_2!7478 lt!437809))))))

(assert (= (and d!117017 c!100154) b!988206))

(assert (= (and d!117017 (not c!100154)) b!988204))

(assert (= (and b!988204 c!100155) b!988202))

(assert (= (and b!988204 (not c!100155)) b!988207))

(assert (= (and b!988207 c!100157) b!988210))

(assert (= (and b!988207 (not c!100157)) b!988208))

(assert (= (or b!988210 b!988208) bm!41851))

(assert (= (or b!988202 bm!41851) bm!41852))

(assert (= (or b!988206 bm!41852) bm!41853))

(assert (= (and bm!41853 c!100156) b!988203))

(assert (= (and bm!41853 (not c!100156)) b!988209))

(assert (= (and d!117017 res!660994) b!988205))

(assert (= (and b!988205 res!660993) b!988211))

(declare-fun m!914847 () Bool)

(assert (=> b!988211 m!914847))

(declare-fun m!914849 () Bool)

(assert (=> bm!41853 m!914849))

(declare-fun m!914851 () Bool)

(assert (=> b!988203 m!914851))

(declare-fun m!914853 () Bool)

(assert (=> d!117017 m!914853))

(declare-fun m!914855 () Bool)

(assert (=> d!117017 m!914855))

(declare-fun m!914857 () Bool)

(assert (=> b!988205 m!914857))

(assert (=> d!116765 d!117017))

(assert (=> b!987765 d!116829))

(assert (=> b!987662 d!116911))

(declare-fun d!117019 () Bool)

(declare-fun e!557228 () Bool)

(assert (=> d!117019 e!557228))

(declare-fun res!660996 () Bool)

(assert (=> d!117019 (=> (not res!660996) (not e!557228))))

(declare-fun lt!438256 () ListLongMap!13621)

(assert (=> d!117019 (= res!660996 (contains!5686 lt!438256 (_1!7478 (tuple2!14935 lt!437974 minValue!1220))))))

(declare-fun lt!438253 () List!20822)

(assert (=> d!117019 (= lt!438256 (ListLongMap!13622 lt!438253))))

(declare-fun lt!438254 () Unit!32656)

(declare-fun lt!438255 () Unit!32656)

(assert (=> d!117019 (= lt!438254 lt!438255)))

(assert (=> d!117019 (= (getValueByKey!515 lt!438253 (_1!7478 (tuple2!14935 lt!437974 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437974 minValue!1220))))))

(assert (=> d!117019 (= lt!438255 (lemmaContainsTupThenGetReturnValue!272 lt!438253 (_1!7478 (tuple2!14935 lt!437974 minValue!1220)) (_2!7478 (tuple2!14935 lt!437974 minValue!1220))))))

(assert (=> d!117019 (= lt!438253 (insertStrictlySorted!329 (toList!6826 lt!437965) (_1!7478 (tuple2!14935 lt!437974 minValue!1220)) (_2!7478 (tuple2!14935 lt!437974 minValue!1220))))))

(assert (=> d!117019 (= (+!3102 lt!437965 (tuple2!14935 lt!437974 minValue!1220)) lt!438256)))

(declare-fun b!988212 () Bool)

(declare-fun res!660995 () Bool)

(assert (=> b!988212 (=> (not res!660995) (not e!557228))))

(assert (=> b!988212 (= res!660995 (= (getValueByKey!515 (toList!6826 lt!438256) (_1!7478 (tuple2!14935 lt!437974 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437974 minValue!1220)))))))

(declare-fun b!988213 () Bool)

(assert (=> b!988213 (= e!557228 (contains!5687 (toList!6826 lt!438256) (tuple2!14935 lt!437974 minValue!1220)))))

(assert (= (and d!117019 res!660996) b!988212))

(assert (= (and b!988212 res!660995) b!988213))

(declare-fun m!914859 () Bool)

(assert (=> d!117019 m!914859))

(declare-fun m!914861 () Bool)

(assert (=> d!117019 m!914861))

(declare-fun m!914863 () Bool)

(assert (=> d!117019 m!914863))

(declare-fun m!914865 () Bool)

(assert (=> d!117019 m!914865))

(declare-fun m!914867 () Bool)

(assert (=> b!988212 m!914867))

(declare-fun m!914869 () Bool)

(assert (=> b!988213 m!914869))

(assert (=> b!987760 d!117019))

(declare-fun d!117021 () Bool)

(declare-fun e!557229 () Bool)

(assert (=> d!117021 e!557229))

(declare-fun res!660998 () Bool)

(assert (=> d!117021 (=> (not res!660998) (not e!557229))))

(declare-fun lt!438260 () ListLongMap!13621)

(assert (=> d!117021 (= res!660998 (contains!5686 lt!438260 (_1!7478 (tuple2!14935 lt!437979 zeroValue!1220))))))

(declare-fun lt!438257 () List!20822)

(assert (=> d!117021 (= lt!438260 (ListLongMap!13622 lt!438257))))

(declare-fun lt!438258 () Unit!32656)

(declare-fun lt!438259 () Unit!32656)

(assert (=> d!117021 (= lt!438258 lt!438259)))

(assert (=> d!117021 (= (getValueByKey!515 lt!438257 (_1!7478 (tuple2!14935 lt!437979 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437979 zeroValue!1220))))))

(assert (=> d!117021 (= lt!438259 (lemmaContainsTupThenGetReturnValue!272 lt!438257 (_1!7478 (tuple2!14935 lt!437979 zeroValue!1220)) (_2!7478 (tuple2!14935 lt!437979 zeroValue!1220))))))

(assert (=> d!117021 (= lt!438257 (insertStrictlySorted!329 (toList!6826 lt!437984) (_1!7478 (tuple2!14935 lt!437979 zeroValue!1220)) (_2!7478 (tuple2!14935 lt!437979 zeroValue!1220))))))

(assert (=> d!117021 (= (+!3102 lt!437984 (tuple2!14935 lt!437979 zeroValue!1220)) lt!438260)))

(declare-fun b!988214 () Bool)

(declare-fun res!660997 () Bool)

(assert (=> b!988214 (=> (not res!660997) (not e!557229))))

(assert (=> b!988214 (= res!660997 (= (getValueByKey!515 (toList!6826 lt!438260) (_1!7478 (tuple2!14935 lt!437979 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437979 zeroValue!1220)))))))

(declare-fun b!988215 () Bool)

(assert (=> b!988215 (= e!557229 (contains!5687 (toList!6826 lt!438260) (tuple2!14935 lt!437979 zeroValue!1220)))))

(assert (= (and d!117021 res!660998) b!988214))

(assert (= (and b!988214 res!660997) b!988215))

(declare-fun m!914871 () Bool)

(assert (=> d!117021 m!914871))

(declare-fun m!914873 () Bool)

(assert (=> d!117021 m!914873))

(declare-fun m!914875 () Bool)

(assert (=> d!117021 m!914875))

(declare-fun m!914877 () Bool)

(assert (=> d!117021 m!914877))

(declare-fun m!914879 () Bool)

(assert (=> b!988214 m!914879))

(declare-fun m!914881 () Bool)

(assert (=> b!988215 m!914881))

(assert (=> b!987760 d!117021))

(declare-fun d!117023 () Bool)

(assert (=> d!117023 (= (apply!886 (+!3102 lt!437970 (tuple2!14935 lt!437972 zeroValue!1220)) lt!437976) (apply!886 lt!437970 lt!437976))))

(declare-fun lt!438261 () Unit!32656)

(assert (=> d!117023 (= lt!438261 (choose!1618 lt!437970 lt!437972 zeroValue!1220 lt!437976))))

(declare-fun e!557230 () Bool)

(assert (=> d!117023 e!557230))

(declare-fun res!660999 () Bool)

(assert (=> d!117023 (=> (not res!660999) (not e!557230))))

(assert (=> d!117023 (= res!660999 (contains!5686 lt!437970 lt!437976))))

(assert (=> d!117023 (= (addApplyDifferent!463 lt!437970 lt!437972 zeroValue!1220 lt!437976) lt!438261)))

(declare-fun b!988216 () Bool)

(assert (=> b!988216 (= e!557230 (not (= lt!437976 lt!437972)))))

(assert (= (and d!117023 res!660999) b!988216))

(assert (=> d!117023 m!914017))

(declare-fun m!914883 () Bool)

(assert (=> d!117023 m!914883))

(assert (=> d!117023 m!914013))

(assert (=> d!117023 m!914021))

(assert (=> d!117023 m!914013))

(declare-fun m!914885 () Bool)

(assert (=> d!117023 m!914885))

(assert (=> b!987760 d!117023))

(assert (=> b!987760 d!116783))

(declare-fun d!117025 () Bool)

(assert (=> d!117025 (= (apply!886 (+!3102 lt!437969 (tuple2!14935 lt!437967 minValue!1220)) lt!437986) (apply!886 lt!437969 lt!437986))))

(declare-fun lt!438262 () Unit!32656)

(assert (=> d!117025 (= lt!438262 (choose!1618 lt!437969 lt!437967 minValue!1220 lt!437986))))

(declare-fun e!557231 () Bool)

(assert (=> d!117025 e!557231))

(declare-fun res!661000 () Bool)

(assert (=> d!117025 (=> (not res!661000) (not e!557231))))

(assert (=> d!117025 (= res!661000 (contains!5686 lt!437969 lt!437986))))

(assert (=> d!117025 (= (addApplyDifferent!463 lt!437969 lt!437967 minValue!1220 lt!437986) lt!438262)))

(declare-fun b!988217 () Bool)

(assert (=> b!988217 (= e!557231 (not (= lt!437986 lt!437967)))))

(assert (= (and d!117025 res!661000) b!988217))

(assert (=> d!117025 m!914023))

(declare-fun m!914887 () Bool)

(assert (=> d!117025 m!914887))

(assert (=> d!117025 m!914001))

(assert (=> d!117025 m!914003))

(assert (=> d!117025 m!914001))

(declare-fun m!914889 () Bool)

(assert (=> d!117025 m!914889))

(assert (=> b!987760 d!117025))

(declare-fun d!117027 () Bool)

(assert (=> d!117027 (= (apply!886 lt!437969 lt!437986) (get!15596 (getValueByKey!515 (toList!6826 lt!437969) lt!437986)))))

(declare-fun bs!28018 () Bool)

(assert (= bs!28018 d!117027))

(declare-fun m!914891 () Bool)

(assert (=> bs!28018 m!914891))

(assert (=> bs!28018 m!914891))

(declare-fun m!914893 () Bool)

(assert (=> bs!28018 m!914893))

(assert (=> b!987760 d!117027))

(declare-fun d!117029 () Bool)

(assert (=> d!117029 (= (apply!886 lt!437970 lt!437976) (get!15596 (getValueByKey!515 (toList!6826 lt!437970) lt!437976)))))

(declare-fun bs!28019 () Bool)

(assert (= bs!28019 d!117029))

(declare-fun m!914895 () Bool)

(assert (=> bs!28019 m!914895))

(assert (=> bs!28019 m!914895))

(declare-fun m!914897 () Bool)

(assert (=> bs!28019 m!914897))

(assert (=> b!987760 d!117029))

(declare-fun d!117031 () Bool)

(assert (=> d!117031 (= (apply!886 (+!3102 lt!437965 (tuple2!14935 lt!437974 minValue!1220)) lt!437968) (get!15596 (getValueByKey!515 (toList!6826 (+!3102 lt!437965 (tuple2!14935 lt!437974 minValue!1220))) lt!437968)))))

(declare-fun bs!28020 () Bool)

(assert (= bs!28020 d!117031))

(declare-fun m!914899 () Bool)

(assert (=> bs!28020 m!914899))

(assert (=> bs!28020 m!914899))

(declare-fun m!914901 () Bool)

(assert (=> bs!28020 m!914901))

(assert (=> b!987760 d!117031))

(declare-fun d!117033 () Bool)

(declare-fun e!557233 () Bool)

(assert (=> d!117033 e!557233))

(declare-fun res!661001 () Bool)

(assert (=> d!117033 (=> res!661001 e!557233)))

(declare-fun lt!438264 () Bool)

(assert (=> d!117033 (= res!661001 (not lt!438264))))

(declare-fun lt!438266 () Bool)

(assert (=> d!117033 (= lt!438264 lt!438266)))

(declare-fun lt!438263 () Unit!32656)

(declare-fun e!557232 () Unit!32656)

(assert (=> d!117033 (= lt!438263 e!557232)))

(declare-fun c!100158 () Bool)

(assert (=> d!117033 (= c!100158 lt!438266)))

(assert (=> d!117033 (= lt!438266 (containsKey!477 (toList!6826 (+!3102 lt!437984 (tuple2!14935 lt!437979 zeroValue!1220))) lt!437966))))

(assert (=> d!117033 (= (contains!5686 (+!3102 lt!437984 (tuple2!14935 lt!437979 zeroValue!1220)) lt!437966) lt!438264)))

(declare-fun b!988218 () Bool)

(declare-fun lt!438265 () Unit!32656)

(assert (=> b!988218 (= e!557232 lt!438265)))

(assert (=> b!988218 (= lt!438265 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 (+!3102 lt!437984 (tuple2!14935 lt!437979 zeroValue!1220))) lt!437966))))

(assert (=> b!988218 (isDefined!385 (getValueByKey!515 (toList!6826 (+!3102 lt!437984 (tuple2!14935 lt!437979 zeroValue!1220))) lt!437966))))

(declare-fun b!988219 () Bool)

(declare-fun Unit!32680 () Unit!32656)

(assert (=> b!988219 (= e!557232 Unit!32680)))

(declare-fun b!988220 () Bool)

(assert (=> b!988220 (= e!557233 (isDefined!385 (getValueByKey!515 (toList!6826 (+!3102 lt!437984 (tuple2!14935 lt!437979 zeroValue!1220))) lt!437966)))))

(assert (= (and d!117033 c!100158) b!988218))

(assert (= (and d!117033 (not c!100158)) b!988219))

(assert (= (and d!117033 (not res!661001)) b!988220))

(declare-fun m!914903 () Bool)

(assert (=> d!117033 m!914903))

(declare-fun m!914905 () Bool)

(assert (=> b!988218 m!914905))

(declare-fun m!914907 () Bool)

(assert (=> b!988218 m!914907))

(assert (=> b!988218 m!914907))

(declare-fun m!914909 () Bool)

(assert (=> b!988218 m!914909))

(assert (=> b!988220 m!914907))

(assert (=> b!988220 m!914907))

(assert (=> b!988220 m!914909))

(assert (=> b!987760 d!117033))

(declare-fun d!117035 () Bool)

(declare-fun e!557234 () Bool)

(assert (=> d!117035 e!557234))

(declare-fun res!661003 () Bool)

(assert (=> d!117035 (=> (not res!661003) (not e!557234))))

(declare-fun lt!438270 () ListLongMap!13621)

(assert (=> d!117035 (= res!661003 (contains!5686 lt!438270 (_1!7478 (tuple2!14935 lt!437967 minValue!1220))))))

(declare-fun lt!438267 () List!20822)

(assert (=> d!117035 (= lt!438270 (ListLongMap!13622 lt!438267))))

(declare-fun lt!438268 () Unit!32656)

(declare-fun lt!438269 () Unit!32656)

(assert (=> d!117035 (= lt!438268 lt!438269)))

(assert (=> d!117035 (= (getValueByKey!515 lt!438267 (_1!7478 (tuple2!14935 lt!437967 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437967 minValue!1220))))))

(assert (=> d!117035 (= lt!438269 (lemmaContainsTupThenGetReturnValue!272 lt!438267 (_1!7478 (tuple2!14935 lt!437967 minValue!1220)) (_2!7478 (tuple2!14935 lt!437967 minValue!1220))))))

(assert (=> d!117035 (= lt!438267 (insertStrictlySorted!329 (toList!6826 lt!437969) (_1!7478 (tuple2!14935 lt!437967 minValue!1220)) (_2!7478 (tuple2!14935 lt!437967 minValue!1220))))))

(assert (=> d!117035 (= (+!3102 lt!437969 (tuple2!14935 lt!437967 minValue!1220)) lt!438270)))

(declare-fun b!988221 () Bool)

(declare-fun res!661002 () Bool)

(assert (=> b!988221 (=> (not res!661002) (not e!557234))))

(assert (=> b!988221 (= res!661002 (= (getValueByKey!515 (toList!6826 lt!438270) (_1!7478 (tuple2!14935 lt!437967 minValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437967 minValue!1220)))))))

(declare-fun b!988222 () Bool)

(assert (=> b!988222 (= e!557234 (contains!5687 (toList!6826 lt!438270) (tuple2!14935 lt!437967 minValue!1220)))))

(assert (= (and d!117035 res!661003) b!988221))

(assert (= (and b!988221 res!661002) b!988222))

(declare-fun m!914911 () Bool)

(assert (=> d!117035 m!914911))

(declare-fun m!914913 () Bool)

(assert (=> d!117035 m!914913))

(declare-fun m!914915 () Bool)

(assert (=> d!117035 m!914915))

(declare-fun m!914917 () Bool)

(assert (=> d!117035 m!914917))

(declare-fun m!914919 () Bool)

(assert (=> b!988221 m!914919))

(declare-fun m!914921 () Bool)

(assert (=> b!988222 m!914921))

(assert (=> b!987760 d!117035))

(declare-fun d!117037 () Bool)

(assert (=> d!117037 (= (apply!886 lt!437965 lt!437968) (get!15596 (getValueByKey!515 (toList!6826 lt!437965) lt!437968)))))

(declare-fun bs!28021 () Bool)

(assert (= bs!28021 d!117037))

(declare-fun m!914923 () Bool)

(assert (=> bs!28021 m!914923))

(assert (=> bs!28021 m!914923))

(declare-fun m!914925 () Bool)

(assert (=> bs!28021 m!914925))

(assert (=> b!987760 d!117037))

(declare-fun d!117039 () Bool)

(assert (=> d!117039 (= (apply!886 (+!3102 lt!437965 (tuple2!14935 lt!437974 minValue!1220)) lt!437968) (apply!886 lt!437965 lt!437968))))

(declare-fun lt!438271 () Unit!32656)

(assert (=> d!117039 (= lt!438271 (choose!1618 lt!437965 lt!437974 minValue!1220 lt!437968))))

(declare-fun e!557235 () Bool)

(assert (=> d!117039 e!557235))

(declare-fun res!661004 () Bool)

(assert (=> d!117039 (=> (not res!661004) (not e!557235))))

(assert (=> d!117039 (= res!661004 (contains!5686 lt!437965 lt!437968))))

(assert (=> d!117039 (= (addApplyDifferent!463 lt!437965 lt!437974 minValue!1220 lt!437968) lt!438271)))

(declare-fun b!988223 () Bool)

(assert (=> b!988223 (= e!557235 (not (= lt!437968 lt!437974)))))

(assert (= (and d!117039 res!661004) b!988223))

(assert (=> d!117039 m!914025))

(declare-fun m!914927 () Bool)

(assert (=> d!117039 m!914927))

(assert (=> d!117039 m!914009))

(assert (=> d!117039 m!914011))

(assert (=> d!117039 m!914009))

(declare-fun m!914929 () Bool)

(assert (=> d!117039 m!914929))

(assert (=> b!987760 d!117039))

(declare-fun d!117041 () Bool)

(declare-fun e!557236 () Bool)

(assert (=> d!117041 e!557236))

(declare-fun res!661006 () Bool)

(assert (=> d!117041 (=> (not res!661006) (not e!557236))))

(declare-fun lt!438275 () ListLongMap!13621)

(assert (=> d!117041 (= res!661006 (contains!5686 lt!438275 (_1!7478 (tuple2!14935 lt!437972 zeroValue!1220))))))

(declare-fun lt!438272 () List!20822)

(assert (=> d!117041 (= lt!438275 (ListLongMap!13622 lt!438272))))

(declare-fun lt!438273 () Unit!32656)

(declare-fun lt!438274 () Unit!32656)

(assert (=> d!117041 (= lt!438273 lt!438274)))

(assert (=> d!117041 (= (getValueByKey!515 lt!438272 (_1!7478 (tuple2!14935 lt!437972 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437972 zeroValue!1220))))))

(assert (=> d!117041 (= lt!438274 (lemmaContainsTupThenGetReturnValue!272 lt!438272 (_1!7478 (tuple2!14935 lt!437972 zeroValue!1220)) (_2!7478 (tuple2!14935 lt!437972 zeroValue!1220))))))

(assert (=> d!117041 (= lt!438272 (insertStrictlySorted!329 (toList!6826 lt!437970) (_1!7478 (tuple2!14935 lt!437972 zeroValue!1220)) (_2!7478 (tuple2!14935 lt!437972 zeroValue!1220))))))

(assert (=> d!117041 (= (+!3102 lt!437970 (tuple2!14935 lt!437972 zeroValue!1220)) lt!438275)))

(declare-fun b!988224 () Bool)

(declare-fun res!661005 () Bool)

(assert (=> b!988224 (=> (not res!661005) (not e!557236))))

(assert (=> b!988224 (= res!661005 (= (getValueByKey!515 (toList!6826 lt!438275) (_1!7478 (tuple2!14935 lt!437972 zeroValue!1220))) (Some!520 (_2!7478 (tuple2!14935 lt!437972 zeroValue!1220)))))))

(declare-fun b!988225 () Bool)

(assert (=> b!988225 (= e!557236 (contains!5687 (toList!6826 lt!438275) (tuple2!14935 lt!437972 zeroValue!1220)))))

(assert (= (and d!117041 res!661006) b!988224))

(assert (= (and b!988224 res!661005) b!988225))

(declare-fun m!914931 () Bool)

(assert (=> d!117041 m!914931))

(declare-fun m!914933 () Bool)

(assert (=> d!117041 m!914933))

(declare-fun m!914935 () Bool)

(assert (=> d!117041 m!914935))

(declare-fun m!914937 () Bool)

(assert (=> d!117041 m!914937))

(declare-fun m!914939 () Bool)

(assert (=> b!988224 m!914939))

(declare-fun m!914941 () Bool)

(assert (=> b!988225 m!914941))

(assert (=> b!987760 d!117041))

(declare-fun d!117043 () Bool)

(assert (=> d!117043 (= (apply!886 (+!3102 lt!437970 (tuple2!14935 lt!437972 zeroValue!1220)) lt!437976) (get!15596 (getValueByKey!515 (toList!6826 (+!3102 lt!437970 (tuple2!14935 lt!437972 zeroValue!1220))) lt!437976)))))

(declare-fun bs!28022 () Bool)

(assert (= bs!28022 d!117043))

(declare-fun m!914943 () Bool)

(assert (=> bs!28022 m!914943))

(assert (=> bs!28022 m!914943))

(declare-fun m!914945 () Bool)

(assert (=> bs!28022 m!914945))

(assert (=> b!987760 d!117043))

(declare-fun d!117045 () Bool)

(assert (=> d!117045 (= (apply!886 (+!3102 lt!437969 (tuple2!14935 lt!437967 minValue!1220)) lt!437986) (get!15596 (getValueByKey!515 (toList!6826 (+!3102 lt!437969 (tuple2!14935 lt!437967 minValue!1220))) lt!437986)))))

(declare-fun bs!28023 () Bool)

(assert (= bs!28023 d!117045))

(declare-fun m!914947 () Bool)

(assert (=> bs!28023 m!914947))

(assert (=> bs!28023 m!914947))

(declare-fun m!914949 () Bool)

(assert (=> bs!28023 m!914949))

(assert (=> b!987760 d!117045))

(declare-fun d!117047 () Bool)

(assert (=> d!117047 (contains!5686 (+!3102 lt!437984 (tuple2!14935 lt!437979 zeroValue!1220)) lt!437966)))

(declare-fun lt!438276 () Unit!32656)

(assert (=> d!117047 (= lt!438276 (choose!1617 lt!437984 lt!437979 zeroValue!1220 lt!437966))))

(assert (=> d!117047 (contains!5686 lt!437984 lt!437966)))

(assert (=> d!117047 (= (addStillContains!607 lt!437984 lt!437979 zeroValue!1220 lt!437966) lt!438276)))

(declare-fun bs!28024 () Bool)

(assert (= bs!28024 d!117047))

(assert (=> bs!28024 m!914015))

(assert (=> bs!28024 m!914015))

(assert (=> bs!28024 m!914027))

(declare-fun m!914951 () Bool)

(assert (=> bs!28024 m!914951))

(declare-fun m!914953 () Bool)

(assert (=> bs!28024 m!914953))

(assert (=> b!987760 d!117047))

(declare-fun d!117049 () Bool)

(declare-fun e!557238 () Bool)

(assert (=> d!117049 e!557238))

(declare-fun res!661007 () Bool)

(assert (=> d!117049 (=> res!661007 e!557238)))

(declare-fun lt!438278 () Bool)

(assert (=> d!117049 (= res!661007 (not lt!438278))))

(declare-fun lt!438280 () Bool)

(assert (=> d!117049 (= lt!438278 lt!438280)))

(declare-fun lt!438277 () Unit!32656)

(declare-fun e!557237 () Unit!32656)

(assert (=> d!117049 (= lt!438277 e!557237)))

(declare-fun c!100159 () Bool)

(assert (=> d!117049 (= c!100159 lt!438280)))

(assert (=> d!117049 (= lt!438280 (containsKey!477 (toList!6826 lt!437947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117049 (= (contains!5686 lt!437947 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438278)))

(declare-fun b!988226 () Bool)

(declare-fun lt!438279 () Unit!32656)

(assert (=> b!988226 (= e!557237 lt!438279)))

(assert (=> b!988226 (= lt!438279 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6826 lt!437947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988226 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988227 () Bool)

(declare-fun Unit!32681 () Unit!32656)

(assert (=> b!988227 (= e!557237 Unit!32681)))

(declare-fun b!988228 () Bool)

(assert (=> b!988228 (= e!557238 (isDefined!385 (getValueByKey!515 (toList!6826 lt!437947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117049 c!100159) b!988226))

(assert (= (and d!117049 (not c!100159)) b!988227))

(assert (= (and d!117049 (not res!661007)) b!988228))

(declare-fun m!914955 () Bool)

(assert (=> d!117049 m!914955))

(declare-fun m!914957 () Bool)

(assert (=> b!988226 m!914957))

(assert (=> b!988226 m!914731))

(assert (=> b!988226 m!914731))

(declare-fun m!914959 () Bool)

(assert (=> b!988226 m!914959))

(assert (=> b!988228 m!914731))

(assert (=> b!988228 m!914731))

(assert (=> b!988228 m!914959))

(assert (=> bm!41806 d!117049))

(declare-fun d!117051 () Bool)

(declare-fun e!557239 () Bool)

(assert (=> d!117051 e!557239))

(declare-fun res!661009 () Bool)

(assert (=> d!117051 (=> (not res!661009) (not e!557239))))

(declare-fun lt!438284 () ListLongMap!13621)

(assert (=> d!117051 (= res!661009 (contains!5686 lt!438284 (_1!7478 (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!438281 () List!20822)

(assert (=> d!117051 (= lt!438284 (ListLongMap!13622 lt!438281))))

(declare-fun lt!438282 () Unit!32656)

(declare-fun lt!438283 () Unit!32656)

(assert (=> d!117051 (= lt!438282 lt!438283)))

(assert (=> d!117051 (= (getValueByKey!515 lt!438281 (_1!7478 (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!520 (_2!7478 (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117051 (= lt!438283 (lemmaContainsTupThenGetReturnValue!272 lt!438281 (_1!7478 (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7478 (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117051 (= lt!438281 (insertStrictlySorted!329 (toList!6826 (ite c!100022 call!41819 (ite c!100026 call!41815 call!41818))) (_1!7478 (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7478 (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117051 (= (+!3102 (ite c!100022 call!41819 (ite c!100026 call!41815 call!41818)) (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!438284)))

(declare-fun b!988229 () Bool)

(declare-fun res!661008 () Bool)

(assert (=> b!988229 (=> (not res!661008) (not e!557239))))

(assert (=> b!988229 (= res!661008 (= (getValueByKey!515 (toList!6826 lt!438284) (_1!7478 (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!520 (_2!7478 (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!988230 () Bool)

(assert (=> b!988230 (= e!557239 (contains!5687 (toList!6826 lt!438284) (ite (or c!100022 c!100026) (tuple2!14935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14935 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117051 res!661009) b!988229))

(assert (= (and b!988229 res!661008) b!988230))

(declare-fun m!914961 () Bool)

(assert (=> d!117051 m!914961))

(declare-fun m!914963 () Bool)

(assert (=> d!117051 m!914963))

(declare-fun m!914965 () Bool)

(assert (=> d!117051 m!914965))

(declare-fun m!914967 () Bool)

(assert (=> d!117051 m!914967))

(declare-fun m!914969 () Bool)

(assert (=> b!988229 m!914969))

(declare-fun m!914971 () Bool)

(assert (=> b!988230 m!914971))

(assert (=> bm!41814 d!117051))

(declare-fun mapNonEmpty!36876 () Bool)

(declare-fun mapRes!36876 () Bool)

(declare-fun tp!69813 () Bool)

(declare-fun e!557241 () Bool)

(assert (=> mapNonEmpty!36876 (= mapRes!36876 (and tp!69813 e!557241))))

(declare-fun mapValue!36876 () ValueCell!11129)

(declare-fun mapKey!36876 () (_ BitVec 32))

(declare-fun mapRest!36876 () (Array (_ BitVec 32) ValueCell!11129))

(assert (=> mapNonEmpty!36876 (= mapRest!36875 (store mapRest!36876 mapKey!36876 mapValue!36876))))

(declare-fun mapIsEmpty!36876 () Bool)

(assert (=> mapIsEmpty!36876 mapRes!36876))

(declare-fun condMapEmpty!36876 () Bool)

(declare-fun mapDefault!36876 () ValueCell!11129)

(assert (=> mapNonEmpty!36875 (= condMapEmpty!36876 (= mapRest!36875 ((as const (Array (_ BitVec 32) ValueCell!11129)) mapDefault!36876)))))

(declare-fun e!557240 () Bool)

(assert (=> mapNonEmpty!36875 (= tp!69812 (and e!557240 mapRes!36876))))

(declare-fun b!988232 () Bool)

(assert (=> b!988232 (= e!557240 tp_is_empty!23221)))

(declare-fun b!988231 () Bool)

(assert (=> b!988231 (= e!557241 tp_is_empty!23221)))

(assert (= (and mapNonEmpty!36875 condMapEmpty!36876) mapIsEmpty!36876))

(assert (= (and mapNonEmpty!36875 (not condMapEmpty!36876)) mapNonEmpty!36876))

(assert (= (and mapNonEmpty!36876 ((_ is ValueCellFull!11129) mapValue!36876)) b!988231))

(assert (= (and mapNonEmpty!36875 ((_ is ValueCellFull!11129) mapDefault!36876)) b!988232))

(declare-fun m!914973 () Bool)

(assert (=> mapNonEmpty!36876 m!914973))

(declare-fun b_lambda!15051 () Bool)

(assert (= b_lambda!15045 (or (and start!84436 b_free!20005) b_lambda!15051)))

(declare-fun b_lambda!15053 () Bool)

(assert (= b_lambda!15043 (or (and start!84436 b_free!20005) b_lambda!15053)))

(declare-fun b_lambda!15055 () Bool)

(assert (= b_lambda!15047 (or (and start!84436 b_free!20005) b_lambda!15055)))

(declare-fun b_lambda!15057 () Bool)

(assert (= b_lambda!15049 (or (and start!84436 b_free!20005) b_lambda!15057)))

(check-sat (not d!116909) (not d!116873) (not d!116859) (not d!117029) (not b!988222) (not b!987884) (not b!988152) (not d!117051) (not b!988195) (not b!988185) (not b!988141) (not d!117047) (not b!987867) (not b!988030) (not b!987964) (not b!988191) (not b!988010) (not bm!41846) (not b!987879) (not d!116937) (not b!988138) (not b!988182) (not d!116943) (not b!988170) (not d!116893) (not b!988057) (not d!116843) (not b!988096) (not d!116883) (not b!988046) (not d!116959) (not d!116803) (not d!116921) (not d!117037) (not bm!41842) (not d!116899) (not b!988072) (not d!116979) (not b!988157) (not b_lambda!15057) (not d!116817) (not d!116997) (not b!987962) (not d!116957) (not b_lambda!15039) (not b!988218) (not d!116801) (not d!116981) (not d!116987) (not b!987975) (not b_lambda!15035) (not b!988054) (not d!117027) (not b!988221) (not b!988153) (not b!988211) (not b!988094) (not b!988180) (not b!988066) (not d!116947) (not b!988055) (not b!987965) tp_is_empty!23221 (not d!116879) (not d!116815) (not b!988205) (not b!988136) (not d!116811) (not d!116939) (not b!987837) (not b!988193) (not b!987959) (not b!988212) (not b!988163) (not b!987889) (not b!987989) (not b!987880) (not b!988103) (not b!988037) (not bm!41835) (not b!988225) (not d!116895) (not bm!41853) (not b!988140) (not b_lambda!15055) b_and!32077 (not d!117039) (not d!117009) (not b!988115) (not b!988214) (not b!988025) (not b!987992) (not b!988092) (not d!116961) (not b!988114) (not b!988052) (not d!116985) (not b!987896) (not b_lambda!15051) (not d!116931) (not b!988155) (not b!988145) (not b!987881) (not b!987983) (not b!988064) (not b!987977) (not d!116821) (not d!116871) (not d!116869) (not b!988198) (not d!116941) (not b!988226) (not b!988013) (not b!987957) (not b!988166) (not bm!41841) (not b!988125) (not d!116825) (not b!987882) (not b!987978) (not d!116915) (not b!987877) (not b!988230) (not b!988220) (not b!987902) (not b!988085) (not d!116965) (not b!988122) (not b!987858) (not b!988061) (not b!988005) (not bm!41850) (not b!988229) (not d!116807) (not b!988201) (not b!988183) (not b!988043) (not d!116917) (not b!988224) (not b!987887) (not b!987967) (not b!987905) (not d!116983) (not d!117001) (not b!988120) (not b!988022) (not d!117003) (not d!116889) (not b!988035) (not d!116831) (not d!117043) (not d!117045) (not d!117021) (not d!116837) (not d!116847) (not b!987875) (not d!116849) (not b!988190) (not b!987969) (not d!116967) (not b_lambda!15025) (not b!987954) (not bm!41829) (not bm!41847) (not d!117015) (not d!116855) (not d!116955) (not b!988058) (not d!116925) (not b!988109) (not b!987871) (not b!988021) (not b!987869) (not b!988200) (not bm!41820) (not d!116835) (not b!987986) (not b!988139) (not d!116875) (not b!988032) (not b_lambda!15053) (not d!116823) (not b!987900) (not b!987843) (not d!116913) (not b!988048) (not d!116845) (not b!987836) (not b!988083) (not b!987922) (not d!116827) (not d!117023) (not d!117025) (not d!116885) (not b!988027) (not d!116887) (not b!987878) (not b!988082) (not d!117049) (not b!987982) (not b!988228) (not d!116993) (not b!987903) (not b!987980) (not b!987945) (not b!988113) (not d!117017) (not b!988215) (not d!116999) (not d!117041) (not d!116841) (not b!987923) (not b!988143) (not b!987898) (not d!116923) (not bm!41838) (not d!116867) (not d!117033) (not b!988088) (not d!116833) (not b!988150) (not b!987976) (not d!116839) (not b!987863) (not b!988110) (not d!116903) (not b!987868) (not b!988069) (not b!987996) (not b!988188) (not b!987947) (not d!116949) (not b!987981) (not b!987953) (not d!117031) (not d!116975) (not d!116989) (not d!116971) (not d!117035) (not d!117007) (not b!988063) (not b!988071) (not b!988173) (not d!116877) (not d!116861) (not b!988056) (not b!988213) (not b!987991) (not mapNonEmpty!36876) (not b!988189) (not b!988059) (not b!988099) (not b!987883) (not b!987956) (not bm!41843) (not d!116953) (not b!987835) (not b!987994) (not d!117005) (not b!988147) (not d!117019) (not b!988132) (not b!987888) (not b!988142) (not b!988118) (not b!988187) (not d!116819) (not b!988024) (not b!988060) (not b!988008) (not b!987979) (not d!116897) (not b!988111) (not bm!41832) (not b!988168) (not b!988003) (not b!988015) (not b!988047) (not b!988033) (not b!988181) (not b!987873) (not b_lambda!15037) (not b!987916) (not b!988002) (not b!987984) (not b!988074) (not b!988011) (not b!987885) (not b!987865) (not b_lambda!15041) (not b!988203) (not d!116991) (not d!116995) (not b!988076) (not d!116865) (not d!116905) (not d!117011) (not b!987886) (not b_next!20005) (not d!116853) (not b!988144))
(check-sat b_and!32077 (not b_next!20005))
