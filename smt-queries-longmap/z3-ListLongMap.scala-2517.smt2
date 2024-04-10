; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38922 () Bool)

(assert start!38922)

(declare-fun mapNonEmpty!17133 () Bool)

(declare-fun mapRes!17133 () Bool)

(declare-fun tp!33252 () Bool)

(declare-fun e!244574 () Bool)

(assert (=> mapNonEmpty!17133 (= mapRes!17133 (and tp!33252 e!244574))))

(declare-datatypes ((V!14893 0))(
  ( (V!14894 (val!5215 Int)) )
))
(declare-datatypes ((ValueCell!4827 0))(
  ( (ValueCellFull!4827 (v!7462 V!14893)) (EmptyCell!4827) )
))
(declare-datatypes ((array!24565 0))(
  ( (array!24566 (arr!11732 (Array (_ BitVec 32) ValueCell!4827)) (size!12084 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24565)

(declare-fun mapKey!17133 () (_ BitVec 32))

(declare-fun mapRest!17133 () (Array (_ BitVec 32) ValueCell!4827))

(declare-fun mapValue!17133 () ValueCell!4827)

(assert (=> mapNonEmpty!17133 (= (arr!11732 _values!549) (store mapRest!17133 mapKey!17133 mapValue!17133))))

(declare-fun b!407171 () Bool)

(declare-fun res!235340 () Bool)

(declare-fun e!244575 () Bool)

(assert (=> b!407171 (=> (not res!235340) (not e!244575))))

(declare-datatypes ((array!24567 0))(
  ( (array!24568 (arr!11733 (Array (_ BitVec 32) (_ BitVec 64))) (size!12085 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24567)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407171 (= res!235340 (or (= (select (arr!11733 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11733 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407172 () Bool)

(declare-fun e!244576 () Bool)

(assert (=> b!407172 (= e!244576 false)))

(declare-fun lt!188602 () Bool)

(declare-fun lt!188603 () array!24567)

(declare-datatypes ((List!6808 0))(
  ( (Nil!6805) (Cons!6804 (h!7660 (_ BitVec 64)) (t!11982 List!6808)) )
))
(declare-fun arrayNoDuplicates!0 (array!24567 (_ BitVec 32) List!6808) Bool)

(assert (=> b!407172 (= lt!188602 (arrayNoDuplicates!0 lt!188603 #b00000000000000000000000000000000 Nil!6805))))

(declare-fun b!407173 () Bool)

(declare-fun res!235346 () Bool)

(assert (=> b!407173 (=> (not res!235346) (not e!244575))))

(assert (=> b!407173 (= res!235346 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12085 _keys!709))))))

(declare-fun b!407174 () Bool)

(declare-fun e!244577 () Bool)

(declare-fun tp_is_empty!10341 () Bool)

(assert (=> b!407174 (= e!244577 tp_is_empty!10341)))

(declare-fun b!407175 () Bool)

(declare-fun res!235341 () Bool)

(assert (=> b!407175 (=> (not res!235341) (not e!244575))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24567 (_ BitVec 32)) Bool)

(assert (=> b!407175 (= res!235341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17133 () Bool)

(assert (=> mapIsEmpty!17133 mapRes!17133))

(declare-fun b!407176 () Bool)

(declare-fun res!235338 () Bool)

(assert (=> b!407176 (=> (not res!235338) (not e!244575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407176 (= res!235338 (validMask!0 mask!1025))))

(declare-fun b!407177 () Bool)

(declare-fun res!235344 () Bool)

(assert (=> b!407177 (=> (not res!235344) (not e!244575))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407177 (= res!235344 (validKeyInArray!0 k0!794))))

(declare-fun b!407178 () Bool)

(declare-fun res!235347 () Bool)

(assert (=> b!407178 (=> (not res!235347) (not e!244575))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407178 (= res!235347 (and (= (size!12084 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12085 _keys!709) (size!12084 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!235339 () Bool)

(assert (=> start!38922 (=> (not res!235339) (not e!244575))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38922 (= res!235339 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12085 _keys!709))))))

(assert (=> start!38922 e!244575))

(assert (=> start!38922 true))

(declare-fun e!244573 () Bool)

(declare-fun array_inv!8562 (array!24565) Bool)

(assert (=> start!38922 (and (array_inv!8562 _values!549) e!244573)))

(declare-fun array_inv!8563 (array!24567) Bool)

(assert (=> start!38922 (array_inv!8563 _keys!709)))

(declare-fun b!407179 () Bool)

(assert (=> b!407179 (= e!244575 e!244576)))

(declare-fun res!235342 () Bool)

(assert (=> b!407179 (=> (not res!235342) (not e!244576))))

(assert (=> b!407179 (= res!235342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188603 mask!1025))))

(assert (=> b!407179 (= lt!188603 (array!24568 (store (arr!11733 _keys!709) i!563 k0!794) (size!12085 _keys!709)))))

(declare-fun b!407180 () Bool)

(assert (=> b!407180 (= e!244573 (and e!244577 mapRes!17133))))

(declare-fun condMapEmpty!17133 () Bool)

(declare-fun mapDefault!17133 () ValueCell!4827)

(assert (=> b!407180 (= condMapEmpty!17133 (= (arr!11732 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4827)) mapDefault!17133)))))

(declare-fun b!407181 () Bool)

(assert (=> b!407181 (= e!244574 tp_is_empty!10341)))

(declare-fun b!407182 () Bool)

(declare-fun res!235345 () Bool)

(assert (=> b!407182 (=> (not res!235345) (not e!244575))))

(declare-fun arrayContainsKey!0 (array!24567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407182 (= res!235345 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407183 () Bool)

(declare-fun res!235343 () Bool)

(assert (=> b!407183 (=> (not res!235343) (not e!244575))))

(assert (=> b!407183 (= res!235343 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6805))))

(assert (= (and start!38922 res!235339) b!407176))

(assert (= (and b!407176 res!235338) b!407178))

(assert (= (and b!407178 res!235347) b!407175))

(assert (= (and b!407175 res!235341) b!407183))

(assert (= (and b!407183 res!235343) b!407173))

(assert (= (and b!407173 res!235346) b!407177))

(assert (= (and b!407177 res!235344) b!407171))

(assert (= (and b!407171 res!235340) b!407182))

(assert (= (and b!407182 res!235345) b!407179))

(assert (= (and b!407179 res!235342) b!407172))

(assert (= (and b!407180 condMapEmpty!17133) mapIsEmpty!17133))

(assert (= (and b!407180 (not condMapEmpty!17133)) mapNonEmpty!17133))

(get-info :version)

(assert (= (and mapNonEmpty!17133 ((_ is ValueCellFull!4827) mapValue!17133)) b!407181))

(assert (= (and b!407180 ((_ is ValueCellFull!4827) mapDefault!17133)) b!407174))

(assert (= start!38922 b!407180))

(declare-fun m!398959 () Bool)

(assert (=> b!407172 m!398959))

(declare-fun m!398961 () Bool)

(assert (=> b!407179 m!398961))

(declare-fun m!398963 () Bool)

(assert (=> b!407179 m!398963))

(declare-fun m!398965 () Bool)

(assert (=> mapNonEmpty!17133 m!398965))

(declare-fun m!398967 () Bool)

(assert (=> b!407177 m!398967))

(declare-fun m!398969 () Bool)

(assert (=> start!38922 m!398969))

(declare-fun m!398971 () Bool)

(assert (=> start!38922 m!398971))

(declare-fun m!398973 () Bool)

(assert (=> b!407182 m!398973))

(declare-fun m!398975 () Bool)

(assert (=> b!407171 m!398975))

(declare-fun m!398977 () Bool)

(assert (=> b!407176 m!398977))

(declare-fun m!398979 () Bool)

(assert (=> b!407175 m!398979))

(declare-fun m!398981 () Bool)

(assert (=> b!407183 m!398981))

(check-sat tp_is_empty!10341 (not b!407179) (not start!38922) (not mapNonEmpty!17133) (not b!407175) (not b!407172) (not b!407177) (not b!407176) (not b!407182) (not b!407183))
(check-sat)
