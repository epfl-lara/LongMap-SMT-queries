; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83860 () Bool)

(assert start!83860)

(declare-fun b_free!19687 () Bool)

(declare-fun b_next!19687 () Bool)

(assert (=> start!83860 (= b_free!19687 (not b_next!19687))))

(declare-fun tp!68503 () Bool)

(declare-fun b_and!31437 () Bool)

(assert (=> start!83860 (= tp!68503 b_and!31437)))

(declare-fun b!979827 () Bool)

(declare-fun e!552289 () Bool)

(declare-fun tp_is_empty!22681 () Bool)

(assert (=> b!979827 (= e!552289 tp_is_empty!22681)))

(declare-fun b!979828 () Bool)

(declare-fun res!655790 () Bool)

(declare-fun e!552287 () Bool)

(assert (=> b!979828 (=> (not res!655790) (not e!552287))))

(declare-datatypes ((array!61298 0))(
  ( (array!61299 (arr!29507 (Array (_ BitVec 32) (_ BitVec 64))) (size!29988 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61298)

(declare-datatypes ((List!20505 0))(
  ( (Nil!20502) (Cons!20501 (h!21663 (_ BitVec 64)) (t!29139 List!20505)) )
))
(declare-fun arrayNoDuplicates!0 (array!61298 (_ BitVec 32) List!20505) Bool)

(assert (=> b!979828 (= res!655790 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20502))))

(declare-fun b!979829 () Bool)

(declare-fun e!552285 () Bool)

(assert (=> b!979829 (= e!552285 true)))

(declare-datatypes ((V!35225 0))(
  ( (V!35226 (val!11391 Int)) )
))
(declare-datatypes ((tuple2!14682 0))(
  ( (tuple2!14683 (_1!7352 (_ BitVec 64)) (_2!7352 V!35225)) )
))
(declare-fun lt!434762 () tuple2!14682)

(declare-fun lt!434758 () tuple2!14682)

(declare-datatypes ((List!20506 0))(
  ( (Nil!20503) (Cons!20502 (h!21664 tuple2!14682) (t!29140 List!20506)) )
))
(declare-datatypes ((ListLongMap!13369 0))(
  ( (ListLongMap!13370 (toList!6700 List!20506)) )
))
(declare-fun lt!434755 () ListLongMap!13369)

(declare-fun lt!434759 () ListLongMap!13369)

(declare-fun +!3000 (ListLongMap!13369 tuple2!14682) ListLongMap!13369)

(assert (=> b!979829 (= lt!434759 (+!3000 (+!3000 lt!434755 lt!434758) lt!434762))))

(declare-fun zeroValue!1220 () V!35225)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((Unit!32466 0))(
  ( (Unit!32467) )
))
(declare-fun lt!434757 () Unit!32466)

(declare-fun lt!434756 () V!35225)

(declare-fun addCommutativeForDiffKeys!604 (ListLongMap!13369 (_ BitVec 64) V!35225 (_ BitVec 64) V!35225) Unit!32466)

(assert (=> b!979829 (= lt!434757 (addCommutativeForDiffKeys!604 lt!434755 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29507 _keys!1544) from!1932) lt!434756))))

(declare-fun b!979830 () Bool)

(declare-fun e!552286 () Bool)

(declare-fun e!552288 () Bool)

(declare-fun mapRes!36050 () Bool)

(assert (=> b!979830 (= e!552286 (and e!552288 mapRes!36050))))

(declare-fun condMapEmpty!36050 () Bool)

