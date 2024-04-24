; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35580 () Bool)

(assert start!35580)

(declare-fun b!356935 () Bool)

(declare-fun res!198177 () Bool)

(declare-fun e!218614 () Bool)

(assert (=> b!356935 (=> (not res!198177) (not e!218614))))

(declare-datatypes ((array!19646 0))(
  ( (array!19647 (arr!9316 (Array (_ BitVec 32) (_ BitVec 64))) (size!9668 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19646)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356935 (= res!198177 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356936 () Bool)

(declare-fun e!218615 () Bool)

(declare-fun tp_is_empty!8047 () Bool)

(assert (=> b!356936 (= e!218615 tp_is_empty!8047)))

(declare-fun b!356937 () Bool)

(assert (=> b!356937 (= e!218614 (not true))))

(assert (=> b!356937 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11707 0))(
  ( (V!11708 (val!4068 Int)) )
))
(declare-fun minValue!1150 () V!11707)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!10981 0))(
  ( (Unit!10982) )
))
(declare-fun lt!166004 () Unit!10981)

(declare-datatypes ((ValueCell!3680 0))(
  ( (ValueCellFull!3680 (v!6263 V!11707)) (EmptyCell!3680) )
))
(declare-datatypes ((array!19648 0))(
  ( (array!19649 (arr!9317 (Array (_ BitVec 32) ValueCell!3680)) (size!9669 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19648)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11707)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!19 (array!19646 array!19648 (_ BitVec 32) (_ BitVec 32) V!11707 V!11707 (_ BitVec 64) (_ BitVec 32)) Unit!10981)

(assert (=> b!356937 (= lt!166004 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!19 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356938 () Bool)

(declare-fun res!198184 () Bool)

(assert (=> b!356938 (=> (not res!198184) (not e!218614))))

(declare-datatypes ((List!5290 0))(
  ( (Nil!5287) (Cons!5286 (h!6142 (_ BitVec 64)) (t!10432 List!5290)) )
))
(declare-fun arrayNoDuplicates!0 (array!19646 (_ BitVec 32) List!5290) Bool)

(assert (=> b!356938 (= res!198184 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5287))))

(declare-fun mapNonEmpty!13578 () Bool)

(declare-fun mapRes!13578 () Bool)

(declare-fun tp!27555 () Bool)

(assert (=> mapNonEmpty!13578 (= mapRes!13578 (and tp!27555 e!218615))))

(declare-fun mapKey!13578 () (_ BitVec 32))

(declare-fun mapRest!13578 () (Array (_ BitVec 32) ValueCell!3680))

(declare-fun mapValue!13578 () ValueCell!3680)

(assert (=> mapNonEmpty!13578 (= (arr!9317 _values!1208) (store mapRest!13578 mapKey!13578 mapValue!13578))))

(declare-fun b!356939 () Bool)

(declare-fun e!218616 () Bool)

(declare-fun e!218617 () Bool)

(assert (=> b!356939 (= e!218616 (and e!218617 mapRes!13578))))

(declare-fun condMapEmpty!13578 () Bool)

(declare-fun mapDefault!13578 () ValueCell!3680)

(assert (=> b!356939 (= condMapEmpty!13578 (= (arr!9317 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3680)) mapDefault!13578)))))

(declare-fun res!198183 () Bool)

(assert (=> start!35580 (=> (not res!198183) (not e!218614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35580 (= res!198183 (validMask!0 mask!1842))))

(assert (=> start!35580 e!218614))

(assert (=> start!35580 tp_is_empty!8047))

(assert (=> start!35580 true))

(declare-fun array_inv!6882 (array!19646) Bool)

(assert (=> start!35580 (array_inv!6882 _keys!1456)))

(declare-fun array_inv!6883 (array!19648) Bool)

(assert (=> start!35580 (and (array_inv!6883 _values!1208) e!218616)))

(declare-fun b!356940 () Bool)

(declare-fun res!198180 () Bool)

(assert (=> b!356940 (=> (not res!198180) (not e!218614))))

(assert (=> b!356940 (= res!198180 (and (= (size!9669 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9668 _keys!1456) (size!9669 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356941 () Bool)

(declare-fun res!198182 () Bool)

(assert (=> b!356941 (=> (not res!198182) (not e!218614))))

(assert (=> b!356941 (= res!198182 (not (= (select (arr!9316 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356942 () Bool)

(assert (=> b!356942 (= e!218617 tp_is_empty!8047)))

(declare-fun b!356943 () Bool)

(declare-fun res!198178 () Bool)

(assert (=> b!356943 (=> (not res!198178) (not e!218614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356943 (= res!198178 (validKeyInArray!0 k0!1077))))

(declare-fun mapIsEmpty!13578 () Bool)

(assert (=> mapIsEmpty!13578 mapRes!13578))

(declare-fun b!356944 () Bool)

(declare-fun res!198179 () Bool)

(assert (=> b!356944 (=> (not res!198179) (not e!218614))))

(assert (=> b!356944 (= res!198179 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9668 _keys!1456))))))

(declare-fun b!356945 () Bool)

(declare-fun res!198181 () Bool)

(assert (=> b!356945 (=> (not res!198181) (not e!218614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19646 (_ BitVec 32)) Bool)

(assert (=> b!356945 (= res!198181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35580 res!198183) b!356940))

(assert (= (and b!356940 res!198180) b!356945))

(assert (= (and b!356945 res!198181) b!356938))

(assert (= (and b!356938 res!198184) b!356943))

(assert (= (and b!356943 res!198178) b!356944))

(assert (= (and b!356944 res!198179) b!356935))

(assert (= (and b!356935 res!198177) b!356941))

(assert (= (and b!356941 res!198182) b!356937))

(assert (= (and b!356939 condMapEmpty!13578) mapIsEmpty!13578))

(assert (= (and b!356939 (not condMapEmpty!13578)) mapNonEmpty!13578))

(get-info :version)

(assert (= (and mapNonEmpty!13578 ((_ is ValueCellFull!3680) mapValue!13578)) b!356936))

(assert (= (and b!356939 ((_ is ValueCellFull!3680) mapDefault!13578)) b!356942))

(assert (= start!35580 b!356939))

(declare-fun m!355425 () Bool)

(assert (=> b!356938 m!355425))

(declare-fun m!355427 () Bool)

(assert (=> b!356935 m!355427))

(declare-fun m!355429 () Bool)

(assert (=> mapNonEmpty!13578 m!355429))

(declare-fun m!355431 () Bool)

(assert (=> b!356945 m!355431))

(declare-fun m!355433 () Bool)

(assert (=> b!356943 m!355433))

(declare-fun m!355435 () Bool)

(assert (=> b!356941 m!355435))

(declare-fun m!355437 () Bool)

(assert (=> b!356937 m!355437))

(declare-fun m!355439 () Bool)

(assert (=> b!356937 m!355439))

(declare-fun m!355441 () Bool)

(assert (=> start!35580 m!355441))

(declare-fun m!355443 () Bool)

(assert (=> start!35580 m!355443))

(declare-fun m!355445 () Bool)

(assert (=> start!35580 m!355445))

(check-sat (not b!356945) (not b!356938) (not b!356937) (not mapNonEmpty!13578) (not start!35580) (not b!356935) tp_is_empty!8047 (not b!356943))
(check-sat)
