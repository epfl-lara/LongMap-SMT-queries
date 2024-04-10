; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35590 () Bool)

(assert start!35590)

(declare-fun b!356922 () Bool)

(declare-fun res!198132 () Bool)

(declare-fun e!218620 () Bool)

(assert (=> b!356922 (=> (not res!198132) (not e!218620))))

(declare-datatypes ((array!19655 0))(
  ( (array!19656 (arr!9321 (Array (_ BitVec 32) (_ BitVec 64))) (size!9673 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19655)

(declare-datatypes ((List!5381 0))(
  ( (Nil!5378) (Cons!5377 (h!6233 (_ BitVec 64)) (t!10531 List!5381)) )
))
(declare-fun arrayNoDuplicates!0 (array!19655 (_ BitVec 32) List!5381) Bool)

(assert (=> b!356922 (= res!198132 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5378))))

(declare-fun res!198136 () Bool)

(assert (=> start!35590 (=> (not res!198136) (not e!218620))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35590 (= res!198136 (validMask!0 mask!1842))))

(assert (=> start!35590 e!218620))

(declare-fun tp_is_empty!8043 () Bool)

(assert (=> start!35590 tp_is_empty!8043))

(assert (=> start!35590 true))

(declare-fun array_inv!6854 (array!19655) Bool)

(assert (=> start!35590 (array_inv!6854 _keys!1456)))

(declare-datatypes ((V!11701 0))(
  ( (V!11702 (val!4066 Int)) )
))
(declare-datatypes ((ValueCell!3678 0))(
  ( (ValueCellFull!3678 (v!6260 V!11701)) (EmptyCell!3678) )
))
(declare-datatypes ((array!19657 0))(
  ( (array!19658 (arr!9322 (Array (_ BitVec 32) ValueCell!3678)) (size!9674 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19657)

(declare-fun e!218617 () Bool)

(declare-fun array_inv!6855 (array!19657) Bool)

(assert (=> start!35590 (and (array_inv!6855 _values!1208) e!218617)))

(declare-fun b!356923 () Bool)

(declare-fun res!198135 () Bool)

(assert (=> b!356923 (=> (not res!198135) (not e!218620))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!356923 (= res!198135 (not (= (select (arr!9321 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapIsEmpty!13572 () Bool)

(declare-fun mapRes!13572 () Bool)

(assert (=> mapIsEmpty!13572 mapRes!13572))

(declare-fun b!356924 () Bool)

(declare-fun res!198137 () Bool)

(assert (=> b!356924 (=> (not res!198137) (not e!218620))))

(assert (=> b!356924 (= res!198137 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9673 _keys!1456))))))

(declare-fun b!356925 () Bool)

(declare-fun e!218619 () Bool)

(assert (=> b!356925 (= e!218617 (and e!218619 mapRes!13572))))

(declare-fun condMapEmpty!13572 () Bool)

(declare-fun mapDefault!13572 () ValueCell!3678)

(assert (=> b!356925 (= condMapEmpty!13572 (= (arr!9322 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3678)) mapDefault!13572)))))

(declare-fun b!356926 () Bool)

(declare-fun res!198138 () Bool)

(assert (=> b!356926 (=> (not res!198138) (not e!218620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19655 (_ BitVec 32)) Bool)

(assert (=> b!356926 (= res!198138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356927 () Bool)

(declare-fun res!198139 () Bool)

(assert (=> b!356927 (=> (not res!198139) (not e!218620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356927 (= res!198139 (validKeyInArray!0 k0!1077))))

(declare-fun mapNonEmpty!13572 () Bool)

(declare-fun tp!27549 () Bool)

(declare-fun e!218618 () Bool)

(assert (=> mapNonEmpty!13572 (= mapRes!13572 (and tp!27549 e!218618))))

(declare-fun mapValue!13572 () ValueCell!3678)

(declare-fun mapKey!13572 () (_ BitVec 32))

(declare-fun mapRest!13572 () (Array (_ BitVec 32) ValueCell!3678))

(assert (=> mapNonEmpty!13572 (= (arr!9322 _values!1208) (store mapRest!13572 mapKey!13572 mapValue!13572))))

(declare-fun b!356928 () Bool)

(assert (=> b!356928 (= e!218618 tp_is_empty!8043)))

(declare-fun b!356929 () Bool)

(assert (=> b!356929 (= e!218619 tp_is_empty!8043)))

(declare-fun b!356930 () Bool)

(assert (=> b!356930 (= e!218620 (not true))))

(declare-fun arrayContainsKey!0 (array!19655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356930 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11701)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11701)

(declare-datatypes ((Unit!10992 0))(
  ( (Unit!10993) )
))
(declare-fun lt!165980 () Unit!10992)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!15 (array!19655 array!19657 (_ BitVec 32) (_ BitVec 32) V!11701 V!11701 (_ BitVec 64) (_ BitVec 32)) Unit!10992)

(assert (=> b!356930 (= lt!165980 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!15 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356931 () Bool)

(declare-fun res!198133 () Bool)

(assert (=> b!356931 (=> (not res!198133) (not e!218620))))

(assert (=> b!356931 (= res!198133 (and (= (size!9674 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9673 _keys!1456) (size!9674 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356932 () Bool)

(declare-fun res!198134 () Bool)

(assert (=> b!356932 (=> (not res!198134) (not e!218620))))

(assert (=> b!356932 (= res!198134 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(assert (= (and start!35590 res!198136) b!356931))

(assert (= (and b!356931 res!198133) b!356926))

(assert (= (and b!356926 res!198138) b!356922))

(assert (= (and b!356922 res!198132) b!356927))

(assert (= (and b!356927 res!198139) b!356924))

(assert (= (and b!356924 res!198137) b!356932))

(assert (= (and b!356932 res!198134) b!356923))

(assert (= (and b!356923 res!198135) b!356930))

(assert (= (and b!356925 condMapEmpty!13572) mapIsEmpty!13572))

(assert (= (and b!356925 (not condMapEmpty!13572)) mapNonEmpty!13572))

(get-info :version)

(assert (= (and mapNonEmpty!13572 ((_ is ValueCellFull!3678) mapValue!13572)) b!356928))

(assert (= (and b!356925 ((_ is ValueCellFull!3678) mapDefault!13572)) b!356929))

(assert (= start!35590 b!356925))

(declare-fun m!355157 () Bool)

(assert (=> b!356923 m!355157))

(declare-fun m!355159 () Bool)

(assert (=> start!35590 m!355159))

(declare-fun m!355161 () Bool)

(assert (=> start!35590 m!355161))

(declare-fun m!355163 () Bool)

(assert (=> start!35590 m!355163))

(declare-fun m!355165 () Bool)

(assert (=> b!356930 m!355165))

(declare-fun m!355167 () Bool)

(assert (=> b!356930 m!355167))

(declare-fun m!355169 () Bool)

(assert (=> b!356922 m!355169))

(declare-fun m!355171 () Bool)

(assert (=> mapNonEmpty!13572 m!355171))

(declare-fun m!355173 () Bool)

(assert (=> b!356932 m!355173))

(declare-fun m!355175 () Bool)

(assert (=> b!356926 m!355175))

(declare-fun m!355177 () Bool)

(assert (=> b!356927 m!355177))

(check-sat (not b!356932) (not b!356930) (not b!356927) (not b!356922) (not b!356926) tp_is_empty!8043 (not start!35590) (not mapNonEmpty!13572))
(check-sat)
