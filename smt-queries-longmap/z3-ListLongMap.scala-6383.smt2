; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82218 () Bool)

(assert start!82218)

(declare-fun res!641009 () Bool)

(declare-fun e!539808 () Bool)

(assert (=> start!82218 (=> (not res!641009) (not e!539808))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82218 (= res!641009 (validMask!0 mask!2088))))

(assert (=> start!82218 e!539808))

(assert (=> start!82218 true))

(declare-datatypes ((V!33081 0))(
  ( (V!33082 (val!10587 Int)) )
))
(declare-datatypes ((ValueCell!10055 0))(
  ( (ValueCellFull!10055 (v!13140 V!33081)) (EmptyCell!10055) )
))
(declare-datatypes ((array!58282 0))(
  ( (array!58283 (arr!28015 (Array (_ BitVec 32) ValueCell!10055)) (size!28495 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58282)

(declare-fun e!539811 () Bool)

(declare-fun array_inv!21807 (array!58282) Bool)

(assert (=> start!82218 (and (array_inv!21807 _values!1386) e!539811)))

(declare-datatypes ((array!58284 0))(
  ( (array!58285 (arr!28016 (Array (_ BitVec 32) (_ BitVec 64))) (size!28496 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58284)

(declare-fun array_inv!21808 (array!58284) Bool)

(assert (=> start!82218 (array_inv!21808 _keys!1668)))

(declare-fun b!957796 () Bool)

(declare-fun e!539812 () Bool)

(declare-fun tp_is_empty!21073 () Bool)

(assert (=> b!957796 (= e!539812 tp_is_empty!21073)))

(declare-fun b!957797 () Bool)

(declare-fun e!539810 () Bool)

(assert (=> b!957797 (= e!539810 tp_is_empty!21073)))

(declare-fun b!957798 () Bool)

(declare-fun mapRes!33574 () Bool)

(assert (=> b!957798 (= e!539811 (and e!539812 mapRes!33574))))

(declare-fun condMapEmpty!33574 () Bool)

(declare-fun mapDefault!33574 () ValueCell!10055)

(assert (=> b!957798 (= condMapEmpty!33574 (= (arr!28015 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10055)) mapDefault!33574)))))

(declare-fun b!957799 () Bool)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957799 (= e!539808 (and (= (size!28495 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28496 _keys!1668) (size!28495 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011) (not (= (size!28496 _keys!1668) (bvadd #b00000000000000000000000000000001 mask!2088)))))))

(declare-fun mapNonEmpty!33574 () Bool)

(declare-fun tp!64180 () Bool)

(assert (=> mapNonEmpty!33574 (= mapRes!33574 (and tp!64180 e!539810))))

(declare-fun mapRest!33574 () (Array (_ BitVec 32) ValueCell!10055))

(declare-fun mapKey!33574 () (_ BitVec 32))

(declare-fun mapValue!33574 () ValueCell!10055)

(assert (=> mapNonEmpty!33574 (= (arr!28015 _values!1386) (store mapRest!33574 mapKey!33574 mapValue!33574))))

(declare-fun mapIsEmpty!33574 () Bool)

(assert (=> mapIsEmpty!33574 mapRes!33574))

(assert (= (and start!82218 res!641009) b!957799))

(assert (= (and b!957798 condMapEmpty!33574) mapIsEmpty!33574))

(assert (= (and b!957798 (not condMapEmpty!33574)) mapNonEmpty!33574))

(get-info :version)

(assert (= (and mapNonEmpty!33574 ((_ is ValueCellFull!10055) mapValue!33574)) b!957797))

(assert (= (and b!957798 ((_ is ValueCellFull!10055) mapDefault!33574)) b!957796))

(assert (= start!82218 b!957798))

(declare-fun m!889367 () Bool)

(assert (=> start!82218 m!889367))

(declare-fun m!889369 () Bool)

(assert (=> start!82218 m!889369))

(declare-fun m!889371 () Bool)

(assert (=> start!82218 m!889371))

(declare-fun m!889373 () Bool)

(assert (=> mapNonEmpty!33574 m!889373))

(check-sat (not start!82218) (not mapNonEmpty!33574) tp_is_empty!21073)
(check-sat)
