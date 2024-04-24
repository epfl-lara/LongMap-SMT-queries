; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20062 () Bool)

(assert start!20062)

(declare-fun b!196460 () Bool)

(declare-fun e!129383 () Bool)

(declare-fun tp_is_empty!4573 () Bool)

(assert (=> b!196460 (= e!129383 tp_is_empty!4573)))

(declare-fun mapNonEmpty!7928 () Bool)

(declare-fun mapRes!7928 () Bool)

(declare-fun tp!17216 () Bool)

(assert (=> mapNonEmpty!7928 (= mapRes!7928 (and tp!17216 e!129383))))

(declare-datatypes ((V!5745 0))(
  ( (V!5746 (val!2331 Int)) )
))
(declare-datatypes ((ValueCell!1943 0))(
  ( (ValueCellFull!1943 (v!4302 V!5745)) (EmptyCell!1943) )
))
(declare-datatypes ((array!8395 0))(
  ( (array!8396 (arr!3948 (Array (_ BitVec 32) ValueCell!1943)) (size!4273 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8395)

(declare-fun mapRest!7928 () (Array (_ BitVec 32) ValueCell!1943))

(declare-fun mapValue!7928 () ValueCell!1943)

(declare-fun mapKey!7928 () (_ BitVec 32))

(assert (=> mapNonEmpty!7928 (= (arr!3948 _values!649) (store mapRest!7928 mapKey!7928 mapValue!7928))))

(declare-fun b!196461 () Bool)

(declare-fun e!129381 () Bool)

(assert (=> b!196461 (= e!129381 tp_is_empty!4573)))

(declare-fun b!196463 () Bool)

(declare-fun res!92723 () Bool)

(declare-fun e!129379 () Bool)

(assert (=> b!196463 (=> (not res!92723) (not e!129379))))

(declare-datatypes ((array!8397 0))(
  ( (array!8398 (arr!3949 (Array (_ BitVec 32) (_ BitVec 64))) (size!4274 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8397)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8397 (_ BitVec 32)) Bool)

(assert (=> b!196463 (= res!92723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!7928 () Bool)

(assert (=> mapIsEmpty!7928 mapRes!7928))

(declare-fun b!196464 () Bool)

(assert (=> b!196464 (= e!129379 false)))

(declare-fun lt!97673 () Bool)

(declare-datatypes ((List!2427 0))(
  ( (Nil!2424) (Cons!2423 (h!3065 (_ BitVec 64)) (t!7350 List!2427)) )
))
(declare-fun arrayNoDuplicates!0 (array!8397 (_ BitVec 32) List!2427) Bool)

(assert (=> b!196464 (= lt!97673 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2424))))

(declare-fun b!196465 () Bool)

(declare-fun res!92725 () Bool)

(assert (=> b!196465 (=> (not res!92725) (not e!129379))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196465 (= res!92725 (and (= (size!4273 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4274 _keys!825) (size!4273 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92724 () Bool)

(assert (=> start!20062 (=> (not res!92724) (not e!129379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20062 (= res!92724 (validMask!0 mask!1149))))

(assert (=> start!20062 e!129379))

(assert (=> start!20062 true))

(declare-fun e!129382 () Bool)

(declare-fun array_inv!2563 (array!8395) Bool)

(assert (=> start!20062 (and (array_inv!2563 _values!649) e!129382)))

(declare-fun array_inv!2564 (array!8397) Bool)

(assert (=> start!20062 (array_inv!2564 _keys!825)))

(declare-fun b!196462 () Bool)

(assert (=> b!196462 (= e!129382 (and e!129381 mapRes!7928))))

(declare-fun condMapEmpty!7928 () Bool)

(declare-fun mapDefault!7928 () ValueCell!1943)

(assert (=> b!196462 (= condMapEmpty!7928 (= (arr!3948 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1943)) mapDefault!7928)))))

(assert (= (and start!20062 res!92724) b!196465))

(assert (= (and b!196465 res!92725) b!196463))

(assert (= (and b!196463 res!92723) b!196464))

(assert (= (and b!196462 condMapEmpty!7928) mapIsEmpty!7928))

(assert (= (and b!196462 (not condMapEmpty!7928)) mapNonEmpty!7928))

(get-info :version)

(assert (= (and mapNonEmpty!7928 ((_ is ValueCellFull!1943) mapValue!7928)) b!196460))

(assert (= (and b!196462 ((_ is ValueCellFull!1943) mapDefault!7928)) b!196461))

(assert (= start!20062 b!196462))

(declare-fun m!223881 () Bool)

(assert (=> mapNonEmpty!7928 m!223881))

(declare-fun m!223883 () Bool)

(assert (=> b!196463 m!223883))

(declare-fun m!223885 () Bool)

(assert (=> b!196464 m!223885))

(declare-fun m!223887 () Bool)

(assert (=> start!20062 m!223887))

(declare-fun m!223889 () Bool)

(assert (=> start!20062 m!223889))

(declare-fun m!223891 () Bool)

(assert (=> start!20062 m!223891))

(check-sat (not b!196464) (not b!196463) (not start!20062) (not mapNonEmpty!7928) tp_is_empty!4573)
(check-sat)
