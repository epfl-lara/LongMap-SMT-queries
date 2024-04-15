; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43264 () Bool)

(assert start!43264)

(declare-fun b_free!12145 () Bool)

(declare-fun b_next!12145 () Bool)

(assert (=> start!43264 (= b_free!12145 (not b_next!12145))))

(declare-fun tp!42706 () Bool)

(declare-fun b_and!20871 () Bool)

(assert (=> start!43264 (= tp!42706 b_and!20871)))

(declare-fun b!479218 () Bool)

(declare-fun e!281929 () Bool)

(assert (=> b!479218 (= e!281929 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19281 0))(
  ( (V!19282 (val!6876 Int)) )
))
(declare-fun minValue!1458 () V!19281)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun lt!217636 () Bool)

(declare-fun zeroValue!1458 () V!19281)

(declare-datatypes ((ValueCell!6467 0))(
  ( (ValueCellFull!6467 (v!9159 V!19281)) (EmptyCell!6467) )
))
(declare-datatypes ((array!30977 0))(
  ( (array!30978 (arr!14895 (Array (_ BitVec 32) ValueCell!6467)) (size!15254 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30977)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!30979 0))(
  ( (array!30980 (arr!14896 (Array (_ BitVec 32) (_ BitVec 64))) (size!15255 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30979)

(declare-datatypes ((tuple2!9082 0))(
  ( (tuple2!9083 (_1!4552 (_ BitVec 64)) (_2!4552 V!19281)) )
))
(declare-datatypes ((List!9143 0))(
  ( (Nil!9140) (Cons!9139 (h!9995 tuple2!9082) (t!15340 List!9143)) )
))
(declare-datatypes ((ListLongMap!7985 0))(
  ( (ListLongMap!7986 (toList!4008 List!9143)) )
))
(declare-fun contains!2583 (ListLongMap!7985 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2261 (array!30979 array!30977 (_ BitVec 32) (_ BitVec 32) V!19281 V!19281 (_ BitVec 32) Int) ListLongMap!7985)

(assert (=> b!479218 (= lt!217636 (contains!2583 (getCurrentListMap!2261 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479219 () Bool)

(declare-fun e!281930 () Bool)

(declare-fun e!281927 () Bool)

(declare-fun mapRes!22183 () Bool)

(assert (=> b!479219 (= e!281930 (and e!281927 mapRes!22183))))

(declare-fun condMapEmpty!22183 () Bool)

(declare-fun mapDefault!22183 () ValueCell!6467)

(assert (=> b!479219 (= condMapEmpty!22183 (= (arr!14895 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6467)) mapDefault!22183)))))

(declare-fun b!479220 () Bool)

(declare-fun res!285888 () Bool)

(assert (=> b!479220 (=> (not res!285888) (not e!281929))))

(assert (=> b!479220 (= res!285888 (and (= (size!15254 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15255 _keys!1874) (size!15254 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479221 () Bool)

(declare-fun tp_is_empty!13657 () Bool)

(assert (=> b!479221 (= e!281927 tp_is_empty!13657)))

(declare-fun b!479222 () Bool)

(declare-fun res!285889 () Bool)

(assert (=> b!479222 (=> (not res!285889) (not e!281929))))

(declare-datatypes ((List!9144 0))(
  ( (Nil!9141) (Cons!9140 (h!9996 (_ BitVec 64)) (t!15341 List!9144)) )
))
(declare-fun arrayNoDuplicates!0 (array!30979 (_ BitVec 32) List!9144) Bool)

(assert (=> b!479222 (= res!285889 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9141))))

(declare-fun mapNonEmpty!22183 () Bool)

(declare-fun tp!42705 () Bool)

(declare-fun e!281931 () Bool)

(assert (=> mapNonEmpty!22183 (= mapRes!22183 (and tp!42705 e!281931))))

(declare-fun mapValue!22183 () ValueCell!6467)

(declare-fun mapRest!22183 () (Array (_ BitVec 32) ValueCell!6467))

(declare-fun mapKey!22183 () (_ BitVec 32))

(assert (=> mapNonEmpty!22183 (= (arr!14895 _values!1516) (store mapRest!22183 mapKey!22183 mapValue!22183))))

(declare-fun res!285891 () Bool)

(assert (=> start!43264 (=> (not res!285891) (not e!281929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43264 (= res!285891 (validMask!0 mask!2352))))

(assert (=> start!43264 e!281929))

(assert (=> start!43264 true))

(assert (=> start!43264 tp_is_empty!13657))

(declare-fun array_inv!10836 (array!30977) Bool)

(assert (=> start!43264 (and (array_inv!10836 _values!1516) e!281930)))

(assert (=> start!43264 tp!42706))

(declare-fun array_inv!10837 (array!30979) Bool)

(assert (=> start!43264 (array_inv!10837 _keys!1874)))

(declare-fun mapIsEmpty!22183 () Bool)

(assert (=> mapIsEmpty!22183 mapRes!22183))

(declare-fun b!479223 () Bool)

(declare-fun res!285890 () Bool)

(assert (=> b!479223 (=> (not res!285890) (not e!281929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30979 (_ BitVec 32)) Bool)

(assert (=> b!479223 (= res!285890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479224 () Bool)

(assert (=> b!479224 (= e!281931 tp_is_empty!13657)))

(assert (= (and start!43264 res!285891) b!479220))

(assert (= (and b!479220 res!285888) b!479223))

(assert (= (and b!479223 res!285890) b!479222))

(assert (= (and b!479222 res!285889) b!479218))

(assert (= (and b!479219 condMapEmpty!22183) mapIsEmpty!22183))

(assert (= (and b!479219 (not condMapEmpty!22183)) mapNonEmpty!22183))

(get-info :version)

(assert (= (and mapNonEmpty!22183 ((_ is ValueCellFull!6467) mapValue!22183)) b!479224))

(assert (= (and b!479219 ((_ is ValueCellFull!6467) mapDefault!22183)) b!479221))

(assert (= start!43264 b!479219))

(declare-fun m!460689 () Bool)

(assert (=> b!479222 m!460689))

(declare-fun m!460691 () Bool)

(assert (=> start!43264 m!460691))

(declare-fun m!460693 () Bool)

(assert (=> start!43264 m!460693))

(declare-fun m!460695 () Bool)

(assert (=> start!43264 m!460695))

(declare-fun m!460697 () Bool)

(assert (=> b!479218 m!460697))

(assert (=> b!479218 m!460697))

(declare-fun m!460699 () Bool)

(assert (=> b!479218 m!460699))

(declare-fun m!460701 () Bool)

(assert (=> mapNonEmpty!22183 m!460701))

(declare-fun m!460703 () Bool)

(assert (=> b!479223 m!460703))

(check-sat (not mapNonEmpty!22183) (not b!479223) (not b_next!12145) b_and!20871 (not start!43264) tp_is_empty!13657 (not b!479222) (not b!479218))
(check-sat b_and!20871 (not b_next!12145))
