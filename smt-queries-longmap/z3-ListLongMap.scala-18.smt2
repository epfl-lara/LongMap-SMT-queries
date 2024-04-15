; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!530 () Bool)

(assert start!530)

(declare-fun res!5013 () Bool)

(declare-fun e!1371 () Bool)

(assert (=> start!530 (=> (not res!5013) (not e!1371))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!530 (= res!5013 (validMask!0 mask!2250))))

(assert (=> start!530 e!1371))

(assert (=> start!530 true))

(declare-datatypes ((V!299 0))(
  ( (V!300 (val!51 Int)) )
))
(declare-datatypes ((ValueCell!29 0))(
  ( (ValueCellFull!29 (v!1138 V!299)) (EmptyCell!29) )
))
(declare-datatypes ((array!117 0))(
  ( (array!118 (arr!52 (Array (_ BitVec 32) ValueCell!29)) (size!114 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!117)

(declare-fun e!1373 () Bool)

(declare-fun array_inv!31 (array!117) Bool)

(assert (=> start!530 (and (array_inv!31 _values!1492) e!1373)))

(declare-datatypes ((array!119 0))(
  ( (array!120 (arr!53 (Array (_ BitVec 32) (_ BitVec 64))) (size!115 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!119)

(declare-fun array_inv!32 (array!119) Bool)

(assert (=> start!530 (array_inv!32 _keys!1806)))

(declare-fun b!3105 () Bool)

(declare-fun res!5012 () Bool)

(assert (=> b!3105 (=> (not res!5012) (not e!1371))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3105 (= res!5012 (and (= (size!114 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!115 _keys!1806) (size!114 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3106 () Bool)

(assert (=> b!3106 (= e!1371 false)))

(declare-fun lt!420 () Bool)

(declare-datatypes ((List!42 0))(
  ( (Nil!39) (Cons!38 (h!604 (_ BitVec 64)) (t!2169 List!42)) )
))
(declare-fun arrayNoDuplicates!0 (array!119 (_ BitVec 32) List!42) Bool)

(assert (=> b!3106 (= lt!420 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!39))))

(declare-fun mapNonEmpty!92 () Bool)

(declare-fun mapRes!92 () Bool)

(declare-fun tp!332 () Bool)

(declare-fun e!1372 () Bool)

(assert (=> mapNonEmpty!92 (= mapRes!92 (and tp!332 e!1372))))

(declare-fun mapRest!92 () (Array (_ BitVec 32) ValueCell!29))

(declare-fun mapKey!92 () (_ BitVec 32))

(declare-fun mapValue!92 () ValueCell!29)

(assert (=> mapNonEmpty!92 (= (arr!52 _values!1492) (store mapRest!92 mapKey!92 mapValue!92))))

(declare-fun b!3107 () Bool)

(declare-fun tp_is_empty!91 () Bool)

(assert (=> b!3107 (= e!1372 tp_is_empty!91)))

(declare-fun mapIsEmpty!92 () Bool)

(assert (=> mapIsEmpty!92 mapRes!92))

(declare-fun b!3108 () Bool)

(declare-fun e!1370 () Bool)

(assert (=> b!3108 (= e!1373 (and e!1370 mapRes!92))))

(declare-fun condMapEmpty!92 () Bool)

(declare-fun mapDefault!92 () ValueCell!29)

(assert (=> b!3108 (= condMapEmpty!92 (= (arr!52 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!29)) mapDefault!92)))))

(declare-fun b!3109 () Bool)

(assert (=> b!3109 (= e!1370 tp_is_empty!91)))

(declare-fun b!3110 () Bool)

(declare-fun res!5014 () Bool)

(assert (=> b!3110 (=> (not res!5014) (not e!1371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!119 (_ BitVec 32)) Bool)

(assert (=> b!3110 (= res!5014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(assert (= (and start!530 res!5013) b!3105))

(assert (= (and b!3105 res!5012) b!3110))

(assert (= (and b!3110 res!5014) b!3106))

(assert (= (and b!3108 condMapEmpty!92) mapIsEmpty!92))

(assert (= (and b!3108 (not condMapEmpty!92)) mapNonEmpty!92))

(get-info :version)

(assert (= (and mapNonEmpty!92 ((_ is ValueCellFull!29) mapValue!92)) b!3107))

(assert (= (and b!3108 ((_ is ValueCellFull!29) mapDefault!92)) b!3109))

(assert (= start!530 b!3108))

(declare-fun m!1433 () Bool)

(assert (=> start!530 m!1433))

(declare-fun m!1435 () Bool)

(assert (=> start!530 m!1435))

(declare-fun m!1437 () Bool)

(assert (=> start!530 m!1437))

(declare-fun m!1439 () Bool)

(assert (=> b!3106 m!1439))

(declare-fun m!1441 () Bool)

(assert (=> mapNonEmpty!92 m!1441))

(declare-fun m!1443 () Bool)

(assert (=> b!3110 m!1443))

(check-sat tp_is_empty!91 (not mapNonEmpty!92) (not start!530) (not b!3106) (not b!3110))
(check-sat)
