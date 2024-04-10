; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38832 () Bool)

(assert start!38832)

(declare-fun b!405416 () Bool)

(declare-fun res!233996 () Bool)

(declare-fun e!243764 () Bool)

(assert (=> b!405416 (=> (not res!233996) (not e!243764))))

(declare-datatypes ((array!24393 0))(
  ( (array!24394 (arr!11646 (Array (_ BitVec 32) (_ BitVec 64))) (size!11998 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24393)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24393 (_ BitVec 32)) Bool)

(assert (=> b!405416 (= res!233996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405417 () Bool)

(declare-fun e!243763 () Bool)

(assert (=> b!405417 (= e!243764 e!243763)))

(declare-fun res!233990 () Bool)

(assert (=> b!405417 (=> (not res!233990) (not e!243763))))

(declare-fun lt!188332 () array!24393)

(assert (=> b!405417 (= res!233990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188332 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405417 (= lt!188332 (array!24394 (store (arr!11646 _keys!709) i!563 k0!794) (size!11998 _keys!709)))))

(declare-fun b!405418 () Bool)

(declare-fun res!233992 () Bool)

(assert (=> b!405418 (=> (not res!233992) (not e!243764))))

(assert (=> b!405418 (= res!233992 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11998 _keys!709))))))

(declare-fun mapIsEmpty!16998 () Bool)

(declare-fun mapRes!16998 () Bool)

(assert (=> mapIsEmpty!16998 mapRes!16998))

(declare-fun b!405419 () Bool)

(declare-fun res!233988 () Bool)

(assert (=> b!405419 (=> (not res!233988) (not e!243764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405419 (= res!233988 (validKeyInArray!0 k0!794))))

(declare-fun res!233995 () Bool)

(assert (=> start!38832 (=> (not res!233995) (not e!243764))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38832 (= res!233995 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11998 _keys!709))))))

(assert (=> start!38832 e!243764))

(assert (=> start!38832 true))

(declare-datatypes ((V!14773 0))(
  ( (V!14774 (val!5170 Int)) )
))
(declare-datatypes ((ValueCell!4782 0))(
  ( (ValueCellFull!4782 (v!7417 V!14773)) (EmptyCell!4782) )
))
(declare-datatypes ((array!24395 0))(
  ( (array!24396 (arr!11647 (Array (_ BitVec 32) ValueCell!4782)) (size!11999 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24395)

(declare-fun e!243768 () Bool)

(declare-fun array_inv!8510 (array!24395) Bool)

(assert (=> start!38832 (and (array_inv!8510 _values!549) e!243768)))

(declare-fun array_inv!8511 (array!24393) Bool)

(assert (=> start!38832 (array_inv!8511 _keys!709)))

(declare-fun b!405420 () Bool)

(declare-fun res!233997 () Bool)

(assert (=> b!405420 (=> (not res!233997) (not e!243764))))

(declare-fun arrayContainsKey!0 (array!24393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405420 (= res!233997 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405421 () Bool)

(declare-fun e!243765 () Bool)

(assert (=> b!405421 (= e!243768 (and e!243765 mapRes!16998))))

(declare-fun condMapEmpty!16998 () Bool)

(declare-fun mapDefault!16998 () ValueCell!4782)

(assert (=> b!405421 (= condMapEmpty!16998 (= (arr!11647 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4782)) mapDefault!16998)))))

(declare-fun b!405422 () Bool)

(declare-fun tp_is_empty!10251 () Bool)

(assert (=> b!405422 (= e!243765 tp_is_empty!10251)))

(declare-fun b!405423 () Bool)

(declare-fun res!233989 () Bool)

(assert (=> b!405423 (=> (not res!233989) (not e!243764))))

(declare-datatypes ((List!6772 0))(
  ( (Nil!6769) (Cons!6768 (h!7624 (_ BitVec 64)) (t!11946 List!6772)) )
))
(declare-fun arrayNoDuplicates!0 (array!24393 (_ BitVec 32) List!6772) Bool)

(assert (=> b!405423 (= res!233989 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6769))))

(declare-fun mapNonEmpty!16998 () Bool)

(declare-fun tp!33117 () Bool)

(declare-fun e!243767 () Bool)

(assert (=> mapNonEmpty!16998 (= mapRes!16998 (and tp!33117 e!243767))))

(declare-fun mapValue!16998 () ValueCell!4782)

(declare-fun mapRest!16998 () (Array (_ BitVec 32) ValueCell!4782))

(declare-fun mapKey!16998 () (_ BitVec 32))

(assert (=> mapNonEmpty!16998 (= (arr!11647 _values!549) (store mapRest!16998 mapKey!16998 mapValue!16998))))

(declare-fun b!405424 () Bool)

(declare-fun res!233993 () Bool)

(assert (=> b!405424 (=> (not res!233993) (not e!243764))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405424 (= res!233993 (and (= (size!11999 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11998 _keys!709) (size!11999 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405425 () Bool)

(declare-fun res!233991 () Bool)

(assert (=> b!405425 (=> (not res!233991) (not e!243764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405425 (= res!233991 (validMask!0 mask!1025))))

(declare-fun b!405426 () Bool)

(declare-fun res!233994 () Bool)

(assert (=> b!405426 (=> (not res!233994) (not e!243764))))

(assert (=> b!405426 (= res!233994 (or (= (select (arr!11646 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11646 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405427 () Bool)

(assert (=> b!405427 (= e!243763 false)))

(declare-fun lt!188333 () Bool)

(assert (=> b!405427 (= lt!188333 (arrayNoDuplicates!0 lt!188332 #b00000000000000000000000000000000 Nil!6769))))

(declare-fun b!405428 () Bool)

(assert (=> b!405428 (= e!243767 tp_is_empty!10251)))

(assert (= (and start!38832 res!233995) b!405425))

(assert (= (and b!405425 res!233991) b!405424))

(assert (= (and b!405424 res!233993) b!405416))

(assert (= (and b!405416 res!233996) b!405423))

(assert (= (and b!405423 res!233989) b!405418))

(assert (= (and b!405418 res!233992) b!405419))

(assert (= (and b!405419 res!233988) b!405426))

(assert (= (and b!405426 res!233994) b!405420))

(assert (= (and b!405420 res!233997) b!405417))

(assert (= (and b!405417 res!233990) b!405427))

(assert (= (and b!405421 condMapEmpty!16998) mapIsEmpty!16998))

(assert (= (and b!405421 (not condMapEmpty!16998)) mapNonEmpty!16998))

(get-info :version)

(assert (= (and mapNonEmpty!16998 ((_ is ValueCellFull!4782) mapValue!16998)) b!405428))

(assert (= (and b!405421 ((_ is ValueCellFull!4782) mapDefault!16998)) b!405422))

(assert (= start!38832 b!405421))

(declare-fun m!397879 () Bool)

(assert (=> b!405420 m!397879))

(declare-fun m!397881 () Bool)

(assert (=> b!405423 m!397881))

(declare-fun m!397883 () Bool)

(assert (=> mapNonEmpty!16998 m!397883))

(declare-fun m!397885 () Bool)

(assert (=> b!405419 m!397885))

(declare-fun m!397887 () Bool)

(assert (=> b!405426 m!397887))

(declare-fun m!397889 () Bool)

(assert (=> b!405417 m!397889))

(declare-fun m!397891 () Bool)

(assert (=> b!405417 m!397891))

(declare-fun m!397893 () Bool)

(assert (=> start!38832 m!397893))

(declare-fun m!397895 () Bool)

(assert (=> start!38832 m!397895))

(declare-fun m!397897 () Bool)

(assert (=> b!405427 m!397897))

(declare-fun m!397899 () Bool)

(assert (=> b!405425 m!397899))

(declare-fun m!397901 () Bool)

(assert (=> b!405416 m!397901))

(check-sat (not b!405416) tp_is_empty!10251 (not b!405427) (not start!38832) (not b!405419) (not b!405423) (not b!405425) (not b!405417) (not mapNonEmpty!16998) (not b!405420))
(check-sat)
