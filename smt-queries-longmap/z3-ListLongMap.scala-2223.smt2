; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36786 () Bool)

(assert start!36786)

(declare-fun b!367567 () Bool)

(declare-fun res!205849 () Bool)

(declare-fun e!224921 () Bool)

(assert (=> b!367567 (=> (not res!205849) (not e!224921))))

(declare-datatypes ((array!21092 0))(
  ( (array!21093 (arr!10014 (Array (_ BitVec 32) (_ BitVec 64))) (size!10366 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21092)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367567 (= res!205849 (or (= (select (arr!10014 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10014 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!205853 () Bool)

(assert (=> start!36786 (=> (not res!205853) (not e!224921))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36786 (= res!205853 (validMask!0 mask!970))))

(assert (=> start!36786 e!224921))

(assert (=> start!36786 true))

(declare-datatypes ((V!12539 0))(
  ( (V!12540 (val!4332 Int)) )
))
(declare-datatypes ((ValueCell!3944 0))(
  ( (ValueCellFull!3944 (v!6530 V!12539)) (EmptyCell!3944) )
))
(declare-datatypes ((array!21094 0))(
  ( (array!21095 (arr!10015 (Array (_ BitVec 32) ValueCell!3944)) (size!10367 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21094)

(declare-fun e!224925 () Bool)

(declare-fun array_inv!7438 (array!21094) Bool)

(assert (=> start!36786 (and (array_inv!7438 _values!506) e!224925)))

(declare-fun array_inv!7439 (array!21092) Bool)

(assert (=> start!36786 (array_inv!7439 _keys!658)))

(declare-fun b!367568 () Bool)

(declare-fun res!205848 () Bool)

(assert (=> b!367568 (=> (not res!205848) (not e!224921))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367568 (= res!205848 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367569 () Bool)

(declare-fun e!224924 () Bool)

(declare-fun tp_is_empty!8575 () Bool)

(assert (=> b!367569 (= e!224924 tp_is_empty!8575)))

(declare-fun b!367570 () Bool)

(declare-fun res!205854 () Bool)

(assert (=> b!367570 (=> (not res!205854) (not e!224921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21092 (_ BitVec 32)) Bool)

(assert (=> b!367570 (= res!205854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367571 () Bool)

(declare-fun res!205855 () Bool)

(declare-fun e!224922 () Bool)

(assert (=> b!367571 (=> (not res!205855) (not e!224922))))

(declare-fun lt!169429 () array!21092)

(declare-datatypes ((List!5478 0))(
  ( (Nil!5475) (Cons!5474 (h!6330 (_ BitVec 64)) (t!10620 List!5478)) )
))
(declare-fun arrayNoDuplicates!0 (array!21092 (_ BitVec 32) List!5478) Bool)

(assert (=> b!367571 (= res!205855 (arrayNoDuplicates!0 lt!169429 #b00000000000000000000000000000000 Nil!5475))))

(declare-fun b!367572 () Bool)

(assert (=> b!367572 (= e!224921 e!224922)))

(declare-fun res!205847 () Bool)

(assert (=> b!367572 (=> (not res!205847) (not e!224922))))

(assert (=> b!367572 (= res!205847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169429 mask!970))))

(assert (=> b!367572 (= lt!169429 (array!21093 (store (arr!10014 _keys!658) i!548 k0!778) (size!10366 _keys!658)))))

(declare-fun b!367573 () Bool)

(assert (=> b!367573 (= e!224922 (bvsgt #b00000000000000000000000000000000 (size!10366 _keys!658)))))

(declare-fun b!367574 () Bool)

(declare-fun res!205850 () Bool)

(assert (=> b!367574 (=> (not res!205850) (not e!224921))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367574 (= res!205850 (and (= (size!10367 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10366 _keys!658) (size!10367 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14427 () Bool)

(declare-fun mapRes!14427 () Bool)

(assert (=> mapIsEmpty!14427 mapRes!14427))

(declare-fun b!367575 () Bool)

(declare-fun res!205851 () Bool)

(assert (=> b!367575 (=> (not res!205851) (not e!224921))))

(assert (=> b!367575 (= res!205851 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10366 _keys!658))))))

(declare-fun b!367576 () Bool)

(declare-fun e!224920 () Bool)

(assert (=> b!367576 (= e!224925 (and e!224920 mapRes!14427))))

(declare-fun condMapEmpty!14427 () Bool)

(declare-fun mapDefault!14427 () ValueCell!3944)

(assert (=> b!367576 (= condMapEmpty!14427 (= (arr!10015 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3944)) mapDefault!14427)))))

(declare-fun b!367577 () Bool)

(declare-fun res!205856 () Bool)

(assert (=> b!367577 (=> (not res!205856) (not e!224921))))

(assert (=> b!367577 (= res!205856 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5475))))

(declare-fun b!367578 () Bool)

(assert (=> b!367578 (= e!224920 tp_is_empty!8575)))

(declare-fun b!367579 () Bool)

(declare-fun res!205852 () Bool)

(assert (=> b!367579 (=> (not res!205852) (not e!224921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367579 (= res!205852 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14427 () Bool)

(declare-fun tp!28503 () Bool)

(assert (=> mapNonEmpty!14427 (= mapRes!14427 (and tp!28503 e!224924))))

(declare-fun mapValue!14427 () ValueCell!3944)

(declare-fun mapKey!14427 () (_ BitVec 32))

(declare-fun mapRest!14427 () (Array (_ BitVec 32) ValueCell!3944))

(assert (=> mapNonEmpty!14427 (= (arr!10015 _values!506) (store mapRest!14427 mapKey!14427 mapValue!14427))))

(assert (= (and start!36786 res!205853) b!367574))

(assert (= (and b!367574 res!205850) b!367570))

(assert (= (and b!367570 res!205854) b!367577))

(assert (= (and b!367577 res!205856) b!367575))

(assert (= (and b!367575 res!205851) b!367579))

(assert (= (and b!367579 res!205852) b!367567))

(assert (= (and b!367567 res!205849) b!367568))

(assert (= (and b!367568 res!205848) b!367572))

(assert (= (and b!367572 res!205847) b!367571))

(assert (= (and b!367571 res!205855) b!367573))

(assert (= (and b!367576 condMapEmpty!14427) mapIsEmpty!14427))

(assert (= (and b!367576 (not condMapEmpty!14427)) mapNonEmpty!14427))

(get-info :version)

(assert (= (and mapNonEmpty!14427 ((_ is ValueCellFull!3944) mapValue!14427)) b!367569))

(assert (= (and b!367576 ((_ is ValueCellFull!3944) mapDefault!14427)) b!367578))

(assert (= start!36786 b!367576))

(declare-fun m!364769 () Bool)

(assert (=> b!367572 m!364769))

(declare-fun m!364771 () Bool)

(assert (=> b!367572 m!364771))

(declare-fun m!364773 () Bool)

(assert (=> mapNonEmpty!14427 m!364773))

(declare-fun m!364775 () Bool)

(assert (=> start!36786 m!364775))

(declare-fun m!364777 () Bool)

(assert (=> start!36786 m!364777))

(declare-fun m!364779 () Bool)

(assert (=> start!36786 m!364779))

(declare-fun m!364781 () Bool)

(assert (=> b!367579 m!364781))

(declare-fun m!364783 () Bool)

(assert (=> b!367570 m!364783))

(declare-fun m!364785 () Bool)

(assert (=> b!367577 m!364785))

(declare-fun m!364787 () Bool)

(assert (=> b!367571 m!364787))

(declare-fun m!364789 () Bool)

(assert (=> b!367567 m!364789))

(declare-fun m!364791 () Bool)

(assert (=> b!367568 m!364791))

(check-sat (not b!367572) (not b!367577) (not mapNonEmpty!14427) (not b!367571) (not start!36786) (not b!367568) (not b!367579) (not b!367570) tp_is_empty!8575)
(check-sat)
