; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106970 () Bool)

(assert start!106970)

(declare-fun b!1268365 () Bool)

(declare-fun e!722749 () Bool)

(assert (=> b!1268365 (= e!722749 false)))

(declare-fun lt!574247 () Bool)

(declare-datatypes ((array!82513 0))(
  ( (array!82514 (arr!39794 (Array (_ BitVec 32) (_ BitVec 64))) (size!40332 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82513)

(declare-datatypes ((List!28465 0))(
  ( (Nil!28462) (Cons!28461 (h!29670 (_ BitVec 64)) (t!41986 List!28465)) )
))
(declare-fun arrayNoDuplicates!0 (array!82513 (_ BitVec 32) List!28465) Bool)

(assert (=> b!1268365 (= lt!574247 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28462))))

(declare-fun b!1268367 () Bool)

(declare-fun e!722745 () Bool)

(declare-fun tp_is_empty!32659 () Bool)

(assert (=> b!1268367 (= e!722745 tp_is_empty!32659)))

(declare-fun mapIsEmpty!50569 () Bool)

(declare-fun mapRes!50569 () Bool)

(assert (=> mapIsEmpty!50569 mapRes!50569))

(declare-fun mapNonEmpty!50569 () Bool)

(declare-fun tp!96749 () Bool)

(assert (=> mapNonEmpty!50569 (= mapRes!50569 (and tp!96749 e!722745))))

(declare-datatypes ((V!48739 0))(
  ( (V!48740 (val!16404 Int)) )
))
(declare-datatypes ((ValueCell!15476 0))(
  ( (ValueCellFull!15476 (v!19040 V!48739)) (EmptyCell!15476) )
))
(declare-datatypes ((array!82515 0))(
  ( (array!82516 (arr!39795 (Array (_ BitVec 32) ValueCell!15476)) (size!40333 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82515)

(declare-fun mapKey!50569 () (_ BitVec 32))

(declare-fun mapRest!50569 () (Array (_ BitVec 32) ValueCell!15476))

(declare-fun mapValue!50569 () ValueCell!15476)

(assert (=> mapNonEmpty!50569 (= (arr!39795 _values!1134) (store mapRest!50569 mapKey!50569 mapValue!50569))))

(declare-fun b!1268368 () Bool)

(declare-fun res!844220 () Bool)

(assert (=> b!1268368 (=> (not res!844220) (not e!722749))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268368 (= res!844220 (and (= (size!40333 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40332 _keys!1364) (size!40333 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268369 () Bool)

(declare-fun e!722746 () Bool)

(assert (=> b!1268369 (= e!722746 tp_is_empty!32659)))

(declare-fun b!1268370 () Bool)

(declare-fun e!722748 () Bool)

(assert (=> b!1268370 (= e!722748 (and e!722746 mapRes!50569))))

(declare-fun condMapEmpty!50569 () Bool)

(declare-fun mapDefault!50569 () ValueCell!15476)

(assert (=> b!1268370 (= condMapEmpty!50569 (= (arr!39795 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15476)) mapDefault!50569)))))

(declare-fun res!844218 () Bool)

(assert (=> start!106970 (=> (not res!844218) (not e!722749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106970 (= res!844218 (validMask!0 mask!1730))))

(assert (=> start!106970 e!722749))

(declare-fun array_inv!30445 (array!82515) Bool)

(assert (=> start!106970 (and (array_inv!30445 _values!1134) e!722748)))

(assert (=> start!106970 true))

(declare-fun array_inv!30446 (array!82513) Bool)

(assert (=> start!106970 (array_inv!30446 _keys!1364)))

(declare-fun b!1268366 () Bool)

(declare-fun res!844219 () Bool)

(assert (=> b!1268366 (=> (not res!844219) (not e!722749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82513 (_ BitVec 32)) Bool)

(assert (=> b!1268366 (= res!844219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!106970 res!844218) b!1268368))

(assert (= (and b!1268368 res!844220) b!1268366))

(assert (= (and b!1268366 res!844219) b!1268365))

(assert (= (and b!1268370 condMapEmpty!50569) mapIsEmpty!50569))

(assert (= (and b!1268370 (not condMapEmpty!50569)) mapNonEmpty!50569))

(get-info :version)

(assert (= (and mapNonEmpty!50569 ((_ is ValueCellFull!15476) mapValue!50569)) b!1268367))

(assert (= (and b!1268370 ((_ is ValueCellFull!15476) mapDefault!50569)) b!1268369))

(assert (= start!106970 b!1268370))

(declare-fun m!1166775 () Bool)

(assert (=> b!1268365 m!1166775))

(declare-fun m!1166777 () Bool)

(assert (=> mapNonEmpty!50569 m!1166777))

(declare-fun m!1166779 () Bool)

(assert (=> start!106970 m!1166779))

(declare-fun m!1166781 () Bool)

(assert (=> start!106970 m!1166781))

(declare-fun m!1166783 () Bool)

(assert (=> start!106970 m!1166783))

(declare-fun m!1166785 () Bool)

(assert (=> b!1268366 m!1166785))

(check-sat (not start!106970) tp_is_empty!32659 (not b!1268366) (not b!1268365) (not mapNonEmpty!50569))
(check-sat)
