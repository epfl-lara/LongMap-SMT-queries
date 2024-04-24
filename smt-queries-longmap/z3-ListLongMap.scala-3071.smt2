; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43264 () Bool)

(assert start!43264)

(declare-fun b_free!12145 () Bool)

(declare-fun b_next!12145 () Bool)

(assert (=> start!43264 (= b_free!12145 (not b_next!12145))))

(declare-fun tp!42706 () Bool)

(declare-fun b_and!20907 () Bool)

(assert (=> start!43264 (= tp!42706 b_and!20907)))

(declare-fun b!479428 () Bool)

(declare-fun res!286011 () Bool)

(declare-fun e!282064 () Bool)

(assert (=> b!479428 (=> (not res!286011) (not e!282064))))

(declare-datatypes ((array!30968 0))(
  ( (array!30969 (arr!14890 (Array (_ BitVec 32) (_ BitVec 64))) (size!15248 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30968)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30968 (_ BitVec 32)) Bool)

(assert (=> b!479428 (= res!286011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479429 () Bool)

(declare-fun res!286012 () Bool)

(assert (=> b!479429 (=> (not res!286012) (not e!282064))))

(declare-datatypes ((List!9012 0))(
  ( (Nil!9009) (Cons!9008 (h!9864 (_ BitVec 64)) (t!15210 List!9012)) )
))
(declare-fun arrayNoDuplicates!0 (array!30968 (_ BitVec 32) List!9012) Bool)

(assert (=> b!479429 (= res!286012 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9009))))

(declare-fun b!479430 () Bool)

(declare-fun e!282065 () Bool)

(declare-fun e!282063 () Bool)

(declare-fun mapRes!22183 () Bool)

(assert (=> b!479430 (= e!282065 (and e!282063 mapRes!22183))))

(declare-fun condMapEmpty!22183 () Bool)

(declare-datatypes ((V!19281 0))(
  ( (V!19282 (val!6876 Int)) )
))
(declare-datatypes ((ValueCell!6467 0))(
  ( (ValueCellFull!6467 (v!9166 V!19281)) (EmptyCell!6467) )
))
(declare-datatypes ((array!30970 0))(
  ( (array!30971 (arr!14891 (Array (_ BitVec 32) ValueCell!6467)) (size!15249 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30970)

(declare-fun mapDefault!22183 () ValueCell!6467)

(assert (=> b!479430 (= condMapEmpty!22183 (= (arr!14891 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6467)) mapDefault!22183)))))

(declare-fun b!479431 () Bool)

(declare-fun e!282062 () Bool)

(declare-fun tp_is_empty!13657 () Bool)

(assert (=> b!479431 (= e!282062 tp_is_empty!13657)))

(declare-fun mapIsEmpty!22183 () Bool)

(assert (=> mapIsEmpty!22183 mapRes!22183))

(declare-fun b!479432 () Bool)

(declare-fun res!286010 () Bool)

(assert (=> b!479432 (=> (not res!286010) (not e!282064))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!479432 (= res!286010 (and (= (size!15249 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15248 _keys!1874) (size!15249 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22183 () Bool)

(declare-fun tp!42705 () Bool)

(assert (=> mapNonEmpty!22183 (= mapRes!22183 (and tp!42705 e!282062))))

(declare-fun mapKey!22183 () (_ BitVec 32))

(declare-fun mapValue!22183 () ValueCell!6467)

(declare-fun mapRest!22183 () (Array (_ BitVec 32) ValueCell!6467))

(assert (=> mapNonEmpty!22183 (= (arr!14891 _values!1516) (store mapRest!22183 mapKey!22183 mapValue!22183))))

(declare-fun b!479434 () Bool)

(assert (=> b!479434 (= e!282063 tp_is_empty!13657)))

(declare-fun res!286013 () Bool)

(assert (=> start!43264 (=> (not res!286013) (not e!282064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43264 (= res!286013 (validMask!0 mask!2352))))

(assert (=> start!43264 e!282064))

(assert (=> start!43264 true))

(assert (=> start!43264 tp_is_empty!13657))

(declare-fun array_inv!10820 (array!30970) Bool)

(assert (=> start!43264 (and (array_inv!10820 _values!1516) e!282065)))

(assert (=> start!43264 tp!42706))

(declare-fun array_inv!10821 (array!30968) Bool)

(assert (=> start!43264 (array_inv!10821 _keys!1874)))

(declare-fun b!479433 () Bool)

(assert (=> b!479433 (= e!282064 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19281)

(declare-fun lt!217882 () Bool)

(declare-fun zeroValue!1458 () V!19281)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!8942 0))(
  ( (tuple2!8943 (_1!4482 (_ BitVec 64)) (_2!4482 V!19281)) )
))
(declare-datatypes ((List!9013 0))(
  ( (Nil!9010) (Cons!9009 (h!9865 tuple2!8942) (t!15211 List!9013)) )
))
(declare-datatypes ((ListLongMap!7857 0))(
  ( (ListLongMap!7858 (toList!3944 List!9013)) )
))
(declare-fun contains!2572 (ListLongMap!7857 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2258 (array!30968 array!30970 (_ BitVec 32) (_ BitVec 32) V!19281 V!19281 (_ BitVec 32) Int) ListLongMap!7857)

(assert (=> b!479433 (= lt!217882 (contains!2572 (getCurrentListMap!2258 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(assert (= (and start!43264 res!286013) b!479432))

(assert (= (and b!479432 res!286010) b!479428))

(assert (= (and b!479428 res!286011) b!479429))

(assert (= (and b!479429 res!286012) b!479433))

(assert (= (and b!479430 condMapEmpty!22183) mapIsEmpty!22183))

(assert (= (and b!479430 (not condMapEmpty!22183)) mapNonEmpty!22183))

(get-info :version)

(assert (= (and mapNonEmpty!22183 ((_ is ValueCellFull!6467) mapValue!22183)) b!479431))

(assert (= (and b!479430 ((_ is ValueCellFull!6467) mapDefault!22183)) b!479434))

(assert (= start!43264 b!479430))

(declare-fun m!461605 () Bool)

(assert (=> b!479428 m!461605))

(declare-fun m!461607 () Bool)

(assert (=> start!43264 m!461607))

(declare-fun m!461609 () Bool)

(assert (=> start!43264 m!461609))

(declare-fun m!461611 () Bool)

(assert (=> start!43264 m!461611))

(declare-fun m!461613 () Bool)

(assert (=> b!479429 m!461613))

(declare-fun m!461615 () Bool)

(assert (=> mapNonEmpty!22183 m!461615))

(declare-fun m!461617 () Bool)

(assert (=> b!479433 m!461617))

(assert (=> b!479433 m!461617))

(declare-fun m!461619 () Bool)

(assert (=> b!479433 m!461619))

(check-sat (not b!479428) (not start!43264) (not b!479429) (not b!479433) (not b_next!12145) b_and!20907 tp_is_empty!13657 (not mapNonEmpty!22183))
(check-sat b_and!20907 (not b_next!12145))
