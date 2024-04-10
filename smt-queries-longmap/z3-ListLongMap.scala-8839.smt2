; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107260 () Bool)

(assert start!107260)

(declare-fun b!1271363 () Bool)

(declare-fun e!724949 () Bool)

(assert (=> b!1271363 (= e!724949 false)))

(declare-fun lt!574860 () Bool)

(declare-datatypes ((array!83148 0))(
  ( (array!83149 (arr!40111 (Array (_ BitVec 32) (_ BitVec 64))) (size!40647 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83148)

(declare-datatypes ((List!28521 0))(
  ( (Nil!28518) (Cons!28517 (h!29726 (_ BitVec 64)) (t!42050 List!28521)) )
))
(declare-fun arrayNoDuplicates!0 (array!83148 (_ BitVec 32) List!28521) Bool)

(assert (=> b!1271363 (= lt!574860 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28518))))

(declare-fun b!1271364 () Bool)

(declare-fun res!845875 () Bool)

(assert (=> b!1271364 (=> (not res!845875) (not e!724949))))

(declare-datatypes ((V!49125 0))(
  ( (V!49126 (val!16549 Int)) )
))
(declare-datatypes ((ValueCell!15621 0))(
  ( (ValueCellFull!15621 (v!19186 V!49125)) (EmptyCell!15621) )
))
(declare-datatypes ((array!83150 0))(
  ( (array!83151 (arr!40112 (Array (_ BitVec 32) ValueCell!15621)) (size!40648 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83150)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271364 (= res!845875 (and (= (size!40648 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40647 _keys!1364) (size!40648 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845876 () Bool)

(assert (=> start!107260 (=> (not res!845876) (not e!724949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107260 (= res!845876 (validMask!0 mask!1730))))

(assert (=> start!107260 e!724949))

(declare-fun e!724950 () Bool)

(declare-fun array_inv!30509 (array!83150) Bool)

(assert (=> start!107260 (and (array_inv!30509 _values!1134) e!724950)))

(assert (=> start!107260 true))

(declare-fun array_inv!30510 (array!83148) Bool)

(assert (=> start!107260 (array_inv!30510 _keys!1364)))

(declare-fun b!1271365 () Bool)

(declare-fun e!724951 () Bool)

(declare-fun mapRes!51004 () Bool)

(assert (=> b!1271365 (= e!724950 (and e!724951 mapRes!51004))))

(declare-fun condMapEmpty!51004 () Bool)

(declare-fun mapDefault!51004 () ValueCell!15621)

(assert (=> b!1271365 (= condMapEmpty!51004 (= (arr!40112 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15621)) mapDefault!51004)))))

(declare-fun b!1271366 () Bool)

(declare-fun res!845874 () Bool)

(assert (=> b!1271366 (=> (not res!845874) (not e!724949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83148 (_ BitVec 32)) Bool)

(assert (=> b!1271366 (= res!845874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!51004 () Bool)

(assert (=> mapIsEmpty!51004 mapRes!51004))

(declare-fun b!1271367 () Bool)

(declare-fun tp_is_empty!32949 () Bool)

(assert (=> b!1271367 (= e!724951 tp_is_empty!32949)))

(declare-fun mapNonEmpty!51004 () Bool)

(declare-fun tp!97345 () Bool)

(declare-fun e!724952 () Bool)

(assert (=> mapNonEmpty!51004 (= mapRes!51004 (and tp!97345 e!724952))))

(declare-fun mapValue!51004 () ValueCell!15621)

(declare-fun mapKey!51004 () (_ BitVec 32))

(declare-fun mapRest!51004 () (Array (_ BitVec 32) ValueCell!15621))

(assert (=> mapNonEmpty!51004 (= (arr!40112 _values!1134) (store mapRest!51004 mapKey!51004 mapValue!51004))))

(declare-fun b!1271368 () Bool)

(assert (=> b!1271368 (= e!724952 tp_is_empty!32949)))

(assert (= (and start!107260 res!845876) b!1271364))

(assert (= (and b!1271364 res!845875) b!1271366))

(assert (= (and b!1271366 res!845874) b!1271363))

(assert (= (and b!1271365 condMapEmpty!51004) mapIsEmpty!51004))

(assert (= (and b!1271365 (not condMapEmpty!51004)) mapNonEmpty!51004))

(get-info :version)

(assert (= (and mapNonEmpty!51004 ((_ is ValueCellFull!15621) mapValue!51004)) b!1271368))

(assert (= (and b!1271365 ((_ is ValueCellFull!15621) mapDefault!51004)) b!1271367))

(assert (= start!107260 b!1271365))

(declare-fun m!1169339 () Bool)

(assert (=> b!1271363 m!1169339))

(declare-fun m!1169341 () Bool)

(assert (=> start!107260 m!1169341))

(declare-fun m!1169343 () Bool)

(assert (=> start!107260 m!1169343))

(declare-fun m!1169345 () Bool)

(assert (=> start!107260 m!1169345))

(declare-fun m!1169347 () Bool)

(assert (=> b!1271366 m!1169347))

(declare-fun m!1169349 () Bool)

(assert (=> mapNonEmpty!51004 m!1169349))

(check-sat (not start!107260) (not b!1271366) (not b!1271363) tp_is_empty!32949 (not mapNonEmpty!51004))
(check-sat)
