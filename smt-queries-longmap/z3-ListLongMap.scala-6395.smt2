; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82148 () Bool)

(assert start!82148)

(declare-fun b!957414 () Bool)

(declare-fun e!539717 () Bool)

(assert (=> b!957414 (= e!539717 false)))

(declare-fun lt!430123 () Bool)

(declare-datatypes ((array!58334 0))(
  ( (array!58335 (arr!28041 (Array (_ BitVec 32) (_ BitVec 64))) (size!28522 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58334)

(declare-datatypes ((List!19532 0))(
  ( (Nil!19529) (Cons!19528 (h!20690 (_ BitVec 64)) (t!27886 List!19532)) )
))
(declare-fun arrayNoDuplicates!0 (array!58334 (_ BitVec 32) List!19532) Bool)

(assert (=> b!957414 (= lt!430123 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19529))))

(declare-fun mapIsEmpty!33697 () Bool)

(declare-fun mapRes!33697 () Bool)

(assert (=> mapIsEmpty!33697 mapRes!33697))

(declare-fun res!640928 () Bool)

(assert (=> start!82148 (=> (not res!640928) (not e!539717))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82148 (= res!640928 (validMask!0 mask!2088))))

(assert (=> start!82148 e!539717))

(assert (=> start!82148 true))

(declare-datatypes ((V!33177 0))(
  ( (V!33178 (val!10623 Int)) )
))
(declare-datatypes ((ValueCell!10091 0))(
  ( (ValueCellFull!10091 (v!13179 V!33177)) (EmptyCell!10091) )
))
(declare-datatypes ((array!58336 0))(
  ( (array!58337 (arr!28042 (Array (_ BitVec 32) ValueCell!10091)) (size!28523 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58336)

(declare-fun e!539713 () Bool)

(declare-fun array_inv!21811 (array!58336) Bool)

(assert (=> start!82148 (and (array_inv!21811 _values!1386) e!539713)))

(declare-fun array_inv!21812 (array!58334) Bool)

(assert (=> start!82148 (array_inv!21812 _keys!1668)))

(declare-fun b!957415 () Bool)

(declare-fun e!539715 () Bool)

(assert (=> b!957415 (= e!539713 (and e!539715 mapRes!33697))))

(declare-fun condMapEmpty!33697 () Bool)

(declare-fun mapDefault!33697 () ValueCell!10091)

(assert (=> b!957415 (= condMapEmpty!33697 (= (arr!28042 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10091)) mapDefault!33697)))))

(declare-fun b!957416 () Bool)

(declare-fun tp_is_empty!21145 () Bool)

(assert (=> b!957416 (= e!539715 tp_is_empty!21145)))

(declare-fun mapNonEmpty!33697 () Bool)

(declare-fun tp!64303 () Bool)

(declare-fun e!539714 () Bool)

(assert (=> mapNonEmpty!33697 (= mapRes!33697 (and tp!64303 e!539714))))

(declare-fun mapKey!33697 () (_ BitVec 32))

(declare-fun mapRest!33697 () (Array (_ BitVec 32) ValueCell!10091))

(declare-fun mapValue!33697 () ValueCell!10091)

(assert (=> mapNonEmpty!33697 (= (arr!28042 _values!1386) (store mapRest!33697 mapKey!33697 mapValue!33697))))

(declare-fun b!957417 () Bool)

(declare-fun res!640927 () Bool)

(assert (=> b!957417 (=> (not res!640927) (not e!539717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58334 (_ BitVec 32)) Bool)

(assert (=> b!957417 (= res!640927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957418 () Bool)

(declare-fun res!640929 () Bool)

(assert (=> b!957418 (=> (not res!640929) (not e!539717))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957418 (= res!640929 (and (= (size!28523 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28522 _keys!1668) (size!28523 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957419 () Bool)

(assert (=> b!957419 (= e!539714 tp_is_empty!21145)))

(assert (= (and start!82148 res!640928) b!957418))

(assert (= (and b!957418 res!640929) b!957417))

(assert (= (and b!957417 res!640927) b!957414))

(assert (= (and b!957415 condMapEmpty!33697) mapIsEmpty!33697))

(assert (= (and b!957415 (not condMapEmpty!33697)) mapNonEmpty!33697))

(get-info :version)

(assert (= (and mapNonEmpty!33697 ((_ is ValueCellFull!10091) mapValue!33697)) b!957419))

(assert (= (and b!957415 ((_ is ValueCellFull!10091) mapDefault!33697)) b!957416))

(assert (= start!82148 b!957415))

(declare-fun m!887799 () Bool)

(assert (=> b!957414 m!887799))

(declare-fun m!887801 () Bool)

(assert (=> start!82148 m!887801))

(declare-fun m!887803 () Bool)

(assert (=> start!82148 m!887803))

(declare-fun m!887805 () Bool)

(assert (=> start!82148 m!887805))

(declare-fun m!887807 () Bool)

(assert (=> mapNonEmpty!33697 m!887807))

(declare-fun m!887809 () Bool)

(assert (=> b!957417 m!887809))

(check-sat (not start!82148) (not b!957414) (not b!957417) tp_is_empty!21145 (not mapNonEmpty!33697))
(check-sat)
