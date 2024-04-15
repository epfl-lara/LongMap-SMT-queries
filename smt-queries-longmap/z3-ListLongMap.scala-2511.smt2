; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38870 () Bool)

(assert start!38870)

(declare-fun mapIsEmpty!17076 () Bool)

(declare-fun mapRes!17076 () Bool)

(assert (=> mapIsEmpty!17076 mapRes!17076))

(declare-fun b!406159 () Bool)

(declare-fun res!234646 () Bool)

(declare-fun e!244059 () Bool)

(assert (=> b!406159 (=> (not res!234646) (not e!244059))))

(declare-datatypes ((array!24481 0))(
  ( (array!24482 (arr!11690 (Array (_ BitVec 32) (_ BitVec 64))) (size!12043 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24481)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406159 (= res!234646 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406160 () Bool)

(declare-fun e!244060 () Bool)

(declare-fun tp_is_empty!10303 () Bool)

(assert (=> b!406160 (= e!244060 tp_is_empty!10303)))

(declare-fun b!406161 () Bool)

(declare-fun e!244062 () Bool)

(assert (=> b!406161 (= e!244062 tp_is_empty!10303)))

(declare-fun b!406162 () Bool)

(declare-fun res!234642 () Bool)

(assert (=> b!406162 (=> (not res!234642) (not e!244059))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406162 (= res!234642 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12043 _keys!709))))))

(declare-fun b!406163 () Bool)

(declare-fun e!244058 () Bool)

(assert (=> b!406163 (= e!244058 (and e!244060 mapRes!17076))))

(declare-fun condMapEmpty!17076 () Bool)

(declare-datatypes ((V!14843 0))(
  ( (V!14844 (val!5196 Int)) )
))
(declare-datatypes ((ValueCell!4808 0))(
  ( (ValueCellFull!4808 (v!7437 V!14843)) (EmptyCell!4808) )
))
(declare-datatypes ((array!24483 0))(
  ( (array!24484 (arr!11691 (Array (_ BitVec 32) ValueCell!4808)) (size!12044 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24483)

(declare-fun mapDefault!17076 () ValueCell!4808)

(assert (=> b!406163 (= condMapEmpty!17076 (= (arr!11691 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4808)) mapDefault!17076)))))

(declare-fun b!406164 () Bool)

(declare-fun e!244057 () Bool)

(assert (=> b!406164 (= e!244057 false)))

(declare-fun lt!188254 () Bool)

(declare-fun lt!188255 () array!24481)

(declare-datatypes ((List!6767 0))(
  ( (Nil!6764) (Cons!6763 (h!7619 (_ BitVec 64)) (t!11932 List!6767)) )
))
(declare-fun arrayNoDuplicates!0 (array!24481 (_ BitVec 32) List!6767) Bool)

(assert (=> b!406164 (= lt!188254 (arrayNoDuplicates!0 lt!188255 #b00000000000000000000000000000000 Nil!6764))))

(declare-fun b!406165 () Bool)

(declare-fun res!234647 () Bool)

(assert (=> b!406165 (=> (not res!234647) (not e!244059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406165 (= res!234647 (validKeyInArray!0 k0!794))))

(declare-fun res!234641 () Bool)

(assert (=> start!38870 (=> (not res!234641) (not e!244059))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38870 (= res!234641 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12043 _keys!709))))))

(assert (=> start!38870 e!244059))

(assert (=> start!38870 true))

(declare-fun array_inv!8578 (array!24483) Bool)

(assert (=> start!38870 (and (array_inv!8578 _values!549) e!244058)))

(declare-fun array_inv!8579 (array!24481) Bool)

(assert (=> start!38870 (array_inv!8579 _keys!709)))

(declare-fun b!406166 () Bool)

(declare-fun res!234644 () Bool)

(assert (=> b!406166 (=> (not res!234644) (not e!244059))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406166 (= res!234644 (validMask!0 mask!1025))))

(declare-fun b!406167 () Bool)

(declare-fun res!234643 () Bool)

(assert (=> b!406167 (=> (not res!234643) (not e!244059))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406167 (= res!234643 (and (= (size!12044 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12043 _keys!709) (size!12044 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406168 () Bool)

(declare-fun res!234645 () Bool)

(assert (=> b!406168 (=> (not res!234645) (not e!244059))))

(assert (=> b!406168 (= res!234645 (or (= (select (arr!11690 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11690 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406169 () Bool)

(declare-fun res!234639 () Bool)

(assert (=> b!406169 (=> (not res!234639) (not e!244059))))

(assert (=> b!406169 (= res!234639 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6764))))

(declare-fun b!406170 () Bool)

(assert (=> b!406170 (= e!244059 e!244057)))

(declare-fun res!234640 () Bool)

(assert (=> b!406170 (=> (not res!234640) (not e!244057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24481 (_ BitVec 32)) Bool)

(assert (=> b!406170 (= res!234640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188255 mask!1025))))

(assert (=> b!406170 (= lt!188255 (array!24482 (store (arr!11690 _keys!709) i!563 k0!794) (size!12043 _keys!709)))))

(declare-fun mapNonEmpty!17076 () Bool)

(declare-fun tp!33195 () Bool)

(assert (=> mapNonEmpty!17076 (= mapRes!17076 (and tp!33195 e!244062))))

(declare-fun mapKey!17076 () (_ BitVec 32))

(declare-fun mapRest!17076 () (Array (_ BitVec 32) ValueCell!4808))

(declare-fun mapValue!17076 () ValueCell!4808)

(assert (=> mapNonEmpty!17076 (= (arr!11691 _values!549) (store mapRest!17076 mapKey!17076 mapValue!17076))))

(declare-fun b!406171 () Bool)

(declare-fun res!234648 () Bool)

(assert (=> b!406171 (=> (not res!234648) (not e!244059))))

(assert (=> b!406171 (= res!234648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38870 res!234641) b!406166))

(assert (= (and b!406166 res!234644) b!406167))

(assert (= (and b!406167 res!234643) b!406171))

(assert (= (and b!406171 res!234648) b!406169))

(assert (= (and b!406169 res!234639) b!406162))

(assert (= (and b!406162 res!234642) b!406165))

(assert (= (and b!406165 res!234647) b!406168))

(assert (= (and b!406168 res!234645) b!406159))

(assert (= (and b!406159 res!234646) b!406170))

(assert (= (and b!406170 res!234640) b!406164))

(assert (= (and b!406163 condMapEmpty!17076) mapIsEmpty!17076))

(assert (= (and b!406163 (not condMapEmpty!17076)) mapNonEmpty!17076))

(get-info :version)

(assert (= (and mapNonEmpty!17076 ((_ is ValueCellFull!4808) mapValue!17076)) b!406161))

(assert (= (and b!406163 ((_ is ValueCellFull!4808) mapDefault!17076)) b!406160))

(assert (= start!38870 b!406163))

(declare-fun m!397779 () Bool)

(assert (=> b!406164 m!397779))

(declare-fun m!397781 () Bool)

(assert (=> b!406166 m!397781))

(declare-fun m!397783 () Bool)

(assert (=> b!406170 m!397783))

(declare-fun m!397785 () Bool)

(assert (=> b!406170 m!397785))

(declare-fun m!397787 () Bool)

(assert (=> b!406168 m!397787))

(declare-fun m!397789 () Bool)

(assert (=> b!406159 m!397789))

(declare-fun m!397791 () Bool)

(assert (=> b!406169 m!397791))

(declare-fun m!397793 () Bool)

(assert (=> mapNonEmpty!17076 m!397793))

(declare-fun m!397795 () Bool)

(assert (=> b!406171 m!397795))

(declare-fun m!397797 () Bool)

(assert (=> start!38870 m!397797))

(declare-fun m!397799 () Bool)

(assert (=> start!38870 m!397799))

(declare-fun m!397801 () Bool)

(assert (=> b!406165 m!397801))

(check-sat tp_is_empty!10303 (not b!406170) (not b!406159) (not b!406166) (not b!406169) (not b!406165) (not mapNonEmpty!17076) (not start!38870) (not b!406171) (not b!406164))
(check-sat)
