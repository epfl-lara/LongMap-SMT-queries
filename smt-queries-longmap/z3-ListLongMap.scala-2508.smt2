; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38852 () Bool)

(assert start!38852)

(declare-fun mapNonEmpty!17049 () Bool)

(declare-fun mapRes!17049 () Bool)

(declare-fun tp!33168 () Bool)

(declare-fun e!243896 () Bool)

(assert (=> mapNonEmpty!17049 (= mapRes!17049 (and tp!33168 e!243896))))

(declare-datatypes ((V!14819 0))(
  ( (V!14820 (val!5187 Int)) )
))
(declare-datatypes ((ValueCell!4799 0))(
  ( (ValueCellFull!4799 (v!7428 V!14819)) (EmptyCell!4799) )
))
(declare-datatypes ((array!24445 0))(
  ( (array!24446 (arr!11672 (Array (_ BitVec 32) ValueCell!4799)) (size!12025 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24445)

(declare-fun mapValue!17049 () ValueCell!4799)

(declare-fun mapKey!17049 () (_ BitVec 32))

(declare-fun mapRest!17049 () (Array (_ BitVec 32) ValueCell!4799))

(assert (=> mapNonEmpty!17049 (= (arr!11672 _values!549) (store mapRest!17049 mapKey!17049 mapValue!17049))))

(declare-fun b!405809 () Bool)

(declare-fun res!234373 () Bool)

(declare-fun e!243897 () Bool)

(assert (=> b!405809 (=> (not res!234373) (not e!243897))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24447 0))(
  ( (array!24448 (arr!11673 (Array (_ BitVec 32) (_ BitVec 64))) (size!12026 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24447)

(assert (=> b!405809 (= res!234373 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12026 _keys!709))))))

(declare-fun mapIsEmpty!17049 () Bool)

(assert (=> mapIsEmpty!17049 mapRes!17049))

(declare-fun b!405810 () Bool)

(declare-fun res!234370 () Bool)

(assert (=> b!405810 (=> (not res!234370) (not e!243897))))

(assert (=> b!405810 (= res!234370 (or (= (select (arr!11673 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11673 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405811 () Bool)

(declare-fun e!243895 () Bool)

(declare-fun e!243898 () Bool)

(assert (=> b!405811 (= e!243895 (and e!243898 mapRes!17049))))

(declare-fun condMapEmpty!17049 () Bool)

(declare-fun mapDefault!17049 () ValueCell!4799)

(assert (=> b!405811 (= condMapEmpty!17049 (= (arr!11672 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4799)) mapDefault!17049)))))

(declare-fun b!405812 () Bool)

(declare-fun e!243900 () Bool)

(assert (=> b!405812 (= e!243900 false)))

(declare-fun lt!188201 () Bool)

(declare-fun lt!188200 () array!24447)

(declare-datatypes ((List!6759 0))(
  ( (Nil!6756) (Cons!6755 (h!7611 (_ BitVec 64)) (t!11924 List!6759)) )
))
(declare-fun arrayNoDuplicates!0 (array!24447 (_ BitVec 32) List!6759) Bool)

(assert (=> b!405812 (= lt!188201 (arrayNoDuplicates!0 lt!188200 #b00000000000000000000000000000000 Nil!6756))))

(declare-fun b!405813 () Bool)

(declare-fun res!234372 () Bool)

(assert (=> b!405813 (=> (not res!234372) (not e!243897))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405813 (= res!234372 (validMask!0 mask!1025))))

(declare-fun b!405814 () Bool)

(declare-fun res!234369 () Bool)

(assert (=> b!405814 (=> (not res!234369) (not e!243897))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405814 (= res!234369 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405815 () Bool)

(declare-fun res!234376 () Bool)

(assert (=> b!405815 (=> (not res!234376) (not e!243897))))

(assert (=> b!405815 (= res!234376 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6756))))

(declare-fun b!405816 () Bool)

(declare-fun tp_is_empty!10285 () Bool)

(assert (=> b!405816 (= e!243896 tp_is_empty!10285)))

(declare-fun b!405808 () Bool)

(declare-fun res!234374 () Bool)

(assert (=> b!405808 (=> (not res!234374) (not e!243897))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405808 (= res!234374 (and (= (size!12025 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12026 _keys!709) (size!12025 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!234371 () Bool)

(assert (=> start!38852 (=> (not res!234371) (not e!243897))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38852 (= res!234371 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12026 _keys!709))))))

(assert (=> start!38852 e!243897))

(assert (=> start!38852 true))

(declare-fun array_inv!8562 (array!24445) Bool)

(assert (=> start!38852 (and (array_inv!8562 _values!549) e!243895)))

(declare-fun array_inv!8563 (array!24447) Bool)

(assert (=> start!38852 (array_inv!8563 _keys!709)))

(declare-fun b!405817 () Bool)

(declare-fun res!234378 () Bool)

(assert (=> b!405817 (=> (not res!234378) (not e!243897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405817 (= res!234378 (validKeyInArray!0 k0!794))))

(declare-fun b!405818 () Bool)

(assert (=> b!405818 (= e!243897 e!243900)))

(declare-fun res!234377 () Bool)

(assert (=> b!405818 (=> (not res!234377) (not e!243900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24447 (_ BitVec 32)) Bool)

(assert (=> b!405818 (= res!234377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188200 mask!1025))))

(assert (=> b!405818 (= lt!188200 (array!24448 (store (arr!11673 _keys!709) i!563 k0!794) (size!12026 _keys!709)))))

(declare-fun b!405819 () Bool)

(declare-fun res!234375 () Bool)

(assert (=> b!405819 (=> (not res!234375) (not e!243897))))

(assert (=> b!405819 (= res!234375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405820 () Bool)

(assert (=> b!405820 (= e!243898 tp_is_empty!10285)))

(assert (= (and start!38852 res!234371) b!405813))

(assert (= (and b!405813 res!234372) b!405808))

(assert (= (and b!405808 res!234374) b!405819))

(assert (= (and b!405819 res!234375) b!405815))

(assert (= (and b!405815 res!234376) b!405809))

(assert (= (and b!405809 res!234373) b!405817))

(assert (= (and b!405817 res!234378) b!405810))

(assert (= (and b!405810 res!234370) b!405814))

(assert (= (and b!405814 res!234369) b!405818))

(assert (= (and b!405818 res!234377) b!405812))

(assert (= (and b!405811 condMapEmpty!17049) mapIsEmpty!17049))

(assert (= (and b!405811 (not condMapEmpty!17049)) mapNonEmpty!17049))

(get-info :version)

(assert (= (and mapNonEmpty!17049 ((_ is ValueCellFull!4799) mapValue!17049)) b!405816))

(assert (= (and b!405811 ((_ is ValueCellFull!4799) mapDefault!17049)) b!405820))

(assert (= start!38852 b!405811))

(declare-fun m!397563 () Bool)

(assert (=> b!405819 m!397563))

(declare-fun m!397565 () Bool)

(assert (=> b!405817 m!397565))

(declare-fun m!397567 () Bool)

(assert (=> mapNonEmpty!17049 m!397567))

(declare-fun m!397569 () Bool)

(assert (=> b!405810 m!397569))

(declare-fun m!397571 () Bool)

(assert (=> b!405814 m!397571))

(declare-fun m!397573 () Bool)

(assert (=> b!405815 m!397573))

(declare-fun m!397575 () Bool)

(assert (=> b!405813 m!397575))

(declare-fun m!397577 () Bool)

(assert (=> start!38852 m!397577))

(declare-fun m!397579 () Bool)

(assert (=> start!38852 m!397579))

(declare-fun m!397581 () Bool)

(assert (=> b!405812 m!397581))

(declare-fun m!397583 () Bool)

(assert (=> b!405818 m!397583))

(declare-fun m!397585 () Bool)

(assert (=> b!405818 m!397585))

(check-sat (not b!405818) (not b!405813) (not b!405817) (not mapNonEmpty!17049) tp_is_empty!10285 (not b!405815) (not b!405814) (not start!38852) (not b!405819) (not b!405812))
(check-sat)
