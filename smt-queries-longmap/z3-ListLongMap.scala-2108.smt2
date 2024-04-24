; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35802 () Bool)

(assert start!35802)

(declare-fun b!359734 () Bool)

(declare-fun res!199977 () Bool)

(declare-fun e!220362 () Bool)

(assert (=> b!359734 (=> (not res!199977) (not e!220362))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359734 (= res!199977 (validKeyInArray!0 k0!1077))))

(declare-fun b!359735 () Bool)

(declare-fun res!199983 () Bool)

(assert (=> b!359735 (=> (not res!199983) (not e!220362))))

(declare-datatypes ((array!20072 0))(
  ( (array!20073 (arr!9529 (Array (_ BitVec 32) (_ BitVec 64))) (size!9881 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20072)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359735 (= res!199983 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!359736 () Bool)

(declare-fun res!199981 () Bool)

(assert (=> b!359736 (=> (not res!199981) (not e!220362))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20072 (_ BitVec 32)) Bool)

(assert (=> b!359736 (= res!199981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359737 () Bool)

(declare-fun res!199984 () Bool)

(assert (=> b!359737 (=> (not res!199984) (not e!220362))))

(assert (=> b!359737 (= res!199984 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9881 _keys!1456))))))

(declare-fun b!359738 () Bool)

(declare-fun res!199982 () Bool)

(assert (=> b!359738 (=> (not res!199982) (not e!220362))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!12003 0))(
  ( (V!12004 (val!4179 Int)) )
))
(declare-datatypes ((ValueCell!3791 0))(
  ( (ValueCellFull!3791 (v!6374 V!12003)) (EmptyCell!3791) )
))
(declare-datatypes ((array!20074 0))(
  ( (array!20075 (arr!9530 (Array (_ BitVec 32) ValueCell!3791)) (size!9882 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20074)

(assert (=> b!359738 (= res!199982 (and (= (size!9882 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9881 _keys!1456) (size!9882 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359739 () Bool)

(declare-fun e!220361 () Bool)

(declare-fun tp_is_empty!8269 () Bool)

(assert (=> b!359739 (= e!220361 tp_is_empty!8269)))

(declare-fun b!359740 () Bool)

(declare-fun res!199980 () Bool)

(assert (=> b!359740 (=> (not res!199980) (not e!220362))))

(declare-datatypes ((List!5387 0))(
  ( (Nil!5384) (Cons!5383 (h!6239 (_ BitVec 64)) (t!10529 List!5387)) )
))
(declare-fun arrayNoDuplicates!0 (array!20072 (_ BitVec 32) List!5387) Bool)

(assert (=> b!359740 (= res!199980 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5384))))

(declare-fun b!359741 () Bool)

(declare-fun e!220363 () Bool)

(declare-fun mapRes!13911 () Bool)

(assert (=> b!359741 (= e!220363 (and e!220361 mapRes!13911))))

(declare-fun condMapEmpty!13911 () Bool)

(declare-fun mapDefault!13911 () ValueCell!3791)

(assert (=> b!359741 (= condMapEmpty!13911 (= (arr!9530 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3791)) mapDefault!13911)))))

(declare-fun res!199979 () Bool)

(assert (=> start!35802 (=> (not res!199979) (not e!220362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35802 (= res!199979 (validMask!0 mask!1842))))

(assert (=> start!35802 e!220362))

(assert (=> start!35802 tp_is_empty!8269))

(assert (=> start!35802 true))

(declare-fun array_inv!7046 (array!20072) Bool)

(assert (=> start!35802 (array_inv!7046 _keys!1456)))

(declare-fun array_inv!7047 (array!20074) Bool)

(assert (=> start!35802 (and (array_inv!7047 _values!1208) e!220363)))

(declare-fun b!359742 () Bool)

(declare-fun e!220360 () Bool)

(assert (=> b!359742 (= e!220360 tp_is_empty!8269)))

(declare-fun b!359743 () Bool)

(assert (=> b!359743 (= e!220362 (not true))))

(assert (=> b!359743 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12003)

(declare-datatypes ((Unit!11045 0))(
  ( (Unit!11046) )
))
(declare-fun lt!166409 () Unit!11045)

(declare-fun zeroValue!1150 () V!12003)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!44 (array!20072 array!20074 (_ BitVec 32) (_ BitVec 32) V!12003 V!12003 (_ BitVec 64) (_ BitVec 32)) Unit!11045)

(assert (=> b!359743 (= lt!166409 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!44 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13911 () Bool)

(assert (=> mapIsEmpty!13911 mapRes!13911))

(declare-fun mapNonEmpty!13911 () Bool)

(declare-fun tp!27978 () Bool)

(assert (=> mapNonEmpty!13911 (= mapRes!13911 (and tp!27978 e!220360))))

(declare-fun mapKey!13911 () (_ BitVec 32))

(declare-fun mapValue!13911 () ValueCell!3791)

(declare-fun mapRest!13911 () (Array (_ BitVec 32) ValueCell!3791))

(assert (=> mapNonEmpty!13911 (= (arr!9530 _values!1208) (store mapRest!13911 mapKey!13911 mapValue!13911))))

(declare-fun b!359744 () Bool)

(declare-fun res!199978 () Bool)

(assert (=> b!359744 (=> (not res!199978) (not e!220362))))

(assert (=> b!359744 (= res!199978 (not (= (select (arr!9529 _keys!1456) from!1805) k0!1077)))))

(assert (= (and start!35802 res!199979) b!359738))

(assert (= (and b!359738 res!199982) b!359736))

(assert (= (and b!359736 res!199981) b!359740))

(assert (= (and b!359740 res!199980) b!359734))

(assert (= (and b!359734 res!199977) b!359737))

(assert (= (and b!359737 res!199984) b!359735))

(assert (= (and b!359735 res!199983) b!359744))

(assert (= (and b!359744 res!199978) b!359743))

(assert (= (and b!359741 condMapEmpty!13911) mapIsEmpty!13911))

(assert (= (and b!359741 (not condMapEmpty!13911)) mapNonEmpty!13911))

(get-info :version)

(assert (= (and mapNonEmpty!13911 ((_ is ValueCellFull!3791) mapValue!13911)) b!359742))

(assert (= (and b!359741 ((_ is ValueCellFull!3791) mapDefault!13911)) b!359739))

(assert (= start!35802 b!359741))

(declare-fun m!357393 () Bool)

(assert (=> start!35802 m!357393))

(declare-fun m!357395 () Bool)

(assert (=> start!35802 m!357395))

(declare-fun m!357397 () Bool)

(assert (=> start!35802 m!357397))

(declare-fun m!357399 () Bool)

(assert (=> b!359744 m!357399))

(declare-fun m!357401 () Bool)

(assert (=> b!359734 m!357401))

(declare-fun m!357403 () Bool)

(assert (=> b!359735 m!357403))

(declare-fun m!357405 () Bool)

(assert (=> b!359736 m!357405))

(declare-fun m!357407 () Bool)

(assert (=> mapNonEmpty!13911 m!357407))

(declare-fun m!357409 () Bool)

(assert (=> b!359740 m!357409))

(declare-fun m!357411 () Bool)

(assert (=> b!359743 m!357411))

(declare-fun m!357413 () Bool)

(assert (=> b!359743 m!357413))

(check-sat (not mapNonEmpty!13911) (not start!35802) tp_is_empty!8269 (not b!359740) (not b!359736) (not b!359743) (not b!359735) (not b!359734))
(check-sat)
