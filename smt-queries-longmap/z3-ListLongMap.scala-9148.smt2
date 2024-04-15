; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109728 () Bool)

(assert start!109728)

(declare-fun b_free!29161 () Bool)

(declare-fun b_next!29161 () Bool)

(assert (=> start!109728 (= b_free!29161 (not b_next!29161))))

(declare-fun tp!102612 () Bool)

(declare-fun b_and!47245 () Bool)

(assert (=> start!109728 (= tp!102612 b_and!47245)))

(declare-fun b!1299681 () Bool)

(declare-fun e!741435 () Bool)

(declare-fun tp_is_empty!34801 () Bool)

(assert (=> b!1299681 (= e!741435 tp_is_empty!34801)))

(declare-fun b!1299682 () Bool)

(declare-fun res!863718 () Bool)

(declare-fun e!741437 () Bool)

(assert (=> b!1299682 (=> (not res!863718) (not e!741437))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51505 0))(
  ( (V!51506 (val!17475 Int)) )
))
(declare-datatypes ((ValueCell!16502 0))(
  ( (ValueCellFull!16502 (v!20080 V!51505)) (EmptyCell!16502) )
))
(declare-datatypes ((array!86509 0))(
  ( (array!86510 (arr!41753 (Array (_ BitVec 32) ValueCell!16502)) (size!42305 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86509)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86511 0))(
  ( (array!86512 (arr!41754 (Array (_ BitVec 32) (_ BitVec 64))) (size!42306 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86511)

(assert (=> b!1299682 (= res!863718 (and (= (size!42305 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42306 _keys!1741) (size!42305 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299683 () Bool)

(declare-fun res!863711 () Bool)

(assert (=> b!1299683 (=> (not res!863711) (not e!741437))))

(declare-datatypes ((List!29705 0))(
  ( (Nil!29702) (Cons!29701 (h!30910 (_ BitVec 64)) (t!43267 List!29705)) )
))
(declare-fun arrayNoDuplicates!0 (array!86511 (_ BitVec 32) List!29705) Bool)

(assert (=> b!1299683 (= res!863711 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29702))))

(declare-fun b!1299684 () Bool)

(declare-fun res!863712 () Bool)

(assert (=> b!1299684 (=> (not res!863712) (not e!741437))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1299684 (= res!863712 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42306 _keys!1741))))))

(declare-fun b!1299685 () Bool)

(declare-fun res!863716 () Bool)

(assert (=> b!1299685 (=> (not res!863716) (not e!741437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299685 (= res!863716 (validKeyInArray!0 (select (arr!41754 _keys!1741) from!2144)))))

(declare-fun b!1299686 () Bool)

(declare-fun res!863710 () Bool)

(assert (=> b!1299686 (=> (not res!863710) (not e!741437))))

(assert (=> b!1299686 (= res!863710 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1299687 () Bool)

(declare-fun res!863715 () Bool)

(assert (=> b!1299687 (=> (not res!863715) (not e!741437))))

(assert (=> b!1299687 (= res!863715 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42306 _keys!1741))))))

(declare-fun mapIsEmpty!53771 () Bool)

(declare-fun mapRes!53771 () Bool)

(assert (=> mapIsEmpty!53771 mapRes!53771))

(declare-fun b!1299688 () Bool)

(declare-fun e!741433 () Bool)

(assert (=> b!1299688 (= e!741433 (and e!741435 mapRes!53771))))

(declare-fun condMapEmpty!53771 () Bool)

(declare-fun mapDefault!53771 () ValueCell!16502)

(assert (=> b!1299688 (= condMapEmpty!53771 (= (arr!41753 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16502)) mapDefault!53771)))))

(declare-fun b!1299689 () Bool)

(declare-fun res!863717 () Bool)

(assert (=> b!1299689 (=> (not res!863717) (not e!741437))))

(declare-fun minValue!1387 () V!51505)

(declare-fun zeroValue!1387 () V!51505)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22586 0))(
  ( (tuple2!22587 (_1!11304 (_ BitVec 64)) (_2!11304 V!51505)) )
))
(declare-datatypes ((List!29706 0))(
  ( (Nil!29703) (Cons!29702 (h!30911 tuple2!22586) (t!43268 List!29706)) )
))
(declare-datatypes ((ListLongMap!20243 0))(
  ( (ListLongMap!20244 (toList!10137 List!29706)) )
))
(declare-fun contains!8189 (ListLongMap!20243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5052 (array!86511 array!86509 (_ BitVec 32) (_ BitVec 32) V!51505 V!51505 (_ BitVec 32) Int) ListLongMap!20243)

(assert (=> b!1299689 (= res!863717 (contains!8189 (getCurrentListMap!5052 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299690 () Bool)

(declare-fun e!741436 () Bool)

(assert (=> b!1299690 (= e!741436 tp_is_empty!34801)))

(declare-fun b!1299691 () Bool)

(assert (=> b!1299691 (= e!741437 (not true))))

(declare-fun lt!580946 () ListLongMap!20243)

(assert (=> b!1299691 (contains!8189 lt!580946 k0!1205)))

(declare-datatypes ((Unit!42865 0))(
  ( (Unit!42866) )
))
(declare-fun lt!580945 () Unit!42865)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!73 ((_ BitVec 64) (_ BitVec 64) V!51505 ListLongMap!20243) Unit!42865)

(assert (=> b!1299691 (= lt!580945 (lemmaInListMapAfterAddingDiffThenInBefore!73 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!580946))))

(declare-fun +!4481 (ListLongMap!20243 tuple2!22586) ListLongMap!20243)

(declare-fun getCurrentListMapNoExtraKeys!6112 (array!86511 array!86509 (_ BitVec 32) (_ BitVec 32) V!51505 V!51505 (_ BitVec 32) Int) ListLongMap!20243)

(assert (=> b!1299691 (= lt!580946 (+!4481 (getCurrentListMapNoExtraKeys!6112 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun mapNonEmpty!53771 () Bool)

(declare-fun tp!102611 () Bool)

(assert (=> mapNonEmpty!53771 (= mapRes!53771 (and tp!102611 e!741436))))

(declare-fun mapRest!53771 () (Array (_ BitVec 32) ValueCell!16502))

(declare-fun mapKey!53771 () (_ BitVec 32))

(declare-fun mapValue!53771 () ValueCell!16502)

(assert (=> mapNonEmpty!53771 (= (arr!41753 _values!1445) (store mapRest!53771 mapKey!53771 mapValue!53771))))

(declare-fun b!1299680 () Bool)

(declare-fun res!863714 () Bool)

(assert (=> b!1299680 (=> (not res!863714) (not e!741437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86511 (_ BitVec 32)) Bool)

(assert (=> b!1299680 (= res!863714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!863713 () Bool)

(assert (=> start!109728 (=> (not res!863713) (not e!741437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109728 (= res!863713 (validMask!0 mask!2175))))

(assert (=> start!109728 e!741437))

(assert (=> start!109728 tp_is_empty!34801))

(assert (=> start!109728 true))

(declare-fun array_inv!31757 (array!86509) Bool)

(assert (=> start!109728 (and (array_inv!31757 _values!1445) e!741433)))

(declare-fun array_inv!31758 (array!86511) Bool)

(assert (=> start!109728 (array_inv!31758 _keys!1741)))

(assert (=> start!109728 tp!102612))

(assert (= (and start!109728 res!863713) b!1299682))

(assert (= (and b!1299682 res!863718) b!1299680))

(assert (= (and b!1299680 res!863714) b!1299683))

(assert (= (and b!1299683 res!863711) b!1299687))

(assert (= (and b!1299687 res!863715) b!1299689))

(assert (= (and b!1299689 res!863717) b!1299684))

(assert (= (and b!1299684 res!863712) b!1299685))

(assert (= (and b!1299685 res!863716) b!1299686))

(assert (= (and b!1299686 res!863710) b!1299691))

(assert (= (and b!1299688 condMapEmpty!53771) mapIsEmpty!53771))

(assert (= (and b!1299688 (not condMapEmpty!53771)) mapNonEmpty!53771))

(get-info :version)

(assert (= (and mapNonEmpty!53771 ((_ is ValueCellFull!16502) mapValue!53771)) b!1299690))

(assert (= (and b!1299688 ((_ is ValueCellFull!16502) mapDefault!53771)) b!1299681))

(assert (= start!109728 b!1299688))

(declare-fun m!1190349 () Bool)

(assert (=> start!109728 m!1190349))

(declare-fun m!1190351 () Bool)

(assert (=> start!109728 m!1190351))

(declare-fun m!1190353 () Bool)

(assert (=> start!109728 m!1190353))

(declare-fun m!1190355 () Bool)

(assert (=> b!1299691 m!1190355))

(declare-fun m!1190357 () Bool)

(assert (=> b!1299691 m!1190357))

(declare-fun m!1190359 () Bool)

(assert (=> b!1299691 m!1190359))

(assert (=> b!1299691 m!1190359))

(declare-fun m!1190361 () Bool)

(assert (=> b!1299691 m!1190361))

(declare-fun m!1190363 () Bool)

(assert (=> b!1299680 m!1190363))

(declare-fun m!1190365 () Bool)

(assert (=> b!1299683 m!1190365))

(declare-fun m!1190367 () Bool)

(assert (=> mapNonEmpty!53771 m!1190367))

(declare-fun m!1190369 () Bool)

(assert (=> b!1299689 m!1190369))

(assert (=> b!1299689 m!1190369))

(declare-fun m!1190371 () Bool)

(assert (=> b!1299689 m!1190371))

(declare-fun m!1190373 () Bool)

(assert (=> b!1299685 m!1190373))

(assert (=> b!1299685 m!1190373))

(declare-fun m!1190375 () Bool)

(assert (=> b!1299685 m!1190375))

(check-sat tp_is_empty!34801 (not b!1299691) (not mapNonEmpty!53771) b_and!47245 (not b!1299683) (not b_next!29161) (not b!1299685) (not b!1299689) (not b!1299680) (not start!109728))
(check-sat b_and!47245 (not b_next!29161))
