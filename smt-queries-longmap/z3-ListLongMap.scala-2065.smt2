; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35544 () Bool)

(assert start!35544)

(declare-fun b!356119 () Bool)

(declare-fun e!218203 () Bool)

(declare-fun tp_is_empty!8011 () Bool)

(assert (=> b!356119 (= e!218203 tp_is_empty!8011)))

(declare-fun b!356120 () Bool)

(declare-fun res!197625 () Bool)

(declare-fun e!218205 () Bool)

(assert (=> b!356120 (=> (not res!197625) (not e!218205))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19581 0))(
  ( (array!19582 (arr!9284 (Array (_ BitVec 32) (_ BitVec 64))) (size!9637 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19581)

(assert (=> b!356120 (= res!197625 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9637 _keys!1456))))))

(declare-fun res!197622 () Bool)

(assert (=> start!35544 (=> (not res!197622) (not e!218205))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35544 (= res!197622 (validMask!0 mask!1842))))

(assert (=> start!35544 e!218205))

(assert (=> start!35544 tp_is_empty!8011))

(assert (=> start!35544 true))

(declare-fun array_inv!6864 (array!19581) Bool)

(assert (=> start!35544 (array_inv!6864 _keys!1456)))

(declare-datatypes ((V!11659 0))(
  ( (V!11660 (val!4050 Int)) )
))
(declare-datatypes ((ValueCell!3662 0))(
  ( (ValueCellFull!3662 (v!6238 V!11659)) (EmptyCell!3662) )
))
(declare-datatypes ((array!19583 0))(
  ( (array!19584 (arr!9285 (Array (_ BitVec 32) ValueCell!3662)) (size!9638 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19583)

(declare-fun e!218202 () Bool)

(declare-fun array_inv!6865 (array!19583) Bool)

(assert (=> start!35544 (and (array_inv!6865 _values!1208) e!218202)))

(declare-fun mapIsEmpty!13524 () Bool)

(declare-fun mapRes!13524 () Bool)

(assert (=> mapIsEmpty!13524 mapRes!13524))

(declare-fun mapNonEmpty!13524 () Bool)

(declare-fun tp!27501 () Bool)

(declare-fun e!218204 () Bool)

(assert (=> mapNonEmpty!13524 (= mapRes!13524 (and tp!27501 e!218204))))

(declare-fun mapKey!13524 () (_ BitVec 32))

(declare-fun mapRest!13524 () (Array (_ BitVec 32) ValueCell!3662))

(declare-fun mapValue!13524 () ValueCell!3662)

(assert (=> mapNonEmpty!13524 (= (arr!9285 _values!1208) (store mapRest!13524 mapKey!13524 mapValue!13524))))

(declare-fun b!356121 () Bool)

(declare-fun res!197620 () Bool)

(assert (=> b!356121 (=> (not res!197620) (not e!218205))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356121 (= res!197620 (validKeyInArray!0 k0!1077))))

(declare-fun b!356122 () Bool)

(declare-fun res!197623 () Bool)

(assert (=> b!356122 (=> (not res!197623) (not e!218205))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356122 (= res!197623 (and (= (size!9638 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9637 _keys!1456) (size!9638 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356123 () Bool)

(declare-fun res!197626 () Bool)

(assert (=> b!356123 (=> (not res!197626) (not e!218205))))

(declare-datatypes ((List!5336 0))(
  ( (Nil!5333) (Cons!5332 (h!6188 (_ BitVec 64)) (t!10477 List!5336)) )
))
(declare-fun arrayNoDuplicates!0 (array!19581 (_ BitVec 32) List!5336) Bool)

(assert (=> b!356123 (= res!197626 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5333))))

(declare-fun b!356124 () Bool)

(assert (=> b!356124 (= e!218204 tp_is_empty!8011)))

(declare-fun b!356125 () Bool)

(assert (=> b!356125 (= e!218202 (and e!218203 mapRes!13524))))

(declare-fun condMapEmpty!13524 () Bool)

(declare-fun mapDefault!13524 () ValueCell!3662)

(assert (=> b!356125 (= condMapEmpty!13524 (= (arr!9285 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3662)) mapDefault!13524)))))

(declare-fun b!356126 () Bool)

(declare-fun res!197624 () Bool)

(assert (=> b!356126 (=> (not res!197624) (not e!218205))))

(assert (=> b!356126 (= res!197624 (not (= (select (arr!9284 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356127 () Bool)

(declare-fun res!197619 () Bool)

(assert (=> b!356127 (=> (not res!197619) (not e!218205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19581 (_ BitVec 32)) Bool)

(assert (=> b!356127 (= res!197619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356128 () Bool)

(declare-fun res!197621 () Bool)

(assert (=> b!356128 (=> (not res!197621) (not e!218205))))

(declare-fun arrayContainsKey!0 (array!19581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356128 (= res!197621 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356129 () Bool)

(assert (=> b!356129 (= e!218205 (not true))))

(assert (=> b!356129 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11659)

(declare-datatypes ((Unit!10958 0))(
  ( (Unit!10959) )
))
(declare-fun lt!165697 () Unit!10958)

(declare-fun zeroValue!1150 () V!11659)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!6 (array!19581 array!19583 (_ BitVec 32) (_ BitVec 32) V!11659 V!11659 (_ BitVec 64) (_ BitVec 32)) Unit!10958)

(assert (=> b!356129 (= lt!165697 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!6 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(assert (= (and start!35544 res!197622) b!356122))

(assert (= (and b!356122 res!197623) b!356127))

(assert (= (and b!356127 res!197619) b!356123))

(assert (= (and b!356123 res!197626) b!356121))

(assert (= (and b!356121 res!197620) b!356120))

(assert (= (and b!356120 res!197625) b!356128))

(assert (= (and b!356128 res!197621) b!356126))

(assert (= (and b!356126 res!197624) b!356129))

(assert (= (and b!356125 condMapEmpty!13524) mapIsEmpty!13524))

(assert (= (and b!356125 (not condMapEmpty!13524)) mapNonEmpty!13524))

(get-info :version)

(assert (= (and mapNonEmpty!13524 ((_ is ValueCellFull!3662) mapValue!13524)) b!356124))

(assert (= (and b!356125 ((_ is ValueCellFull!3662) mapDefault!13524)) b!356119))

(assert (= start!35544 b!356125))

(declare-fun m!354075 () Bool)

(assert (=> b!356126 m!354075))

(declare-fun m!354077 () Bool)

(assert (=> mapNonEmpty!13524 m!354077))

(declare-fun m!354079 () Bool)

(assert (=> b!356129 m!354079))

(declare-fun m!354081 () Bool)

(assert (=> b!356129 m!354081))

(declare-fun m!354083 () Bool)

(assert (=> b!356128 m!354083))

(declare-fun m!354085 () Bool)

(assert (=> b!356123 m!354085))

(declare-fun m!354087 () Bool)

(assert (=> b!356127 m!354087))

(declare-fun m!354089 () Bool)

(assert (=> b!356121 m!354089))

(declare-fun m!354091 () Bool)

(assert (=> start!35544 m!354091))

(declare-fun m!354093 () Bool)

(assert (=> start!35544 m!354093))

(declare-fun m!354095 () Bool)

(assert (=> start!35544 m!354095))

(check-sat (not b!356127) (not b!356121) (not b!356129) (not b!356128) (not start!35544) (not mapNonEmpty!13524) (not b!356123) tp_is_empty!8011)
(check-sat)
