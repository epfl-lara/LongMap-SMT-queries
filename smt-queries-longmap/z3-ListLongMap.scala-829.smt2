; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20074 () Bool)

(assert start!20074)

(declare-fun res!92662 () Bool)

(declare-fun e!129348 () Bool)

(assert (=> start!20074 (=> (not res!92662) (not e!129348))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20074 (= res!92662 (validMask!0 mask!1149))))

(assert (=> start!20074 e!129348))

(assert (=> start!20074 true))

(declare-datatypes ((V!5761 0))(
  ( (V!5762 (val!2337 Int)) )
))
(declare-datatypes ((ValueCell!1949 0))(
  ( (ValueCellFull!1949 (v!4301 V!5761)) (EmptyCell!1949) )
))
(declare-datatypes ((array!8403 0))(
  ( (array!8404 (arr!3951 (Array (_ BitVec 32) ValueCell!1949)) (size!4277 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8403)

(declare-fun e!129345 () Bool)

(declare-fun array_inv!2561 (array!8403) Bool)

(assert (=> start!20074 (and (array_inv!2561 _values!649) e!129345)))

(declare-datatypes ((array!8405 0))(
  ( (array!8406 (arr!3952 (Array (_ BitVec 32) (_ BitVec 64))) (size!4278 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8405)

(declare-fun array_inv!2562 (array!8405) Bool)

(assert (=> start!20074 (array_inv!2562 _keys!825)))

(declare-fun mapNonEmpty!7946 () Bool)

(declare-fun mapRes!7946 () Bool)

(declare-fun tp!17234 () Bool)

(declare-fun e!129344 () Bool)

(assert (=> mapNonEmpty!7946 (= mapRes!7946 (and tp!17234 e!129344))))

(declare-fun mapKey!7946 () (_ BitVec 32))

(declare-fun mapValue!7946 () ValueCell!1949)

(declare-fun mapRest!7946 () (Array (_ BitVec 32) ValueCell!1949))

(assert (=> mapNonEmpty!7946 (= (arr!3951 _values!649) (store mapRest!7946 mapKey!7946 mapValue!7946))))

(declare-fun b!196374 () Bool)

(declare-fun res!92663 () Bool)

(assert (=> b!196374 (=> (not res!92663) (not e!129348))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196374 (= res!92663 (and (= (size!4277 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4278 _keys!825) (size!4277 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196375 () Bool)

(declare-fun tp_is_empty!4585 () Bool)

(assert (=> b!196375 (= e!129344 tp_is_empty!4585)))

(declare-fun b!196376 () Bool)

(assert (=> b!196376 (= e!129348 false)))

(declare-fun lt!97451 () Bool)

(declare-datatypes ((List!2453 0))(
  ( (Nil!2450) (Cons!2449 (h!3091 (_ BitVec 64)) (t!7375 List!2453)) )
))
(declare-fun arrayNoDuplicates!0 (array!8405 (_ BitVec 32) List!2453) Bool)

(assert (=> b!196376 (= lt!97451 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2450))))

(declare-fun b!196377 () Bool)

(declare-fun e!129346 () Bool)

(assert (=> b!196377 (= e!129345 (and e!129346 mapRes!7946))))

(declare-fun condMapEmpty!7946 () Bool)

(declare-fun mapDefault!7946 () ValueCell!1949)

(assert (=> b!196377 (= condMapEmpty!7946 (= (arr!3951 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1949)) mapDefault!7946)))))

(declare-fun b!196378 () Bool)

(declare-fun res!92661 () Bool)

(assert (=> b!196378 (=> (not res!92661) (not e!129348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8405 (_ BitVec 32)) Bool)

(assert (=> b!196378 (= res!92661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196379 () Bool)

(assert (=> b!196379 (= e!129346 tp_is_empty!4585)))

(declare-fun mapIsEmpty!7946 () Bool)

(assert (=> mapIsEmpty!7946 mapRes!7946))

(assert (= (and start!20074 res!92662) b!196374))

(assert (= (and b!196374 res!92663) b!196378))

(assert (= (and b!196378 res!92661) b!196376))

(assert (= (and b!196377 condMapEmpty!7946) mapIsEmpty!7946))

(assert (= (and b!196377 (not condMapEmpty!7946)) mapNonEmpty!7946))

(get-info :version)

(assert (= (and mapNonEmpty!7946 ((_ is ValueCellFull!1949) mapValue!7946)) b!196375))

(assert (= (and b!196377 ((_ is ValueCellFull!1949) mapDefault!7946)) b!196379))

(assert (= start!20074 b!196377))

(declare-fun m!223155 () Bool)

(assert (=> start!20074 m!223155))

(declare-fun m!223157 () Bool)

(assert (=> start!20074 m!223157))

(declare-fun m!223159 () Bool)

(assert (=> start!20074 m!223159))

(declare-fun m!223161 () Bool)

(assert (=> mapNonEmpty!7946 m!223161))

(declare-fun m!223163 () Bool)

(assert (=> b!196376 m!223163))

(declare-fun m!223165 () Bool)

(assert (=> b!196378 m!223165))

(check-sat (not mapNonEmpty!7946) tp_is_empty!4585 (not b!196376) (not b!196378) (not start!20074))
(check-sat)
