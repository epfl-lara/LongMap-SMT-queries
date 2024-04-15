; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38882 () Bool)

(assert start!38882)

(declare-fun b!406393 () Bool)

(declare-fun res!234825 () Bool)

(declare-fun e!244170 () Bool)

(assert (=> b!406393 (=> (not res!234825) (not e!244170))))

(declare-datatypes ((array!24505 0))(
  ( (array!24506 (arr!11702 (Array (_ BitVec 32) (_ BitVec 64))) (size!12055 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24505)

(declare-datatypes ((List!6772 0))(
  ( (Nil!6769) (Cons!6768 (h!7624 (_ BitVec 64)) (t!11937 List!6772)) )
))
(declare-fun arrayNoDuplicates!0 (array!24505 (_ BitVec 32) List!6772) Bool)

(assert (=> b!406393 (= res!234825 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6769))))

(declare-fun b!406394 () Bool)

(declare-fun e!244169 () Bool)

(assert (=> b!406394 (= e!244170 e!244169)))

(declare-fun res!234821 () Bool)

(assert (=> b!406394 (=> (not res!234821) (not e!244169))))

(declare-fun lt!188291 () array!24505)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24505 (_ BitVec 32)) Bool)

(assert (=> b!406394 (= res!234821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188291 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406394 (= lt!188291 (array!24506 (store (arr!11702 _keys!709) i!563 k0!794) (size!12055 _keys!709)))))

(declare-fun b!406395 () Bool)

(declare-fun e!244165 () Bool)

(declare-fun tp_is_empty!10315 () Bool)

(assert (=> b!406395 (= e!244165 tp_is_empty!10315)))

(declare-fun b!406396 () Bool)

(declare-fun res!234819 () Bool)

(assert (=> b!406396 (=> (not res!234819) (not e!244170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406396 (= res!234819 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17094 () Bool)

(declare-fun mapRes!17094 () Bool)

(assert (=> mapIsEmpty!17094 mapRes!17094))

(declare-fun b!406397 () Bool)

(declare-fun e!244167 () Bool)

(assert (=> b!406397 (= e!244167 (and e!244165 mapRes!17094))))

(declare-fun condMapEmpty!17094 () Bool)

(declare-datatypes ((V!14859 0))(
  ( (V!14860 (val!5202 Int)) )
))
(declare-datatypes ((ValueCell!4814 0))(
  ( (ValueCellFull!4814 (v!7443 V!14859)) (EmptyCell!4814) )
))
(declare-datatypes ((array!24507 0))(
  ( (array!24508 (arr!11703 (Array (_ BitVec 32) ValueCell!4814)) (size!12056 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24507)

(declare-fun mapDefault!17094 () ValueCell!4814)

(assert (=> b!406397 (= condMapEmpty!17094 (= (arr!11703 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4814)) mapDefault!17094)))))

(declare-fun mapNonEmpty!17094 () Bool)

(declare-fun tp!33213 () Bool)

(declare-fun e!244166 () Bool)

(assert (=> mapNonEmpty!17094 (= mapRes!17094 (and tp!33213 e!244166))))

(declare-fun mapRest!17094 () (Array (_ BitVec 32) ValueCell!4814))

(declare-fun mapKey!17094 () (_ BitVec 32))

(declare-fun mapValue!17094 () ValueCell!4814)

(assert (=> mapNonEmpty!17094 (= (arr!11703 _values!549) (store mapRest!17094 mapKey!17094 mapValue!17094))))

(declare-fun b!406398 () Bool)

(declare-fun res!234827 () Bool)

(assert (=> b!406398 (=> (not res!234827) (not e!244170))))

(assert (=> b!406398 (= res!234827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406400 () Bool)

(declare-fun res!234824 () Bool)

(assert (=> b!406400 (=> (not res!234824) (not e!244170))))

(assert (=> b!406400 (= res!234824 (or (= (select (arr!11702 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11702 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406401 () Bool)

(declare-fun res!234826 () Bool)

(assert (=> b!406401 (=> (not res!234826) (not e!244170))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406401 (= res!234826 (and (= (size!12056 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12055 _keys!709) (size!12056 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406402 () Bool)

(declare-fun res!234820 () Bool)

(assert (=> b!406402 (=> (not res!234820) (not e!244170))))

(assert (=> b!406402 (= res!234820 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12055 _keys!709))))))

(declare-fun b!406403 () Bool)

(assert (=> b!406403 (= e!244166 tp_is_empty!10315)))

(declare-fun b!406404 () Bool)

(declare-fun res!234823 () Bool)

(assert (=> b!406404 (=> (not res!234823) (not e!244170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406404 (= res!234823 (validKeyInArray!0 k0!794))))

(declare-fun b!406405 () Bool)

(declare-fun res!234828 () Bool)

(assert (=> b!406405 (=> (not res!234828) (not e!244170))))

(declare-fun arrayContainsKey!0 (array!24505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406405 (= res!234828 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!234822 () Bool)

(assert (=> start!38882 (=> (not res!234822) (not e!244170))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38882 (= res!234822 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12055 _keys!709))))))

(assert (=> start!38882 e!244170))

(assert (=> start!38882 true))

(declare-fun array_inv!8582 (array!24507) Bool)

(assert (=> start!38882 (and (array_inv!8582 _values!549) e!244167)))

(declare-fun array_inv!8583 (array!24505) Bool)

(assert (=> start!38882 (array_inv!8583 _keys!709)))

(declare-fun b!406399 () Bool)

(assert (=> b!406399 (= e!244169 false)))

(declare-fun lt!188290 () Bool)

(assert (=> b!406399 (= lt!188290 (arrayNoDuplicates!0 lt!188291 #b00000000000000000000000000000000 Nil!6769))))

(assert (= (and start!38882 res!234822) b!406396))

(assert (= (and b!406396 res!234819) b!406401))

(assert (= (and b!406401 res!234826) b!406398))

(assert (= (and b!406398 res!234827) b!406393))

(assert (= (and b!406393 res!234825) b!406402))

(assert (= (and b!406402 res!234820) b!406404))

(assert (= (and b!406404 res!234823) b!406400))

(assert (= (and b!406400 res!234824) b!406405))

(assert (= (and b!406405 res!234828) b!406394))

(assert (= (and b!406394 res!234821) b!406399))

(assert (= (and b!406397 condMapEmpty!17094) mapIsEmpty!17094))

(assert (= (and b!406397 (not condMapEmpty!17094)) mapNonEmpty!17094))

(get-info :version)

(assert (= (and mapNonEmpty!17094 ((_ is ValueCellFull!4814) mapValue!17094)) b!406403))

(assert (= (and b!406397 ((_ is ValueCellFull!4814) mapDefault!17094)) b!406395))

(assert (= start!38882 b!406397))

(declare-fun m!397923 () Bool)

(assert (=> start!38882 m!397923))

(declare-fun m!397925 () Bool)

(assert (=> start!38882 m!397925))

(declare-fun m!397927 () Bool)

(assert (=> b!406399 m!397927))

(declare-fun m!397929 () Bool)

(assert (=> b!406396 m!397929))

(declare-fun m!397931 () Bool)

(assert (=> b!406394 m!397931))

(declare-fun m!397933 () Bool)

(assert (=> b!406394 m!397933))

(declare-fun m!397935 () Bool)

(assert (=> b!406404 m!397935))

(declare-fun m!397937 () Bool)

(assert (=> b!406400 m!397937))

(declare-fun m!397939 () Bool)

(assert (=> b!406405 m!397939))

(declare-fun m!397941 () Bool)

(assert (=> mapNonEmpty!17094 m!397941))

(declare-fun m!397943 () Bool)

(assert (=> b!406393 m!397943))

(declare-fun m!397945 () Bool)

(assert (=> b!406398 m!397945))

(check-sat (not start!38882) (not b!406405) (not b!406404) (not b!406396) (not b!406398) (not b!406399) (not mapNonEmpty!17094) (not b!406394) tp_is_empty!10315 (not b!406393))
(check-sat)
