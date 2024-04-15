; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20032 () Bool)

(assert start!20032)

(declare-fun b!195997 () Bool)

(declare-fun res!92474 () Bool)

(declare-fun e!129032 () Bool)

(assert (=> b!195997 (=> (not res!92474) (not e!129032))))

(declare-datatypes ((array!8329 0))(
  ( (array!8330 (arr!3914 (Array (_ BitVec 32) (_ BitVec 64))) (size!4240 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8329)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8329 (_ BitVec 32)) Bool)

(assert (=> b!195997 (= res!92474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!195998 () Bool)

(declare-fun e!129031 () Bool)

(declare-fun tp_is_empty!4543 () Bool)

(assert (=> b!195998 (= e!129031 tp_is_empty!4543)))

(declare-fun b!195999 () Bool)

(assert (=> b!195999 (= e!129032 false)))

(declare-fun lt!97388 () Bool)

(declare-datatypes ((List!2439 0))(
  ( (Nil!2436) (Cons!2435 (h!3077 (_ BitVec 64)) (t!7361 List!2439)) )
))
(declare-fun arrayNoDuplicates!0 (array!8329 (_ BitVec 32) List!2439) Bool)

(assert (=> b!195999 (= lt!97388 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2436))))

(declare-fun b!196000 () Bool)

(declare-fun e!129030 () Bool)

(assert (=> b!196000 (= e!129030 tp_is_empty!4543)))

(declare-fun mapNonEmpty!7883 () Bool)

(declare-fun mapRes!7883 () Bool)

(declare-fun tp!17171 () Bool)

(assert (=> mapNonEmpty!7883 (= mapRes!7883 (and tp!17171 e!129031))))

(declare-datatypes ((V!5705 0))(
  ( (V!5706 (val!2316 Int)) )
))
(declare-datatypes ((ValueCell!1928 0))(
  ( (ValueCellFull!1928 (v!4280 V!5705)) (EmptyCell!1928) )
))
(declare-fun mapRest!7883 () (Array (_ BitVec 32) ValueCell!1928))

(declare-fun mapKey!7883 () (_ BitVec 32))

(declare-datatypes ((array!8331 0))(
  ( (array!8332 (arr!3915 (Array (_ BitVec 32) ValueCell!1928)) (size!4241 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8331)

(declare-fun mapValue!7883 () ValueCell!1928)

(assert (=> mapNonEmpty!7883 (= (arr!3915 _values!649) (store mapRest!7883 mapKey!7883 mapValue!7883))))

(declare-fun mapIsEmpty!7883 () Bool)

(assert (=> mapIsEmpty!7883 mapRes!7883))

(declare-fun b!196001 () Bool)

(declare-fun e!129033 () Bool)

(assert (=> b!196001 (= e!129033 (and e!129030 mapRes!7883))))

(declare-fun condMapEmpty!7883 () Bool)

(declare-fun mapDefault!7883 () ValueCell!1928)

(assert (=> b!196001 (= condMapEmpty!7883 (= (arr!3915 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1928)) mapDefault!7883)))))

(declare-fun res!92472 () Bool)

(assert (=> start!20032 (=> (not res!92472) (not e!129032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20032 (= res!92472 (validMask!0 mask!1149))))

(assert (=> start!20032 e!129032))

(assert (=> start!20032 true))

(declare-fun array_inv!2537 (array!8331) Bool)

(assert (=> start!20032 (and (array_inv!2537 _values!649) e!129033)))

(declare-fun array_inv!2538 (array!8329) Bool)

(assert (=> start!20032 (array_inv!2538 _keys!825)))

(declare-fun b!195996 () Bool)

(declare-fun res!92473 () Bool)

(assert (=> b!195996 (=> (not res!92473) (not e!129032))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!195996 (= res!92473 (and (= (size!4241 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4240 _keys!825) (size!4241 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20032 res!92472) b!195996))

(assert (= (and b!195996 res!92473) b!195997))

(assert (= (and b!195997 res!92474) b!195999))

(assert (= (and b!196001 condMapEmpty!7883) mapIsEmpty!7883))

(assert (= (and b!196001 (not condMapEmpty!7883)) mapNonEmpty!7883))

(get-info :version)

(assert (= (and mapNonEmpty!7883 ((_ is ValueCellFull!1928) mapValue!7883)) b!195998))

(assert (= (and b!196001 ((_ is ValueCellFull!1928) mapDefault!7883)) b!196000))

(assert (= start!20032 b!196001))

(declare-fun m!222903 () Bool)

(assert (=> b!195997 m!222903))

(declare-fun m!222905 () Bool)

(assert (=> b!195999 m!222905))

(declare-fun m!222907 () Bool)

(assert (=> mapNonEmpty!7883 m!222907))

(declare-fun m!222909 () Bool)

(assert (=> start!20032 m!222909))

(declare-fun m!222911 () Bool)

(assert (=> start!20032 m!222911))

(declare-fun m!222913 () Bool)

(assert (=> start!20032 m!222913))

(check-sat (not mapNonEmpty!7883) (not b!195999) (not start!20032) (not b!195997) tp_is_empty!4543)
(check-sat)
