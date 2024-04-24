; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38294 () Bool)

(assert start!38294)

(declare-fun b!395019 () Bool)

(declare-fun res!226462 () Bool)

(declare-fun e!239168 () Bool)

(assert (=> b!395019 (=> (not res!226462) (not e!239168))))

(declare-datatypes ((array!23474 0))(
  ( (array!23475 (arr!11190 (Array (_ BitVec 32) (_ BitVec 64))) (size!11542 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23474)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14155 0))(
  ( (V!14156 (val!4938 Int)) )
))
(declare-datatypes ((ValueCell!4550 0))(
  ( (ValueCellFull!4550 (v!7185 V!14155)) (EmptyCell!4550) )
))
(declare-datatypes ((array!23476 0))(
  ( (array!23477 (arr!11191 (Array (_ BitVec 32) ValueCell!4550)) (size!11543 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23476)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!395019 (= res!226462 (and (= (size!11543 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11542 _keys!709) (size!11543 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395020 () Bool)

(declare-fun res!226459 () Bool)

(assert (=> b!395020 (=> (not res!226459) (not e!239168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23474 (_ BitVec 32)) Bool)

(assert (=> b!395020 (= res!226459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395021 () Bool)

(declare-fun e!239166 () Bool)

(declare-fun e!239165 () Bool)

(declare-fun mapRes!16290 () Bool)

(assert (=> b!395021 (= e!239166 (and e!239165 mapRes!16290))))

(declare-fun condMapEmpty!16290 () Bool)

(declare-fun mapDefault!16290 () ValueCell!4550)

(assert (=> b!395021 (= condMapEmpty!16290 (= (arr!11191 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4550)) mapDefault!16290)))))

(declare-fun b!395022 () Bool)

(declare-fun tp_is_empty!9787 () Bool)

(assert (=> b!395022 (= e!239165 tp_is_empty!9787)))

(declare-fun mapIsEmpty!16290 () Bool)

(assert (=> mapIsEmpty!16290 mapRes!16290))

(declare-fun mapNonEmpty!16290 () Bool)

(declare-fun tp!32085 () Bool)

(declare-fun e!239167 () Bool)

(assert (=> mapNonEmpty!16290 (= mapRes!16290 (and tp!32085 e!239167))))

(declare-fun mapValue!16290 () ValueCell!4550)

(declare-fun mapKey!16290 () (_ BitVec 32))

(declare-fun mapRest!16290 () (Array (_ BitVec 32) ValueCell!4550))

(assert (=> mapNonEmpty!16290 (= (arr!11191 _values!549) (store mapRest!16290 mapKey!16290 mapValue!16290))))

(declare-fun b!395023 () Bool)

(assert (=> b!395023 (= e!239168 false)))

(declare-fun lt!187079 () Bool)

(declare-datatypes ((List!6365 0))(
  ( (Nil!6362) (Cons!6361 (h!7217 (_ BitVec 64)) (t!11531 List!6365)) )
))
(declare-fun arrayNoDuplicates!0 (array!23474 (_ BitVec 32) List!6365) Bool)

(assert (=> b!395023 (= lt!187079 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6362))))

(declare-fun b!395024 () Bool)

(declare-fun res!226461 () Bool)

(assert (=> b!395024 (=> (not res!226461) (not e!239168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395024 (= res!226461 (validMask!0 mask!1025))))

(declare-fun b!395025 () Bool)

(assert (=> b!395025 (= e!239167 tp_is_empty!9787)))

(declare-fun res!226460 () Bool)

(assert (=> start!38294 (=> (not res!226460) (not e!239168))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38294 (= res!226460 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11542 _keys!709))))))

(assert (=> start!38294 e!239168))

(assert (=> start!38294 true))

(declare-fun array_inv!8272 (array!23476) Bool)

(assert (=> start!38294 (and (array_inv!8272 _values!549) e!239166)))

(declare-fun array_inv!8273 (array!23474) Bool)

(assert (=> start!38294 (array_inv!8273 _keys!709)))

(assert (= (and start!38294 res!226460) b!395024))

(assert (= (and b!395024 res!226461) b!395019))

(assert (= (and b!395019 res!226462) b!395020))

(assert (= (and b!395020 res!226459) b!395023))

(assert (= (and b!395021 condMapEmpty!16290) mapIsEmpty!16290))

(assert (= (and b!395021 (not condMapEmpty!16290)) mapNonEmpty!16290))

(get-info :version)

(assert (= (and mapNonEmpty!16290 ((_ is ValueCellFull!4550) mapValue!16290)) b!395025))

(assert (= (and b!395021 ((_ is ValueCellFull!4550) mapDefault!16290)) b!395022))

(assert (= start!38294 b!395021))

(declare-fun m!391521 () Bool)

(assert (=> b!395023 m!391521))

(declare-fun m!391523 () Bool)

(assert (=> start!38294 m!391523))

(declare-fun m!391525 () Bool)

(assert (=> start!38294 m!391525))

(declare-fun m!391527 () Bool)

(assert (=> b!395020 m!391527))

(declare-fun m!391529 () Bool)

(assert (=> mapNonEmpty!16290 m!391529))

(declare-fun m!391531 () Bool)

(assert (=> b!395024 m!391531))

(check-sat (not b!395024) (not mapNonEmpty!16290) (not b!395023) tp_is_empty!9787 (not start!38294) (not b!395020))
(check-sat)
