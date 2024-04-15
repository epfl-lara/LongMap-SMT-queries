; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131684 () Bool)

(assert start!131684)

(declare-fun b!1542248 () Bool)

(declare-fun e!858032 () Bool)

(declare-fun tp_is_empty!37723 () Bool)

(assert (=> b!1542248 (= e!858032 tp_is_empty!37723)))

(declare-fun mapNonEmpty!58288 () Bool)

(declare-fun mapRes!58288 () Bool)

(declare-fun tp!110816 () Bool)

(assert (=> mapNonEmpty!58288 (= mapRes!58288 (and tp!110816 e!858032))))

(declare-datatypes ((V!58741 0))(
  ( (V!58742 (val!18939 Int)) )
))
(declare-datatypes ((ValueCell!17951 0))(
  ( (ValueCellFull!17951 (v!21736 V!58741)) (EmptyCell!17951) )
))
(declare-fun mapRest!58288 () (Array (_ BitVec 32) ValueCell!17951))

(declare-fun mapKey!58288 () (_ BitVec 32))

(declare-datatypes ((array!102612 0))(
  ( (array!102613 (arr!49509 (Array (_ BitVec 32) ValueCell!17951)) (size!50061 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102612)

(declare-fun mapValue!58288 () ValueCell!17951)

(assert (=> mapNonEmpty!58288 (= (arr!49509 _values!470) (store mapRest!58288 mapKey!58288 mapValue!58288))))

(declare-fun mapIsEmpty!58288 () Bool)

(assert (=> mapIsEmpty!58288 mapRes!58288))

(declare-fun b!1542249 () Bool)

(declare-fun res!1058426 () Bool)

(declare-fun e!858034 () Bool)

(assert (=> b!1542249 (=> (not res!1058426) (not e!858034))))

(declare-datatypes ((array!102614 0))(
  ( (array!102615 (arr!49510 (Array (_ BitVec 32) (_ BitVec 64))) (size!50062 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102614)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102614 (_ BitVec 32)) Bool)

(assert (=> b!1542249 (= res!1058426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542250 () Bool)

(declare-fun res!1058427 () Bool)

(assert (=> b!1542250 (=> (not res!1058427) (not e!858034))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542250 (= res!1058427 (and (= (size!50061 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50062 _keys!618) (size!50061 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542251 () Bool)

(declare-fun e!858033 () Bool)

(declare-fun e!858035 () Bool)

(assert (=> b!1542251 (= e!858033 (and e!858035 mapRes!58288))))

(declare-fun condMapEmpty!58288 () Bool)

(declare-fun mapDefault!58288 () ValueCell!17951)

(assert (=> b!1542251 (= condMapEmpty!58288 (= (arr!49509 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17951)) mapDefault!58288)))))

(declare-fun b!1542252 () Bool)

(assert (=> b!1542252 (= e!858034 false)))

(declare-fun lt!665551 () Bool)

(declare-datatypes ((List!35931 0))(
  ( (Nil!35928) (Cons!35927 (h!37373 (_ BitVec 64)) (t!50617 List!35931)) )
))
(declare-fun arrayNoDuplicates!0 (array!102614 (_ BitVec 32) List!35931) Bool)

(assert (=> b!1542252 (= lt!665551 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35928))))

(declare-fun res!1058425 () Bool)

(assert (=> start!131684 (=> (not res!1058425) (not e!858034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131684 (= res!1058425 (validMask!0 mask!926))))

(assert (=> start!131684 e!858034))

(assert (=> start!131684 true))

(declare-fun array_inv!38713 (array!102612) Bool)

(assert (=> start!131684 (and (array_inv!38713 _values!470) e!858033)))

(declare-fun array_inv!38714 (array!102614) Bool)

(assert (=> start!131684 (array_inv!38714 _keys!618)))

(declare-fun b!1542253 () Bool)

(assert (=> b!1542253 (= e!858035 tp_is_empty!37723)))

(assert (= (and start!131684 res!1058425) b!1542250))

(assert (= (and b!1542250 res!1058427) b!1542249))

(assert (= (and b!1542249 res!1058426) b!1542252))

(assert (= (and b!1542251 condMapEmpty!58288) mapIsEmpty!58288))

(assert (= (and b!1542251 (not condMapEmpty!58288)) mapNonEmpty!58288))

(get-info :version)

(assert (= (and mapNonEmpty!58288 ((_ is ValueCellFull!17951) mapValue!58288)) b!1542248))

(assert (= (and b!1542251 ((_ is ValueCellFull!17951) mapDefault!58288)) b!1542253))

(assert (= start!131684 b!1542251))

(declare-fun m!1423269 () Bool)

(assert (=> mapNonEmpty!58288 m!1423269))

(declare-fun m!1423271 () Bool)

(assert (=> b!1542249 m!1423271))

(declare-fun m!1423273 () Bool)

(assert (=> b!1542252 m!1423273))

(declare-fun m!1423275 () Bool)

(assert (=> start!131684 m!1423275))

(declare-fun m!1423277 () Bool)

(assert (=> start!131684 m!1423277))

(declare-fun m!1423279 () Bool)

(assert (=> start!131684 m!1423279))

(check-sat (not b!1542249) tp_is_empty!37723 (not mapNonEmpty!58288) (not b!1542252) (not start!131684))
(check-sat)
