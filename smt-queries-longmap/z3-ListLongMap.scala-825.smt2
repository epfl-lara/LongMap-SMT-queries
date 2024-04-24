; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20050 () Bool)

(assert start!20050)

(declare-fun b!196352 () Bool)

(declare-fun e!129293 () Bool)

(assert (=> b!196352 (= e!129293 false)))

(declare-fun lt!97655 () Bool)

(declare-datatypes ((array!8371 0))(
  ( (array!8372 (arr!3936 (Array (_ BitVec 32) (_ BitVec 64))) (size!4261 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8371)

(declare-datatypes ((List!2424 0))(
  ( (Nil!2421) (Cons!2420 (h!3062 (_ BitVec 64)) (t!7347 List!2424)) )
))
(declare-fun arrayNoDuplicates!0 (array!8371 (_ BitVec 32) List!2424) Bool)

(assert (=> b!196352 (= lt!97655 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2421))))

(declare-fun res!92671 () Bool)

(assert (=> start!20050 (=> (not res!92671) (not e!129293))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20050 (= res!92671 (validMask!0 mask!1149))))

(assert (=> start!20050 e!129293))

(assert (=> start!20050 true))

(declare-datatypes ((V!5729 0))(
  ( (V!5730 (val!2325 Int)) )
))
(declare-datatypes ((ValueCell!1937 0))(
  ( (ValueCellFull!1937 (v!4296 V!5729)) (EmptyCell!1937) )
))
(declare-datatypes ((array!8373 0))(
  ( (array!8374 (arr!3937 (Array (_ BitVec 32) ValueCell!1937)) (size!4262 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8373)

(declare-fun e!129289 () Bool)

(declare-fun array_inv!2551 (array!8373) Bool)

(assert (=> start!20050 (and (array_inv!2551 _values!649) e!129289)))

(declare-fun array_inv!2552 (array!8371) Bool)

(assert (=> start!20050 (array_inv!2552 _keys!825)))

(declare-fun b!196353 () Bool)

(declare-fun res!92670 () Bool)

(assert (=> b!196353 (=> (not res!92670) (not e!129293))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196353 (= res!92670 (and (= (size!4262 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4261 _keys!825) (size!4262 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196354 () Bool)

(declare-fun e!129290 () Bool)

(declare-fun tp_is_empty!4561 () Bool)

(assert (=> b!196354 (= e!129290 tp_is_empty!4561)))

(declare-fun b!196355 () Bool)

(declare-fun mapRes!7910 () Bool)

(assert (=> b!196355 (= e!129289 (and e!129290 mapRes!7910))))

(declare-fun condMapEmpty!7910 () Bool)

(declare-fun mapDefault!7910 () ValueCell!1937)

(assert (=> b!196355 (= condMapEmpty!7910 (= (arr!3937 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1937)) mapDefault!7910)))))

(declare-fun mapIsEmpty!7910 () Bool)

(assert (=> mapIsEmpty!7910 mapRes!7910))

(declare-fun b!196356 () Bool)

(declare-fun res!92669 () Bool)

(assert (=> b!196356 (=> (not res!92669) (not e!129293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8371 (_ BitVec 32)) Bool)

(assert (=> b!196356 (= res!92669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196357 () Bool)

(declare-fun e!129291 () Bool)

(assert (=> b!196357 (= e!129291 tp_is_empty!4561)))

(declare-fun mapNonEmpty!7910 () Bool)

(declare-fun tp!17198 () Bool)

(assert (=> mapNonEmpty!7910 (= mapRes!7910 (and tp!17198 e!129291))))

(declare-fun mapValue!7910 () ValueCell!1937)

(declare-fun mapKey!7910 () (_ BitVec 32))

(declare-fun mapRest!7910 () (Array (_ BitVec 32) ValueCell!1937))

(assert (=> mapNonEmpty!7910 (= (arr!3937 _values!649) (store mapRest!7910 mapKey!7910 mapValue!7910))))

(assert (= (and start!20050 res!92671) b!196353))

(assert (= (and b!196353 res!92670) b!196356))

(assert (= (and b!196356 res!92669) b!196352))

(assert (= (and b!196355 condMapEmpty!7910) mapIsEmpty!7910))

(assert (= (and b!196355 (not condMapEmpty!7910)) mapNonEmpty!7910))

(get-info :version)

(assert (= (and mapNonEmpty!7910 ((_ is ValueCellFull!1937) mapValue!7910)) b!196357))

(assert (= (and b!196355 ((_ is ValueCellFull!1937) mapDefault!7910)) b!196354))

(assert (= start!20050 b!196355))

(declare-fun m!223809 () Bool)

(assert (=> b!196352 m!223809))

(declare-fun m!223811 () Bool)

(assert (=> start!20050 m!223811))

(declare-fun m!223813 () Bool)

(assert (=> start!20050 m!223813))

(declare-fun m!223815 () Bool)

(assert (=> start!20050 m!223815))

(declare-fun m!223817 () Bool)

(assert (=> b!196356 m!223817))

(declare-fun m!223819 () Bool)

(assert (=> mapNonEmpty!7910 m!223819))

(check-sat tp_is_empty!4561 (not mapNonEmpty!7910) (not start!20050) (not b!196356) (not b!196352))
(check-sat)
