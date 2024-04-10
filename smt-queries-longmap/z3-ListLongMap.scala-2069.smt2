; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35584 () Bool)

(assert start!35584)

(declare-fun b!356823 () Bool)

(declare-fun res!198062 () Bool)

(declare-fun e!218574 () Bool)

(assert (=> b!356823 (=> (not res!198062) (not e!218574))))

(declare-datatypes ((array!19643 0))(
  ( (array!19644 (arr!9315 (Array (_ BitVec 32) (_ BitVec 64))) (size!9667 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19643)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19643 (_ BitVec 32)) Bool)

(assert (=> b!356823 (= res!198062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356824 () Bool)

(declare-fun res!198060 () Bool)

(assert (=> b!356824 (=> (not res!198060) (not e!218574))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356824 (= res!198060 (validKeyInArray!0 k0!1077))))

(declare-fun b!356825 () Bool)

(declare-fun res!198063 () Bool)

(assert (=> b!356825 (=> (not res!198063) (not e!218574))))

(declare-datatypes ((List!5378 0))(
  ( (Nil!5375) (Cons!5374 (h!6230 (_ BitVec 64)) (t!10528 List!5378)) )
))
(declare-fun arrayNoDuplicates!0 (array!19643 (_ BitVec 32) List!5378) Bool)

(assert (=> b!356825 (= res!198063 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5375))))

(declare-fun b!356826 () Bool)

(declare-fun e!218575 () Bool)

(declare-fun tp_is_empty!8037 () Bool)

(assert (=> b!356826 (= e!218575 tp_is_empty!8037)))

(declare-fun b!356827 () Bool)

(declare-fun res!198065 () Bool)

(assert (=> b!356827 (=> (not res!198065) (not e!218574))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356827 (= res!198065 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9667 _keys!1456))))))

(declare-fun b!356828 () Bool)

(declare-fun e!218572 () Bool)

(declare-fun mapRes!13563 () Bool)

(assert (=> b!356828 (= e!218572 (and e!218575 mapRes!13563))))

(declare-fun condMapEmpty!13563 () Bool)

(declare-datatypes ((V!11693 0))(
  ( (V!11694 (val!4063 Int)) )
))
(declare-datatypes ((ValueCell!3675 0))(
  ( (ValueCellFull!3675 (v!6257 V!11693)) (EmptyCell!3675) )
))
(declare-datatypes ((array!19645 0))(
  ( (array!19646 (arr!9316 (Array (_ BitVec 32) ValueCell!3675)) (size!9668 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19645)

(declare-fun mapDefault!13563 () ValueCell!3675)

(assert (=> b!356828 (= condMapEmpty!13563 (= (arr!9316 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3675)) mapDefault!13563)))))

(declare-fun res!198067 () Bool)

(assert (=> start!35584 (=> (not res!198067) (not e!218574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35584 (= res!198067 (validMask!0 mask!1842))))

(assert (=> start!35584 e!218574))

(assert (=> start!35584 tp_is_empty!8037))

(assert (=> start!35584 true))

(declare-fun array_inv!6848 (array!19643) Bool)

(assert (=> start!35584 (array_inv!6848 _keys!1456)))

(declare-fun array_inv!6849 (array!19645) Bool)

(assert (=> start!35584 (and (array_inv!6849 _values!1208) e!218572)))

(declare-fun b!356829 () Bool)

(declare-fun e!218573 () Bool)

(assert (=> b!356829 (= e!218573 tp_is_empty!8037)))

(declare-fun b!356830 () Bool)

(declare-fun res!198066 () Bool)

(assert (=> b!356830 (=> (not res!198066) (not e!218574))))

(declare-fun arrayContainsKey!0 (array!19643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356830 (= res!198066 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356831 () Bool)

(declare-fun res!198064 () Bool)

(assert (=> b!356831 (=> (not res!198064) (not e!218574))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356831 (= res!198064 (and (= (size!9668 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9667 _keys!1456) (size!9668 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13563 () Bool)

(declare-fun tp!27540 () Bool)

(assert (=> mapNonEmpty!13563 (= mapRes!13563 (and tp!27540 e!218573))))

(declare-fun mapKey!13563 () (_ BitVec 32))

(declare-fun mapRest!13563 () (Array (_ BitVec 32) ValueCell!3675))

(declare-fun mapValue!13563 () ValueCell!3675)

(assert (=> mapNonEmpty!13563 (= (arr!9316 _values!1208) (store mapRest!13563 mapKey!13563 mapValue!13563))))

(declare-fun b!356832 () Bool)

(assert (=> b!356832 (= e!218574 (not true))))

(assert (=> b!356832 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11693)

(declare-fun zeroValue!1150 () V!11693)

(declare-datatypes ((Unit!10986 0))(
  ( (Unit!10987) )
))
(declare-fun lt!165971 () Unit!10986)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!12 (array!19643 array!19645 (_ BitVec 32) (_ BitVec 32) V!11693 V!11693 (_ BitVec 64) (_ BitVec 32)) Unit!10986)

(assert (=> b!356832 (= lt!165971 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!12 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356833 () Bool)

(declare-fun res!198061 () Bool)

(assert (=> b!356833 (=> (not res!198061) (not e!218574))))

(assert (=> b!356833 (= res!198061 (not (= (select (arr!9315 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapIsEmpty!13563 () Bool)

(assert (=> mapIsEmpty!13563 mapRes!13563))

(assert (= (and start!35584 res!198067) b!356831))

(assert (= (and b!356831 res!198064) b!356823))

(assert (= (and b!356823 res!198062) b!356825))

(assert (= (and b!356825 res!198063) b!356824))

(assert (= (and b!356824 res!198060) b!356827))

(assert (= (and b!356827 res!198065) b!356830))

(assert (= (and b!356830 res!198066) b!356833))

(assert (= (and b!356833 res!198061) b!356832))

(assert (= (and b!356828 condMapEmpty!13563) mapIsEmpty!13563))

(assert (= (and b!356828 (not condMapEmpty!13563)) mapNonEmpty!13563))

(get-info :version)

(assert (= (and mapNonEmpty!13563 ((_ is ValueCellFull!3675) mapValue!13563)) b!356829))

(assert (= (and b!356828 ((_ is ValueCellFull!3675) mapDefault!13563)) b!356826))

(assert (= start!35584 b!356828))

(declare-fun m!355091 () Bool)

(assert (=> b!356833 m!355091))

(declare-fun m!355093 () Bool)

(assert (=> b!356823 m!355093))

(declare-fun m!355095 () Bool)

(assert (=> b!356825 m!355095))

(declare-fun m!355097 () Bool)

(assert (=> b!356830 m!355097))

(declare-fun m!355099 () Bool)

(assert (=> start!35584 m!355099))

(declare-fun m!355101 () Bool)

(assert (=> start!35584 m!355101))

(declare-fun m!355103 () Bool)

(assert (=> start!35584 m!355103))

(declare-fun m!355105 () Bool)

(assert (=> mapNonEmpty!13563 m!355105))

(declare-fun m!355107 () Bool)

(assert (=> b!356824 m!355107))

(declare-fun m!355109 () Bool)

(assert (=> b!356832 m!355109))

(declare-fun m!355111 () Bool)

(assert (=> b!356832 m!355111))

(check-sat (not b!356830) (not mapNonEmpty!13563) tp_is_empty!8037 (not b!356823) (not start!35584) (not b!356824) (not b!356825) (not b!356832))
(check-sat)
