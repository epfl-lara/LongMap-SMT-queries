; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82696 () Bool)

(assert start!82696)

(declare-fun b!962633 () Bool)

(declare-fun e!542924 () Bool)

(declare-fun tp_is_empty!21463 () Bool)

(assert (=> b!962633 (= e!542924 tp_is_empty!21463)))

(declare-fun b!962634 () Bool)

(declare-fun res!643963 () Bool)

(declare-fun e!542926 () Bool)

(assert (=> b!962634 (=> (not res!643963) (not e!542926))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33601 0))(
  ( (V!33602 (val!10782 Int)) )
))
(declare-datatypes ((ValueCell!10250 0))(
  ( (ValueCellFull!10250 (v!13337 V!33601)) (EmptyCell!10250) )
))
(declare-datatypes ((array!59044 0))(
  ( (array!59045 (arr!28386 (Array (_ BitVec 32) ValueCell!10250)) (size!28866 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59044)

(declare-datatypes ((array!59046 0))(
  ( (array!59047 (arr!28387 (Array (_ BitVec 32) (_ BitVec 64))) (size!28867 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59046)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962634 (= res!643963 (and (= (size!28866 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28867 _keys!1686) (size!28866 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962636 () Bool)

(declare-fun e!542925 () Bool)

(assert (=> b!962636 (= e!542925 tp_is_empty!21463)))

(declare-fun mapIsEmpty!34189 () Bool)

(declare-fun mapRes!34189 () Bool)

(assert (=> mapIsEmpty!34189 mapRes!34189))

(declare-fun mapNonEmpty!34189 () Bool)

(declare-fun tp!65119 () Bool)

(assert (=> mapNonEmpty!34189 (= mapRes!34189 (and tp!65119 e!542925))))

(declare-fun mapRest!34189 () (Array (_ BitVec 32) ValueCell!10250))

(declare-fun mapKey!34189 () (_ BitVec 32))

(declare-fun mapValue!34189 () ValueCell!10250)

(assert (=> mapNonEmpty!34189 (= (arr!28386 _values!1400) (store mapRest!34189 mapKey!34189 mapValue!34189))))

(declare-fun b!962635 () Bool)

(declare-fun res!643965 () Bool)

(assert (=> b!962635 (=> (not res!643965) (not e!542926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59046 (_ BitVec 32)) Bool)

(assert (=> b!962635 (= res!643965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!643964 () Bool)

(assert (=> start!82696 (=> (not res!643964) (not e!542926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82696 (= res!643964 (validMask!0 mask!2110))))

(assert (=> start!82696 e!542926))

(assert (=> start!82696 true))

(declare-fun e!542923 () Bool)

(declare-fun array_inv!22071 (array!59044) Bool)

(assert (=> start!82696 (and (array_inv!22071 _values!1400) e!542923)))

(declare-fun array_inv!22072 (array!59046) Bool)

(assert (=> start!82696 (array_inv!22072 _keys!1686)))

(declare-fun b!962637 () Bool)

(assert (=> b!962637 (= e!542923 (and e!542924 mapRes!34189))))

(declare-fun condMapEmpty!34189 () Bool)

(declare-fun mapDefault!34189 () ValueCell!10250)

(assert (=> b!962637 (= condMapEmpty!34189 (= (arr!28386 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10250)) mapDefault!34189)))))

(declare-fun b!962638 () Bool)

(assert (=> b!962638 (= e!542926 false)))

(declare-fun lt!431165 () Bool)

(declare-datatypes ((List!19679 0))(
  ( (Nil!19676) (Cons!19675 (h!20843 (_ BitVec 64)) (t!28034 List!19679)) )
))
(declare-fun arrayNoDuplicates!0 (array!59046 (_ BitVec 32) List!19679) Bool)

(assert (=> b!962638 (= lt!431165 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19676))))

(assert (= (and start!82696 res!643964) b!962634))

(assert (= (and b!962634 res!643963) b!962635))

(assert (= (and b!962635 res!643965) b!962638))

(assert (= (and b!962637 condMapEmpty!34189) mapIsEmpty!34189))

(assert (= (and b!962637 (not condMapEmpty!34189)) mapNonEmpty!34189))

(get-info :version)

(assert (= (and mapNonEmpty!34189 ((_ is ValueCellFull!10250) mapValue!34189)) b!962636))

(assert (= (and b!962637 ((_ is ValueCellFull!10250) mapDefault!34189)) b!962633))

(assert (= start!82696 b!962637))

(declare-fun m!892879 () Bool)

(assert (=> mapNonEmpty!34189 m!892879))

(declare-fun m!892881 () Bool)

(assert (=> b!962635 m!892881))

(declare-fun m!892883 () Bool)

(assert (=> start!82696 m!892883))

(declare-fun m!892885 () Bool)

(assert (=> start!82696 m!892885))

(declare-fun m!892887 () Bool)

(assert (=> start!82696 m!892887))

(declare-fun m!892889 () Bool)

(assert (=> b!962638 m!892889))

(check-sat (not start!82696) tp_is_empty!21463 (not b!962638) (not mapNonEmpty!34189) (not b!962635))
(check-sat)
