; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20080 () Bool)

(assert start!20080)

(declare-fun b!196434 () Bool)

(declare-fun res!92699 () Bool)

(declare-fun e!129392 () Bool)

(assert (=> b!196434 (=> (not res!92699) (not e!129392))))

(declare-datatypes ((array!8415 0))(
  ( (array!8416 (arr!3957 (Array (_ BitVec 32) (_ BitVec 64))) (size!4283 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8415)

(declare-datatypes ((List!2455 0))(
  ( (Nil!2452) (Cons!2451 (h!3093 (_ BitVec 64)) (t!7377 List!2455)) )
))
(declare-fun arrayNoDuplicates!0 (array!8415 (_ BitVec 32) List!2455) Bool)

(assert (=> b!196434 (= res!92699 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2452))))

(declare-fun b!196435 () Bool)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196435 (= e!129392 (and (= (select (arr!3957 _keys!825) i!601) k0!843) (bvsgt #b00000000000000000000000000000000 (size!4283 _keys!825))))))

(declare-fun res!92696 () Bool)

(assert (=> start!20080 (=> (not res!92696) (not e!129392))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20080 (= res!92696 (validMask!0 mask!1149))))

(assert (=> start!20080 e!129392))

(declare-fun array_inv!2565 (array!8415) Bool)

(assert (=> start!20080 (array_inv!2565 _keys!825)))

(assert (=> start!20080 true))

(declare-datatypes ((V!5769 0))(
  ( (V!5770 (val!2340 Int)) )
))
(declare-datatypes ((ValueCell!1952 0))(
  ( (ValueCellFull!1952 (v!4304 V!5769)) (EmptyCell!1952) )
))
(declare-datatypes ((array!8417 0))(
  ( (array!8418 (arr!3958 (Array (_ BitVec 32) ValueCell!1952)) (size!4284 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8417)

(declare-fun e!129389 () Bool)

(declare-fun array_inv!2566 (array!8417) Bool)

(assert (=> start!20080 (and (array_inv!2566 _values!649) e!129389)))

(declare-fun b!196436 () Bool)

(declare-fun res!92698 () Bool)

(assert (=> b!196436 (=> (not res!92698) (not e!129392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196436 (= res!92698 (validKeyInArray!0 k0!843))))

(declare-fun b!196437 () Bool)

(declare-fun res!92694 () Bool)

(assert (=> b!196437 (=> (not res!92694) (not e!129392))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196437 (= res!92694 (and (= (size!4284 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4283 _keys!825) (size!4284 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196438 () Bool)

(declare-fun e!129393 () Bool)

(declare-fun tp_is_empty!4591 () Bool)

(assert (=> b!196438 (= e!129393 tp_is_empty!4591)))

(declare-fun b!196439 () Bool)

(declare-fun e!129391 () Bool)

(declare-fun mapRes!7955 () Bool)

(assert (=> b!196439 (= e!129389 (and e!129391 mapRes!7955))))

(declare-fun condMapEmpty!7955 () Bool)

(declare-fun mapDefault!7955 () ValueCell!1952)

(assert (=> b!196439 (= condMapEmpty!7955 (= (arr!3958 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1952)) mapDefault!7955)))))

(declare-fun mapIsEmpty!7955 () Bool)

(assert (=> mapIsEmpty!7955 mapRes!7955))

(declare-fun b!196440 () Bool)

(declare-fun res!92697 () Bool)

(assert (=> b!196440 (=> (not res!92697) (not e!129392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8415 (_ BitVec 32)) Bool)

(assert (=> b!196440 (= res!92697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196441 () Bool)

(declare-fun res!92695 () Bool)

(assert (=> b!196441 (=> (not res!92695) (not e!129392))))

(assert (=> b!196441 (= res!92695 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4283 _keys!825))))))

(declare-fun b!196442 () Bool)

(assert (=> b!196442 (= e!129391 tp_is_empty!4591)))

(declare-fun mapNonEmpty!7955 () Bool)

(declare-fun tp!17243 () Bool)

(assert (=> mapNonEmpty!7955 (= mapRes!7955 (and tp!17243 e!129393))))

(declare-fun mapValue!7955 () ValueCell!1952)

(declare-fun mapKey!7955 () (_ BitVec 32))

(declare-fun mapRest!7955 () (Array (_ BitVec 32) ValueCell!1952))

(assert (=> mapNonEmpty!7955 (= (arr!3958 _values!649) (store mapRest!7955 mapKey!7955 mapValue!7955))))

(assert (= (and start!20080 res!92696) b!196437))

(assert (= (and b!196437 res!92694) b!196440))

(assert (= (and b!196440 res!92697) b!196434))

(assert (= (and b!196434 res!92699) b!196441))

(assert (= (and b!196441 res!92695) b!196436))

(assert (= (and b!196436 res!92698) b!196435))

(assert (= (and b!196439 condMapEmpty!7955) mapIsEmpty!7955))

(assert (= (and b!196439 (not condMapEmpty!7955)) mapNonEmpty!7955))

(get-info :version)

(assert (= (and mapNonEmpty!7955 ((_ is ValueCellFull!1952) mapValue!7955)) b!196438))

(assert (= (and b!196439 ((_ is ValueCellFull!1952) mapDefault!7955)) b!196442))

(assert (= start!20080 b!196439))

(declare-fun m!223191 () Bool)

(assert (=> b!196434 m!223191))

(declare-fun m!223193 () Bool)

(assert (=> b!196440 m!223193))

(declare-fun m!223195 () Bool)

(assert (=> b!196435 m!223195))

(declare-fun m!223197 () Bool)

(assert (=> mapNonEmpty!7955 m!223197))

(declare-fun m!223199 () Bool)

(assert (=> start!20080 m!223199))

(declare-fun m!223201 () Bool)

(assert (=> start!20080 m!223201))

(declare-fun m!223203 () Bool)

(assert (=> start!20080 m!223203))

(declare-fun m!223205 () Bool)

(assert (=> b!196436 m!223205))

(check-sat (not mapNonEmpty!7955) tp_is_empty!4591 (not b!196436) (not b!196440) (not start!20080) (not b!196434))
(check-sat)
