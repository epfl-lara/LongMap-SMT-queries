; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35622 () Bool)

(assert start!35622)

(declare-fun b_free!7891 () Bool)

(declare-fun b_next!7891 () Bool)

(assert (=> start!35622 (= b_free!7891 (not b_next!7891))))

(declare-fun tp!27657 () Bool)

(declare-fun b_and!15147 () Bool)

(assert (=> start!35622 (= tp!27657 b_and!15147)))

(declare-fun b!357666 () Bool)

(declare-fun res!198719 () Bool)

(declare-fun e!218966 () Bool)

(assert (=> b!357666 (=> (not res!198719) (not e!218966))))

(declare-datatypes ((array!19728 0))(
  ( (array!19729 (arr!9357 (Array (_ BitVec 32) (_ BitVec 64))) (size!9709 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19728)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!357666 (= res!198719 (not (= (select (arr!9357 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357667 () Bool)

(declare-fun res!198727 () Bool)

(assert (=> b!357667 (=> (not res!198727) (not e!218966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357667 (= res!198727 (validKeyInArray!0 k0!1077))))

(declare-fun b!357668 () Bool)

(declare-fun res!198721 () Bool)

(assert (=> b!357668 (=> (not res!198721) (not e!218966))))

(declare-fun arrayContainsKey!0 (array!19728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357668 (= res!198721 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357669 () Bool)

(declare-fun e!218970 () Bool)

(assert (=> b!357669 (= e!218970 true)))

(declare-datatypes ((V!11763 0))(
  ( (V!11764 (val!4089 Int)) )
))
(declare-fun minValue!1150 () V!11763)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((ValueCell!3701 0))(
  ( (ValueCellFull!3701 (v!6284 V!11763)) (EmptyCell!3701) )
))
(declare-datatypes ((array!19730 0))(
  ( (array!19731 (arr!9358 (Array (_ BitVec 32) ValueCell!3701)) (size!9710 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19730)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11763)

(declare-datatypes ((tuple2!5628 0))(
  ( (tuple2!5629 (_1!2825 (_ BitVec 64)) (_2!2825 V!11763)) )
))
(declare-datatypes ((List!5310 0))(
  ( (Nil!5307) (Cons!5306 (h!6162 tuple2!5628) (t!10452 List!5310)) )
))
(declare-datatypes ((ListLongMap!4543 0))(
  ( (ListLongMap!4544 (toList!2287 List!5310)) )
))
(declare-fun contains!2386 (ListLongMap!4543 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1815 (array!19728 array!19730 (_ BitVec 32) (_ BitVec 32) V!11763 V!11763 (_ BitVec 32) Int) ListLongMap!4543)

(assert (=> b!357669 (contains!2386 (getCurrentListMap!1815 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!11011 0))(
  ( (Unit!11012) )
))
(declare-fun lt!166105 () Unit!11011)

(declare-fun lemmaArrayContainsKeyThenInListMap!354 (array!19728 array!19730 (_ BitVec 32) (_ BitVec 32) V!11763 V!11763 (_ BitVec 64) (_ BitVec 32) Int) Unit!11011)

(assert (=> b!357669 (= lt!166105 (lemmaArrayContainsKeyThenInListMap!354 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357670 () Bool)

(declare-fun res!198725 () Bool)

(assert (=> b!357670 (=> (not res!198725) (not e!218966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19728 (_ BitVec 32)) Bool)

(assert (=> b!357670 (= res!198725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13641 () Bool)

(declare-fun mapRes!13641 () Bool)

(assert (=> mapIsEmpty!13641 mapRes!13641))

(declare-fun b!357671 () Bool)

(declare-fun res!198722 () Bool)

(assert (=> b!357671 (=> (not res!198722) (not e!218966))))

(assert (=> b!357671 (= res!198722 (and (= (size!9710 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9709 _keys!1456) (size!9710 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357672 () Bool)

(declare-fun e!218968 () Bool)

(declare-fun tp_is_empty!8089 () Bool)

(assert (=> b!357672 (= e!218968 tp_is_empty!8089)))

(declare-fun mapNonEmpty!13641 () Bool)

(declare-fun tp!27656 () Bool)

(declare-fun e!218967 () Bool)

(assert (=> mapNonEmpty!13641 (= mapRes!13641 (and tp!27656 e!218967))))

(declare-fun mapValue!13641 () ValueCell!3701)

(declare-fun mapKey!13641 () (_ BitVec 32))

(declare-fun mapRest!13641 () (Array (_ BitVec 32) ValueCell!3701))

(assert (=> mapNonEmpty!13641 (= (arr!9358 _values!1208) (store mapRest!13641 mapKey!13641 mapValue!13641))))

(declare-fun b!357674 () Bool)

(declare-fun e!218969 () Bool)

(assert (=> b!357674 (= e!218969 (and e!218968 mapRes!13641))))

(declare-fun condMapEmpty!13641 () Bool)

(declare-fun mapDefault!13641 () ValueCell!3701)

(assert (=> b!357674 (= condMapEmpty!13641 (= (arr!9358 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3701)) mapDefault!13641)))))

(declare-fun b!357675 () Bool)

(declare-fun res!198723 () Bool)

(assert (=> b!357675 (=> (not res!198723) (not e!218966))))

(declare-datatypes ((List!5311 0))(
  ( (Nil!5308) (Cons!5307 (h!6163 (_ BitVec 64)) (t!10453 List!5311)) )
))
(declare-fun arrayNoDuplicates!0 (array!19728 (_ BitVec 32) List!5311) Bool)

(assert (=> b!357675 (= res!198723 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5308))))

(declare-fun b!357676 () Bool)

(assert (=> b!357676 (= e!218966 (not e!218970))))

(declare-fun res!198726 () Bool)

(assert (=> b!357676 (=> res!198726 e!218970)))

(assert (=> b!357676 (= res!198726 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9709 _keys!1456))))))

(assert (=> b!357676 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166106 () Unit!11011)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!34 (array!19728 array!19730 (_ BitVec 32) (_ BitVec 32) V!11763 V!11763 (_ BitVec 64) (_ BitVec 32)) Unit!11011)

(assert (=> b!357676 (= lt!166106 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!34 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357677 () Bool)

(assert (=> b!357677 (= e!218967 tp_is_empty!8089)))

(declare-fun res!198720 () Bool)

(assert (=> start!35622 (=> (not res!198720) (not e!218966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35622 (= res!198720 (validMask!0 mask!1842))))

(assert (=> start!35622 e!218966))

(assert (=> start!35622 tp_is_empty!8089))

(assert (=> start!35622 true))

(assert (=> start!35622 tp!27657))

(declare-fun array_inv!6912 (array!19728) Bool)

(assert (=> start!35622 (array_inv!6912 _keys!1456)))

(declare-fun array_inv!6913 (array!19730) Bool)

(assert (=> start!35622 (and (array_inv!6913 _values!1208) e!218969)))

(declare-fun b!357673 () Bool)

(declare-fun res!198724 () Bool)

(assert (=> b!357673 (=> (not res!198724) (not e!218966))))

(assert (=> b!357673 (= res!198724 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9709 _keys!1456))))))

(assert (= (and start!35622 res!198720) b!357671))

(assert (= (and b!357671 res!198722) b!357670))

(assert (= (and b!357670 res!198725) b!357675))

(assert (= (and b!357675 res!198723) b!357667))

(assert (= (and b!357667 res!198727) b!357673))

(assert (= (and b!357673 res!198724) b!357668))

(assert (= (and b!357668 res!198721) b!357666))

(assert (= (and b!357666 res!198719) b!357676))

(assert (= (and b!357676 (not res!198726)) b!357669))

(assert (= (and b!357674 condMapEmpty!13641) mapIsEmpty!13641))

(assert (= (and b!357674 (not condMapEmpty!13641)) mapNonEmpty!13641))

(get-info :version)

(assert (= (and mapNonEmpty!13641 ((_ is ValueCellFull!3701) mapValue!13641)) b!357677))

(assert (= (and b!357674 ((_ is ValueCellFull!3701) mapDefault!13641)) b!357672))

(assert (= start!35622 b!357674))

(declare-fun m!355959 () Bool)

(assert (=> b!357669 m!355959))

(assert (=> b!357669 m!355959))

(declare-fun m!355961 () Bool)

(assert (=> b!357669 m!355961))

(declare-fun m!355963 () Bool)

(assert (=> b!357669 m!355963))

(declare-fun m!355965 () Bool)

(assert (=> mapNonEmpty!13641 m!355965))

(declare-fun m!355967 () Bool)

(assert (=> b!357666 m!355967))

(declare-fun m!355969 () Bool)

(assert (=> b!357667 m!355969))

(declare-fun m!355971 () Bool)

(assert (=> start!35622 m!355971))

(declare-fun m!355973 () Bool)

(assert (=> start!35622 m!355973))

(declare-fun m!355975 () Bool)

(assert (=> start!35622 m!355975))

(declare-fun m!355977 () Bool)

(assert (=> b!357668 m!355977))

(declare-fun m!355979 () Bool)

(assert (=> b!357670 m!355979))

(declare-fun m!355981 () Bool)

(assert (=> b!357675 m!355981))

(declare-fun m!355983 () Bool)

(assert (=> b!357676 m!355983))

(declare-fun m!355985 () Bool)

(assert (=> b!357676 m!355985))

(check-sat (not start!35622) b_and!15147 (not mapNonEmpty!13641) (not b!357670) tp_is_empty!8089 (not b!357669) (not b!357675) (not b!357668) (not b!357667) (not b_next!7891) (not b!357676))
(check-sat b_and!15147 (not b_next!7891))
