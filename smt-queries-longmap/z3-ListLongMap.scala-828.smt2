; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20068 () Bool)

(assert start!20068)

(declare-fun b!196514 () Bool)

(declare-fun e!129427 () Bool)

(declare-fun e!129428 () Bool)

(declare-fun mapRes!7937 () Bool)

(assert (=> b!196514 (= e!129427 (and e!129428 mapRes!7937))))

(declare-fun condMapEmpty!7937 () Bool)

(declare-datatypes ((V!5753 0))(
  ( (V!5754 (val!2334 Int)) )
))
(declare-datatypes ((ValueCell!1946 0))(
  ( (ValueCellFull!1946 (v!4305 V!5753)) (EmptyCell!1946) )
))
(declare-datatypes ((array!8407 0))(
  ( (array!8408 (arr!3954 (Array (_ BitVec 32) ValueCell!1946)) (size!4279 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8407)

(declare-fun mapDefault!7937 () ValueCell!1946)

(assert (=> b!196514 (= condMapEmpty!7937 (= (arr!3954 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1946)) mapDefault!7937)))))

(declare-fun b!196515 () Bool)

(declare-fun res!92752 () Bool)

(declare-fun e!129424 () Bool)

(assert (=> b!196515 (=> (not res!92752) (not e!129424))))

(declare-datatypes ((array!8409 0))(
  ( (array!8410 (arr!3955 (Array (_ BitVec 32) (_ BitVec 64))) (size!4280 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8409)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8409 (_ BitVec 32)) Bool)

(assert (=> b!196515 (= res!92752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196516 () Bool)

(declare-fun res!92751 () Bool)

(assert (=> b!196516 (=> (not res!92751) (not e!129424))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196516 (= res!92751 (and (= (size!4279 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4280 _keys!825) (size!4279 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92750 () Bool)

(assert (=> start!20068 (=> (not res!92750) (not e!129424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20068 (= res!92750 (validMask!0 mask!1149))))

(assert (=> start!20068 e!129424))

(assert (=> start!20068 true))

(declare-fun array_inv!2567 (array!8407) Bool)

(assert (=> start!20068 (and (array_inv!2567 _values!649) e!129427)))

(declare-fun array_inv!2568 (array!8409) Bool)

(assert (=> start!20068 (array_inv!2568 _keys!825)))

(declare-fun mapNonEmpty!7937 () Bool)

(declare-fun tp!17225 () Bool)

(declare-fun e!129426 () Bool)

(assert (=> mapNonEmpty!7937 (= mapRes!7937 (and tp!17225 e!129426))))

(declare-fun mapRest!7937 () (Array (_ BitVec 32) ValueCell!1946))

(declare-fun mapKey!7937 () (_ BitVec 32))

(declare-fun mapValue!7937 () ValueCell!1946)

(assert (=> mapNonEmpty!7937 (= (arr!3954 _values!649) (store mapRest!7937 mapKey!7937 mapValue!7937))))

(declare-fun b!196517 () Bool)

(assert (=> b!196517 (= e!129424 false)))

(declare-fun lt!97682 () Bool)

(declare-datatypes ((List!2429 0))(
  ( (Nil!2426) (Cons!2425 (h!3067 (_ BitVec 64)) (t!7352 List!2429)) )
))
(declare-fun arrayNoDuplicates!0 (array!8409 (_ BitVec 32) List!2429) Bool)

(assert (=> b!196517 (= lt!97682 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2426))))

(declare-fun b!196518 () Bool)

(declare-fun tp_is_empty!4579 () Bool)

(assert (=> b!196518 (= e!129426 tp_is_empty!4579)))

(declare-fun mapIsEmpty!7937 () Bool)

(assert (=> mapIsEmpty!7937 mapRes!7937))

(declare-fun b!196519 () Bool)

(assert (=> b!196519 (= e!129428 tp_is_empty!4579)))

(assert (= (and start!20068 res!92750) b!196516))

(assert (= (and b!196516 res!92751) b!196515))

(assert (= (and b!196515 res!92752) b!196517))

(assert (= (and b!196514 condMapEmpty!7937) mapIsEmpty!7937))

(assert (= (and b!196514 (not condMapEmpty!7937)) mapNonEmpty!7937))

(get-info :version)

(assert (= (and mapNonEmpty!7937 ((_ is ValueCellFull!1946) mapValue!7937)) b!196518))

(assert (= (and b!196514 ((_ is ValueCellFull!1946) mapDefault!7937)) b!196519))

(assert (= start!20068 b!196514))

(declare-fun m!223917 () Bool)

(assert (=> b!196515 m!223917))

(declare-fun m!223919 () Bool)

(assert (=> start!20068 m!223919))

(declare-fun m!223921 () Bool)

(assert (=> start!20068 m!223921))

(declare-fun m!223923 () Bool)

(assert (=> start!20068 m!223923))

(declare-fun m!223925 () Bool)

(assert (=> mapNonEmpty!7937 m!223925))

(declare-fun m!223927 () Bool)

(assert (=> b!196517 m!223927))

(check-sat (not b!196517) (not b!196515) tp_is_empty!4579 (not mapNonEmpty!7937) (not start!20068))
(check-sat)
