; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43292 () Bool)

(assert start!43292)

(declare-fun b_free!12159 () Bool)

(declare-fun b_next!12159 () Bool)

(assert (=> start!43292 (= b_free!12159 (not b_next!12159))))

(declare-fun tp!42747 () Bool)

(declare-fun b_and!20911 () Bool)

(assert (=> start!43292 (= tp!42747 b_and!20911)))

(declare-fun b!479636 () Bool)

(declare-fun e!282209 () Bool)

(declare-fun tp_is_empty!13671 () Bool)

(assert (=> b!479636 (= e!282209 tp_is_empty!13671)))

(declare-fun mapIsEmpty!22204 () Bool)

(declare-fun mapRes!22204 () Bool)

(assert (=> mapIsEmpty!22204 mapRes!22204))

(declare-fun res!286104 () Bool)

(declare-fun e!282208 () Bool)

(assert (=> start!43292 (=> (not res!286104) (not e!282208))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43292 (= res!286104 (validMask!0 mask!2352))))

(assert (=> start!43292 e!282208))

(assert (=> start!43292 true))

(assert (=> start!43292 tp_is_empty!13671))

(declare-datatypes ((V!19299 0))(
  ( (V!19300 (val!6883 Int)) )
))
(declare-datatypes ((ValueCell!6474 0))(
  ( (ValueCellFull!6474 (v!9172 V!19299)) (EmptyCell!6474) )
))
(declare-datatypes ((array!31011 0))(
  ( (array!31012 (arr!14912 (Array (_ BitVec 32) ValueCell!6474)) (size!15270 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31011)

(declare-fun e!282210 () Bool)

(declare-fun array_inv!10758 (array!31011) Bool)

(assert (=> start!43292 (and (array_inv!10758 _values!1516) e!282210)))

(assert (=> start!43292 tp!42747))

(declare-datatypes ((array!31013 0))(
  ( (array!31014 (arr!14913 (Array (_ BitVec 32) (_ BitVec 64))) (size!15271 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31013)

(declare-fun array_inv!10759 (array!31013) Bool)

(assert (=> start!43292 (array_inv!10759 _keys!1874)))

(declare-fun b!479637 () Bool)

(declare-fun e!282207 () Bool)

(assert (=> b!479637 (= e!282207 tp_is_empty!13671)))

(declare-fun b!479638 () Bool)

(assert (=> b!479638 (= e!282208 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19299)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun defaultEntry!1519 () Int)

(declare-fun zeroValue!1458 () V!19299)

(declare-fun lt!217891 () Bool)

(declare-datatypes ((tuple2!9034 0))(
  ( (tuple2!9035 (_1!4528 (_ BitVec 64)) (_2!4528 V!19299)) )
))
(declare-datatypes ((List!9112 0))(
  ( (Nil!9109) (Cons!9108 (h!9964 tuple2!9034) (t!15318 List!9112)) )
))
(declare-datatypes ((ListLongMap!7947 0))(
  ( (ListLongMap!7948 (toList!3989 List!9112)) )
))
(declare-fun contains!2599 (ListLongMap!7947 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2308 (array!31013 array!31011 (_ BitVec 32) (_ BitVec 32) V!19299 V!19299 (_ BitVec 32) Int) ListLongMap!7947)

(assert (=> b!479638 (= lt!217891 (contains!2599 (getCurrentListMap!2308 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479639 () Bool)

(declare-fun res!286103 () Bool)

(assert (=> b!479639 (=> (not res!286103) (not e!282208))))

(assert (=> b!479639 (= res!286103 (and (= (size!15270 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15271 _keys!1874) (size!15270 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479640 () Bool)

(declare-fun res!286102 () Bool)

(assert (=> b!479640 (=> (not res!286102) (not e!282208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31013 (_ BitVec 32)) Bool)

(assert (=> b!479640 (= res!286102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479641 () Bool)

(assert (=> b!479641 (= e!282210 (and e!282207 mapRes!22204))))

(declare-fun condMapEmpty!22204 () Bool)

(declare-fun mapDefault!22204 () ValueCell!6474)

(assert (=> b!479641 (= condMapEmpty!22204 (= (arr!14912 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6474)) mapDefault!22204)))))

(declare-fun b!479642 () Bool)

(declare-fun res!286101 () Bool)

(assert (=> b!479642 (=> (not res!286101) (not e!282208))))

(declare-datatypes ((List!9113 0))(
  ( (Nil!9110) (Cons!9109 (h!9965 (_ BitVec 64)) (t!15319 List!9113)) )
))
(declare-fun arrayNoDuplicates!0 (array!31013 (_ BitVec 32) List!9113) Bool)

(assert (=> b!479642 (= res!286101 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9110))))

(declare-fun mapNonEmpty!22204 () Bool)

(declare-fun tp!42748 () Bool)

(assert (=> mapNonEmpty!22204 (= mapRes!22204 (and tp!42748 e!282209))))

(declare-fun mapKey!22204 () (_ BitVec 32))

(declare-fun mapRest!22204 () (Array (_ BitVec 32) ValueCell!6474))

(declare-fun mapValue!22204 () ValueCell!6474)

(assert (=> mapNonEmpty!22204 (= (arr!14912 _values!1516) (store mapRest!22204 mapKey!22204 mapValue!22204))))

(assert (= (and start!43292 res!286104) b!479639))

(assert (= (and b!479639 res!286103) b!479640))

(assert (= (and b!479640 res!286102) b!479642))

(assert (= (and b!479642 res!286101) b!479638))

(assert (= (and b!479641 condMapEmpty!22204) mapIsEmpty!22204))

(assert (= (and b!479641 (not condMapEmpty!22204)) mapNonEmpty!22204))

(get-info :version)

(assert (= (and mapNonEmpty!22204 ((_ is ValueCellFull!6474) mapValue!22204)) b!479636))

(assert (= (and b!479641 ((_ is ValueCellFull!6474) mapDefault!22204)) b!479637))

(assert (= start!43292 b!479641))

(declare-fun m!461535 () Bool)

(assert (=> b!479638 m!461535))

(assert (=> b!479638 m!461535))

(declare-fun m!461537 () Bool)

(assert (=> b!479638 m!461537))

(declare-fun m!461539 () Bool)

(assert (=> start!43292 m!461539))

(declare-fun m!461541 () Bool)

(assert (=> start!43292 m!461541))

(declare-fun m!461543 () Bool)

(assert (=> start!43292 m!461543))

(declare-fun m!461545 () Bool)

(assert (=> mapNonEmpty!22204 m!461545))

(declare-fun m!461547 () Bool)

(assert (=> b!479640 m!461547))

(declare-fun m!461549 () Bool)

(assert (=> b!479642 m!461549))

(check-sat (not b!479640) (not b!479642) (not b_next!12159) tp_is_empty!13671 (not mapNonEmpty!22204) b_and!20911 (not b!479638) (not start!43292))
(check-sat b_and!20911 (not b_next!12159))
