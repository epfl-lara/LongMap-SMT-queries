; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20062 () Bool)

(assert start!20062)

(declare-fun b!196266 () Bool)

(declare-fun e!129258 () Bool)

(declare-fun e!129257 () Bool)

(declare-fun mapRes!7928 () Bool)

(assert (=> b!196266 (= e!129258 (and e!129257 mapRes!7928))))

(declare-fun condMapEmpty!7928 () Bool)

(declare-datatypes ((V!5745 0))(
  ( (V!5746 (val!2331 Int)) )
))
(declare-datatypes ((ValueCell!1943 0))(
  ( (ValueCellFull!1943 (v!4295 V!5745)) (EmptyCell!1943) )
))
(declare-datatypes ((array!8379 0))(
  ( (array!8380 (arr!3939 (Array (_ BitVec 32) ValueCell!1943)) (size!4265 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8379)

(declare-fun mapDefault!7928 () ValueCell!1943)

(assert (=> b!196266 (= condMapEmpty!7928 (= (arr!3939 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1943)) mapDefault!7928)))))

(declare-fun b!196267 () Bool)

(declare-fun e!129254 () Bool)

(assert (=> b!196267 (= e!129254 false)))

(declare-fun lt!97433 () Bool)

(declare-datatypes ((array!8381 0))(
  ( (array!8382 (arr!3940 (Array (_ BitVec 32) (_ BitVec 64))) (size!4266 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8381)

(declare-datatypes ((List!2449 0))(
  ( (Nil!2446) (Cons!2445 (h!3087 (_ BitVec 64)) (t!7371 List!2449)) )
))
(declare-fun arrayNoDuplicates!0 (array!8381 (_ BitVec 32) List!2449) Bool)

(assert (=> b!196267 (= lt!97433 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2446))))

(declare-fun mapNonEmpty!7928 () Bool)

(declare-fun tp!17216 () Bool)

(declare-fun e!129256 () Bool)

(assert (=> mapNonEmpty!7928 (= mapRes!7928 (and tp!17216 e!129256))))

(declare-fun mapValue!7928 () ValueCell!1943)

(declare-fun mapKey!7928 () (_ BitVec 32))

(declare-fun mapRest!7928 () (Array (_ BitVec 32) ValueCell!1943))

(assert (=> mapNonEmpty!7928 (= (arr!3939 _values!649) (store mapRest!7928 mapKey!7928 mapValue!7928))))

(declare-fun res!92609 () Bool)

(assert (=> start!20062 (=> (not res!92609) (not e!129254))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20062 (= res!92609 (validMask!0 mask!1149))))

(assert (=> start!20062 e!129254))

(assert (=> start!20062 true))

(declare-fun array_inv!2555 (array!8379) Bool)

(assert (=> start!20062 (and (array_inv!2555 _values!649) e!129258)))

(declare-fun array_inv!2556 (array!8381) Bool)

(assert (=> start!20062 (array_inv!2556 _keys!825)))

(declare-fun b!196268 () Bool)

(declare-fun tp_is_empty!4573 () Bool)

(assert (=> b!196268 (= e!129256 tp_is_empty!4573)))

(declare-fun mapIsEmpty!7928 () Bool)

(assert (=> mapIsEmpty!7928 mapRes!7928))

(declare-fun b!196269 () Bool)

(declare-fun res!92608 () Bool)

(assert (=> b!196269 (=> (not res!92608) (not e!129254))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196269 (= res!92608 (and (= (size!4265 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4266 _keys!825) (size!4265 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196270 () Bool)

(assert (=> b!196270 (= e!129257 tp_is_empty!4573)))

(declare-fun b!196271 () Bool)

(declare-fun res!92607 () Bool)

(assert (=> b!196271 (=> (not res!92607) (not e!129254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8381 (_ BitVec 32)) Bool)

(assert (=> b!196271 (= res!92607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20062 res!92609) b!196269))

(assert (= (and b!196269 res!92608) b!196271))

(assert (= (and b!196271 res!92607) b!196267))

(assert (= (and b!196266 condMapEmpty!7928) mapIsEmpty!7928))

(assert (= (and b!196266 (not condMapEmpty!7928)) mapNonEmpty!7928))

(get-info :version)

(assert (= (and mapNonEmpty!7928 ((_ is ValueCellFull!1943) mapValue!7928)) b!196268))

(assert (= (and b!196266 ((_ is ValueCellFull!1943) mapDefault!7928)) b!196270))

(assert (= start!20062 b!196266))

(declare-fun m!223083 () Bool)

(assert (=> b!196267 m!223083))

(declare-fun m!223085 () Bool)

(assert (=> mapNonEmpty!7928 m!223085))

(declare-fun m!223087 () Bool)

(assert (=> start!20062 m!223087))

(declare-fun m!223089 () Bool)

(assert (=> start!20062 m!223089))

(declare-fun m!223091 () Bool)

(assert (=> start!20062 m!223091))

(declare-fun m!223093 () Bool)

(assert (=> b!196271 m!223093))

(check-sat (not b!196267) (not start!20062) tp_is_empty!4573 (not b!196271) (not mapNonEmpty!7928))
(check-sat)
