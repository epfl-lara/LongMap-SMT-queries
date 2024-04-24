; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107524 () Bool)

(assert start!107524)

(declare-fun b!1273028 () Bool)

(declare-fun e!726100 () Bool)

(declare-fun e!726098 () Bool)

(declare-fun mapRes!51064 () Bool)

(assert (=> b!1273028 (= e!726100 (and e!726098 mapRes!51064))))

(declare-fun condMapEmpty!51064 () Bool)

(declare-datatypes ((V!49179 0))(
  ( (V!49180 (val!16569 Int)) )
))
(declare-datatypes ((ValueCell!15641 0))(
  ( (ValueCellFull!15641 (v!19201 V!49179)) (EmptyCell!15641) )
))
(declare-datatypes ((array!83247 0))(
  ( (array!83248 (arr!40156 (Array (_ BitVec 32) ValueCell!15641)) (size!40693 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83247)

(declare-fun mapDefault!51064 () ValueCell!15641)

(assert (=> b!1273028 (= condMapEmpty!51064 (= (arr!40156 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15641)) mapDefault!51064)))))

(declare-fun res!846574 () Bool)

(declare-fun e!726099 () Bool)

(assert (=> start!107524 (=> (not res!846574) (not e!726099))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107524 (= res!846574 (validMask!0 mask!1730))))

(assert (=> start!107524 e!726099))

(declare-fun array_inv!30705 (array!83247) Bool)

(assert (=> start!107524 (and (array_inv!30705 _values!1134) e!726100)))

(assert (=> start!107524 true))

(declare-datatypes ((array!83249 0))(
  ( (array!83250 (arr!40157 (Array (_ BitVec 32) (_ BitVec 64))) (size!40694 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83249)

(declare-fun array_inv!30706 (array!83249) Bool)

(assert (=> start!107524 (array_inv!30706 _keys!1364)))

(declare-fun b!1273029 () Bool)

(assert (=> b!1273029 (= e!726099 false)))

(declare-fun lt!575404 () Bool)

(declare-datatypes ((List!28564 0))(
  ( (Nil!28561) (Cons!28560 (h!29778 (_ BitVec 64)) (t!42085 List!28564)) )
))
(declare-fun arrayNoDuplicates!0 (array!83249 (_ BitVec 32) List!28564) Bool)

(assert (=> b!1273029 (= lt!575404 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28561))))

(declare-fun b!1273030 () Bool)

(declare-fun e!726096 () Bool)

(declare-fun tp_is_empty!32989 () Bool)

(assert (=> b!1273030 (= e!726096 tp_is_empty!32989)))

(declare-fun b!1273031 () Bool)

(assert (=> b!1273031 (= e!726098 tp_is_empty!32989)))

(declare-fun mapNonEmpty!51064 () Bool)

(declare-fun tp!97405 () Bool)

(assert (=> mapNonEmpty!51064 (= mapRes!51064 (and tp!97405 e!726096))))

(declare-fun mapValue!51064 () ValueCell!15641)

(declare-fun mapKey!51064 () (_ BitVec 32))

(declare-fun mapRest!51064 () (Array (_ BitVec 32) ValueCell!15641))

(assert (=> mapNonEmpty!51064 (= (arr!40156 _values!1134) (store mapRest!51064 mapKey!51064 mapValue!51064))))

(declare-fun b!1273032 () Bool)

(declare-fun res!846576 () Bool)

(assert (=> b!1273032 (=> (not res!846576) (not e!726099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83249 (_ BitVec 32)) Bool)

(assert (=> b!1273032 (= res!846576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1273033 () Bool)

(declare-fun res!846575 () Bool)

(assert (=> b!1273033 (=> (not res!846575) (not e!726099))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1273033 (= res!846575 (and (= (size!40693 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40694 _keys!1364) (size!40693 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51064 () Bool)

(assert (=> mapIsEmpty!51064 mapRes!51064))

(assert (= (and start!107524 res!846574) b!1273033))

(assert (= (and b!1273033 res!846575) b!1273032))

(assert (= (and b!1273032 res!846576) b!1273029))

(assert (= (and b!1273028 condMapEmpty!51064) mapIsEmpty!51064))

(assert (= (and b!1273028 (not condMapEmpty!51064)) mapNonEmpty!51064))

(get-info :version)

(assert (= (and mapNonEmpty!51064 ((_ is ValueCellFull!15641) mapValue!51064)) b!1273030))

(assert (= (and b!1273028 ((_ is ValueCellFull!15641) mapDefault!51064)) b!1273031))

(assert (= start!107524 b!1273028))

(declare-fun m!1171191 () Bool)

(assert (=> start!107524 m!1171191))

(declare-fun m!1171193 () Bool)

(assert (=> start!107524 m!1171193))

(declare-fun m!1171195 () Bool)

(assert (=> start!107524 m!1171195))

(declare-fun m!1171197 () Bool)

(assert (=> b!1273029 m!1171197))

(declare-fun m!1171199 () Bool)

(assert (=> mapNonEmpty!51064 m!1171199))

(declare-fun m!1171201 () Bool)

(assert (=> b!1273032 m!1171201))

(check-sat (not mapNonEmpty!51064) (not start!107524) (not b!1273032) tp_is_empty!32989 (not b!1273029))
(check-sat)
