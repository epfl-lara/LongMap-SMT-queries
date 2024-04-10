; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38994 () Bool)

(assert start!38994)

(declare-fun b!408575 () Bool)

(declare-fun e!245224 () Bool)

(declare-fun tp_is_empty!10413 () Bool)

(assert (=> b!408575 (= e!245224 tp_is_empty!10413)))

(declare-fun b!408576 () Bool)

(declare-fun res!236421 () Bool)

(declare-fun e!245221 () Bool)

(assert (=> b!408576 (=> (not res!236421) (not e!245221))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408576 (= res!236421 (validKeyInArray!0 k0!794))))

(declare-fun b!408577 () Bool)

(declare-fun res!236424 () Bool)

(assert (=> b!408577 (=> (not res!236424) (not e!245221))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24701 0))(
  ( (array!24702 (arr!11800 (Array (_ BitVec 32) (_ BitVec 64))) (size!12152 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24701)

(assert (=> b!408577 (= res!236424 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12152 _keys!709))))))

(declare-fun b!408578 () Bool)

(declare-fun res!236418 () Bool)

(assert (=> b!408578 (=> (not res!236418) (not e!245221))))

(declare-datatypes ((List!6837 0))(
  ( (Nil!6834) (Cons!6833 (h!7689 (_ BitVec 64)) (t!12011 List!6837)) )
))
(declare-fun arrayNoDuplicates!0 (array!24701 (_ BitVec 32) List!6837) Bool)

(assert (=> b!408578 (= res!236418 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6834))))

(declare-fun b!408579 () Bool)

(declare-fun e!245225 () Bool)

(assert (=> b!408579 (= e!245221 e!245225)))

(declare-fun res!236419 () Bool)

(assert (=> b!408579 (=> (not res!236419) (not e!245225))))

(declare-fun lt!188818 () array!24701)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24701 (_ BitVec 32)) Bool)

(assert (=> b!408579 (= res!236419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188818 mask!1025))))

(assert (=> b!408579 (= lt!188818 (array!24702 (store (arr!11800 _keys!709) i!563 k0!794) (size!12152 _keys!709)))))

(declare-fun b!408580 () Bool)

(declare-fun res!236425 () Bool)

