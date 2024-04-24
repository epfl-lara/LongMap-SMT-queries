; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82172 () Bool)

(assert start!82172)

(declare-fun b!957322 () Bool)

(declare-fun e!539515 () Bool)

(declare-fun e!539513 () Bool)

(declare-fun mapRes!33526 () Bool)

(assert (=> b!957322 (= e!539515 (and e!539513 mapRes!33526))))

(declare-fun condMapEmpty!33526 () Bool)

(declare-datatypes ((V!33041 0))(
  ( (V!33042 (val!10572 Int)) )
))
(declare-datatypes ((ValueCell!10040 0))(
  ( (ValueCellFull!10040 (v!13124 V!33041)) (EmptyCell!10040) )
))
(declare-datatypes ((array!58228 0))(
  ( (array!58229 (arr!27989 (Array (_ BitVec 32) ValueCell!10040)) (size!28469 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58228)

(declare-fun mapDefault!33526 () ValueCell!10040)

(assert (=> b!957322 (= condMapEmpty!33526 (= (arr!27989 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10040)) mapDefault!33526)))))

(declare-fun mapIsEmpty!33526 () Bool)

(assert (=> mapIsEmpty!33526 mapRes!33526))

(declare-fun res!640734 () Bool)

(declare-fun e!539512 () Bool)

(assert (=> start!82172 (=> (not res!640734) (not e!539512))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82172 (= res!640734 (validMask!0 mask!1823))))

(assert (=> start!82172 e!539512))

(assert (=> start!82172 true))

(declare-fun array_inv!21791 (array!58228) Bool)

(assert (=> start!82172 (and (array_inv!21791 _values!1197) e!539515)))

(declare-datatypes ((array!58230 0))(
  ( (array!58231 (arr!27990 (Array (_ BitVec 32) (_ BitVec 64))) (size!28470 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58230)

(declare-fun array_inv!21792 (array!58230) Bool)

(assert (=> start!82172 (array_inv!21792 _keys!1441)))

(declare-fun b!957323 () Bool)

(declare-fun res!640735 () Bool)

(assert (=> b!957323 (=> (not res!640735) (not e!539512))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!957323 (= res!640735 (and (= (size!28469 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28470 _keys!1441) (size!28469 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!957324 () Bool)

(assert (=> b!957324 (= e!539512 false)))

(declare-fun lt!430503 () Bool)

(declare-datatypes ((List!19479 0))(
  ( (Nil!19476) (Cons!19475 (h!20643 (_ BitVec 64)) (t!27832 List!19479)) )
))
(declare-fun arrayNoDuplicates!0 (array!58230 (_ BitVec 32) List!19479) Bool)

(assert (=> b!957324 (= lt!430503 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19476))))

(declare-fun b!957325 () Bool)

(declare-fun e!539511 () Bool)

(declare-fun tp_is_empty!21043 () Bool)

(assert (=> b!957325 (= e!539511 tp_is_empty!21043)))

(declare-fun b!957326 () Bool)

(assert (=> b!957326 (= e!539513 tp_is_empty!21043)))

(declare-fun b!957327 () Bool)

(declare-fun res!640736 () Bool)

(assert (=> b!957327 (=> (not res!640736) (not e!539512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58230 (_ BitVec 32)) Bool)

(assert (=> b!957327 (= res!640736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33526 () Bool)

(declare-fun tp!64105 () Bool)

(assert (=> mapNonEmpty!33526 (= mapRes!33526 (and tp!64105 e!539511))))

(declare-fun mapRest!33526 () (Array (_ BitVec 32) ValueCell!10040))

(declare-fun mapValue!33526 () ValueCell!10040)

(declare-fun mapKey!33526 () (_ BitVec 32))

(assert (=> mapNonEmpty!33526 (= (arr!27989 _values!1197) (store mapRest!33526 mapKey!33526 mapValue!33526))))

(assert (= (and start!82172 res!640734) b!957323))

(assert (= (and b!957323 res!640735) b!957327))

(assert (= (and b!957327 res!640736) b!957324))

(assert (= (and b!957322 condMapEmpty!33526) mapIsEmpty!33526))

(assert (= (and b!957322 (not condMapEmpty!33526)) mapNonEmpty!33526))

(get-info :version)

(assert (= (and mapNonEmpty!33526 ((_ is ValueCellFull!10040) mapValue!33526)) b!957325))

(assert (= (and b!957322 ((_ is ValueCellFull!10040) mapDefault!33526)) b!957326))

(assert (= start!82172 b!957322))

(declare-fun m!888999 () Bool)

(assert (=> start!82172 m!888999))

(declare-fun m!889001 () Bool)

(assert (=> start!82172 m!889001))

(declare-fun m!889003 () Bool)

(assert (=> start!82172 m!889003))

(declare-fun m!889005 () Bool)

(assert (=> b!957324 m!889005))

(declare-fun m!889007 () Bool)

(assert (=> b!957327 m!889007))

(declare-fun m!889009 () Bool)

(assert (=> mapNonEmpty!33526 m!889009))

(check-sat tp_is_empty!21043 (not b!957324) (not mapNonEmpty!33526) (not start!82172) (not b!957327))
(check-sat)
