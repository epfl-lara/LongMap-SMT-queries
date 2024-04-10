; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38526 () Bool)

(assert start!38526)

(declare-fun mapIsEmpty!16539 () Bool)

(declare-fun mapRes!16539 () Bool)

(assert (=> mapIsEmpty!16539 mapRes!16539))

(declare-fun mapNonEmpty!16539 () Bool)

(declare-fun tp!32334 () Bool)

(declare-fun e!240688 () Bool)

(assert (=> mapNonEmpty!16539 (= mapRes!16539 (and tp!32334 e!240688))))

(declare-datatypes ((V!14365 0))(
  ( (V!14366 (val!5017 Int)) )
))
(declare-datatypes ((ValueCell!4629 0))(
  ( (ValueCellFull!4629 (v!7264 V!14365)) (EmptyCell!4629) )
))
(declare-datatypes ((array!23801 0))(
  ( (array!23802 (arr!11350 (Array (_ BitVec 32) ValueCell!4629)) (size!11702 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23801)

(declare-fun mapKey!16539 () (_ BitVec 32))

(declare-fun mapValue!16539 () ValueCell!4629)

(declare-fun mapRest!16539 () (Array (_ BitVec 32) ValueCell!4629))

(assert (=> mapNonEmpty!16539 (= (arr!11350 _values!549) (store mapRest!16539 mapKey!16539 mapValue!16539))))

(declare-fun b!398153 () Bool)

(declare-fun res!228750 () Bool)

(declare-fun e!240690 () Bool)

(assert (=> b!398153 (=> (not res!228750) (not e!240690))))

(declare-datatypes ((array!23803 0))(
  ( (array!23804 (arr!11351 (Array (_ BitVec 32) (_ BitVec 64))) (size!11703 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23803)

(declare-datatypes ((List!6566 0))(
  ( (Nil!6563) (Cons!6562 (h!7418 (_ BitVec 64)) (t!11740 List!6566)) )
))
(declare-fun arrayNoDuplicates!0 (array!23803 (_ BitVec 32) List!6566) Bool)

(assert (=> b!398153 (= res!228750 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6563))))

(declare-fun b!398154 () Bool)

(declare-fun res!228759 () Bool)

(assert (=> b!398154 (=> (not res!228759) (not e!240690))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!398154 (= res!228759 (and (= (size!11702 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11703 _keys!709) (size!11702 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398155 () Bool)

(declare-fun res!228754 () Bool)

(assert (=> b!398155 (=> (not res!228754) (not e!240690))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398155 (= res!228754 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11703 _keys!709))))))

(declare-fun b!398157 () Bool)

(declare-fun e!240687 () Bool)

(assert (=> b!398157 (= e!240690 e!240687)))

(declare-fun res!228755 () Bool)

(assert (=> b!398157 (=> (not res!228755) (not e!240687))))

(declare-fun lt!187415 () array!23803)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23803 (_ BitVec 32)) Bool)

(assert (=> b!398157 (= res!228755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187415 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!398157 (= lt!187415 (array!23804 (store (arr!11351 _keys!709) i!563 k0!794) (size!11703 _keys!709)))))

(declare-fun b!398158 () Bool)

(declare-fun e!240689 () Bool)

(declare-fun e!240685 () Bool)

(assert (=> b!398158 (= e!240689 (and e!240685 mapRes!16539))))

(declare-fun condMapEmpty!16539 () Bool)

(declare-fun mapDefault!16539 () ValueCell!4629)

(assert (=> b!398158 (= condMapEmpty!16539 (= (arr!11350 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4629)) mapDefault!16539)))))

(declare-fun b!398159 () Bool)

(declare-fun res!228753 () Bool)

(assert (=> b!398159 (=> (not res!228753) (not e!240690))))

(declare-fun arrayContainsKey!0 (array!23803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398159 (= res!228753 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398160 () Bool)

(assert (=> b!398160 (= e!240687 false)))

(declare-fun lt!187414 () Bool)

(assert (=> b!398160 (= lt!187414 (arrayNoDuplicates!0 lt!187415 #b00000000000000000000000000000000 Nil!6563))))

(declare-fun b!398161 () Bool)

(declare-fun res!228756 () Bool)

(assert (=> b!398161 (=> (not res!228756) (not e!240690))))

(assert (=> b!398161 (= res!228756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398162 () Bool)

(declare-fun res!228757 () Bool)

(assert (=> b!398162 (=> (not res!228757) (not e!240690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398162 (= res!228757 (validMask!0 mask!1025))))

(declare-fun b!398163 () Bool)

(declare-fun tp_is_empty!9945 () Bool)

(assert (=> b!398163 (= e!240688 tp_is_empty!9945)))

(declare-fun res!228751 () Bool)

(assert (=> start!38526 (=> (not res!228751) (not e!240690))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38526 (= res!228751 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11703 _keys!709))))))

(assert (=> start!38526 e!240690))

(assert (=> start!38526 true))

(declare-fun array_inv!8318 (array!23801) Bool)

(assert (=> start!38526 (and (array_inv!8318 _values!549) e!240689)))

(declare-fun array_inv!8319 (array!23803) Bool)

(assert (=> start!38526 (array_inv!8319 _keys!709)))

(declare-fun b!398156 () Bool)

(declare-fun res!228758 () Bool)

(assert (=> b!398156 (=> (not res!228758) (not e!240690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398156 (= res!228758 (validKeyInArray!0 k0!794))))

(declare-fun b!398164 () Bool)

(declare-fun res!228752 () Bool)

(assert (=> b!398164 (=> (not res!228752) (not e!240690))))

(assert (=> b!398164 (= res!228752 (or (= (select (arr!11351 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11351 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398165 () Bool)

(assert (=> b!398165 (= e!240685 tp_is_empty!9945)))

(assert (= (and start!38526 res!228751) b!398162))

(assert (= (and b!398162 res!228757) b!398154))

(assert (= (and b!398154 res!228759) b!398161))

(assert (= (and b!398161 res!228756) b!398153))

(assert (= (and b!398153 res!228750) b!398155))

(assert (= (and b!398155 res!228754) b!398156))

(assert (= (and b!398156 res!228758) b!398164))

(assert (= (and b!398164 res!228752) b!398159))

(assert (= (and b!398159 res!228753) b!398157))

(assert (= (and b!398157 res!228755) b!398160))

(assert (= (and b!398158 condMapEmpty!16539) mapIsEmpty!16539))

(assert (= (and b!398158 (not condMapEmpty!16539)) mapNonEmpty!16539))

(get-info :version)

(assert (= (and mapNonEmpty!16539 ((_ is ValueCellFull!4629) mapValue!16539)) b!398163))

(assert (= (and b!398158 ((_ is ValueCellFull!4629) mapDefault!16539)) b!398165))

(assert (= start!38526 b!398158))

(declare-fun m!393127 () Bool)

(assert (=> b!398161 m!393127))

(declare-fun m!393129 () Bool)

(assert (=> b!398162 m!393129))

(declare-fun m!393131 () Bool)

(assert (=> b!398159 m!393131))

(declare-fun m!393133 () Bool)

(assert (=> b!398160 m!393133))

(declare-fun m!393135 () Bool)

(assert (=> b!398157 m!393135))

(declare-fun m!393137 () Bool)

(assert (=> b!398157 m!393137))

(declare-fun m!393139 () Bool)

(assert (=> b!398164 m!393139))

(declare-fun m!393141 () Bool)

(assert (=> mapNonEmpty!16539 m!393141))

(declare-fun m!393143 () Bool)

(assert (=> start!38526 m!393143))

(declare-fun m!393145 () Bool)

(assert (=> start!38526 m!393145))

(declare-fun m!393147 () Bool)

(assert (=> b!398156 m!393147))

(declare-fun m!393149 () Bool)

(assert (=> b!398153 m!393149))

(check-sat (not b!398160) (not b!398153) (not mapNonEmpty!16539) (not start!38526) (not b!398161) (not b!398157) (not b!398162) (not b!398159) (not b!398156) tp_is_empty!9945)
(check-sat)
