; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35524 () Bool)

(assert start!35524)

(declare-fun b!355988 () Bool)

(declare-fun e!218124 () Bool)

(assert (=> b!355988 (= e!218124 false)))

(declare-fun lt!165881 () Bool)

(declare-datatypes ((array!19529 0))(
  ( (array!19530 (arr!9258 (Array (_ BitVec 32) (_ BitVec 64))) (size!9610 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19529)

(declare-datatypes ((List!5356 0))(
  ( (Nil!5353) (Cons!5352 (h!6208 (_ BitVec 64)) (t!10506 List!5356)) )
))
(declare-fun arrayNoDuplicates!0 (array!19529 (_ BitVec 32) List!5356) Bool)

(assert (=> b!355988 (= lt!165881 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5353))))

(declare-fun mapNonEmpty!13473 () Bool)

(declare-fun mapRes!13473 () Bool)

(declare-fun tp!27450 () Bool)

(declare-fun e!218126 () Bool)

(assert (=> mapNonEmpty!13473 (= mapRes!13473 (and tp!27450 e!218126))))

(declare-datatypes ((V!11613 0))(
  ( (V!11614 (val!4033 Int)) )
))
(declare-datatypes ((ValueCell!3645 0))(
  ( (ValueCellFull!3645 (v!6227 V!11613)) (EmptyCell!3645) )
))
(declare-fun mapValue!13473 () ValueCell!3645)

(declare-fun mapRest!13473 () (Array (_ BitVec 32) ValueCell!3645))

(declare-fun mapKey!13473 () (_ BitVec 32))

(declare-datatypes ((array!19531 0))(
  ( (array!19532 (arr!9259 (Array (_ BitVec 32) ValueCell!3645)) (size!9611 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19531)

(assert (=> mapNonEmpty!13473 (= (arr!9259 _values!1208) (store mapRest!13473 mapKey!13473 mapValue!13473))))

(declare-fun res!197497 () Bool)

(assert (=> start!35524 (=> (not res!197497) (not e!218124))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35524 (= res!197497 (validMask!0 mask!1842))))

(assert (=> start!35524 e!218124))

(assert (=> start!35524 true))

(declare-fun e!218122 () Bool)

(declare-fun array_inv!6804 (array!19531) Bool)

(assert (=> start!35524 (and (array_inv!6804 _values!1208) e!218122)))

(declare-fun array_inv!6805 (array!19529) Bool)

(assert (=> start!35524 (array_inv!6805 _keys!1456)))

(declare-fun b!355989 () Bool)

(declare-fun tp_is_empty!7977 () Bool)

(assert (=> b!355989 (= e!218126 tp_is_empty!7977)))

(declare-fun b!355990 () Bool)

(declare-fun res!197495 () Bool)

(assert (=> b!355990 (=> (not res!197495) (not e!218124))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355990 (= res!197495 (and (= (size!9611 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9610 _keys!1456) (size!9611 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13473 () Bool)

(assert (=> mapIsEmpty!13473 mapRes!13473))

(declare-fun b!355991 () Bool)

(declare-fun e!218123 () Bool)

(assert (=> b!355991 (= e!218122 (and e!218123 mapRes!13473))))

(declare-fun condMapEmpty!13473 () Bool)

(declare-fun mapDefault!13473 () ValueCell!3645)

(assert (=> b!355991 (= condMapEmpty!13473 (= (arr!9259 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3645)) mapDefault!13473)))))

(declare-fun b!355992 () Bool)

(declare-fun res!197496 () Bool)

(assert (=> b!355992 (=> (not res!197496) (not e!218124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19529 (_ BitVec 32)) Bool)

(assert (=> b!355992 (= res!197496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355993 () Bool)

(assert (=> b!355993 (= e!218123 tp_is_empty!7977)))

(assert (= (and start!35524 res!197497) b!355990))

(assert (= (and b!355990 res!197495) b!355992))

(assert (= (and b!355992 res!197496) b!355988))

(assert (= (and b!355991 condMapEmpty!13473) mapIsEmpty!13473))

(assert (= (and b!355991 (not condMapEmpty!13473)) mapNonEmpty!13473))

(get-info :version)

(assert (= (and mapNonEmpty!13473 ((_ is ValueCellFull!3645) mapValue!13473)) b!355989))

(assert (= (and b!355991 ((_ is ValueCellFull!3645) mapDefault!13473)) b!355993))

(assert (= start!35524 b!355991))

(declare-fun m!354541 () Bool)

(assert (=> b!355988 m!354541))

(declare-fun m!354543 () Bool)

(assert (=> mapNonEmpty!13473 m!354543))

(declare-fun m!354545 () Bool)

(assert (=> start!35524 m!354545))

(declare-fun m!354547 () Bool)

(assert (=> start!35524 m!354547))

(declare-fun m!354549 () Bool)

(assert (=> start!35524 m!354549))

(declare-fun m!354551 () Bool)

(assert (=> b!355992 m!354551))

(check-sat (not start!35524) (not mapNonEmpty!13473) (not b!355988) tp_is_empty!7977 (not b!355992))
(check-sat)
