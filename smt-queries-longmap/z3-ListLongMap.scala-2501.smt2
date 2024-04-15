; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38810 () Bool)

(assert start!38810)

(declare-fun b!404989 () Bool)

(declare-fun e!243521 () Bool)

(assert (=> b!404989 (= e!243521 false)))

(declare-fun lt!188074 () Bool)

(declare-datatypes ((array!24361 0))(
  ( (array!24362 (arr!11630 (Array (_ BitVec 32) (_ BitVec 64))) (size!11983 (_ BitVec 32))) )
))
(declare-fun lt!188075 () array!24361)

(declare-datatypes ((List!6740 0))(
  ( (Nil!6737) (Cons!6736 (h!7592 (_ BitVec 64)) (t!11905 List!6740)) )
))
(declare-fun arrayNoDuplicates!0 (array!24361 (_ BitVec 32) List!6740) Bool)

(assert (=> b!404989 (= lt!188074 (arrayNoDuplicates!0 lt!188075 #b00000000000000000000000000000000 Nil!6737))))

(declare-fun b!404990 () Bool)

(declare-fun res!233740 () Bool)

(declare-fun e!243518 () Bool)

(assert (=> b!404990 (=> (not res!233740) (not e!243518))))

(declare-fun _keys!709 () array!24361)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404990 (= res!233740 (or (= (select (arr!11630 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11630 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16986 () Bool)

(declare-fun mapRes!16986 () Bool)

(declare-fun tp!33105 () Bool)

(declare-fun e!243522 () Bool)

(assert (=> mapNonEmpty!16986 (= mapRes!16986 (and tp!33105 e!243522))))

(declare-datatypes ((V!14763 0))(
  ( (V!14764 (val!5166 Int)) )
))
(declare-datatypes ((ValueCell!4778 0))(
  ( (ValueCellFull!4778 (v!7407 V!14763)) (EmptyCell!4778) )
))
(declare-datatypes ((array!24363 0))(
  ( (array!24364 (arr!11631 (Array (_ BitVec 32) ValueCell!4778)) (size!11984 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24363)

(declare-fun mapRest!16986 () (Array (_ BitVec 32) ValueCell!4778))

(declare-fun mapValue!16986 () ValueCell!4778)

(declare-fun mapKey!16986 () (_ BitVec 32))

(assert (=> mapNonEmpty!16986 (= (arr!11631 _values!549) (store mapRest!16986 mapKey!16986 mapValue!16986))))

(declare-fun b!404991 () Bool)

(declare-fun res!233748 () Bool)

(assert (=> b!404991 (=> (not res!233748) (not e!243518))))

(assert (=> b!404991 (= res!233748 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11983 _keys!709))))))

(declare-fun mapIsEmpty!16986 () Bool)

(assert (=> mapIsEmpty!16986 mapRes!16986))

(declare-fun b!404992 () Bool)

(declare-fun res!233742 () Bool)

(assert (=> b!404992 (=> (not res!233742) (not e!243518))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24361 (_ BitVec 32)) Bool)

(assert (=> b!404992 (= res!233742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404993 () Bool)

(declare-fun res!233743 () Bool)

(assert (=> b!404993 (=> (not res!233743) (not e!243518))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404993 (= res!233743 (validKeyInArray!0 k0!794))))

(declare-fun b!404994 () Bool)

(declare-fun res!233741 () Bool)

(assert (=> b!404994 (=> (not res!233741) (not e!243518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404994 (= res!233741 (validMask!0 mask!1025))))

(declare-fun b!404995 () Bool)

(declare-fun res!233746 () Bool)

(assert (=> b!404995 (=> (not res!233746) (not e!243518))))

(declare-fun arrayContainsKey!0 (array!24361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404995 (= res!233746 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!233747 () Bool)

(assert (=> start!38810 (=> (not res!233747) (not e!243518))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38810 (= res!233747 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11983 _keys!709))))))

(assert (=> start!38810 e!243518))

(assert (=> start!38810 true))

(declare-fun e!243519 () Bool)

(declare-fun array_inv!8534 (array!24363) Bool)

(assert (=> start!38810 (and (array_inv!8534 _values!549) e!243519)))

(declare-fun array_inv!8535 (array!24361) Bool)

(assert (=> start!38810 (array_inv!8535 _keys!709)))

(declare-fun b!404996 () Bool)

(declare-fun res!233745 () Bool)

(assert (=> b!404996 (=> (not res!233745) (not e!243518))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404996 (= res!233745 (and (= (size!11984 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11983 _keys!709) (size!11984 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404997 () Bool)

(declare-fun e!243517 () Bool)

(declare-fun tp_is_empty!10243 () Bool)

(assert (=> b!404997 (= e!243517 tp_is_empty!10243)))

(declare-fun b!404998 () Bool)

(declare-fun res!233744 () Bool)

(assert (=> b!404998 (=> (not res!233744) (not e!243518))))

(assert (=> b!404998 (= res!233744 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6737))))

(declare-fun b!404999 () Bool)

(assert (=> b!404999 (= e!243519 (and e!243517 mapRes!16986))))

(declare-fun condMapEmpty!16986 () Bool)

(declare-fun mapDefault!16986 () ValueCell!4778)

(assert (=> b!404999 (= condMapEmpty!16986 (= (arr!11631 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4778)) mapDefault!16986)))))

(declare-fun b!405000 () Bool)

(assert (=> b!405000 (= e!243518 e!243521)))

(declare-fun res!233739 () Bool)

(assert (=> b!405000 (=> (not res!233739) (not e!243521))))

(assert (=> b!405000 (= res!233739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188075 mask!1025))))

(assert (=> b!405000 (= lt!188075 (array!24362 (store (arr!11630 _keys!709) i!563 k0!794) (size!11983 _keys!709)))))

(declare-fun b!405001 () Bool)

(assert (=> b!405001 (= e!243522 tp_is_empty!10243)))

(assert (= (and start!38810 res!233747) b!404994))

(assert (= (and b!404994 res!233741) b!404996))

(assert (= (and b!404996 res!233745) b!404992))

(assert (= (and b!404992 res!233742) b!404998))

(assert (= (and b!404998 res!233744) b!404991))

(assert (= (and b!404991 res!233748) b!404993))

(assert (= (and b!404993 res!233743) b!404990))

(assert (= (and b!404990 res!233740) b!404995))

(assert (= (and b!404995 res!233746) b!405000))

(assert (= (and b!405000 res!233739) b!404989))

(assert (= (and b!404999 condMapEmpty!16986) mapIsEmpty!16986))

(assert (= (and b!404999 (not condMapEmpty!16986)) mapNonEmpty!16986))

(get-info :version)

(assert (= (and mapNonEmpty!16986 ((_ is ValueCellFull!4778) mapValue!16986)) b!405001))

(assert (= (and b!404999 ((_ is ValueCellFull!4778) mapDefault!16986)) b!404997))

(assert (= start!38810 b!404999))

(declare-fun m!397059 () Bool)

(assert (=> b!404990 m!397059))

(declare-fun m!397061 () Bool)

(assert (=> b!404992 m!397061))

(declare-fun m!397063 () Bool)

(assert (=> mapNonEmpty!16986 m!397063))

(declare-fun m!397065 () Bool)

(assert (=> b!404998 m!397065))

(declare-fun m!397067 () Bool)

(assert (=> b!404989 m!397067))

(declare-fun m!397069 () Bool)

(assert (=> b!405000 m!397069))

(declare-fun m!397071 () Bool)

(assert (=> b!405000 m!397071))

(declare-fun m!397073 () Bool)

(assert (=> b!404994 m!397073))

(declare-fun m!397075 () Bool)

(assert (=> start!38810 m!397075))

(declare-fun m!397077 () Bool)

(assert (=> start!38810 m!397077))

(declare-fun m!397079 () Bool)

(assert (=> b!404995 m!397079))

(declare-fun m!397081 () Bool)

(assert (=> b!404993 m!397081))

(check-sat (not mapNonEmpty!16986) tp_is_empty!10243 (not b!404992) (not b!405000) (not b!404995) (not b!404993) (not b!404994) (not b!404998) (not b!404989) (not start!38810))
(check-sat)
