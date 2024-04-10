; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39618 () Bool)

(assert start!39618)

(declare-fun b_free!9885 () Bool)

(declare-fun b_next!9885 () Bool)

(assert (=> start!39618 (= b_free!9885 (not b_next!9885))))

(declare-fun tp!35184 () Bool)

(declare-fun b_and!17541 () Bool)

(assert (=> start!39618 (= tp!35184 b_and!17541)))

(declare-fun b!424659 () Bool)

(declare-fun res!248454 () Bool)

(declare-fun e!252227 () Bool)

(assert (=> b!424659 (=> (not res!248454) (not e!252227))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25913 0))(
  ( (array!25914 (arr!12406 (Array (_ BitVec 32) (_ BitVec 64))) (size!12758 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25913)

(assert (=> b!424659 (= res!248454 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12758 _keys!709))))))

(declare-fun b!424660 () Bool)

(declare-fun res!248463 () Bool)

(assert (=> b!424660 (=> (not res!248463) (not e!252227))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424660 (= res!248463 (validMask!0 mask!1025))))

(declare-fun b!424661 () Bool)

(declare-fun e!252224 () Bool)

(declare-fun e!252223 () Bool)

(declare-fun mapRes!18177 () Bool)

(assert (=> b!424661 (= e!252224 (and e!252223 mapRes!18177))))

(declare-fun condMapEmpty!18177 () Bool)

(declare-datatypes ((V!15821 0))(
  ( (V!15822 (val!5563 Int)) )
))
(declare-datatypes ((ValueCell!5175 0))(
  ( (ValueCellFull!5175 (v!7810 V!15821)) (EmptyCell!5175) )
))
(declare-datatypes ((array!25915 0))(
  ( (array!25916 (arr!12407 (Array (_ BitVec 32) ValueCell!5175)) (size!12759 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25915)

(declare-fun mapDefault!18177 () ValueCell!5175)

(assert (=> b!424661 (= condMapEmpty!18177 (= (arr!12407 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5175)) mapDefault!18177)))))

(declare-fun res!248462 () Bool)

(assert (=> start!39618 (=> (not res!248462) (not e!252227))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39618 (= res!248462 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12758 _keys!709))))))

(assert (=> start!39618 e!252227))

(declare-fun tp_is_empty!11037 () Bool)

(assert (=> start!39618 tp_is_empty!11037))

(assert (=> start!39618 tp!35184))

(assert (=> start!39618 true))

(declare-fun array_inv!9040 (array!25915) Bool)

(assert (=> start!39618 (and (array_inv!9040 _values!549) e!252224)))

(declare-fun array_inv!9041 (array!25913) Bool)

(assert (=> start!39618 (array_inv!9041 _keys!709)))

(declare-fun b!424662 () Bool)

(declare-fun e!252225 () Bool)

(assert (=> b!424662 (= e!252225 tp_is_empty!11037)))

(declare-fun b!424663 () Bool)

(assert (=> b!424663 (= e!252223 tp_is_empty!11037)))

(declare-fun b!424664 () Bool)

(declare-fun res!248456 () Bool)

(assert (=> b!424664 (=> (not res!248456) (not e!252227))))

