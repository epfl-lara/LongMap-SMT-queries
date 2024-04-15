; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81986 () Bool)

(assert start!81986)

(declare-fun b!956180 () Bool)

(declare-fun e!538782 () Bool)

(declare-fun tp_is_empty!21043 () Bool)

(assert (=> b!956180 (= e!538782 tp_is_empty!21043)))

(declare-fun b!956181 () Bool)

(declare-fun e!538785 () Bool)

(assert (=> b!956181 (= e!538785 tp_is_empty!21043)))

(declare-fun b!956182 () Bool)

(declare-fun e!538783 () Bool)

(assert (=> b!956182 (= e!538783 false)))

(declare-fun lt!429906 () Bool)

(declare-datatypes ((array!58130 0))(
  ( (array!58131 (arr!27945 (Array (_ BitVec 32) (_ BitVec 64))) (size!28426 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58130)

(declare-datatypes ((List!19493 0))(
  ( (Nil!19490) (Cons!19489 (h!20651 (_ BitVec 64)) (t!27845 List!19493)) )
))
(declare-fun arrayNoDuplicates!0 (array!58130 (_ BitVec 32) List!19493) Bool)

(assert (=> b!956182 (= lt!429906 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19490))))

(declare-fun b!956183 () Bool)

(declare-fun res!640280 () Bool)

(assert (=> b!956183 (=> (not res!640280) (not e!538783))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58130 (_ BitVec 32)) Bool)

(assert (=> b!956183 (= res!640280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956184 () Bool)

(declare-fun res!640282 () Bool)

(assert (=> b!956184 (=> (not res!640282) (not e!538783))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33041 0))(
  ( (V!33042 (val!10572 Int)) )
))
(declare-datatypes ((ValueCell!10040 0))(
  ( (ValueCellFull!10040 (v!13126 V!33041)) (EmptyCell!10040) )
))
(declare-datatypes ((array!58132 0))(
  ( (array!58133 (arr!27946 (Array (_ BitVec 32) ValueCell!10040)) (size!28427 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58132)

(assert (=> b!956184 (= res!640282 (and (= (size!28427 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28426 _keys!1441) (size!28427 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!640281 () Bool)

(assert (=> start!81986 (=> (not res!640281) (not e!538783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81986 (= res!640281 (validMask!0 mask!1823))))

(assert (=> start!81986 e!538783))

(assert (=> start!81986 true))

(declare-fun e!538784 () Bool)

(declare-fun array_inv!21745 (array!58132) Bool)

(assert (=> start!81986 (and (array_inv!21745 _values!1197) e!538784)))

(declare-fun array_inv!21746 (array!58130) Bool)

(assert (=> start!81986 (array_inv!21746 _keys!1441)))

(declare-fun mapNonEmpty!33526 () Bool)

(declare-fun mapRes!33526 () Bool)

(declare-fun tp!64105 () Bool)

(assert (=> mapNonEmpty!33526 (= mapRes!33526 (and tp!64105 e!538782))))

(declare-fun mapKey!33526 () (_ BitVec 32))

(declare-fun mapValue!33526 () ValueCell!10040)

(declare-fun mapRest!33526 () (Array (_ BitVec 32) ValueCell!10040))

(assert (=> mapNonEmpty!33526 (= (arr!27946 _values!1197) (store mapRest!33526 mapKey!33526 mapValue!33526))))

(declare-fun mapIsEmpty!33526 () Bool)

(assert (=> mapIsEmpty!33526 mapRes!33526))

(declare-fun b!956185 () Bool)

(assert (=> b!956185 (= e!538784 (and e!538785 mapRes!33526))))

(declare-fun condMapEmpty!33526 () Bool)

(declare-fun mapDefault!33526 () ValueCell!10040)

(assert (=> b!956185 (= condMapEmpty!33526 (= (arr!27946 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10040)) mapDefault!33526)))))

(assert (= (and start!81986 res!640281) b!956184))

(assert (= (and b!956184 res!640282) b!956183))

(assert (= (and b!956183 res!640280) b!956182))

(assert (= (and b!956185 condMapEmpty!33526) mapIsEmpty!33526))

(assert (= (and b!956185 (not condMapEmpty!33526)) mapNonEmpty!33526))

(get-info :version)

(assert (= (and mapNonEmpty!33526 ((_ is ValueCellFull!10040) mapValue!33526)) b!956180))

(assert (= (and b!956185 ((_ is ValueCellFull!10040) mapDefault!33526)) b!956181))

(assert (= start!81986 b!956185))

(declare-fun m!886947 () Bool)

(assert (=> b!956182 m!886947))

(declare-fun m!886949 () Bool)

(assert (=> b!956183 m!886949))

(declare-fun m!886951 () Bool)

(assert (=> start!81986 m!886951))

(declare-fun m!886953 () Bool)

(assert (=> start!81986 m!886953))

(declare-fun m!886955 () Bool)

(assert (=> start!81986 m!886955))

(declare-fun m!886957 () Bool)

(assert (=> mapNonEmpty!33526 m!886957))

(check-sat tp_is_empty!21043 (not start!81986) (not b!956182) (not b!956183) (not mapNonEmpty!33526))
(check-sat)
