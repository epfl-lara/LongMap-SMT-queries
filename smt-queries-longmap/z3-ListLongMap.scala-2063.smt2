; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35532 () Bool)

(assert start!35532)

(declare-fun b!355921 () Bool)

(declare-fun res!197480 () Bool)

(declare-fun e!218113 () Bool)

(assert (=> b!355921 (=> (not res!197480) (not e!218113))))

(declare-datatypes ((array!19557 0))(
  ( (array!19558 (arr!9272 (Array (_ BitVec 32) (_ BitVec 64))) (size!9625 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19557)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355921 (= res!197480 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355922 () Bool)

(declare-fun e!218114 () Bool)

(declare-fun tp_is_empty!7999 () Bool)

(assert (=> b!355922 (= e!218114 tp_is_empty!7999)))

(declare-fun b!355923 () Bool)

(declare-fun res!197482 () Bool)

(assert (=> b!355923 (=> (not res!197482) (not e!218113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355923 (= res!197482 (validKeyInArray!0 k0!1077))))

(declare-fun mapNonEmpty!13506 () Bool)

(declare-fun mapRes!13506 () Bool)

(declare-fun tp!27483 () Bool)

(assert (=> mapNonEmpty!13506 (= mapRes!13506 (and tp!27483 e!218114))))

(declare-datatypes ((V!11643 0))(
  ( (V!11644 (val!4044 Int)) )
))
(declare-datatypes ((ValueCell!3656 0))(
  ( (ValueCellFull!3656 (v!6232 V!11643)) (EmptyCell!3656) )
))
(declare-fun mapValue!13506 () ValueCell!3656)

(declare-fun mapRest!13506 () (Array (_ BitVec 32) ValueCell!3656))

(declare-datatypes ((array!19559 0))(
  ( (array!19560 (arr!9273 (Array (_ BitVec 32) ValueCell!3656)) (size!9626 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19559)

(declare-fun mapKey!13506 () (_ BitVec 32))

(assert (=> mapNonEmpty!13506 (= (arr!9273 _values!1208) (store mapRest!13506 mapKey!13506 mapValue!13506))))

(declare-fun b!355925 () Bool)

(declare-fun res!197477 () Bool)

(assert (=> b!355925 (=> (not res!197477) (not e!218113))))

(assert (=> b!355925 (= res!197477 (not (= (select (arr!9272 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!355926 () Bool)

(declare-fun e!218112 () Bool)

(assert (=> b!355926 (= e!218112 tp_is_empty!7999)))

(declare-fun b!355927 () Bool)

(declare-fun res!197476 () Bool)

(assert (=> b!355927 (=> (not res!197476) (not e!218113))))

(declare-datatypes ((List!5333 0))(
  ( (Nil!5330) (Cons!5329 (h!6185 (_ BitVec 64)) (t!10474 List!5333)) )
))
(declare-fun arrayNoDuplicates!0 (array!19557 (_ BitVec 32) List!5333) Bool)

(assert (=> b!355927 (= res!197476 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5330))))

(declare-fun mapIsEmpty!13506 () Bool)

(assert (=> mapIsEmpty!13506 mapRes!13506))

(declare-fun b!355928 () Bool)

(declare-fun res!197479 () Bool)

(assert (=> b!355928 (=> (not res!197479) (not e!218113))))

(assert (=> b!355928 (= res!197479 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9625 _keys!1456))))))

(declare-fun b!355929 () Bool)

(declare-fun res!197478 () Bool)

(assert (=> b!355929 (=> (not res!197478) (not e!218113))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19557 (_ BitVec 32)) Bool)

(assert (=> b!355929 (= res!197478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355930 () Bool)

(assert (=> b!355930 (= e!218113 (not true))))

(assert (=> b!355930 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11643)

(declare-datatypes ((Unit!10948 0))(
  ( (Unit!10949) )
))
(declare-fun lt!165679 () Unit!10948)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11643)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!1 (array!19557 array!19559 (_ BitVec 32) (_ BitVec 32) V!11643 V!11643 (_ BitVec 64) (_ BitVec 32)) Unit!10948)

(assert (=> b!355930 (= lt!165679 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!1 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!355931 () Bool)

(declare-fun e!218111 () Bool)

(assert (=> b!355931 (= e!218111 (and e!218112 mapRes!13506))))

(declare-fun condMapEmpty!13506 () Bool)

(declare-fun mapDefault!13506 () ValueCell!3656)

(assert (=> b!355931 (= condMapEmpty!13506 (= (arr!9273 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3656)) mapDefault!13506)))))

(declare-fun b!355924 () Bool)

(declare-fun res!197481 () Bool)

(assert (=> b!355924 (=> (not res!197481) (not e!218113))))

(assert (=> b!355924 (= res!197481 (and (= (size!9626 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9625 _keys!1456) (size!9626 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!197475 () Bool)

(assert (=> start!35532 (=> (not res!197475) (not e!218113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35532 (= res!197475 (validMask!0 mask!1842))))

(assert (=> start!35532 e!218113))

(assert (=> start!35532 tp_is_empty!7999))

(assert (=> start!35532 true))

(declare-fun array_inv!6856 (array!19557) Bool)

(assert (=> start!35532 (array_inv!6856 _keys!1456)))

(declare-fun array_inv!6857 (array!19559) Bool)

(assert (=> start!35532 (and (array_inv!6857 _values!1208) e!218111)))

(assert (= (and start!35532 res!197475) b!355924))

(assert (= (and b!355924 res!197481) b!355929))

(assert (= (and b!355929 res!197478) b!355927))

(assert (= (and b!355927 res!197476) b!355923))

(assert (= (and b!355923 res!197482) b!355928))

(assert (= (and b!355928 res!197479) b!355921))

(assert (= (and b!355921 res!197480) b!355925))

(assert (= (and b!355925 res!197477) b!355930))

(assert (= (and b!355931 condMapEmpty!13506) mapIsEmpty!13506))

(assert (= (and b!355931 (not condMapEmpty!13506)) mapNonEmpty!13506))

(get-info :version)

(assert (= (and mapNonEmpty!13506 ((_ is ValueCellFull!3656) mapValue!13506)) b!355922))

(assert (= (and b!355931 ((_ is ValueCellFull!3656) mapDefault!13506)) b!355926))

(assert (= start!35532 b!355931))

(declare-fun m!353943 () Bool)

(assert (=> b!355925 m!353943))

(declare-fun m!353945 () Bool)

(assert (=> b!355921 m!353945))

(declare-fun m!353947 () Bool)

(assert (=> start!35532 m!353947))

(declare-fun m!353949 () Bool)

(assert (=> start!35532 m!353949))

(declare-fun m!353951 () Bool)

(assert (=> start!35532 m!353951))

(declare-fun m!353953 () Bool)

(assert (=> b!355930 m!353953))

(declare-fun m!353955 () Bool)

(assert (=> b!355930 m!353955))

(declare-fun m!353957 () Bool)

(assert (=> b!355927 m!353957))

(declare-fun m!353959 () Bool)

(assert (=> b!355929 m!353959))

(declare-fun m!353961 () Bool)

(assert (=> b!355923 m!353961))

(declare-fun m!353963 () Bool)

(assert (=> mapNonEmpty!13506 m!353963))

(check-sat (not b!355927) (not mapNonEmpty!13506) (not b!355923) (not b!355921) tp_is_empty!7999 (not start!35532) (not b!355930) (not b!355929))
(check-sat)
