; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!554 () Bool)

(assert start!554)

(declare-fun mapIsEmpty!128 () Bool)

(declare-fun mapRes!128 () Bool)

(assert (=> mapIsEmpty!128 mapRes!128))

(declare-fun b!3322 () Bool)

(declare-fun e!1549 () Bool)

(declare-fun tp_is_empty!115 () Bool)

(assert (=> b!3322 (= e!1549 tp_is_empty!115)))

(declare-fun b!3323 () Bool)

(declare-fun e!1551 () Bool)

(assert (=> b!3323 (= e!1551 (and e!1549 mapRes!128))))

(declare-fun condMapEmpty!128 () Bool)

(declare-datatypes ((V!331 0))(
  ( (V!332 (val!63 Int)) )
))
(declare-datatypes ((ValueCell!41 0))(
  ( (ValueCellFull!41 (v!1150 V!331)) (EmptyCell!41) )
))
(declare-datatypes ((array!161 0))(
  ( (array!162 (arr!74 (Array (_ BitVec 32) ValueCell!41)) (size!136 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!161)

(declare-fun mapDefault!128 () ValueCell!41)

(assert (=> b!3323 (= condMapEmpty!128 (= (arr!74 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!41)) mapDefault!128)))))

(declare-fun b!3324 () Bool)

(declare-fun e!1550 () Bool)

(assert (=> b!3324 (= e!1550 false)))

(declare-fun lt!456 () Bool)

(declare-datatypes ((array!163 0))(
  ( (array!164 (arr!75 (Array (_ BitVec 32) (_ BitVec 64))) (size!137 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!163)

(declare-datatypes ((List!50 0))(
  ( (Nil!47) (Cons!46 (h!612 (_ BitVec 64)) (t!2177 List!50)) )
))
(declare-fun arrayNoDuplicates!0 (array!163 (_ BitVec 32) List!50) Bool)

(assert (=> b!3324 (= lt!456 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!47))))

(declare-fun mapNonEmpty!128 () Bool)

(declare-fun tp!368 () Bool)

(declare-fun e!1553 () Bool)

(assert (=> mapNonEmpty!128 (= mapRes!128 (and tp!368 e!1553))))

(declare-fun mapRest!128 () (Array (_ BitVec 32) ValueCell!41))

(declare-fun mapKey!128 () (_ BitVec 32))

(declare-fun mapValue!128 () ValueCell!41)

(assert (=> mapNonEmpty!128 (= (arr!74 _values!1492) (store mapRest!128 mapKey!128 mapValue!128))))

(declare-fun b!3325 () Bool)

(declare-fun res!5122 () Bool)

(assert (=> b!3325 (=> (not res!5122) (not e!1550))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!163 (_ BitVec 32)) Bool)

(assert (=> b!3325 (= res!5122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3326 () Bool)

(declare-fun res!5121 () Bool)

(assert (=> b!3326 (=> (not res!5121) (not e!1550))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3326 (= res!5121 (and (= (size!136 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!137 _keys!1806) (size!136 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3321 () Bool)

(assert (=> b!3321 (= e!1553 tp_is_empty!115)))

(declare-fun res!5120 () Bool)

(assert (=> start!554 (=> (not res!5120) (not e!1550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!554 (= res!5120 (validMask!0 mask!2250))))

(assert (=> start!554 e!1550))

(assert (=> start!554 true))

(declare-fun array_inv!45 (array!161) Bool)

(assert (=> start!554 (and (array_inv!45 _values!1492) e!1551)))

(declare-fun array_inv!46 (array!163) Bool)

(assert (=> start!554 (array_inv!46 _keys!1806)))

(assert (= (and start!554 res!5120) b!3326))

(assert (= (and b!3326 res!5121) b!3325))

(assert (= (and b!3325 res!5122) b!3324))

(assert (= (and b!3323 condMapEmpty!128) mapIsEmpty!128))

(assert (= (and b!3323 (not condMapEmpty!128)) mapNonEmpty!128))

(get-info :version)

(assert (= (and mapNonEmpty!128 ((_ is ValueCellFull!41) mapValue!128)) b!3321))

(assert (= (and b!3323 ((_ is ValueCellFull!41) mapDefault!128)) b!3322))

(assert (= start!554 b!3323))

(declare-fun m!1577 () Bool)

(assert (=> b!3324 m!1577))

(declare-fun m!1579 () Bool)

(assert (=> mapNonEmpty!128 m!1579))

(declare-fun m!1581 () Bool)

(assert (=> b!3325 m!1581))

(declare-fun m!1583 () Bool)

(assert (=> start!554 m!1583))

(declare-fun m!1585 () Bool)

(assert (=> start!554 m!1585))

(declare-fun m!1587 () Bool)

(assert (=> start!554 m!1587))

(check-sat tp_is_empty!115 (not mapNonEmpty!128) (not b!3324) (not b!3325) (not start!554))
(check-sat)
