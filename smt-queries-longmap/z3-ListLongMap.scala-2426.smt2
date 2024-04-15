; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38300 () Bool)

(assert start!38300)

(declare-fun b!394866 () Bool)

(declare-fun e!239068 () Bool)

(declare-fun e!239071 () Bool)

(declare-fun mapRes!16299 () Bool)

(assert (=> b!394866 (= e!239068 (and e!239071 mapRes!16299))))

(declare-fun condMapEmpty!16299 () Bool)

(declare-datatypes ((V!14163 0))(
  ( (V!14164 (val!4941 Int)) )
))
(declare-datatypes ((ValueCell!4553 0))(
  ( (ValueCellFull!4553 (v!7181 V!14163)) (EmptyCell!4553) )
))
(declare-datatypes ((array!23481 0))(
  ( (array!23482 (arr!11194 (Array (_ BitVec 32) ValueCell!4553)) (size!11547 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23481)

(declare-fun mapDefault!16299 () ValueCell!4553)

(assert (=> b!394866 (= condMapEmpty!16299 (= (arr!11194 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4553)) mapDefault!16299)))))

(declare-fun b!394867 () Bool)

(declare-fun e!239070 () Bool)

(declare-datatypes ((array!23483 0))(
  ( (array!23484 (arr!11195 (Array (_ BitVec 32) (_ BitVec 64))) (size!11548 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23483)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!394867 (= e!239070 (and (or (= (select (arr!11195 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11195 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!11548 _keys!709))))))

(declare-fun b!394868 () Bool)

(declare-fun res!226379 () Bool)

(assert (=> b!394868 (=> (not res!226379) (not e!239070))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23483 (_ BitVec 32)) Bool)

(assert (=> b!394868 (= res!226379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394869 () Bool)

(declare-fun res!226375 () Bool)

(assert (=> b!394869 (=> (not res!226375) (not e!239070))))

(assert (=> b!394869 (= res!226375 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11548 _keys!709))))))

(declare-fun mapNonEmpty!16299 () Bool)

(declare-fun tp!32094 () Bool)

(declare-fun e!239067 () Bool)

(assert (=> mapNonEmpty!16299 (= mapRes!16299 (and tp!32094 e!239067))))

(declare-fun mapKey!16299 () (_ BitVec 32))

(declare-fun mapValue!16299 () ValueCell!4553)

(declare-fun mapRest!16299 () (Array (_ BitVec 32) ValueCell!4553))

(assert (=> mapNonEmpty!16299 (= (arr!11194 _values!549) (store mapRest!16299 mapKey!16299 mapValue!16299))))

(declare-fun res!226378 () Bool)

(assert (=> start!38300 (=> (not res!226378) (not e!239070))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38300 (= res!226378 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11548 _keys!709))))))

(assert (=> start!38300 e!239070))

(assert (=> start!38300 true))

(declare-fun array_inv!8216 (array!23481) Bool)

(assert (=> start!38300 (and (array_inv!8216 _values!549) e!239068)))

(declare-fun array_inv!8217 (array!23483) Bool)

(assert (=> start!38300 (array_inv!8217 _keys!709)))

(declare-fun b!394870 () Bool)

(declare-fun tp_is_empty!9793 () Bool)

(assert (=> b!394870 (= e!239067 tp_is_empty!9793)))

(declare-fun b!394871 () Bool)

(declare-fun res!226380 () Bool)

(assert (=> b!394871 (=> (not res!226380) (not e!239070))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!394871 (= res!226380 (and (= (size!11547 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11548 _keys!709) (size!11547 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394872 () Bool)

(declare-fun res!226381 () Bool)

(assert (=> b!394872 (=> (not res!226381) (not e!239070))))

(declare-datatypes ((List!6461 0))(
  ( (Nil!6458) (Cons!6457 (h!7313 (_ BitVec 64)) (t!11626 List!6461)) )
))
(declare-fun arrayNoDuplicates!0 (array!23483 (_ BitVec 32) List!6461) Bool)

(assert (=> b!394872 (= res!226381 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6458))))

(declare-fun b!394873 () Bool)

(declare-fun res!226376 () Bool)

(assert (=> b!394873 (=> (not res!226376) (not e!239070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394873 (= res!226376 (validMask!0 mask!1025))))

(declare-fun b!394874 () Bool)

(assert (=> b!394874 (= e!239071 tp_is_empty!9793)))

(declare-fun mapIsEmpty!16299 () Bool)

(assert (=> mapIsEmpty!16299 mapRes!16299))

(declare-fun b!394875 () Bool)

(declare-fun res!226377 () Bool)

(assert (=> b!394875 (=> (not res!226377) (not e!239070))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394875 (= res!226377 (validKeyInArray!0 k0!794))))

(assert (= (and start!38300 res!226378) b!394873))

(assert (= (and b!394873 res!226376) b!394871))

(assert (= (and b!394871 res!226380) b!394868))

(assert (= (and b!394868 res!226379) b!394872))

(assert (= (and b!394872 res!226381) b!394869))

(assert (= (and b!394869 res!226375) b!394875))

(assert (= (and b!394875 res!226377) b!394867))

(assert (= (and b!394866 condMapEmpty!16299) mapIsEmpty!16299))

(assert (= (and b!394866 (not condMapEmpty!16299)) mapNonEmpty!16299))

(get-info :version)

(assert (= (and mapNonEmpty!16299 ((_ is ValueCellFull!4553) mapValue!16299)) b!394870))

(assert (= (and b!394866 ((_ is ValueCellFull!4553) mapDefault!16299)) b!394874))

(assert (= start!38300 b!394866))

(declare-fun m!390603 () Bool)

(assert (=> b!394867 m!390603))

(declare-fun m!390605 () Bool)

(assert (=> b!394868 m!390605))

(declare-fun m!390607 () Bool)

(assert (=> start!38300 m!390607))

(declare-fun m!390609 () Bool)

(assert (=> start!38300 m!390609))

(declare-fun m!390611 () Bool)

(assert (=> b!394872 m!390611))

(declare-fun m!390613 () Bool)

(assert (=> b!394875 m!390613))

(declare-fun m!390615 () Bool)

(assert (=> mapNonEmpty!16299 m!390615))

(declare-fun m!390617 () Bool)

(assert (=> b!394873 m!390617))

(check-sat tp_is_empty!9793 (not b!394872) (not b!394873) (not b!394868) (not b!394875) (not start!38300) (not mapNonEmpty!16299))
(check-sat)
