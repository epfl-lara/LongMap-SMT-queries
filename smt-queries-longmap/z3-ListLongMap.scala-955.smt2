; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20830 () Bool)

(assert start!20830)

(declare-fun b_free!5479 () Bool)

(declare-fun b_next!5479 () Bool)

(assert (=> start!20830 (= b_free!5479 (not b_next!5479))))

(declare-fun tp!19477 () Bool)

(declare-fun b_and!12199 () Bool)

(assert (=> start!20830 (= tp!19477 b_and!12199)))

(declare-fun b!208703 () Bool)

(declare-fun e!136051 () Bool)

(declare-fun e!136050 () Bool)

(declare-fun mapRes!9080 () Bool)

(assert (=> b!208703 (= e!136051 (and e!136050 mapRes!9080))))

(declare-fun condMapEmpty!9080 () Bool)

(declare-datatypes ((V!6769 0))(
  ( (V!6770 (val!2715 Int)) )
))
(declare-datatypes ((ValueCell!2327 0))(
  ( (ValueCellFull!2327 (v!4679 V!6769)) (EmptyCell!2327) )
))
(declare-datatypes ((array!9871 0))(
  ( (array!9872 (arr!4685 (Array (_ BitVec 32) ValueCell!2327)) (size!5011 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9871)

(declare-fun mapDefault!9080 () ValueCell!2327)

(assert (=> b!208703 (= condMapEmpty!9080 (= (arr!4685 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2327)) mapDefault!9080)))))

(declare-fun b!208704 () Bool)

(declare-fun res!101592 () Bool)

(declare-fun e!136049 () Bool)

(assert (=> b!208704 (=> (not res!101592) (not e!136049))))

(declare-datatypes ((array!9873 0))(
  ( (array!9874 (arr!4686 (Array (_ BitVec 32) (_ BitVec 64))) (size!5012 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9873)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208704 (= res!101592 (= (select (arr!4686 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!9080 () Bool)

(declare-fun tp!19478 () Bool)

(declare-fun e!136052 () Bool)

(assert (=> mapNonEmpty!9080 (= mapRes!9080 (and tp!19478 e!136052))))

(declare-fun mapRest!9080 () (Array (_ BitVec 32) ValueCell!2327))

(declare-fun mapKey!9080 () (_ BitVec 32))

(declare-fun mapValue!9080 () ValueCell!2327)

(assert (=> mapNonEmpty!9080 (= (arr!4685 _values!649) (store mapRest!9080 mapKey!9080 mapValue!9080))))

(declare-fun b!208705 () Bool)

(declare-fun res!101589 () Bool)

(assert (=> b!208705 (=> (not res!101589) (not e!136049))))

(declare-datatypes ((List!2997 0))(
  ( (Nil!2994) (Cons!2993 (h!3635 (_ BitVec 64)) (t!7919 List!2997)) )
))
(declare-fun arrayNoDuplicates!0 (array!9873 (_ BitVec 32) List!2997) Bool)

(assert (=> b!208705 (= res!101589 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2994))))

(declare-fun res!101588 () Bool)

(assert (=> start!20830 (=> (not res!101588) (not e!136049))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20830 (= res!101588 (validMask!0 mask!1149))))

(assert (=> start!20830 e!136049))

(declare-fun array_inv!3079 (array!9871) Bool)

(assert (=> start!20830 (and (array_inv!3079 _values!649) e!136051)))

(assert (=> start!20830 true))

(declare-fun tp_is_empty!5341 () Bool)

(assert (=> start!20830 tp_is_empty!5341))

(declare-fun array_inv!3080 (array!9873) Bool)

(assert (=> start!20830 (array_inv!3080 _keys!825)))

(assert (=> start!20830 tp!19477))

(declare-fun b!208706 () Bool)

(declare-fun res!101591 () Bool)

(assert (=> b!208706 (=> (not res!101591) (not e!136049))))

(assert (=> b!208706 (= res!101591 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5012 _keys!825))))))

(declare-fun b!208707 () Bool)

(assert (=> b!208707 (= e!136049 false)))

(declare-fun v!520 () V!6769)

(declare-fun zeroValue!615 () V!6769)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6769)

(declare-datatypes ((tuple2!4090 0))(
  ( (tuple2!4091 (_1!2056 (_ BitVec 64)) (_2!2056 V!6769)) )
))
(declare-datatypes ((List!2998 0))(
  ( (Nil!2995) (Cons!2994 (h!3636 tuple2!4090) (t!7920 List!2998)) )
))
(declare-datatypes ((ListLongMap!2993 0))(
  ( (ListLongMap!2994 (toList!1512 List!2998)) )
))
(declare-fun lt!106688 () ListLongMap!2993)

(declare-fun getCurrentListMapNoExtraKeys!463 (array!9873 array!9871 (_ BitVec 32) (_ BitVec 32) V!6769 V!6769 (_ BitVec 32) Int) ListLongMap!2993)

(assert (=> b!208707 (= lt!106688 (getCurrentListMapNoExtraKeys!463 _keys!825 (array!9872 (store (arr!4685 _values!649) i!601 (ValueCellFull!2327 v!520)) (size!5011 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106687 () ListLongMap!2993)

(assert (=> b!208707 (= lt!106687 (getCurrentListMapNoExtraKeys!463 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208708 () Bool)

(assert (=> b!208708 (= e!136050 tp_is_empty!5341)))

(declare-fun b!208709 () Bool)

(assert (=> b!208709 (= e!136052 tp_is_empty!5341)))

(declare-fun b!208710 () Bool)

(declare-fun res!101590 () Bool)

(assert (=> b!208710 (=> (not res!101590) (not e!136049))))

(assert (=> b!208710 (= res!101590 (and (= (size!5011 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5012 _keys!825) (size!5011 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208711 () Bool)

(declare-fun res!101593 () Bool)

(assert (=> b!208711 (=> (not res!101593) (not e!136049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9873 (_ BitVec 32)) Bool)

(assert (=> b!208711 (= res!101593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!9080 () Bool)

(assert (=> mapIsEmpty!9080 mapRes!9080))

(declare-fun b!208712 () Bool)

(declare-fun res!101594 () Bool)

(assert (=> b!208712 (=> (not res!101594) (not e!136049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208712 (= res!101594 (validKeyInArray!0 k0!843))))

(assert (= (and start!20830 res!101588) b!208710))

(assert (= (and b!208710 res!101590) b!208711))

(assert (= (and b!208711 res!101593) b!208705))

(assert (= (and b!208705 res!101589) b!208706))

(assert (= (and b!208706 res!101591) b!208712))

(assert (= (and b!208712 res!101594) b!208704))

(assert (= (and b!208704 res!101592) b!208707))

(assert (= (and b!208703 condMapEmpty!9080) mapIsEmpty!9080))

(assert (= (and b!208703 (not condMapEmpty!9080)) mapNonEmpty!9080))

(get-info :version)

(assert (= (and mapNonEmpty!9080 ((_ is ValueCellFull!2327) mapValue!9080)) b!208709))

(assert (= (and b!208703 ((_ is ValueCellFull!2327) mapDefault!9080)) b!208708))

(assert (= start!20830 b!208703))

(declare-fun m!235755 () Bool)

(assert (=> start!20830 m!235755))

(declare-fun m!235757 () Bool)

(assert (=> start!20830 m!235757))

(declare-fun m!235759 () Bool)

(assert (=> start!20830 m!235759))

(declare-fun m!235761 () Bool)

(assert (=> b!208704 m!235761))

(declare-fun m!235763 () Bool)

(assert (=> b!208712 m!235763))

(declare-fun m!235765 () Bool)

(assert (=> mapNonEmpty!9080 m!235765))

(declare-fun m!235767 () Bool)

(assert (=> b!208711 m!235767))

(declare-fun m!235769 () Bool)

(assert (=> b!208707 m!235769))

(declare-fun m!235771 () Bool)

(assert (=> b!208707 m!235771))

(declare-fun m!235773 () Bool)

(assert (=> b!208707 m!235773))

(declare-fun m!235775 () Bool)

(assert (=> b!208705 m!235775))

(check-sat (not b!208712) (not b_next!5479) (not b!208705) b_and!12199 (not start!20830) (not b!208707) (not mapNonEmpty!9080) tp_is_empty!5341 (not b!208711))
(check-sat b_and!12199 (not b_next!5479))
