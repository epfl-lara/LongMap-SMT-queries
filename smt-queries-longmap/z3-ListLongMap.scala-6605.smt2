; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83516 () Bool)

(assert start!83516)

(declare-fun b_free!19503 () Bool)

(declare-fun b_next!19503 () Bool)

(assert (=> start!83516 (= b_free!19503 (not b_next!19503))))

(declare-fun tp!67796 () Bool)

(declare-fun b_and!31105 () Bool)

(assert (=> start!83516 (= tp!67796 b_and!31105)))

(declare-fun b!975706 () Bool)

(declare-fun res!653169 () Bool)

(declare-fun e!549885 () Bool)

(assert (=> b!975706 (=> (not res!653169) (not e!549885))))

(declare-datatypes ((array!60845 0))(
  ( (array!60846 (arr!29286 (Array (_ BitVec 32) (_ BitVec 64))) (size!29765 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60845)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975706 (= res!653169 (validKeyInArray!0 (select (arr!29286 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35620 () Bool)

(declare-fun mapRes!35620 () Bool)

(declare-fun tp!67797 () Bool)

(declare-fun e!549886 () Bool)

(assert (=> mapNonEmpty!35620 (= mapRes!35620 (and tp!67797 e!549886))))

(declare-datatypes ((V!34859 0))(
  ( (V!34860 (val!11254 Int)) )
))
(declare-datatypes ((ValueCell!10722 0))(
  ( (ValueCellFull!10722 (v!13813 V!34859)) (EmptyCell!10722) )
))
(declare-datatypes ((array!60847 0))(
  ( (array!60848 (arr!29287 (Array (_ BitVec 32) ValueCell!10722)) (size!29766 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60847)

(declare-fun mapValue!35620 () ValueCell!10722)

(declare-fun mapRest!35620 () (Array (_ BitVec 32) ValueCell!10722))

(declare-fun mapKey!35620 () (_ BitVec 32))

(assert (=> mapNonEmpty!35620 (= (arr!29287 _values!1425) (store mapRest!35620 mapKey!35620 mapValue!35620))))

(declare-fun b!975707 () Bool)

(declare-fun e!549887 () Bool)

(declare-fun e!549889 () Bool)

(assert (=> b!975707 (= e!549887 (and e!549889 mapRes!35620))))

(declare-fun condMapEmpty!35620 () Bool)

(declare-fun mapDefault!35620 () ValueCell!10722)

(assert (=> b!975707 (= condMapEmpty!35620 (= (arr!29287 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10722)) mapDefault!35620)))))

(declare-fun mapIsEmpty!35620 () Bool)

(assert (=> mapIsEmpty!35620 mapRes!35620))

(declare-fun res!653174 () Bool)

(assert (=> start!83516 (=> (not res!653174) (not e!549885))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83516 (= res!653174 (validMask!0 mask!2147))))

(assert (=> start!83516 e!549885))

(assert (=> start!83516 true))

(declare-fun array_inv!22649 (array!60847) Bool)

(assert (=> start!83516 (and (array_inv!22649 _values!1425) e!549887)))

(declare-fun tp_is_empty!22407 () Bool)

(assert (=> start!83516 tp_is_empty!22407))

(assert (=> start!83516 tp!67796))

(declare-fun array_inv!22650 (array!60845) Bool)

(assert (=> start!83516 (array_inv!22650 _keys!1717)))

(declare-fun b!975708 () Bool)

(declare-fun res!653172 () Bool)

(assert (=> b!975708 (=> (not res!653172) (not e!549885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60845 (_ BitVec 32)) Bool)

(assert (=> b!975708 (= res!653172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975709 () Bool)

(assert (=> b!975709 (= e!549886 tp_is_empty!22407)))

(declare-fun b!975710 () Bool)

(declare-fun res!653175 () Bool)

(assert (=> b!975710 (=> (not res!653175) (not e!549885))))

(declare-fun zeroValue!1367 () V!34859)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34859)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14474 0))(
  ( (tuple2!14475 (_1!7248 (_ BitVec 64)) (_2!7248 V!34859)) )
))
(declare-datatypes ((List!20327 0))(
  ( (Nil!20324) (Cons!20323 (h!21485 tuple2!14474) (t!28804 List!20327)) )
))
(declare-datatypes ((ListLongMap!13171 0))(
  ( (ListLongMap!13172 (toList!6601 List!20327)) )
))
(declare-fun contains!5682 (ListLongMap!13171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3834 (array!60845 array!60847 (_ BitVec 32) (_ BitVec 32) V!34859 V!34859 (_ BitVec 32) Int) ListLongMap!13171)

(assert (=> b!975710 (= res!653175 (contains!5682 (getCurrentListMap!3834 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29286 _keys!1717) i!822)))))

(declare-fun b!975711 () Bool)

(assert (=> b!975711 (= e!549885 false)))

(declare-fun lt!432890 () ListLongMap!13171)

(assert (=> b!975711 (= lt!432890 (getCurrentListMap!3834 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975712 () Bool)

(declare-fun res!653173 () Bool)

(assert (=> b!975712 (=> (not res!653173) (not e!549885))))

(declare-datatypes ((List!20328 0))(
  ( (Nil!20325) (Cons!20324 (h!21486 (_ BitVec 64)) (t!28805 List!20328)) )
))
(declare-fun arrayNoDuplicates!0 (array!60845 (_ BitVec 32) List!20328) Bool)

(assert (=> b!975712 (= res!653173 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20325))))

(declare-fun b!975713 () Bool)

(assert (=> b!975713 (= e!549889 tp_is_empty!22407)))

(declare-fun b!975714 () Bool)

(declare-fun res!653170 () Bool)

(assert (=> b!975714 (=> (not res!653170) (not e!549885))))

(assert (=> b!975714 (= res!653170 (and (= (size!29766 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29765 _keys!1717) (size!29766 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975715 () Bool)

(declare-fun res!653171 () Bool)

(assert (=> b!975715 (=> (not res!653171) (not e!549885))))

(assert (=> b!975715 (= res!653171 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29765 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29765 _keys!1717))))))

(assert (= (and start!83516 res!653174) b!975714))

(assert (= (and b!975714 res!653170) b!975708))

(assert (= (and b!975708 res!653172) b!975712))

(assert (= (and b!975712 res!653173) b!975715))

(assert (= (and b!975715 res!653171) b!975706))

(assert (= (and b!975706 res!653169) b!975710))

(assert (= (and b!975710 res!653175) b!975711))

(assert (= (and b!975707 condMapEmpty!35620) mapIsEmpty!35620))

(assert (= (and b!975707 (not condMapEmpty!35620)) mapNonEmpty!35620))

(get-info :version)

(assert (= (and mapNonEmpty!35620 ((_ is ValueCellFull!10722) mapValue!35620)) b!975709))

(assert (= (and b!975707 ((_ is ValueCellFull!10722) mapDefault!35620)) b!975713))

(assert (= start!83516 b!975707))

(declare-fun m!902885 () Bool)

(assert (=> b!975711 m!902885))

(declare-fun m!902887 () Bool)

(assert (=> b!975708 m!902887))

(declare-fun m!902889 () Bool)

(assert (=> b!975712 m!902889))

(declare-fun m!902891 () Bool)

(assert (=> start!83516 m!902891))

(declare-fun m!902893 () Bool)

(assert (=> start!83516 m!902893))

(declare-fun m!902895 () Bool)

(assert (=> start!83516 m!902895))

(declare-fun m!902897 () Bool)

(assert (=> b!975706 m!902897))

(assert (=> b!975706 m!902897))

(declare-fun m!902899 () Bool)

(assert (=> b!975706 m!902899))

(declare-fun m!902901 () Bool)

(assert (=> b!975710 m!902901))

(assert (=> b!975710 m!902897))

(assert (=> b!975710 m!902901))

(assert (=> b!975710 m!902897))

(declare-fun m!902903 () Bool)

(assert (=> b!975710 m!902903))

(declare-fun m!902905 () Bool)

(assert (=> mapNonEmpty!35620 m!902905))

(check-sat (not mapNonEmpty!35620) tp_is_empty!22407 (not b!975711) b_and!31105 (not b_next!19503) (not b!975710) (not start!83516) (not b!975712) (not b!975706) (not b!975708))
(check-sat b_and!31105 (not b_next!19503))
