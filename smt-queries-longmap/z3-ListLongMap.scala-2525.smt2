; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38954 () Bool)

(assert start!38954)

(declare-fun res!235902 () Bool)

(declare-fun e!244814 () Bool)

(assert (=> start!38954 (=> (not res!235902) (not e!244814))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24641 0))(
  ( (array!24642 (arr!11770 (Array (_ BitVec 32) (_ BitVec 64))) (size!12123 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24641)

(assert (=> start!38954 (= res!235902 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12123 _keys!709))))))

(assert (=> start!38954 e!244814))

(assert (=> start!38954 true))

(declare-datatypes ((V!14955 0))(
  ( (V!14956 (val!5238 Int)) )
))
(declare-datatypes ((ValueCell!4850 0))(
  ( (ValueCellFull!4850 (v!7479 V!14955)) (EmptyCell!4850) )
))
(declare-datatypes ((array!24643 0))(
  ( (array!24644 (arr!11771 (Array (_ BitVec 32) ValueCell!4850)) (size!12124 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24643)

(declare-fun e!244818 () Bool)

(declare-fun array_inv!8632 (array!24643) Bool)

(assert (=> start!38954 (and (array_inv!8632 _values!549) e!244818)))

(declare-fun array_inv!8633 (array!24641) Bool)

(assert (=> start!38954 (array_inv!8633 _keys!709)))

(declare-fun b!407797 () Bool)

(declare-fun res!235900 () Bool)

(assert (=> b!407797 (=> (not res!235900) (not e!244814))))

(declare-datatypes ((List!6799 0))(
  ( (Nil!6796) (Cons!6795 (h!7651 (_ BitVec 64)) (t!11964 List!6799)) )
))
(declare-fun arrayNoDuplicates!0 (array!24641 (_ BitVec 32) List!6799) Bool)

(assert (=> b!407797 (= res!235900 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6796))))

(declare-fun b!407798 () Bool)

(declare-fun res!235905 () Bool)

(assert (=> b!407798 (=> (not res!235905) (not e!244814))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407798 (= res!235905 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12123 _keys!709))))))

(declare-fun b!407799 () Bool)

(declare-fun e!244816 () Bool)

(assert (=> b!407799 (= e!244814 e!244816)))

(declare-fun res!235907 () Bool)

(assert (=> b!407799 (=> (not res!235907) (not e!244816))))

(declare-fun lt!188507 () array!24641)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24641 (_ BitVec 32)) Bool)

