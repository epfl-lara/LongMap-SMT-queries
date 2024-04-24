; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38996 () Bool)

(assert start!38996)

(declare-fun b!408838 () Bool)

(declare-fun res!236661 () Bool)

(declare-fun e!245333 () Bool)

(assert (=> b!408838 (=> (not res!236661) (not e!245333))))

(declare-datatypes ((array!24732 0))(
  ( (array!24733 (arr!11815 (Array (_ BitVec 32) (_ BitVec 64))) (size!12167 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24732)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408838 (= res!236661 (or (= (select (arr!11815 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11815 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408839 () Bool)

(declare-fun e!245337 () Bool)

(declare-fun tp_is_empty!10429 () Bool)

(assert (=> b!408839 (= e!245337 tp_is_empty!10429)))

(declare-fun b!408840 () Bool)

(declare-fun res!236658 () Bool)

(assert (=> b!408840 (=> (not res!236658) (not e!245333))))

(assert (=> b!408840 (= res!236658 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12167 _keys!709))))))

(declare-fun b!408841 () Bool)

(declare-fun e!245336 () Bool)

(declare-fun mapRes!17265 () Bool)

(assert (=> b!408841 (= e!245336 (and e!245337 mapRes!17265))))

(declare-fun condMapEmpty!17265 () Bool)

(declare-datatypes ((V!15011 0))(
  ( (V!15012 (val!5259 Int)) )
))
(declare-datatypes ((ValueCell!4871 0))(
  ( (ValueCellFull!4871 (v!7507 V!15011)) (EmptyCell!4871) )
))
(declare-datatypes ((array!24734 0))(
  ( (array!24735 (arr!11816 (Array (_ BitVec 32) ValueCell!4871)) (size!12168 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24734)

(declare-fun mapDefault!17265 () ValueCell!4871)

(assert (=> b!408841 (= condMapEmpty!17265 (= (arr!11816 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4871)) mapDefault!17265)))))

(declare-fun mapNonEmpty!17265 () Bool)

(declare-fun tp!33384 () Bool)

(declare-fun e!245335 () Bool)

(assert (=> mapNonEmpty!17265 (= mapRes!17265 (and tp!33384 e!245335))))

(declare-fun mapRest!17265 () (Array (_ BitVec 32) ValueCell!4871))

(declare-fun mapValue!17265 () ValueCell!4871)

(declare-fun mapKey!17265 () (_ BitVec 32))

(assert (=> mapNonEmpty!17265 (= (arr!11816 _values!549) (store mapRest!17265 mapKey!17265 mapValue!17265))))

(declare-fun b!408842 () Bool)

(declare-fun res!236664 () Bool)

(assert (=> b!408842 (=> (not res!236664) (not e!245333))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!408842 (= res!236664 (and (= (size!12168 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12167 _keys!709) (size!12168 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408843 () Bool)

(declare-fun res!236656 () Bool)

(assert (=> b!408843 (=> (not res!236656) (not e!245333))))

(declare-datatypes ((List!6716 0))(
  ( (Nil!6713) (Cons!6712 (h!7568 (_ BitVec 64)) (t!11882 List!6716)) )
))
(declare-fun arrayNoDuplicates!0 (array!24732 (_ BitVec 32) List!6716) Bool)

(assert (=> b!408843 (= res!236656 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6713))))

(declare-fun res!236657 () Bool)

(assert (=> start!38996 (=> (not res!236657) (not e!245333))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38996 (= res!236657 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12167 _keys!709))))))

(assert (=> start!38996 e!245333))

(assert (=> start!38996 true))

(declare-fun array_inv!8708 (array!24734) Bool)

(assert (=> start!38996 (and (array_inv!8708 _values!549) e!245336)))

(declare-fun array_inv!8709 (array!24732) Bool)

(assert (=> start!38996 (array_inv!8709 _keys!709)))

(declare-fun mapIsEmpty!17265 () Bool)

(assert (=> mapIsEmpty!17265 mapRes!17265))

(declare-fun b!408844 () Bool)

(declare-fun res!236659 () Bool)

(assert (=> b!408844 (=> (not res!236659) (not e!245333))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408844 (= res!236659 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408845 () Bool)

(declare-fun res!236655 () Bool)

(assert (=> b!408845 (=> (not res!236655) (not e!245333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24732 (_ BitVec 32)) Bool)

(assert (=> b!408845 (= res!236655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408846 () Bool)

(declare-fun e!245338 () Bool)

(assert (=> b!408846 (= e!245338 false)))

(declare-fun lt!188885 () Bool)

(declare-fun lt!188886 () array!24732)

(assert (=> b!408846 (= lt!188885 (arrayNoDuplicates!0 lt!188886 #b00000000000000000000000000000000 Nil!6713))))

(declare-fun b!408847 () Bool)

(declare-fun res!236662 () Bool)

(assert (=> b!408847 (=> (not res!236662) (not e!245333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408847 (= res!236662 (validKeyInArray!0 k0!794))))

(declare-fun b!408848 () Bool)

(declare-fun res!236663 () Bool)

(assert (=> b!408848 (=> (not res!236663) (not e!245333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408848 (= res!236663 (validMask!0 mask!1025))))

(declare-fun b!408849 () Bool)

(assert (=> b!408849 (= e!245335 tp_is_empty!10429)))

(declare-fun b!408850 () Bool)

(assert (=> b!408850 (= e!245333 e!245338)))

(declare-fun res!236660 () Bool)

(assert (=> b!408850 (=> (not res!236660) (not e!245338))))

(assert (=> b!408850 (= res!236660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188886 mask!1025))))

(assert (=> b!408850 (= lt!188886 (array!24733 (store (arr!11815 _keys!709) i!563 k0!794) (size!12167 _keys!709)))))

(assert (= (and start!38996 res!236657) b!408848))

(assert (= (and b!408848 res!236663) b!408842))

(assert (= (and b!408842 res!236664) b!408845))

(assert (= (and b!408845 res!236655) b!408843))

(assert (= (and b!408843 res!236656) b!408840))

(assert (= (and b!408840 res!236658) b!408847))

(assert (= (and b!408847 res!236662) b!408838))

(assert (= (and b!408838 res!236661) b!408844))

(assert (= (and b!408844 res!236659) b!408850))

(assert (= (and b!408850 res!236660) b!408846))

(assert (= (and b!408841 condMapEmpty!17265) mapIsEmpty!17265))

(assert (= (and b!408841 (not condMapEmpty!17265)) mapNonEmpty!17265))

(get-info :version)

(assert (= (and mapNonEmpty!17265 ((_ is ValueCellFull!4871) mapValue!17265)) b!408849))

(assert (= (and b!408841 ((_ is ValueCellFull!4871) mapDefault!17265)) b!408839))

(assert (= start!38996 b!408841))

(declare-fun m!400245 () Bool)

(assert (=> b!408846 m!400245))

(declare-fun m!400247 () Bool)

(assert (=> b!408838 m!400247))

(declare-fun m!400249 () Bool)

(assert (=> mapNonEmpty!17265 m!400249))

(declare-fun m!400251 () Bool)

(assert (=> b!408847 m!400251))

(declare-fun m!400253 () Bool)

(assert (=> b!408848 m!400253))

(declare-fun m!400255 () Bool)

(assert (=> start!38996 m!400255))

(declare-fun m!400257 () Bool)

(assert (=> start!38996 m!400257))

(declare-fun m!400259 () Bool)

(assert (=> b!408850 m!400259))

(declare-fun m!400261 () Bool)

(assert (=> b!408850 m!400261))

(declare-fun m!400263 () Bool)

(assert (=> b!408845 m!400263))

(declare-fun m!400265 () Bool)

(assert (=> b!408844 m!400265))

(declare-fun m!400267 () Bool)

(assert (=> b!408843 m!400267))

(check-sat (not b!408845) (not mapNonEmpty!17265) (not b!408844) (not b!408847) (not start!38996) (not b!408848) (not b!408850) (not b!408843) (not b!408846) tp_is_empty!10429)
(check-sat)
