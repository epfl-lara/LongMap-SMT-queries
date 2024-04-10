; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107308 () Bool)

(assert start!107308)

(declare-fun b!1271795 () Bool)

(declare-fun res!846091 () Bool)

(declare-fun e!725312 () Bool)

(assert (=> b!1271795 (=> (not res!846091) (not e!725312))))

(declare-datatypes ((array!83242 0))(
  ( (array!83243 (arr!40158 (Array (_ BitVec 32) (_ BitVec 64))) (size!40694 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83242)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83242 (_ BitVec 32)) Bool)

(assert (=> b!1271795 (= res!846091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846092 () Bool)

(assert (=> start!107308 (=> (not res!846092) (not e!725312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107308 (= res!846092 (validMask!0 mask!1730))))

(assert (=> start!107308 e!725312))

(declare-datatypes ((V!49189 0))(
  ( (V!49190 (val!16573 Int)) )
))
(declare-datatypes ((ValueCell!15645 0))(
  ( (ValueCellFull!15645 (v!19210 V!49189)) (EmptyCell!15645) )
))
(declare-datatypes ((array!83244 0))(
  ( (array!83245 (arr!40159 (Array (_ BitVec 32) ValueCell!15645)) (size!40695 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83244)

(declare-fun e!725310 () Bool)

(declare-fun array_inv!30547 (array!83244) Bool)

(assert (=> start!107308 (and (array_inv!30547 _values!1134) e!725310)))

(assert (=> start!107308 true))

(declare-fun array_inv!30548 (array!83242) Bool)

(assert (=> start!107308 (array_inv!30548 _keys!1364)))

(declare-fun b!1271796 () Bool)

(declare-fun e!725313 () Bool)

(declare-fun tp_is_empty!32997 () Bool)

(assert (=> b!1271796 (= e!725313 tp_is_empty!32997)))

(declare-fun b!1271797 () Bool)

(declare-fun res!846090 () Bool)

(assert (=> b!1271797 (=> (not res!846090) (not e!725312))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271797 (= res!846090 (and (= (size!40695 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40694 _keys!1364) (size!40695 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271798 () Bool)

(declare-fun mapRes!51076 () Bool)

(assert (=> b!1271798 (= e!725310 (and e!725313 mapRes!51076))))

(declare-fun condMapEmpty!51076 () Bool)

(declare-fun mapDefault!51076 () ValueCell!15645)

(assert (=> b!1271798 (= condMapEmpty!51076 (= (arr!40159 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15645)) mapDefault!51076)))))

(declare-fun b!1271799 () Bool)

(declare-fun e!725309 () Bool)

(assert (=> b!1271799 (= e!725309 tp_is_empty!32997)))

(declare-fun b!1271800 () Bool)

(assert (=> b!1271800 (= e!725312 false)))

(declare-fun lt!574932 () Bool)

(declare-datatypes ((List!28539 0))(
  ( (Nil!28536) (Cons!28535 (h!29744 (_ BitVec 64)) (t!42068 List!28539)) )
))
(declare-fun arrayNoDuplicates!0 (array!83242 (_ BitVec 32) List!28539) Bool)

(assert (=> b!1271800 (= lt!574932 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28536))))

(declare-fun mapIsEmpty!51076 () Bool)

(assert (=> mapIsEmpty!51076 mapRes!51076))

(declare-fun mapNonEmpty!51076 () Bool)

(declare-fun tp!97417 () Bool)

(assert (=> mapNonEmpty!51076 (= mapRes!51076 (and tp!97417 e!725309))))

(declare-fun mapRest!51076 () (Array (_ BitVec 32) ValueCell!15645))

(declare-fun mapKey!51076 () (_ BitVec 32))

(declare-fun mapValue!51076 () ValueCell!15645)

(assert (=> mapNonEmpty!51076 (= (arr!40159 _values!1134) (store mapRest!51076 mapKey!51076 mapValue!51076))))

(assert (= (and start!107308 res!846092) b!1271797))

(assert (= (and b!1271797 res!846090) b!1271795))

(assert (= (and b!1271795 res!846091) b!1271800))

(assert (= (and b!1271798 condMapEmpty!51076) mapIsEmpty!51076))

(assert (= (and b!1271798 (not condMapEmpty!51076)) mapNonEmpty!51076))

(get-info :version)

(assert (= (and mapNonEmpty!51076 ((_ is ValueCellFull!15645) mapValue!51076)) b!1271799))

(assert (= (and b!1271798 ((_ is ValueCellFull!15645) mapDefault!51076)) b!1271796))

(assert (= start!107308 b!1271798))

(declare-fun m!1169627 () Bool)

(assert (=> b!1271795 m!1169627))

(declare-fun m!1169629 () Bool)

(assert (=> start!107308 m!1169629))

(declare-fun m!1169631 () Bool)

(assert (=> start!107308 m!1169631))

(declare-fun m!1169633 () Bool)

(assert (=> start!107308 m!1169633))

(declare-fun m!1169635 () Bool)

(assert (=> b!1271800 m!1169635))

(declare-fun m!1169637 () Bool)

(assert (=> mapNonEmpty!51076 m!1169637))

(check-sat (not b!1271795) (not mapNonEmpty!51076) tp_is_empty!32997 (not start!107308) (not b!1271800))
(check-sat)
