; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35580 () Bool)

(assert start!35580)

(declare-fun b!356713 () Bool)

(declare-fun res!198055 () Bool)

(declare-fun e!218475 () Bool)

(assert (=> b!356713 (=> (not res!198055) (not e!218475))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19649 0))(
  ( (array!19650 (arr!9318 (Array (_ BitVec 32) (_ BitVec 64))) (size!9671 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19649)

(assert (=> b!356713 (= res!198055 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9671 _keys!1456))))))

(declare-fun mapNonEmpty!13578 () Bool)

(declare-fun mapRes!13578 () Bool)

(declare-fun tp!27555 () Bool)

(declare-fun e!218474 () Bool)

(assert (=> mapNonEmpty!13578 (= mapRes!13578 (and tp!27555 e!218474))))

(declare-fun mapKey!13578 () (_ BitVec 32))

(declare-datatypes ((V!11707 0))(
  ( (V!11708 (val!4068 Int)) )
))
(declare-datatypes ((ValueCell!3680 0))(
  ( (ValueCellFull!3680 (v!6256 V!11707)) (EmptyCell!3680) )
))
(declare-fun mapValue!13578 () ValueCell!3680)

(declare-fun mapRest!13578 () (Array (_ BitVec 32) ValueCell!3680))

(declare-datatypes ((array!19651 0))(
  ( (array!19652 (arr!9319 (Array (_ BitVec 32) ValueCell!3680)) (size!9672 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19651)

(assert (=> mapNonEmpty!13578 (= (arr!9319 _values!1208) (store mapRest!13578 mapKey!13578 mapValue!13578))))

(declare-fun b!356714 () Bool)

(declare-fun e!218472 () Bool)

(declare-fun e!218471 () Bool)

(assert (=> b!356714 (= e!218472 (and e!218471 mapRes!13578))))

(declare-fun condMapEmpty!13578 () Bool)

(declare-fun mapDefault!13578 () ValueCell!3680)

(assert (=> b!356714 (= condMapEmpty!13578 (= (arr!9319 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3680)) mapDefault!13578)))))

(declare-fun b!356715 () Bool)

(declare-fun tp_is_empty!8047 () Bool)

(assert (=> b!356715 (= e!218471 tp_is_empty!8047)))

(declare-fun b!356716 () Bool)

(declare-fun res!198058 () Bool)

(assert (=> b!356716 (=> (not res!198058) (not e!218475))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!356716 (= res!198058 (not (= (select (arr!9318 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356717 () Bool)

(declare-fun res!198057 () Bool)

(assert (=> b!356717 (=> (not res!198057) (not e!218475))))

(declare-fun arrayContainsKey!0 (array!19649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356717 (= res!198057 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356718 () Bool)

(assert (=> b!356718 (= e!218475 (not true))))

(assert (=> b!356718 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11707)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((Unit!10978 0))(
  ( (Unit!10979) )
))
(declare-fun lt!165751 () Unit!10978)

(declare-fun zeroValue!1150 () V!11707)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!16 (array!19649 array!19651 (_ BitVec 32) (_ BitVec 32) V!11707 V!11707 (_ BitVec 64) (_ BitVec 32)) Unit!10978)

(assert (=> b!356718 (= lt!165751 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!16 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356719 () Bool)

(declare-fun res!198054 () Bool)

(assert (=> b!356719 (=> (not res!198054) (not e!218475))))

(assert (=> b!356719 (= res!198054 (and (= (size!9672 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9671 _keys!1456) (size!9672 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356720 () Bool)

(declare-fun res!198053 () Bool)

(assert (=> b!356720 (=> (not res!198053) (not e!218475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356720 (= res!198053 (validKeyInArray!0 k0!1077))))

(declare-fun res!198051 () Bool)

(assert (=> start!35580 (=> (not res!198051) (not e!218475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35580 (= res!198051 (validMask!0 mask!1842))))

(assert (=> start!35580 e!218475))

(assert (=> start!35580 tp_is_empty!8047))

(assert (=> start!35580 true))

(declare-fun array_inv!6884 (array!19649) Bool)

(assert (=> start!35580 (array_inv!6884 _keys!1456)))

(declare-fun array_inv!6885 (array!19651) Bool)

(assert (=> start!35580 (and (array_inv!6885 _values!1208) e!218472)))

(declare-fun mapIsEmpty!13578 () Bool)

(assert (=> mapIsEmpty!13578 mapRes!13578))

(declare-fun b!356721 () Bool)

(declare-fun res!198052 () Bool)

(assert (=> b!356721 (=> (not res!198052) (not e!218475))))

(declare-datatypes ((List!5347 0))(
  ( (Nil!5344) (Cons!5343 (h!6199 (_ BitVec 64)) (t!10488 List!5347)) )
))
(declare-fun arrayNoDuplicates!0 (array!19649 (_ BitVec 32) List!5347) Bool)

(assert (=> b!356721 (= res!198052 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5344))))

(declare-fun b!356722 () Bool)

(assert (=> b!356722 (= e!218474 tp_is_empty!8047)))

(declare-fun b!356723 () Bool)

(declare-fun res!198056 () Bool)

(assert (=> b!356723 (=> (not res!198056) (not e!218475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19649 (_ BitVec 32)) Bool)

(assert (=> b!356723 (= res!198056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35580 res!198051) b!356719))

(assert (= (and b!356719 res!198054) b!356723))

(assert (= (and b!356723 res!198056) b!356721))

(assert (= (and b!356721 res!198052) b!356720))

(assert (= (and b!356720 res!198053) b!356713))

(assert (= (and b!356713 res!198055) b!356717))

(assert (= (and b!356717 res!198057) b!356716))

(assert (= (and b!356716 res!198058) b!356718))

(assert (= (and b!356714 condMapEmpty!13578) mapIsEmpty!13578))

(assert (= (and b!356714 (not condMapEmpty!13578)) mapNonEmpty!13578))

(get-info :version)

(assert (= (and mapNonEmpty!13578 ((_ is ValueCellFull!3680) mapValue!13578)) b!356722))

(assert (= (and b!356714 ((_ is ValueCellFull!3680) mapDefault!13578)) b!356715))

(assert (= start!35580 b!356714))

(declare-fun m!354471 () Bool)

(assert (=> b!356721 m!354471))

(declare-fun m!354473 () Bool)

(assert (=> b!356720 m!354473))

(declare-fun m!354475 () Bool)

(assert (=> b!356723 m!354475))

(declare-fun m!354477 () Bool)

(assert (=> start!35580 m!354477))

(declare-fun m!354479 () Bool)

(assert (=> start!35580 m!354479))

(declare-fun m!354481 () Bool)

(assert (=> start!35580 m!354481))

(declare-fun m!354483 () Bool)

(assert (=> b!356718 m!354483))

(declare-fun m!354485 () Bool)

(assert (=> b!356718 m!354485))

(declare-fun m!354487 () Bool)

(assert (=> b!356717 m!354487))

(declare-fun m!354489 () Bool)

(assert (=> mapNonEmpty!13578 m!354489))

(declare-fun m!354491 () Bool)

(assert (=> b!356716 m!354491))

(check-sat (not start!35580) (not mapNonEmpty!13578) (not b!356721) (not b!356723) (not b!356718) tp_is_empty!8047 (not b!356717) (not b!356720))
(check-sat)
