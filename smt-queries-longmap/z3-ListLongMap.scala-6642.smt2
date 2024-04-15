; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83806 () Bool)

(assert start!83806)

(declare-fun b_free!19633 () Bool)

(declare-fun b_next!19633 () Bool)

(assert (=> start!83806 (= b_free!19633 (not b_next!19633))))

(declare-fun tp!68342 () Bool)

(declare-fun b_and!31329 () Bool)

(assert (=> start!83806 (= tp!68342 b_and!31329)))

(declare-fun b!978882 () Bool)

(declare-fun res!655139 () Bool)

(declare-fun e!551804 () Bool)

(assert (=> b!978882 (=> (not res!655139) (not e!551804))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978882 (= res!655139 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978883 () Bool)

(declare-fun res!655141 () Bool)

(assert (=> b!978883 (=> (not res!655141) (not e!551804))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61198 0))(
  ( (array!61199 (arr!29457 (Array (_ BitVec 32) (_ BitVec 64))) (size!29938 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61198)

(assert (=> b!978883 (= res!655141 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29938 _keys!1544))))))

(declare-fun mapNonEmpty!35969 () Bool)

(declare-fun mapRes!35969 () Bool)

(declare-fun tp!68341 () Bool)

(declare-fun e!551801 () Bool)

(assert (=> mapNonEmpty!35969 (= mapRes!35969 (and tp!68341 e!551801))))

(declare-datatypes ((V!35153 0))(
  ( (V!35154 (val!11364 Int)) )
))
(declare-datatypes ((ValueCell!10832 0))(
  ( (ValueCellFull!10832 (v!13925 V!35153)) (EmptyCell!10832) )
))
(declare-fun mapRest!35969 () (Array (_ BitVec 32) ValueCell!10832))

(declare-datatypes ((array!61200 0))(
  ( (array!61201 (arr!29458 (Array (_ BitVec 32) ValueCell!10832)) (size!29939 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61200)

(declare-fun mapKey!35969 () (_ BitVec 32))

(declare-fun mapValue!35969 () ValueCell!10832)

(assert (=> mapNonEmpty!35969 (= (arr!29458 _values!1278) (store mapRest!35969 mapKey!35969 mapValue!35969))))

(declare-fun res!655136 () Bool)

(assert (=> start!83806 (=> (not res!655136) (not e!551804))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83806 (= res!655136 (validMask!0 mask!1948))))

(assert (=> start!83806 e!551804))

(assert (=> start!83806 true))

(declare-fun tp_is_empty!22627 () Bool)

(assert (=> start!83806 tp_is_empty!22627))

(declare-fun e!551800 () Bool)

(declare-fun array_inv!22811 (array!61200) Bool)

(assert (=> start!83806 (and (array_inv!22811 _values!1278) e!551800)))

(assert (=> start!83806 tp!68342))

(declare-fun array_inv!22812 (array!61198) Bool)

(assert (=> start!83806 (array_inv!22812 _keys!1544)))

(declare-fun b!978884 () Bool)

(assert (=> b!978884 (= e!551801 tp_is_empty!22627)))

(declare-fun b!978885 () Bool)

(declare-fun res!655138 () Bool)

(assert (=> b!978885 (=> (not res!655138) (not e!551804))))

(declare-datatypes ((List!20462 0))(
  ( (Nil!20459) (Cons!20458 (h!21620 (_ BitVec 64)) (t!29042 List!20462)) )
))
(declare-fun arrayNoDuplicates!0 (array!61198 (_ BitVec 32) List!20462) Bool)

(assert (=> b!978885 (= res!655138 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20459))))

(declare-fun b!978886 () Bool)

(declare-fun e!551802 () Bool)

(assert (=> b!978886 (= e!551802 true)))

(declare-datatypes ((tuple2!14636 0))(
  ( (tuple2!14637 (_1!7329 (_ BitVec 64)) (_2!7329 V!35153)) )
))
(declare-datatypes ((List!20463 0))(
  ( (Nil!20460) (Cons!20459 (h!21621 tuple2!14636) (t!29043 List!20463)) )
))
(declare-datatypes ((ListLongMap!13323 0))(
  ( (ListLongMap!13324 (toList!6677 List!20463)) )
))
(declare-fun lt!433944 () ListLongMap!13323)

(declare-fun lt!433947 () ListLongMap!13323)

(declare-fun lt!433949 () tuple2!14636)

(declare-fun lt!433945 () tuple2!14636)

(declare-fun +!2977 (ListLongMap!13323 tuple2!14636) ListLongMap!13323)

(assert (=> b!978886 (= lt!433947 (+!2977 (+!2977 lt!433944 lt!433949) lt!433945))))

(declare-fun lt!433946 () V!35153)

(declare-fun zeroValue!1220 () V!35153)

(declare-datatypes ((Unit!32420 0))(
  ( (Unit!32421) )
))
(declare-fun lt!433953 () Unit!32420)

(declare-fun addCommutativeForDiffKeys!581 (ListLongMap!13323 (_ BitVec 64) V!35153 (_ BitVec 64) V!35153) Unit!32420)

(assert (=> b!978886 (= lt!433953 (addCommutativeForDiffKeys!581 lt!433944 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29457 _keys!1544) from!1932) lt!433946))))

(declare-fun b!978887 () Bool)

(declare-fun res!655142 () Bool)

(assert (=> b!978887 (=> (not res!655142) (not e!551804))))

(assert (=> b!978887 (= res!655142 (and (= (size!29939 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29938 _keys!1544) (size!29939 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978888 () Bool)

(declare-fun e!551799 () Bool)

(assert (=> b!978888 (= e!551800 (and e!551799 mapRes!35969))))

(declare-fun condMapEmpty!35969 () Bool)

(declare-fun mapDefault!35969 () ValueCell!10832)

(assert (=> b!978888 (= condMapEmpty!35969 (= (arr!29458 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10832)) mapDefault!35969)))))

(declare-fun b!978889 () Bool)

(declare-fun res!655140 () Bool)

(assert (=> b!978889 (=> (not res!655140) (not e!551804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978889 (= res!655140 (validKeyInArray!0 (select (arr!29457 _keys!1544) from!1932)))))

(declare-fun b!978890 () Bool)

(assert (=> b!978890 (= e!551799 tp_is_empty!22627)))

(declare-fun mapIsEmpty!35969 () Bool)

(assert (=> mapIsEmpty!35969 mapRes!35969))

(declare-fun b!978891 () Bool)

(assert (=> b!978891 (= e!551804 (not e!551802))))

(declare-fun res!655137 () Bool)

(assert (=> b!978891 (=> res!655137 e!551802)))

(assert (=> b!978891 (= res!655137 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29457 _keys!1544) from!1932)))))

(declare-fun lt!433948 () ListLongMap!13323)

(declare-fun lt!433952 () tuple2!14636)

(assert (=> b!978891 (= (+!2977 lt!433948 lt!433949) (+!2977 lt!433947 lt!433952))))

(declare-fun lt!433951 () ListLongMap!13323)

(assert (=> b!978891 (= lt!433947 (+!2977 lt!433951 lt!433949))))

(assert (=> b!978891 (= lt!433949 (tuple2!14637 (select (arr!29457 _keys!1544) from!1932) lt!433946))))

(assert (=> b!978891 (= lt!433948 (+!2977 lt!433951 lt!433952))))

(declare-fun minValue!1220 () V!35153)

(assert (=> b!978891 (= lt!433952 (tuple2!14637 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!433950 () Unit!32420)

(assert (=> b!978891 (= lt!433950 (addCommutativeForDiffKeys!581 lt!433951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29457 _keys!1544) from!1932) lt!433946))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15272 (ValueCell!10832 V!35153) V!35153)

(declare-fun dynLambda!1730 (Int (_ BitVec 64)) V!35153)

(assert (=> b!978891 (= lt!433946 (get!15272 (select (arr!29458 _values!1278) from!1932) (dynLambda!1730 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!978891 (= lt!433951 (+!2977 lt!433944 lt!433945))))

(assert (=> b!978891 (= lt!433945 (tuple2!14637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3397 (array!61198 array!61200 (_ BitVec 32) (_ BitVec 32) V!35153 V!35153 (_ BitVec 32) Int) ListLongMap!13323)

(assert (=> b!978891 (= lt!433944 (getCurrentListMapNoExtraKeys!3397 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!978892 () Bool)

(declare-fun res!655143 () Bool)

(assert (=> b!978892 (=> (not res!655143) (not e!551804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61198 (_ BitVec 32)) Bool)

(assert (=> b!978892 (= res!655143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83806 res!655136) b!978887))

(assert (= (and b!978887 res!655142) b!978892))

(assert (= (and b!978892 res!655143) b!978885))

(assert (= (and b!978885 res!655138) b!978883))

(assert (= (and b!978883 res!655141) b!978889))

(assert (= (and b!978889 res!655140) b!978882))

(assert (= (and b!978882 res!655139) b!978891))

(assert (= (and b!978891 (not res!655137)) b!978886))

(assert (= (and b!978888 condMapEmpty!35969) mapIsEmpty!35969))

(assert (= (and b!978888 (not condMapEmpty!35969)) mapNonEmpty!35969))

(get-info :version)

(assert (= (and mapNonEmpty!35969 ((_ is ValueCellFull!10832) mapValue!35969)) b!978884))

(assert (= (and b!978888 ((_ is ValueCellFull!10832) mapDefault!35969)) b!978890))

(assert (= start!83806 b!978888))

(declare-fun b_lambda!14659 () Bool)

(assert (=> (not b_lambda!14659) (not b!978891)))

(declare-fun t!29041 () Bool)

(declare-fun tb!6431 () Bool)

(assert (=> (and start!83806 (= defaultEntry!1281 defaultEntry!1281) t!29041) tb!6431))

(declare-fun result!12859 () Bool)

(assert (=> tb!6431 (= result!12859 tp_is_empty!22627)))

(assert (=> b!978891 t!29041))

(declare-fun b_and!31331 () Bool)

(assert (= b_and!31329 (and (=> t!29041 result!12859) b_and!31331)))

(declare-fun m!905609 () Bool)

(assert (=> b!978889 m!905609))

(assert (=> b!978889 m!905609))

(declare-fun m!905611 () Bool)

(assert (=> b!978889 m!905611))

(declare-fun m!905613 () Bool)

(assert (=> mapNonEmpty!35969 m!905613))

(declare-fun m!905615 () Bool)

(assert (=> b!978892 m!905615))

(declare-fun m!905617 () Bool)

(assert (=> b!978886 m!905617))

(assert (=> b!978886 m!905617))

(declare-fun m!905619 () Bool)

(assert (=> b!978886 m!905619))

(assert (=> b!978886 m!905609))

(assert (=> b!978886 m!905609))

(declare-fun m!905621 () Bool)

(assert (=> b!978886 m!905621))

(assert (=> b!978891 m!905609))

(declare-fun m!905623 () Bool)

(assert (=> b!978891 m!905623))

(declare-fun m!905625 () Bool)

(assert (=> b!978891 m!905625))

(declare-fun m!905627 () Bool)

(assert (=> b!978891 m!905627))

(declare-fun m!905629 () Bool)

(assert (=> b!978891 m!905629))

(declare-fun m!905631 () Bool)

(assert (=> b!978891 m!905631))

(declare-fun m!905633 () Bool)

(assert (=> b!978891 m!905633))

(declare-fun m!905635 () Bool)

(assert (=> b!978891 m!905635))

(assert (=> b!978891 m!905609))

(declare-fun m!905637 () Bool)

(assert (=> b!978891 m!905637))

(declare-fun m!905639 () Bool)

(assert (=> b!978891 m!905639))

(assert (=> b!978891 m!905623))

(assert (=> b!978891 m!905639))

(declare-fun m!905641 () Bool)

(assert (=> b!978891 m!905641))

(declare-fun m!905643 () Bool)

(assert (=> start!83806 m!905643))

(declare-fun m!905645 () Bool)

(assert (=> start!83806 m!905645))

(declare-fun m!905647 () Bool)

(assert (=> start!83806 m!905647))

(declare-fun m!905649 () Bool)

(assert (=> b!978885 m!905649))

(check-sat (not b!978885) (not mapNonEmpty!35969) (not b!978892) (not b_next!19633) (not b!978886) (not b!978891) (not start!83806) b_and!31331 (not b!978889) (not b_lambda!14659) tp_is_empty!22627)
(check-sat b_and!31331 (not b_next!19633))
