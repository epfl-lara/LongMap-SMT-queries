; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83454 () Bool)

(assert start!83454)

(declare-fun b_free!19459 () Bool)

(declare-fun b_next!19459 () Bool)

(assert (=> start!83454 (= b_free!19459 (not b_next!19459))))

(declare-fun tp!67665 () Bool)

(declare-fun b_and!31035 () Bool)

(assert (=> start!83454 (= tp!67665 b_and!31035)))

(declare-fun b!974798 () Bool)

(declare-fun e!549402 () Bool)

(declare-fun tp_is_empty!22363 () Bool)

(assert (=> b!974798 (= e!549402 tp_is_empty!22363)))

(declare-fun res!652592 () Bool)

(declare-fun e!549400 () Bool)

(assert (=> start!83454 (=> (not res!652592) (not e!549400))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83454 (= res!652592 (validMask!0 mask!2147))))

(assert (=> start!83454 e!549400))

(assert (=> start!83454 true))

(declare-datatypes ((V!34801 0))(
  ( (V!34802 (val!11232 Int)) )
))
(declare-datatypes ((ValueCell!10700 0))(
  ( (ValueCellFull!10700 (v!13790 V!34801)) (EmptyCell!10700) )
))
(declare-datatypes ((array!60686 0))(
  ( (array!60687 (arr!29207 (Array (_ BitVec 32) ValueCell!10700)) (size!29688 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60686)

(declare-fun e!549398 () Bool)

(declare-fun array_inv!22639 (array!60686) Bool)

(assert (=> start!83454 (and (array_inv!22639 _values!1425) e!549398)))

(assert (=> start!83454 tp_is_empty!22363))

(assert (=> start!83454 tp!67665))

(declare-datatypes ((array!60688 0))(
  ( (array!60689 (arr!29208 (Array (_ BitVec 32) (_ BitVec 64))) (size!29689 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60688)

(declare-fun array_inv!22640 (array!60688) Bool)

(assert (=> start!83454 (array_inv!22640 _keys!1717)))

(declare-fun mapIsEmpty!35554 () Bool)

(declare-fun mapRes!35554 () Bool)

(assert (=> mapIsEmpty!35554 mapRes!35554))

(declare-fun mapNonEmpty!35554 () Bool)

(declare-fun tp!67666 () Bool)

(declare-fun e!549399 () Bool)

(assert (=> mapNonEmpty!35554 (= mapRes!35554 (and tp!67666 e!549399))))

(declare-fun mapRest!35554 () (Array (_ BitVec 32) ValueCell!10700))

(declare-fun mapKey!35554 () (_ BitVec 32))

(declare-fun mapValue!35554 () ValueCell!10700)

(assert (=> mapNonEmpty!35554 (= (arr!29207 _values!1425) (store mapRest!35554 mapKey!35554 mapValue!35554))))

(declare-fun b!974799 () Bool)

(declare-fun res!652590 () Bool)

(assert (=> b!974799 (=> (not res!652590) (not e!549400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60688 (_ BitVec 32)) Bool)

(assert (=> b!974799 (= res!652590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974800 () Bool)

(declare-fun res!652593 () Bool)

(assert (=> b!974800 (=> (not res!652593) (not e!549400))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974800 (= res!652593 (and (= (size!29688 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29689 _keys!1717) (size!29688 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974801 () Bool)

(assert (=> b!974801 (= e!549400 false)))

(declare-datatypes ((tuple2!14506 0))(
  ( (tuple2!14507 (_1!7264 (_ BitVec 64)) (_2!7264 V!34801)) )
))
(declare-datatypes ((List!20312 0))(
  ( (Nil!20309) (Cons!20308 (h!21470 tuple2!14506) (t!28780 List!20312)) )
))
(declare-datatypes ((ListLongMap!13193 0))(
  ( (ListLongMap!13194 (toList!6612 List!20312)) )
))
(declare-fun lt!432588 () ListLongMap!13193)

(declare-fun zeroValue!1367 () V!34801)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34801)

(declare-fun getCurrentListMap!3774 (array!60688 array!60686 (_ BitVec 32) (_ BitVec 32) V!34801 V!34801 (_ BitVec 32) Int) ListLongMap!13193)

(assert (=> b!974801 (= lt!432588 (getCurrentListMap!3774 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974802 () Bool)

(declare-fun res!652591 () Bool)

(assert (=> b!974802 (=> (not res!652591) (not e!549400))))

(declare-datatypes ((List!20313 0))(
  ( (Nil!20310) (Cons!20309 (h!21471 (_ BitVec 64)) (t!28781 List!20313)) )
))
(declare-fun arrayNoDuplicates!0 (array!60688 (_ BitVec 32) List!20313) Bool)

(assert (=> b!974802 (= res!652591 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20310))))

(declare-fun b!974803 () Bool)

(declare-fun res!652594 () Bool)

(assert (=> b!974803 (=> (not res!652594) (not e!549400))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974803 (= res!652594 (validKeyInArray!0 (select (arr!29208 _keys!1717) i!822)))))

(declare-fun b!974804 () Bool)

(assert (=> b!974804 (= e!549399 tp_is_empty!22363)))

(declare-fun b!974805 () Bool)

(declare-fun res!652589 () Bool)

(assert (=> b!974805 (=> (not res!652589) (not e!549400))))

(declare-fun contains!5645 (ListLongMap!13193 (_ BitVec 64)) Bool)

(assert (=> b!974805 (= res!652589 (contains!5645 (getCurrentListMap!3774 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29208 _keys!1717) i!822)))))

(declare-fun b!974806 () Bool)

(declare-fun res!652588 () Bool)

(assert (=> b!974806 (=> (not res!652588) (not e!549400))))

(assert (=> b!974806 (= res!652588 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29689 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29689 _keys!1717))))))

(declare-fun b!974807 () Bool)

(assert (=> b!974807 (= e!549398 (and e!549402 mapRes!35554))))

(declare-fun condMapEmpty!35554 () Bool)

(declare-fun mapDefault!35554 () ValueCell!10700)

(assert (=> b!974807 (= condMapEmpty!35554 (= (arr!29207 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10700)) mapDefault!35554)))))

(assert (= (and start!83454 res!652592) b!974800))

(assert (= (and b!974800 res!652593) b!974799))

(assert (= (and b!974799 res!652590) b!974802))

(assert (= (and b!974802 res!652591) b!974806))

(assert (= (and b!974806 res!652588) b!974803))

(assert (= (and b!974803 res!652594) b!974805))

(assert (= (and b!974805 res!652589) b!974801))

(assert (= (and b!974807 condMapEmpty!35554) mapIsEmpty!35554))

(assert (= (and b!974807 (not condMapEmpty!35554)) mapNonEmpty!35554))

(get-info :version)

(assert (= (and mapNonEmpty!35554 ((_ is ValueCellFull!10700) mapValue!35554)) b!974804))

(assert (= (and b!974807 ((_ is ValueCellFull!10700) mapDefault!35554)) b!974798))

(assert (= start!83454 b!974807))

(declare-fun m!901631 () Bool)

(assert (=> b!974805 m!901631))

(declare-fun m!901633 () Bool)

(assert (=> b!974805 m!901633))

(assert (=> b!974805 m!901631))

(assert (=> b!974805 m!901633))

(declare-fun m!901635 () Bool)

(assert (=> b!974805 m!901635))

(declare-fun m!901637 () Bool)

(assert (=> b!974802 m!901637))

(declare-fun m!901639 () Bool)

(assert (=> start!83454 m!901639))

(declare-fun m!901641 () Bool)

(assert (=> start!83454 m!901641))

(declare-fun m!901643 () Bool)

(assert (=> start!83454 m!901643))

(assert (=> b!974803 m!901633))

(assert (=> b!974803 m!901633))

(declare-fun m!901645 () Bool)

(assert (=> b!974803 m!901645))

(declare-fun m!901647 () Bool)

(assert (=> b!974801 m!901647))

(declare-fun m!901649 () Bool)

(assert (=> mapNonEmpty!35554 m!901649))

(declare-fun m!901651 () Bool)

(assert (=> b!974799 m!901651))

(check-sat (not b_next!19459) (not mapNonEmpty!35554) tp_is_empty!22363 (not b!974803) (not b!974801) b_and!31035 (not b!974805) (not b!974799) (not b!974802) (not start!83454))
(check-sat b_and!31035 (not b_next!19459))
