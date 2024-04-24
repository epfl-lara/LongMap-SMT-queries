; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82924 () Bool)

(assert start!82924)

(declare-fun b_free!18889 () Bool)

(declare-fun b_next!18889 () Bool)

(assert (=> start!82924 (= b_free!18889 (not b_next!18889))))

(declare-fun tp!65787 () Bool)

(declare-fun b_and!30387 () Bool)

(assert (=> start!82924 (= tp!65787 b_and!30387)))

(declare-fun mapNonEmpty!34531 () Bool)

(declare-fun mapRes!34531 () Bool)

(declare-fun tp!65788 () Bool)

(declare-fun e!544717 () Bool)

(assert (=> mapNonEmpty!34531 (= mapRes!34531 (and tp!65788 e!544717))))

(declare-datatypes ((V!33905 0))(
  ( (V!33906 (val!10896 Int)) )
))
(declare-datatypes ((ValueCell!10364 0))(
  ( (ValueCellFull!10364 (v!13451 V!33905)) (EmptyCell!10364) )
))
(declare-fun mapValue!34531 () ValueCell!10364)

(declare-datatypes ((array!59486 0))(
  ( (array!59487 (arr!28607 (Array (_ BitVec 32) ValueCell!10364)) (size!29087 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59486)

(declare-fun mapKey!34531 () (_ BitVec 32))

(declare-fun mapRest!34531 () (Array (_ BitVec 32) ValueCell!10364))

(assert (=> mapNonEmpty!34531 (= (arr!28607 _values!1400) (store mapRest!34531 mapKey!34531 mapValue!34531))))

(declare-fun res!646455 () Bool)

(declare-fun e!544718 () Bool)

(assert (=> start!82924 (=> (not res!646455) (not e!544718))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82924 (= res!646455 (validMask!0 mask!2110))))

(assert (=> start!82924 e!544718))

(assert (=> start!82924 true))

(declare-fun e!544715 () Bool)

(declare-fun array_inv!22217 (array!59486) Bool)

(assert (=> start!82924 (and (array_inv!22217 _values!1400) e!544715)))

(declare-datatypes ((array!59488 0))(
  ( (array!59489 (arr!28608 (Array (_ BitVec 32) (_ BitVec 64))) (size!29088 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59488)

(declare-fun array_inv!22218 (array!59488) Bool)

(assert (=> start!82924 (array_inv!22218 _keys!1686)))

(assert (=> start!82924 tp!65787))

(declare-fun tp_is_empty!21691 () Bool)

(assert (=> start!82924 tp_is_empty!21691))

(declare-fun b!966149 () Bool)

(declare-fun res!646457 () Bool)

(assert (=> b!966149 (=> (not res!646457) (not e!544718))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966149 (= res!646457 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29088 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29088 _keys!1686))))))

(declare-fun b!966150 () Bool)

(declare-fun e!544714 () Bool)

(assert (=> b!966150 (= e!544715 (and e!544714 mapRes!34531))))

(declare-fun condMapEmpty!34531 () Bool)

(declare-fun mapDefault!34531 () ValueCell!10364)

(assert (=> b!966150 (= condMapEmpty!34531 (= (arr!28607 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10364)) mapDefault!34531)))))

(declare-fun mapIsEmpty!34531 () Bool)

(assert (=> mapIsEmpty!34531 mapRes!34531))

(declare-fun b!966151 () Bool)

(declare-fun res!646458 () Bool)

(assert (=> b!966151 (=> (not res!646458) (not e!544718))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!966151 (= res!646458 (and (= (size!29087 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29088 _keys!1686) (size!29087 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966152 () Bool)

(declare-fun res!646453 () Bool)

(assert (=> b!966152 (=> (not res!646453) (not e!544718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966152 (= res!646453 (validKeyInArray!0 (select (arr!28608 _keys!1686) i!803)))))

(declare-fun b!966153 () Bool)

(declare-fun res!646456 () Bool)

(assert (=> b!966153 (=> (not res!646456) (not e!544718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59488 (_ BitVec 32)) Bool)

(assert (=> b!966153 (= res!646456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966154 () Bool)

(declare-fun res!646454 () Bool)

(assert (=> b!966154 (=> (not res!646454) (not e!544718))))

(declare-datatypes ((List!19841 0))(
  ( (Nil!19838) (Cons!19837 (h!21005 (_ BitVec 64)) (t!28196 List!19841)) )
))
(declare-fun arrayNoDuplicates!0 (array!59488 (_ BitVec 32) List!19841) Bool)

(assert (=> b!966154 (= res!646454 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19838))))

(declare-fun b!966155 () Bool)

(assert (=> b!966155 (= e!544718 false)))

(declare-fun minValue!1342 () V!33905)

(declare-fun zeroValue!1342 () V!33905)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431579 () Bool)

(declare-datatypes ((tuple2!13996 0))(
  ( (tuple2!13997 (_1!7009 (_ BitVec 64)) (_2!7009 V!33905)) )
))
(declare-datatypes ((List!19842 0))(
  ( (Nil!19839) (Cons!19838 (h!21006 tuple2!13996) (t!28197 List!19842)) )
))
(declare-datatypes ((ListLongMap!12695 0))(
  ( (ListLongMap!12696 (toList!6363 List!19842)) )
))
(declare-fun contains!5478 (ListLongMap!12695 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3596 (array!59488 array!59486 (_ BitVec 32) (_ BitVec 32) V!33905 V!33905 (_ BitVec 32) Int) ListLongMap!12695)

(assert (=> b!966155 (= lt!431579 (contains!5478 (getCurrentListMap!3596 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28608 _keys!1686) i!803)))))

(declare-fun b!966156 () Bool)

(assert (=> b!966156 (= e!544717 tp_is_empty!21691)))

(declare-fun b!966157 () Bool)

(assert (=> b!966157 (= e!544714 tp_is_empty!21691)))

(assert (= (and start!82924 res!646455) b!966151))

(assert (= (and b!966151 res!646458) b!966153))

(assert (= (and b!966153 res!646456) b!966154))

(assert (= (and b!966154 res!646454) b!966149))

(assert (= (and b!966149 res!646457) b!966152))

(assert (= (and b!966152 res!646453) b!966155))

(assert (= (and b!966150 condMapEmpty!34531) mapIsEmpty!34531))

(assert (= (and b!966150 (not condMapEmpty!34531)) mapNonEmpty!34531))

(get-info :version)

(assert (= (and mapNonEmpty!34531 ((_ is ValueCellFull!10364) mapValue!34531)) b!966156))

(assert (= (and b!966150 ((_ is ValueCellFull!10364) mapDefault!34531)) b!966157))

(assert (= start!82924 b!966150))

(declare-fun m!895663 () Bool)

(assert (=> start!82924 m!895663))

(declare-fun m!895665 () Bool)

(assert (=> start!82924 m!895665))

(declare-fun m!895667 () Bool)

(assert (=> start!82924 m!895667))

(declare-fun m!895669 () Bool)

(assert (=> b!966154 m!895669))

(declare-fun m!895671 () Bool)

(assert (=> b!966152 m!895671))

(assert (=> b!966152 m!895671))

(declare-fun m!895673 () Bool)

(assert (=> b!966152 m!895673))

(declare-fun m!895675 () Bool)

(assert (=> b!966155 m!895675))

(assert (=> b!966155 m!895671))

(assert (=> b!966155 m!895675))

(assert (=> b!966155 m!895671))

(declare-fun m!895677 () Bool)

(assert (=> b!966155 m!895677))

(declare-fun m!895679 () Bool)

(assert (=> mapNonEmpty!34531 m!895679))

(declare-fun m!895681 () Bool)

(assert (=> b!966153 m!895681))

(check-sat b_and!30387 (not start!82924) (not mapNonEmpty!34531) (not b!966152) tp_is_empty!21691 (not b!966154) (not b_next!18889) (not b!966153) (not b!966155))
(check-sat b_and!30387 (not b_next!18889))
