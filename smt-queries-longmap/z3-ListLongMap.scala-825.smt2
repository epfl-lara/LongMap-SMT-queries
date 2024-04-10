; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20048 () Bool)

(assert start!20048)

(declare-fun mapNonEmpty!7913 () Bool)

(declare-fun mapRes!7913 () Bool)

(declare-fun tp!17201 () Bool)

(declare-fun e!129280 () Bool)

(assert (=> mapNonEmpty!7913 (= mapRes!7913 (and tp!17201 e!129280))))

(declare-datatypes ((V!5731 0))(
  ( (V!5732 (val!2326 Int)) )
))
(declare-datatypes ((ValueCell!1938 0))(
  ( (ValueCellFull!1938 (v!4296 V!5731)) (EmptyCell!1938) )
))
(declare-fun mapRest!7913 () (Array (_ BitVec 32) ValueCell!1938))

(declare-datatypes ((array!8385 0))(
  ( (array!8386 (arr!3943 (Array (_ BitVec 32) ValueCell!1938)) (size!4268 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8385)

(declare-fun mapValue!7913 () ValueCell!1938)

(declare-fun mapKey!7913 () (_ BitVec 32))

(assert (=> mapNonEmpty!7913 (= (arr!3943 _values!649) (store mapRest!7913 mapKey!7913 mapValue!7913))))

(declare-fun b!196323 () Bool)

(declare-fun e!129284 () Bool)

(assert (=> b!196323 (= e!129284 false)))

(declare-fun lt!97599 () Bool)

(declare-datatypes ((array!8387 0))(
  ( (array!8388 (arr!3944 (Array (_ BitVec 32) (_ BitVec 64))) (size!4269 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8387)

(declare-datatypes ((List!2468 0))(
  ( (Nil!2465) (Cons!2464 (h!3106 (_ BitVec 64)) (t!7399 List!2468)) )
))
(declare-fun arrayNoDuplicates!0 (array!8387 (_ BitVec 32) List!2468) Bool)

(assert (=> b!196323 (= lt!97599 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2465))))

(declare-fun b!196324 () Bool)

(declare-fun e!129281 () Bool)

(declare-fun tp_is_empty!4563 () Bool)

(assert (=> b!196324 (= e!129281 tp_is_empty!4563)))

(declare-fun b!196325 () Bool)

(assert (=> b!196325 (= e!129280 tp_is_empty!4563)))

(declare-fun b!196326 () Bool)

(declare-fun res!92657 () Bool)

(assert (=> b!196326 (=> (not res!92657) (not e!129284))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196326 (= res!92657 (and (= (size!4268 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4269 _keys!825) (size!4268 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7913 () Bool)

(assert (=> mapIsEmpty!7913 mapRes!7913))

(declare-fun res!92658 () Bool)

(assert (=> start!20048 (=> (not res!92658) (not e!129284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20048 (= res!92658 (validMask!0 mask!1149))))

(assert (=> start!20048 e!129284))

(assert (=> start!20048 true))

(declare-fun e!129282 () Bool)

(declare-fun array_inv!2563 (array!8385) Bool)

(assert (=> start!20048 (and (array_inv!2563 _values!649) e!129282)))

(declare-fun array_inv!2564 (array!8387) Bool)

(assert (=> start!20048 (array_inv!2564 _keys!825)))

(declare-fun b!196327 () Bool)

(declare-fun res!92659 () Bool)

(assert (=> b!196327 (=> (not res!92659) (not e!129284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8387 (_ BitVec 32)) Bool)

(assert (=> b!196327 (= res!92659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196328 () Bool)

(assert (=> b!196328 (= e!129282 (and e!129281 mapRes!7913))))

(declare-fun condMapEmpty!7913 () Bool)

(declare-fun mapDefault!7913 () ValueCell!1938)

(assert (=> b!196328 (= condMapEmpty!7913 (= (arr!3943 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1938)) mapDefault!7913)))))

(assert (= (and start!20048 res!92658) b!196326))

(assert (= (and b!196326 res!92657) b!196327))

(assert (= (and b!196327 res!92659) b!196323))

(assert (= (and b!196328 condMapEmpty!7913) mapIsEmpty!7913))

(assert (= (and b!196328 (not condMapEmpty!7913)) mapNonEmpty!7913))

(get-info :version)

(assert (= (and mapNonEmpty!7913 ((_ is ValueCellFull!1938) mapValue!7913)) b!196325))

(assert (= (and b!196328 ((_ is ValueCellFull!1938) mapDefault!7913)) b!196324))

(assert (= start!20048 b!196328))

(declare-fun m!223639 () Bool)

(assert (=> mapNonEmpty!7913 m!223639))

(declare-fun m!223641 () Bool)

(assert (=> b!196323 m!223641))

(declare-fun m!223643 () Bool)

(assert (=> start!20048 m!223643))

(declare-fun m!223645 () Bool)

(assert (=> start!20048 m!223645))

(declare-fun m!223647 () Bool)

(assert (=> start!20048 m!223647))

(declare-fun m!223649 () Bool)

(assert (=> b!196327 m!223649))

(check-sat (not b!196327) (not start!20048) (not mapNonEmpty!7913) tp_is_empty!4563 (not b!196323))
(check-sat)
