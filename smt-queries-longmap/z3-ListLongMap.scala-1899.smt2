; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33870 () Bool)

(assert start!33870)

(declare-fun b_free!7063 () Bool)

(declare-fun b_next!7063 () Bool)

(assert (=> start!33870 (= b_free!7063 (not b_next!7063))))

(declare-fun tp!24702 () Bool)

(declare-fun b_and!14263 () Bool)

(assert (=> start!33870 (= tp!24702 b_and!14263)))

(declare-fun b!337306 () Bool)

(declare-fun res!186335 () Bool)

(declare-fun e!206988 () Bool)

(assert (=> b!337306 (=> (not res!186335) (not e!206988))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337306 (= res!186335 (validKeyInArray!0 k0!1348))))

(declare-fun b!337307 () Bool)

(declare-fun e!206990 () Bool)

(declare-fun tp_is_empty!7015 () Bool)

(assert (=> b!337307 (= e!206990 tp_is_empty!7015)))

(declare-fun b!337308 () Bool)

(declare-fun res!186341 () Bool)

(declare-fun e!206989 () Bool)

(assert (=> b!337308 (=> (not res!186341) (not e!206989))))

(declare-datatypes ((array!17610 0))(
  ( (array!17611 (arr!8332 (Array (_ BitVec 32) (_ BitVec 64))) (size!8684 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17610)

(declare-fun arrayContainsKey!0 (array!17610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337308 (= res!186341 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337309 () Bool)

(declare-fun res!186337 () Bool)

(assert (=> b!337309 (=> (not res!186337) (not e!206988))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10331 0))(
  ( (V!10332 (val!3552 Int)) )
))
(declare-datatypes ((ValueCell!3164 0))(
  ( (ValueCellFull!3164 (v!5718 V!10331)) (EmptyCell!3164) )
))
(declare-datatypes ((array!17612 0))(
  ( (array!17613 (arr!8333 (Array (_ BitVec 32) ValueCell!3164)) (size!8685 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17612)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337309 (= res!186337 (and (= (size!8685 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8684 _keys!1895) (size!8685 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337310 () Bool)

(declare-fun res!186334 () Bool)

(assert (=> b!337310 (=> (not res!186334) (not e!206988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17610 (_ BitVec 32)) Bool)

(assert (=> b!337310 (= res!186334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337311 () Bool)

(declare-fun res!186340 () Bool)

(assert (=> b!337311 (=> (not res!186340) (not e!206988))))

(declare-datatypes ((List!4684 0))(
  ( (Nil!4681) (Cons!4680 (h!5536 (_ BitVec 64)) (t!9770 List!4684)) )
))
(declare-fun arrayNoDuplicates!0 (array!17610 (_ BitVec 32) List!4684) Bool)

(assert (=> b!337311 (= res!186340 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4681))))

(declare-fun b!337312 () Bool)

(declare-fun res!186339 () Bool)

(assert (=> b!337312 (=> (not res!186339) (not e!206988))))

(declare-fun zeroValue!1467 () V!10331)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10331)

(declare-datatypes ((tuple2!5072 0))(
  ( (tuple2!5073 (_1!2547 (_ BitVec 64)) (_2!2547 V!10331)) )
))
(declare-datatypes ((List!4685 0))(
  ( (Nil!4682) (Cons!4681 (h!5537 tuple2!5072) (t!9771 List!4685)) )
))
(declare-datatypes ((ListLongMap!3987 0))(
  ( (ListLongMap!3988 (toList!2009 List!4685)) )
))
(declare-fun contains!2075 (ListLongMap!3987 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1538 (array!17610 array!17612 (_ BitVec 32) (_ BitVec 32) V!10331 V!10331 (_ BitVec 32) Int) ListLongMap!3987)

(assert (=> b!337312 (= res!186339 (not (contains!2075 (getCurrentListMap!1538 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337313 () Bool)

(declare-fun e!206987 () Bool)

(assert (=> b!337313 (= e!206987 tp_is_empty!7015)))

(declare-fun b!337314 () Bool)

(assert (=> b!337314 (= e!206988 e!206989)))

(declare-fun res!186338 () Bool)

(assert (=> b!337314 (=> (not res!186338) (not e!206989))))

(declare-datatypes ((SeekEntryResult!3180 0))(
  ( (MissingZero!3180 (index!14899 (_ BitVec 32))) (Found!3180 (index!14900 (_ BitVec 32))) (Intermediate!3180 (undefined!3992 Bool) (index!14901 (_ BitVec 32)) (x!33581 (_ BitVec 32))) (Undefined!3180) (MissingVacant!3180 (index!14902 (_ BitVec 32))) )
))
(declare-fun lt!160437 () SeekEntryResult!3180)

(get-info :version)

(assert (=> b!337314 (= res!186338 (and (not ((_ is Found!3180) lt!160437)) ((_ is MissingZero!3180) lt!160437)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17610 (_ BitVec 32)) SeekEntryResult!3180)

(assert (=> b!337314 (= lt!160437 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337316 () Bool)

(declare-fun e!206986 () Bool)

(declare-fun mapRes!11928 () Bool)

(assert (=> b!337316 (= e!206986 (and e!206987 mapRes!11928))))

(declare-fun condMapEmpty!11928 () Bool)

(declare-fun mapDefault!11928 () ValueCell!3164)

(assert (=> b!337316 (= condMapEmpty!11928 (= (arr!8333 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3164)) mapDefault!11928)))))

(declare-fun b!337315 () Bool)

(assert (=> b!337315 (= e!206989 false)))

(declare-fun lt!160438 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17610 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337315 (= lt!160438 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!186336 () Bool)

(assert (=> start!33870 (=> (not res!186336) (not e!206988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33870 (= res!186336 (validMask!0 mask!2385))))

(assert (=> start!33870 e!206988))

(assert (=> start!33870 true))

(assert (=> start!33870 tp_is_empty!7015))

(assert (=> start!33870 tp!24702))

(declare-fun array_inv!6192 (array!17612) Bool)

(assert (=> start!33870 (and (array_inv!6192 _values!1525) e!206986)))

(declare-fun array_inv!6193 (array!17610) Bool)

(assert (=> start!33870 (array_inv!6193 _keys!1895)))

(declare-fun mapNonEmpty!11928 () Bool)

(declare-fun tp!24701 () Bool)

(assert (=> mapNonEmpty!11928 (= mapRes!11928 (and tp!24701 e!206990))))

(declare-fun mapRest!11928 () (Array (_ BitVec 32) ValueCell!3164))

(declare-fun mapValue!11928 () ValueCell!3164)

(declare-fun mapKey!11928 () (_ BitVec 32))

(assert (=> mapNonEmpty!11928 (= (arr!8333 _values!1525) (store mapRest!11928 mapKey!11928 mapValue!11928))))

(declare-fun mapIsEmpty!11928 () Bool)

(assert (=> mapIsEmpty!11928 mapRes!11928))

(assert (= (and start!33870 res!186336) b!337309))

(assert (= (and b!337309 res!186337) b!337310))

(assert (= (and b!337310 res!186334) b!337311))

(assert (= (and b!337311 res!186340) b!337306))

(assert (= (and b!337306 res!186335) b!337312))

(assert (= (and b!337312 res!186339) b!337314))

(assert (= (and b!337314 res!186338) b!337308))

(assert (= (and b!337308 res!186341) b!337315))

(assert (= (and b!337316 condMapEmpty!11928) mapIsEmpty!11928))

(assert (= (and b!337316 (not condMapEmpty!11928)) mapNonEmpty!11928))

(assert (= (and mapNonEmpty!11928 ((_ is ValueCellFull!3164) mapValue!11928)) b!337307))

(assert (= (and b!337316 ((_ is ValueCellFull!3164) mapDefault!11928)) b!337313))

(assert (= start!33870 b!337316))

(declare-fun m!341131 () Bool)

(assert (=> b!337312 m!341131))

(assert (=> b!337312 m!341131))

(declare-fun m!341133 () Bool)

(assert (=> b!337312 m!341133))

(declare-fun m!341135 () Bool)

(assert (=> b!337315 m!341135))

(declare-fun m!341137 () Bool)

(assert (=> b!337308 m!341137))

(declare-fun m!341139 () Bool)

(assert (=> mapNonEmpty!11928 m!341139))

(declare-fun m!341141 () Bool)

(assert (=> b!337311 m!341141))

(declare-fun m!341143 () Bool)

(assert (=> b!337306 m!341143))

(declare-fun m!341145 () Bool)

(assert (=> b!337314 m!341145))

(declare-fun m!341147 () Bool)

(assert (=> b!337310 m!341147))

(declare-fun m!341149 () Bool)

(assert (=> start!33870 m!341149))

(declare-fun m!341151 () Bool)

(assert (=> start!33870 m!341151))

(declare-fun m!341153 () Bool)

(assert (=> start!33870 m!341153))

(check-sat (not b!337310) (not mapNonEmpty!11928) b_and!14263 (not b!337308) (not b!337312) (not start!33870) tp_is_empty!7015 (not b_next!7063) (not b!337315) (not b!337314) (not b!337311) (not b!337306))
(check-sat b_and!14263 (not b_next!7063))
