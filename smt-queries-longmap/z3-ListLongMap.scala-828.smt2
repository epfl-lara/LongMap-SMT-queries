; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20068 () Bool)

(assert start!20068)

(declare-fun b!196320 () Bool)

(declare-fun e!129299 () Bool)

(declare-fun e!129300 () Bool)

(declare-fun mapRes!7937 () Bool)

(assert (=> b!196320 (= e!129299 (and e!129300 mapRes!7937))))

(declare-fun condMapEmpty!7937 () Bool)

(declare-datatypes ((V!5753 0))(
  ( (V!5754 (val!2334 Int)) )
))
(declare-datatypes ((ValueCell!1946 0))(
  ( (ValueCellFull!1946 (v!4298 V!5753)) (EmptyCell!1946) )
))
(declare-datatypes ((array!8391 0))(
  ( (array!8392 (arr!3945 (Array (_ BitVec 32) ValueCell!1946)) (size!4271 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8391)

(declare-fun mapDefault!7937 () ValueCell!1946)

(assert (=> b!196320 (= condMapEmpty!7937 (= (arr!3945 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1946)) mapDefault!7937)))))

(declare-fun b!196321 () Bool)

(declare-fun e!129303 () Bool)

(assert (=> b!196321 (= e!129303 false)))

(declare-fun lt!97442 () Bool)

(declare-datatypes ((array!8393 0))(
  ( (array!8394 (arr!3946 (Array (_ BitVec 32) (_ BitVec 64))) (size!4272 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8393)

(declare-datatypes ((List!2452 0))(
  ( (Nil!2449) (Cons!2448 (h!3090 (_ BitVec 64)) (t!7374 List!2452)) )
))
(declare-fun arrayNoDuplicates!0 (array!8393 (_ BitVec 32) List!2452) Bool)

(assert (=> b!196321 (= lt!97442 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2449))))

(declare-fun mapNonEmpty!7937 () Bool)

(declare-fun tp!17225 () Bool)

(declare-fun e!129301 () Bool)

(assert (=> mapNonEmpty!7937 (= mapRes!7937 (and tp!17225 e!129301))))

(declare-fun mapKey!7937 () (_ BitVec 32))

(declare-fun mapValue!7937 () ValueCell!1946)

(declare-fun mapRest!7937 () (Array (_ BitVec 32) ValueCell!1946))

(assert (=> mapNonEmpty!7937 (= (arr!3945 _values!649) (store mapRest!7937 mapKey!7937 mapValue!7937))))

(declare-fun b!196322 () Bool)

(declare-fun tp_is_empty!4579 () Bool)

(assert (=> b!196322 (= e!129301 tp_is_empty!4579)))

(declare-fun b!196323 () Bool)

(declare-fun res!92634 () Bool)

(assert (=> b!196323 (=> (not res!92634) (not e!129303))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196323 (= res!92634 (and (= (size!4271 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4272 _keys!825) (size!4271 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92636 () Bool)

(assert (=> start!20068 (=> (not res!92636) (not e!129303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20068 (= res!92636 (validMask!0 mask!1149))))

(assert (=> start!20068 e!129303))

(assert (=> start!20068 true))

(declare-fun array_inv!2559 (array!8391) Bool)

(assert (=> start!20068 (and (array_inv!2559 _values!649) e!129299)))

(declare-fun array_inv!2560 (array!8393) Bool)

(assert (=> start!20068 (array_inv!2560 _keys!825)))

(declare-fun mapIsEmpty!7937 () Bool)

(assert (=> mapIsEmpty!7937 mapRes!7937))

(declare-fun b!196324 () Bool)

(declare-fun res!92635 () Bool)

(assert (=> b!196324 (=> (not res!92635) (not e!129303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8393 (_ BitVec 32)) Bool)

(assert (=> b!196324 (= res!92635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196325 () Bool)

(assert (=> b!196325 (= e!129300 tp_is_empty!4579)))

(assert (= (and start!20068 res!92636) b!196323))

(assert (= (and b!196323 res!92634) b!196324))

(assert (= (and b!196324 res!92635) b!196321))

(assert (= (and b!196320 condMapEmpty!7937) mapIsEmpty!7937))

(assert (= (and b!196320 (not condMapEmpty!7937)) mapNonEmpty!7937))

(get-info :version)

(assert (= (and mapNonEmpty!7937 ((_ is ValueCellFull!1946) mapValue!7937)) b!196322))

(assert (= (and b!196320 ((_ is ValueCellFull!1946) mapDefault!7937)) b!196325))

(assert (= start!20068 b!196320))

(declare-fun m!223119 () Bool)

(assert (=> b!196321 m!223119))

(declare-fun m!223121 () Bool)

(assert (=> mapNonEmpty!7937 m!223121))

(declare-fun m!223123 () Bool)

(assert (=> start!20068 m!223123))

(declare-fun m!223125 () Bool)

(assert (=> start!20068 m!223125))

(declare-fun m!223127 () Bool)

(assert (=> start!20068 m!223127))

(declare-fun m!223129 () Bool)

(assert (=> b!196324 m!223129))

(check-sat (not b!196321) (not b!196324) tp_is_empty!4579 (not start!20068) (not mapNonEmpty!7937))
(check-sat)