(assert (=> b!407799 (= res!235907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188507 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!407799 (= lt!188507 (array!24642 (store (arr!11770 _keys!709) i!563 k0!794) (size!12123 _keys!709)))))

(declare-fun b!407800 () Bool)

(declare-fun res!235904 () Bool)

(assert (=> b!407800 (=> (not res!235904) (not e!244814))))

(declare-fun arrayContainsKey!0 (array!24641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407800 (= res!235904 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407801 () Bool)

(declare-fun e!244815 () Bool)

(declare-fun mapRes!17202 () Bool)

(assert (=> b!407801 (= e!244818 (and e!244815 mapRes!17202))))

(declare-fun condMapEmpty!17202 () Bool)

(declare-fun mapDefault!17202 () ValueCell!4850)

(assert (=> b!407801 (= condMapEmpty!17202 (= (arr!11771 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4850)) mapDefault!17202)))))

(declare-fun b!407802 () Bool)

(declare-fun res!235899 () Bool)

(assert (=> b!407802 (=> (not res!235899) (not e!244814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407802 (= res!235899 (validKeyInArray!0 k0!794))))

(declare-fun b!407803 () Bool)

(declare-fun res!235906 () Bool)

(assert (=> b!407803 (=> (not res!235906) (not e!244814))))

(assert (=> b!407803 (= res!235906 (or (= (select (arr!11770 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11770 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407804 () Bool)

(declare-fun e!244817 () Bool)

(declare-fun tp_is_empty!10387 () Bool)

(assert (=> b!407804 (= e!244817 tp_is_empty!10387)))

(declare-fun b!407805 () Bool)

(declare-fun res!235903 () Bool)

(assert (=> b!407805 (=> (not res!235903) (not e!244814))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407805 (= res!235903 (and (= (size!12124 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12123 _keys!709) (size!12124 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407806 () Bool)

(assert (=> b!407806 (= e!244816 false)))

(declare-fun lt!188506 () Bool)

(assert (=> b!407806 (= lt!188506 (arrayNoDuplicates!0 lt!188507 #b00000000000000000000000000000000 Nil!6796))))

(declare-fun mapNonEmpty!17202 () Bool)

(declare-fun tp!33321 () Bool)

(assert (=> mapNonEmpty!17202 (= mapRes!17202 (and tp!33321 e!244817))))

(declare-fun mapRest!17202 () (Array (_ BitVec 32) ValueCell!4850))

(declare-fun mapValue!17202 () ValueCell!4850)

(declare-fun mapKey!17202 () (_ BitVec 32))

(assert (=> mapNonEmpty!17202 (= (arr!11771 _values!549) (store mapRest!17202 mapKey!17202 mapValue!17202))))

(declare-fun mapIsEmpty!17202 () Bool)

(assert (=> mapIsEmpty!17202 mapRes!17202))

(declare-fun b!407807 () Bool)

(assert (=> b!407807 (= e!244815 tp_is_empty!10387)))

(declare-fun b!407808 () Bool)

(declare-fun res!235908 () Bool)

(assert (=> b!407808 (=> (not res!235908) (not e!244814))))

(assert (=> b!407808 (= res!235908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407809 () Bool)

(declare-fun res!235901 () Bool)

(assert (=> b!407809 (=> (not res!235901) (not e!244814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407809 (= res!235901 (validMask!0 mask!1025))))

(assert (= (and start!38954 res!235902) b!407809))

(assert (= (and b!407809 res!235901) b!407805))

(assert (= (and b!407805 res!235903) b!407808))

(assert (= (and b!407808 res!235908) b!407797))

(assert (= (and b!407797 res!235900) b!407798))

(assert (= (and b!407798 res!235905) b!407802))

(assert (= (and b!407802 res!235899) b!407803))

(assert (= (and b!407803 res!235906) b!407800))

(assert (= (and b!407800 res!235904) b!407799))

(assert (= (and b!407799 res!235907) b!407806))

(assert (= (and b!407801 condMapEmpty!17202) mapIsEmpty!17202))

(assert (= (and b!407801 (not condMapEmpty!17202)) mapNonEmpty!17202))

(get-info :version)

(assert (= (and mapNonEmpty!17202 ((_ is ValueCellFull!4850) mapValue!17202)) b!407804))

(assert (= (and b!407801 ((_ is ValueCellFull!4850) mapDefault!17202)) b!407807))

(assert (= start!38954 b!407801))

(declare-fun m!398787 () Bool)

(assert (=> b!407808 m!398787))

(declare-fun m!398789 () Bool)

(assert (=> b!407800 m!398789))

(declare-fun m!398791 () Bool)

(assert (=> b!407802 m!398791))

(declare-fun m!398793 () Bool)

(assert (=> b!407797 m!398793))

(declare-fun m!398795 () Bool)

(assert (=> b!407806 m!398795))

(declare-fun m!398797 () Bool)

(assert (=> b!407803 m!398797))

(declare-fun m!398799 () Bool)

(assert (=> b!407799 m!398799))

(declare-fun m!398801 () Bool)

(assert (=> b!407799 m!398801))

(declare-fun m!398803 () Bool)

(assert (=> start!38954 m!398803))

(declare-fun m!398805 () Bool)

(assert (=> start!38954 m!398805))

(declare-fun m!398807 () Bool)

(assert (=> b!407809 m!398807))

(declare-fun m!398809 () Bool)

(assert (=> mapNonEmpty!17202 m!398809))

(check-sat (not b!407799) (not b!407808) (not b!407802) (not b!407809) (not start!38954) (not mapNonEmpty!17202) (not b!407800) (not b!407797) tp_is_empty!10387 (not b!407806))
(check-sat)
