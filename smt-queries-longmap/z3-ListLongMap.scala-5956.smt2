; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77730 () Bool)

(assert start!77730)

(declare-fun b_free!16147 () Bool)

(declare-fun b_next!16147 () Bool)

(assert (=> start!77730 (= b_free!16147 (not b_next!16147))))

(declare-fun tp!56703 () Bool)

(declare-fun b_and!26523 () Bool)

(assert (=> start!77730 (= tp!56703 b_and!26523)))

(declare-fun b!904590 () Bool)

(declare-fun res!610038 () Bool)

(declare-fun e!506941 () Bool)

(assert (=> b!904590 (=> (not res!610038) (not e!506941))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904590 (= res!610038 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29560 () Bool)

(declare-fun mapRes!29560 () Bool)

(declare-fun tp!56704 () Bool)

(declare-fun e!506937 () Bool)

(assert (=> mapNonEmpty!29560 (= mapRes!29560 (and tp!56704 e!506937))))

(declare-datatypes ((V!29719 0))(
  ( (V!29720 (val!9333 Int)) )
))
(declare-datatypes ((ValueCell!8801 0))(
  ( (ValueCellFull!8801 (v!11835 V!29719)) (EmptyCell!8801) )
))
(declare-datatypes ((array!53221 0))(
  ( (array!53222 (arr!25565 (Array (_ BitVec 32) ValueCell!8801)) (size!26025 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53221)

(declare-fun mapRest!29560 () (Array (_ BitVec 32) ValueCell!8801))

(declare-fun mapKey!29560 () (_ BitVec 32))

(declare-fun mapValue!29560 () ValueCell!8801)

(assert (=> mapNonEmpty!29560 (= (arr!25565 _values!1152) (store mapRest!29560 mapKey!29560 mapValue!29560))))

(declare-fun b!904591 () Bool)

(declare-fun res!610034 () Bool)

(assert (=> b!904591 (=> (not res!610034) (not e!506941))))

(declare-datatypes ((array!53223 0))(
  ( (array!53224 (arr!25566 (Array (_ BitVec 32) (_ BitVec 64))) (size!26026 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53223)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!904591 (= res!610034 (and (= (select (arr!25566 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!29560 () Bool)

(assert (=> mapIsEmpty!29560 mapRes!29560))

(declare-fun b!904593 () Bool)

(declare-fun e!506939 () Bool)

(declare-fun e!506938 () Bool)

(assert (=> b!904593 (= e!506939 (and e!506938 mapRes!29560))))

(declare-fun condMapEmpty!29560 () Bool)

(declare-fun mapDefault!29560 () ValueCell!8801)

(assert (=> b!904593 (= condMapEmpty!29560 (= (arr!25565 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8801)) mapDefault!29560)))))

(declare-fun b!904594 () Bool)

(declare-fun res!610037 () Bool)

(assert (=> b!904594 (=> (not res!610037) (not e!506941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53223 (_ BitVec 32)) Bool)

(assert (=> b!904594 (= res!610037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904595 () Bool)

(declare-fun e!506942 () Bool)

(assert (=> b!904595 (= e!506941 (not e!506942))))

(declare-fun res!610036 () Bool)

(assert (=> b!904595 (=> res!610036 e!506942)))

(assert (=> b!904595 (= res!610036 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26026 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904595 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30646 0))(
  ( (Unit!30647) )
))
(declare-fun lt!408409 () Unit!30646)

(declare-fun zeroValue!1094 () V!29719)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29719)

(declare-fun lemmaKeyInListMapIsInArray!170 (array!53223 array!53221 (_ BitVec 32) (_ BitVec 32) V!29719 V!29719 (_ BitVec 64) Int) Unit!30646)

(assert (=> b!904595 (= lt!408409 (lemmaKeyInListMapIsInArray!170 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904596 () Bool)

(declare-fun tp_is_empty!18565 () Bool)

(assert (=> b!904596 (= e!506937 tp_is_empty!18565)))

(declare-fun b!904597 () Bool)

(declare-fun res!610032 () Bool)

(assert (=> b!904597 (=> (not res!610032) (not e!506941))))

(declare-datatypes ((tuple2!12050 0))(
  ( (tuple2!12051 (_1!6036 (_ BitVec 64)) (_2!6036 V!29719)) )
))
(declare-datatypes ((List!17903 0))(
  ( (Nil!17900) (Cons!17899 (h!19051 tuple2!12050) (t!25278 List!17903)) )
))
(declare-datatypes ((ListLongMap!10749 0))(
  ( (ListLongMap!10750 (toList!5390 List!17903)) )
))
(declare-fun contains!4448 (ListLongMap!10749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2659 (array!53223 array!53221 (_ BitVec 32) (_ BitVec 32) V!29719 V!29719 (_ BitVec 32) Int) ListLongMap!10749)

(assert (=> b!904597 (= res!610032 (contains!4448 (getCurrentListMap!2659 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904598 () Bool)

(declare-fun res!610035 () Bool)

(assert (=> b!904598 (=> (not res!610035) (not e!506941))))

(declare-datatypes ((List!17904 0))(
  ( (Nil!17901) (Cons!17900 (h!19052 (_ BitVec 64)) (t!25279 List!17904)) )
))
(declare-fun arrayNoDuplicates!0 (array!53223 (_ BitVec 32) List!17904) Bool)

(assert (=> b!904598 (= res!610035 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17901))))

(declare-fun b!904599 () Bool)

(declare-fun res!610039 () Bool)

(assert (=> b!904599 (=> (not res!610039) (not e!506941))))

(assert (=> b!904599 (= res!610039 (and (= (size!26025 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26026 _keys!1386) (size!26025 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904600 () Bool)

(declare-fun e!506943 () Bool)

(assert (=> b!904600 (= e!506943 true)))

(declare-fun lt!408407 () V!29719)

(declare-fun lt!408408 () ListLongMap!10749)

(declare-fun apply!420 (ListLongMap!10749 (_ BitVec 64)) V!29719)

(assert (=> b!904600 (= lt!408407 (apply!420 lt!408408 k0!1033))))

(declare-fun b!904601 () Bool)

(assert (=> b!904601 (= e!506938 tp_is_empty!18565)))

(declare-fun res!610033 () Bool)

(assert (=> start!77730 (=> (not res!610033) (not e!506941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77730 (= res!610033 (validMask!0 mask!1756))))

(assert (=> start!77730 e!506941))

(declare-fun array_inv!20096 (array!53221) Bool)

(assert (=> start!77730 (and (array_inv!20096 _values!1152) e!506939)))

(assert (=> start!77730 tp!56703))

(assert (=> start!77730 true))

(assert (=> start!77730 tp_is_empty!18565))

(declare-fun array_inv!20097 (array!53223) Bool)

(assert (=> start!77730 (array_inv!20097 _keys!1386)))

(declare-fun b!904592 () Bool)

(assert (=> b!904592 (= e!506942 e!506943)))

(declare-fun res!610031 () Bool)

(assert (=> b!904592 (=> res!610031 e!506943)))

(assert (=> b!904592 (= res!610031 (not (contains!4448 lt!408408 k0!1033)))))

(assert (=> b!904592 (= lt!408408 (getCurrentListMap!2659 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and start!77730 res!610033) b!904599))

(assert (= (and b!904599 res!610039) b!904594))

(assert (= (and b!904594 res!610037) b!904598))

(assert (= (and b!904598 res!610035) b!904597))

(assert (= (and b!904597 res!610032) b!904590))

(assert (= (and b!904590 res!610038) b!904591))

(assert (= (and b!904591 res!610034) b!904595))

(assert (= (and b!904595 (not res!610036)) b!904592))

(assert (= (and b!904592 (not res!610031)) b!904600))

(assert (= (and b!904593 condMapEmpty!29560) mapIsEmpty!29560))

(assert (= (and b!904593 (not condMapEmpty!29560)) mapNonEmpty!29560))

(get-info :version)

(assert (= (and mapNonEmpty!29560 ((_ is ValueCellFull!8801) mapValue!29560)) b!904596))

(assert (= (and b!904593 ((_ is ValueCellFull!8801) mapDefault!29560)) b!904601))

(assert (= start!77730 b!904593))

(declare-fun m!840599 () Bool)

(assert (=> b!904595 m!840599))

(declare-fun m!840601 () Bool)

(assert (=> b!904595 m!840601))

(declare-fun m!840603 () Bool)

(assert (=> start!77730 m!840603))

(declare-fun m!840605 () Bool)

(assert (=> start!77730 m!840605))

(declare-fun m!840607 () Bool)

(assert (=> start!77730 m!840607))

(declare-fun m!840609 () Bool)

(assert (=> b!904597 m!840609))

(assert (=> b!904597 m!840609))

(declare-fun m!840611 () Bool)

(assert (=> b!904597 m!840611))

(declare-fun m!840613 () Bool)

(assert (=> b!904594 m!840613))

(declare-fun m!840615 () Bool)

(assert (=> b!904590 m!840615))

(declare-fun m!840617 () Bool)

(assert (=> mapNonEmpty!29560 m!840617))

(declare-fun m!840619 () Bool)

(assert (=> b!904591 m!840619))

(declare-fun m!840621 () Bool)

(assert (=> b!904600 m!840621))

(declare-fun m!840623 () Bool)

(assert (=> b!904598 m!840623))

(declare-fun m!840625 () Bool)

(assert (=> b!904592 m!840625))

(declare-fun m!840627 () Bool)

(assert (=> b!904592 m!840627))

(check-sat (not b!904600) b_and!26523 (not b!904592) (not b!904595) (not b!904598) (not b!904594) (not mapNonEmpty!29560) tp_is_empty!18565 (not b!904590) (not start!77730) (not b!904597) (not b_next!16147))
(check-sat b_and!26523 (not b_next!16147))
