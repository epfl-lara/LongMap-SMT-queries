; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82142 () Bool)

(assert start!82142)

(declare-fun b!957360 () Bool)

(declare-fun e!539670 () Bool)

(declare-fun tp_is_empty!21139 () Bool)

(assert (=> b!957360 (= e!539670 tp_is_empty!21139)))

(declare-fun b!957361 () Bool)

(declare-fun e!539668 () Bool)

(assert (=> b!957361 (= e!539668 tp_is_empty!21139)))

(declare-fun b!957362 () Bool)

(declare-fun e!539671 () Bool)

(assert (=> b!957362 (= e!539671 false)))

(declare-fun lt!430114 () Bool)

(declare-datatypes ((array!58324 0))(
  ( (array!58325 (arr!28036 (Array (_ BitVec 32) (_ BitVec 64))) (size!28517 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58324)

(declare-datatypes ((List!19530 0))(
  ( (Nil!19527) (Cons!19526 (h!20688 (_ BitVec 64)) (t!27884 List!19530)) )
))
(declare-fun arrayNoDuplicates!0 (array!58324 (_ BitVec 32) List!19530) Bool)

(assert (=> b!957362 (= lt!430114 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19527))))

(declare-fun res!640900 () Bool)

(assert (=> start!82142 (=> (not res!640900) (not e!539671))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82142 (= res!640900 (validMask!0 mask!2088))))

(assert (=> start!82142 e!539671))

(assert (=> start!82142 true))

(declare-datatypes ((V!33169 0))(
  ( (V!33170 (val!10620 Int)) )
))
(declare-datatypes ((ValueCell!10088 0))(
  ( (ValueCellFull!10088 (v!13176 V!33169)) (EmptyCell!10088) )
))
(declare-datatypes ((array!58326 0))(
  ( (array!58327 (arr!28037 (Array (_ BitVec 32) ValueCell!10088)) (size!28518 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58326)

(declare-fun e!539672 () Bool)

(declare-fun array_inv!21809 (array!58326) Bool)

(assert (=> start!82142 (and (array_inv!21809 _values!1386) e!539672)))

(declare-fun array_inv!21810 (array!58324) Bool)

(assert (=> start!82142 (array_inv!21810 _keys!1668)))

(declare-fun b!957363 () Bool)

(declare-fun mapRes!33688 () Bool)

(assert (=> b!957363 (= e!539672 (and e!539668 mapRes!33688))))

(declare-fun condMapEmpty!33688 () Bool)

(declare-fun mapDefault!33688 () ValueCell!10088)

(assert (=> b!957363 (= condMapEmpty!33688 (= (arr!28037 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10088)) mapDefault!33688)))))

(declare-fun b!957364 () Bool)

(declare-fun res!640902 () Bool)

(assert (=> b!957364 (=> (not res!640902) (not e!539671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58324 (_ BitVec 32)) Bool)

(assert (=> b!957364 (= res!640902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33688 () Bool)

(assert (=> mapIsEmpty!33688 mapRes!33688))

(declare-fun b!957365 () Bool)

(declare-fun res!640901 () Bool)

(assert (=> b!957365 (=> (not res!640901) (not e!539671))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957365 (= res!640901 (and (= (size!28518 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28517 _keys!1668) (size!28518 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33688 () Bool)

(declare-fun tp!64294 () Bool)

(assert (=> mapNonEmpty!33688 (= mapRes!33688 (and tp!64294 e!539670))))

(declare-fun mapValue!33688 () ValueCell!10088)

(declare-fun mapRest!33688 () (Array (_ BitVec 32) ValueCell!10088))

(declare-fun mapKey!33688 () (_ BitVec 32))

(assert (=> mapNonEmpty!33688 (= (arr!28037 _values!1386) (store mapRest!33688 mapKey!33688 mapValue!33688))))

(assert (= (and start!82142 res!640900) b!957365))

(assert (= (and b!957365 res!640901) b!957364))

(assert (= (and b!957364 res!640902) b!957362))

(assert (= (and b!957363 condMapEmpty!33688) mapIsEmpty!33688))

(assert (= (and b!957363 (not condMapEmpty!33688)) mapNonEmpty!33688))

(get-info :version)

(assert (= (and mapNonEmpty!33688 ((_ is ValueCellFull!10088) mapValue!33688)) b!957360))

(assert (= (and b!957363 ((_ is ValueCellFull!10088) mapDefault!33688)) b!957361))

(assert (= start!82142 b!957363))

(declare-fun m!887763 () Bool)

(assert (=> b!957362 m!887763))

(declare-fun m!887765 () Bool)

(assert (=> start!82142 m!887765))

(declare-fun m!887767 () Bool)

(assert (=> start!82142 m!887767))

(declare-fun m!887769 () Bool)

(assert (=> start!82142 m!887769))

(declare-fun m!887771 () Bool)

(assert (=> b!957364 m!887771))

(declare-fun m!887773 () Bool)

(assert (=> mapNonEmpty!33688 m!887773))

(check-sat (not b!957362) (not b!957364) tp_is_empty!21139 (not mapNonEmpty!33688) (not start!82142))
(check-sat)
