; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39006 () Bool)

(assert start!39006)

(declare-fun b!408809 () Bool)

(declare-fun res!236602 () Bool)

(declare-fun e!245333 () Bool)

(assert (=> b!408809 (=> (not res!236602) (not e!245333))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24725 0))(
  ( (array!24726 (arr!11812 (Array (_ BitVec 32) (_ BitVec 64))) (size!12164 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24725)

(assert (=> b!408809 (= res!236602 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12164 _keys!709))))))

(declare-fun b!408810 () Bool)

(declare-fun res!236601 () Bool)

(assert (=> b!408810 (=> (not res!236601) (not e!245333))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408810 (= res!236601 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408811 () Bool)

(declare-fun res!236604 () Bool)

(assert (=> b!408811 (=> (not res!236604) (not e!245333))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15005 0))(
  ( (V!15006 (val!5257 Int)) )
))
(declare-datatypes ((ValueCell!4869 0))(
  ( (ValueCellFull!4869 (v!7504 V!15005)) (EmptyCell!4869) )
))
(declare-datatypes ((array!24727 0))(
  ( (array!24728 (arr!11813 (Array (_ BitVec 32) ValueCell!4869)) (size!12165 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24727)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!408811 (= res!236604 (and (= (size!12165 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12164 _keys!709) (size!12165 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408812 () Bool)

(declare-fun e!245329 () Bool)

(declare-fun tp_is_empty!10425 () Bool)

(assert (=> b!408812 (= e!245329 tp_is_empty!10425)))

(declare-fun b!408813 () Bool)

(declare-fun res!236606 () Bool)

(assert (=> b!408813 (=> (not res!236606) (not e!245333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408813 (= res!236606 (validMask!0 mask!1025))))

(declare-fun b!408814 () Bool)

(declare-fun e!245332 () Bool)

(declare-fun mapRes!17259 () Bool)

(assert (=> b!408814 (= e!245332 (and e!245329 mapRes!17259))))

(declare-fun condMapEmpty!17259 () Bool)

(declare-fun mapDefault!17259 () ValueCell!4869)

(assert (=> b!408814 (= condMapEmpty!17259 (= (arr!11813 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4869)) mapDefault!17259)))))

(declare-fun b!408815 () Bool)

(declare-fun res!236605 () Bool)

(assert (=> b!408815 (=> (not res!236605) (not e!245333))))

(assert (=> b!408815 (= res!236605 (or (= (select (arr!11812 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11812 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17259 () Bool)

(declare-fun tp!33378 () Bool)

(declare-fun e!245334 () Bool)

(assert (=> mapNonEmpty!17259 (= mapRes!17259 (and tp!33378 e!245334))))

(declare-fun mapRest!17259 () (Array (_ BitVec 32) ValueCell!4869))

(declare-fun mapValue!17259 () ValueCell!4869)

(declare-fun mapKey!17259 () (_ BitVec 32))

(assert (=> mapNonEmpty!17259 (= (arr!11813 _values!549) (store mapRest!17259 mapKey!17259 mapValue!17259))))

(declare-fun b!408816 () Bool)

(declare-fun res!236603 () Bool)

(assert (=> b!408816 (=> (not res!236603) (not e!245333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24725 (_ BitVec 32)) Bool)

(assert (=> b!408816 (= res!236603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!236599 () Bool)

(assert (=> start!39006 (=> (not res!236599) (not e!245333))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39006 (= res!236599 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12164 _keys!709))))))

(assert (=> start!39006 e!245333))

(assert (=> start!39006 true))

(declare-fun array_inv!8618 (array!24727) Bool)

(assert (=> start!39006 (and (array_inv!8618 _values!549) e!245332)))

(declare-fun array_inv!8619 (array!24725) Bool)

(assert (=> start!39006 (array_inv!8619 _keys!709)))

(declare-fun b!408817 () Bool)

(declare-fun e!245330 () Bool)

(assert (=> b!408817 (= e!245333 e!245330)))

(declare-fun res!236600 () Bool)

(assert (=> b!408817 (=> (not res!236600) (not e!245330))))

(declare-fun lt!188855 () array!24725)

(assert (=> b!408817 (= res!236600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188855 mask!1025))))

(assert (=> b!408817 (= lt!188855 (array!24726 (store (arr!11812 _keys!709) i!563 k0!794) (size!12164 _keys!709)))))

(declare-fun b!408818 () Bool)

(declare-fun res!236598 () Bool)

(assert (=> b!408818 (=> (not res!236598) (not e!245333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408818 (= res!236598 (validKeyInArray!0 k0!794))))

(declare-fun b!408819 () Bool)

(assert (=> b!408819 (= e!245330 false)))

(declare-fun lt!188854 () Bool)

(declare-datatypes ((List!6841 0))(
  ( (Nil!6838) (Cons!6837 (h!7693 (_ BitVec 64)) (t!12015 List!6841)) )
))
(declare-fun arrayNoDuplicates!0 (array!24725 (_ BitVec 32) List!6841) Bool)

(assert (=> b!408819 (= lt!188854 (arrayNoDuplicates!0 lt!188855 #b00000000000000000000000000000000 Nil!6838))))

(declare-fun mapIsEmpty!17259 () Bool)

(assert (=> mapIsEmpty!17259 mapRes!17259))

(declare-fun b!408820 () Bool)

(assert (=> b!408820 (= e!245334 tp_is_empty!10425)))

(declare-fun b!408821 () Bool)

(declare-fun res!236607 () Bool)

(assert (=> b!408821 (=> (not res!236607) (not e!245333))))

(assert (=> b!408821 (= res!236607 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6838))))

(assert (= (and start!39006 res!236599) b!408813))

(assert (= (and b!408813 res!236606) b!408811))

(assert (= (and b!408811 res!236604) b!408816))

(assert (= (and b!408816 res!236603) b!408821))

(assert (= (and b!408821 res!236607) b!408809))

(assert (= (and b!408809 res!236602) b!408818))

(assert (= (and b!408818 res!236598) b!408815))

(assert (= (and b!408815 res!236605) b!408810))

(assert (= (and b!408810 res!236601) b!408817))

(assert (= (and b!408817 res!236600) b!408819))

(assert (= (and b!408814 condMapEmpty!17259) mapIsEmpty!17259))

(assert (= (and b!408814 (not condMapEmpty!17259)) mapNonEmpty!17259))

(get-info :version)

(assert (= (and mapNonEmpty!17259 ((_ is ValueCellFull!4869) mapValue!17259)) b!408820))

(assert (= (and b!408814 ((_ is ValueCellFull!4869) mapDefault!17259)) b!408812))

(assert (= start!39006 b!408814))

(declare-fun m!399967 () Bool)

(assert (=> mapNonEmpty!17259 m!399967))

(declare-fun m!399969 () Bool)

(assert (=> b!408815 m!399969))

(declare-fun m!399971 () Bool)

(assert (=> start!39006 m!399971))

(declare-fun m!399973 () Bool)

(assert (=> start!39006 m!399973))

(declare-fun m!399975 () Bool)

(assert (=> b!408821 m!399975))

(declare-fun m!399977 () Bool)

(assert (=> b!408816 m!399977))

(declare-fun m!399979 () Bool)

(assert (=> b!408813 m!399979))

(declare-fun m!399981 () Bool)

(assert (=> b!408819 m!399981))

(declare-fun m!399983 () Bool)

(assert (=> b!408818 m!399983))

(declare-fun m!399985 () Bool)

(assert (=> b!408817 m!399985))

(declare-fun m!399987 () Bool)

(assert (=> b!408817 m!399987))

(declare-fun m!399989 () Bool)

(assert (=> b!408810 m!399989))

(check-sat (not mapNonEmpty!17259) (not b!408819) (not b!408810) (not b!408818) (not b!408813) (not b!408821) (not start!39006) (not b!408816) tp_is_empty!10425 (not b!408817))
(check-sat)
