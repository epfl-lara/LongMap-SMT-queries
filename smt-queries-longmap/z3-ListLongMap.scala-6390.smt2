; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82138 () Bool)

(assert start!82138)

(declare-fun mapIsEmpty!33655 () Bool)

(declare-fun mapRes!33655 () Bool)

(assert (=> mapIsEmpty!33655 mapRes!33655))

(declare-fun b!957401 () Bool)

(declare-fun e!539653 () Bool)

(declare-fun tp_is_empty!21117 () Bool)

(assert (=> b!957401 (= e!539653 tp_is_empty!21117)))

(declare-fun b!957402 () Bool)

(declare-fun e!539654 () Bool)

(assert (=> b!957402 (= e!539654 tp_is_empty!21117)))

(declare-fun b!957403 () Bool)

(declare-fun res!640913 () Bool)

(declare-fun e!539655 () Bool)

(assert (=> b!957403 (=> (not res!640913) (not e!539655))))

(declare-datatypes ((array!58339 0))(
  ( (array!58340 (arr!28043 (Array (_ BitVec 32) (_ BitVec 64))) (size!28522 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58339)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58339 (_ BitVec 32)) Bool)

(assert (=> b!957403 (= res!640913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957404 () Bool)

(declare-fun res!640911 () Bool)

(assert (=> b!957404 (=> (not res!640911) (not e!539655))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33139 0))(
  ( (V!33140 (val!10609 Int)) )
))
(declare-datatypes ((ValueCell!10077 0))(
  ( (ValueCellFull!10077 (v!13166 V!33139)) (EmptyCell!10077) )
))
(declare-datatypes ((array!58341 0))(
  ( (array!58342 (arr!28044 (Array (_ BitVec 32) ValueCell!10077)) (size!28523 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58341)

(assert (=> b!957404 (= res!640911 (and (= (size!28523 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28522 _keys!1668) (size!28523 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957405 () Bool)

(declare-fun e!539651 () Bool)

(assert (=> b!957405 (= e!539651 (and e!539653 mapRes!33655))))

(declare-fun condMapEmpty!33655 () Bool)

(declare-fun mapDefault!33655 () ValueCell!10077)

(assert (=> b!957405 (= condMapEmpty!33655 (= (arr!28044 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10077)) mapDefault!33655)))))

(declare-fun b!957406 () Bool)

(assert (=> b!957406 (= e!539655 false)))

(declare-fun lt!430317 () Bool)

(declare-datatypes ((List!19508 0))(
  ( (Nil!19505) (Cons!19504 (h!20666 (_ BitVec 64)) (t!27871 List!19508)) )
))
(declare-fun arrayNoDuplicates!0 (array!58339 (_ BitVec 32) List!19508) Bool)

(assert (=> b!957406 (= lt!430317 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19505))))

(declare-fun mapNonEmpty!33655 () Bool)

(declare-fun tp!64260 () Bool)

(assert (=> mapNonEmpty!33655 (= mapRes!33655 (and tp!64260 e!539654))))

(declare-fun mapValue!33655 () ValueCell!10077)

(declare-fun mapRest!33655 () (Array (_ BitVec 32) ValueCell!10077))

(declare-fun mapKey!33655 () (_ BitVec 32))

(assert (=> mapNonEmpty!33655 (= (arr!28044 _values!1386) (store mapRest!33655 mapKey!33655 mapValue!33655))))

(declare-fun res!640912 () Bool)

(assert (=> start!82138 (=> (not res!640912) (not e!539655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82138 (= res!640912 (validMask!0 mask!2088))))

(assert (=> start!82138 e!539655))

(assert (=> start!82138 true))

(declare-fun array_inv!21755 (array!58341) Bool)

(assert (=> start!82138 (and (array_inv!21755 _values!1386) e!539651)))

(declare-fun array_inv!21756 (array!58339) Bool)

(assert (=> start!82138 (array_inv!21756 _keys!1668)))

(assert (= (and start!82138 res!640912) b!957404))

(assert (= (and b!957404 res!640911) b!957403))

(assert (= (and b!957403 res!640913) b!957406))

(assert (= (and b!957405 condMapEmpty!33655) mapIsEmpty!33655))

(assert (= (and b!957405 (not condMapEmpty!33655)) mapNonEmpty!33655))

(get-info :version)

(assert (= (and mapNonEmpty!33655 ((_ is ValueCellFull!10077) mapValue!33655)) b!957402))

(assert (= (and b!957405 ((_ is ValueCellFull!10077) mapDefault!33655)) b!957401))

(assert (= start!82138 b!957405))

(declare-fun m!888389 () Bool)

(assert (=> b!957403 m!888389))

(declare-fun m!888391 () Bool)

(assert (=> b!957406 m!888391))

(declare-fun m!888393 () Bool)

(assert (=> mapNonEmpty!33655 m!888393))

(declare-fun m!888395 () Bool)

(assert (=> start!82138 m!888395))

(declare-fun m!888397 () Bool)

(assert (=> start!82138 m!888397))

(declare-fun m!888399 () Bool)

(assert (=> start!82138 m!888399))

(check-sat (not start!82138) tp_is_empty!21117 (not b!957403) (not mapNonEmpty!33655) (not b!957406))
(check-sat)