(declare-datatypes ((ValueCell!10859 0))(
  ( (ValueCellFull!10859 (v!13952 V!35225)) (EmptyCell!10859) )
))
(declare-datatypes ((array!61300 0))(
  ( (array!61301 (arr!29508 (Array (_ BitVec 32) ValueCell!10859)) (size!29989 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61300)

(declare-fun mapDefault!36050 () ValueCell!10859)

(assert (=> b!979830 (= condMapEmpty!36050 (= (arr!29508 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10859)) mapDefault!36050)))))

(declare-fun mapIsEmpty!36050 () Bool)

(assert (=> mapIsEmpty!36050 mapRes!36050))

(declare-fun b!979831 () Bool)

(assert (=> b!979831 (= e!552288 tp_is_empty!22681)))

(declare-fun res!655791 () Bool)

(assert (=> start!83860 (=> (not res!655791) (not e!552287))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83860 (= res!655791 (validMask!0 mask!1948))))

(assert (=> start!83860 e!552287))

(assert (=> start!83860 true))

(assert (=> start!83860 tp_is_empty!22681))

(declare-fun array_inv!22839 (array!61300) Bool)

(assert (=> start!83860 (and (array_inv!22839 _values!1278) e!552286)))

(assert (=> start!83860 tp!68503))

(declare-fun array_inv!22840 (array!61298) Bool)

(assert (=> start!83860 (array_inv!22840 _keys!1544)))

(declare-fun b!979832 () Bool)

(declare-fun res!655786 () Bool)

(assert (=> b!979832 (=> (not res!655786) (not e!552287))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979832 (= res!655786 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36050 () Bool)

(declare-fun tp!68504 () Bool)

(assert (=> mapNonEmpty!36050 (= mapRes!36050 (and tp!68504 e!552289))))

(declare-fun mapRest!36050 () (Array (_ BitVec 32) ValueCell!10859))

(declare-fun mapValue!36050 () ValueCell!10859)

(declare-fun mapKey!36050 () (_ BitVec 32))

(assert (=> mapNonEmpty!36050 (= (arr!29508 _values!1278) (store mapRest!36050 mapKey!36050 mapValue!36050))))

(declare-fun b!979833 () Bool)

(declare-fun res!655785 () Bool)

(assert (=> b!979833 (=> (not res!655785) (not e!552287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979833 (= res!655785 (validKeyInArray!0 (select (arr!29507 _keys!1544) from!1932)))))

(declare-fun b!979834 () Bool)

(declare-fun res!655789 () Bool)

(assert (=> b!979834 (=> (not res!655789) (not e!552287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61298 (_ BitVec 32)) Bool)

(assert (=> b!979834 (= res!655789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979835 () Bool)

(declare-fun res!655788 () Bool)

(assert (=> b!979835 (=> (not res!655788) (not e!552287))))

(assert (=> b!979835 (= res!655788 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29988 _keys!1544))))))

(declare-fun b!979836 () Bool)

(declare-fun res!655787 () Bool)

(assert (=> b!979836 (=> (not res!655787) (not e!552287))))

(assert (=> b!979836 (= res!655787 (and (= (size!29989 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29988 _keys!1544) (size!29989 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979837 () Bool)

(assert (=> b!979837 (= e!552287 (not e!552285))))

(declare-fun res!655784 () Bool)

(assert (=> b!979837 (=> res!655784 e!552285)))

(assert (=> b!979837 (= res!655784 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29507 _keys!1544) from!1932)))))

(declare-fun lt!434754 () tuple2!14682)

(declare-fun lt!434763 () ListLongMap!13369)

(assert (=> b!979837 (= (+!3000 lt!434763 lt!434758) (+!3000 lt!434759 lt!434754))))

(declare-fun lt!434761 () ListLongMap!13369)

(assert (=> b!979837 (= lt!434759 (+!3000 lt!434761 lt!434758))))

(assert (=> b!979837 (= lt!434758 (tuple2!14683 (select (arr!29507 _keys!1544) from!1932) lt!434756))))

(assert (=> b!979837 (= lt!434763 (+!3000 lt!434761 lt!434754))))

(declare-fun minValue!1220 () V!35225)

(assert (=> b!979837 (= lt!434754 (tuple2!14683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434760 () Unit!32466)

(assert (=> b!979837 (= lt!434760 (addCommutativeForDiffKeys!604 lt!434761 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29507 _keys!1544) from!1932) lt!434756))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15307 (ValueCell!10859 V!35225) V!35225)

(declare-fun dynLambda!1747 (Int (_ BitVec 64)) V!35225)

(assert (=> b!979837 (= lt!434756 (get!15307 (select (arr!29508 _values!1278) from!1932) (dynLambda!1747 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979837 (= lt!434761 (+!3000 lt!434755 lt!434762))))

(assert (=> b!979837 (= lt!434762 (tuple2!14683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3414 (array!61298 array!61300 (_ BitVec 32) (_ BitVec 32) V!35225 V!35225 (_ BitVec 32) Int) ListLongMap!13369)

(assert (=> b!979837 (= lt!434755 (getCurrentListMapNoExtraKeys!3414 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!83860 res!655791) b!979836))

(assert (= (and b!979836 res!655787) b!979834))

(assert (= (and b!979834 res!655789) b!979828))

(assert (= (and b!979828 res!655790) b!979835))

(assert (= (and b!979835 res!655788) b!979833))

(assert (= (and b!979833 res!655785) b!979832))

(assert (= (and b!979832 res!655786) b!979837))

(assert (= (and b!979837 (not res!655784)) b!979829))

(assert (= (and b!979830 condMapEmpty!36050) mapIsEmpty!36050))

(assert (= (and b!979830 (not condMapEmpty!36050)) mapNonEmpty!36050))

(get-info :version)

(assert (= (and mapNonEmpty!36050 ((_ is ValueCellFull!10859) mapValue!36050)) b!979827))

(assert (= (and b!979830 ((_ is ValueCellFull!10859) mapDefault!36050)) b!979831))

(assert (= start!83860 b!979830))

(declare-fun b_lambda!14713 () Bool)

(assert (=> (not b_lambda!14713) (not b!979837)))

(declare-fun t!29138 () Bool)

(declare-fun tb!6485 () Bool)

(assert (=> (and start!83860 (= defaultEntry!1281 defaultEntry!1281) t!29138) tb!6485))

(declare-fun result!12967 () Bool)

(assert (=> tb!6485 (= result!12967 tp_is_empty!22681)))

(assert (=> b!979837 t!29138))

(declare-fun b_and!31439 () Bool)

(assert (= b_and!31437 (and (=> t!29138 result!12967) b_and!31439)))

(declare-fun m!906743 () Bool)

(assert (=> b!979837 m!906743))

(declare-fun m!906745 () Bool)

(assert (=> b!979837 m!906745))

(assert (=> b!979837 m!906743))

(declare-fun m!906747 () Bool)

(assert (=> b!979837 m!906747))

(declare-fun m!906749 () Bool)

(assert (=> b!979837 m!906749))

(declare-fun m!906751 () Bool)

(assert (=> b!979837 m!906751))

(declare-fun m!906753 () Bool)

(assert (=> b!979837 m!906753))

(declare-fun m!906755 () Bool)

(assert (=> b!979837 m!906755))

(declare-fun m!906757 () Bool)

(assert (=> b!979837 m!906757))

(declare-fun m!906759 () Bool)

(assert (=> b!979837 m!906759))

(declare-fun m!906761 () Bool)

(assert (=> b!979837 m!906761))

(assert (=> b!979837 m!906745))

(assert (=> b!979837 m!906761))

(declare-fun m!906763 () Bool)

(assert (=> b!979837 m!906763))

(declare-fun m!906765 () Bool)

(assert (=> b!979828 m!906765))

(declare-fun m!906767 () Bool)

(assert (=> b!979834 m!906767))

(declare-fun m!906769 () Bool)

(assert (=> b!979829 m!906769))

(assert (=> b!979829 m!906769))

(declare-fun m!906771 () Bool)

(assert (=> b!979829 m!906771))

(assert (=> b!979829 m!906743))

(assert (=> b!979829 m!906743))

(declare-fun m!906773 () Bool)

(assert (=> b!979829 m!906773))

(declare-fun m!906775 () Bool)

(assert (=> mapNonEmpty!36050 m!906775))

(assert (=> b!979833 m!906743))

(assert (=> b!979833 m!906743))

(declare-fun m!906777 () Bool)

(assert (=> b!979833 m!906777))

(declare-fun m!906779 () Bool)

(assert (=> start!83860 m!906779))

(declare-fun m!906781 () Bool)

(assert (=> start!83860 m!906781))

(declare-fun m!906783 () Bool)

(assert (=> start!83860 m!906783))

(check-sat b_and!31439 (not mapNonEmpty!36050) tp_is_empty!22681 (not b_lambda!14713) (not b!979829) (not b!979837) (not start!83860) (not b_next!19687) (not b!979833) (not b!979834) (not b!979828))
(check-sat b_and!31439 (not b_next!19687))
