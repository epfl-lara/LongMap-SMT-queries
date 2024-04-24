; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82328 () Bool)

(assert start!82328)

(declare-fun b!958502 () Bool)

(declare-fun e!540402 () Bool)

(declare-fun e!540400 () Bool)

(declare-fun mapRes!33688 () Bool)

(assert (=> b!958502 (= e!540402 (and e!540400 mapRes!33688))))

(declare-fun condMapEmpty!33688 () Bool)

(declare-datatypes ((V!33169 0))(
  ( (V!33170 (val!10620 Int)) )
))
(declare-datatypes ((ValueCell!10088 0))(
  ( (ValueCellFull!10088 (v!13174 V!33169)) (EmptyCell!10088) )
))
(declare-datatypes ((array!58412 0))(
  ( (array!58413 (arr!28075 (Array (_ BitVec 32) ValueCell!10088)) (size!28555 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58412)

(declare-fun mapDefault!33688 () ValueCell!10088)

(assert (=> b!958502 (= condMapEmpty!33688 (= (arr!28075 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10088)) mapDefault!33688)))))

(declare-fun b!958503 () Bool)

(declare-fun e!540401 () Bool)

(assert (=> b!958503 (= e!540401 false)))

(declare-fun lt!430711 () Bool)

(declare-datatypes ((array!58414 0))(
  ( (array!58415 (arr!28076 (Array (_ BitVec 32) (_ BitVec 64))) (size!28556 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58414)

(declare-datatypes ((List!19512 0))(
  ( (Nil!19509) (Cons!19508 (h!20676 (_ BitVec 64)) (t!27867 List!19512)) )
))
(declare-fun arrayNoDuplicates!0 (array!58414 (_ BitVec 32) List!19512) Bool)

(assert (=> b!958503 (= lt!430711 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19509))))

(declare-fun res!641355 () Bool)

(assert (=> start!82328 (=> (not res!641355) (not e!540401))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82328 (= res!641355 (validMask!0 mask!2088))))

(assert (=> start!82328 e!540401))

(assert (=> start!82328 true))

(declare-fun array_inv!21849 (array!58412) Bool)

(assert (=> start!82328 (and (array_inv!21849 _values!1386) e!540402)))

(declare-fun array_inv!21850 (array!58414) Bool)

(assert (=> start!82328 (array_inv!21850 _keys!1668)))

(declare-fun b!958504 () Bool)

(declare-fun res!641356 () Bool)

(assert (=> b!958504 (=> (not res!641356) (not e!540401))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958504 (= res!641356 (and (= (size!28555 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28556 _keys!1668) (size!28555 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33688 () Bool)

(declare-fun tp!64294 () Bool)

(declare-fun e!540399 () Bool)

(assert (=> mapNonEmpty!33688 (= mapRes!33688 (and tp!64294 e!540399))))

(declare-fun mapRest!33688 () (Array (_ BitVec 32) ValueCell!10088))

(declare-fun mapKey!33688 () (_ BitVec 32))

(declare-fun mapValue!33688 () ValueCell!10088)

(assert (=> mapNonEmpty!33688 (= (arr!28075 _values!1386) (store mapRest!33688 mapKey!33688 mapValue!33688))))

(declare-fun b!958505 () Bool)

(declare-fun tp_is_empty!21139 () Bool)

(assert (=> b!958505 (= e!540399 tp_is_empty!21139)))

(declare-fun mapIsEmpty!33688 () Bool)

(assert (=> mapIsEmpty!33688 mapRes!33688))

(declare-fun b!958506 () Bool)

(assert (=> b!958506 (= e!540400 tp_is_empty!21139)))

(declare-fun b!958507 () Bool)

(declare-fun res!641354 () Bool)

(assert (=> b!958507 (=> (not res!641354) (not e!540401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58414 (_ BitVec 32)) Bool)

(assert (=> b!958507 (= res!641354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82328 res!641355) b!958504))

(assert (= (and b!958504 res!641356) b!958507))

(assert (= (and b!958507 res!641354) b!958503))

(assert (= (and b!958502 condMapEmpty!33688) mapIsEmpty!33688))

(assert (= (and b!958502 (not condMapEmpty!33688)) mapNonEmpty!33688))

(get-info :version)

(assert (= (and mapNonEmpty!33688 ((_ is ValueCellFull!10088) mapValue!33688)) b!958505))

(assert (= (and b!958502 ((_ is ValueCellFull!10088) mapDefault!33688)) b!958506))

(assert (= start!82328 b!958502))

(declare-fun m!889815 () Bool)

(assert (=> b!958503 m!889815))

(declare-fun m!889817 () Bool)

(assert (=> start!82328 m!889817))

(declare-fun m!889819 () Bool)

(assert (=> start!82328 m!889819))

(declare-fun m!889821 () Bool)

(assert (=> start!82328 m!889821))

(declare-fun m!889823 () Bool)

(assert (=> mapNonEmpty!33688 m!889823))

(declare-fun m!889825 () Bool)

(assert (=> b!958507 m!889825))

(check-sat (not b!958507) (not start!82328) (not b!958503) tp_is_empty!21139 (not mapNonEmpty!33688))
(check-sat)
