; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82238 () Bool)

(assert start!82238)

(declare-fun b_free!18529 () Bool)

(declare-fun b_next!18529 () Bool)

(assert (=> start!82238 (= b_free!18529 (not b_next!18529))))

(declare-fun tp!64549 () Bool)

(declare-fun b_and!29991 () Bool)

(assert (=> start!82238 (= tp!64549 b_and!29991)))

(declare-fun res!641694 () Bool)

(declare-fun e!540391 () Bool)

(assert (=> start!82238 (=> (not res!641694) (not e!540391))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82238 (= res!641694 (validMask!0 mask!2088))))

(assert (=> start!82238 e!540391))

(assert (=> start!82238 true))

(declare-fun tp_is_empty!21235 () Bool)

(assert (=> start!82238 tp_is_empty!21235))

(declare-datatypes ((array!58500 0))(
  ( (array!58501 (arr!28124 (Array (_ BitVec 32) (_ BitVec 64))) (size!28605 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58500)

(declare-fun array_inv!21865 (array!58500) Bool)

(assert (=> start!82238 (array_inv!21865 _keys!1668)))

(declare-datatypes ((V!33297 0))(
  ( (V!33298 (val!10668 Int)) )
))
(declare-datatypes ((ValueCell!10136 0))(
  ( (ValueCellFull!10136 (v!13224 V!33297)) (EmptyCell!10136) )
))
(declare-datatypes ((array!58502 0))(
  ( (array!58503 (arr!28125 (Array (_ BitVec 32) ValueCell!10136)) (size!28606 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58502)

(declare-fun e!540390 () Bool)

(declare-fun array_inv!21866 (array!58502) Bool)

(assert (=> start!82238 (and (array_inv!21866 _values!1386) e!540390)))

(assert (=> start!82238 tp!64549))

(declare-fun b!958583 () Bool)

(declare-fun res!641692 () Bool)

(assert (=> b!958583 (=> (not res!641692) (not e!540391))))

(declare-fun minValue!1328 () V!33297)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33297)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13802 0))(
  ( (tuple2!13803 (_1!6912 (_ BitVec 64)) (_2!6912 V!33297)) )
))
(declare-datatypes ((List!19588 0))(
  ( (Nil!19585) (Cons!19584 (h!20746 tuple2!13802) (t!27942 List!19588)) )
))
(declare-datatypes ((ListLongMap!12489 0))(
  ( (ListLongMap!12490 (toList!6260 List!19588)) )
))
(declare-fun contains!5306 (ListLongMap!12489 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3422 (array!58500 array!58502 (_ BitVec 32) (_ BitVec 32) V!33297 V!33297 (_ BitVec 32) Int) ListLongMap!12489)

(assert (=> b!958583 (= res!641692 (contains!5306 (getCurrentListMap!3422 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28124 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33832 () Bool)

(declare-fun mapRes!33832 () Bool)

(assert (=> mapIsEmpty!33832 mapRes!33832))

(declare-fun b!958584 () Bool)

(assert (=> b!958584 (= e!540391 (not true))))

(assert (=> b!958584 (contains!5306 (getCurrentListMap!3422 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28124 _keys!1668) i!793))))

(declare-datatypes ((Unit!32020 0))(
  ( (Unit!32021) )
))
(declare-fun lt!430249 () Unit!32020)

(declare-fun lemmaInListMapFromThenInFromSmaller!1 (array!58500 array!58502 (_ BitVec 32) (_ BitVec 32) V!33297 V!33297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32020)

(assert (=> b!958584 (= lt!430249 (lemmaInListMapFromThenInFromSmaller!1 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!958585 () Bool)

(declare-fun res!641695 () Bool)

(assert (=> b!958585 (=> (not res!641695) (not e!540391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958585 (= res!641695 (validKeyInArray!0 (select (arr!28124 _keys!1668) i!793)))))

(declare-fun b!958586 () Bool)

(declare-fun res!641693 () Bool)

(assert (=> b!958586 (=> (not res!641693) (not e!540391))))

(assert (=> b!958586 (= res!641693 (and (= (size!28606 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28605 _keys!1668) (size!28606 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958587 () Bool)

(declare-fun res!641697 () Bool)

(assert (=> b!958587 (=> (not res!641697) (not e!540391))))

(declare-datatypes ((List!19589 0))(
  ( (Nil!19586) (Cons!19585 (h!20747 (_ BitVec 64)) (t!27943 List!19589)) )
))
(declare-fun arrayNoDuplicates!0 (array!58500 (_ BitVec 32) List!19589) Bool)

(assert (=> b!958587 (= res!641697 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19586))))

(declare-fun mapNonEmpty!33832 () Bool)

(declare-fun tp!64548 () Bool)

(declare-fun e!540388 () Bool)

(assert (=> mapNonEmpty!33832 (= mapRes!33832 (and tp!64548 e!540388))))

(declare-fun mapRest!33832 () (Array (_ BitVec 32) ValueCell!10136))

(declare-fun mapValue!33832 () ValueCell!10136)

(declare-fun mapKey!33832 () (_ BitVec 32))

(assert (=> mapNonEmpty!33832 (= (arr!28125 _values!1386) (store mapRest!33832 mapKey!33832 mapValue!33832))))

(declare-fun b!958588 () Bool)

(declare-fun res!641691 () Bool)

(assert (=> b!958588 (=> (not res!641691) (not e!540391))))

(assert (=> b!958588 (= res!641691 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28605 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28605 _keys!1668))))))

(declare-fun b!958589 () Bool)

(assert (=> b!958589 (= e!540388 tp_is_empty!21235)))

(declare-fun b!958590 () Bool)

(declare-fun e!540389 () Bool)

(assert (=> b!958590 (= e!540389 tp_is_empty!21235)))

(declare-fun b!958591 () Bool)

(declare-fun res!641696 () Bool)

(assert (=> b!958591 (=> (not res!641696) (not e!540391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58500 (_ BitVec 32)) Bool)

(assert (=> b!958591 (= res!641696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958592 () Bool)

(assert (=> b!958592 (= e!540390 (and e!540389 mapRes!33832))))

(declare-fun condMapEmpty!33832 () Bool)

(declare-fun mapDefault!33832 () ValueCell!10136)

(assert (=> b!958592 (= condMapEmpty!33832 (= (arr!28125 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10136)) mapDefault!33832)))))

(assert (= (and start!82238 res!641694) b!958586))

(assert (= (and b!958586 res!641693) b!958591))

(assert (= (and b!958591 res!641696) b!958587))

(assert (= (and b!958587 res!641697) b!958588))

(assert (= (and b!958588 res!641691) b!958585))

(assert (= (and b!958585 res!641695) b!958583))

(assert (= (and b!958583 res!641692) b!958584))

(assert (= (and b!958592 condMapEmpty!33832) mapIsEmpty!33832))

(assert (= (and b!958592 (not condMapEmpty!33832)) mapNonEmpty!33832))

(get-info :version)

(assert (= (and mapNonEmpty!33832 ((_ is ValueCellFull!10136) mapValue!33832)) b!958589))

(assert (= (and b!958592 ((_ is ValueCellFull!10136) mapDefault!33832)) b!958590))

(assert (= start!82238 b!958592))

(declare-fun m!888639 () Bool)

(assert (=> b!958587 m!888639))

(declare-fun m!888641 () Bool)

(assert (=> b!958591 m!888641))

(declare-fun m!888643 () Bool)

(assert (=> mapNonEmpty!33832 m!888643))

(declare-fun m!888645 () Bool)

(assert (=> b!958583 m!888645))

(declare-fun m!888647 () Bool)

(assert (=> b!958583 m!888647))

(assert (=> b!958583 m!888645))

(assert (=> b!958583 m!888647))

(declare-fun m!888649 () Bool)

(assert (=> b!958583 m!888649))

(declare-fun m!888651 () Bool)

(assert (=> b!958584 m!888651))

(assert (=> b!958584 m!888647))

(assert (=> b!958584 m!888651))

(assert (=> b!958584 m!888647))

(declare-fun m!888653 () Bool)

(assert (=> b!958584 m!888653))

(declare-fun m!888655 () Bool)

(assert (=> b!958584 m!888655))

(declare-fun m!888657 () Bool)

(assert (=> start!82238 m!888657))

(declare-fun m!888659 () Bool)

(assert (=> start!82238 m!888659))

(declare-fun m!888661 () Bool)

(assert (=> start!82238 m!888661))

(assert (=> b!958585 m!888647))

(assert (=> b!958585 m!888647))

(declare-fun m!888663 () Bool)

(assert (=> b!958585 m!888663))

(check-sat (not b!958585) (not b!958584) (not start!82238) (not b!958591) tp_is_empty!21235 (not b!958583) (not b_next!18529) (not b!958587) (not mapNonEmpty!33832) b_and!29991)
(check-sat b_and!29991 (not b_next!18529))
