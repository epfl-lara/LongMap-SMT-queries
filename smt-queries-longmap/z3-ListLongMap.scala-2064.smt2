; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35538 () Bool)

(assert start!35538)

(declare-fun b!356020 () Bool)

(declare-fun res!197549 () Bool)

(declare-fun e!218156 () Bool)

(assert (=> b!356020 (=> (not res!197549) (not e!218156))))

(declare-datatypes ((array!19569 0))(
  ( (array!19570 (arr!9278 (Array (_ BitVec 32) (_ BitVec 64))) (size!9631 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19569)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356020 (= res!197549 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356021 () Bool)

(declare-fun e!218157 () Bool)

(declare-fun tp_is_empty!8005 () Bool)

(assert (=> b!356021 (= e!218157 tp_is_empty!8005)))

(declare-fun b!356022 () Bool)

(assert (=> b!356022 (= e!218156 (not true))))

(assert (=> b!356022 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11651 0))(
  ( (V!11652 (val!4047 Int)) )
))
(declare-fun minValue!1150 () V!11651)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!10952 0))(
  ( (Unit!10953) )
))
(declare-fun lt!165688 () Unit!10952)

(declare-datatypes ((ValueCell!3659 0))(
  ( (ValueCellFull!3659 (v!6235 V!11651)) (EmptyCell!3659) )
))
(declare-datatypes ((array!19571 0))(
  ( (array!19572 (arr!9279 (Array (_ BitVec 32) ValueCell!3659)) (size!9632 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19571)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11651)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!3 (array!19569 array!19571 (_ BitVec 32) (_ BitVec 32) V!11651 V!11651 (_ BitVec 64) (_ BitVec 32)) Unit!10952)

(assert (=> b!356022 (= lt!165688 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!3 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356023 () Bool)

(declare-fun res!197552 () Bool)

(assert (=> b!356023 (=> (not res!197552) (not e!218156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19569 (_ BitVec 32)) Bool)

(assert (=> b!356023 (= res!197552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!197553 () Bool)

(assert (=> start!35538 (=> (not res!197553) (not e!218156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35538 (= res!197553 (validMask!0 mask!1842))))

(assert (=> start!35538 e!218156))

(assert (=> start!35538 tp_is_empty!8005))

(assert (=> start!35538 true))

(declare-fun array_inv!6860 (array!19569) Bool)

(assert (=> start!35538 (array_inv!6860 _keys!1456)))

(declare-fun e!218160 () Bool)

(declare-fun array_inv!6861 (array!19571) Bool)

(assert (=> start!35538 (and (array_inv!6861 _values!1208) e!218160)))

(declare-fun b!356024 () Bool)

(declare-fun res!197554 () Bool)

(assert (=> b!356024 (=> (not res!197554) (not e!218156))))

(assert (=> b!356024 (= res!197554 (and (= (size!9632 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9631 _keys!1456) (size!9632 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356025 () Bool)

(declare-fun e!218158 () Bool)

(declare-fun mapRes!13515 () Bool)

(assert (=> b!356025 (= e!218160 (and e!218158 mapRes!13515))))

(declare-fun condMapEmpty!13515 () Bool)

(declare-fun mapDefault!13515 () ValueCell!3659)

(assert (=> b!356025 (= condMapEmpty!13515 (= (arr!9279 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3659)) mapDefault!13515)))))

(declare-fun mapNonEmpty!13515 () Bool)

(declare-fun tp!27492 () Bool)

(assert (=> mapNonEmpty!13515 (= mapRes!13515 (and tp!27492 e!218157))))

(declare-fun mapRest!13515 () (Array (_ BitVec 32) ValueCell!3659))

(declare-fun mapValue!13515 () ValueCell!3659)

(declare-fun mapKey!13515 () (_ BitVec 32))

(assert (=> mapNonEmpty!13515 (= (arr!9279 _values!1208) (store mapRest!13515 mapKey!13515 mapValue!13515))))

(declare-fun b!356026 () Bool)

(declare-fun res!197551 () Bool)

(assert (=> b!356026 (=> (not res!197551) (not e!218156))))

(assert (=> b!356026 (= res!197551 (not (= (select (arr!9278 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356027 () Bool)

(declare-fun res!197547 () Bool)

(assert (=> b!356027 (=> (not res!197547) (not e!218156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356027 (= res!197547 (validKeyInArray!0 k0!1077))))

(declare-fun b!356028 () Bool)

(assert (=> b!356028 (= e!218158 tp_is_empty!8005)))

(declare-fun mapIsEmpty!13515 () Bool)

(assert (=> mapIsEmpty!13515 mapRes!13515))

(declare-fun b!356029 () Bool)

(declare-fun res!197550 () Bool)

(assert (=> b!356029 (=> (not res!197550) (not e!218156))))

(declare-datatypes ((List!5335 0))(
  ( (Nil!5332) (Cons!5331 (h!6187 (_ BitVec 64)) (t!10476 List!5335)) )
))
(declare-fun arrayNoDuplicates!0 (array!19569 (_ BitVec 32) List!5335) Bool)

(assert (=> b!356029 (= res!197550 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5332))))

(declare-fun b!356030 () Bool)

(declare-fun res!197548 () Bool)

(assert (=> b!356030 (=> (not res!197548) (not e!218156))))

(assert (=> b!356030 (= res!197548 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9631 _keys!1456))))))

(assert (= (and start!35538 res!197553) b!356024))

(assert (= (and b!356024 res!197554) b!356023))

(assert (= (and b!356023 res!197552) b!356029))

(assert (= (and b!356029 res!197550) b!356027))

(assert (= (and b!356027 res!197547) b!356030))

(assert (= (and b!356030 res!197548) b!356020))

(assert (= (and b!356020 res!197549) b!356026))

(assert (= (and b!356026 res!197551) b!356022))

(assert (= (and b!356025 condMapEmpty!13515) mapIsEmpty!13515))

(assert (= (and b!356025 (not condMapEmpty!13515)) mapNonEmpty!13515))

(get-info :version)

(assert (= (and mapNonEmpty!13515 ((_ is ValueCellFull!3659) mapValue!13515)) b!356021))

(assert (= (and b!356025 ((_ is ValueCellFull!3659) mapDefault!13515)) b!356028))

(assert (= start!35538 b!356025))

(declare-fun m!354009 () Bool)

(assert (=> b!356029 m!354009))

(declare-fun m!354011 () Bool)

(assert (=> b!356026 m!354011))

(declare-fun m!354013 () Bool)

(assert (=> b!356022 m!354013))

(declare-fun m!354015 () Bool)

(assert (=> b!356022 m!354015))

(declare-fun m!354017 () Bool)

(assert (=> start!35538 m!354017))

(declare-fun m!354019 () Bool)

(assert (=> start!35538 m!354019))

(declare-fun m!354021 () Bool)

(assert (=> start!35538 m!354021))

(declare-fun m!354023 () Bool)

(assert (=> mapNonEmpty!13515 m!354023))

(declare-fun m!354025 () Bool)

(assert (=> b!356020 m!354025))

(declare-fun m!354027 () Bool)

(assert (=> b!356023 m!354027))

(declare-fun m!354029 () Bool)

(assert (=> b!356027 m!354029))

(check-sat (not mapNonEmpty!13515) (not b!356027) (not b!356029) (not b!356022) (not start!35538) tp_is_empty!8005 (not b!356020) (not b!356023))
(check-sat)
