; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82256 () Bool)

(assert start!82256)

(declare-fun b_free!18547 () Bool)

(declare-fun b_next!18547 () Bool)

(assert (=> start!82256 (= b_free!18547 (not b_next!18547))))

(declare-fun tp!64602 () Bool)

(declare-fun b_and!30009 () Bool)

(assert (=> start!82256 (= tp!64602 b_and!30009)))

(declare-fun b!958853 () Bool)

(declare-fun e!540526 () Bool)

(assert (=> b!958853 (= e!540526 (not true))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33321 0))(
  ( (V!33322 (val!10677 Int)) )
))
(declare-fun minValue!1328 () V!33321)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10145 0))(
  ( (ValueCellFull!10145 (v!13233 V!33321)) (EmptyCell!10145) )
))
(declare-datatypes ((array!58536 0))(
  ( (array!58537 (arr!28142 (Array (_ BitVec 32) ValueCell!10145)) (size!28623 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58536)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33321)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((array!58538 0))(
  ( (array!58539 (arr!28143 (Array (_ BitVec 32) (_ BitVec 64))) (size!28624 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58538)

(declare-datatypes ((tuple2!13816 0))(
  ( (tuple2!13817 (_1!6919 (_ BitVec 64)) (_2!6919 V!33321)) )
))
(declare-datatypes ((List!19599 0))(
  ( (Nil!19596) (Cons!19595 (h!20757 tuple2!13816) (t!27953 List!19599)) )
))
(declare-datatypes ((ListLongMap!12503 0))(
  ( (ListLongMap!12504 (toList!6267 List!19599)) )
))
(declare-fun contains!5313 (ListLongMap!12503 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3429 (array!58538 array!58536 (_ BitVec 32) (_ BitVec 32) V!33321 V!33321 (_ BitVec 32) Int) ListLongMap!12503)

(assert (=> b!958853 (contains!5313 (getCurrentListMap!3429 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28143 _keys!1668) i!793))))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((Unit!32032 0))(
  ( (Unit!32033) )
))
(declare-fun lt!430276 () Unit!32032)

(declare-fun lemmaInListMapFromThenInFromSmaller!7 (array!58538 array!58536 (_ BitVec 32) (_ BitVec 32) V!33321 V!33321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32032)

(assert (=> b!958853 (= lt!430276 (lemmaInListMapFromThenInFromSmaller!7 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!958854 () Bool)

(declare-fun res!641885 () Bool)

(assert (=> b!958854 (=> (not res!641885) (not e!540526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958854 (= res!641885 (validKeyInArray!0 (select (arr!28143 _keys!1668) i!793)))))

(declare-fun b!958855 () Bool)

(declare-fun res!641886 () Bool)

(assert (=> b!958855 (=> (not res!641886) (not e!540526))))

(assert (=> b!958855 (= res!641886 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28624 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28624 _keys!1668))))))

(declare-fun mapIsEmpty!33859 () Bool)

(declare-fun mapRes!33859 () Bool)

(assert (=> mapIsEmpty!33859 mapRes!33859))

(declare-fun res!641881 () Bool)

(assert (=> start!82256 (=> (not res!641881) (not e!540526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82256 (= res!641881 (validMask!0 mask!2088))))

(assert (=> start!82256 e!540526))

(assert (=> start!82256 true))

(declare-fun tp_is_empty!21253 () Bool)

(assert (=> start!82256 tp_is_empty!21253))

(declare-fun array_inv!21879 (array!58538) Bool)

(assert (=> start!82256 (array_inv!21879 _keys!1668)))

(declare-fun e!540525 () Bool)

(declare-fun array_inv!21880 (array!58536) Bool)

(assert (=> start!82256 (and (array_inv!21880 _values!1386) e!540525)))

(assert (=> start!82256 tp!64602))

(declare-fun b!958856 () Bool)

(declare-fun e!540524 () Bool)

(assert (=> b!958856 (= e!540525 (and e!540524 mapRes!33859))))

(declare-fun condMapEmpty!33859 () Bool)

(declare-fun mapDefault!33859 () ValueCell!10145)

(assert (=> b!958856 (= condMapEmpty!33859 (= (arr!28142 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10145)) mapDefault!33859)))))

(declare-fun b!958857 () Bool)

(assert (=> b!958857 (= e!540524 tp_is_empty!21253)))

(declare-fun b!958858 () Bool)

(declare-fun res!641880 () Bool)

(assert (=> b!958858 (=> (not res!641880) (not e!540526))))

(assert (=> b!958858 (= res!641880 (contains!5313 (getCurrentListMap!3429 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28143 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33859 () Bool)

(declare-fun tp!64603 () Bool)

(declare-fun e!540527 () Bool)

(assert (=> mapNonEmpty!33859 (= mapRes!33859 (and tp!64603 e!540527))))

(declare-fun mapRest!33859 () (Array (_ BitVec 32) ValueCell!10145))

(declare-fun mapValue!33859 () ValueCell!10145)

(declare-fun mapKey!33859 () (_ BitVec 32))

(assert (=> mapNonEmpty!33859 (= (arr!28142 _values!1386) (store mapRest!33859 mapKey!33859 mapValue!33859))))

(declare-fun b!958859 () Bool)

(declare-fun res!641884 () Bool)

(assert (=> b!958859 (=> (not res!641884) (not e!540526))))

(assert (=> b!958859 (= res!641884 (and (= (size!28623 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28624 _keys!1668) (size!28623 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958860 () Bool)

(assert (=> b!958860 (= e!540527 tp_is_empty!21253)))

(declare-fun b!958861 () Bool)

(declare-fun res!641882 () Bool)

(assert (=> b!958861 (=> (not res!641882) (not e!540526))))

(declare-datatypes ((List!19600 0))(
  ( (Nil!19597) (Cons!19596 (h!20758 (_ BitVec 64)) (t!27954 List!19600)) )
))
(declare-fun arrayNoDuplicates!0 (array!58538 (_ BitVec 32) List!19600) Bool)

(assert (=> b!958861 (= res!641882 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19597))))

(declare-fun b!958862 () Bool)

(declare-fun res!641883 () Bool)

(assert (=> b!958862 (=> (not res!641883) (not e!540526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58538 (_ BitVec 32)) Bool)

(assert (=> b!958862 (= res!641883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82256 res!641881) b!958859))

(assert (= (and b!958859 res!641884) b!958862))

(assert (= (and b!958862 res!641883) b!958861))

(assert (= (and b!958861 res!641882) b!958855))

(assert (= (and b!958855 res!641886) b!958854))

(assert (= (and b!958854 res!641885) b!958858))

(assert (= (and b!958858 res!641880) b!958853))

(assert (= (and b!958856 condMapEmpty!33859) mapIsEmpty!33859))

(assert (= (and b!958856 (not condMapEmpty!33859)) mapNonEmpty!33859))

(get-info :version)

(assert (= (and mapNonEmpty!33859 ((_ is ValueCellFull!10145) mapValue!33859)) b!958860))

(assert (= (and b!958856 ((_ is ValueCellFull!10145) mapDefault!33859)) b!958857))

(assert (= start!82256 b!958856))

(declare-fun m!888873 () Bool)

(assert (=> b!958853 m!888873))

(declare-fun m!888875 () Bool)

(assert (=> b!958853 m!888875))

(assert (=> b!958853 m!888873))

(assert (=> b!958853 m!888875))

(declare-fun m!888877 () Bool)

(assert (=> b!958853 m!888877))

(declare-fun m!888879 () Bool)

(assert (=> b!958853 m!888879))

(declare-fun m!888881 () Bool)

(assert (=> mapNonEmpty!33859 m!888881))

(declare-fun m!888883 () Bool)

(assert (=> start!82256 m!888883))

(declare-fun m!888885 () Bool)

(assert (=> start!82256 m!888885))

(declare-fun m!888887 () Bool)

(assert (=> start!82256 m!888887))

(declare-fun m!888889 () Bool)

(assert (=> b!958858 m!888889))

(assert (=> b!958858 m!888875))

(assert (=> b!958858 m!888889))

(assert (=> b!958858 m!888875))

(declare-fun m!888891 () Bool)

(assert (=> b!958858 m!888891))

(assert (=> b!958854 m!888875))

(assert (=> b!958854 m!888875))

(declare-fun m!888893 () Bool)

(assert (=> b!958854 m!888893))

(declare-fun m!888895 () Bool)

(assert (=> b!958861 m!888895))

(declare-fun m!888897 () Bool)

(assert (=> b!958862 m!888897))

(check-sat (not b!958853) (not b_next!18547) tp_is_empty!21253 (not b!958862) (not start!82256) (not mapNonEmpty!33859) (not b!958854) (not b!958861) (not b!958858) b_and!30009)
(check-sat b_and!30009 (not b_next!18547))
