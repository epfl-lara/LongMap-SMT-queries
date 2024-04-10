; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107284 () Bool)

(assert start!107284)

(declare-fun b!1271579 () Bool)

(declare-fun e!725129 () Bool)

(declare-fun e!725133 () Bool)

(declare-fun mapRes!51040 () Bool)

(assert (=> b!1271579 (= e!725129 (and e!725133 mapRes!51040))))

(declare-fun condMapEmpty!51040 () Bool)

(declare-datatypes ((V!49157 0))(
  ( (V!49158 (val!16561 Int)) )
))
(declare-datatypes ((ValueCell!15633 0))(
  ( (ValueCellFull!15633 (v!19198 V!49157)) (EmptyCell!15633) )
))
(declare-datatypes ((array!83194 0))(
  ( (array!83195 (arr!40134 (Array (_ BitVec 32) ValueCell!15633)) (size!40670 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83194)

(declare-fun mapDefault!51040 () ValueCell!15633)

(assert (=> b!1271579 (= condMapEmpty!51040 (= (arr!40134 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15633)) mapDefault!51040)))))

(declare-fun b!1271580 () Bool)

(declare-fun e!725130 () Bool)

(declare-fun tp_is_empty!32973 () Bool)

(assert (=> b!1271580 (= e!725130 tp_is_empty!32973)))

(declare-fun b!1271581 () Bool)

(declare-fun res!845983 () Bool)

(declare-fun e!725132 () Bool)

(assert (=> b!1271581 (=> (not res!845983) (not e!725132))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83196 0))(
  ( (array!83197 (arr!40135 (Array (_ BitVec 32) (_ BitVec 64))) (size!40671 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83196)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271581 (= res!845983 (and (= (size!40670 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40671 _keys!1364) (size!40670 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51040 () Bool)

(assert (=> mapIsEmpty!51040 mapRes!51040))

(declare-fun b!1271582 () Bool)

(assert (=> b!1271582 (= e!725132 false)))

(declare-fun lt!574896 () Bool)

(declare-datatypes ((List!28531 0))(
  ( (Nil!28528) (Cons!28527 (h!29736 (_ BitVec 64)) (t!42060 List!28531)) )
))
(declare-fun arrayNoDuplicates!0 (array!83196 (_ BitVec 32) List!28531) Bool)

(assert (=> b!1271582 (= lt!574896 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28528))))

(declare-fun b!1271583 () Bool)

(declare-fun res!845984 () Bool)

(assert (=> b!1271583 (=> (not res!845984) (not e!725132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83196 (_ BitVec 32)) Bool)

(assert (=> b!1271583 (= res!845984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271584 () Bool)

(assert (=> b!1271584 (= e!725133 tp_is_empty!32973)))

(declare-fun res!845982 () Bool)

(assert (=> start!107284 (=> (not res!845982) (not e!725132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107284 (= res!845982 (validMask!0 mask!1730))))

(assert (=> start!107284 e!725132))

(declare-fun array_inv!30525 (array!83194) Bool)

(assert (=> start!107284 (and (array_inv!30525 _values!1134) e!725129)))

(assert (=> start!107284 true))

(declare-fun array_inv!30526 (array!83196) Bool)

(assert (=> start!107284 (array_inv!30526 _keys!1364)))

(declare-fun mapNonEmpty!51040 () Bool)

(declare-fun tp!97381 () Bool)

(assert (=> mapNonEmpty!51040 (= mapRes!51040 (and tp!97381 e!725130))))

(declare-fun mapValue!51040 () ValueCell!15633)

(declare-fun mapRest!51040 () (Array (_ BitVec 32) ValueCell!15633))

(declare-fun mapKey!51040 () (_ BitVec 32))

(assert (=> mapNonEmpty!51040 (= (arr!40134 _values!1134) (store mapRest!51040 mapKey!51040 mapValue!51040))))

(assert (= (and start!107284 res!845982) b!1271581))

(assert (= (and b!1271581 res!845983) b!1271583))

(assert (= (and b!1271583 res!845984) b!1271582))

(assert (= (and b!1271579 condMapEmpty!51040) mapIsEmpty!51040))

(assert (= (and b!1271579 (not condMapEmpty!51040)) mapNonEmpty!51040))

(get-info :version)

(assert (= (and mapNonEmpty!51040 ((_ is ValueCellFull!15633) mapValue!51040)) b!1271580))

(assert (= (and b!1271579 ((_ is ValueCellFull!15633) mapDefault!51040)) b!1271584))

(assert (= start!107284 b!1271579))

(declare-fun m!1169483 () Bool)

(assert (=> b!1271582 m!1169483))

(declare-fun m!1169485 () Bool)

(assert (=> b!1271583 m!1169485))

(declare-fun m!1169487 () Bool)

(assert (=> start!107284 m!1169487))

(declare-fun m!1169489 () Bool)

(assert (=> start!107284 m!1169489))

(declare-fun m!1169491 () Bool)

(assert (=> start!107284 m!1169491))

(declare-fun m!1169493 () Bool)

(assert (=> mapNonEmpty!51040 m!1169493))

(check-sat (not b!1271583) (not b!1271582) (not mapNonEmpty!51040) tp_is_empty!32973 (not start!107284))
(check-sat)
