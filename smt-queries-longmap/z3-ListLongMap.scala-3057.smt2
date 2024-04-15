; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43170 () Bool)

(assert start!43170)

(declare-fun b!478371 () Bool)

(declare-fun e!281270 () Bool)

(declare-fun e!281274 () Bool)

(declare-fun mapRes!22054 () Bool)

(assert (=> b!478371 (= e!281270 (and e!281274 mapRes!22054))))

(declare-fun condMapEmpty!22054 () Bool)

(declare-datatypes ((V!19169 0))(
  ( (V!19170 (val!6834 Int)) )
))
(declare-datatypes ((ValueCell!6425 0))(
  ( (ValueCellFull!6425 (v!9117 V!19169)) (EmptyCell!6425) )
))
(declare-datatypes ((array!30815 0))(
  ( (array!30816 (arr!14815 (Array (_ BitVec 32) ValueCell!6425)) (size!15174 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30815)

(declare-fun mapDefault!22054 () ValueCell!6425)

(assert (=> b!478371 (= condMapEmpty!22054 (= (arr!14815 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6425)) mapDefault!22054)))))

(declare-fun mapNonEmpty!22054 () Bool)

(declare-fun tp!42529 () Bool)

(declare-fun e!281271 () Bool)

(assert (=> mapNonEmpty!22054 (= mapRes!22054 (and tp!42529 e!281271))))

(declare-fun mapRest!22054 () (Array (_ BitVec 32) ValueCell!6425))

(declare-fun mapValue!22054 () ValueCell!6425)

(declare-fun mapKey!22054 () (_ BitVec 32))

(assert (=> mapNonEmpty!22054 (= (arr!14815 _values!1516) (store mapRest!22054 mapKey!22054 mapValue!22054))))

(declare-fun b!478372 () Bool)

(declare-fun res!285441 () Bool)

(declare-fun e!281272 () Bool)

(assert (=> b!478372 (=> (not res!285441) (not e!281272))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30817 0))(
  ( (array!30818 (arr!14816 (Array (_ BitVec 32) (_ BitVec 64))) (size!15175 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30817)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478372 (= res!285441 (and (= (size!15174 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15175 _keys!1874) (size!15174 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478374 () Bool)

(declare-fun res!285440 () Bool)

(assert (=> b!478374 (=> (not res!285440) (not e!281272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30817 (_ BitVec 32)) Bool)

(assert (=> b!478374 (= res!285440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478375 () Bool)

(declare-fun tp_is_empty!13573 () Bool)

(assert (=> b!478375 (= e!281271 tp_is_empty!13573)))

(declare-fun b!478373 () Bool)

(assert (=> b!478373 (= e!281274 tp_is_empty!13573)))

(declare-fun res!285439 () Bool)

(assert (=> start!43170 (=> (not res!285439) (not e!281272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43170 (= res!285439 (validMask!0 mask!2352))))

(assert (=> start!43170 e!281272))

(assert (=> start!43170 true))

(declare-fun array_inv!10774 (array!30815) Bool)

(assert (=> start!43170 (and (array_inv!10774 _values!1516) e!281270)))

(declare-fun array_inv!10775 (array!30817) Bool)

(assert (=> start!43170 (array_inv!10775 _keys!1874)))

(declare-fun b!478376 () Bool)

(assert (=> b!478376 (= e!281272 false)))

(declare-fun lt!217510 () Bool)

(declare-datatypes ((List!9108 0))(
  ( (Nil!9105) (Cons!9104 (h!9960 (_ BitVec 64)) (t!15305 List!9108)) )
))
(declare-fun arrayNoDuplicates!0 (array!30817 (_ BitVec 32) List!9108) Bool)

(assert (=> b!478376 (= lt!217510 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9105))))

(declare-fun mapIsEmpty!22054 () Bool)

(assert (=> mapIsEmpty!22054 mapRes!22054))

(assert (= (and start!43170 res!285439) b!478372))

(assert (= (and b!478372 res!285441) b!478374))

(assert (= (and b!478374 res!285440) b!478376))

(assert (= (and b!478371 condMapEmpty!22054) mapIsEmpty!22054))

(assert (= (and b!478371 (not condMapEmpty!22054)) mapNonEmpty!22054))

(get-info :version)

(assert (= (and mapNonEmpty!22054 ((_ is ValueCellFull!6425) mapValue!22054)) b!478375))

(assert (= (and b!478371 ((_ is ValueCellFull!6425) mapDefault!22054)) b!478373))

(assert (= start!43170 b!478371))

(declare-fun m!460107 () Bool)

(assert (=> mapNonEmpty!22054 m!460107))

(declare-fun m!460109 () Bool)

(assert (=> b!478374 m!460109))

(declare-fun m!460111 () Bool)

(assert (=> start!43170 m!460111))

(declare-fun m!460113 () Bool)

(assert (=> start!43170 m!460113))

(declare-fun m!460115 () Bool)

(assert (=> start!43170 m!460115))

(declare-fun m!460117 () Bool)

(assert (=> b!478376 m!460117))

(check-sat (not b!478376) tp_is_empty!13573 (not b!478374) (not mapNonEmpty!22054) (not start!43170))
(check-sat)
