; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104810 () Bool)

(assert start!104810)

(declare-fun b!1248573 () Bool)

(declare-fun res!832788 () Bool)

(declare-fun e!708383 () Bool)

(assert (=> b!1248573 (=> (not res!832788) (not e!708383))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80381 0))(
  ( (array!80382 (arr!38756 (Array (_ BitVec 32) (_ BitVec 64))) (size!39293 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80381)

(declare-datatypes ((V!47135 0))(
  ( (V!47136 (val!15726 Int)) )
))
(declare-datatypes ((ValueCell!14900 0))(
  ( (ValueCellFull!14900 (v!18417 V!47135)) (EmptyCell!14900) )
))
(declare-datatypes ((array!80383 0))(
  ( (array!80384 (arr!38757 (Array (_ BitVec 32) ValueCell!14900)) (size!39294 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80383)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1248573 (= res!832788 (and (= (size!39294 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39293 _keys!1118) (size!39294 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!832790 () Bool)

(assert (=> start!104810 (=> (not res!832790) (not e!708383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104810 (= res!832790 (validMask!0 mask!1466))))

(assert (=> start!104810 e!708383))

(assert (=> start!104810 true))

(declare-fun array_inv!29683 (array!80381) Bool)

(assert (=> start!104810 (array_inv!29683 _keys!1118)))

(declare-fun e!708382 () Bool)

(declare-fun array_inv!29684 (array!80383) Bool)

(assert (=> start!104810 (and (array_inv!29684 _values!914) e!708382)))

(declare-fun b!1248574 () Bool)

(declare-fun e!708379 () Bool)

(declare-fun mapRes!48742 () Bool)

(assert (=> b!1248574 (= e!708382 (and e!708379 mapRes!48742))))

(declare-fun condMapEmpty!48742 () Bool)

(declare-fun mapDefault!48742 () ValueCell!14900)

(assert (=> b!1248574 (= condMapEmpty!48742 (= (arr!38757 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14900)) mapDefault!48742)))))

(declare-fun mapNonEmpty!48742 () Bool)

(declare-fun tp!92843 () Bool)

(declare-fun e!708384 () Bool)

(assert (=> mapNonEmpty!48742 (= mapRes!48742 (and tp!92843 e!708384))))

(declare-fun mapRest!48742 () (Array (_ BitVec 32) ValueCell!14900))

(declare-fun mapKey!48742 () (_ BitVec 32))

(declare-fun mapValue!48742 () ValueCell!14900)

(assert (=> mapNonEmpty!48742 (= (arr!38757 _values!914) (store mapRest!48742 mapKey!48742 mapValue!48742))))

(declare-fun b!1248575 () Bool)

(declare-fun e!708380 () Bool)

(declare-datatypes ((List!27547 0))(
  ( (Nil!27544) (Cons!27543 (h!28761 (_ BitVec 64)) (t!41008 List!27547)) )
))
(declare-fun contains!7497 (List!27547 (_ BitVec 64)) Bool)

(assert (=> b!1248575 (= e!708380 (contains!7497 Nil!27544 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1248576 () Bool)

(assert (=> b!1248576 (= e!708383 e!708380)))

(declare-fun res!832789 () Bool)

(assert (=> b!1248576 (=> res!832789 e!708380)))

(assert (=> b!1248576 (= res!832789 (contains!7497 Nil!27544 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1248577 () Bool)

(declare-fun res!832791 () Bool)

(assert (=> b!1248577 (=> (not res!832791) (not e!708383))))

(assert (=> b!1248577 (= res!832791 (and (bvsle #b00000000000000000000000000000000 (size!39293 _keys!1118)) (bvslt (size!39293 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun b!1248578 () Bool)

(declare-fun res!832792 () Bool)

(assert (=> b!1248578 (=> (not res!832792) (not e!708383))))

(declare-fun noDuplicate!2058 (List!27547) Bool)

(assert (=> b!1248578 (= res!832792 (noDuplicate!2058 Nil!27544))))

(declare-fun b!1248579 () Bool)

(declare-fun tp_is_empty!31327 () Bool)

(assert (=> b!1248579 (= e!708379 tp_is_empty!31327)))

(declare-fun mapIsEmpty!48742 () Bool)

(assert (=> mapIsEmpty!48742 mapRes!48742))

(declare-fun b!1248580 () Bool)

(assert (=> b!1248580 (= e!708384 tp_is_empty!31327)))

(declare-fun b!1248581 () Bool)

(declare-fun res!832793 () Bool)

(assert (=> b!1248581 (=> (not res!832793) (not e!708383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80381 (_ BitVec 32)) Bool)

(assert (=> b!1248581 (= res!832793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104810 res!832790) b!1248573))

(assert (= (and b!1248573 res!832788) b!1248581))

(assert (= (and b!1248581 res!832793) b!1248577))

(assert (= (and b!1248577 res!832791) b!1248578))

(assert (= (and b!1248578 res!832792) b!1248576))

(assert (= (and b!1248576 (not res!832789)) b!1248575))

(assert (= (and b!1248574 condMapEmpty!48742) mapIsEmpty!48742))

(assert (= (and b!1248574 (not condMapEmpty!48742)) mapNonEmpty!48742))

(get-info :version)

(assert (= (and mapNonEmpty!48742 ((_ is ValueCellFull!14900) mapValue!48742)) b!1248580))

(assert (= (and b!1248574 ((_ is ValueCellFull!14900) mapDefault!48742)) b!1248579))

(assert (= start!104810 b!1248574))

(declare-fun m!1150443 () Bool)

(assert (=> b!1248575 m!1150443))

(declare-fun m!1150445 () Bool)

(assert (=> b!1248578 m!1150445))

(declare-fun m!1150447 () Bool)

(assert (=> mapNonEmpty!48742 m!1150447))

(declare-fun m!1150449 () Bool)

(assert (=> b!1248576 m!1150449))

(declare-fun m!1150451 () Bool)

(assert (=> start!104810 m!1150451))

(declare-fun m!1150453 () Bool)

(assert (=> start!104810 m!1150453))

(declare-fun m!1150455 () Bool)

(assert (=> start!104810 m!1150455))

(declare-fun m!1150457 () Bool)

(assert (=> b!1248581 m!1150457))

(check-sat (not b!1248576) (not mapNonEmpty!48742) (not b!1248581) (not b!1248575) tp_is_empty!31327 (not start!104810) (not b!1248578))
(check-sat)
(get-model)

(declare-fun d!138201 () Bool)

(assert (=> d!138201 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104810 d!138201))

(declare-fun d!138203 () Bool)

(assert (=> d!138203 (= (array_inv!29683 _keys!1118) (bvsge (size!39293 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104810 d!138203))

(declare-fun d!138205 () Bool)

(assert (=> d!138205 (= (array_inv!29684 _values!914) (bvsge (size!39294 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104810 d!138205))

(declare-fun d!138207 () Bool)

(declare-fun lt!563722 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!631 (List!27547) (InoxSet (_ BitVec 64)))

(assert (=> d!138207 (= lt!563722 (select (content!631 Nil!27544) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!708426 () Bool)

(assert (=> d!138207 (= lt!563722 e!708426)))

(declare-fun res!832834 () Bool)

(assert (=> d!138207 (=> (not res!832834) (not e!708426))))

(assert (=> d!138207 (= res!832834 ((_ is Cons!27543) Nil!27544))))

(assert (=> d!138207 (= (contains!7497 Nil!27544 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563722)))

(declare-fun b!1248640 () Bool)

(declare-fun e!708425 () Bool)

(assert (=> b!1248640 (= e!708426 e!708425)))

(declare-fun res!832835 () Bool)

(assert (=> b!1248640 (=> res!832835 e!708425)))

(assert (=> b!1248640 (= res!832835 (= (h!28761 Nil!27544) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1248641 () Bool)

(assert (=> b!1248641 (= e!708425 (contains!7497 (t!41008 Nil!27544) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!138207 res!832834) b!1248640))

(assert (= (and b!1248640 (not res!832835)) b!1248641))

(declare-fun m!1150491 () Bool)

(assert (=> d!138207 m!1150491))

(declare-fun m!1150493 () Bool)

(assert (=> d!138207 m!1150493))

(declare-fun m!1150495 () Bool)

(assert (=> b!1248641 m!1150495))

(assert (=> b!1248576 d!138207))

(declare-fun d!138209 () Bool)

(declare-fun lt!563723 () Bool)

(assert (=> d!138209 (= lt!563723 (select (content!631 Nil!27544) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!708428 () Bool)

(assert (=> d!138209 (= lt!563723 e!708428)))

(declare-fun res!832836 () Bool)

(assert (=> d!138209 (=> (not res!832836) (not e!708428))))

(assert (=> d!138209 (= res!832836 ((_ is Cons!27543) Nil!27544))))

(assert (=> d!138209 (= (contains!7497 Nil!27544 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563723)))

(declare-fun b!1248642 () Bool)

(declare-fun e!708427 () Bool)

(assert (=> b!1248642 (= e!708428 e!708427)))

(declare-fun res!832837 () Bool)

(assert (=> b!1248642 (=> res!832837 e!708427)))

(assert (=> b!1248642 (= res!832837 (= (h!28761 Nil!27544) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1248643 () Bool)

(assert (=> b!1248643 (= e!708427 (contains!7497 (t!41008 Nil!27544) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!138209 res!832836) b!1248642))

(assert (= (and b!1248642 (not res!832837)) b!1248643))

(assert (=> d!138209 m!1150491))

(declare-fun m!1150497 () Bool)

(assert (=> d!138209 m!1150497))

(declare-fun m!1150499 () Bool)

(assert (=> b!1248643 m!1150499))

(assert (=> b!1248575 d!138209))

(declare-fun d!138211 () Bool)

(declare-fun res!832842 () Bool)

(declare-fun e!708433 () Bool)

(assert (=> d!138211 (=> res!832842 e!708433)))

(assert (=> d!138211 (= res!832842 ((_ is Nil!27544) Nil!27544))))

(assert (=> d!138211 (= (noDuplicate!2058 Nil!27544) e!708433)))

(declare-fun b!1248648 () Bool)

(declare-fun e!708434 () Bool)

(assert (=> b!1248648 (= e!708433 e!708434)))

(declare-fun res!832843 () Bool)

(assert (=> b!1248648 (=> (not res!832843) (not e!708434))))

(assert (=> b!1248648 (= res!832843 (not (contains!7497 (t!41008 Nil!27544) (h!28761 Nil!27544))))))

(declare-fun b!1248649 () Bool)

(assert (=> b!1248649 (= e!708434 (noDuplicate!2058 (t!41008 Nil!27544)))))

(assert (= (and d!138211 (not res!832842)) b!1248648))

(assert (= (and b!1248648 res!832843) b!1248649))

(declare-fun m!1150501 () Bool)

(assert (=> b!1248648 m!1150501))

(declare-fun m!1150503 () Bool)

(assert (=> b!1248649 m!1150503))

(assert (=> b!1248578 d!138211))

(declare-fun b!1248658 () Bool)

(declare-fun e!708443 () Bool)

(declare-fun call!61628 () Bool)

(assert (=> b!1248658 (= e!708443 call!61628)))

(declare-fun bm!61625 () Bool)

(assert (=> bm!61625 (= call!61628 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!138213 () Bool)

(declare-fun res!832849 () Bool)

(declare-fun e!708441 () Bool)

(assert (=> d!138213 (=> res!832849 e!708441)))

(assert (=> d!138213 (= res!832849 (bvsge #b00000000000000000000000000000000 (size!39293 _keys!1118)))))

(assert (=> d!138213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!708441)))

(declare-fun b!1248659 () Bool)

(declare-fun e!708442 () Bool)

(assert (=> b!1248659 (= e!708443 e!708442)))

(declare-fun lt!563730 () (_ BitVec 64))

(assert (=> b!1248659 (= lt!563730 (select (arr!38756 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41444 0))(
  ( (Unit!41445) )
))
(declare-fun lt!563732 () Unit!41444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80381 (_ BitVec 64) (_ BitVec 32)) Unit!41444)

(assert (=> b!1248659 (= lt!563732 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563730 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1248659 (arrayContainsKey!0 _keys!1118 lt!563730 #b00000000000000000000000000000000)))

(declare-fun lt!563731 () Unit!41444)

(assert (=> b!1248659 (= lt!563731 lt!563732)))

(declare-fun res!832848 () Bool)

(declare-datatypes ((SeekEntryResult!9911 0))(
  ( (MissingZero!9911 (index!42015 (_ BitVec 32))) (Found!9911 (index!42016 (_ BitVec 32))) (Intermediate!9911 (undefined!10723 Bool) (index!42017 (_ BitVec 32)) (x!109584 (_ BitVec 32))) (Undefined!9911) (MissingVacant!9911 (index!42018 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80381 (_ BitVec 32)) SeekEntryResult!9911)

(assert (=> b!1248659 (= res!832848 (= (seekEntryOrOpen!0 (select (arr!38756 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9911 #b00000000000000000000000000000000)))))

(assert (=> b!1248659 (=> (not res!832848) (not e!708442))))

(declare-fun b!1248660 () Bool)

(assert (=> b!1248660 (= e!708442 call!61628)))

(declare-fun b!1248661 () Bool)

(assert (=> b!1248661 (= e!708441 e!708443)))

(declare-fun c!122500 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1248661 (= c!122500 (validKeyInArray!0 (select (arr!38756 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138213 (not res!832849)) b!1248661))

(assert (= (and b!1248661 c!122500) b!1248659))

(assert (= (and b!1248661 (not c!122500)) b!1248658))

(assert (= (and b!1248659 res!832848) b!1248660))

(assert (= (or b!1248660 b!1248658) bm!61625))

(declare-fun m!1150505 () Bool)

(assert (=> bm!61625 m!1150505))

(declare-fun m!1150507 () Bool)

(assert (=> b!1248659 m!1150507))

(declare-fun m!1150509 () Bool)

(assert (=> b!1248659 m!1150509))

(declare-fun m!1150511 () Bool)

(assert (=> b!1248659 m!1150511))

(assert (=> b!1248659 m!1150507))

(declare-fun m!1150513 () Bool)

(assert (=> b!1248659 m!1150513))

(assert (=> b!1248661 m!1150507))

(assert (=> b!1248661 m!1150507))

(declare-fun m!1150515 () Bool)

(assert (=> b!1248661 m!1150515))

(assert (=> b!1248581 d!138213))

(declare-fun b!1248668 () Bool)

(declare-fun e!708449 () Bool)

(assert (=> b!1248668 (= e!708449 tp_is_empty!31327)))

(declare-fun mapNonEmpty!48751 () Bool)

(declare-fun mapRes!48751 () Bool)

(declare-fun tp!92852 () Bool)

(assert (=> mapNonEmpty!48751 (= mapRes!48751 (and tp!92852 e!708449))))

(declare-fun mapRest!48751 () (Array (_ BitVec 32) ValueCell!14900))

(declare-fun mapValue!48751 () ValueCell!14900)

(declare-fun mapKey!48751 () (_ BitVec 32))

(assert (=> mapNonEmpty!48751 (= mapRest!48742 (store mapRest!48751 mapKey!48751 mapValue!48751))))

(declare-fun mapIsEmpty!48751 () Bool)

(assert (=> mapIsEmpty!48751 mapRes!48751))

(declare-fun b!1248669 () Bool)

(declare-fun e!708448 () Bool)

(assert (=> b!1248669 (= e!708448 tp_is_empty!31327)))

(declare-fun condMapEmpty!48751 () Bool)

(declare-fun mapDefault!48751 () ValueCell!14900)

(assert (=> mapNonEmpty!48742 (= condMapEmpty!48751 (= mapRest!48742 ((as const (Array (_ BitVec 32) ValueCell!14900)) mapDefault!48751)))))

(assert (=> mapNonEmpty!48742 (= tp!92843 (and e!708448 mapRes!48751))))

(assert (= (and mapNonEmpty!48742 condMapEmpty!48751) mapIsEmpty!48751))

(assert (= (and mapNonEmpty!48742 (not condMapEmpty!48751)) mapNonEmpty!48751))

(assert (= (and mapNonEmpty!48751 ((_ is ValueCellFull!14900) mapValue!48751)) b!1248668))

(assert (= (and mapNonEmpty!48742 ((_ is ValueCellFull!14900) mapDefault!48751)) b!1248669))

(declare-fun m!1150517 () Bool)

(assert (=> mapNonEmpty!48751 m!1150517))

(check-sat (not d!138209) (not b!1248659) (not b!1248648) (not mapNonEmpty!48751) tp_is_empty!31327 (not b!1248661) (not b!1248649) (not b!1248641) (not d!138207) (not b!1248643) (not bm!61625))
(check-sat)