(assert (=> b!408580 (=> (not res!236425) (not e!245221))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14989 0))(
  ( (V!14990 (val!5251 Int)) )
))
(declare-datatypes ((ValueCell!4863 0))(
  ( (ValueCellFull!4863 (v!7498 V!14989)) (EmptyCell!4863) )
))
(declare-datatypes ((array!24703 0))(
  ( (array!24704 (arr!11801 (Array (_ BitVec 32) ValueCell!4863)) (size!12153 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24703)

(assert (=> b!408580 (= res!236425 (and (= (size!12153 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12152 _keys!709) (size!12153 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408582 () Bool)

(declare-fun res!236427 () Bool)

(assert (=> b!408582 (=> (not res!236427) (not e!245221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408582 (= res!236427 (validMask!0 mask!1025))))

(declare-fun b!408583 () Bool)

(declare-fun res!236423 () Bool)

(assert (=> b!408583 (=> (not res!236423) (not e!245221))))

(assert (=> b!408583 (= res!236423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17241 () Bool)

(declare-fun mapRes!17241 () Bool)

(assert (=> mapIsEmpty!17241 mapRes!17241))

(declare-fun b!408584 () Bool)

(declare-fun e!245223 () Bool)

(assert (=> b!408584 (= e!245223 (and e!245224 mapRes!17241))))

(declare-fun condMapEmpty!17241 () Bool)

(declare-fun mapDefault!17241 () ValueCell!4863)

(assert (=> b!408584 (= condMapEmpty!17241 (= (arr!11801 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4863)) mapDefault!17241)))))

(declare-fun b!408585 () Bool)

(declare-fun e!245222 () Bool)

(assert (=> b!408585 (= e!245222 tp_is_empty!10413)))

(declare-fun b!408586 () Bool)

(declare-fun res!236426 () Bool)

(assert (=> b!408586 (=> (not res!236426) (not e!245221))))

(assert (=> b!408586 (= res!236426 (or (= (select (arr!11800 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11800 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!236422 () Bool)

(assert (=> start!38994 (=> (not res!236422) (not e!245221))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38994 (= res!236422 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12152 _keys!709))))))

(assert (=> start!38994 e!245221))

(assert (=> start!38994 true))

(declare-fun array_inv!8608 (array!24703) Bool)

(assert (=> start!38994 (and (array_inv!8608 _values!549) e!245223)))

(declare-fun array_inv!8609 (array!24701) Bool)

(assert (=> start!38994 (array_inv!8609 _keys!709)))

(declare-fun b!408581 () Bool)

(assert (=> b!408581 (= e!245225 false)))

(declare-fun lt!188819 () Bool)

(assert (=> b!408581 (= lt!188819 (arrayNoDuplicates!0 lt!188818 #b00000000000000000000000000000000 Nil!6834))))

(declare-fun b!408587 () Bool)

(declare-fun res!236420 () Bool)

(assert (=> b!408587 (=> (not res!236420) (not e!245221))))

(declare-fun arrayContainsKey!0 (array!24701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408587 (= res!236420 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17241 () Bool)

(declare-fun tp!33360 () Bool)

(assert (=> mapNonEmpty!17241 (= mapRes!17241 (and tp!33360 e!245222))))

(declare-fun mapValue!17241 () ValueCell!4863)

(declare-fun mapKey!17241 () (_ BitVec 32))

(declare-fun mapRest!17241 () (Array (_ BitVec 32) ValueCell!4863))

(assert (=> mapNonEmpty!17241 (= (arr!11801 _values!549) (store mapRest!17241 mapKey!17241 mapValue!17241))))

(assert (= (and start!38994 res!236422) b!408582))

(assert (= (and b!408582 res!236427) b!408580))

(assert (= (and b!408580 res!236425) b!408583))

(assert (= (and b!408583 res!236423) b!408578))

(assert (= (and b!408578 res!236418) b!408577))

(assert (= (and b!408577 res!236424) b!408576))

(assert (= (and b!408576 res!236421) b!408586))

(assert (= (and b!408586 res!236426) b!408587))

(assert (= (and b!408587 res!236420) b!408579))

(assert (= (and b!408579 res!236419) b!408581))

(assert (= (and b!408584 condMapEmpty!17241) mapIsEmpty!17241))

(assert (= (and b!408584 (not condMapEmpty!17241)) mapNonEmpty!17241))

(get-info :version)

(assert (= (and mapNonEmpty!17241 ((_ is ValueCellFull!4863) mapValue!17241)) b!408585))

(assert (= (and b!408584 ((_ is ValueCellFull!4863) mapDefault!17241)) b!408575))

(assert (= start!38994 b!408584))

(declare-fun m!399823 () Bool)

(assert (=> b!408578 m!399823))

(declare-fun m!399825 () Bool)

(assert (=> b!408583 m!399825))

(declare-fun m!399827 () Bool)

(assert (=> b!408582 m!399827))

(declare-fun m!399829 () Bool)

(assert (=> b!408587 m!399829))

(declare-fun m!399831 () Bool)

(assert (=> start!38994 m!399831))

(declare-fun m!399833 () Bool)

(assert (=> start!38994 m!399833))

(declare-fun m!399835 () Bool)

(assert (=> b!408581 m!399835))

(declare-fun m!399837 () Bool)

(assert (=> b!408576 m!399837))

(declare-fun m!399839 () Bool)

(assert (=> b!408579 m!399839))

(declare-fun m!399841 () Bool)

(assert (=> b!408579 m!399841))

(declare-fun m!399843 () Bool)

(assert (=> b!408586 m!399843))

(declare-fun m!399845 () Bool)

(assert (=> mapNonEmpty!17241 m!399845))

(check-sat (not mapNonEmpty!17241) (not b!408578) (not b!408583) tp_is_empty!10413 (not b!408576) (not b!408587) (not b!408579) (not b!408581) (not start!38994) (not b!408582))
(check-sat)
