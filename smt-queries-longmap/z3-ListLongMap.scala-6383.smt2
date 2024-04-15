; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82032 () Bool)

(assert start!82032)

(declare-fun res!640555 () Bool)

(declare-fun e!539080 () Bool)

(assert (=> start!82032 (=> (not res!640555) (not e!539080))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82032 (= res!640555 (validMask!0 mask!2088))))

(assert (=> start!82032 e!539080))

(assert (=> start!82032 true))

(declare-datatypes ((V!33081 0))(
  ( (V!33082 (val!10587 Int)) )
))
(declare-datatypes ((ValueCell!10055 0))(
  ( (ValueCellFull!10055 (v!13142 V!33081)) (EmptyCell!10055) )
))
(declare-datatypes ((array!58190 0))(
  ( (array!58191 (arr!27974 (Array (_ BitVec 32) ValueCell!10055)) (size!28455 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58190)

(declare-fun e!539078 () Bool)

(declare-fun array_inv!21763 (array!58190) Bool)

(assert (=> start!82032 (and (array_inv!21763 _values!1386) e!539078)))

(declare-datatypes ((array!58192 0))(
  ( (array!58193 (arr!27975 (Array (_ BitVec 32) (_ BitVec 64))) (size!28456 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58192)

(declare-fun array_inv!21764 (array!58192) Bool)

(assert (=> start!82032 (array_inv!21764 _keys!1668)))

(declare-fun b!956654 () Bool)

(declare-fun e!539081 () Bool)

(declare-fun mapRes!33574 () Bool)

(assert (=> b!956654 (= e!539078 (and e!539081 mapRes!33574))))

(declare-fun condMapEmpty!33574 () Bool)

(declare-fun mapDefault!33574 () ValueCell!10055)

(assert (=> b!956654 (= condMapEmpty!33574 (= (arr!27974 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10055)) mapDefault!33574)))))

(declare-fun mapIsEmpty!33574 () Bool)

(assert (=> mapIsEmpty!33574 mapRes!33574))

(declare-fun mapNonEmpty!33574 () Bool)

(declare-fun tp!64180 () Bool)

(declare-fun e!539082 () Bool)

(assert (=> mapNonEmpty!33574 (= mapRes!33574 (and tp!64180 e!539082))))

(declare-fun mapRest!33574 () (Array (_ BitVec 32) ValueCell!10055))

(declare-fun mapKey!33574 () (_ BitVec 32))

(declare-fun mapValue!33574 () ValueCell!10055)

(assert (=> mapNonEmpty!33574 (= (arr!27974 _values!1386) (store mapRest!33574 mapKey!33574 mapValue!33574))))

(declare-fun b!956655 () Bool)

(declare-fun tp_is_empty!21073 () Bool)

(assert (=> b!956655 (= e!539081 tp_is_empty!21073)))

(declare-fun b!956656 () Bool)

(assert (=> b!956656 (= e!539082 tp_is_empty!21073)))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun b!956657 () Bool)

(assert (=> b!956657 (= e!539080 (and (= (size!28455 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28456 _keys!1668) (size!28455 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011) (not (= (size!28456 _keys!1668) (bvadd #b00000000000000000000000000000001 mask!2088)))))))

(assert (= (and start!82032 res!640555) b!956657))

(assert (= (and b!956654 condMapEmpty!33574) mapIsEmpty!33574))

(assert (= (and b!956654 (not condMapEmpty!33574)) mapNonEmpty!33574))

(get-info :version)

(assert (= (and mapNonEmpty!33574 ((_ is ValueCellFull!10055) mapValue!33574)) b!956656))

(assert (= (and b!956654 ((_ is ValueCellFull!10055) mapDefault!33574)) b!956655))

(assert (= start!82032 b!956654))

(declare-fun m!887315 () Bool)

(assert (=> start!82032 m!887315))

(declare-fun m!887317 () Bool)

(assert (=> start!82032 m!887317))

(declare-fun m!887319 () Bool)

(assert (=> start!82032 m!887319))

(declare-fun m!887321 () Bool)

(assert (=> mapNonEmpty!33574 m!887321))

(check-sat (not start!82032) (not mapNonEmpty!33574) tp_is_empty!21073)
(check-sat)
