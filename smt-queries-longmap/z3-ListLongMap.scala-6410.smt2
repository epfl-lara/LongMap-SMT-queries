; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82258 () Bool)

(assert start!82258)

(declare-fun b_free!18531 () Bool)

(declare-fun b_next!18531 () Bool)

(assert (=> start!82258 (= b_free!18531 (not b_next!18531))))

(declare-fun tp!64553 () Bool)

(declare-fun b_and!30019 () Bool)

(assert (=> start!82258 (= tp!64553 b_and!30019)))

(declare-fun b!958852 () Bool)

(declare-fun e!540551 () Bool)

(declare-fun tp_is_empty!21237 () Bool)

(assert (=> b!958852 (= e!540551 tp_is_empty!21237)))

(declare-fun b!958853 () Bool)

(declare-fun res!641824 () Bool)

(declare-fun e!540552 () Bool)

(assert (=> b!958853 (=> (not res!641824) (not e!540552))))

(declare-datatypes ((array!58573 0))(
  ( (array!58574 (arr!28160 (Array (_ BitVec 32) (_ BitVec 64))) (size!28639 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58573)

(declare-datatypes ((List!19576 0))(
  ( (Nil!19573) (Cons!19572 (h!20734 (_ BitVec 64)) (t!27939 List!19576)) )
))
(declare-fun arrayNoDuplicates!0 (array!58573 (_ BitVec 32) List!19576) Bool)

(assert (=> b!958853 (= res!641824 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19573))))

(declare-fun b!958854 () Bool)

(declare-fun e!540555 () Bool)

(declare-fun e!540554 () Bool)

(declare-fun mapRes!33835 () Bool)

(assert (=> b!958854 (= e!540555 (and e!540554 mapRes!33835))))

(declare-fun condMapEmpty!33835 () Bool)

(declare-datatypes ((V!33299 0))(
  ( (V!33300 (val!10669 Int)) )
))
(declare-datatypes ((ValueCell!10137 0))(
  ( (ValueCellFull!10137 (v!13226 V!33299)) (EmptyCell!10137) )
))
(declare-datatypes ((array!58575 0))(
  ( (array!58576 (arr!28161 (Array (_ BitVec 32) ValueCell!10137)) (size!28640 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58575)

(declare-fun mapDefault!33835 () ValueCell!10137)

(assert (=> b!958854 (= condMapEmpty!33835 (= (arr!28161 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10137)) mapDefault!33835)))))

(declare-fun b!958855 () Bool)

(assert (=> b!958855 (= e!540554 tp_is_empty!21237)))

(declare-fun mapIsEmpty!33835 () Bool)

(assert (=> mapIsEmpty!33835 mapRes!33835))

(declare-fun mapNonEmpty!33835 () Bool)

(declare-fun tp!64554 () Bool)

(assert (=> mapNonEmpty!33835 (= mapRes!33835 (and tp!64554 e!540551))))

(declare-fun mapKey!33835 () (_ BitVec 32))

(declare-fun mapRest!33835 () (Array (_ BitVec 32) ValueCell!10137))

(declare-fun mapValue!33835 () ValueCell!10137)

(assert (=> mapNonEmpty!33835 (= (arr!28161 _values!1386) (store mapRest!33835 mapKey!33835 mapValue!33835))))

(declare-fun b!958856 () Bool)

(assert (=> b!958856 (= e!540552 (not true))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33299)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33299)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13756 0))(
  ( (tuple2!13757 (_1!6889 (_ BitVec 64)) (_2!6889 V!33299)) )
))
(declare-datatypes ((List!19577 0))(
  ( (Nil!19574) (Cons!19573 (h!20735 tuple2!13756) (t!27940 List!19577)) )
))
(declare-datatypes ((ListLongMap!12453 0))(
  ( (ListLongMap!12454 (toList!6242 List!19577)) )
))
(declare-fun contains!5343 (ListLongMap!12453 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3475 (array!58573 array!58575 (_ BitVec 32) (_ BitVec 32) V!33299 V!33299 (_ BitVec 32) Int) ListLongMap!12453)

(assert (=> b!958856 (contains!5343 (getCurrentListMap!3475 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28160 _keys!1668) i!793))))

(declare-datatypes ((Unit!32159 0))(
  ( (Unit!32160) )
))
(declare-fun lt!430488 () Unit!32159)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!1 (array!58573 array!58575 (_ BitVec 32) (_ BitVec 32) V!33299 V!33299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32159)

(assert (=> b!958856 (= lt!430488 (lemmaInListMapFromThenInFromSmaller!1 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!958857 () Bool)

(declare-fun res!641828 () Bool)

(assert (=> b!958857 (=> (not res!641828) (not e!540552))))

(assert (=> b!958857 (= res!641828 (contains!5343 (getCurrentListMap!3475 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28160 _keys!1668) i!793)))))

(declare-fun b!958858 () Bool)

(declare-fun res!641826 () Bool)

(assert (=> b!958858 (=> (not res!641826) (not e!540552))))

(assert (=> b!958858 (= res!641826 (and (= (size!28640 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28639 _keys!1668) (size!28640 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958859 () Bool)

(declare-fun res!641823 () Bool)

(assert (=> b!958859 (=> (not res!641823) (not e!540552))))

(assert (=> b!958859 (= res!641823 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28639 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28639 _keys!1668))))))

(declare-fun res!641822 () Bool)

(assert (=> start!82258 (=> (not res!641822) (not e!540552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82258 (= res!641822 (validMask!0 mask!2088))))

(assert (=> start!82258 e!540552))

(assert (=> start!82258 true))

(assert (=> start!82258 tp_is_empty!21237))

(declare-fun array_inv!21833 (array!58573) Bool)

(assert (=> start!82258 (array_inv!21833 _keys!1668)))

(declare-fun array_inv!21834 (array!58575) Bool)

(assert (=> start!82258 (and (array_inv!21834 _values!1386) e!540555)))

(assert (=> start!82258 tp!64553))

(declare-fun b!958860 () Bool)

(declare-fun res!641825 () Bool)

(assert (=> b!958860 (=> (not res!641825) (not e!540552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958860 (= res!641825 (validKeyInArray!0 (select (arr!28160 _keys!1668) i!793)))))

(declare-fun b!958861 () Bool)

(declare-fun res!641827 () Bool)

(assert (=> b!958861 (=> (not res!641827) (not e!540552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58573 (_ BitVec 32)) Bool)

(assert (=> b!958861 (= res!641827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82258 res!641822) b!958858))

(assert (= (and b!958858 res!641826) b!958861))

(assert (= (and b!958861 res!641827) b!958853))

(assert (= (and b!958853 res!641824) b!958859))

(assert (= (and b!958859 res!641823) b!958860))

(assert (= (and b!958860 res!641825) b!958857))

(assert (= (and b!958857 res!641828) b!958856))

(assert (= (and b!958854 condMapEmpty!33835) mapIsEmpty!33835))

(assert (= (and b!958854 (not condMapEmpty!33835)) mapNonEmpty!33835))

(get-info :version)

(assert (= (and mapNonEmpty!33835 ((_ is ValueCellFull!10137) mapValue!33835)) b!958852))

(assert (= (and b!958854 ((_ is ValueCellFull!10137) mapDefault!33835)) b!958855))

(assert (= start!82258 b!958854))

(declare-fun m!889423 () Bool)

(assert (=> b!958856 m!889423))

(declare-fun m!889425 () Bool)

(assert (=> b!958856 m!889425))

(assert (=> b!958856 m!889423))

(assert (=> b!958856 m!889425))

(declare-fun m!889427 () Bool)

(assert (=> b!958856 m!889427))

(declare-fun m!889429 () Bool)

(assert (=> b!958856 m!889429))

(declare-fun m!889431 () Bool)

(assert (=> b!958853 m!889431))

(declare-fun m!889433 () Bool)

(assert (=> mapNonEmpty!33835 m!889433))

(assert (=> b!958860 m!889425))

(assert (=> b!958860 m!889425))

(declare-fun m!889435 () Bool)

(assert (=> b!958860 m!889435))

(declare-fun m!889437 () Bool)

(assert (=> b!958857 m!889437))

(assert (=> b!958857 m!889425))

(assert (=> b!958857 m!889437))

(assert (=> b!958857 m!889425))

(declare-fun m!889439 () Bool)

(assert (=> b!958857 m!889439))

(declare-fun m!889441 () Bool)

(assert (=> start!82258 m!889441))

(declare-fun m!889443 () Bool)

(assert (=> start!82258 m!889443))

(declare-fun m!889445 () Bool)

(assert (=> start!82258 m!889445))

(declare-fun m!889447 () Bool)

(assert (=> b!958861 m!889447))

(check-sat (not b!958861) (not start!82258) (not b!958853) (not b!958857) (not b!958856) b_and!30019 (not b!958860) (not b_next!18531) (not mapNonEmpty!33835) tp_is_empty!21237)
(check-sat b_and!30019 (not b_next!18531))
