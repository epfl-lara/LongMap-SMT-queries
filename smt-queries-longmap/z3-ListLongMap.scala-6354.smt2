; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81862 () Bool)

(assert start!81862)

(declare-fun b_free!18357 () Bool)

(declare-fun b_next!18357 () Bool)

(assert (=> start!81862 (= b_free!18357 (not b_next!18357))))

(declare-fun tp!63770 () Bool)

(declare-fun b_and!29843 () Bool)

(assert (=> start!81862 (= tp!63770 b_and!29843)))

(declare-fun b!954697 () Bool)

(declare-fun e!537868 () Bool)

(declare-fun tp_is_empty!20901 () Bool)

(assert (=> b!954697 (= e!537868 tp_is_empty!20901)))

(declare-fun b!954698 () Bool)

(declare-fun e!537867 () Bool)

(assert (=> b!954698 (= e!537867 tp_is_empty!20901)))

(declare-fun b!954700 () Bool)

(declare-fun e!537865 () Bool)

(assert (=> b!954700 (= e!537865 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32851 0))(
  ( (V!32852 (val!10501 Int)) )
))
(declare-fun zeroValue!1139 () V!32851)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57913 0))(
  ( (array!57914 (arr!27836 (Array (_ BitVec 32) (_ BitVec 64))) (size!28315 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57913)

(declare-datatypes ((ValueCell!9969 0))(
  ( (ValueCellFull!9969 (v!13056 V!32851)) (EmptyCell!9969) )
))
(declare-datatypes ((array!57915 0))(
  ( (array!57916 (arr!27837 (Array (_ BitVec 32) ValueCell!9969)) (size!28316 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57915)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32851)

(declare-fun defaultEntry!1205 () Int)

(declare-fun lt!429929 () Bool)

(declare-datatypes ((tuple2!13628 0))(
  ( (tuple2!13629 (_1!6825 (_ BitVec 64)) (_2!6825 V!32851)) )
))
(declare-datatypes ((List!19405 0))(
  ( (Nil!19402) (Cons!19401 (h!20563 tuple2!13628) (t!27766 List!19405)) )
))
(declare-datatypes ((ListLongMap!12325 0))(
  ( (ListLongMap!12326 (toList!6178 List!19405)) )
))
(declare-fun contains!5276 (ListLongMap!12325 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3411 (array!57913 array!57915 (_ BitVec 32) (_ BitVec 32) V!32851 V!32851 (_ BitVec 32) Int) ListLongMap!12325)

(assert (=> b!954700 (= lt!429929 (contains!5276 (getCurrentListMap!3411 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27836 _keys!1441) i!735)))))

(declare-fun b!954701 () Bool)

(declare-fun res!639308 () Bool)

(assert (=> b!954701 (=> (not res!639308) (not e!537865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954701 (= res!639308 (validKeyInArray!0 (select (arr!27836 _keys!1441) i!735)))))

(declare-fun b!954702 () Bool)

(declare-fun res!639312 () Bool)

(assert (=> b!954702 (=> (not res!639312) (not e!537865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57913 (_ BitVec 32)) Bool)

(assert (=> b!954702 (= res!639312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33313 () Bool)

(declare-fun mapRes!33313 () Bool)

(declare-fun tp!63771 () Bool)

(assert (=> mapNonEmpty!33313 (= mapRes!33313 (and tp!63771 e!537867))))

(declare-fun mapRest!33313 () (Array (_ BitVec 32) ValueCell!9969))

(declare-fun mapValue!33313 () ValueCell!9969)

(declare-fun mapKey!33313 () (_ BitVec 32))

(assert (=> mapNonEmpty!33313 (= (arr!27837 _values!1197) (store mapRest!33313 mapKey!33313 mapValue!33313))))

(declare-fun res!639311 () Bool)

(assert (=> start!81862 (=> (not res!639311) (not e!537865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81862 (= res!639311 (validMask!0 mask!1823))))

(assert (=> start!81862 e!537865))

(assert (=> start!81862 true))

(assert (=> start!81862 tp_is_empty!20901))

(declare-fun array_inv!21607 (array!57913) Bool)

(assert (=> start!81862 (array_inv!21607 _keys!1441)))

(declare-fun e!537866 () Bool)

(declare-fun array_inv!21608 (array!57915) Bool)

(assert (=> start!81862 (and (array_inv!21608 _values!1197) e!537866)))

(assert (=> start!81862 tp!63770))

(declare-fun b!954699 () Bool)

(declare-fun res!639309 () Bool)

(assert (=> b!954699 (=> (not res!639309) (not e!537865))))

(declare-datatypes ((List!19406 0))(
  ( (Nil!19403) (Cons!19402 (h!20564 (_ BitVec 64)) (t!27767 List!19406)) )
))
(declare-fun arrayNoDuplicates!0 (array!57913 (_ BitVec 32) List!19406) Bool)

(assert (=> b!954699 (= res!639309 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19403))))

(declare-fun mapIsEmpty!33313 () Bool)

(assert (=> mapIsEmpty!33313 mapRes!33313))

(declare-fun b!954703 () Bool)

(assert (=> b!954703 (= e!537866 (and e!537868 mapRes!33313))))

(declare-fun condMapEmpty!33313 () Bool)

(declare-fun mapDefault!33313 () ValueCell!9969)

(assert (=> b!954703 (= condMapEmpty!33313 (= (arr!27837 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9969)) mapDefault!33313)))))

(declare-fun b!954704 () Bool)

(declare-fun res!639310 () Bool)

(assert (=> b!954704 (=> (not res!639310) (not e!537865))))

(assert (=> b!954704 (= res!639310 (and (= (size!28316 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28315 _keys!1441) (size!28316 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954705 () Bool)

(declare-fun res!639307 () Bool)

(assert (=> b!954705 (=> (not res!639307) (not e!537865))))

(assert (=> b!954705 (= res!639307 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28315 _keys!1441))))))

(assert (= (and start!81862 res!639311) b!954704))

(assert (= (and b!954704 res!639310) b!954702))

(assert (= (and b!954702 res!639312) b!954699))

(assert (= (and b!954699 res!639309) b!954705))

(assert (= (and b!954705 res!639307) b!954701))

(assert (= (and b!954701 res!639308) b!954700))

(assert (= (and b!954703 condMapEmpty!33313) mapIsEmpty!33313))

(assert (= (and b!954703 (not condMapEmpty!33313)) mapNonEmpty!33313))

(get-info :version)

(assert (= (and mapNonEmpty!33313 ((_ is ValueCellFull!9969) mapValue!33313)) b!954698))

(assert (= (and b!954703 ((_ is ValueCellFull!9969) mapDefault!33313)) b!954697))

(assert (= start!81862 b!954703))

(declare-fun m!886363 () Bool)

(assert (=> b!954702 m!886363))

(declare-fun m!886365 () Bool)

(assert (=> b!954700 m!886365))

(declare-fun m!886367 () Bool)

(assert (=> b!954700 m!886367))

(assert (=> b!954700 m!886365))

(assert (=> b!954700 m!886367))

(declare-fun m!886369 () Bool)

(assert (=> b!954700 m!886369))

(declare-fun m!886371 () Bool)

(assert (=> b!954699 m!886371))

(declare-fun m!886373 () Bool)

(assert (=> start!81862 m!886373))

(declare-fun m!886375 () Bool)

(assert (=> start!81862 m!886375))

(declare-fun m!886377 () Bool)

(assert (=> start!81862 m!886377))

(declare-fun m!886379 () Bool)

(assert (=> mapNonEmpty!33313 m!886379))

(assert (=> b!954701 m!886367))

(assert (=> b!954701 m!886367))

(declare-fun m!886381 () Bool)

(assert (=> b!954701 m!886381))

(check-sat (not b!954699) (not b!954701) b_and!29843 (not b_next!18357) (not start!81862) (not mapNonEmpty!33313) (not b!954700) tp_is_empty!20901 (not b!954702))
(check-sat b_and!29843 (not b_next!18357))