(assert (=> b!424664 (= res!248456 (or (= (select (arr!12406 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12406 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424665 () Bool)

(declare-fun res!248453 () Bool)

(assert (=> b!424665 (=> (not res!248453) (not e!252227))))

(declare-datatypes ((List!7315 0))(
  ( (Nil!7312) (Cons!7311 (h!8167 (_ BitVec 64)) (t!12759 List!7315)) )
))
(declare-fun arrayNoDuplicates!0 (array!25913 (_ BitVec 32) List!7315) Bool)

(assert (=> b!424665 (= res!248453 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7312))))

(declare-fun b!424666 () Bool)

(declare-fun res!248455 () Bool)

(declare-fun e!252228 () Bool)

(assert (=> b!424666 (=> (not res!248455) (not e!252228))))

(assert (=> b!424666 (= res!248455 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18177 () Bool)

(declare-fun tp!35183 () Bool)

(assert (=> mapNonEmpty!18177 (= mapRes!18177 (and tp!35183 e!252225))))

(declare-fun mapKey!18177 () (_ BitVec 32))

(declare-fun mapValue!18177 () ValueCell!5175)

(declare-fun mapRest!18177 () (Array (_ BitVec 32) ValueCell!5175))

(assert (=> mapNonEmpty!18177 (= (arr!12407 _values!549) (store mapRest!18177 mapKey!18177 mapValue!18177))))

(declare-fun b!424667 () Bool)

(declare-fun res!248460 () Bool)

(assert (=> b!424667 (=> (not res!248460) (not e!252227))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424667 (= res!248460 (validKeyInArray!0 k0!794))))

(declare-fun b!424668 () Bool)

(assert (=> b!424668 (= e!252228 false)))

(declare-fun minValue!515 () V!15821)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7304 0))(
  ( (tuple2!7305 (_1!3663 (_ BitVec 64)) (_2!3663 V!15821)) )
))
(declare-datatypes ((List!7316 0))(
  ( (Nil!7313) (Cons!7312 (h!8168 tuple2!7304) (t!12760 List!7316)) )
))
(declare-datatypes ((ListLongMap!6217 0))(
  ( (ListLongMap!6218 (toList!3124 List!7316)) )
))
(declare-fun lt!194414 () ListLongMap!6217)

(declare-fun zeroValue!515 () V!15821)

(declare-fun lt!194413 () array!25913)

(declare-fun v!412 () V!15821)

(declare-fun getCurrentListMapNoExtraKeys!1328 (array!25913 array!25915 (_ BitVec 32) (_ BitVec 32) V!15821 V!15821 (_ BitVec 32) Int) ListLongMap!6217)

(assert (=> b!424668 (= lt!194414 (getCurrentListMapNoExtraKeys!1328 lt!194413 (array!25916 (store (arr!12407 _values!549) i!563 (ValueCellFull!5175 v!412)) (size!12759 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194412 () ListLongMap!6217)

(assert (=> b!424668 (= lt!194412 (getCurrentListMapNoExtraKeys!1328 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424669 () Bool)

(declare-fun res!248461 () Bool)

(assert (=> b!424669 (=> (not res!248461) (not e!252227))))

(assert (=> b!424669 (= res!248461 (and (= (size!12759 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12758 _keys!709) (size!12759 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424670 () Bool)

(declare-fun res!248457 () Bool)

(assert (=> b!424670 (=> (not res!248457) (not e!252227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25913 (_ BitVec 32)) Bool)

(assert (=> b!424670 (= res!248457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424671 () Bool)

(assert (=> b!424671 (= e!252227 e!252228)))

(declare-fun res!248458 () Bool)

(assert (=> b!424671 (=> (not res!248458) (not e!252228))))

(assert (=> b!424671 (= res!248458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194413 mask!1025))))

(assert (=> b!424671 (= lt!194413 (array!25914 (store (arr!12406 _keys!709) i!563 k0!794) (size!12758 _keys!709)))))

(declare-fun b!424672 () Bool)

(declare-fun res!248452 () Bool)

(assert (=> b!424672 (=> (not res!248452) (not e!252228))))

(assert (=> b!424672 (= res!248452 (arrayNoDuplicates!0 lt!194413 #b00000000000000000000000000000000 Nil!7312))))

(declare-fun b!424673 () Bool)

(declare-fun res!248459 () Bool)

(assert (=> b!424673 (=> (not res!248459) (not e!252227))))

(declare-fun arrayContainsKey!0 (array!25913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424673 (= res!248459 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18177 () Bool)

(assert (=> mapIsEmpty!18177 mapRes!18177))

(assert (= (and start!39618 res!248462) b!424660))

(assert (= (and b!424660 res!248463) b!424669))

(assert (= (and b!424669 res!248461) b!424670))

(assert (= (and b!424670 res!248457) b!424665))

(assert (= (and b!424665 res!248453) b!424659))

(assert (= (and b!424659 res!248454) b!424667))

(assert (= (and b!424667 res!248460) b!424664))

(assert (= (and b!424664 res!248456) b!424673))

(assert (= (and b!424673 res!248459) b!424671))

(assert (= (and b!424671 res!248458) b!424672))

(assert (= (and b!424672 res!248452) b!424666))

(assert (= (and b!424666 res!248455) b!424668))

(assert (= (and b!424661 condMapEmpty!18177) mapIsEmpty!18177))

(assert (= (and b!424661 (not condMapEmpty!18177)) mapNonEmpty!18177))

(get-info :version)

(assert (= (and mapNonEmpty!18177 ((_ is ValueCellFull!5175) mapValue!18177)) b!424662))

(assert (= (and b!424661 ((_ is ValueCellFull!5175) mapDefault!18177)) b!424663))

(assert (= start!39618 b!424661))

(declare-fun m!413733 () Bool)

(assert (=> b!424671 m!413733))

(declare-fun m!413735 () Bool)

(assert (=> b!424671 m!413735))

(declare-fun m!413737 () Bool)

(assert (=> b!424668 m!413737))

(declare-fun m!413739 () Bool)

(assert (=> b!424668 m!413739))

(declare-fun m!413741 () Bool)

(assert (=> b!424668 m!413741))

(declare-fun m!413743 () Bool)

(assert (=> b!424673 m!413743))

(declare-fun m!413745 () Bool)

(assert (=> mapNonEmpty!18177 m!413745))

(declare-fun m!413747 () Bool)

(assert (=> b!424660 m!413747))

(declare-fun m!413749 () Bool)

(assert (=> b!424667 m!413749))

(declare-fun m!413751 () Bool)

(assert (=> b!424664 m!413751))

(declare-fun m!413753 () Bool)

(assert (=> b!424672 m!413753))

(declare-fun m!413755 () Bool)

(assert (=> b!424670 m!413755))

(declare-fun m!413757 () Bool)

(assert (=> start!39618 m!413757))

(declare-fun m!413759 () Bool)

(assert (=> start!39618 m!413759))

(declare-fun m!413761 () Bool)

(assert (=> b!424665 m!413761))

(check-sat (not b!424671) (not b!424667) (not b!424668) (not b!424665) (not mapNonEmpty!18177) (not b!424670) tp_is_empty!11037 (not b!424673) (not b!424672) (not b!424660) b_and!17541 (not start!39618) (not b_next!9885))
(check-sat b_and!17541 (not b_next!9885))
