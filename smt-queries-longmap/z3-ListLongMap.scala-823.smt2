; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20036 () Bool)

(assert start!20036)

(declare-fun b!196215 () Bool)

(declare-fun res!92604 () Bool)

(declare-fun e!129191 () Bool)

(assert (=> b!196215 (=> (not res!92604) (not e!129191))))

(declare-datatypes ((array!8365 0))(
  ( (array!8366 (arr!3933 (Array (_ BitVec 32) (_ BitVec 64))) (size!4258 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8365)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5715 0))(
  ( (V!5716 (val!2320 Int)) )
))
(declare-datatypes ((ValueCell!1932 0))(
  ( (ValueCellFull!1932 (v!4290 V!5715)) (EmptyCell!1932) )
))
(declare-datatypes ((array!8367 0))(
  ( (array!8368 (arr!3934 (Array (_ BitVec 32) ValueCell!1932)) (size!4259 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8367)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196215 (= res!92604 (and (= (size!4259 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4258 _keys!825) (size!4259 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92605 () Bool)

(assert (=> start!20036 (=> (not res!92605) (not e!129191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20036 (= res!92605 (validMask!0 mask!1149))))

(assert (=> start!20036 e!129191))

(assert (=> start!20036 true))

(declare-fun e!129192 () Bool)

(declare-fun array_inv!2555 (array!8367) Bool)

(assert (=> start!20036 (and (array_inv!2555 _values!649) e!129192)))

(declare-fun array_inv!2556 (array!8365) Bool)

(assert (=> start!20036 (array_inv!2556 _keys!825)))

(declare-fun b!196216 () Bool)

(declare-fun e!129190 () Bool)

(declare-fun tp_is_empty!4551 () Bool)

(assert (=> b!196216 (= e!129190 tp_is_empty!4551)))

(declare-fun b!196217 () Bool)

(declare-fun res!92603 () Bool)

(assert (=> b!196217 (=> (not res!92603) (not e!129191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8365 (_ BitVec 32)) Bool)

(assert (=> b!196217 (= res!92603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!7895 () Bool)

(declare-fun mapRes!7895 () Bool)

(declare-fun tp!17183 () Bool)

(assert (=> mapNonEmpty!7895 (= mapRes!7895 (and tp!17183 e!129190))))

(declare-fun mapKey!7895 () (_ BitVec 32))

(declare-fun mapValue!7895 () ValueCell!1932)

(declare-fun mapRest!7895 () (Array (_ BitVec 32) ValueCell!1932))

(assert (=> mapNonEmpty!7895 (= (arr!3934 _values!649) (store mapRest!7895 mapKey!7895 mapValue!7895))))

(declare-fun b!196218 () Bool)

(declare-fun e!129194 () Bool)

(assert (=> b!196218 (= e!129194 tp_is_empty!4551)))

(declare-fun b!196219 () Bool)

(assert (=> b!196219 (= e!129191 false)))

(declare-fun lt!97581 () Bool)

(declare-datatypes ((List!2464 0))(
  ( (Nil!2461) (Cons!2460 (h!3102 (_ BitVec 64)) (t!7395 List!2464)) )
))
(declare-fun arrayNoDuplicates!0 (array!8365 (_ BitVec 32) List!2464) Bool)

(assert (=> b!196219 (= lt!97581 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2461))))

(declare-fun mapIsEmpty!7895 () Bool)

(assert (=> mapIsEmpty!7895 mapRes!7895))

(declare-fun b!196220 () Bool)

(assert (=> b!196220 (= e!129192 (and e!129194 mapRes!7895))))

(declare-fun condMapEmpty!7895 () Bool)

(declare-fun mapDefault!7895 () ValueCell!1932)

(assert (=> b!196220 (= condMapEmpty!7895 (= (arr!3934 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1932)) mapDefault!7895)))))

(assert (= (and start!20036 res!92605) b!196215))

(assert (= (and b!196215 res!92604) b!196217))

(assert (= (and b!196217 res!92603) b!196219))

(assert (= (and b!196220 condMapEmpty!7895) mapIsEmpty!7895))

(assert (= (and b!196220 (not condMapEmpty!7895)) mapNonEmpty!7895))

(get-info :version)

(assert (= (and mapNonEmpty!7895 ((_ is ValueCellFull!1932) mapValue!7895)) b!196216))

(assert (= (and b!196220 ((_ is ValueCellFull!1932) mapDefault!7895)) b!196218))

(assert (= start!20036 b!196220))

(declare-fun m!223567 () Bool)

(assert (=> start!20036 m!223567))

(declare-fun m!223569 () Bool)

(assert (=> start!20036 m!223569))

(declare-fun m!223571 () Bool)

(assert (=> start!20036 m!223571))

(declare-fun m!223573 () Bool)

(assert (=> b!196217 m!223573))

(declare-fun m!223575 () Bool)

(assert (=> mapNonEmpty!7895 m!223575))

(declare-fun m!223577 () Bool)

(assert (=> b!196219 m!223577))

(check-sat (not start!20036) (not mapNonEmpty!7895) (not b!196219) tp_is_empty!4551 (not b!196217))
(check-sat)
