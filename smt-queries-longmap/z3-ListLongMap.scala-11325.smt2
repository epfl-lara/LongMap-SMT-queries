; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131856 () Bool)

(assert start!131856)

(declare-fun b!1543659 () Bool)

(declare-fun e!859146 () Bool)

(declare-fun tp_is_empty!37845 () Bool)

(assert (=> b!1543659 (= e!859146 tp_is_empty!37845)))

(declare-fun b!1543660 () Bool)

(declare-fun res!1059104 () Bool)

(declare-fun e!859148 () Bool)

(assert (=> b!1543660 (=> (not res!1059104) (not e!859148))))

(declare-datatypes ((array!102910 0))(
  ( (array!102911 (arr!49657 (Array (_ BitVec 32) (_ BitVec 64))) (size!50207 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102910)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102910 (_ BitVec 32)) Bool)

(assert (=> b!1543660 (= res!1059104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543661 () Bool)

(declare-fun res!1059103 () Bool)

(assert (=> b!1543661 (=> (not res!1059103) (not e!859148))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!58903 0))(
  ( (V!58904 (val!19000 Int)) )
))
(declare-datatypes ((ValueCell!18012 0))(
  ( (ValueCellFull!18012 (v!21801 V!58903)) (EmptyCell!18012) )
))
(declare-datatypes ((array!102912 0))(
  ( (array!102913 (arr!49658 (Array (_ BitVec 32) ValueCell!18012)) (size!50208 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102912)

(assert (=> b!1543661 (= res!1059103 (and (= (size!50208 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50207 _keys!618) (size!50208 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543662 () Bool)

(assert (=> b!1543662 (= e!859148 false)))

(declare-fun lt!666020 () Bool)

(declare-datatypes ((List!35928 0))(
  ( (Nil!35925) (Cons!35924 (h!37369 (_ BitVec 64)) (t!50622 List!35928)) )
))
(declare-fun arrayNoDuplicates!0 (array!102910 (_ BitVec 32) List!35928) Bool)

(assert (=> b!1543662 (= lt!666020 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35925))))

(declare-fun res!1059105 () Bool)

(assert (=> start!131856 (=> (not res!1059105) (not e!859148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131856 (= res!1059105 (validMask!0 mask!926))))

(assert (=> start!131856 e!859148))

(assert (=> start!131856 true))

(declare-fun e!859149 () Bool)

(declare-fun array_inv!38631 (array!102912) Bool)

(assert (=> start!131856 (and (array_inv!38631 _values!470) e!859149)))

(declare-fun array_inv!38632 (array!102910) Bool)

(assert (=> start!131856 (array_inv!38632 _keys!618)))

(declare-fun b!1543663 () Bool)

(declare-fun e!859147 () Bool)

(assert (=> b!1543663 (= e!859147 tp_is_empty!37845)))

(declare-fun mapIsEmpty!58471 () Bool)

(declare-fun mapRes!58471 () Bool)

(assert (=> mapIsEmpty!58471 mapRes!58471))

(declare-fun mapNonEmpty!58471 () Bool)

(declare-fun tp!110998 () Bool)

(assert (=> mapNonEmpty!58471 (= mapRes!58471 (and tp!110998 e!859147))))

(declare-fun mapRest!58471 () (Array (_ BitVec 32) ValueCell!18012))

(declare-fun mapKey!58471 () (_ BitVec 32))

(declare-fun mapValue!58471 () ValueCell!18012)

(assert (=> mapNonEmpty!58471 (= (arr!49658 _values!470) (store mapRest!58471 mapKey!58471 mapValue!58471))))

(declare-fun b!1543664 () Bool)

(assert (=> b!1543664 (= e!859149 (and e!859146 mapRes!58471))))

(declare-fun condMapEmpty!58471 () Bool)

(declare-fun mapDefault!58471 () ValueCell!18012)

(assert (=> b!1543664 (= condMapEmpty!58471 (= (arr!49658 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18012)) mapDefault!58471)))))

(assert (= (and start!131856 res!1059105) b!1543661))

(assert (= (and b!1543661 res!1059103) b!1543660))

(assert (= (and b!1543660 res!1059104) b!1543662))

(assert (= (and b!1543664 condMapEmpty!58471) mapIsEmpty!58471))

(assert (= (and b!1543664 (not condMapEmpty!58471)) mapNonEmpty!58471))

(get-info :version)

(assert (= (and mapNonEmpty!58471 ((_ is ValueCellFull!18012) mapValue!58471)) b!1543663))

(assert (= (and b!1543664 ((_ is ValueCellFull!18012) mapDefault!58471)) b!1543659))

(assert (= start!131856 b!1543664))

(declare-fun m!1424893 () Bool)

(assert (=> b!1543660 m!1424893))

(declare-fun m!1424895 () Bool)

(assert (=> b!1543662 m!1424895))

(declare-fun m!1424897 () Bool)

(assert (=> start!131856 m!1424897))

(declare-fun m!1424899 () Bool)

(assert (=> start!131856 m!1424899))

(declare-fun m!1424901 () Bool)

(assert (=> start!131856 m!1424901))

(declare-fun m!1424903 () Bool)

(assert (=> mapNonEmpty!58471 m!1424903))

(check-sat (not mapNonEmpty!58471) (not start!131856) (not b!1543660) tp_is_empty!37845 (not b!1543662))
(check-sat)
