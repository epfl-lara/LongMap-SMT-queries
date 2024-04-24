; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82136 () Bool)

(assert start!82136)

(declare-fun b!956998 () Bool)

(declare-fun res!640573 () Bool)

(declare-fun e!539241 () Bool)

(assert (=> b!956998 (=> (not res!640573) (not e!539241))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58162 0))(
  ( (array!58163 (arr!27956 (Array (_ BitVec 32) (_ BitVec 64))) (size!28436 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58162)

(declare-datatypes ((V!32993 0))(
  ( (V!32994 (val!10554 Int)) )
))
(declare-datatypes ((ValueCell!10022 0))(
  ( (ValueCellFull!10022 (v!13106 V!32993)) (EmptyCell!10022) )
))
(declare-datatypes ((array!58164 0))(
  ( (array!58165 (arr!27957 (Array (_ BitVec 32) ValueCell!10022)) (size!28437 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58164)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956998 (= res!640573 (and (= (size!28437 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28436 _keys!1441) (size!28437 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956999 () Bool)

(declare-fun res!640572 () Bool)

(assert (=> b!956999 (=> (not res!640572) (not e!539241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58162 (_ BitVec 32)) Bool)

(assert (=> b!956999 (= res!640572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33472 () Bool)

(declare-fun mapRes!33472 () Bool)

(assert (=> mapIsEmpty!33472 mapRes!33472))

(declare-fun b!957000 () Bool)

(declare-fun e!539243 () Bool)

(declare-fun tp_is_empty!21007 () Bool)

(assert (=> b!957000 (= e!539243 tp_is_empty!21007)))

(declare-fun b!957001 () Bool)

(assert (=> b!957001 (= e!539241 false)))

(declare-fun lt!430449 () Bool)

(declare-datatypes ((List!19465 0))(
  ( (Nil!19462) (Cons!19461 (h!20629 (_ BitVec 64)) (t!27818 List!19465)) )
))
(declare-fun arrayNoDuplicates!0 (array!58162 (_ BitVec 32) List!19465) Bool)

(assert (=> b!957001 (= lt!430449 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19462))))

(declare-fun b!957002 () Bool)

(declare-fun e!539242 () Bool)

(assert (=> b!957002 (= e!539242 tp_is_empty!21007)))

(declare-fun b!957003 () Bool)

(declare-fun e!539245 () Bool)

(assert (=> b!957003 (= e!539245 (and e!539242 mapRes!33472))))

(declare-fun condMapEmpty!33472 () Bool)

(declare-fun mapDefault!33472 () ValueCell!10022)

(assert (=> b!957003 (= condMapEmpty!33472 (= (arr!27957 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10022)) mapDefault!33472)))))

(declare-fun mapNonEmpty!33472 () Bool)

(declare-fun tp!64051 () Bool)

(assert (=> mapNonEmpty!33472 (= mapRes!33472 (and tp!64051 e!539243))))

(declare-fun mapValue!33472 () ValueCell!10022)

(declare-fun mapKey!33472 () (_ BitVec 32))

(declare-fun mapRest!33472 () (Array (_ BitVec 32) ValueCell!10022))

(assert (=> mapNonEmpty!33472 (= (arr!27957 _values!1197) (store mapRest!33472 mapKey!33472 mapValue!33472))))

(declare-fun res!640574 () Bool)

(assert (=> start!82136 (=> (not res!640574) (not e!539241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82136 (= res!640574 (validMask!0 mask!1823))))

(assert (=> start!82136 e!539241))

(assert (=> start!82136 true))

(declare-fun array_inv!21767 (array!58164) Bool)

(assert (=> start!82136 (and (array_inv!21767 _values!1197) e!539245)))

(declare-fun array_inv!21768 (array!58162) Bool)

(assert (=> start!82136 (array_inv!21768 _keys!1441)))

(assert (= (and start!82136 res!640574) b!956998))

(assert (= (and b!956998 res!640573) b!956999))

(assert (= (and b!956999 res!640572) b!957001))

(assert (= (and b!957003 condMapEmpty!33472) mapIsEmpty!33472))

(assert (= (and b!957003 (not condMapEmpty!33472)) mapNonEmpty!33472))

(get-info :version)

(assert (= (and mapNonEmpty!33472 ((_ is ValueCellFull!10022) mapValue!33472)) b!957000))

(assert (= (and b!957003 ((_ is ValueCellFull!10022) mapDefault!33472)) b!957002))

(assert (= start!82136 b!957003))

(declare-fun m!888783 () Bool)

(assert (=> b!956999 m!888783))

(declare-fun m!888785 () Bool)

(assert (=> b!957001 m!888785))

(declare-fun m!888787 () Bool)

(assert (=> mapNonEmpty!33472 m!888787))

(declare-fun m!888789 () Bool)

(assert (=> start!82136 m!888789))

(declare-fun m!888791 () Bool)

(assert (=> start!82136 m!888791))

(declare-fun m!888793 () Bool)

(assert (=> start!82136 m!888793))

(check-sat (not start!82136) (not b!957001) (not b!956999) tp_is_empty!21007 (not mapNonEmpty!33472))
(check-sat)
