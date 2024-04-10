; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38970 () Bool)

(assert start!38970)

(declare-fun mapIsEmpty!17205 () Bool)

(declare-fun mapRes!17205 () Bool)

(assert (=> mapIsEmpty!17205 mapRes!17205))

(declare-fun b!408107 () Bool)

(declare-fun res!236064 () Bool)

(declare-fun e!245006 () Bool)

(assert (=> b!408107 (=> (not res!236064) (not e!245006))))

(declare-datatypes ((array!24657 0))(
  ( (array!24658 (arr!11778 (Array (_ BitVec 32) (_ BitVec 64))) (size!12130 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24657)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408107 (= res!236064 (or (= (select (arr!11778 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11778 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17205 () Bool)

(declare-fun tp!33324 () Bool)

(declare-fun e!245007 () Bool)

(assert (=> mapNonEmpty!17205 (= mapRes!17205 (and tp!33324 e!245007))))

(declare-datatypes ((V!14957 0))(
  ( (V!14958 (val!5239 Int)) )
))
(declare-datatypes ((ValueCell!4851 0))(
  ( (ValueCellFull!4851 (v!7486 V!14957)) (EmptyCell!4851) )
))
(declare-datatypes ((array!24659 0))(
  ( (array!24660 (arr!11779 (Array (_ BitVec 32) ValueCell!4851)) (size!12131 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24659)

(declare-fun mapKey!17205 () (_ BitVec 32))

(declare-fun mapRest!17205 () (Array (_ BitVec 32) ValueCell!4851))

(declare-fun mapValue!17205 () ValueCell!4851)

(assert (=> mapNonEmpty!17205 (= (arr!11779 _values!549) (store mapRest!17205 mapKey!17205 mapValue!17205))))

(declare-fun b!408108 () Bool)

(declare-fun res!236066 () Bool)

(assert (=> b!408108 (=> (not res!236066) (not e!245006))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408108 (= res!236066 (validMask!0 mask!1025))))

(declare-fun b!408109 () Bool)

(declare-fun e!245005 () Bool)

(declare-fun tp_is_empty!10389 () Bool)

(assert (=> b!408109 (= e!245005 tp_is_empty!10389)))

(declare-fun b!408110 () Bool)

(declare-fun res!236065 () Bool)

(assert (=> b!408110 (=> (not res!236065) (not e!245006))))

(declare-datatypes ((List!6827 0))(
  ( (Nil!6824) (Cons!6823 (h!7679 (_ BitVec 64)) (t!12001 List!6827)) )
))
(declare-fun arrayNoDuplicates!0 (array!24657 (_ BitVec 32) List!6827) Bool)

(assert (=> b!408110 (= res!236065 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6824))))

(declare-fun b!408112 () Bool)

(declare-fun e!245008 () Bool)

(assert (=> b!408112 (= e!245008 (and e!245005 mapRes!17205))))

(declare-fun condMapEmpty!17205 () Bool)

(declare-fun mapDefault!17205 () ValueCell!4851)

(assert (=> b!408112 (= condMapEmpty!17205 (= (arr!11779 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4851)) mapDefault!17205)))))

(declare-fun b!408113 () Bool)

(declare-fun res!236060 () Bool)

(assert (=> b!408113 (=> (not res!236060) (not e!245006))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408113 (= res!236060 (and (= (size!12131 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12130 _keys!709) (size!12131 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408114 () Bool)

(assert (=> b!408114 (= e!245007 tp_is_empty!10389)))

(declare-fun b!408115 () Bool)

(declare-fun e!245009 () Bool)

(assert (=> b!408115 (= e!245009 false)))

(declare-fun lt!188746 () Bool)

(declare-fun lt!188747 () array!24657)

(assert (=> b!408115 (= lt!188746 (arrayNoDuplicates!0 lt!188747 #b00000000000000000000000000000000 Nil!6824))))

(declare-fun b!408116 () Bool)

(declare-fun res!236059 () Bool)

(assert (=> b!408116 (=> (not res!236059) (not e!245006))))

(assert (=> b!408116 (= res!236059 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12130 _keys!709))))))

(declare-fun b!408117 () Bool)

(declare-fun res!236063 () Bool)

(assert (=> b!408117 (=> (not res!236063) (not e!245006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24657 (_ BitVec 32)) Bool)

(assert (=> b!408117 (= res!236063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408111 () Bool)

(assert (=> b!408111 (= e!245006 e!245009)))

(declare-fun res!236062 () Bool)

(assert (=> b!408111 (=> (not res!236062) (not e!245009))))

(assert (=> b!408111 (= res!236062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188747 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!408111 (= lt!188747 (array!24658 (store (arr!11778 _keys!709) i!563 k0!794) (size!12130 _keys!709)))))

(declare-fun res!236058 () Bool)

(assert (=> start!38970 (=> (not res!236058) (not e!245006))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38970 (= res!236058 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12130 _keys!709))))))

(assert (=> start!38970 e!245006))

(assert (=> start!38970 true))

(declare-fun array_inv!8590 (array!24659) Bool)

(assert (=> start!38970 (and (array_inv!8590 _values!549) e!245008)))

(declare-fun array_inv!8591 (array!24657) Bool)

(assert (=> start!38970 (array_inv!8591 _keys!709)))

(declare-fun b!408118 () Bool)

(declare-fun res!236061 () Bool)

(assert (=> b!408118 (=> (not res!236061) (not e!245006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408118 (= res!236061 (validKeyInArray!0 k0!794))))

(declare-fun b!408119 () Bool)

(declare-fun res!236067 () Bool)

(assert (=> b!408119 (=> (not res!236067) (not e!245006))))

(declare-fun arrayContainsKey!0 (array!24657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408119 (= res!236067 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38970 res!236058) b!408108))

(assert (= (and b!408108 res!236066) b!408113))

(assert (= (and b!408113 res!236060) b!408117))

(assert (= (and b!408117 res!236063) b!408110))

(assert (= (and b!408110 res!236065) b!408116))

(assert (= (and b!408116 res!236059) b!408118))

(assert (= (and b!408118 res!236061) b!408107))

(assert (= (and b!408107 res!236064) b!408119))

(assert (= (and b!408119 res!236067) b!408111))

(assert (= (and b!408111 res!236062) b!408115))

(assert (= (and b!408112 condMapEmpty!17205) mapIsEmpty!17205))

(assert (= (and b!408112 (not condMapEmpty!17205)) mapNonEmpty!17205))

(get-info :version)

(assert (= (and mapNonEmpty!17205 ((_ is ValueCellFull!4851) mapValue!17205)) b!408114))

(assert (= (and b!408112 ((_ is ValueCellFull!4851) mapDefault!17205)) b!408109))

(assert (= start!38970 b!408112))

(declare-fun m!399535 () Bool)

(assert (=> b!408111 m!399535))

(declare-fun m!399537 () Bool)

(assert (=> b!408111 m!399537))

(declare-fun m!399539 () Bool)

(assert (=> b!408115 m!399539))

(declare-fun m!399541 () Bool)

(assert (=> b!408118 m!399541))

(declare-fun m!399543 () Bool)

(assert (=> b!408107 m!399543))

(declare-fun m!399545 () Bool)

(assert (=> start!38970 m!399545))

(declare-fun m!399547 () Bool)

(assert (=> start!38970 m!399547))

(declare-fun m!399549 () Bool)

(assert (=> b!408119 m!399549))

(declare-fun m!399551 () Bool)

(assert (=> mapNonEmpty!17205 m!399551))

(declare-fun m!399553 () Bool)

(assert (=> b!408108 m!399553))

(declare-fun m!399555 () Bool)

(assert (=> b!408110 m!399555))

(declare-fun m!399557 () Bool)

(assert (=> b!408117 m!399557))

(check-sat (not b!408117) (not b!408115) (not b!408110) (not start!38970) (not mapNonEmpty!17205) tp_is_empty!10389 (not b!408118) (not b!408119) (not b!408111) (not b!408108))
(check-sat)
