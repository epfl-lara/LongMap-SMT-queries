; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20032 () Bool)

(assert start!20032)

(declare-fun b!196190 () Bool)

(declare-fun res!92590 () Bool)

(declare-fun e!129154 () Bool)

(assert (=> b!196190 (=> (not res!92590) (not e!129154))))

(declare-datatypes ((array!8337 0))(
  ( (array!8338 (arr!3919 (Array (_ BitVec 32) (_ BitVec 64))) (size!4244 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8337)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8337 (_ BitVec 32)) Bool)

(assert (=> b!196190 (= res!92590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!7883 () Bool)

(declare-fun mapRes!7883 () Bool)

(assert (=> mapIsEmpty!7883 mapRes!7883))

(declare-fun b!196191 () Bool)

(declare-fun e!129158 () Bool)

(declare-fun tp_is_empty!4543 () Bool)

(assert (=> b!196191 (= e!129158 tp_is_empty!4543)))

(declare-fun b!196192 () Bool)

(declare-fun res!92589 () Bool)

(assert (=> b!196192 (=> (not res!92589) (not e!129154))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5705 0))(
  ( (V!5706 (val!2316 Int)) )
))
(declare-datatypes ((ValueCell!1928 0))(
  ( (ValueCellFull!1928 (v!4287 V!5705)) (EmptyCell!1928) )
))
(declare-datatypes ((array!8339 0))(
  ( (array!8340 (arr!3920 (Array (_ BitVec 32) ValueCell!1928)) (size!4245 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8339)

(assert (=> b!196192 (= res!92589 (and (= (size!4245 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4244 _keys!825) (size!4245 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196193 () Bool)

(assert (=> b!196193 (= e!129154 false)))

(declare-fun lt!97628 () Bool)

(declare-datatypes ((List!2419 0))(
  ( (Nil!2416) (Cons!2415 (h!3057 (_ BitVec 64)) (t!7342 List!2419)) )
))
(declare-fun arrayNoDuplicates!0 (array!8337 (_ BitVec 32) List!2419) Bool)

(assert (=> b!196193 (= lt!97628 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2416))))

(declare-fun res!92588 () Bool)

(assert (=> start!20032 (=> (not res!92588) (not e!129154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20032 (= res!92588 (validMask!0 mask!1149))))

(assert (=> start!20032 e!129154))

(assert (=> start!20032 true))

(declare-fun e!129156 () Bool)

(declare-fun array_inv!2541 (array!8339) Bool)

(assert (=> start!20032 (and (array_inv!2541 _values!649) e!129156)))

(declare-fun array_inv!2542 (array!8337) Bool)

(assert (=> start!20032 (array_inv!2542 _keys!825)))

(declare-fun b!196194 () Bool)

(declare-fun e!129155 () Bool)

(assert (=> b!196194 (= e!129156 (and e!129155 mapRes!7883))))

(declare-fun condMapEmpty!7883 () Bool)

(declare-fun mapDefault!7883 () ValueCell!1928)

(assert (=> b!196194 (= condMapEmpty!7883 (= (arr!3920 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1928)) mapDefault!7883)))))

(declare-fun mapNonEmpty!7883 () Bool)

(declare-fun tp!17171 () Bool)

(assert (=> mapNonEmpty!7883 (= mapRes!7883 (and tp!17171 e!129158))))

(declare-fun mapKey!7883 () (_ BitVec 32))

(declare-fun mapValue!7883 () ValueCell!1928)

(declare-fun mapRest!7883 () (Array (_ BitVec 32) ValueCell!1928))

(assert (=> mapNonEmpty!7883 (= (arr!3920 _values!649) (store mapRest!7883 mapKey!7883 mapValue!7883))))

(declare-fun b!196195 () Bool)

(assert (=> b!196195 (= e!129155 tp_is_empty!4543)))

(assert (= (and start!20032 res!92588) b!196192))

(assert (= (and b!196192 res!92589) b!196190))

(assert (= (and b!196190 res!92590) b!196193))

(assert (= (and b!196194 condMapEmpty!7883) mapIsEmpty!7883))

(assert (= (and b!196194 (not condMapEmpty!7883)) mapNonEmpty!7883))

(get-info :version)

(assert (= (and mapNonEmpty!7883 ((_ is ValueCellFull!1928) mapValue!7883)) b!196191))

(assert (= (and b!196194 ((_ is ValueCellFull!1928) mapDefault!7883)) b!196195))

(assert (= start!20032 b!196194))

(declare-fun m!223701 () Bool)

(assert (=> b!196190 m!223701))

(declare-fun m!223703 () Bool)

(assert (=> b!196193 m!223703))

(declare-fun m!223705 () Bool)

(assert (=> start!20032 m!223705))

(declare-fun m!223707 () Bool)

(assert (=> start!20032 m!223707))

(declare-fun m!223709 () Bool)

(assert (=> start!20032 m!223709))

(declare-fun m!223711 () Bool)

(assert (=> mapNonEmpty!7883 m!223711))

(check-sat (not start!20032) tp_is_empty!4543 (not b!196193) (not mapNonEmpty!7883) (not b!196190))
(check-sat)
