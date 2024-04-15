; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107294 () Bool)

(assert start!107294)

(declare-fun b!1271605 () Bool)

(declare-fun e!725177 () Bool)

(declare-fun tp_is_empty!32983 () Bool)

(assert (=> b!1271605 (= e!725177 tp_is_empty!32983)))

(declare-fun b!1271606 () Bool)

(declare-fun e!725175 () Bool)

(assert (=> b!1271606 (= e!725175 tp_is_empty!32983)))

(declare-fun res!846002 () Bool)

(declare-fun e!725179 () Bool)

(assert (=> start!107294 (=> (not res!846002) (not e!725179))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107294 (= res!846002 (validMask!0 mask!1730))))

(assert (=> start!107294 e!725179))

(declare-datatypes ((V!49171 0))(
  ( (V!49172 (val!16566 Int)) )
))
(declare-datatypes ((ValueCell!15638 0))(
  ( (ValueCellFull!15638 (v!19202 V!49171)) (EmptyCell!15638) )
))
(declare-datatypes ((array!83123 0))(
  ( (array!83124 (arr!40099 (Array (_ BitVec 32) ValueCell!15638)) (size!40637 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83123)

(declare-fun e!725176 () Bool)

(declare-fun array_inv!30655 (array!83123) Bool)

(assert (=> start!107294 (and (array_inv!30655 _values!1134) e!725176)))

(assert (=> start!107294 true))

(declare-datatypes ((array!83125 0))(
  ( (array!83126 (arr!40100 (Array (_ BitVec 32) (_ BitVec 64))) (size!40638 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83125)

(declare-fun array_inv!30656 (array!83125) Bool)

(assert (=> start!107294 (array_inv!30656 _keys!1364)))

(declare-fun b!1271607 () Bool)

(declare-fun mapRes!51055 () Bool)

(assert (=> b!1271607 (= e!725176 (and e!725177 mapRes!51055))))

(declare-fun condMapEmpty!51055 () Bool)

(declare-fun mapDefault!51055 () ValueCell!15638)

(assert (=> b!1271607 (= condMapEmpty!51055 (= (arr!40099 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15638)) mapDefault!51055)))))

(declare-fun b!1271608 () Bool)

(assert (=> b!1271608 (= e!725179 false)))

(declare-fun lt!574733 () Bool)

(declare-datatypes ((List!28611 0))(
  ( (Nil!28608) (Cons!28607 (h!29816 (_ BitVec 64)) (t!42132 List!28611)) )
))
(declare-fun arrayNoDuplicates!0 (array!83125 (_ BitVec 32) List!28611) Bool)

(assert (=> b!1271608 (= lt!574733 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28608))))

(declare-fun mapIsEmpty!51055 () Bool)

(assert (=> mapIsEmpty!51055 mapRes!51055))

(declare-fun b!1271609 () Bool)

(declare-fun res!846000 () Bool)

(assert (=> b!1271609 (=> (not res!846000) (not e!725179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83125 (_ BitVec 32)) Bool)

(assert (=> b!1271609 (= res!846000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!51055 () Bool)

(declare-fun tp!97397 () Bool)

(assert (=> mapNonEmpty!51055 (= mapRes!51055 (and tp!97397 e!725175))))

(declare-fun mapValue!51055 () ValueCell!15638)

(declare-fun mapKey!51055 () (_ BitVec 32))

(declare-fun mapRest!51055 () (Array (_ BitVec 32) ValueCell!15638))

(assert (=> mapNonEmpty!51055 (= (arr!40099 _values!1134) (store mapRest!51055 mapKey!51055 mapValue!51055))))

(declare-fun b!1271610 () Bool)

(declare-fun res!846001 () Bool)

(assert (=> b!1271610 (=> (not res!846001) (not e!725179))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271610 (= res!846001 (and (= (size!40637 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40638 _keys!1364) (size!40637 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107294 res!846002) b!1271610))

(assert (= (and b!1271610 res!846001) b!1271609))

(assert (= (and b!1271609 res!846000) b!1271608))

(assert (= (and b!1271607 condMapEmpty!51055) mapIsEmpty!51055))

(assert (= (and b!1271607 (not condMapEmpty!51055)) mapNonEmpty!51055))

(get-info :version)

(assert (= (and mapNonEmpty!51055 ((_ is ValueCellFull!15638) mapValue!51055)) b!1271606))

(assert (= (and b!1271607 ((_ is ValueCellFull!15638) mapDefault!51055)) b!1271605))

(assert (= start!107294 b!1271607))

(declare-fun m!1169043 () Bool)

(assert (=> start!107294 m!1169043))

(declare-fun m!1169045 () Bool)

(assert (=> start!107294 m!1169045))

(declare-fun m!1169047 () Bool)

(assert (=> start!107294 m!1169047))

(declare-fun m!1169049 () Bool)

(assert (=> b!1271608 m!1169049))

(declare-fun m!1169051 () Bool)

(assert (=> b!1271609 m!1169051))

(declare-fun m!1169053 () Bool)

(assert (=> mapNonEmpty!51055 m!1169053))

(check-sat (not start!107294) (not mapNonEmpty!51055) (not b!1271608) tp_is_empty!32983 (not b!1271609))
(check-sat)
