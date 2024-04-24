; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83508 () Bool)

(assert start!83508)

(declare-fun b_free!19333 () Bool)

(declare-fun b_next!19333 () Bool)

(assert (=> start!83508 (= b_free!19333 (not b_next!19333))))

(declare-fun tp!67279 () Bool)

(declare-fun b_and!30897 () Bool)

(assert (=> start!83508 (= tp!67279 b_and!30897)))

(declare-fun b!973869 () Bool)

(declare-fun res!651617 () Bool)

(declare-fun e!548992 () Bool)

(assert (=> b!973869 (=> (not res!651617) (not e!548992))))

(declare-datatypes ((array!60534 0))(
  ( (array!60535 (arr!29126 (Array (_ BitVec 32) (_ BitVec 64))) (size!29606 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60534)

(declare-datatypes ((List!20184 0))(
  ( (Nil!20181) (Cons!20180 (h!21348 (_ BitVec 64)) (t!28607 List!20184)) )
))
(declare-fun arrayNoDuplicates!0 (array!60534 (_ BitVec 32) List!20184) Bool)

(assert (=> b!973869 (= res!651617 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20181))))

(declare-fun mapNonEmpty!35356 () Bool)

(declare-fun mapRes!35356 () Bool)

(declare-fun tp!67278 () Bool)

(declare-fun e!548991 () Bool)

(assert (=> mapNonEmpty!35356 (= mapRes!35356 (and tp!67278 e!548991))))

(declare-fun mapKey!35356 () (_ BitVec 32))

(declare-datatypes ((V!34625 0))(
  ( (V!34626 (val!11166 Int)) )
))
(declare-datatypes ((ValueCell!10634 0))(
  ( (ValueCellFull!10634 (v!13722 V!34625)) (EmptyCell!10634) )
))
(declare-datatypes ((array!60536 0))(
  ( (array!60537 (arr!29127 (Array (_ BitVec 32) ValueCell!10634)) (size!29607 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60536)

(declare-fun mapValue!35356 () ValueCell!10634)

(declare-fun mapRest!35356 () (Array (_ BitVec 32) ValueCell!10634))

(assert (=> mapNonEmpty!35356 (= (arr!29127 _values!1425) (store mapRest!35356 mapKey!35356 mapValue!35356))))

(declare-fun mapIsEmpty!35356 () Bool)

(assert (=> mapIsEmpty!35356 mapRes!35356))

(declare-fun b!973871 () Bool)

(declare-fun e!548989 () Bool)

(declare-fun e!548995 () Bool)

(assert (=> b!973871 (= e!548989 e!548995)))

(declare-fun res!651614 () Bool)

(assert (=> b!973871 (=> (not res!651614) (not e!548995))))

(declare-fun lt!432577 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973871 (= res!651614 (validKeyInArray!0 lt!432577))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973871 (= lt!432577 (select (arr!29126 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34625)

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14334 0))(
  ( (tuple2!14335 (_1!7178 (_ BitVec 64)) (_2!7178 V!34625)) )
))
(declare-datatypes ((List!20185 0))(
  ( (Nil!20182) (Cons!20181 (h!21349 tuple2!14334) (t!28608 List!20185)) )
))
(declare-datatypes ((ListLongMap!13033 0))(
  ( (ListLongMap!13034 (toList!6532 List!20185)) )
))
(declare-fun lt!432579 () ListLongMap!13033)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34625)

(declare-fun getCurrentListMap!3765 (array!60534 array!60536 (_ BitVec 32) (_ BitVec 32) V!34625 V!34625 (_ BitVec 32) Int) ListLongMap!13033)

(assert (=> b!973871 (= lt!432579 (getCurrentListMap!3765 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973872 () Bool)

(declare-fun tp_is_empty!22231 () Bool)

(assert (=> b!973872 (= e!548991 tp_is_empty!22231)))

(declare-fun b!973873 () Bool)

(declare-fun res!651613 () Bool)

(assert (=> b!973873 (=> (not res!651613) (not e!548992))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973873 (= res!651613 (validKeyInArray!0 (select (arr!29126 _keys!1717) i!822)))))

(declare-fun b!973874 () Bool)

(assert (=> b!973874 (= e!548995 (not true))))

(declare-fun lt!432580 () tuple2!14334)

(declare-fun lt!432582 () ListLongMap!13033)

(declare-fun contains!5640 (ListLongMap!13033 (_ BitVec 64)) Bool)

(declare-fun +!2908 (ListLongMap!13033 tuple2!14334) ListLongMap!13033)

(assert (=> b!973874 (contains!5640 (+!2908 lt!432582 lt!432580) (select (arr!29126 _keys!1717) i!822))))

(declare-datatypes ((Unit!32380 0))(
  ( (Unit!32381) )
))
(declare-fun lt!432576 () Unit!32380)

(declare-fun lt!432578 () V!34625)

(declare-fun addStillContains!590 (ListLongMap!13033 (_ BitVec 64) V!34625 (_ BitVec 64)) Unit!32380)

(assert (=> b!973874 (= lt!432576 (addStillContains!590 lt!432582 lt!432577 lt!432578 (select (arr!29126 _keys!1717) i!822)))))

(assert (=> b!973874 (= lt!432579 (+!2908 (getCurrentListMap!3765 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432580))))

(assert (=> b!973874 (= lt!432580 (tuple2!14335 lt!432577 lt!432578))))

(declare-fun get!15111 (ValueCell!10634 V!34625) V!34625)

(declare-fun dynLambda!1705 (Int (_ BitVec 64)) V!34625)

(assert (=> b!973874 (= lt!432578 (get!15111 (select (arr!29127 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1705 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432581 () Unit!32380)

(declare-fun lemmaListMapRecursiveValidKeyArray!264 (array!60534 array!60536 (_ BitVec 32) (_ BitVec 32) V!34625 V!34625 (_ BitVec 32) Int) Unit!32380)

(assert (=> b!973874 (= lt!432581 (lemmaListMapRecursiveValidKeyArray!264 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973875 () Bool)

(declare-fun res!651616 () Bool)

(assert (=> b!973875 (=> (not res!651616) (not e!548992))))

(assert (=> b!973875 (= res!651616 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29606 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29606 _keys!1717))))))

(declare-fun b!973876 () Bool)

(assert (=> b!973876 (= e!548992 e!548989)))

(declare-fun res!651618 () Bool)

(assert (=> b!973876 (=> (not res!651618) (not e!548989))))

(assert (=> b!973876 (= res!651618 (contains!5640 lt!432582 (select (arr!29126 _keys!1717) i!822)))))

(assert (=> b!973876 (= lt!432582 (getCurrentListMap!3765 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973877 () Bool)

(declare-fun res!651615 () Bool)

(assert (=> b!973877 (=> (not res!651615) (not e!548992))))

(assert (=> b!973877 (= res!651615 (and (= (size!29607 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29606 _keys!1717) (size!29607 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!651619 () Bool)

(assert (=> start!83508 (=> (not res!651619) (not e!548992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83508 (= res!651619 (validMask!0 mask!2147))))

(assert (=> start!83508 e!548992))

(assert (=> start!83508 true))

(declare-fun e!548994 () Bool)

(declare-fun array_inv!22589 (array!60536) Bool)

(assert (=> start!83508 (and (array_inv!22589 _values!1425) e!548994)))

(assert (=> start!83508 tp_is_empty!22231))

(assert (=> start!83508 tp!67279))

(declare-fun array_inv!22590 (array!60534) Bool)

(assert (=> start!83508 (array_inv!22590 _keys!1717)))

(declare-fun b!973870 () Bool)

(declare-fun e!548993 () Bool)

(assert (=> b!973870 (= e!548994 (and e!548993 mapRes!35356))))

(declare-fun condMapEmpty!35356 () Bool)

(declare-fun mapDefault!35356 () ValueCell!10634)

(assert (=> b!973870 (= condMapEmpty!35356 (= (arr!29127 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10634)) mapDefault!35356)))))

(declare-fun b!973878 () Bool)

(declare-fun res!651620 () Bool)

(assert (=> b!973878 (=> (not res!651620) (not e!548992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60534 (_ BitVec 32)) Bool)

(assert (=> b!973878 (= res!651620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973879 () Bool)

(assert (=> b!973879 (= e!548993 tp_is_empty!22231)))

(assert (= (and start!83508 res!651619) b!973877))

(assert (= (and b!973877 res!651615) b!973878))

(assert (= (and b!973878 res!651620) b!973869))

(assert (= (and b!973869 res!651617) b!973875))

(assert (= (and b!973875 res!651616) b!973873))

(assert (= (and b!973873 res!651613) b!973876))

(assert (= (and b!973876 res!651618) b!973871))

(assert (= (and b!973871 res!651614) b!973874))

(assert (= (and b!973870 condMapEmpty!35356) mapIsEmpty!35356))

(assert (= (and b!973870 (not condMapEmpty!35356)) mapNonEmpty!35356))

(get-info :version)

(assert (= (and mapNonEmpty!35356 ((_ is ValueCellFull!10634) mapValue!35356)) b!973872))

(assert (= (and b!973870 ((_ is ValueCellFull!10634) mapDefault!35356)) b!973879))

(assert (= start!83508 b!973870))

(declare-fun b_lambda!14511 () Bool)

(assert (=> (not b_lambda!14511) (not b!973874)))

(declare-fun t!28606 () Bool)

(declare-fun tb!6273 () Bool)

(assert (=> (and start!83508 (= defaultEntry!1428 defaultEntry!1428) t!28606) tb!6273))

(declare-fun result!12531 () Bool)

(assert (=> tb!6273 (= result!12531 tp_is_empty!22231)))

(assert (=> b!973874 t!28606))

(declare-fun b_and!30899 () Bool)

(assert (= b_and!30897 (and (=> t!28606 result!12531) b_and!30899)))

(declare-fun m!901733 () Bool)

(assert (=> b!973869 m!901733))

(declare-fun m!901735 () Bool)

(assert (=> b!973874 m!901735))

(declare-fun m!901737 () Bool)

(assert (=> b!973874 m!901737))

(declare-fun m!901739 () Bool)

(assert (=> b!973874 m!901739))

(declare-fun m!901741 () Bool)

(assert (=> b!973874 m!901741))

(declare-fun m!901743 () Bool)

(assert (=> b!973874 m!901743))

(assert (=> b!973874 m!901735))

(assert (=> b!973874 m!901739))

(assert (=> b!973874 m!901743))

(declare-fun m!901745 () Bool)

(assert (=> b!973874 m!901745))

(declare-fun m!901747 () Bool)

(assert (=> b!973874 m!901747))

(assert (=> b!973874 m!901735))

(declare-fun m!901749 () Bool)

(assert (=> b!973874 m!901749))

(declare-fun m!901751 () Bool)

(assert (=> b!973874 m!901751))

(assert (=> b!973874 m!901741))

(declare-fun m!901753 () Bool)

(assert (=> b!973874 m!901753))

(assert (=> b!973874 m!901747))

(assert (=> b!973876 m!901735))

(assert (=> b!973876 m!901735))

(declare-fun m!901755 () Bool)

(assert (=> b!973876 m!901755))

(declare-fun m!901757 () Bool)

(assert (=> b!973876 m!901757))

(declare-fun m!901759 () Bool)

(assert (=> b!973871 m!901759))

(declare-fun m!901761 () Bool)

(assert (=> b!973871 m!901761))

(declare-fun m!901763 () Bool)

(assert (=> b!973871 m!901763))

(declare-fun m!901765 () Bool)

(assert (=> start!83508 m!901765))

(declare-fun m!901767 () Bool)

(assert (=> start!83508 m!901767))

(declare-fun m!901769 () Bool)

(assert (=> start!83508 m!901769))

(assert (=> b!973873 m!901735))

(assert (=> b!973873 m!901735))

(declare-fun m!901771 () Bool)

(assert (=> b!973873 m!901771))

(declare-fun m!901773 () Bool)

(assert (=> mapNonEmpty!35356 m!901773))

(declare-fun m!901775 () Bool)

(assert (=> b!973878 m!901775))

(check-sat (not mapNonEmpty!35356) (not b!973871) (not start!83508) (not b!973869) (not b_lambda!14511) b_and!30899 (not b!973873) (not b!973874) tp_is_empty!22231 (not b!973878) (not b!973876) (not b_next!19333))
(check-sat b_and!30899 (not b_next!19333))
