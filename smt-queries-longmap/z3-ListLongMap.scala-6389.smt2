; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82112 () Bool)

(assert start!82112)

(declare-fun b!957090 () Bool)

(declare-fun e!539447 () Bool)

(declare-fun e!539446 () Bool)

(declare-fun mapRes!33643 () Bool)

(assert (=> b!957090 (= e!539447 (and e!539446 mapRes!33643))))

(declare-fun condMapEmpty!33643 () Bool)

(declare-datatypes ((V!33129 0))(
  ( (V!33130 (val!10605 Int)) )
))
(declare-datatypes ((ValueCell!10073 0))(
  ( (ValueCellFull!10073 (v!13161 V!33129)) (EmptyCell!10073) )
))
(declare-datatypes ((array!58264 0))(
  ( (array!58265 (arr!28006 (Array (_ BitVec 32) ValueCell!10073)) (size!28487 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58264)

(declare-fun mapDefault!33643 () ValueCell!10073)

(assert (=> b!957090 (= condMapEmpty!33643 (= (arr!28006 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10073)) mapDefault!33643)))))

(declare-fun b!957091 () Bool)

(declare-fun e!539444 () Bool)

(assert (=> b!957091 (= e!539444 false)))

(declare-fun lt!430069 () Bool)

(declare-datatypes ((array!58266 0))(
  ( (array!58267 (arr!28007 (Array (_ BitVec 32) (_ BitVec 64))) (size!28488 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58266)

(declare-datatypes ((List!19516 0))(
  ( (Nil!19513) (Cons!19512 (h!20674 (_ BitVec 64)) (t!27870 List!19516)) )
))
(declare-fun arrayNoDuplicates!0 (array!58266 (_ BitVec 32) List!19516) Bool)

(assert (=> b!957091 (= lt!430069 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19513))))

(declare-fun b!957092 () Bool)

(declare-fun e!539443 () Bool)

(declare-fun tp_is_empty!21109 () Bool)

(assert (=> b!957092 (= e!539443 tp_is_empty!21109)))

(declare-fun mapNonEmpty!33643 () Bool)

(declare-fun tp!64249 () Bool)

(assert (=> mapNonEmpty!33643 (= mapRes!33643 (and tp!64249 e!539443))))

(declare-fun mapKey!33643 () (_ BitVec 32))

(declare-fun mapValue!33643 () ValueCell!10073)

(declare-fun mapRest!33643 () (Array (_ BitVec 32) ValueCell!10073))

(assert (=> mapNonEmpty!33643 (= (arr!28006 _values!1386) (store mapRest!33643 mapKey!33643 mapValue!33643))))

(declare-fun b!957093 () Bool)

(assert (=> b!957093 (= e!539446 tp_is_empty!21109)))

(declare-fun b!957094 () Bool)

(declare-fun res!640767 () Bool)

(assert (=> b!957094 (=> (not res!640767) (not e!539444))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957094 (= res!640767 (and (= (size!28487 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28488 _keys!1668) (size!28487 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957095 () Bool)

(declare-fun res!640765 () Bool)

(assert (=> b!957095 (=> (not res!640765) (not e!539444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58266 (_ BitVec 32)) Bool)

(assert (=> b!957095 (= res!640765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33643 () Bool)

(assert (=> mapIsEmpty!33643 mapRes!33643))

(declare-fun res!640766 () Bool)

(assert (=> start!82112 (=> (not res!640766) (not e!539444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82112 (= res!640766 (validMask!0 mask!2088))))

(assert (=> start!82112 e!539444))

(assert (=> start!82112 true))

(declare-fun array_inv!21787 (array!58264) Bool)

(assert (=> start!82112 (and (array_inv!21787 _values!1386) e!539447)))

(declare-fun array_inv!21788 (array!58266) Bool)

(assert (=> start!82112 (array_inv!21788 _keys!1668)))

(assert (= (and start!82112 res!640766) b!957094))

(assert (= (and b!957094 res!640767) b!957095))

(assert (= (and b!957095 res!640765) b!957091))

(assert (= (and b!957090 condMapEmpty!33643) mapIsEmpty!33643))

(assert (= (and b!957090 (not condMapEmpty!33643)) mapNonEmpty!33643))

(get-info :version)

(assert (= (and mapNonEmpty!33643 ((_ is ValueCellFull!10073) mapValue!33643)) b!957092))

(assert (= (and b!957090 ((_ is ValueCellFull!10073) mapDefault!33643)) b!957093))

(assert (= start!82112 b!957090))

(declare-fun m!887583 () Bool)

(assert (=> b!957091 m!887583))

(declare-fun m!887585 () Bool)

(assert (=> mapNonEmpty!33643 m!887585))

(declare-fun m!887587 () Bool)

(assert (=> b!957095 m!887587))

(declare-fun m!887589 () Bool)

(assert (=> start!82112 m!887589))

(declare-fun m!887591 () Bool)

(assert (=> start!82112 m!887591))

(declare-fun m!887593 () Bool)

(assert (=> start!82112 m!887593))

(check-sat tp_is_empty!21109 (not mapNonEmpty!33643) (not b!957091) (not start!82112) (not b!957095))
(check-sat)
