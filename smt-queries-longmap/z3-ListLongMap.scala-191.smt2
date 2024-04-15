; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3756 () Bool)

(assert start!3756)

(declare-fun b!26234 () Bool)

(declare-fun res!15588 () Bool)

(declare-fun e!17056 () Bool)

(assert (=> b!26234 (=> (not res!15588) (not e!17056))))

(declare-datatypes ((array!1397 0))(
  ( (array!1398 (arr!656 (Array (_ BitVec 32) (_ BitVec 64))) (size!757 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1397)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1397 (_ BitVec 32)) Bool)

(assert (=> b!26234 (= res!15588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26235 () Bool)

(declare-fun e!17055 () Bool)

(declare-fun e!17053 () Bool)

(declare-fun mapRes!1147 () Bool)

(assert (=> b!26235 (= e!17055 (and e!17053 mapRes!1147))))

(declare-fun condMapEmpty!1147 () Bool)

(declare-datatypes ((V!1275 0))(
  ( (V!1276 (val!570 Int)) )
))
(declare-datatypes ((ValueCell!344 0))(
  ( (ValueCellFull!344 (v!1655 V!1275)) (EmptyCell!344) )
))
(declare-datatypes ((array!1399 0))(
  ( (array!1400 (arr!657 (Array (_ BitVec 32) ValueCell!344)) (size!758 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1399)

(declare-fun mapDefault!1147 () ValueCell!344)

(assert (=> b!26235 (= condMapEmpty!1147 (= (arr!657 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!344)) mapDefault!1147)))))

(declare-fun b!26236 () Bool)

(declare-fun e!17052 () Bool)

(declare-fun tp_is_empty!1087 () Bool)

(assert (=> b!26236 (= e!17052 tp_is_empty!1087)))

(declare-fun b!26237 () Bool)

(assert (=> b!26237 (= e!17053 tp_is_empty!1087)))

(declare-fun res!15587 () Bool)

(assert (=> start!3756 (=> (not res!15587) (not e!17056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3756 (= res!15587 (validMask!0 mask!2294))))

(assert (=> start!3756 e!17056))

(assert (=> start!3756 true))

(declare-fun array_inv!461 (array!1399) Bool)

(assert (=> start!3756 (and (array_inv!461 _values!1501) e!17055)))

(declare-fun array_inv!462 (array!1397) Bool)

(assert (=> start!3756 (array_inv!462 _keys!1833)))

(declare-fun b!26238 () Bool)

(declare-fun res!15589 () Bool)

(assert (=> b!26238 (=> (not res!15589) (not e!17056))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26238 (= res!15589 (and (= (size!758 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!757 _keys!1833) (size!758 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1147 () Bool)

(declare-fun tp!3667 () Bool)

(assert (=> mapNonEmpty!1147 (= mapRes!1147 (and tp!3667 e!17052))))

(declare-fun mapValue!1147 () ValueCell!344)

(declare-fun mapKey!1147 () (_ BitVec 32))

(declare-fun mapRest!1147 () (Array (_ BitVec 32) ValueCell!344))

(assert (=> mapNonEmpty!1147 (= (arr!657 _values!1501) (store mapRest!1147 mapKey!1147 mapValue!1147))))

(declare-fun mapIsEmpty!1147 () Bool)

(assert (=> mapIsEmpty!1147 mapRes!1147))

(declare-fun b!26239 () Bool)

(assert (=> b!26239 (= e!17056 false)))

(declare-fun lt!10336 () Bool)

(declare-datatypes ((List!580 0))(
  ( (Nil!577) (Cons!576 (h!1143 (_ BitVec 64)) (t!3260 List!580)) )
))
(declare-fun arrayNoDuplicates!0 (array!1397 (_ BitVec 32) List!580) Bool)

(assert (=> b!26239 (= lt!10336 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!577))))

(assert (= (and start!3756 res!15587) b!26238))

(assert (= (and b!26238 res!15589) b!26234))

(assert (= (and b!26234 res!15588) b!26239))

(assert (= (and b!26235 condMapEmpty!1147) mapIsEmpty!1147))

(assert (= (and b!26235 (not condMapEmpty!1147)) mapNonEmpty!1147))

(get-info :version)

(assert (= (and mapNonEmpty!1147 ((_ is ValueCellFull!344) mapValue!1147)) b!26236))

(assert (= (and b!26235 ((_ is ValueCellFull!344) mapDefault!1147)) b!26237))

(assert (= start!3756 b!26235))

(declare-fun m!21043 () Bool)

(assert (=> b!26234 m!21043))

(declare-fun m!21045 () Bool)

(assert (=> start!3756 m!21045))

(declare-fun m!21047 () Bool)

(assert (=> start!3756 m!21047))

(declare-fun m!21049 () Bool)

(assert (=> start!3756 m!21049))

(declare-fun m!21051 () Bool)

(assert (=> mapNonEmpty!1147 m!21051))

(declare-fun m!21053 () Bool)

(assert (=> b!26239 m!21053))

(check-sat tp_is_empty!1087 (not start!3756) (not b!26234) (not mapNonEmpty!1147) (not b!26239))
(check-sat)
