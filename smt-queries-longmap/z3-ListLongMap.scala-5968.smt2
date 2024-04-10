; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77636 () Bool)

(assert start!77636)

(declare-fun b_free!16221 () Bool)

(declare-fun b_next!16221 () Bool)

(assert (=> start!77636 (= b_free!16221 (not b_next!16221))))

(declare-fun tp!56925 () Bool)

(declare-fun b_and!26595 () Bool)

(assert (=> start!77636 (= tp!56925 b_and!26595)))

(declare-fun b!905041 () Bool)

(declare-fun res!610707 () Bool)

(declare-fun e!507147 () Bool)

(assert (=> b!905041 (=> (not res!610707) (not e!507147))))

(declare-datatypes ((array!53322 0))(
  ( (array!53323 (arr!25620 (Array (_ BitVec 32) (_ BitVec 64))) (size!26079 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53322)

(declare-datatypes ((List!17995 0))(
  ( (Nil!17992) (Cons!17991 (h!19137 (_ BitVec 64)) (t!25388 List!17995)) )
))
(declare-fun arrayNoDuplicates!0 (array!53322 (_ BitVec 32) List!17995) Bool)

(assert (=> b!905041 (= res!610707 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17992))))

(declare-fun b!905042 () Bool)

(declare-fun e!507153 () Bool)

(declare-fun e!507152 () Bool)

(declare-fun mapRes!29671 () Bool)

(assert (=> b!905042 (= e!507153 (and e!507152 mapRes!29671))))

(declare-fun condMapEmpty!29671 () Bool)

(declare-datatypes ((V!29817 0))(
  ( (V!29818 (val!9370 Int)) )
))
(declare-datatypes ((ValueCell!8838 0))(
  ( (ValueCellFull!8838 (v!11875 V!29817)) (EmptyCell!8838) )
))
(declare-datatypes ((array!53324 0))(
  ( (array!53325 (arr!25621 (Array (_ BitVec 32) ValueCell!8838)) (size!26080 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53324)

(declare-fun mapDefault!29671 () ValueCell!8838)

(assert (=> b!905042 (= condMapEmpty!29671 (= (arr!25621 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8838)) mapDefault!29671)))))

(declare-fun res!610701 () Bool)

(assert (=> start!77636 (=> (not res!610701) (not e!507147))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77636 (= res!610701 (validMask!0 mask!1756))))

(assert (=> start!77636 e!507147))

(declare-fun array_inv!20072 (array!53324) Bool)

(assert (=> start!77636 (and (array_inv!20072 _values!1152) e!507153)))

(assert (=> start!77636 tp!56925))

(assert (=> start!77636 true))

(declare-fun tp_is_empty!18639 () Bool)

(assert (=> start!77636 tp_is_empty!18639))

(declare-fun array_inv!20073 (array!53322) Bool)

(assert (=> start!77636 (array_inv!20073 _keys!1386)))

(declare-fun b!905043 () Bool)

(declare-fun res!610706 () Bool)

(assert (=> b!905043 (=> (not res!610706) (not e!507147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53322 (_ BitVec 32)) Bool)

(assert (=> b!905043 (= res!610706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905044 () Bool)

(declare-fun e!507146 () Bool)

(declare-fun e!507148 () Bool)

(assert (=> b!905044 (= e!507146 e!507148)))

(declare-fun res!610700 () Bool)

(assert (=> b!905044 (=> res!610700 e!507148)))

(declare-datatypes ((tuple2!12182 0))(
  ( (tuple2!12183 (_1!6102 (_ BitVec 64)) (_2!6102 V!29817)) )
))
(declare-datatypes ((List!17996 0))(
  ( (Nil!17993) (Cons!17992 (h!19138 tuple2!12182) (t!25389 List!17996)) )
))
(declare-datatypes ((ListLongMap!10879 0))(
  ( (ListLongMap!10880 (toList!5455 List!17996)) )
))
(declare-fun lt!408410 () ListLongMap!10879)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4501 (ListLongMap!10879 (_ BitVec 64)) Bool)

(assert (=> b!905044 (= res!610700 (not (contains!4501 lt!408410 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29817)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29817)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun getCurrentListMap!2722 (array!53322 array!53324 (_ BitVec 32) (_ BitVec 32) V!29817 V!29817 (_ BitVec 32) Int) ListLongMap!10879)

(assert (=> b!905044 (= lt!408410 (getCurrentListMap!2722 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905045 () Bool)

(declare-fun e!507149 () Bool)

(assert (=> b!905045 (= e!507147 e!507149)))

(declare-fun res!610703 () Bool)

(assert (=> b!905045 (=> (not res!610703) (not e!507149))))

(declare-fun lt!408408 () ListLongMap!10879)

(assert (=> b!905045 (= res!610703 (contains!4501 lt!408408 k0!1033))))

(assert (=> b!905045 (= lt!408408 (getCurrentListMap!2722 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905046 () Bool)

(declare-fun res!610705 () Bool)

(assert (=> b!905046 (=> (not res!610705) (not e!507149))))

(assert (=> b!905046 (= res!610705 (and (= (select (arr!25620 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905047 () Bool)

(assert (=> b!905047 (= e!507148 true)))

(declare-fun lt!408407 () V!29817)

(declare-fun apply!446 (ListLongMap!10879 (_ BitVec 64)) V!29817)

(assert (=> b!905047 (= (apply!446 lt!408408 k0!1033) lt!408407)))

(declare-datatypes ((Unit!30702 0))(
  ( (Unit!30703) )
))
(declare-fun lt!408409 () Unit!30702)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!4 (array!53322 array!53324 (_ BitVec 32) (_ BitVec 32) V!29817 V!29817 (_ BitVec 64) V!29817 (_ BitVec 32) Int) Unit!30702)

(assert (=> b!905047 (= lt!408409 (lemmaListMapApplyFromThenApplyFromZero!4 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408407 i!717 defaultEntry!1160))))

(declare-fun b!905048 () Bool)

(declare-fun e!507150 () Bool)

(assert (=> b!905048 (= e!507150 tp_is_empty!18639)))

(declare-fun mapIsEmpty!29671 () Bool)

(assert (=> mapIsEmpty!29671 mapRes!29671))

(declare-fun mapNonEmpty!29671 () Bool)

(declare-fun tp!56924 () Bool)

(assert (=> mapNonEmpty!29671 (= mapRes!29671 (and tp!56924 e!507150))))

(declare-fun mapValue!29671 () ValueCell!8838)

(declare-fun mapKey!29671 () (_ BitVec 32))

(declare-fun mapRest!29671 () (Array (_ BitVec 32) ValueCell!8838))

(assert (=> mapNonEmpty!29671 (= (arr!25621 _values!1152) (store mapRest!29671 mapKey!29671 mapValue!29671))))

(declare-fun b!905049 () Bool)

(declare-fun res!610702 () Bool)

(assert (=> b!905049 (=> (not res!610702) (not e!507149))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905049 (= res!610702 (inRange!0 i!717 mask!1756))))

(declare-fun b!905050 () Bool)

(declare-fun res!610708 () Bool)

(assert (=> b!905050 (=> res!610708 e!507148)))

(assert (=> b!905050 (= res!610708 (not (= (apply!446 lt!408410 k0!1033) lt!408407)))))

(declare-fun b!905051 () Bool)

(assert (=> b!905051 (= e!507152 tp_is_empty!18639)))

(declare-fun b!905052 () Bool)

(declare-fun res!610709 () Bool)

(assert (=> b!905052 (=> (not res!610709) (not e!507147))))

(assert (=> b!905052 (= res!610709 (and (= (size!26080 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26079 _keys!1386) (size!26080 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905053 () Bool)

(assert (=> b!905053 (= e!507149 (not e!507146))))

(declare-fun res!610704 () Bool)

(assert (=> b!905053 (=> res!610704 e!507146)))

(assert (=> b!905053 (= res!610704 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26079 _keys!1386))))))

(declare-fun get!13456 (ValueCell!8838 V!29817) V!29817)

(declare-fun dynLambda!1322 (Int (_ BitVec 64)) V!29817)

(assert (=> b!905053 (= lt!408407 (get!13456 (select (arr!25621 _values!1152) i!717) (dynLambda!1322 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905053 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408411 () Unit!30702)

(declare-fun lemmaKeyInListMapIsInArray!194 (array!53322 array!53324 (_ BitVec 32) (_ BitVec 32) V!29817 V!29817 (_ BitVec 64) Int) Unit!30702)

(assert (=> b!905053 (= lt!408411 (lemmaKeyInListMapIsInArray!194 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (= (and start!77636 res!610701) b!905052))

(assert (= (and b!905052 res!610709) b!905043))

(assert (= (and b!905043 res!610706) b!905041))

(assert (= (and b!905041 res!610707) b!905045))

(assert (= (and b!905045 res!610703) b!905049))

(assert (= (and b!905049 res!610702) b!905046))

(assert (= (and b!905046 res!610705) b!905053))

(assert (= (and b!905053 (not res!610704)) b!905044))

(assert (= (and b!905044 (not res!610700)) b!905050))

(assert (= (and b!905050 (not res!610708)) b!905047))

(assert (= (and b!905042 condMapEmpty!29671) mapIsEmpty!29671))

(assert (= (and b!905042 (not condMapEmpty!29671)) mapNonEmpty!29671))

(get-info :version)

(assert (= (and mapNonEmpty!29671 ((_ is ValueCellFull!8838) mapValue!29671)) b!905048))

(assert (= (and b!905042 ((_ is ValueCellFull!8838) mapDefault!29671)) b!905051))

(assert (= start!77636 b!905042))

(declare-fun b_lambda!13095 () Bool)

(assert (=> (not b_lambda!13095) (not b!905053)))

(declare-fun t!25387 () Bool)

(declare-fun tb!5243 () Bool)

(assert (=> (and start!77636 (= defaultEntry!1160 defaultEntry!1160) t!25387) tb!5243))

(declare-fun result!10281 () Bool)

(assert (=> tb!5243 (= result!10281 tp_is_empty!18639)))

(assert (=> b!905053 t!25387))

(declare-fun b_and!26597 () Bool)

(assert (= b_and!26595 (and (=> t!25387 result!10281) b_and!26597)))

(declare-fun m!840455 () Bool)

(assert (=> b!905047 m!840455))

(declare-fun m!840457 () Bool)

(assert (=> b!905047 m!840457))

(declare-fun m!840459 () Bool)

(assert (=> b!905041 m!840459))

(declare-fun m!840461 () Bool)

(assert (=> start!77636 m!840461))

(declare-fun m!840463 () Bool)

(assert (=> start!77636 m!840463))

(declare-fun m!840465 () Bool)

(assert (=> start!77636 m!840465))

(declare-fun m!840467 () Bool)

(assert (=> b!905053 m!840467))

(declare-fun m!840469 () Bool)

(assert (=> b!905053 m!840469))

(declare-fun m!840471 () Bool)

(assert (=> b!905053 m!840471))

(declare-fun m!840473 () Bool)

(assert (=> b!905053 m!840473))

(assert (=> b!905053 m!840467))

(assert (=> b!905053 m!840471))

(declare-fun m!840475 () Bool)

(assert (=> b!905053 m!840475))

(declare-fun m!840477 () Bool)

(assert (=> b!905043 m!840477))

(declare-fun m!840479 () Bool)

(assert (=> mapNonEmpty!29671 m!840479))

(declare-fun m!840481 () Bool)

(assert (=> b!905049 m!840481))

(declare-fun m!840483 () Bool)

(assert (=> b!905050 m!840483))

(declare-fun m!840485 () Bool)

(assert (=> b!905045 m!840485))

(declare-fun m!840487 () Bool)

(assert (=> b!905045 m!840487))

(declare-fun m!840489 () Bool)

(assert (=> b!905044 m!840489))

(declare-fun m!840491 () Bool)

(assert (=> b!905044 m!840491))

(declare-fun m!840493 () Bool)

(assert (=> b!905046 m!840493))

(check-sat (not mapNonEmpty!29671) tp_is_empty!18639 (not b!905047) (not b!905049) (not b!905045) b_and!26597 (not b!905053) (not b!905041) (not b!905043) (not b_lambda!13095) (not start!77636) (not b!905044) (not b_next!16221) (not b!905050))
(check-sat b_and!26597 (not b_next!16221))
