; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!536 () Bool)

(assert start!536)

(declare-fun b!3159 () Bool)

(declare-fun e!1417 () Bool)

(assert (=> b!3159 (= e!1417 false)))

(declare-fun lt!429 () Bool)

(declare-datatypes ((array!129 0))(
  ( (array!130 (arr!58 (Array (_ BitVec 32) (_ BitVec 64))) (size!120 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!129)

(declare-datatypes ((List!44 0))(
  ( (Nil!41) (Cons!40 (h!606 (_ BitVec 64)) (t!2171 List!44)) )
))
(declare-fun arrayNoDuplicates!0 (array!129 (_ BitVec 32) List!44) Bool)

(assert (=> b!3159 (= lt!429 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!41))))

(declare-fun b!3160 () Bool)

(declare-fun e!1416 () Bool)

(declare-fun tp_is_empty!97 () Bool)

(assert (=> b!3160 (= e!1416 tp_is_empty!97)))

(declare-fun b!3161 () Bool)

(declare-fun res!5040 () Bool)

(assert (=> b!3161 (=> (not res!5040) (not e!1417))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!307 0))(
  ( (V!308 (val!54 Int)) )
))
(declare-datatypes ((ValueCell!32 0))(
  ( (ValueCellFull!32 (v!1141 V!307)) (EmptyCell!32) )
))
(declare-datatypes ((array!131 0))(
  ( (array!132 (arr!59 (Array (_ BitVec 32) ValueCell!32)) (size!121 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!131)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3161 (= res!5040 (and (= (size!121 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!120 _keys!1806) (size!121 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!101 () Bool)

(declare-fun mapRes!101 () Bool)

(declare-fun tp!341 () Bool)

(declare-fun e!1418 () Bool)

(assert (=> mapNonEmpty!101 (= mapRes!101 (and tp!341 e!1418))))

(declare-fun mapRest!101 () (Array (_ BitVec 32) ValueCell!32))

(declare-fun mapKey!101 () (_ BitVec 32))

(declare-fun mapValue!101 () ValueCell!32)

(assert (=> mapNonEmpty!101 (= (arr!59 _values!1492) (store mapRest!101 mapKey!101 mapValue!101))))

(declare-fun b!3162 () Bool)

(declare-fun e!1414 () Bool)

(assert (=> b!3162 (= e!1414 (and e!1416 mapRes!101))))

(declare-fun condMapEmpty!101 () Bool)

(declare-fun mapDefault!101 () ValueCell!32)

(assert (=> b!3162 (= condMapEmpty!101 (= (arr!59 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!32)) mapDefault!101)))))

(declare-fun mapIsEmpty!101 () Bool)

(assert (=> mapIsEmpty!101 mapRes!101))

(declare-fun b!3164 () Bool)

(declare-fun res!5041 () Bool)

(assert (=> b!3164 (=> (not res!5041) (not e!1417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!129 (_ BitVec 32)) Bool)

(assert (=> b!3164 (= res!5041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!5039 () Bool)

(assert (=> start!536 (=> (not res!5039) (not e!1417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!536 (= res!5039 (validMask!0 mask!2250))))

(assert (=> start!536 e!1417))

(assert (=> start!536 true))

(declare-fun array_inv!35 (array!131) Bool)

(assert (=> start!536 (and (array_inv!35 _values!1492) e!1414)))

(declare-fun array_inv!36 (array!129) Bool)

(assert (=> start!536 (array_inv!36 _keys!1806)))

(declare-fun b!3163 () Bool)

(assert (=> b!3163 (= e!1418 tp_is_empty!97)))

(assert (= (and start!536 res!5039) b!3161))

(assert (= (and b!3161 res!5040) b!3164))

(assert (= (and b!3164 res!5041) b!3159))

(assert (= (and b!3162 condMapEmpty!101) mapIsEmpty!101))

(assert (= (and b!3162 (not condMapEmpty!101)) mapNonEmpty!101))

(get-info :version)

(assert (= (and mapNonEmpty!101 ((_ is ValueCellFull!32) mapValue!101)) b!3163))

(assert (= (and b!3162 ((_ is ValueCellFull!32) mapDefault!101)) b!3160))

(assert (= start!536 b!3162))

(declare-fun m!1469 () Bool)

(assert (=> b!3159 m!1469))

(declare-fun m!1471 () Bool)

(assert (=> mapNonEmpty!101 m!1471))

(declare-fun m!1473 () Bool)

(assert (=> b!3164 m!1473))

(declare-fun m!1475 () Bool)

(assert (=> start!536 m!1475))

(declare-fun m!1477 () Bool)

(assert (=> start!536 m!1477))

(declare-fun m!1479 () Bool)

(assert (=> start!536 m!1479))

(check-sat tp_is_empty!97 (not b!3164) (not start!536) (not mapNonEmpty!101) (not b!3159))
(check-sat)
