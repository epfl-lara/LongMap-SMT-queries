; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82502 () Bool)

(assert start!82502)

(declare-fun b_free!18601 () Bool)

(declare-fun b_next!18601 () Bool)

(assert (=> start!82502 (= b_free!18601 (not b_next!18601))))

(declare-fun tp!64773 () Bool)

(declare-fun b_and!30099 () Bool)

(assert (=> start!82502 (= tp!64773 b_and!30099)))

(declare-fun b!960839 () Bool)

(declare-fun e!541704 () Bool)

(declare-fun tp_is_empty!21313 () Bool)

(assert (=> b!960839 (= e!541704 tp_is_empty!21313)))

(declare-fun res!642912 () Bool)

(declare-fun e!541707 () Bool)

(assert (=> start!82502 (=> (not res!642912) (not e!541707))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82502 (= res!642912 (validMask!0 mask!2088))))

(assert (=> start!82502 e!541707))

(assert (=> start!82502 true))

(assert (=> start!82502 tp_is_empty!21313))

(declare-datatypes ((array!58748 0))(
  ( (array!58749 (arr!28243 (Array (_ BitVec 32) (_ BitVec 64))) (size!28723 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58748)

(declare-fun array_inv!21973 (array!58748) Bool)

(assert (=> start!82502 (array_inv!21973 _keys!1668)))

(declare-datatypes ((V!33401 0))(
  ( (V!33402 (val!10707 Int)) )
))
(declare-datatypes ((ValueCell!10175 0))(
  ( (ValueCellFull!10175 (v!13261 V!33401)) (EmptyCell!10175) )
))
(declare-datatypes ((array!58750 0))(
  ( (array!58751 (arr!28244 (Array (_ BitVec 32) ValueCell!10175)) (size!28724 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58750)

(declare-fun e!541705 () Bool)

(declare-fun array_inv!21974 (array!58750) Bool)

(assert (=> start!82502 (and (array_inv!21974 _values!1386) e!541705)))

(assert (=> start!82502 tp!64773))

(declare-fun b!960840 () Bool)

(assert (=> b!960840 (= e!541707 false)))

(declare-fun lt!430954 () Bool)

(declare-fun minValue!1328 () V!33401)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33401)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13792 0))(
  ( (tuple2!13793 (_1!6907 (_ BitVec 64)) (_2!6907 V!33401)) )
))
(declare-datatypes ((List!19623 0))(
  ( (Nil!19620) (Cons!19619 (h!20787 tuple2!13792) (t!27978 List!19623)) )
))
(declare-datatypes ((ListLongMap!12491 0))(
  ( (ListLongMap!12492 (toList!6261 List!19623)) )
))
(declare-fun contains!5373 (ListLongMap!12491 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3494 (array!58748 array!58750 (_ BitVec 32) (_ BitVec 32) V!33401 V!33401 (_ BitVec 32) Int) ListLongMap!12491)

(assert (=> b!960840 (= lt!430954 (contains!5373 (getCurrentListMap!3494 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28243 _keys!1668) i!793)))))

(declare-fun b!960841 () Bool)

(declare-fun res!642909 () Bool)

(assert (=> b!960841 (=> (not res!642909) (not e!541707))))

(assert (=> b!960841 (= res!642909 (and (= (size!28724 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28723 _keys!1668) (size!28724 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33949 () Bool)

(declare-fun mapRes!33949 () Bool)

(declare-fun tp!64774 () Bool)

(assert (=> mapNonEmpty!33949 (= mapRes!33949 (and tp!64774 e!541704))))

(declare-fun mapKey!33949 () (_ BitVec 32))

(declare-fun mapRest!33949 () (Array (_ BitVec 32) ValueCell!10175))

(declare-fun mapValue!33949 () ValueCell!10175)

(assert (=> mapNonEmpty!33949 (= (arr!28244 _values!1386) (store mapRest!33949 mapKey!33949 mapValue!33949))))

(declare-fun b!960842 () Bool)

(declare-fun res!642908 () Bool)

(assert (=> b!960842 (=> (not res!642908) (not e!541707))))

(assert (=> b!960842 (= res!642908 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28723 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28723 _keys!1668))))))

(declare-fun mapIsEmpty!33949 () Bool)

(assert (=> mapIsEmpty!33949 mapRes!33949))

(declare-fun b!960843 () Bool)

(declare-fun res!642910 () Bool)

(assert (=> b!960843 (=> (not res!642910) (not e!541707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58748 (_ BitVec 32)) Bool)

(assert (=> b!960843 (= res!642910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960844 () Bool)

(declare-fun e!541703 () Bool)

(assert (=> b!960844 (= e!541703 tp_is_empty!21313)))

(declare-fun b!960845 () Bool)

(declare-fun res!642911 () Bool)

(assert (=> b!960845 (=> (not res!642911) (not e!541707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960845 (= res!642911 (validKeyInArray!0 (select (arr!28243 _keys!1668) i!793)))))

(declare-fun b!960846 () Bool)

(declare-fun res!642913 () Bool)

(assert (=> b!960846 (=> (not res!642913) (not e!541707))))

(declare-datatypes ((List!19624 0))(
  ( (Nil!19621) (Cons!19620 (h!20788 (_ BitVec 64)) (t!27979 List!19624)) )
))
(declare-fun arrayNoDuplicates!0 (array!58748 (_ BitVec 32) List!19624) Bool)

(assert (=> b!960846 (= res!642913 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19621))))

(declare-fun b!960847 () Bool)

(assert (=> b!960847 (= e!541705 (and e!541703 mapRes!33949))))

(declare-fun condMapEmpty!33949 () Bool)

(declare-fun mapDefault!33949 () ValueCell!10175)

(assert (=> b!960847 (= condMapEmpty!33949 (= (arr!28244 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10175)) mapDefault!33949)))))

(assert (= (and start!82502 res!642912) b!960841))

(assert (= (and b!960841 res!642909) b!960843))

(assert (= (and b!960843 res!642910) b!960846))

(assert (= (and b!960846 res!642913) b!960842))

(assert (= (and b!960842 res!642908) b!960845))

(assert (= (and b!960845 res!642911) b!960840))

(assert (= (and b!960847 condMapEmpty!33949) mapIsEmpty!33949))

(assert (= (and b!960847 (not condMapEmpty!33949)) mapNonEmpty!33949))

(get-info :version)

(assert (= (and mapNonEmpty!33949 ((_ is ValueCellFull!10175) mapValue!33949)) b!960839))

(assert (= (and b!960847 ((_ is ValueCellFull!10175) mapDefault!33949)) b!960844))

(assert (= start!82502 b!960847))

(declare-fun m!891603 () Bool)

(assert (=> b!960845 m!891603))

(assert (=> b!960845 m!891603))

(declare-fun m!891605 () Bool)

(assert (=> b!960845 m!891605))

(declare-fun m!891607 () Bool)

(assert (=> b!960843 m!891607))

(declare-fun m!891609 () Bool)

(assert (=> start!82502 m!891609))

(declare-fun m!891611 () Bool)

(assert (=> start!82502 m!891611))

(declare-fun m!891613 () Bool)

(assert (=> start!82502 m!891613))

(declare-fun m!891615 () Bool)

(assert (=> mapNonEmpty!33949 m!891615))

(declare-fun m!891617 () Bool)

(assert (=> b!960846 m!891617))

(declare-fun m!891619 () Bool)

(assert (=> b!960840 m!891619))

(assert (=> b!960840 m!891603))

(assert (=> b!960840 m!891619))

(assert (=> b!960840 m!891603))

(declare-fun m!891621 () Bool)

(assert (=> b!960840 m!891621))

(check-sat b_and!30099 (not b!960845) (not b!960846) (not b!960840) (not mapNonEmpty!33949) (not start!82502) (not b_next!18601) (not b!960843) tp_is_empty!21313)
(check-sat b_and!30099 (not b_next!18601))
