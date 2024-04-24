; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43282 () Bool)

(assert start!43282)

(declare-fun b_free!12163 () Bool)

(declare-fun b_next!12163 () Bool)

(assert (=> start!43282 (= b_free!12163 (not b_next!12163))))

(declare-fun tp!42760 () Bool)

(declare-fun b_and!20925 () Bool)

(assert (=> start!43282 (= tp!42760 b_and!20925)))

(declare-fun b!479617 () Bool)

(declare-fun e!282198 () Bool)

(assert (=> b!479617 (= e!282198 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19305 0))(
  ( (V!19306 (val!6885 Int)) )
))
(declare-fun zeroValue!1458 () V!19305)

(declare-datatypes ((ValueCell!6476 0))(
  ( (ValueCellFull!6476 (v!9175 V!19305)) (EmptyCell!6476) )
))
(declare-datatypes ((array!31002 0))(
  ( (array!31003 (arr!14907 (Array (_ BitVec 32) ValueCell!6476)) (size!15265 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31002)

(declare-fun minValue!1458 () V!19305)

(declare-fun lt!217909 () Bool)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31004 0))(
  ( (array!31005 (arr!14908 (Array (_ BitVec 32) (_ BitVec 64))) (size!15266 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31004)

(declare-datatypes ((tuple2!8954 0))(
  ( (tuple2!8955 (_1!4488 (_ BitVec 64)) (_2!4488 V!19305)) )
))
(declare-datatypes ((List!9023 0))(
  ( (Nil!9020) (Cons!9019 (h!9875 tuple2!8954) (t!15221 List!9023)) )
))
(declare-datatypes ((ListLongMap!7869 0))(
  ( (ListLongMap!7870 (toList!3950 List!9023)) )
))
(declare-fun contains!2578 (ListLongMap!7869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2264 (array!31004 array!31002 (_ BitVec 32) (_ BitVec 32) V!19305 V!19305 (_ BitVec 32) Int) ListLongMap!7869)

(assert (=> b!479617 (= lt!217909 (contains!2578 (getCurrentListMap!2264 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479618 () Bool)

(declare-fun res!286118 () Bool)

(assert (=> b!479618 (=> (not res!286118) (not e!282198))))

(assert (=> b!479618 (= res!286118 (and (= (size!15265 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15266 _keys!1874) (size!15265 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22210 () Bool)

(declare-fun mapRes!22210 () Bool)

(declare-fun tp!42759 () Bool)

(declare-fun e!282199 () Bool)

(assert (=> mapNonEmpty!22210 (= mapRes!22210 (and tp!42759 e!282199))))

(declare-fun mapValue!22210 () ValueCell!6476)

(declare-fun mapKey!22210 () (_ BitVec 32))

(declare-fun mapRest!22210 () (Array (_ BitVec 32) ValueCell!6476))

(assert (=> mapNonEmpty!22210 (= (arr!14907 _values!1516) (store mapRest!22210 mapKey!22210 mapValue!22210))))

(declare-fun b!479619 () Bool)

(declare-fun tp_is_empty!13675 () Bool)

(assert (=> b!479619 (= e!282199 tp_is_empty!13675)))

(declare-fun res!286119 () Bool)

(assert (=> start!43282 (=> (not res!286119) (not e!282198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43282 (= res!286119 (validMask!0 mask!2352))))

(assert (=> start!43282 e!282198))

(assert (=> start!43282 true))

(assert (=> start!43282 tp_is_empty!13675))

(declare-fun e!282197 () Bool)

(declare-fun array_inv!10830 (array!31002) Bool)

(assert (=> start!43282 (and (array_inv!10830 _values!1516) e!282197)))

(assert (=> start!43282 tp!42760))

(declare-fun array_inv!10831 (array!31004) Bool)

(assert (=> start!43282 (array_inv!10831 _keys!1874)))

(declare-fun b!479620 () Bool)

(declare-fun res!286120 () Bool)

(assert (=> b!479620 (=> (not res!286120) (not e!282198))))

(declare-datatypes ((List!9024 0))(
  ( (Nil!9021) (Cons!9020 (h!9876 (_ BitVec 64)) (t!15222 List!9024)) )
))
(declare-fun arrayNoDuplicates!0 (array!31004 (_ BitVec 32) List!9024) Bool)

(assert (=> b!479620 (= res!286120 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9021))))

(declare-fun b!479621 () Bool)

(declare-fun e!282200 () Bool)

(assert (=> b!479621 (= e!282197 (and e!282200 mapRes!22210))))

(declare-fun condMapEmpty!22210 () Bool)

(declare-fun mapDefault!22210 () ValueCell!6476)

(assert (=> b!479621 (= condMapEmpty!22210 (= (arr!14907 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6476)) mapDefault!22210)))))

(declare-fun mapIsEmpty!22210 () Bool)

(assert (=> mapIsEmpty!22210 mapRes!22210))

(declare-fun b!479622 () Bool)

(declare-fun res!286121 () Bool)

(assert (=> b!479622 (=> (not res!286121) (not e!282198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31004 (_ BitVec 32)) Bool)

(assert (=> b!479622 (= res!286121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479623 () Bool)

(assert (=> b!479623 (= e!282200 tp_is_empty!13675)))

(assert (= (and start!43282 res!286119) b!479618))

(assert (= (and b!479618 res!286118) b!479622))

(assert (= (and b!479622 res!286121) b!479620))

(assert (= (and b!479620 res!286120) b!479617))

(assert (= (and b!479621 condMapEmpty!22210) mapIsEmpty!22210))

(assert (= (and b!479621 (not condMapEmpty!22210)) mapNonEmpty!22210))

(get-info :version)

(assert (= (and mapNonEmpty!22210 ((_ is ValueCellFull!6476) mapValue!22210)) b!479619))

(assert (= (and b!479621 ((_ is ValueCellFull!6476) mapDefault!22210)) b!479623))

(assert (= start!43282 b!479621))

(declare-fun m!461749 () Bool)

(assert (=> start!43282 m!461749))

(declare-fun m!461751 () Bool)

(assert (=> start!43282 m!461751))

(declare-fun m!461753 () Bool)

(assert (=> start!43282 m!461753))

(declare-fun m!461755 () Bool)

(assert (=> b!479620 m!461755))

(declare-fun m!461757 () Bool)

(assert (=> mapNonEmpty!22210 m!461757))

(declare-fun m!461759 () Bool)

(assert (=> b!479622 m!461759))

(declare-fun m!461761 () Bool)

(assert (=> b!479617 m!461761))

(assert (=> b!479617 m!461761))

(declare-fun m!461763 () Bool)

(assert (=> b!479617 m!461763))

(check-sat (not mapNonEmpty!22210) (not start!43282) (not b!479617) (not b!479622) tp_is_empty!13675 b_and!20925 (not b_next!12163) (not b!479620))
(check-sat b_and!20925 (not b_next!12163))
