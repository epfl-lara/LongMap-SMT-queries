; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38420 () Bool)

(assert start!38420)

(declare-fun res!227373 () Bool)

(declare-fun e!239828 () Bool)

(assert (=> start!38420 (=> (not res!227373) (not e!239828))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23610 0))(
  ( (array!23611 (arr!11254 (Array (_ BitVec 32) (_ BitVec 64))) (size!11606 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23610)

(assert (=> start!38420 (= res!227373 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11606 _keys!709))))))

(assert (=> start!38420 e!239828))

(assert (=> start!38420 true))

(declare-datatypes ((V!14243 0))(
  ( (V!14244 (val!4971 Int)) )
))
(declare-datatypes ((ValueCell!4583 0))(
  ( (ValueCellFull!4583 (v!7219 V!14243)) (EmptyCell!4583) )
))
(declare-datatypes ((array!23612 0))(
  ( (array!23613 (arr!11255 (Array (_ BitVec 32) ValueCell!4583)) (size!11607 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23612)

(declare-fun e!239829 () Bool)

(declare-fun array_inv!8318 (array!23612) Bool)

(assert (=> start!38420 (and (array_inv!8318 _values!549) e!239829)))

(declare-fun array_inv!8319 (array!23610) Bool)

(assert (=> start!38420 (array_inv!8319 _keys!709)))

(declare-fun b!396310 () Bool)

(declare-fun e!239825 () Bool)

(assert (=> b!396310 (= e!239825 false)))

(declare-fun lt!187158 () Bool)

(declare-fun lt!187157 () array!23610)

(declare-datatypes ((List!6392 0))(
  ( (Nil!6389) (Cons!6388 (h!7244 (_ BitVec 64)) (t!11558 List!6392)) )
))
(declare-fun arrayNoDuplicates!0 (array!23610 (_ BitVec 32) List!6392) Bool)

(assert (=> b!396310 (= lt!187158 (arrayNoDuplicates!0 lt!187157 #b00000000000000000000000000000000 Nil!6389))))

(declare-fun b!396311 () Bool)

(declare-fun res!227371 () Bool)

(assert (=> b!396311 (=> (not res!227371) (not e!239828))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396311 (= res!227371 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396312 () Bool)

(declare-fun res!227372 () Bool)

(assert (=> b!396312 (=> (not res!227372) (not e!239828))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23610 (_ BitVec 32)) Bool)

(assert (=> b!396312 (= res!227372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396313 () Bool)

(declare-fun res!227368 () Bool)

(assert (=> b!396313 (=> (not res!227368) (not e!239828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396313 (= res!227368 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16401 () Bool)

(declare-fun mapRes!16401 () Bool)

(assert (=> mapIsEmpty!16401 mapRes!16401))

(declare-fun b!396314 () Bool)

(declare-fun res!227367 () Bool)

(assert (=> b!396314 (=> (not res!227367) (not e!239828))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396314 (= res!227367 (or (= (select (arr!11254 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11254 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396315 () Bool)

(declare-fun res!227369 () Bool)

(assert (=> b!396315 (=> (not res!227369) (not e!239828))))

(assert (=> b!396315 (= res!227369 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11606 _keys!709))))))

(declare-fun b!396316 () Bool)

(declare-fun res!227374 () Bool)

(assert (=> b!396316 (=> (not res!227374) (not e!239828))))

(assert (=> b!396316 (= res!227374 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6389))))

(declare-fun b!396317 () Bool)

(assert (=> b!396317 (= e!239828 e!239825)))

(declare-fun res!227375 () Bool)

(assert (=> b!396317 (=> (not res!227375) (not e!239825))))

(assert (=> b!396317 (= res!227375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187157 mask!1025))))

(assert (=> b!396317 (= lt!187157 (array!23611 (store (arr!11254 _keys!709) i!563 k0!794) (size!11606 _keys!709)))))

(declare-fun mapNonEmpty!16401 () Bool)

(declare-fun tp!32196 () Bool)

(declare-fun e!239830 () Bool)

(assert (=> mapNonEmpty!16401 (= mapRes!16401 (and tp!32196 e!239830))))

(declare-fun mapRest!16401 () (Array (_ BitVec 32) ValueCell!4583))

(declare-fun mapKey!16401 () (_ BitVec 32))

(declare-fun mapValue!16401 () ValueCell!4583)

(assert (=> mapNonEmpty!16401 (= (arr!11255 _values!549) (store mapRest!16401 mapKey!16401 mapValue!16401))))

(declare-fun b!396318 () Bool)

(declare-fun res!227370 () Bool)

(assert (=> b!396318 (=> (not res!227370) (not e!239828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396318 (= res!227370 (validKeyInArray!0 k0!794))))

(declare-fun b!396319 () Bool)

(declare-fun res!227376 () Bool)

(assert (=> b!396319 (=> (not res!227376) (not e!239828))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396319 (= res!227376 (and (= (size!11607 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11606 _keys!709) (size!11607 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396320 () Bool)

(declare-fun e!239827 () Bool)

(declare-fun tp_is_empty!9853 () Bool)

(assert (=> b!396320 (= e!239827 tp_is_empty!9853)))

(declare-fun b!396321 () Bool)

(assert (=> b!396321 (= e!239830 tp_is_empty!9853)))

(declare-fun b!396322 () Bool)

(assert (=> b!396322 (= e!239829 (and e!239827 mapRes!16401))))

(declare-fun condMapEmpty!16401 () Bool)

(declare-fun mapDefault!16401 () ValueCell!4583)

(assert (=> b!396322 (= condMapEmpty!16401 (= (arr!11255 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4583)) mapDefault!16401)))))

(assert (= (and start!38420 res!227373) b!396313))

(assert (= (and b!396313 res!227368) b!396319))

(assert (= (and b!396319 res!227376) b!396312))

(assert (= (and b!396312 res!227372) b!396316))

(assert (= (and b!396316 res!227374) b!396315))

(assert (= (and b!396315 res!227369) b!396318))

(assert (= (and b!396318 res!227370) b!396314))

(assert (= (and b!396314 res!227367) b!396311))

(assert (= (and b!396311 res!227371) b!396317))

(assert (= (and b!396317 res!227375) b!396310))

(assert (= (and b!396322 condMapEmpty!16401) mapIsEmpty!16401))

(assert (= (and b!396322 (not condMapEmpty!16401)) mapNonEmpty!16401))

(get-info :version)

(assert (= (and mapNonEmpty!16401 ((_ is ValueCellFull!4583) mapValue!16401)) b!396321))

(assert (= (and b!396322 ((_ is ValueCellFull!4583) mapDefault!16401)) b!396320))

(assert (= start!38420 b!396322))

(declare-fun m!392253 () Bool)

(assert (=> b!396314 m!392253))

(declare-fun m!392255 () Bool)

(assert (=> b!396318 m!392255))

(declare-fun m!392257 () Bool)

(assert (=> b!396317 m!392257))

(declare-fun m!392259 () Bool)

(assert (=> b!396317 m!392259))

(declare-fun m!392261 () Bool)

(assert (=> mapNonEmpty!16401 m!392261))

(declare-fun m!392263 () Bool)

(assert (=> b!396311 m!392263))

(declare-fun m!392265 () Bool)

(assert (=> b!396313 m!392265))

(declare-fun m!392267 () Bool)

(assert (=> b!396310 m!392267))

(declare-fun m!392269 () Bool)

(assert (=> b!396316 m!392269))

(declare-fun m!392271 () Bool)

(assert (=> b!396312 m!392271))

(declare-fun m!392273 () Bool)

(assert (=> start!38420 m!392273))

(declare-fun m!392275 () Bool)

(assert (=> start!38420 m!392275))

(check-sat tp_is_empty!9853 (not b!396310) (not b!396317) (not mapNonEmpty!16401) (not b!396316) (not b!396318) (not b!396311) (not b!396312) (not start!38420) (not b!396313))
(check-sat)
